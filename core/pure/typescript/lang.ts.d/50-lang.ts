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

// 註疏系統WIP
function force_uncomment_list_1<T>(list: LangVal, not_list_k: () => T, delay_just_k: () => T, k: (comments: Array<LangVal>, ret: Array<LangVal>) => T): T {
    let ret: Array<LangVal> = []
    let comments: Array<LangVal> = []
    let i: LangVal = un_just_all(list)
    let not_forced: boolean = true
    while (true) {
        if (null_p(i)) {
            return k(comments, ret)
        } else if (comment_p(i)) {
            comments.push(comment_comment(i))
            i = comment_x(i)
        } else if (construction_p(i)) {
            ret.push(construction_head(i))
            i = construction_tail(i)
        } else if (delay_just_p(i)) {
            if (not_forced) {
                not_forced = false
                i = force1(i)
            } else {
                return delay_just_k()
            }
        } else {
            return not_list_k()
        }
    }
}
function real_evaluate(env: Env, raw: LangVal, selfvalraw: LangVal): LangVal {
    const x = force1(raw)
    if (delay_just_p(x)) {
        return selfvalraw
    }
    const error_v = () => new_error(system_symbol,
        new_list(
            function_builtin_use_systemName,
            new_list(
                evaluate_function_builtin_systemName,
                new_list(env2val(env), x))))
    if (construction_p(x)) {
        return force_uncomment_list_1(x, error_v, () => selfvalraw, (comments, xs) => {
            if (comments.length !== 0) {
                throw 'WIP'
            }
            // WIP delay未正確處理(影響較小)
            if (jsbool_equal_p(xs[0], form_builtin_use_systemName)) {
                if (xs.length === 1) {
                    return error_v()
                }
                const f = xs[1]
                const args: Array<LangVal> = []
                for (let i = 2; i < xs.length; i++) {
                    args.push(xs[i])
                }
                return builtin_form_apply(env, f, args)
            } else if (jsbool_equal_p(xs[0], form_use_systemName)) {
                if (xs.length === 1) {
                    return error_v()
                }
                // WIP delay未正確處理(影響較小)
                const f = force_all(evaluate(env, xs[1]))
                if (!data_p(f)) {
                    return error_v()
                }
                const f_type = force1(data_name(f))
                if (delay_just_p(f_type)) {
                    return selfvalraw
                }
                if (!symbol_p(f_type)) {
                    return error_v()
                }
                if (!symbol_equal_p(f_type, form_symbol)) {
                    return error_v()
                }
                const f_list = force1(data_list(f))
                if (delay_just_p(f_list)) {
                    return selfvalraw
                }
                if (!construction_p(f_list)) {
                    return error_v()
                }
                const f_x = construction_head(f_list)
                const f_list_cdr = force1(construction_tail(f_list))
                if (delay_just_p(f_list_cdr)) {
                    return selfvalraw
                }
                if (!null_p(f_list_cdr)) {
                    return error_v()
                }
                const args = [env2val(env)]
                for (let i = 2; i < xs.length; i++) {
                    args.push(xs[i])
                }
                return apply(f_x, args)
            } else if (jsbool_equal_p(xs[0], function_builtin_use_systemName)) {
                if (xs.length === 1) {
                    return error_v()
                }
                const f = xs[1]
                const args: Array<LangVal> = []
                for (let i = 2; i < xs.length; i++) {
                    args.push(evaluate(env, xs[i]))
                }
                return builtin_func_apply(f, args)
            } else {
                const f = evaluate(env, xs[0])
                const args: Array<LangVal> = []
                for (let i = 1; i < xs.length; i++) {
                    args.push(evaluate(env, xs[i]))
                }
                return apply(f, args)
            }
        })
    } else if (null_p(x)) {
        return x
    } else if (name_p(x)) {
        return env_get(env, x, error_v())
    } else if (error_p(x)) {
        return error_v()
    }
    return LANG_ERROR()
}

function name_p(x: LangVal): x is LangValName {
    return symbol_p(x) || data_p(x)
}
function make_builtin_p_func(p_sym: LangValSysName, p_jsfunc: (x: LangVal) => boolean)
    : [LangValSysName, 1, (x: LangVal) => LangVal] {
    return [p_sym,
        1,
        (x) => {
            x = force1(x)
            if (delay_just_p(x)) {
                return builtin_func_apply(p_sym, [x])
            }
            if (p_jsfunc(x)) {
                return true_v
            }
            return false_v
        }]
}

