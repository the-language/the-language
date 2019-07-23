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

// {{{ 相對獨立的部分。對內建數據結構的簡單處理
function jsArray_to_list(xs: Array<LangVal>): LangVal {
    let ret: LangVal = null_v
    for (let i = xs.length - 1; i >= 0; i--) {
        ret = new_construction(xs[i], ret)
    }
    return ret
}

function list_to_jsArray<T>(
    xs: LangVal,
    k_done: (p0: Array<LangVal>) => T,
    k_tail: (p0: Array<LangVal>, p1: LangVal) => T): T {
    let ret: Array<LangVal> = []
    while (construction_p(xs)) {
        ret.push(construction_head(xs))
        xs = construction_tail(xs)
    }
    if (null_p(xs)) {
        return k_done(ret)
    }
    return k_tail(ret, xs)
}

function maybe_list_to_jsArray(xs: LangVal): OrFalse<Array<LangVal>> {
    return list_to_jsArray<OrFalse<Array<LangVal>>>(xs, (x) => x, (_1, _2) => false)
}
function new_list(...xs: Array<LangVal>): LangVal {
    return jsArray_to_list(xs)
}
export { jsArray_to_list, maybe_list_to_jsArray, new_list }

function un_just_all(raw: LangVal): LangVal {
    if (!just_p(raw)) { return raw }
    let x: LangVal = raw
    let xs: Array<LangVal> = []
    while (just_p(x)) {
        xs.push(x)
        x = un_just(x)
    }

    for (const v of xs) {
        lang_assert_equal_set_do(v, x)
    }

    return x
}
function un_just_comment_all(x: LangVal): LangVal {
    while (just_p(x) || comment_p(x)) {
        x = un_just_all(un_comment_all(x))
    }
    return x
}
export { un_just_all, un_just_comment_all }

function delay_p(x: LangVal): x is LangValDelay {
    return delay_evaluate_p(x) ||
        delay_builtin_form_p(x) ||
        delay_builtin_func_p(x) ||
        delay_apply_p(x)
}
function delay_just_p(x: LangVal): x is LangValJustDelay {
    return just_p(x) || delay_p(x)
}
function lazy_p(x:LangVal):x is LangValLazy{
    return delay_just_p(x)||comment_p(x)
}
export { delay_p, delay_just_p,lazy_p }

function delay2delay_evaluate(x: LangValDelay): LangValDelayEvaluate {
    if (delay_evaluate_p(x)) {
        return x
    } else if (delay_builtin_form_p(x)) {
        throw 'WIP'
    } else if (delay_builtin_func_p(x)) {
        throw 'WIP'
    } else if (delay_apply_p(x)) {
        throw 'WIP'
    }
    return LANG_ERROR()
}
function delay_env(x: LangValDelay): Env {
    return delay_evaluate_env(delay2delay_evaluate(x))
}
function delay_x(x: LangValDelay): LangVal {
    return delay_evaluate_x(delay2delay_evaluate(x))
}
export { delay_env, delay_x }

