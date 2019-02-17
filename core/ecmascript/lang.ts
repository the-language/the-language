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
const TheLanguage: any = {};
(() => {
    const exports = TheLanguage

    function ERROR(): never {
        throw "TheLanguage PANIC"
    }

    function ASSERT(x: boolean): void {
        if (!x) {
            ERROR()
        }
    }

    function DEBUG(x: string): void {
        //[禁用] console.log(x)
    }

    function jsnull_p(x: any): boolean {
        // undefined/null
        return x == null
    }

    // {{{ 相對獨立的部分。內建數據結構
    enum LangValType {
        symbol_t,
        cons_t,
        null_t,
        data_t,
        error_t,
        just_t,
        delay_eval_t,
        delay_builtin_func_t,
        delay_builtin_form_t,
        delay_apply_t,
    }
    const symbol_t = LangValType.symbol_t
    const cons_t = LangValType.cons_t
    const null_t = LangValType.null_t
    const data_t = LangValType.data_t
    const error_t = LangValType.error_t
    const just_t = LangValType.just_t
    const delay_eval_t = LangValType.delay_eval_t
    const delay_builtin_func_t = LangValType.delay_builtin_func_t
    const delay_builtin_form_t = LangValType.delay_builtin_form_t
    const delay_apply_t = LangValType.delay_apply_t

    type LangValDelayType = LangValType.delay_eval_t | LangValType.delay_builtin_func_t | LangValType.delay_builtin_form_t | LangValType.delay_apply_t
    type LangValJustDelayType = LangValType.just_t | LangValDelayType


    type LangValSymbol = [LangValType.symbol_t, string]
    type LangValCons = [LangValType.cons_t, LangValRec, LangValRec]
    type LangValNull = [LangValType.null_t]
    type LangValData = [LangValType.data_t, LangValRec, LangValRec]
    type LangValJust = [LangValType.just_t, LangValRec, null, null]
    type LangValDelayEval = [LangValType.delay_eval_t, any, LangValRec] // WIP
    type LangValDelayBuiltinFunc = [LangValType.delay_builtin_func_t, LangValSysNameJustDelay, Array < LangValRec > ]
    type LangValDelayBuiltinForm = [LangValType.delay_builtin_form_t, any, LangValSysNameJustDelay, Array < LangValRec > ] // WIP
    type LangValDelayApply = [LangValType.delay_apply_t, LangValFunctionJustDelay, Array < LangValRec > ]
    type LangValSysName = LangValData // WIP
    type LangValName = LangValData | LangValSymbol
    type LangValSysNameJustDelay = LangValSysName | LangValJustDelayType
    type LangValFunctionJustDelay = LangValRec // WIP
    type LangVal = LangValSymbol | LangValCons | LangValNull | LangValData | LangValJust | LangValDelayEval | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply
    type LangValRec = any // WIP

    /* 遞歸類型 A hack: [Unused] [error TS2312: An interface can only extend an object type or intersection of object types with statically known members.]
        type trec < T > = [null, t, t] | null
        interface t extends trec < null > {}
        */

    function type_of(x: LangVal): LangValType {
        return x[0]
    }

    function make_one_p(t) {
        return function(x) {
            return x[0] === t
        }
    }
    const make_two_p = make_one_p
    const make_three_p = make_one_p

    function make_new_one < T, A > (t: T): (x: A) => [T, A] {
        return function(x) {
            return [t, x]
        }
    }

    function make_new_two < T, A, B > (t: T): (x: A, y: B) => [T, A, B] {
        return function(x, y) {
            return [t, x, y] // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
        }
    }

    function make_new_three(t) {
        return function(x, y, z) {
            return [t, x, y, z]
        }
    }

    function make_get_one_a(t) {
        return function(x) {
            ASSERT(x[0] === t)
            return x[1]
        }
    }
    const make_get_two_a = make_get_one_a
    const make_get_three_a = make_get_one_a

    function make_get_two_b(t) {
        return function(x) {
            ASSERT(x[0] === t)
            return x[2]
        }
    }
    const make_get_three_b = make_get_two_b

    function make_get_three_c(t) {
        return function(x) {
            ASSERT(x[0] === t)
            return x[3]
        }
    }

    const new_symbol: (x: string) => LangValSymbol = make_new_one < LangValType.symbol_t,
        string > (symbol_t)
    const symbol_p = make_one_p(symbol_t)
    const un_symbol = make_get_one_a(symbol_t)
    exports.new_symbol = new_symbol
    exports.symbol_p = symbol_p
    exports.un_symbol = un_symbol

    const new_cons: (x: LangVal, y: LangVal) => LangValCons = make_new_two < LangValType.cons_t,
        LangVal, LangVal > (cons_t)
    const cons_p = make_two_p(cons_t)
    const cons_car = make_get_two_a(cons_t)
    const cons_cdr = make_get_two_b(cons_t)
    exports.new_cons = new_cons
    exports.cons_p = cons_p
    exports.cons_head = cons_car
    exports.cons_tail = cons_cdr

    const null_v: LangValNull = [null_t]

    function null_p(x: LangVal): x is LangValNull {
        return x[0] === null_t
    }
    exports.null_v = null_v
    exports.null_p = null_p

    const new_data: (x: LangVal, y: LangVal) => LangValData = make_new_two < LangValType.data_t,
        LangVal, LangVal > (data_t)
    const data_p = make_two_p(data_t)
    const data_name = make_get_two_a(data_t)
    const data_list = make_get_two_b(data_t)
    exports.new_data = new_data
    exports.data_p = data_p
    exports.data_name = data_name
    exports.data_list = data_list

    const new_error = make_new_two(error_t)
    const error_p = make_two_p(error_t)
    const error_name = make_get_two_a(error_t)
    const error_list = make_get_two_b(error_t)
    exports.new_error = new_error
    exports.error_p = error_p
    exports.error_name = error_name
    exports.error_list = error_list

    function lang_set_do(x, y) {
        // 只用于x与y等价的情况
        if (x === y) {
            return
        }
        x[0] = just_t
        x[1] = y
        x[2] = null
        x[3] = null
    }
    const just_p = make_one_p(just_t)
    const un_just = make_get_one_a(just_t)
    const lang_eval = make_new_two(delay_eval_t)
    exports.eval = lang_eval
    const delay_eval_p = make_two_p(delay_eval_t)
    const delay_eval_env = make_get_two_a(delay_eval_t); // Env
    const delay_eval_x = make_get_two_b(delay_eval_t)
    const builtin_form_apply = make_new_three(delay_builtin_form_t)
    const delay_builtin_form_p = make_three_p(delay_builtin_form_t)
    const delay_builtin_form_env = make_get_three_a(delay_builtin_form_t); // Env
    const delay_builtin_form_f = make_get_three_b(delay_builtin_form_t)
    const delay_builtin_form_xs = make_get_three_c(delay_builtin_form_t); // JSList LangVal
    const builtin_func_apply = make_new_two(delay_builtin_func_t)
    const delay_builtin_func_p = make_two_p(delay_builtin_func_t)
    const delay_builtin_func_f = make_get_two_a(delay_builtin_func_t); // LangVal/Name
    const delay_builtin_func_xs = make_get_two_b(delay_builtin_func_t); // JSList LangVal
    const lang_apply = make_new_two(delay_apply_t)
    exports.apply = lang_apply
    const delay_apply_p = make_two_p(delay_apply_t)
    const delay_apply_f = make_get_two_a(delay_apply_t)
    const delay_apply_xs = make_get_two_b(delay_apply_t); // JSList LangVal
    function force_all_rec(x: LangVal): LangVal {
        x = force_all(x)
        switch (type_of(x)) {
            case data_t:
            case error_t:
            case cons_t:
                x[1] = force_all_rec(x[1])
                x[2] = force_all_rec(x[2])
                return x
            default:
                return x
        }
    }
    exports.force_rec = force_all_rec
    // 相對獨立的部分。內建數據結構 }}}

    // {{{ 相對獨立的部分。符號名稱
    exports.symbols = {}
    const sys_sym = new_symbol("太始初核")
    exports.symbols.system = sys_sym
    const name_sym = new_symbol("符名")
    exports.symbols.name = name_sym
    const func_sym = new_symbol("化滅")
    exports.symbols.func = func_sym
    const form_sym = new_symbol("式形")
    exports.symbols.form = form_sym
    const equal_sym = new_symbol("等同")
    exports.symbols.equal = equal_sym
    const eval_sym = new_symbol("解算")
    exports.symbols.eval = eval_sym
    const the_sym = new_symbol("特定其物")
    exports.symbols.the_thing = the_sym
    const sth_sym = new_symbol("省略一物")
    exports.symbols.something = sth_sym
    const map_sym = new_symbol("映表")
    exports.symbols.mapping = map_sym
    const if_sym = new_symbol("若")
    exports.symbols.if = if_sym
    const a_sym = new_symbol("一類何物")
    exports.symbols.type_annotation = a_sym
    const isornot_sym = new_symbol("是非")
    exports.symbols.is_or_not = isornot_sym
    const sub_sym = new_symbol("其子")
    exports.symbols.sub_sym = sub_sym
    const true_sym = new_symbol("陽")
    exports.symbols.true = true_sym
    const false_sym = new_symbol("陰")
    exports.symbols.false = false_sym
    const quote_sym = new_symbol("引用")
    exports.symbols.quote = quote_sym
    const apply_sym = new_symbol("應用")
    exports.symbols.apply = apply_sym
    const null_sym = new_symbol("空")
    exports.symbols.null = null_sym
    const cons_sym = new_symbol("連")
    exports.symbols.cons = cons_sym
    const data_sym = new_symbol("構")
    exports.symbols.data = data_sym
    const error_sym = new_symbol("誤")
    exports.symbols.error = error_sym
    const sym_sym = new_symbol("詞素")
    exports.symbols.symbol = sym_sym
    const list_sym = new_symbol("列")
    exports.symbols.list = list_sym
    const head_sym = new_symbol("首")
    exports.symbols.head = head_sym
    const tail_sym = new_symbol("尾")
    exports.symbols.tail = tail_sym
    const thing_sym = new_symbol("物")
    exports.symbols.thing = thing_sym
    const the_world_stopped_sym = new_symbol("宇宙亡矣")
    exports.symbols.the_world_stopped = the_world_stopped_sym
    const the_world_stopped_v = new_error(sys_sym, new_list(the_world_stopped_sym, sth_sym))

    function make_sys_sym_f(x: LangVal): LangValSysName {
        return new_data(name_sym, new_list(sys_sym, x))
    }

    function make_builtin_f_new_sym_f(x_sym: LangValSymbol): LangValSysName {
        return make_sys_sym_f(new_list(a_sym, new_list(func_sym, sth_sym, x_sym), the_sym))
    }

    function make_builtin_f_get_sym_f(t_sym: LangValSymbol, x_sym: LangVal): LangValSysName {
        return make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_list(t_sym), sth_sym), x_sym))
    }

    function make_builtin_f_p_sym_f(t_sym: LangValSymbol): LangValSysName {
        return make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, t_sym, sth_sym))))
    }
    exports.symbols.builtin = {}
    exports.symbols.builtin.func = {}
    const builtin_func_new_data_sym = make_builtin_f_new_sym_f(data_sym)
    exports.symbols.builtin.func.new_data = builtin_func_new_data_sym
    const builtin_func_data_name_sym = make_builtin_f_get_sym_f(data_sym, name_sym)
    exports.symbols.builtin.func.data_name = builtin_func_data_name_sym
    const builtin_func_data_list_sym = make_builtin_f_get_sym_f(data_sym, list_sym)
    exports.symbols.builtin.func.data_list = builtin_func_data_list_sym
    const builtin_func_data_p_sym = make_builtin_f_p_sym_f(data_sym)
    exports.symbols.builtin.func.data_p = builtin_func_data_p_sym

    const builtin_func_new_error_sym = make_builtin_f_new_sym_f(error_sym)
    exports.symbols.builtin.func.new_error = builtin_func_new_error_sym
    const builtin_func_error_name_sym = make_builtin_f_get_sym_f(error_sym, name_sym)
    exports.symbols.builtin.func.error_name = builtin_func_error_name_sym
    const builtin_func_error_list_sym = make_builtin_f_get_sym_f(error_sym, list_sym)
    exports.symbols.builtin.func.error_list = builtin_func_error_list_sym
    const builtin_func_error_p_sym = make_builtin_f_p_sym_f(error_sym)
    exports.symbols.builtin.func.error_p = builtin_func_error_p_sym

    const builtin_func_new_cons_sym = make_builtin_f_new_sym_f(cons_sym)
    exports.symbols.builtin.func.new_cons = builtin_func_new_cons_sym
    const builtin_func_cons_p_sym = make_builtin_f_p_sym_f(cons_sym)
    exports.symbols.builtin.func.cons_p = builtin_func_cons_p_sym
    const builtin_func_cons_head_sym = make_builtin_f_get_sym_f(cons_sym, head_sym)
    exports.symbols.builtin.func.cons_head = builtin_func_cons_head_sym
    const builtin_func_cons_tail_sym = make_builtin_f_get_sym_f(cons_sym, tail_sym)
    exports.symbols.builtin.func.cons_tail = builtin_func_cons_tail_sym

    const builtin_func_sym_p_sym = make_builtin_f_p_sym_f(sym_sym)
    exports.symbols.builtin.func.symbol_p = builtin_func_sym_p_sym

    const builtin_func_null_p_sym = make_builtin_f_p_sym_f(null_sym)
    exports.symbols.builtin.func.null_p = builtin_func_null_p_sym

    const builtin_func_equal_sym = make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, equal_sym)))
    exports.symbols.builtin.func.equal_p = builtin_func_equal_sym
    const builtin_func_apply_sym = make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_cons(func_sym, sth_sym), sth_sym), apply_sym))
    exports.symbols.builtin.func.apply = builtin_func_apply_sym
    const builtin_func_eval_sym = make_sys_sym_f(new_list(a_sym, func_sym, eval_sym))
    exports.symbols.builtin.func.eval = builtin_func_eval_sym
    const builtin_func_list_choose_sym = make_builtin_f_get_sym_f(list_sym, new_list(a_sym, thing_sym, sth_sym))
    exports.symbols.builtin.func.list_choose_one = builtin_func_list_choose_sym
    const builtin_func_if_sym = make_sys_sym_f(new_list(a_sym, func_sym, if_sym))
    exports.symbols.builtin.func.if = builtin_func_if_sym

    exports.symbols.builtin.form = {}
    const builtin_form_quote_sym = make_sys_sym_f(new_list(a_sym, form_sym, quote_sym))
    exports.symbols.builtin.form.quote = builtin_form_quote_sym
    const builtin_form_lambda_sym = make_sys_sym_f(new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, func_sym)), the_sym))
    exports.symbols.builtin.form.lambda = builtin_form_lambda_sym

    const use_builtin_func_sym = make_sys_sym_f(new_list(form_sym, new_list(sys_sym, func_sym)))
    exports.symbols.use_builtin_function = use_builtin_func_sym
    const use_builtin_form_sym = make_sys_sym_f(new_list(form_sym, new_list(sys_sym, form_sym)))
    exports.symbols.use_builtin_form = use_builtin_form_sym
    const use_form_sym = make_sys_sym_f(new_list(form_sym, form_sym))
    exports.symbols.use_form = use_form_sym
    const false_v = new_data(false_sym, new_list())
    const true_v = new_data(true_sym, new_list())

    function symbol_eq_p(x: LangValSymbol, y: LangValSymbol): boolean {
        if (x === y) {
            return true
        }
        // 其他自然語言暫未實現。 WIP
        if (un_symbol(x) === un_symbol(y)) {
            lang_set_do(x, y)
            return true
        } else {
            return false
        }
    }
    // 相對獨立的部分。符號名稱 }}}

    // {{{ 相對獨立的部分。對內建數據結構的簡單處理
    function jslist2list(xs: Array < LangVal > ): LangVal {
        let ret: LangVal = null_v
        for (let i = xs.length - 1; i >= 0; i--) {
            ret = new_cons(xs[i], ret)
        }
        return ret
    }

    function list2jslist < T > (xs: LangVal, k_done: (p0: Array < LangVal > ) => T, k_tail: (p0: Array < LangVal > , p1: LangVal) => T): T {
        let ret = []
        while (cons_p(xs)) {
            ret.push(cons_car(xs))
            xs = cons_cdr(xs)
        }
        if (null_p(xs)) {
            return k_done(ret)
        }
        return k_tail(ret, xs)
    }

    function maybe_list2js(xs: LangVal): false | Array < LangVal > {
        // LangVal -> Maybe (JSList LangVal)
        return list2jslist < false | Array < LangVal >> (xs, (xs) => xs, (xs, x) => false)
    }

    function new_list(...xs) {
        return jslist2list(xs)
    }
    exports.jslist2list = jslist2list
    exports.new_list = new_list

    function un_just_all(raw) {
        let x = raw
        let xs = []
        while (just_p(x)) {
            xs.push(x)
            x = un_just(x)
        }
        for (let i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], x)
        }
        return x
    }

    function any_delay_just_p(x) {
        return just_p(x) || delay_eval_p(x) || delay_builtin_form_p(x) || delay_builtin_func_p(x) || delay_apply_p(x)
    }
    exports.delay_p = any_delay_just_p

    function force_all(raw, parents_history = {}, ref_novalue_replace = [false, false]) {
        // LangVal -> LangVal
        // *history : Map String True
        // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
        let history = {}
        let x = raw
        let xs = []

        function replace_this_with_stopped() {
            // 語言標準允許替換沒有值的東西為那種錯誤。
            ref_novalue_replace[1] = true
            lang_set_do(x, the_world_stopped_v)
            for (let i = 0; i < xs.length; i++) {
                lang_set_do(xs[i], the_world_stopped_v)
            }
            return the_world_stopped_v
        }

        function make_history() {
            let ret = {}
            for (const x_id in history) {
                ret[x_id] = true
            }
            for (const x_id in parents_history) {
                ret[x_id] = true
            }
            return ret
        }
        while (any_delay_just_p(x)) {
            const x_id = print(x)
            if (parents_history[x_id] === true) {
                return replace_this_with_stopped()
            }
            if (history[x_id] === true) {
                ref_novalue_replace[0] = true
                // 減少替換範圍：(f <沒有值>) 的(f _)
                switch (type_of(x)) {
                    case delay_eval_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    case delay_builtin_func_t:
                        const f = delay_builtin_func_f(x); // LangVal/Name
                        const xs = delay_builtin_func_xs(x); // JSList LangVal
                        const elim_s = [builtin_func_data_name_sym, builtin_func_data_list_sym, builtin_func_data_p_sym, builtin_func_error_name_sym, builtin_func_error_list_sym, builtin_func_error_p_sym, builtin_func_cons_p_sym, builtin_func_cons_head_sym, builtin_func_cons_tail_sym, builtin_func_sym_p_sym, builtin_func_null_p_sym]
                        let is_elim = false
                        for (let i = 0; i < elim_s.length; i++) {
                            if (jsbool_equal_p(elim_s[i], f)) {
                                is_elim = true
                            }
                        }
                        if (is_elim) {
                            ASSERT(xs.length === 1)
                            ASSERT(ref_novalue_replace[1] === false)
                            const inner = force_all(xs[0], make_history(), ref_novalue_replace)
                            if (ref_novalue_replace[1]) {
                                return force_all(builtin_func_apply(f, [inner]))
                            } else {
                                ERROR(); //我覺得沒有這種情況
                                return replace_this_with_stopped()
                            }
                        }
                        if (jsbool_equal_p(f, builtin_func_equal_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_apply_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_eval_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_if_sym)) {
                            ASSERT(xs.length === 3)
                            ASSERT(ref_novalue_replace[1] === false)
                            const tf = force_all(xs[0], make_history(), ref_novalue_replace)
                            if (ref_novalue_replace[1]) {
                                return force_all(builtin_func_apply(builtin_func_if_sym, [tf, xs[1], xs[2]]))
                            } else {
                                ERROR(); //我覺得沒有這種情況
                                return replace_this_with_stopped()
                            }
                        }
                        ERROR(); //我覺得沒有這種情況
                    case delay_builtin_form_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    case delay_apply_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    default:
                }
                ERROR()
            }
            history[x_id] = true
            xs.push(x)
            x = force1(x)
        }
        for (let i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], x)
        }
        return x
    }

    function force1(raw) {
        // LangVal -> LangVal
        const x = un_just_all(raw)
        let ret
        ASSERT(!just_p(x))
        if (delay_eval_p(x)) {
            ret = real_eval(delay_eval_env(x), delay_eval_x(x))
        } else if (delay_builtin_form_p(x)) {
            ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x))
        } else if (delay_builtin_func_p(x)) {
            ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x))
        } else if (delay_apply_p(x)) {
            ret = real_lang_apply(delay_apply_f(x), delay_apply_xs(x))
        } else {
            ret = x
        }
        ret = un_just_all(ret)
        lang_set_do(x, ret)
        return ret
    }
    exports.force = force_all
    exports.force1 = force1
    // 相對獨立的部分。對內建數據結構的簡單處理 }}}

    // {{{ 相對獨立的部分。變量之環境
    const env_null_v = []

    function env_set(env, key, val) {
        // Env k v, k, v -> Env k v
        let ret = []
        for (let i = 0; i < env.length; i = i + 2) {
            // WIP delay未正確處理(影響較小)
            if (jsbool_equal_p(env[i + 0], key)) {
                ret[i + 0] = key
                ret[i + 1] = val
                for (i = i + 2; i < env.length; i = i + 2) {
                    ret[i + 0] = env[i + 0]
                    ret[i + 1] = env[i + 1]
                }
                return ret
            } else {
                ret[i + 0] = env[i + 0]
                ret[i + 1] = env[i + 1]
            }
        }
        ret[env.length + 0] = key
        ret[env.length + 1] = val
        return ret
    }

    function env_get(env, key, default_v) {
        // Env k v, k, v -> v
        for (let i = 0; i < env.length; i = i + 2) {
            if (jsbool_equal_p(env[i + 0], key)) {
                return env[i + 1]
            }
        }
        return default_v
    }

    function must_env_get(env, key) {
        // Env k v, k, v -> v
        for (let i = 0; i < env.length; i = i + 2) {
            if (jsbool_equal_p(env[i + 0], key)) {
                return env[i + 1]
            }
        }
        ERROR()
    }
    exports.env_null_v = env_null_v
    exports.env_set = env_set
    exports.env_get = env_get

    function env2val(env) {
        // Env k v -> LangVal
        let ret: LangVal = null_v
        for (let i = 0; i < env.length; i = i + 2) {
            ret = new_cons(new_list(env[i + 0], env[i + 1]), ret)
        }
        return new_data(map_sym, new_list(ret))
    }

    function env_foreach(env, f) {
        // env : Env k v
        // f : k, v -> _
        for (let i = 0; i < env.length; i = i + 2) {
            f(env[i + 0], env[i + 1])
        }
    }

    function val2env(x) {
        // LangVal -> Maybe (Env k v)
        x = force_all(x)
        if (!data_p(x)) {
            return false
        }
        let s = force_all(data_name(x))
        if (!symbol_p(s)) {
            return false
        }
        if (!symbol_eq_p(s, map_sym)) {
            return false
        }
        s = force_all(data_list(x))
        if (!cons_p(s)) {
            return false
        }
        if (!null_p(force_all(cons_cdr(s)))) {
            return false
        }
        let ret = []
        let xs = force_all(cons_car(s))
        while (!null_p(xs)) {
            if (!cons_p(xs)) {
                return false
            }
            let x = force_all(cons_car(xs))
            xs = force_all(cons_cdr(xs))
            if (!cons_p(x)) {
                return false
            }
            const k = cons_car(x)
            x = force_all(cons_cdr(x))
            if (!cons_p(x)) {
                return false
            }
            const v = cons_car(x)
            if (!null_p(force_all(cons_cdr(x)))) {
                return false
            }
            (function() {
                for (let i = 0; i < ret.length; i = i + 2) {
                    if (jsbool_equal_p(ret[i + 0], k)) {
                        ret[i + 1] = v
                        return
                    }
                }
                ret.push(k)
                ret.push(v)
            })()
        }
        return ret
    }
    exports.env2val = env2val
    exports.val2env = val2env
    // 相對獨立的部分。變量之環境 }}}

    function real_eval(env, raw) {
        // Env, LangVal -> LangVal
        const x = force1(raw)
        if (any_delay_just_p(x)) {
            return lang_eval(env, x)
        }
        const error_v = new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_eval_sym, new_list(env2val(env), x))))
        switch (type_of(x)) {
            case cons_t:
                let xs = []
                let rest = x
                while (!null_p(rest)) {
                    if (any_delay_just_p(rest)) {
                        return lang_eval(env, x)
                    } else if (cons_p(rest)) {
                        xs.push(cons_car(rest))
                        // WIP delay未正確處理(影響較小)
                        rest = force1(cons_cdr(rest))
                    } else {
                        DEBUG("[ERROR/eval] not list")
                        return error_v
                    }
                }
                // WIP delay未正確處理(影響較小)
                if (jsbool_equal_p(xs[0], use_builtin_form_sym)) {
                    if (xs.length === 1) {
                        DEBUG("[ERROR/eval] builtin_form/len=1")
                        return error_v
                    }
                    const f = xs[1]
                    let args = []
                    for (let i = 2; i < xs.length; i++) {
                        args[i - 2] = xs[i]
                    }
                    return builtin_form_apply(env, f, args)
                } else if (jsbool_equal_p(xs[0], use_form_sym)) {
                    if (xs.length === 1) {
                        DEBUG("[ERROR/eval] form/len=1")
                        return error_v
                    }
                    // WIP delay未正確處理(影響較小)
                    const f = force_all(lang_eval(env, xs[1]))
                    if (!data_p(f)) {
                        DEBUG("[ERROR/eval] form/not data{{{" + complex_print(f) + "}}}")
                        return error_v
                    }
                    const f_type = force1(data_name(f))
                    if (any_delay_just_p(f_type)) {
                        return lang_eval(env, x)
                    }
                    if (!symbol_p(f_type)) {
                        DEBUG("[ERROR/eval] form/not form/not symbol")
                        return error_v
                    }
                    if (!symbol_eq_p(f_type, form_sym)) {
                        DEBUG("[ERROR/eval] form/not form")
                        return error_v
                    }
                    const f_list = force1(data_list(f))
                    if (any_delay_just_p(f_list)) {
                        return lang_eval(env, x)
                    }
                    if (!cons_p(f_list)) {
                        DEBUG("[ERROR/eval] form/not form/0")
                        return error_v
                    }
                    const f_x = cons_car(f_list)
                    const f_list_cdr = force1(cons_cdr(f_list))
                    if (any_delay_just_p(f_list_cdr)) {
                        return lang_eval(env, x)
                    }
                    if (!null_p(f_list_cdr)) {
                        DEBUG("[ERROR/eval] form/not form/multi args")
                        return error_v
                    }
                    const args = [env2val(env)]
                    for (let i = 2; i < xs.length; i++) {
                        args[i - 1] = xs[i]
                    }
                    return lang_apply(f_x, args)
                } else if (jsbool_equal_p(xs[0], use_builtin_func_sym)) {
                    if (xs.length === 1) {
                        return error_v
                    }
                    const f = xs[1]
                    let args = []
                    for (let i = 2; i < xs.length; i++) {
                        args[i - 2] = lang_eval(env, xs[i])
                    }
                    return builtin_func_apply(f, args)
                } else {
                    const f = lang_eval(env, xs[0])
                    let args = []
                    for (let i = 1; i < xs.length; i++) {
                        args[i - 1] = lang_eval(env, xs[i])
                    }
                    return lang_apply(f, args)
                }
                break
            case null_t:
                return x
            case symbol_t: //name_p
            case data_t: //name_p
                return env_get(env, x, error_v)
            case error_t:
                return error_v
            default:
        }
        ERROR()
    }

    function name_p(x) {
        const t = type_of(x)
        return t === symbol_t || t === data_t
    }

    function make_builtin_p_func(p_sym, p_jsfunc) {
        return [p_sym, 1, function(x, error_v) {
            x = force1(x)
            if (any_delay_just_p(x)) {
                return builtin_func_apply(p_sym, [x])
            }
            if (p_jsfunc(x)) {
                return true_v
            }
            return false_v
        }]
    }

    function make_builtin_get_func(f_sym, p_jsfunc, f_jsfunc) {
        return [f_sym, 1, function(x, error_v) {
            x = force1(x)
            if (any_delay_just_p(x)) {
                return builtin_func_apply(f_sym, [x])
            }
            if (p_jsfunc(x)) {
                return f_jsfunc(x)
            }
            return error_v
        }]
    }
    const real_builtin_func_apply_s = [
        make_builtin_p_func(builtin_func_data_p_sym, data_p),
        [builtin_func_new_data_sym, 2, new_data],
        make_builtin_get_func(builtin_func_data_name_sym, data_p, data_name),
        make_builtin_get_func(builtin_func_data_list_sym, data_p, data_list),

        make_builtin_p_func(builtin_func_error_p_sym, error_p),
        [builtin_func_new_error_sym, 2, new_error],
        make_builtin_get_func(builtin_func_error_name_sym, error_p, error_name),
        make_builtin_get_func(builtin_func_error_list_sym, error_p, error_list),

        make_builtin_p_func(builtin_func_null_p_sym, null_p),
        [builtin_func_new_cons_sym, 2, new_cons],
        make_builtin_p_func(builtin_func_cons_p_sym, cons_p),
        make_builtin_get_func(builtin_func_cons_head_sym, cons_p, cons_car),
        make_builtin_get_func(builtin_func_cons_tail_sym, cons_p, cons_cdr),

        [builtin_func_equal_sym, 2, function(x, y, error_v) {
            if (x === y) {
                return true_v
            }
            x = force1(x)
            y = force1(y)
            if (any_delay_just_p(x) || any_delay_just_p(y)) {
                return builtin_func_apply(builtin_func_equal_sym, [x, y]); // not fully implemented -- Halting
            }
            if (x === y) {
                return true_v
            }
            if (type_of(x) !== type_of(y)) {
                return false_v
            }

            function H_if(b, x, y) {
                // H = helper
                return builtin_func_apply(builtin_func_if_sym, [b, x, y])
            }

            function H_and(x, y) {
                return H_if(x, y, false_v)
            }
            ASSERT(!any_delay_just_p(x))

            function end_2(f1, f2) {
                return H_and(builtin_func_apply(builtin_func_equal_sym, [f1(x), f1(y)]), builtin_func_apply(builtin_func_equal_sym, [f2(x), f2(y)]))
            }
            switch (type_of(x)) {
                case null_t:
                    return true_v
                case symbol_t:
                    return symbol_eq_p(x, y) ? true_v : false_v
                case data_t:
                    return end_2(data_name, data_list)
                case cons_t:
                    return end_2(cons_car, cons_cdr)
                case error_t:
                    return end_2(error_name, error_list)
                default:
            }
            ERROR()
        }],
        [builtin_func_apply_sym, 2, function(f, xs, error_v) {
            // WIP delay未正確處理(影響較小)
            let jslist = []
            let iter = force_all(xs)
            while (cons_p(iter)) {
                jslist.push(cons_car(iter))
                iter = force_all(cons_cdr(iter))
            }
            if (!null_p(iter)) {
                return error_v
            }
            return lang_apply(f, jslist)
        }],
        [builtin_func_eval_sym, 2, function(env, x, error_v) {
            // WIP delay未正確處理(影響較小)
            const maybeenv = val2env(env)
            if (maybeenv === false) {
                return error_v
            }
            return lang_eval(maybeenv, x)
        }],

        make_builtin_p_func(builtin_func_sym_p_sym, symbol_p),

        [builtin_func_list_choose_sym, 1, function(xs, error_v) {
            // 一般返回第一个，可以因为优化返回其他的任意一个
            // xs可以無限長，不判斷是否真的是list
            xs = force1(xs)
            if (any_delay_just_p(xs)) {
                return builtin_func_apply(builtin_func_list_choose_sym, [xs])
            }
            if (!cons_p(xs)) {
                return error_v
            }
            return cons_car(xs)
        }],
        [builtin_func_if_sym, 3, function(b, x, y, error_v) {
            b = force1(b)
            if (any_delay_just_p(b)) {
                return builtin_func_apply(builtin_func_if_sym, [b, x, y])
            }
            if (!data_p(b)) {
                return error_v
            }
            // WIP delay未正確處理(影響較小)
            const nam = force_all(data_name(b))
            if (!symbol_p(nam)) {
                return error_v
            }
            if (symbol_eq_p(nam, true_sym)) {
                return x
            }
            if (symbol_eq_p(nam, false_sym)) {
                return y
            }
            return error_v
        }],
    ]

    function real_lang_apply(f, xs) {
        // LangVal, JSList LangVal -> LangVal
        // WIP delay未正確處理(影響較小)
        function make_error_v() {
            return new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_apply_sym, new_list(f, jslist2list(xs)))))
        }
        f = force1(f)
        if (any_delay_just_p(f)) {
            return lang_apply(f, xs)
        }
        if (!data_p(f)) {
            return make_error_v()
        }
        const f_type = force_all(data_name(f))
        if (!(symbol_p(f_type) && symbol_eq_p(f_type, func_sym))) {
            return make_error_v()
        }
        const f_list = force_all(data_list(f))
        if (!cons_p(f_list)) {
            return make_error_v()
        }
        let args_pat = force_all_rec(cons_car(f_list))
        const f_list_cdr = force_all(cons_cdr(f_list))
        if (!(cons_p(f_list_cdr) && null_p(force_all(cons_cdr(f_list_cdr))))) {
            return make_error_v()
        }
        const f_code = cons_car(f_list_cdr)
        let env = env_null_v
        while (!null_p(args_pat)) {
            if (name_p(args_pat)) {
                env = env_set(env, args_pat, jslist2list(xs))
                xs = []
                args_pat = null_v
            } else if (cons_p(args_pat)) {
                if (xs.length === 0) {
                    return make_error_v()
                }
                env = env_set(env, cons_car(args_pat), xs.shift()); // xs.shift() 表達式副作用!
                args_pat = cons_cdr(args_pat)
            } else {
                return make_error_v()
            }
        }
        if (xs.length !== 0) {
            return make_error_v()
        }
        return lang_eval(env, f_code)
    }

    function real_builtin_func_apply(f, xs) {
        // Name, JSList LangVal -> LangVal
        const error_v = new_error(sys_sym, new_list(use_builtin_func_sym, new_list(f, jslist2list(xs))))
        for (let i = 0; i < real_builtin_func_apply_s.length; i++) {
            // WIP delay未正確處理(影響較小)
            if (jsbool_equal_p(f, real_builtin_func_apply_s[i][0])) {
                if (xs.length != real_builtin_func_apply_s[i][1]) {
                    return error_v
                }
                xs.push(error_v)
                return real_builtin_func_apply_s[i][2].apply(null, xs)
            }
        }
        return error_v
    }

    function real_builtin_form_apply(env, f, xs) {
        // Env, Name, JSList NotEvaledLangVal -> LangVal
        const error_v = new_error(sys_sym, new_list(use_builtin_form_sym, new_list(env2val(env), f, jslist2list(xs))))
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(f, builtin_form_quote_sym)) {
            if (xs.length !== 1) {
                return error_v
            }
            return xs[0]
        } else if (jsbool_equal_p(f, builtin_form_lambda_sym)) {
            if (xs.length !== 2) {
                return error_v
            }
            return new_lambda(env, xs[0], xs[1], error_v)
        }
        return error_v
    }

    function new_lambda(env, args_pat, body, error_v) {
        // 允許返回不同的物--允許實現進行對所有實現有效的優化[比如:消除無用環境中的變量] TODO 未實現
        function make_error_v() {
            if (jsnull_p(error_v)) {
                return new_error(sys_sym, new_list(use_builtin_form_sym, new_list(env2val(env), builtin_form_lambda_sym, jslist2list([args_pat, body]))))
            } else {
                return error_v
            }
        }

        function make_quote(x) {
            return new_list(use_builtin_form_sym, builtin_form_quote_sym, x)
        }

        args_pat = force_all_rec(args_pat); // WIP delay未正確處理(影響較小)

        let args_pat_vars = []; // : JSList LangVal/Name 順序有要求
        let args_pat_is_dot = false; // : Bool
        let args_pat_iter = args_pat
        while (!null_p(args_pat_iter)) {
            if (name_p(args_pat_iter)) {
                args_pat_vars.push(args_pat_iter)
                args_pat_is_dot = true
                args_pat_iter = null_v
            } else if (cons_p(args_pat_iter)) {
                args_pat_vars.push(cons_car(args_pat_iter))
                args_pat_iter = cons_cdr(args_pat_iter)
            } else {
                return make_error_v()
            }
        }
        let args_pat_vars_val = args_pat; // 是 jslist2list(args_pat_vars) : LangVal
        if (args_pat_is_dot) {
            args_pat_vars_val = jslist2list(args_pat_vars)
        }

        let env_vars = []; // : JSList LangVal/Name
        env_foreach(env, function(k, v) {
            for (let i = 0; i < args_pat_vars.length; i++) {
                if (jsbool_equal_p(args_pat_vars[i], k)) { // WIP delay未正確處理(影響較小)
                    return
                }
            }
            env_vars.push(k)
        })

        let new_args_pat = args_pat_vars_val; // : LangVal
        for (let i = env_vars.length - 1; i >= 0; i--) {
            new_args_pat = new_cons(env_vars[i], new_args_pat)
        }

        let new_args = args_pat_vars_val; // : LangVal
        for (let i = env_vars.length - 1; i >= 0; i--) {
            new_args = new_cons(make_quote(must_env_get(env, env_vars[i])), new_args)
        }

        return new_data(func_sym, new_list(args_pat, new_cons(make_quote(new_data(func_sym, new_list(new_args_pat, body))), new_args)))
    }

    function jsbool_equal_p(x, y) {
        // LangVal, LangVal -> JSBoolean
        if (x === y) {
            return true
        }
        x = force_all(x)
        y = force_all(y)
        if (x === y) {
            return true
        }
        const x_type = type_of(x)
        const y_type = type_of(y)
        if (x_type !== y_type) {
            return false
        }

        function end_2(f1, f2) {
            if (jsbool_equal_p(f1(x), f1(y)) && jsbool_equal_p(f2(x), f2(y))) {
                lang_set_do(x, y)
                return true
            } else {
                return false
            }
        }
        switch (x_type) {
            case null_t:
                lang_set_do(x, null_v)
                lang_set_do(y, null_v)
                return true
            case symbol_t:
                return symbol_eq_p(x, y)
            case cons_t:
                return end_2(cons_car, cons_cdr)
            case error_t:
                return end_2(error_name, error_list)
            case data_t:
                return end_2(data_name, data_list)
            default:
        }
        ERROR()
    }
    exports.equal_p = jsbool_equal_p

    function langbool_equal_p(x, y) {
        return builtin_func_apply(builtin_func_equal_sym, [x, y])
    }

    function jsbool_no_force_equal_p(x, y) {
        // LangVal, LangVal -> JSBoolean
        if (x === y) {
            return true
        }
        x = un_just_all(x)
        y = un_just_all(y)
        if (x === y) {
            return true
        }
        const x_type = type_of(x)
        const y_type = type_of(y)
        if (x_type !== y_type) {
            return false
        }

        function end_2(f1, f2) {
            if (jsbool_no_force_equal_p(f1(x), f1(y)) && jsbool_no_force_equal_p(f2(x), f2(y))) {
                lang_set_do(x, y)
                return true
            } else {
                return false
            }
        }
        switch (x_type) {
            case null_t:
                lang_set_do(x, null_v)
                lang_set_do(y, null_v)
                return true
            case symbol_t:
                return symbol_eq_p(x, y)
            case cons_t:
                return end_2(cons_car, cons_cdr)
            case error_t:
                return end_2(error_name, error_list)
            case data_t:
                return end_2(data_name, data_list)

            case delay_eval_t:
                return false; //WIP
            case delay_builtin_func_t:
                return false; //WIP
            case delay_builtin_form_t:
                return false; //WIP
            case delay_apply_t:
                return false; //WIP
            default:
        }
        ERROR()
    }

    // {{{ 相對獨立的部分。parser/printer
    function make_printer(forcer) {
        function print(x) {
            // LangVal -> JSString
            // [[[ 大量重複代碼 print <-> complex_print
            x = forcer(x)
            let temp = ""
            let prefix = ""
            switch (type_of(x)) {
                case null_t:
                    return "()"
                case cons_t:
                    temp = "("
                    prefix = ""
                    while (cons_p(x)) {
                        temp += prefix + print(cons_car(x))
                        prefix = " "
                        x = forcer(cons_cdr(x))
                    }
                    if (null_p(x)) {
                        temp += ")"
                    } else {
                        temp += " . " + print(x) + ")"
                    }
                    return temp
                case data_t:
                    return "#" + print(new_cons(data_name(x), data_list(x)))
                case error_t:
                    return "!" + print(new_cons(error_name(x), error_list(x)))
                case symbol_t:
                    return un_symbol(x)
                case delay_eval_t:
                    return "$(" + print(env2val(delay_eval_env(x))) + " " + print(delay_eval_x(x)) + ")"
                case delay_builtin_func_t:
                    return "%(" + print(delay_builtin_func_f(x)) + " " + print(jslist2list(delay_builtin_func_xs(x))) + ")"
                case delay_builtin_form_t:
                    return "@(" + print(env2val(delay_builtin_form_env(x))) + " " + print(delay_builtin_form_f(x)) + " " + print(jslist2list(delay_builtin_form_xs(x))) + ")"
                case delay_apply_t:
                    return "^(" + print(delay_apply_f(x)) + " " + print(jslist2list(delay_apply_xs(x))) + ")"
                default:
            }
            ERROR()
            // 大量重複代碼 print <-> complex_print ]]]
        }
        return print
    }
    const print = make_printer(un_just_all)
    const print_force_rec = make_printer(force_all)
    exports.print_force_rec = print_force_rec
    exports.print = print

    function read(x) {
        // JSString -> LangVal
        // [[[ 大量重複代碼 read <-> complex_parse
        let state = x.split(""); // State : List Char
        function eof() {
            return state.length === 0
        }

        function get() {
            return state.shift()
        }

        function put(x) {
            state.unshift(x)
        }

        function error(): never {
            throw "TheLanguage parse ERROR!"
        }

        function a_space_p(x) {
            return x === " " || x === "\n" || x === "\t" || x === "\r"
        }

        function space() {
            const p = a_space_p
            if (eof()) {
                return false
            }
            let x = get()
            if (!p(x)) {
                put(x)
                return false
            }
            while (p(x) && !eof()) {
                x = get()
            }
            if (!p(x)) {
                put(x)
            }
            return true
        }

        function symbol() {
            const p = a_symbol_p
            if (eof()) {
                return false
            }
            let x = get()
            let ret = ""
            if (!p(x)) {
                put(x)
                return false
            }
            while (p(x) && !eof()) {
                ret += x
                x = get()
            }
            if (p(x)) {
                ret += x
            } else {
                put(x)
            }
            return new_symbol(ret)
        }

        function list() {
            if (eof()) {
                return false
            }
            let x = get()
            if (x !== "(") {
                put(x)
                return false
            }
            let ret = null

            function set_last(lst) {
                if (ret === null) {
                    ret = lst
                    return
                }
                let x = ret
                while (true) {
                    if (!cons_p(x)) {
                        ERROR()
                    }
                    const d = cons_cdr(x)
                    if (d === null) {
                        break
                    }
                    x = cons_cdr(x)
                }
                if (!cons_p(x)) {
                    ERROR()
                }
                if (x[2] !== null) {
                    ERROR()
                }
                x[2] = lst; // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
            }

            function last_add(x) {
                set_last(new_cons(x, null))
            }
            while (true) {
                space()
                if (eof()) {
                    error()
                }
                x = get()
                if (x === ")") {
                    set_last(null_v)
                    return ret
                }
                if (x === ".") {
                    space()
                    const e = val()
                    if (e === false) {
                        error()
                    }
                    set_last(e)
                    space()
                    if (eof()) {
                        error()
                    }
                    x = get()
                    if (x !== ")") {
                        error()
                    }
                    return ret
                }
                put(x)
                const e = val()
                if (e === false) {
                    error()
                }
                last_add(e)
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
            const xs = list()
            if (xs === false) {
                error()
            }
            if (!cons_p(xs)) {
                error()
            }
            return new_data(cons_car(xs), cons_cdr(xs))
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
            const xs = list()
            if (xs === false) {
                error()
            }
            if (!cons_p(xs)) {
                error()
            }
            return new_error(cons_car(xs), cons_cdr(xs))
        }

        function make_read_two(prefix, k) {
            return function() {
                if (eof()) {
                    return false
                }
                let x = get()
                if (x !== prefix) {
                    put(x)
                    return false
                }
                const xs = list()
                if (xs === false) {
                    error()
                }
                if (!cons_p(xs)) {
                    error()
                }
                x = cons_cdr(xs)
                if (!(cons_p(x) && null_p(cons_cdr(x)))) {
                    error()
                }
                return k(cons_car(xs), cons_car(x))
            }
        }

        function make_read_three(prefix, k) {
            return function() {
                if (eof()) {
                    return false
                }
                let x = get()
                if (x !== prefix) {
                    put(x)
                    return false
                }
                const xs = list()
                if (xs === false) {
                    error()
                }
                if (!cons_p(xs)) {
                    error()
                }
                x = cons_cdr(xs)
                if (!cons_p(x)) {
                    error()
                }
                const x_d = cons_cdr(x)
                if (!(cons_p(x_d) && null_p(cons_cdr(x_d)))) {
                    error()
                }
                return k(cons_car(xs), cons_car(x), cons_car(x_d))
            }
        }
        const readeval = make_read_two("$", function(e, x) {
            const env = val2env(e)
            if (env === false) {
                error()
            }
            return lang_eval(env, x)
        })
        const readfuncapply = make_read_two("%", function(f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            return builtin_func_apply(f, jsxs)
        })
        const readformbuiltin = make_read_three("@", function(e, f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            const env = val2env(e)
            if (env === false) {
                error()
            }
            return builtin_form_apply(env, f, jsxs)
        })
        const readapply = make_read_two("^", function(f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            return lang_apply(f, jsxs)
        })

        function a_symbol_p(x) {
            if (a_space_p(x)) {
                return false
            }
            const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@", '~', '/', '-', '>', '_', ':', '?', '[', ']', '&']
            for (let i = 0; i < not_xs.length; i++) {
                if (x == not_xs[i]) {
                    return false
                }
            }
            return true
        }

        function val() {
            space()
            const fs = [list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply]
            for (let i = 0; i < fs.length; i++) {
                const x = fs[i]()
                if (x !== false) {
                    return x
                }
            }
            error()
        }
        return val()
        // 大量重複代碼 read <-> complex_parse ]]]
    }
    exports.read = read
    // 相對獨立的部分。parser/printer }}}

    // {{{ 相對獨立的部分。complex parser/complex printer
    function complex_parse(x) {
        // JSString -> LangVal
        // [[[ 大量重複代碼 read <-> complex_parse
        let state = x.split(""); // State : List Char
        function eof() {
            return state.length === 0
        }

        function get() {
            return state.shift()
        }

        function put(x) {
            state.unshift(x)
        }

        function error(): never {
            throw "TheLanguage parse ERROR!"
        }

        function a_space_p(x) {
            return x === " " || x === "\n" || x === "\t" || x === "\r"
        }

        function space() {
            const p = a_space_p
            if (eof()) {
                return false
            }
            let x = get()
            if (!p(x)) {
                put(x)
                return false
            }
            while (p(x) && !eof()) {
                x = get()
            }
            if (!p(x)) {
                put(x)
            }
            return true
        }

        function symbol() {
            const p = a_symbol_p
            if (eof()) {
                return false
            }
            let x = get()
            let ret = ""
            if (!p(x)) {
                put(x)
                return false
            }
            while (p(x) && !eof()) {
                ret += x
                x = get()
            }
            if (p(x)) {
                ret += x
            } else {
                put(x)
            }
            return new_symbol(ret)
        }

        function list() {
            if (eof()) {
                return false
            }
            let x = get()
            if (x !== "(") {
                put(x)
                return false
            }
            let ret = null

            function set_last(lst) {
                if (ret === null) {
                    ret = lst
                    return
                }
                let x = ret
                while (true) {
                    if (!cons_p(x)) {
                        ERROR()
                    }
                    const d = cons_cdr(x)
                    if (d === null) {
                        break
                    }
                    x = cons_cdr(x)
                }
                if (!cons_p(x)) {
                    ERROR()
                }
                if (x[2] !== null) {
                    ERROR()
                }
                x[2] = lst; // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
            }

            function last_add(x) {
                set_last(new_cons(x, null))
            }
            while (true) {
                space()
                if (eof()) {
                    error()
                }
                x = get()
                if (x === ")") {
                    set_last(null_v)
                    return ret
                }
                if (x === ".") {
                    space()
                    const e = val()
                    if (e === false) {
                        error()
                    }
                    set_last(e)
                    space()
                    if (eof()) {
                        error()
                    }
                    x = get()
                    if (x !== ")") {
                        error()
                    }
                    return ret
                }
                put(x)
                const e = val()
                if (e === false) {
                    error()
                }
                last_add(e)
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
            const xs = list()
            if (xs === false) {
                error()
            }
            if (!cons_p(xs)) {
                error()
            }
            return new_data(cons_car(xs), cons_cdr(xs))
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
            const xs = list()
            if (xs === false) {
                error()
            }
            if (!cons_p(xs)) {
                error()
            }
            return new_error(cons_car(xs), cons_cdr(xs))
        }

        function make_read_two(prefix, k) {
            return function() {
                if (eof()) {
                    return false
                }
                let x = get()
                if (x !== prefix) {
                    put(x)
                    return false
                }
                const xs = list()
                if (xs === false) {
                    error()
                }
                if (!cons_p(xs)) {
                    error()
                }
                x = cons_cdr(xs)
                if (!(cons_p(x) && null_p(cons_cdr(x)))) {
                    error()
                }
                return k(cons_car(xs), cons_car(x))
            }
        }

        function make_read_three(prefix, k) {
            return function() {
                if (eof()) {
                    return false
                }
                let x = get()
                if (x !== prefix) {
                    put(x)
                    return false
                }
                const xs = list()
                if (xs === false) {
                    error()
                }
                if (!cons_p(xs)) {
                    error()
                }
                x = cons_cdr(xs)
                if (!cons_p(x)) {
                    error()
                }
                const x_d = cons_cdr(x)
                if (!(cons_p(x_d) && null_p(cons_cdr(x_d)))) {
                    error()
                }
                return k(cons_car(xs), cons_car(x), cons_car(x_d))
            }
        }
        const readeval = make_read_two("$", function(e, x) {
            const env = val2env(e)
            if (env === false) {
                error()
            }
            return lang_eval(env, x)
        })
        const readfuncapply = make_read_two("%", function(f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            return builtin_func_apply(f, jsxs)
        })
        const readformbuiltin = make_read_three("@", function(e, f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            const env = val2env(e)
            if (env === false) {
                error()
            }
            return builtin_form_apply(env, f, jsxs)
        })
        const readapply = make_read_two("^", function(f, xs) {
            const jsxs = list2jslist(xs, (xs) => xs, (xs, y) => error())
            return lang_apply(f, jsxs)
        })

        function a_symbol_p(x) {
            if (a_space_p(x)) {
                return false
            }
            const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@", '~', '/', '-', '>', '_', ':', '?', '[', ']', '&']
            for (let i = 0; i < not_xs.length; i++) {
                if (x == not_xs[i]) {
                    return false
                }
            }
            return true
        }

        function val() {
            space()
            const fs = [list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply]
            for (let i = 0; i < fs.length; i++) {
                const x = fs[i]()
                if (x !== false) {
                    return x
                }
            }
            error()
        }
        return val()

        // 大量重複代碼 read <-> complex_parse ]]]

        function un_maybe(x) {
            if (x === false) {
                error()
            }
            return x
        }

        function not_eof() {
            return !eof()
        }

        function assert_get(c) {
            un_maybe(not_eof())
            un_maybe(get() === c)
        }

        function readsysname_no_pack() {
            if (eof()) {
                return false
            }
            const head = get()
            switch (head) {
                case '&':
                    {
                        un_maybe(not_eof())
                        const c0 = get()
                        if (c0 === ':') {
                            assert_get('>')
                            const x = readsysname_no_pack_inner_must()
                            return new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, x)), the_sym)
                        } else if (c0 === '+') {
                            const x = readsysname_no_pack_inner_must()
                            return new_list(form_sym, new_list(sys_sym, x))
                        } else {
                            put(c0)
                        }
                        const x = readsysname_no_pack_inner_must()
                        return new_list(form_sym, x)
                    }
                case ':':
                    {
                        un_maybe(not_eof())
                        const c0 = get()
                        if (c0 === '>') {
                            const x = readsysname_no_pack_inner_must()
                            return new_list(a_sym, new_list(func_sym, sth_sym, x), the_sym)
                        } else {
                            put(c0)
                        }
                        const x = readsysname_no_pack_inner_must()
                        return new_list(a_sym, x, sth_sym)
                    }
                case '+':
                    {
                        const x = readsysname_no_pack_inner_must()
                        return new_list(sys_sym, x)
                    }
                case '[':
                    {
                        const x = readsysname_no_pack_inner_must()
                        assert_get(']')
                        return may_xfx_xf(x)
                    }
                default:
                    {
                        put(head)
                        const x = symbol()
                        if (x === false) {
                            return false
                        }
                        return may_xfx_xf(x)
                    }
            }
            ERROR()

            function readsysname_no_pack_inner_must(strict = false) {
                function readsysname_no_pack_bracket() {
                    assert_get('[')
                    const x = readsysname_no_pack_inner_must()
                    assert_get(']')
                    return x
                }
                const fs =
                    strict ? [list, symbol, readsysname_no_pack_bracket, data, readerror, readeval, readfuncapply, readformbuiltin, readapply] : [list, readsysname_no_pack, data, readerror, readeval, readfuncapply, readformbuiltin, readapply]
                for (let i = 0; i < fs.length; i++) {
                    const x = fs[i]()
                    if (x !== false) {
                        return x
                    }
                }
                error()
            }

            function may_xfx_xf(x) {
                if (eof()) {
                    return x
                }
                const head = get()
                switch (head) {
                    case '.':
                        {
                            const y = readsysname_no_pack_inner_must()
                            return new_list(a_sym, new_list(func_sym, new_list(x), sth_sym), y)
                        }
                    case ':':
                        {
                            const y = readsysname_no_pack_inner_must()
                            return new_list(a_sym, y, x)
                        }
                    case '~':
                        {
                            return new_list(isornot_sym, x)
                        }
                    case '@':
                        {
                            const y = readsysname_no_pack_inner_must()
                            return new_list(a_sym, new_list(func_sym, new_cons(x, sth_sym), sth_sym), y)
                        }
                    case '?':
                        {
                            return new_list(a_sym, func_sym, new_list(isornot_sym, x))
                        }
                    case '/':
                        {
                            let ys = []
                            while (true) {
                                const y = readsysname_no_pack_inner_must(true)
                                ys.push(y)
                                if (eof()) {
                                    break
                                }
                                const c0 = get()
                                if (c0 !== '/') {
                                    put(c0)
                                    break
                                }
                            }
                            return new_list(sub_sym, x, jslist2list(ys))
                        }
                    default:
                        {
                            put(head)
                            return x
                        }
                }
                ERROR()
            }
            ERROR()
        }

        function readsysname() {
            const x = readsysname_no_pack()
            if (x === false) {
                return false
            }
            if (symbol_p(x)) {
                return x
            }
            return make_sys_sym_f(x)
        }
    }

    function complex_print(val) {
        // LangVal -> JSString
        function print_sys_name(x, where) {
            // 是 complex_print(make_sys_sym_f(x))
            // x : LangVal
            // inner : JSBoolean
            if (symbol_p(x)) {
                return un_symbol(x)
            }

            function inner_bracket(x) {
                if (where === 'inner') {
                    return '[' + x + ']'
                } else if (where === 'top') {
                    return x
                }
                ERROR()
            }
            const maybe_xs = maybe_list2js(x)
            if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], a_sym)) {
                // new_list(a_sym, maybe_xs[1], maybe_xs[2])
                const maybe_lst_2 = maybe_list2js(maybe_xs[1])
                if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], func_sym)) {
                    // new_list(a_sym, new_list(func_sym, maybe_lst_2[1], maybe_lst_2[2]), maybe_xs[2])
                    const maybe_lst_3 = maybe_list2js(maybe_lst_2[1])
                    if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], sth_sym)) {
                        // new_list(a_sym, new_list(func_sym, new_list(maybe_lst_3[0]), sth_sym), maybe_xs[2])
                        return inner_bracket(print_sys_name(maybe_lst_3[0], 'inner') + '.' + print_sys_name(maybe_xs[2], 'inner'))
                    } else if (cons_p(maybe_lst_2[1]) && jsbool_no_force_equal_p(cons_cdr(maybe_lst_2[1]), sth_sym) && jsbool_no_force_equal_p(maybe_lst_2[2], sth_sym)) {
                        // new_list(a_sym, new_list(func_sym, new_cons(cons_car(maybe_lst_2[1]), sth_sym), sth_sym), maybe_xs[2])
                        return inner_bracket(print_sys_name(cons_car(maybe_lst_2[1]), 'inner') + '@' + print_sys_name(maybe_xs[2], 'inner'))
                    } else if (jsbool_no_force_equal_p(maybe_lst_2[1], sth_sym) && jsbool_no_force_equal_p(maybe_xs[2], the_sym)) {
                        // new_list(a_sym, new_list(func_sym, sth_sym, maybe_lst_2[2]), the_sym)
                        return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], 'inner'))
                    }
                }
                const maybe_lst_44 = maybe_list2js(maybe_xs[2])
                if (jsbool_no_force_equal_p(maybe_xs[1], func_sym) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isornot_sym)) {
                    // new_list(a_sym, func_sym, new_list(isornot_sym, maybe_lst_44[1]))
                    const maybe_lst_45 = maybe_list2js(maybe_lst_44[1])
                    return inner_bracket(print_sys_name(maybe_lst_44[1], 'inner') + '?')
                }
                if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], the_sym) && jsbool_no_force_equal_p(maybe_lst_2[0], form_sym)) {
                    // new_list(a_sym, new_list(form_sym, maybe_lst_2[1]), the_sym)
                    const maybe_lst_88 = maybe_list2js(maybe_lst_2[1])
                    if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], func_sym) && jsbool_no_force_equal_p(maybe_lst_88[1], sth_sym)) {
                        // new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, maybe_lst_88[2])), the_sym)
                        return inner_bracket('&:>' + print_sys_name(maybe_lst_88[2], 'inner'))
                    }
                }
                return inner_bracket((jsbool_no_force_equal_p(maybe_xs[2], sth_sym) ? '' : print_sys_name(maybe_xs[2], 'inner')) + ':' + print_sys_name(maybe_xs[1], 'inner'))
            } else if (maybe_xs !== false && maybe_xs.length === 2) {
                if (jsbool_no_force_equal_p(maybe_xs[0], form_sym)) {
                    // new_list(form_sym, maybe_xs[1])
                    const maybe_lst_288 = maybe_list2js(maybe_xs[1])
                    if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], sys_sym)) {
                        // new_list(form_sym, new_list(sys_sym, maybe_lst_288[1]))
                        return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], 'inner'))
                    }
                    return inner_bracket('&' + print_sys_name(maybe_xs[1], 'inner'))
                } else if (jsbool_no_force_equal_p(maybe_xs[0], isornot_sym)) {
                    // new_list(isornot_sym, maybe_xs[1])
                    return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + '~')
                } else if (jsbool_no_force_equal_p(maybe_xs[0], sys_sym)) {
                    // new_list(sys_sym, maybe_xs[1])
                    return inner_bracket('+' + print_sys_name(maybe_xs[1], 'inner'))
                }
            } else if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], sub_sym)) {
                // new_list(sub_sym, maybe_xs[1], maybe_xs[2])
                const maybe_lst_8934 = maybe_list2js(maybe_xs[2])
                if (maybe_lst_8934 !== false && maybe_lst_8934.length !== 0) {
                    let tmp = ""
                    for (let i = 0; i < maybe_lst_8934.length; i++) {
                        tmp += '/' + print_sys_name(maybe_lst_8934[i], 'inner')
                    }
                    return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + tmp)
                }
            }
            if (where === 'inner') {
                return print(x)
            } else if (where === 'top') {
                return print(make_sys_sym_f(x))
            }
            ERROR()
        }
        // [[[ 大量重複代碼 print <-> complex_print
        let x = read(print(val)); // 去除所有just
        let temp = ""
        let prefix = ""
        switch (type_of(x)) {
            case null_t:
                return "()"
            case cons_t:
                temp = "("
                prefix = ""
                while (cons_p(x)) {
                    temp += prefix + complex_print(cons_car(x))
                    prefix = " "
                    x = cons_cdr(x)
                }
                if (null_p(x)) {
                    temp += ")"
                } else {
                    temp += " . " + complex_print(x) + ")"
                }
                return temp
            case data_t:
                const name = data_name(x)
                const list = data_list(x)
                const maybe_xs = maybe_list2js(list)
                if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_sym) && jsbool_no_force_equal_p(maybe_xs[0], sys_sym)) {
                    // make_sys_sym_f(maybe_xs[1])
                    return print_sys_name(maybe_xs[1], 'top')
                }
                return "#" + complex_print(new_cons(name, list))
            case error_t:
                return "!" + complex_print(new_cons(error_name(x), error_list(x)))
            case symbol_t:
                return un_symbol(x)
            case delay_eval_t:
                return "$(" + complex_print(env2val(delay_eval_env(x))) + " " + complex_print(delay_eval_x(x)) + ")"
            case delay_builtin_func_t:
                return "%(" + complex_print(delay_builtin_func_f(x)) + " " + complex_print(jslist2list(delay_builtin_func_xs(x))) + ")"
            case delay_builtin_form_t:
                return "@(" + complex_print(env2val(delay_builtin_form_env(x))) + " " + complex_print(delay_builtin_form_f(x)) + " " + complex_print(jslist2list(delay_builtin_form_xs(x))) + ")"
            case delay_apply_t:
                return "^(" + complex_print(delay_apply_f(x)) + " " + complex_print(jslist2list(delay_apply_xs(x))) + ")"
            default:
        }
        ERROR()
        // 大量重複代碼 print <-> complex_print ]]]
    }
    exports.complex_parse = complex_parse
    exports.complex_print = complex_print

    // 相對獨立的部分。complex parser/complex printer }}}

    // {{{ 相對獨立的部分。IO

    exports.symbols.io = {}
    const io_return_sym = complex_parse('效應/[:物]')
    exports.symbols.io.return = io_return_sym
    const io_bind_sym = complex_parse('效應/連')
    exports.symbols.io.bind = io_bind_sym
    //WIP

    // 相對獨立的部分。IO }}}

    return exports
})()
if (exports) {
    for (const key in TheLanguage) {
        exports[key] = TheLanguage[key]
    }
}