function make_builtin_get_func<T extends LangVal>(f_sym: LangValSysName, p_jsfunc: (x: LangVal) => x is T, f_jsfunc: (x: T) => LangVal)
    : [LangValSysName, 1, (x: LangVal, error_v: () => LangVal) => LangVal] {
    return [f_sym,
        1,
        (x, error_v) => {
            x = force1(x)
            if (delay_just_p(x)) {
                return builtin_func_apply(f_sym, [x])
            }
            if (p_jsfunc(x)) {
                return f_jsfunc(x)
            }
            return error_v()
        }]
}
type real_builtin_func_apply_T =
    [LangValSysName, 1, (x: LangVal, error_v: () => LangVal, self_v: LangVal) => LangVal] |
    [LangValSysName, 2, (x: LangVal, y: LangVal, error_v: () => LangVal, self_v: LangVal) => LangVal] |
    [LangValSysName, 3, (x: LangVal, y: LangVal, z: LangVal, error_v: () => LangVal, self_v: LangVal) => LangVal]

// 註疏系統WIP
const real_builtin_func_apply_s: Array<real_builtin_func_apply_T> = [
    make_builtin_p_func(data_p_function_builtin_systemName, data_p),
    [new_data_function_builtin_systemName, 2, new_data],
    make_builtin_get_func(data_name_function_builtin_systemName, data_p, data_name),
    make_builtin_get_func(data_list_function_builtin_systemName, data_p, data_list),

    make_builtin_p_func(error_p_function_builtin_systemName, error_p),
    [new_error_function_builtin_systemName, 2, new_error],
    make_builtin_get_func(error_name_function_builtin_systemName, error_p, error_name),
    make_builtin_get_func(error_list_function_builtin_systemName, error_p, error_list),

    make_builtin_p_func(null_p_function_builtin_systemName, null_p),
    [new_construction_function_builtin_systemName, 2, new_construction],
    make_builtin_p_func(construction_p_function_builtin_systemName, construction_p),
    make_builtin_get_func(construction_head_function_builtin_systemName, construction_p, construction_head),
    make_builtin_get_func(construction_tail_function_builtin_systemName, construction_p, construction_tail),

    [equal_p_function_builtin_systemName, 2, (x: LangVal, y: LangVal, error_v: () => LangVal) => {
        if (x === y) {
            return true_v
        }
        x = force1(x)
        y = force1(y)
        if (delay_just_p(x) || delay_just_p(y)) {
            return builtin_func_apply(equal_p_function_builtin_systemName, [x, y]) // not fully implemented -- Halting
        }
        if (x === y) {
            return true_v
        }
        function H_if(b: LangVal, xx: LangVal, yy: LangVal): LangVal {
            // H = helper
            return builtin_func_apply(if_function_builtin_systemName, [b, xx, yy])
        }
        function H_and(xx: LangVal, yy: LangVal): LangVal {
            return H_if(xx, yy, false_v)
        }
        LANG_ASSERT(!delay_just_p(x))
        function end_2<T extends LangVal>(xx: T, yy: T, f1: (x: T) => LangVal, f2: (x: T) => LangVal): LangVal {
            return H_and(
                builtin_func_apply(equal_p_function_builtin_systemName, [f1(xx), f1(yy)]),
                builtin_func_apply(equal_p_function_builtin_systemName, [f2(xx), f2(yy)]))
        }
        if (null_p(x)) {
            if (!null_p(x)) { return false_v }
            return true_v
        } else if (symbol_p(x)) {
            if (!symbol_p(y)) { return false_v }
            if (symbol_equal_p(x, y)) {
                return true_v
            } else {
                return false_v
            }
        } else if (data_p(x)) {
            if (!data_p(y)) { return false_v }
            return end_2(x, y, data_name, data_list)
        } else if (construction_p(x)) {
            if (!construction_p(y)) { return false_v }
            return end_2(x, y, construction_head, construction_tail)
        } else if (error_p(x)) {
            if (!error_p(y)) { return false_v }
            return end_2(x, y, error_name, error_list)
        }
        return LANG_ERROR()
    }],
    [apply_function_builtin_systemName, 2, (f: LangVal, xs: LangVal, error_v: () => LangVal) => {
        // WIP delay未正確處理(影響較小)
        let jslist: Array<LangVal> = []
        let iter: LangVal = force_all(xs)
        while (construction_p(iter)) {
            jslist.push(construction_head(iter))
            iter = force_all(construction_tail(iter))
        }
        if (!null_p(iter)) {
            return error_v()
        }
        return apply(f, jslist)
    }],
    [evaluate_function_builtin_systemName, 2, (env: LangVal, x: LangVal, error_v: () => LangVal) => {
        // WIP delay未正確處理(影響較小)
        const maybeenv = val2env(env)
        if (maybeenv === false) {
            return error_v()
        }
        return evaluate(maybeenv, x)
    }],

    make_builtin_p_func(symbol_p_function_builtin_systemName, symbol_p),

    [list_chooseOne_function_builtin_systemName, 1, (xs: LangVal, error_v: () => LangVal) => {
        // 一般返回第一个，可以因为优化返回其他的任意一个
        // xs可以無限長，不判斷是否真的是list
        xs = force1(xs)
        if (delay_just_p(xs)) {
            return builtin_func_apply(list_chooseOne_function_builtin_systemName, [xs])
        }
        if (!construction_p(xs)) {
            return error_v()
        }
        return construction_head(xs)
    }],

    [if_function_builtin_systemName, 3, (b: LangVal, x: LangVal, y: LangVal, error_v: () => LangVal) => {
        b = force1(b)
        if (delay_just_p(b)) {
            return builtin_func_apply(if_function_builtin_systemName, [b, x, y])
        }
        if (!data_p(b)) {
            return error_v()
        }
        // WIP delay未正確處理(影響較小)
        const nam = force_all(data_name(b))
        if (!symbol_p(nam)) {
            return error_v()
        }
        if (symbol_equal_p(nam, true_symbol)) {
            return x
        }
        if (symbol_equal_p(nam, false_symbol)) {
            return y
        }
        return error_v()
    }],

    [comment_function_builtin_systemName, 2, new_comment],
]
// 註疏系統WIP
function real_apply(f: LangVal, xs: Array<LangVal>, selfvalraw: LangVal): LangVal {
    // WIP delay未正確處理(影響較小)
    const error_v = () => new_error(system_symbol,
        new_list(
            function_builtin_use_systemName,
            new_list(
                apply_function_builtin_systemName,
                new_list(f, jsArray_to_list(xs)))))
    f = force1(f)
    if (delay_just_p(f)) {
        return selfvalraw
    }
    if (!data_p(f)) {
        return error_v()
    }
    const f_type = force_all(data_name(f))
    if (!(symbol_p(f_type) && symbol_equal_p(f_type, function_symbol))) {
        return error_v()
    }
    const f_list = force_all(data_list(f))
    if (!construction_p(f_list)) {
        return error_v()
    }
    let args_pat = force_all_rec(construction_head(f_list))
    const f_list_cdr = force_all(construction_tail(f_list))
    if (!(construction_p(f_list_cdr) && null_p(force_all(construction_tail(f_list_cdr))))) {
        return error_v()
    }
    const f_code = construction_head(f_list_cdr)
    let env: Env = env_null_v

    let xs_i = 0
    while (!null_p(args_pat)) {
        if (name_p(args_pat)) {
            let x: LangVal = null_v
            for (let i = xs.length - 1; i >= xs_i; i--) {
                x = new_construction(xs[i], x)
            }
            env = env_set(env, args_pat, x)
            xs_i = xs.length
            args_pat = null_v
        } else if (construction_p(args_pat)) {
            if (xs_i < xs.length) {
                const x: LangVal = xs[xs_i]
                xs_i++
                env = env_set(env, construction_head(args_pat), x)
                args_pat = construction_tail(args_pat)
            } else {
                return error_v()
            }
        } else {
            return error_v()
        }
    }
    if (xs.length !== xs_i) {
        return error_v()
    }
    return evaluate(env, f_code)
}

