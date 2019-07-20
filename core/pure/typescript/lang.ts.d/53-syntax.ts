/*
    The Language
    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*/

// {{{ 相對獨立的部分。simple printer
function simple_print(x: LangVal): string {
    // [[[ 大量重複代碼 simple_print <-> complex_print
    x = un_just_all(x)
    let temp = ""
    let prefix = ""
    if (null_p(x)) {
        return "()"
    } else if (construction_p(x)) {
        temp = "("
        prefix = ""
        while (construction_p(x)) {
            temp += prefix + simple_print(construction_head(x))
            prefix = " "
            x = un_just_all(construction_tail(x))
        }
        if (null_p(x)) {
            temp += ")"
        } else {
            temp += " . " + simple_print(x) + ")"
        }
        return temp
    } else if (data_p(x)) {
        return "#" + simple_print(new_construction(data_name(x), data_list(x)))
    } else if (error_p(x)) {
        return "!" + simple_print(new_construction(error_name(x), error_list(x)))
    } else if (atom_p(x)) {
        return un_atom(x)
    } else if (comment_p(x)) {
        return ";(" + simple_print(comment_comment(x)) + " " + simple_print(comment_x(x)) + ")"
    } else if (delay_evaluate_p(x)) {
        return "$(" + simple_print(env2val(delay_evaluate_env(x))) + " " + simple_print(delay_evaluate_x(x)) + ")"
    } else if (delay_builtin_func_p(x)) {
        return "%(" + simple_print(delay_builtin_func_f(x)) + " " + simple_print(jsArray_to_list(delay_builtin_func_xs(x))) + ")"
    } else if (delay_builtin_form_p(x)) {
        return "@(" +
            simple_print(env2val(delay_builtin_form_env(x))) +
            " " + simple_print(delay_builtin_form_f(x)) +
            " " + simple_print(jsArray_to_list(delay_builtin_form_xs(x))) +
            ")"
    } else if (delay_apply_p(x)) {
        return "^(" + simple_print(delay_apply_f(x)) + " " + simple_print(jsArray_to_list(delay_apply_xs(x))) + ")"
    }
    return LANG_ERROR() // 大量重複代碼 simple_print <-> complex_print ]]]
}
export { simple_print }

// 相對獨立的部分。simple printer }}}