// 註疏系統WIP : equal_p
function force_all_inner(
    raw: LangVal,
    parents_history: { [key: string]: true } = {},
    ref_novalue_replace: [boolean, boolean] = [false, false],
    xs: Array<LangVal> = []): LangVal {
    // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
    let history: { [key: string]: true } = {}
    let x: LangVal = raw
    function do_rewrite(newval: LangVal): LangVal {
        lang_assert_equal_set_do(x, newval)
        for (let i = 0; i < xs.length; i++) {
            lang_assert_equal_set_do(xs[i], newval)
        }
        return newval
    }
    function replace_this_with_stopped() {
        // 語言標準允許替換沒有值的東西為那種錯誤。
        ref_novalue_replace[1] = true
        return do_rewrite_force_all(the_world_stopped_v)
    }
    function do_rewrite_force_all(newval: LangVal) {
        do_rewrite(newval)
        if (delay_just_p(newval)) {
            xs.push(x)
            return force_all_inner(newval, parents_history, [false, false], xs)
        }
        return newval
    }
    function make_history() {
        let ret: { [key: string]: true } = {}
        for (const x_id in history) {
            ret[x_id] = true
        }
        for (const x_id in parents_history) {
            ret[x_id] = true
        }
        return ret
    }
    for (let i = 0; delay_just_p(x) && i < 32; i++) { // 一般情況
        xs.push(x)
        x = force1(x)
    }
    while (delay_just_p(x)) {
        const x_id = simple_print(x)
        if (parents_history[x_id] === true) {
            return replace_this_with_stopped()
        }
        if (history[x_id] === true) {
            ref_novalue_replace[0] = true // 減少替換範圍：(f <沒有值>) 的(f _)
            if (delay_evaluate_p(x)) {
                return replace_this_with_stopped() // 可能未減少應該減少的？
            } else if (delay_builtin_func_p(x)) {
                const f = delay_builtin_func_f(x) // LangVal/Name
                const xs = delay_builtin_func_xs(x) // JSList LangVal
                const elim_s = [data_name_function_builtin_systemName,
                    data_list_function_builtin_systemName,
                    data_p_function_builtin_systemName,
                    error_name_function_builtin_systemName,
                    error_list_function_builtin_systemName,
                    error_p_function_builtin_systemName,
                    construction_p_function_builtin_systemName,
                    construction_head_function_builtin_systemName,
                    construction_tail_function_builtin_systemName,
                    atom_p_function_builtin_systemName,
                    null_p_function_builtin_systemName]
                let is_elim = false
                for (const elim_s_v of elim_s) {
                    if (equal_p(elim_s_v, f)) {
                        is_elim = true
                        break
                    }
                }
                if (is_elim) {
                    LANG_ASSERT(xs.length === 1)
                    LANG_ASSERT(ref_novalue_replace[1] === false)
                    const inner = force_all_inner(xs[0], make_history(), ref_novalue_replace)
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(f, [inner]))
                    } else {
                        return LANG_ERROR() //我覺得沒有這種情況
                    }
                }
                if (equal_p(f, equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (equal_p(f, apply_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (equal_p(f, evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (equal_p(f, if_function_builtin_systemName)) {
                    LANG_ASSERT(xs.length === 3)
                    LANG_ASSERT(ref_novalue_replace[1] === false)
                    const tf = force_all_inner(xs[0], make_history(), ref_novalue_replace)
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(if_function_builtin_systemName, [tf, xs[1], xs[2]]))
                    } else {
                        return LANG_ERROR() //我覺得沒有這種情況
                    }
                }
                return LANG_ERROR() //我覺得沒有這種情況
            } else if (delay_builtin_form_p(x)) {
                return replace_this_with_stopped() // 可能未減少應該減少的？
            } else if (delay_apply_p(x)) {
                return replace_this_with_stopped() // 可能未減少應該減少的？
            }
            return LANG_ERROR()
        }
        history[x_id] = true
        xs.push(x)
        x = force1(x)
    }
    return do_rewrite(x)
}
function force1(raw: LangVal): LangVal {
    const x: LangVal = un_just_all(raw)
    let ret: LangVal
    LANG_ASSERT(!just_p(x))
    if (delay_evaluate_p(x)) {
        ret = real_evaluate(delay_evaluate_env(x), delay_evaluate_x(x), raw)
    } else if (delay_builtin_form_p(x)) {
        ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x), raw)
    } else if (delay_builtin_func_p(x)) {
        ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x), raw)
    } else if (delay_apply_p(x)) {
        ret = real_apply(delay_apply_f(x), delay_apply_xs(x), raw)
    } else {
        ret = x
    }
    ret = un_just_all(ret)
    lang_assert_equal_set_do(x, ret)
    return ret
}
function force_all(raw: LangVal): LangVal {
    return force_all_inner(raw)
}
function force_uncomment_all(x: LangVal): LangVal {
    while (delay_just_p(x) || comment_p(x)) {
        x = force_all(un_comment_all(x))
    }
    return x
}
function force_uncomment1(raw: LangVal): LangVal {
    if (comment_p(raw)) {
        return comment_x(raw)
    } else {
        return force1(raw)
    }
}

// 註疏系統WIP
function unlazy1(x:LangVal):LangVal{
    while(comment_p(x)){x=comment_x(x)}
    x=force1(x)
    while(comment_p(x)){x=comment_x(x)}
    return x
}
export { force_all, force1, force_uncomment1, force_uncomment_all,unlazy1 }

function unlazy_list_1_keepcomment<T>(list: LangVal, not_list_k: () => T, delay_just_k: () => T, k: (comments: Array<LangVal>, ret: Array<LangVal>) => T): T {
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

// 註疏系統WIP
function name_unlazy1_p3(x:LangVal):TrueFalseNull{
    if(lazy_p(x)){x=unlazy1(x)}
    if(lazy_p(x)){return null}
    if(atom_p(x)){return true}
    if(!data_p(x)){return false}
    const n=data_name(x)
    if(lazy_p(n)){n=unlazy1(n)}
    if(lazy_p(n)){return null}
    if(!atom_p(n)){return false}
    return atom_equal_p(n,name_atom)
}
// 相對獨立的部分。對內建數據結構的簡單處理 }}}