// 註疏系統WIP
function real_builtin_func_apply(f: LangVal, xs: Array<LangVal>, selfvalraw: LangVal): LangVal {
    const error_v = () => new_error(system_symbol,
        new_list(function_builtin_use_systemName,
            new_list(f, jsArray_to_list(xs))))
    for (const xx of real_builtin_func_apply_s) {
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(f, xx[0])) {
            if (xs.length !== xx[1]) {
                return error_v()
            }
            if (xx[1] === 1) {
                return xx[2](xs[0], error_v, selfvalraw)
            } else if (xx[1] === 2) {
                return xx[2](xs[0], xs[1], error_v, selfvalraw)
            } else if (xx[1] === 3) {
                return xx[2](xs[0], xs[1], xs[2], error_v, selfvalraw)
            }
            return LANG_ERROR()
        }
    }
    return error_v()
}

// 註疏系統WIP
function real_builtin_form_apply(env: Env, f: LangVal, xs: Array<LangVal>, selfvalraw: LangVal): LangVal {
    const error_v = () => new_error(system_symbol,
        new_list(form_builtin_use_systemName,
            new_list(env2val(env), f, jsArray_to_list(xs)))) // WIP delay未正確處理(影響較小)

    if (jsbool_equal_p(f, quote_form_builtin_systemName)) {
        if (xs.length !== 1) {
            return error_v()
        }
        return xs[0]
    } else if (jsbool_equal_p(f, lambda_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v()
        }
        return new_lambda(env, xs[0], xs[1], error_v)
    } else if (jsbool_equal_p(f, comment_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v()
        }
        return new_comment(xs[0], evaluate(env, xs[1]))
    }
    return error_v()
}