// {{{ 相對獨立的部分。complex parser/complex printer
function complex_parse(x: string): LangVal {
    const state_const: string = x // TODO 修復UTF8處理（現在只支持UTF16中的字符）（typescript-to-lua只正確支持ASCII）
    let state = 0
    function eof() {
        return state_const.length === state
    }
    function get(): string {
        LANG_ASSERT(!eof())
        const ret = state_const[state]
        state++
        return ret
    }
    function put(chr: string) {
        LANG_ASSERT(state_const[state - 1] === chr)
        state--
    }
    function parse_error(x: string = ""): never {
        throw "TheLanguage parse ERROR!" + x
    }
    function a_space_p(chr: string): boolean {
        return chr === " " || chr === "\n" || chr === "\t" || chr === "\r"
    }
    function space() {
        if (eof()) {
            return false
        }
        let x: string = get()
        if (!a_space_p(x)) {
            put(x)
            return false
        }
        while (a_space_p(x) && !eof()) {
            x = get()
        }
        if (!a_space_p(x)) {
            put(x)
        }
        return true
    }
    function atom() {
        if (eof()) {
            return false
        }
        let x = get()
        let ret: string = ""
        if (!a_atom_p(x)) {
            put(x)
            return false
        }
        while (a_atom_p(x) && !eof()) {
            ret += x
            x = get()
        }
        if (a_atom_p(x)) {
            ret += x
        } else {
            put(x)
        }
        return new_atom(ret)
    }
    function readlist() {
        if (eof()) {
            return false
        }
        let x = get()
        if (x !== "(") {
            put(x)
            return false
        }
        let ret_last: LangValHole = new_hole_do()
        const ret: LangVal = ret_last
        function last_add_do(val: LangVal) {
            const ret_last2: LangValHole = new_hole_do()
            hole_set_do(ret_last, new_construction(val, ret_last2))
            ret_last = ret_last2
        }
        while (true) {
            space()
            if (eof()) {
                return parse_error()
            }
            x = get()
            if (x === ")") {
                hole_set_do(ret_last, null_v)
                return ret
            }
            if (x === ".") {
                space()
                const e: LangVal = val()
                hole_set_do(ret_last, e)
                space()
                if (eof()) {
                    return parse_error()
                }
                x = get()
                if (x !== ")") {
                    return parse_error()
                }
                return ret
            }
            put(x)
            const e: LangVal = val()
            last_add_do(e)
        }
    }
    function data() {
        if (eof()) {
            return false
        }
        const x = get()
        if (x !== "#") {
            put(x)
            return false
        }
        const xs = readlist()
        if (xs === false) {
            return parse_error()
        }
        if (!construction_p(xs)) {
            return parse_error()
        }
        return new_data(construction_head(xs), construction_tail(xs))
    }
    function readerror() {
        if (eof()) {
            return false
        }
        const x = get()
        if (x !== "!") {
            put(x)
            return false
        }
        const xs = readlist()
        if (xs === false) {
            return parse_error()
        }
        if (!construction_p(xs)) {
            return parse_error()
        }
        return new_error(construction_head(xs), construction_tail(xs))
    }
    function make_read_two(prefix: string, k: (x: LangVal, y: LangVal) => LangVal): () => OrFalse<LangVal> {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = readlist()
            if (xs === false) {
                return parse_error()
            }
            if (!construction_p(xs)) {
                return parse_error()
            }
            const x = construction_tail(xs)
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return parse_error()
            }
            return k(construction_head(xs), construction_head(x))
        }
    }
    function make_read_three(prefix: string, k: (x: LangVal, y: LangVal, z: LangVal) => LangVal): () => OrFalse<LangVal> {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = readlist()
            if (xs === false) {
                return parse_error()
            }
            if (!construction_p(xs)) {
                return parse_error()
            }
            const x = construction_tail(xs)
            if (!construction_p(x)) {
                return parse_error()
            }
            const x_d = construction_tail(x)
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return parse_error()
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d))
        }
    }
    const readeval = make_read_two("$", (ev, val) => {
        const env = val2env(ev)
        if (env === false) {
            return parse_error()
        }
        return evaluate(env, val)
    })
    const readfuncapply = make_read_two("%", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (v) => v, (_1, _2) => parse_error())
        return builtin_func_apply(f, jsxs)
    })
    const readformbuiltin = make_read_three("@", (e, f, xs) => {
        const jsxs = list_to_jsArray(xs, (v) => v, (_1, _2) => parse_error())
        const env = val2env(e)
        if (env === false) {
            return parse_error()
        }
        return builtin_form_apply(env, f, jsxs)
    })
    const readapply = make_read_two("^", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (v) => v, (_1, _2) => parse_error())
        return apply(f, jsxs)
    })
    const readcomment = make_read_two(";", (comment, x) => new_comment(comment, x))
    function a_atom_p(chr: string): boolean {
        if (a_space_p(chr)) {
            return false
        }
        for (const v of ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&', ';'
        ]) {
            if (v === chr) {
                return false
            }
        }
        return true
    }
    function val(): LangVal {
        space()
        const fs: Array<() => OrFalse<LangVal>> = [readlist, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply, readcomment]
        for (const f of fs) {
            const x: OrFalse<LangVal> = f()
            if (x !== false) {
                return x
            }
        }
        return parse_error()
    }
    return val()
    function un_maybe<T>(vl: OrFalse<T>): T {
        if (vl === false) {
            return parse_error()
        }
        return vl
    }
    function not_eof() {
        return !eof()
    }
    function assert_get(c: string) {
        un_maybe(not_eof())
        un_maybe(get() === c)
    }
    function readsysname_no_pack_inner_must(strict: boolean = false): LangVal {
        function readsysname_no_pack_bracket() {
            assert_get('[')
            const x = readsysname_no_pack_inner_must()
            assert_get(']')
            return x
        }
        // 重複自val()
        let fs: Array<() => OrFalse<LangVal>>
        if (strict) {
            fs = [readlist, atom, readsysname_no_pack_bracket, data,
                readerror, readeval, readfuncapply, readformbuiltin, readapply, readcomment]
        } else {
            fs = [readlist, readsysname_no_pack, data,
                readerror, readeval, readfuncapply, readformbuiltin, readapply, readcomment]
        }
        for (const f of fs) {
            const x: OrFalse<LangVal> = f()
            if (x !== false) {
                return x
            }
        }
        return parse_error()
    }
    function may_xfx_xf(vl: LangVal): LangVal {
        if (eof()) {
            return vl
        }
        const head = get()
        if (head === '.') {
            const y = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_atom, new_list(function_atom, new_list(vl), something_atom), y)
        } else if (head === ':') {
            const y = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_atom, y, vl)
        } else if (head === '~') {
            return new_list(isOrNot_atom, vl)
        } else if (head === '@') {
            const y = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_atom, new_list(function_atom, new_construction(vl, something_atom), something_atom), y)
        } else if (head === '?') {
            return new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, vl))
        } else if (head === '/') {
            let ys: Array<LangVal> = [vl]
            while (true) {
                const y = readsysname_no_pack_inner_must(true)
                ys.push(y)
                if (eof()) {
                    break
                } const c0 = get()
                if (c0 !== '/') {
                    put(c0)
                    break
                }
            }
            return new_list(sub_atom, jsArray_to_list(ys))
        } else {
            put(head)
            return vl
        }
    }
    function readsysname_no_pack(): OrFalse<LangVal> {
        if (eof()) {
            return false
        }
        const head = get()
        if (head === '&') {
            un_maybe(not_eof())
            const c0 = get()
            if (c0 === '+') {
                const x = readsysname_no_pack_inner_must()
                return new_list(form_atom, new_list(system_atom, x))
            } else {
                put(c0)
            }
            const x = readsysname_no_pack_inner_must()
            return new_list(form_atom, x)
        } else if (head === ':') {
            un_maybe(not_eof())
            const c0 = get()
            if (c0 === '&') {
                assert_get('>')
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_atom,
                    new_list(form_atom,
                        new_list(function_atom, something_atom, x)),
                    theThing_atom)
            } else if (c0 === '>') {
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_atom,
                    new_list(function_atom, something_atom, x),
                    theThing_atom)
            } else {
                put(c0)
            }
            const x = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_atom, x, theThing_atom)
        } else if (head === '+') {
            const x = readsysname_no_pack_inner_must()
            return new_list(system_atom, x)
        } else if (head === '[') {
            const x = readsysname_no_pack_inner_must()
            assert_get(']')
            return may_xfx_xf(x)
        } else if (head === '_') {
            assert_get(':')
            const x = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_atom, x, something_atom)
        } else {
            put(head)
            const x = atom()
            if (x === false) {
                return false
            }
            return may_xfx_xf(x)
        }
    }
    function readsysname() {
        const x = readsysname_no_pack()
        if (x === false) {
            return false
        }
        if (atom_p(x)) {
            return x
        }
        return systemName_make(x)
    }
}
export { complex_parse }
function complex_print(val: LangVal): string {
    function print_sys_name(x: LangVal, is_inner_bool: boolean): string {
        // 是 complex_print(systemName_make(x))
        if (atom_p(x)) {
            return un_atom(x)
        }
        function inner_bracket(vl: string): string {
            if (is_inner_bool) {
                return '[' + vl + ']'
            } else {
                return vl
            }
        }
        const maybe_xs = maybe_list_to_jsArray(x)
        if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], typeAnnotation_atom)) {
            // new_list(typeAnnotation_atom, maybe_xs[1], maybe_xs[2])
            const maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1])
            if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], function_atom)) {
                const var_2_1 = maybe_lst_2[1]
                // new_list(typeAnnotation_atom, new_list(function_atom, var_2_1, maybe_lst_2[2]), maybe_xs[2])
                const maybe_lst_3 = maybe_list_to_jsArray(var_2_1)
                if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], something_atom)) {
                    // new_list(typeAnnotation_atom, new_list(function_atom, new_list(maybe_lst_3[0]), something_atom), maybe_xs[2])
                    return inner_bracket(print_sys_name(maybe_lst_3[0], true) + '.' + print_sys_name(maybe_xs[2], true))
                } else if (construction_p(var_2_1) && jsbool_no_force_equal_p(construction_tail(var_2_1), something_atom) && jsbool_no_force_equal_p(maybe_lst_2[2], something_atom)) {
                    // new_list(typeAnnotation_atom, new_list(function_atom, new_construction(construction_head(var_2_1), something_atom), something_atom), maybe_xs[2])
                    return inner_bracket(print_sys_name(construction_head(var_2_1), true) + '@' + print_sys_name(maybe_xs[2], true))
                } else if (jsbool_no_force_equal_p(var_2_1, something_atom) && jsbool_no_force_equal_p(maybe_xs[2], theThing_atom)) {
                    // new_list(typeAnnotation_atom, new_list(function_atom, something_atom, maybe_lst_2[2]), theThing_atom)
                    return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], true))
                }
            } const maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2])
            if (jsbool_no_force_equal_p(maybe_xs[1], function_atom) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isOrNot_atom)) {
                // new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, maybe_lst_44[1]))
                return inner_bracket(print_sys_name(maybe_lst_44[1], true) + '?')
            }
            if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], theThing_atom) && jsbool_no_force_equal_p(maybe_lst_2[0], form_atom)) {
                // new_list(typeAnnotation_atom, new_list(form_atom, var_2_1), theThing_atom)
                const maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1])
                if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], function_atom) && jsbool_no_force_equal_p(maybe_lst_88[1], something_atom)) {
                    // new_list(typeAnnotation_atom, new_list(form_atom, new_list(function_atom, something_atom, maybe_lst_88[2])), theThing_atom)
                    return inner_bracket(':&>' + print_sys_name(maybe_lst_88[2], true))
                }
            }
            let hd: string
            if (jsbool_no_force_equal_p(maybe_xs[2], something_atom)) {
                hd = '_'
            } else if (jsbool_no_force_equal_p(maybe_xs[2], theThing_atom)) {
                hd = ''
            } else {
                hd = print_sys_name(maybe_xs[2], true)
            }
            return inner_bracket(hd + ':' + print_sys_name(maybe_xs[1], true))
        } else if (maybe_xs !== false && maybe_xs.length === 2) {
            if (jsbool_no_force_equal_p(maybe_xs[0], form_atom)) {
                // new_list(form_atom, maybe_xs[1])
                const maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1])
                if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], system_atom)) {
                    // new_list(form_atom, new_list(system_atom, maybe_lst_288[1]))
                    return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], true))
                }
                return inner_bracket('&' + print_sys_name(maybe_xs[1], true))
            } else if (jsbool_no_force_equal_p(maybe_xs[0], isOrNot_atom)) {
                // new_list(isOrNot_atom, maybe_xs[1])
                return inner_bracket(print_sys_name(maybe_xs[1], true) + '~')
            } else if (jsbool_no_force_equal_p(maybe_xs[0], system_atom)) {
                // new_list(system_atom, maybe_xs[1])
                return inner_bracket('+' + print_sys_name(maybe_xs[1], true))
            } else if (jsbool_no_force_equal_p(maybe_xs[0], sub_atom)) {
                // new_list(sub_atom, maybe_xs[1])
                const maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[1])
                if (maybe_lst_8934 !== false && maybe_lst_8934.length > 1) {
                    let tmp = print_sys_name(maybe_lst_8934[0], true)
                    for (let i = 1; i < maybe_lst_8934.length; i++) {
                        tmp += '/' + print_sys_name(maybe_lst_8934[i], true)
                    }
                    return inner_bracket(tmp)
                }
            }
        }
        if (is_inner_bool) {
            return simple_print(x)
        } else {
            return simple_print(systemName_make(x))
        }
    }
    // [[[ 大量重複代碼 simple_print <-> complex_print
    let x = complex_parse(simple_print(val)) // 去除所有just
    let temp = ""
    let prefix = ""
    if (null_p(x)) {
        return "()"
    } else if (construction_p(x)) {
        temp = "("
        prefix = ""
        while (construction_p(x)) {
            temp += prefix + complex_print(construction_head(x))
            prefix = " "
            x = construction_tail(x)
        }
        if (null_p(x)) {
            temp += ")"
        } else {
            temp += " . " + complex_print(x) + ")"
        }
        return temp
    } else if (data_p(x)) {
        const name = data_name(x)
        const list = data_list(x)
        const maybe_xs = maybe_list_to_jsArray(list)
        if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_atom) && jsbool_no_force_equal_p(maybe_xs[0], system_atom)) {
            // systemName_make(maybe_xs[1])
            return print_sys_name(maybe_xs[1], false)
        }
        return "#" + complex_print(new_construction(name, list))
    } else if (error_p(x)) {
        return "!" + complex_print(new_construction(error_name(x), error_list(x)))
    } else if (atom_p(x)) {
        return un_atom(x)
    } else if (comment_p(x)) {
        return ";(" + complex_print(comment_comment(x)) + " " + complex_print(comment_x(x)) + ")"
    } else if (delay_evaluate_p(x)) {
        return "$(" + complex_print(env2val(delay_evaluate_env(x))) + " " + complex_print(delay_evaluate_x(x)) + ")"
    } else if (delay_builtin_func_p(x)) {
        return "%(" + complex_print(delay_builtin_func_f(x)) + " " + complex_print(jsArray_to_list(delay_builtin_func_xs(x))) + ")"
    } else if (delay_builtin_form_p(x)) {
        return "@(" +
            complex_print(env2val(delay_builtin_form_env(x))) +
            " " + complex_print(delay_builtin_form_f(x)) +
            " " + complex_print(jsArray_to_list(delay_builtin_form_xs(x))) +
            ")"
    } else if (delay_apply_p(x)) {
        return "^(" + complex_print(delay_apply_f(x)) + " " + complex_print(jsArray_to_list(delay_apply_xs(x))) + ")"
    }
    return LANG_ERROR() // 大量重複代碼 simple_print <-> complex_print ]]]
}
export { complex_print }
// 相對獨立的部分。complex parser/complex printer }}}