function make_quote(x: LangVal): LangVal {
    return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x)
}

// 註疏系統WIP
function new_lambda(
    env: Env,
    args_pat: LangVal,
    body: LangVal,
    error_v: () => LangVal): LangVal {
    // 允許返回不同的物--允許實現進行對所有實現有效的優化[比如:消除無用環境中的變量] TODO 未實現
    args_pat = force_all_rec(args_pat) // WIP delay未正確處理(影響較小)
    let args_pat_vars: Array<LangVal> = [] // : JSList LangVal/Name 順序有要求
    let args_pat_is_dot: boolean = false
    let args_pat_iter: LangVal = args_pat
    while (!null_p(args_pat_iter)) {
        if (name_p(args_pat_iter)) {
            args_pat_vars.push(args_pat_iter)
            args_pat_is_dot = true
            args_pat_iter = null_v
        } else if (construction_p(args_pat_iter)) {
            args_pat_vars.push(construction_head(args_pat_iter))
            args_pat_iter = construction_tail(args_pat_iter)
        } else {
            return error_v()
        }
    }
    let args_pat_vars_val
    // args_pat_vars_val總是等價與jsArray_to_list(args_pat_vars) : LangVal
    if (args_pat_is_dot) {
        args_pat_vars_val = jsArray_to_list(args_pat_vars)
    } else {
        args_pat_vars_val = args_pat
    }
    const env_vars: Array<LangVal> = [] // : JSList LangVal/Name
    env_foreach(env, (k, v) => {
        for (let i = 0; i < args_pat_vars.length; i++) {
            if (jsbool_equal_p(args_pat_vars[i], k)) {
                // WIP delay未正確處理(影響較小)
                return
            }
        }
        env_vars.push(k)
    })
    let new_args_pat = args_pat_vars_val // : LangVal
    for (let i = env_vars.length - 1; i >= 0; i--) {
        new_args_pat = new_construction(env_vars[i], new_args_pat)
    }
    let new_args = args_pat_vars_val // : LangVal
    for (let i = env_vars.length - 1; i >= 0; i--) {
        new_args = new_construction(make_quote(must_env_get(env, env_vars[i])), new_args)
    }
    return new_data(function_symbol, new_list(args_pat, new_construction(make_quote(new_data(function_symbol, new_list(new_args_pat, body))), new_args)))
}

// WIP delay未正確處理(影響較小)
function jsbool_equal_p(x: LangVal, y: LangVal): boolean {
    if (x === y) {
        return true
    }
    x = force_all(x)
    y = force_all(y)
    if (x === y) {
        return true
    }
    function end_2<T extends LangVal>(xx: T, yy: T, f1: (x: T) => LangVal, f2: (x: T) => LangVal): boolean {
        if (jsbool_equal_p(f1(xx), f1(yy)) && jsbool_equal_p(f2(xx), f2(yy))) {
            lang_set_do(xx, yy)
            return true
        } else {
            return false
        }
    }
    if (null_p(x)) {
        if (!null_p(y)) { return false }
        lang_set_do(x, null_v)
        lang_set_do(y, null_v)
        return true
    } else if (symbol_p(x)) {
        if (!symbol_p(y)) { return false }
        return symbol_equal_p(x, y)
    } else if (construction_p(x)) {
        if (!construction_p(y)) { return false }
        return end_2(x, y, construction_head, construction_tail)
    } else if (error_p(x)) {
        if (!error_p(y)) { return false }
        return end_2(x, y, error_name, error_list)
    } else if (data_p(x)) {
        if (!data_p(y)) { return false }
        return end_2(x, y, data_name, data_list)
    }
    return LANG_ERROR()
}
const equal_p = jsbool_equal_p
export { equal_p }

// 不允許比較delay。
function jsbool_no_force_equal_p(x: LangVal, y: LangVal): boolean {
    if (x === y) { return true }
    let stack1 = [x]
    let stack2 = [y]
    while (stack1.length !== 0) {
        if (stack1.length !== stack2.length) { return false }
        const ret1: Array<string> = []
        const ret2: Array<string> = []
        const new1: Array<LangVal> = []
        const new2: Array<LangVal> = []
        for (let i = 0; i < stack1.length; i++) {
            if (stack1[i] === stack2[i]) {
                //nothing
            } else {
                machinetext_print_step2_do(stack1[i], (v) => ret1.push(v), (v) => new1.push(v))
                machinetext_print_step2_do(stack2[i], (v) => ret2.push(v), (v) => new2.push(v))
            }
        }
        if (ret1.length !== ret2.length) { return false }
        for (let i = 0; i < ret1.length; i++) {
            if (ret1[i] !== ret2[i]) { return false }
        }
        stack1 = new1
        stack2 = new2
    }
    return stack2.length === 0
}
