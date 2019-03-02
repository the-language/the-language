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
function ERROR(): never {
    throw "TheLanguage PANIC"
}
function ASSERT(x: boolean): void {
    if (!x) {
        return ERROR()
    }
}
// 用export{}，不用export const .../export function...，否則生成的代碼內部使用exports，使其他代碼有能力破壞，而且性能不夠好

// {{{ 相對獨立的部分。內建數據結構
// 如果沒有const不能過google-closure-compiler -O ADVANCED
export const enum LangValType {
    symbol_t,
    construction_t,
    null_t,
    data_t,
    error_t,
    just_t,
    delay_evaluate_t,
    delay_builtin_func_t,
    delay_builtin_form_t,
    delay_apply_t,
}
const symbol_t = LangValType.symbol_t
const construction_t = LangValType.construction_t
const null_t = LangValType.null_t
const data_t = LangValType.data_t
const error_t = LangValType.error_t
const just_t = LangValType.just_t
const delay_evaluate_t = LangValType.delay_evaluate_t
const delay_builtin_func_t = LangValType.delay_builtin_func_t
const delay_builtin_form_t = LangValType.delay_builtin_form_t
const delay_apply_t = LangValType.delay_apply_t
export type LangValDelayType = LangValType.delay_evaluate_t | LangValType.delay_builtin_func_t | LangValType.delay_builtin_form_t | LangValType.delay_apply_t
export type LangValJustDelayType = LangValType.just_t | LangValDelayType
export type LangValSymbol = [LangValType.symbol_t, string]
export type LangValCons = [LangValType.construction_t, LangValRec, LangValRec]
export type LangValNull = [LangValType.null_t]
export type LangValData = [LangValType.data_t, LangValRec, LangValRec]
export type LangValError = [LangValType.error_t, LangValRec, LangValRec]
export type LangValJust = [LangValType.just_t, LangValRec, null, null]
export type LangValDelayEval = [LangValType.delay_evaluate_t, any, LangValRec] // WIP
export type LangValDelayBuiltinFunc = [LangValType.delay_builtin_func_t, LangValRec, Array<LangValRec>]
export type LangValDelayBuiltinForm = [LangValType.delay_builtin_form_t, any, LangValRec, Array<LangValRec>] // WIP
export type LangValDelayApply = [LangValType.delay_apply_t, LangValFunctionJustDelay, Array<LangValRec>]
export type LangValDelay = LangValDelayEval | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply
export type LangValJustDelay = LangValJust | LangValDelay
export type LangValSysName = LangValData // WIP
export type LangValName = LangValData | LangValSymbol
export type LangValSysNameJustDelay = LangValSysName | LangValJustDelayType
export type LangValFunctionJustDelay = LangValRec // WIP
export type LangVal = LangValSymbol | LangValCons | LangValNull | LangValData | LangValError | LangValJust | LangValDelayEval | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply
export type LangValRec = any // WIP
/* 遞歸類型 A hack: [Unused] [error TS2312: An interface can only extend an object type or intersection of object types with statically known members.]
    type trec < T > = [null, t, t] | null
    interface t extends trec < null > {}
    */

function type_of(x: LangVal): LangValType {
    return x[0]
}
function make_one_p(t: LangValType) {
    return (x: LangVal) => x[0] === t
}
const make_two_p = make_one_p
// const make_three_p = make_one_p // - error TS6133: 'make_three_p' is declared but its value is never read.
function make_new_one<T, A>(t: T): (x: A) => [T, A] {
    return (x) => [t, x]
}
function make_new_two<T, A, B>(t: T): (x: A, y: B) => [T, A, B] {
    return function(x, y) {
        return [t, x, y] // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
    }
}
function make_get_one_a(t: LangValType) {
    return (x: LangVal) => {
        ASSERT(x[0] === t)
        return x[1]
    }
}
const make_get_two_a = make_get_one_a
function make_get_two_b(t: LangValType) {
    return (x: LangVal) => {
        ASSERT(x[0] === t)
        return x[2]
    }
}

const new_symbol: (x: string) => LangValSymbol = make_new_one<LangValType.symbol_t, string>(symbol_t)
function symbol_p(x: LangVal): x is LangValSymbol {
    return type_of(x) === LangValType.symbol_t
}
const un_symbol = make_get_one_a(symbol_t)
export { new_symbol, symbol_p, un_symbol }

const new_construction: (x: LangVal, y: LangVal) => LangValCons = make_new_two<LangValType.construction_t, LangVal, LangVal>(construction_t)
const construction_p = make_two_p(construction_t)
const construction_head = make_get_two_a(construction_t)
const construction_tail = make_get_two_b(construction_t)
export { new_construction, construction_p, construction_head, construction_tail }

const null_v: LangValNull = [null_t]
function null_p(x: LangVal): x is LangValNull {
    return x[0] === null_t
}
export { null_v, null_p }

const new_data: (x: LangVal, y: LangVal) => LangValData = make_new_two<LangValType.data_t, LangVal, LangVal>(data_t)
const data_p = make_two_p(data_t)
const data_name = make_get_two_a(data_t)
const data_list = make_get_two_b(data_t)
export { new_data, data_p, data_name, data_list }

const new_error: (x: LangVal, y: LangVal) => LangValError = make_new_two<LangValType.error_t, LangVal, LangVal>(error_t)
const error_p = make_two_p(error_t)
const error_name = make_get_two_a(error_t)
const error_list = make_get_two_b(error_t)
export { new_error, error_p, error_name, error_list }

function lang_set_do(x: LangVal, y: LangVal): void {
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
function evaluate(x: Env, y: LangVal): LangValDelayEval {
    return [delay_evaluate_t, x, y]
}
export { evaluate }
function delay_evaluate_p(x: LangVal): x is LangValDelayEval {
    return x[0] === delay_evaluate_t
}
function delay_evaluate_env(x: LangValDelayEval): Env {
    return x[1]
}
function delay_evaluate_x(x: LangValDelayEval): LangVal {
    return x[2]
}
function builtin_form_apply(x: Env, y: LangVal, z: Array<LangVal>): LangValDelayBuiltinForm {
    return [delay_builtin_form_t, x, y, z]
}
function delay_builtin_form_p(x: LangVal): x is LangValDelayBuiltinForm {
    return x[0] === delay_builtin_form_t
}
function delay_builtin_form_env(x: LangValDelayBuiltinForm): Env {
    return x[1]
}
function delay_builtin_form_f(x: LangValDelayBuiltinForm): LangVal {
    return x[2]
}
function delay_builtin_form_xs(x: LangValDelayBuiltinForm): Array<LangVal> {
    return x[3]
}
function builtin_func_apply(x: LangVal, y: Array<LangVal>): LangValDelayBuiltinFunc {
    return [delay_builtin_func_t, x, y]
}
function delay_builtin_func_p(x: LangVal): x is LangValDelayBuiltinFunc {
    return x[0] === delay_builtin_func_t
}
function delay_builtin_func_f(x: LangValDelayBuiltinFunc): LangVal {
    return x[1]
}
function delay_builtin_func_xs(x: LangValDelayBuiltinFunc): Array<LangVal> {
    return x[2]
}

function apply(f: LangValFunctionJustDelay, xs: Array<LangVal>): LangValDelayApply {
    return [delay_apply_t, f, xs]
}
export { apply }
function delay_apply_p(x: LangVal): x is LangValDelayApply {
    return x[0] === delay_apply_t
}
function delay_apply_f(x: LangValDelayApply): LangVal {
    return x[1]
}
function delay_apply_xs(x: LangValDelayApply): Array<LangVal> {
    return x[2]
}
function force_all_rec(x: LangVal): LangVal {
    x = force_all(x)
    switch (type_of(x)) {
        case data_t:
            x[1] = force_all_rec(x[1])
            x[2] = force_all_rec(x[2])
            return x
        case error_t:
            x[1] = force_all_rec(x[1])
            x[2] = force_all_rec(x[2])
            return x
        case construction_t:
            x[1] = force_all_rec(x[1])
            x[2] = force_all_rec(x[2])
            return x
        default:
            return x
    }
    return ERROR()
}
export { force_all_rec }
// 相對獨立的部分。內建數據結構 }}}

// {{{ 相對獨立的部分。符號名稱
const system_symbol = new_symbol("太始初核")
const name_symbol = new_symbol("符名")
const function_symbol = new_symbol("化滅")
const form_symbol = new_symbol("式形")
const equal_symbol = new_symbol("等同")
const evaluate_sym = new_symbol("解算")
const theThing_symbol = new_symbol("特定其物")
const something_symbol = new_symbol("省略一物")
const mapping_symbol = new_symbol("映表")
const if_symbol = new_symbol("若")
const typeAnnotation_symbol = new_symbol("一類何物")
const isOrNot_symbol = new_symbol("是非")
const sub_symbol = new_symbol("其子")
const true_symbol = new_symbol("陽")
const false_symbol = new_symbol("陰")
const quote_symbol = new_symbol("引用")
const apply_symbol = new_symbol("應用")
const null_symbol = new_symbol("空")
const construction_symbol = new_symbol("連")
const data_symbol = new_symbol("構")
const error_symbol = new_symbol("誤")
const symbol_symbol = new_symbol("詞素")
const list_symbol = new_symbol("列")
const head_symbol = new_symbol("首")
const tail_symbol = new_symbol("尾")
const thing_symbol = new_symbol("物")
const theWorldStopped_symbol = new_symbol("宇宙亡矣")
const effect_symbol = new_symbol("效應")
const sequentialWordFormation_symbol = new_symbol('為符名連')
const inputOutput_symbol = new_symbol("出入改滅")
export {
    system_symbol,
    name_symbol,
    function_symbol,
    form_symbol,
    equal_symbol,
    evaluate_sym,
    theThing_symbol,
    something_symbol,
    mapping_symbol,
    if_symbol,
    typeAnnotation_symbol,
    isOrNot_symbol,
    sub_symbol,
    true_symbol,
    false_symbol,
    quote_symbol,
    apply_symbol,
    null_symbol,
    construction_symbol,
    data_symbol,
    error_symbol,
    symbol_symbol,
    list_symbol,
    head_symbol,
    tail_symbol,
    thing_symbol,
    theWorldStopped_symbol,
    effect_symbol,
    sequentialWordFormation_symbol,
    inputOutput_symbol
}

const the_world_stopped_v: LangVal = new_error(system_symbol, new_list(theWorldStopped_symbol, something_symbol))

function systemName_make(x: LangVal): LangValSysName {
    return new_data(name_symbol, new_list(system_symbol, x))
}
function make_builtin_f_new_sym_f(x_sym: LangValSymbol): LangValSysName {
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, x_sym), theThing_symbol))
}
function make_builtin_f_get_sym_f(t_sym: LangValSymbol, x_sym: LangVal): LangValSysName {
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(t_sym), something_symbol), x_sym))
}
function make_builtin_f_p_sym_f(t_sym: LangValSymbol): LangValSysName {
    return systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, new_list(typeAnnotation_symbol, t_sym, something_symbol))))
}
const new_data_function_builtin_systemName = make_builtin_f_new_sym_f(data_symbol)
const data_name_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, name_symbol)
const data_list_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, list_symbol)
const data_p_function_builtin_systemName = make_builtin_f_p_sym_f(data_symbol)

const new_error_function_builtin_systemName = make_builtin_f_new_sym_f(error_symbol)
const error_name_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, name_symbol)
const error_list_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, list_symbol)
const error_p_function_builtin_systemName = make_builtin_f_p_sym_f(error_symbol)

const new_construction_function_builtin_systemName = make_builtin_f_new_sym_f(construction_symbol)
const construction_p_function_builtin_systemName = make_builtin_f_p_sym_f(construction_symbol)
const construction_head_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, head_symbol)
const construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, tail_symbol)

const symbol_p_function_builtin_systemName = make_builtin_f_p_sym_f(symbol_symbol)

const null_p_function_builtin_systemName = make_builtin_f_p_sym_f(null_symbol)

const equal_p_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, equal_symbol)))
const apply_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(function_symbol, something_symbol), something_symbol), apply_symbol))
const evaluate_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, evaluate_sym))
const list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f(list_symbol, new_list(typeAnnotation_symbol, thing_symbol, something_symbol))
const if_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, if_symbol))

const quote_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, form_symbol, quote_symbol))
const lambda_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, function_symbol)), theThing_symbol))

const function_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, function_symbol)))
const form_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, form_symbol)))
const form_use_systemName = systemName_make(new_list(form_symbol, form_symbol))
export {
    new_data_function_builtin_systemName,
    data_name_function_builtin_systemName,
    data_list_function_builtin_systemName,
    data_p_function_builtin_systemName,
    new_error_function_builtin_systemName,
    error_name_function_builtin_systemName,
    error_list_function_builtin_systemName,
    error_p_function_builtin_systemName,
    new_construction_function_builtin_systemName,
    construction_p_function_builtin_systemName,
    construction_head_function_builtin_systemName,
    construction_tail_function_builtin_systemName,
    symbol_p_function_builtin_systemName,
    null_p_function_builtin_systemName,
    equal_p_function_builtin_systemName,
    apply_function_builtin_systemName,
    evaluate_function_builtin_systemName,
    list_chooseOne_function_builtin_systemName,
    if_function_builtin_systemName,
    quote_form_builtin_systemName,
    lambda_form_builtin_systemName,
    function_builtin_use_systemName,
    form_builtin_use_systemName,
    form_use_systemName
}

const false_v: LangVal = new_data(false_symbol, new_list())
const true_v: LangVal = new_data(true_symbol, new_list())
function symbol_equal_p(x: LangValSymbol, y: LangValSymbol): boolean {
    if (x === y) {
        return true
    }
    // 其他自然語言暫未實現。  改為在new_symbol 和 新函數 localized_complex_print實現 WIP
    if (un_symbol(x) === un_symbol(y)) {
        lang_set_do(x, y)
        return true
    } else {
        return false
    }
}

// 相對獨立的部分。符號名稱 }}}

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

function maybe_list_to_jsArray(xs: LangVal): false | Array<LangVal> {
    return list_to_jsArray<false | Array<LangVal>>(xs, (xs) => xs, (xs, x) => false)
}
function new_list(...xs: Array<LangVal>): LangVal {
    return jsArray_to_list(xs)
}
export { jsArray_to_list, maybe_list_to_jsArray, new_list }

function un_just_all(raw: LangVal): LangVal {
    let x = raw
    let xs: Array<LangVal> = []
    while (just_p(x)) {
        xs.push(x)
        x = un_just(x)
    }

    for (let i = 0; i < xs.length; i++) {
        lang_set_do(xs[i], x)
    }

    return x
}

function any_delay_just_p(x: LangVal): x is LangValJustDelay {
    return just_p(x) ||
        delay_evaluate_p(x) ||
        delay_builtin_form_p(x) ||
        delay_builtin_func_p(x) ||
        delay_apply_p(x)
}
export { any_delay_just_p as delay_p }

function force_all(
    raw: LangVal,
    parents_history: { [key: string]: true } = {}
    , ref_novalue_replace: [boolean, boolean] = [false, false]): LangVal {
    // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
    let history: { [key: string]: true } = {}
    let x: LangVal = raw
    let xs: Array<LangVal> = []
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
        let ret: { [key: string]: true } = {}
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
                    symbol_p_function_builtin_systemName,
                    null_p_function_builtin_systemName]
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
                        return ERROR() //我覺得沒有這種情況
                    }
                }
                if (jsbool_equal_p(f, equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, apply_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, if_function_builtin_systemName)) {
                    ASSERT(xs.length === 3)
                    ASSERT(ref_novalue_replace[1] === false)
                    const tf = force_all(xs[0], make_history(), ref_novalue_replace)
                    if (ref_novalue_replace[1]) {
                        return force_all(builtin_func_apply(if_function_builtin_systemName, [tf, xs[1], xs[2]]))
                    } else {
                        return ERROR() //我覺得沒有這種情況
                    }
                }
                return ERROR() //我覺得沒有這種情況
            } else if (delay_builtin_form_p(x)) {
                return replace_this_with_stopped() // 可能未減少應該減少的？
            } else if (delay_apply_p(x)) {
                return replace_this_with_stopped() // 可能未減少應該減少的？
            }
            return ERROR()
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

function force1(raw: LangVal): LangVal {
    const x: LangVal = un_just_all(raw)
    let ret: LangVal
    ASSERT(!just_p(x))
    if (delay_evaluate_p(x)) {
        ret = real_evaluate(delay_evaluate_env(x), delay_evaluate_x(x))
    }
    else if (delay_builtin_form_p(x)) {
        ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x))
    } else if (delay_builtin_func_p(x)) {
        ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x))
    } else if (delay_apply_p(x)) {
        ret = real_apply(delay_apply_f(x), delay_apply_xs(x))
    } else {
        ret = x
    }
    ret = un_just_all(ret)
    lang_set_do(x, ret)
    return ret
}

export { force_all, force1 }

// 相對獨立的部分。對內建數據結構的簡單處理 }}}

// {{{ 相對獨立的部分。變量之環境
export type Env = Array<LangVal> // WIP

const env_null_v: Env = []
function env_set(env: Env, key: LangVal, val: LangVal): Env {
    let ret: Env = []
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

function env_get<T>(env: Env, key: LangVal, default_v: T): T | LangVal {
    for (let i = 0; i < env.length; i = i + 2) {
        if (jsbool_equal_p(env[i + 0], key)) {
            return env[i + 1]
        }
    }
    return default_v
}

function must_env_get(env: Env, key: LangVal): LangVal {
    for (let i = 0; i < env.length; i = i + 2) {
        if (jsbool_equal_p(env[i + 0], key)) {
            return env[i + 1]
        }
    }
    return ERROR()
}

function env2val(env: Env): LangVal {
    let ret: LangVal = null_v
    for (let i = 0; i < env.length; i = i + 2) {
        ret = new_construction(new_list(env[i + 0], env[i + 1]), ret)
    }
    return new_data(mapping_symbol, new_list(ret))
}

function env_foreach(env: Env, f: (k: LangVal, v: LangVal) => void): void {
    for (let i = 0; i < env.length; i = i + 2) {
        f(env[i + 0], env[i + 1])
    }
}

function val2env(x: LangVal): false | Env {
    x = force_all(x)
    if (!data_p(x)) {
        return false
    }
    let s: LangVal = force_all(data_name(x))
    if (!symbol_p(s)) {
        return false
    }
    if (!symbol_equal_p(s, mapping_symbol)) {
        return false
    }
    s = force_all(data_list(x))
    if (!construction_p(s)) {
        return false
    }
    if (!null_p(force_all(construction_tail(s)))) {
        return false
    }
    let ret: Env = []
    let xs: LangVal = force_all(construction_head(s))
    while (!null_p(xs)) {
        if (!construction_p(xs)) {
            return false
        }
        let x = force_all(construction_head(xs))
        xs = force_all(construction_tail(xs))
        if (!construction_p(x)) {
            return false
        }
        const k = construction_head(x)
        x = force_all(construction_tail(x))
        if (!construction_p(x)) {
            return false
        }
        const v = construction_head(x)
        if (!null_p(force_all(construction_tail(x)))) {
            return false
        }
        block: {
            for (let i = 0; i < ret.length; i = i + 2) {
                if (jsbool_equal_p(ret[i + 0], k)) {
                    ret[i + 1] = v
                    break block
                }
            }
            ret.push(k)
            ret.push(v)
        }
    }
    return ret
}

export {
    env_null_v,
    env_set,
    env_get,
    env2val,
    env_foreach,
    val2env
}

// 相對獨立的部分。變量之環境 }}}

function real_evaluate(env: Env, raw: LangVal): LangVal {
    const x = force1(raw)
    if (any_delay_just_p(x)) {
        return evaluate(env, x)
    }
    const error_v = new_error(system_symbol,
        new_list(
            function_builtin_use_systemName,
            new_list(
                evaluate_function_builtin_systemName,
                new_list(env2val(env), x))))
    if (construction_p(x)) {
        let xs: Array<LangVal> = []
        let rest: LangVal = x
        while (!null_p(rest)) {
            if (any_delay_just_p(rest)) {
                return evaluate(env, x)
            } else if (construction_p(rest)) {
                xs.push(construction_head(rest)) // WIP delay未正確處理(影響較小)
                rest = force1(construction_tail(rest))
            } else {
                return error_v
            }
        }
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(xs[0], form_builtin_use_systemName)) {
            if (xs.length === 1) {
                return error_v
            }
            const f = xs[1]
            let args: Array<LangVal> = []
            for (let i = 2; i < xs.length; i++) {
                args[i - 2] = xs[i]
            }
            return builtin_form_apply(env, f, args)
        } else if (jsbool_equal_p(xs[0], form_use_systemName)) {
            if (xs.length === 1) {
                return error_v
            }
            // WIP delay未正確處理(影響較小)
            const f = force_all(evaluate(env, xs[1]))
            if (!data_p(f)) {
                return error_v
            }
            const f_type = force1(data_name(f))
            if (any_delay_just_p(f_type)) {
                return evaluate(env, x)
            }
            if (!symbol_p(f_type)) {
                return error_v
            }
            if (!symbol_equal_p(f_type, form_symbol)) {
                return error_v
            }
            const f_list = force1(data_list(f))
            if (any_delay_just_p(f_list)) {
                return evaluate(env, x)
            }
            if (!construction_p(f_list)) {
                return error_v
            }
            const f_x = construction_head(f_list)
            const f_list_cdr = force1(construction_tail(f_list))
            if (any_delay_just_p(f_list_cdr)) {
                return evaluate(env, x)
            }
            if (!null_p(f_list_cdr)) {
                return error_v
            }
            const args = [env2val(env)]
            for (let i = 2; i < xs.length; i++) {
                args[i - 1] = xs[i]
            }
            return apply(f_x, args)
        } else if (jsbool_equal_p(xs[0], function_builtin_use_systemName)) {
            if (xs.length === 1) {
                return error_v
            }
            const f = xs[1]
            let args: Array<LangVal> = []
            for (let i = 2; i < xs.length; i++) {
                args[i - 2] = evaluate(env, xs[i])
            }
            return builtin_func_apply(f, args)
        } else {
            const f = evaluate(env, xs[0])
            let args: Array<LangVal> = []
            for (let i = 1; i < xs.length; i++) {
                args[i - 1] = evaluate(env, xs[i])
            }
            return apply(f, args)
        }
    } else if (null_p(x)) {
        return x
    } else if (name_p(x)) {
        return env_get(env, x, error_v)
    } else if (error_p(x)) {
        return error_v
    }
    return ERROR()
}

function name_p(x: LangVal): x is LangValName {
    return symbol_p(x) || data_p(x)
}
function make_builtin_p_func(p_sym: LangValSysName, p_jsfunc: (x: LangVal) => boolean)
    : [LangValSysName, 1, (x: LangVal, error_v: LangVal) => LangVal] {
    return [p_sym,
        1,
        (x, error_v) => {
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

function make_builtin_get_func<T extends LangVal>(f_sym: LangValSysName, p_jsfunc: (x: LangVal) => boolean, f_jsfunc: (x: LangVal) => LangVal)
    : [LangValSysName, 1, (x: LangVal, error_v: LangVal) => LangVal] {
    return [f_sym,
        1,
        (x, error_v) => {
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
type real_builtin_func_apply_T =
    [LangValSysName, 1, (x: LangVal) => LangVal] |
    [LangValSysName, 2, (x: LangVal, y: LangVal) => LangVal] |
    [LangValSysName, 3, (x: LangVal, y: LangVal, z: LangVal) => LangVal] |
    [LangValSysName, 1, (x: LangVal, error_v: LangVal) => LangVal] |
    [LangValSysName, 2, (x: LangVal, y: LangVal, error_v: LangVal) => LangVal] |
    [LangValSysName, 3, (x: LangVal, y: LangVal, z: LangVal, error_v: LangVal) => LangVal]

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

    [equal_p_function_builtin_systemName, 2, (x: LangVal, y: LangVal, error_v: LangVal) => {
        if (x === y) {
            return true_v
        }
        x = force1(x)
        y = force1(y)
        if (any_delay_just_p(x) || any_delay_just_p(y)) {
            return builtin_func_apply(equal_p_function_builtin_systemName, [x, y]) // not fully implemented -- Halting
        }
        if (x === y) {
            return true_v
        }
        if (type_of(x) !== type_of(y)) {
            return false_v
        }
        function H_if(b: LangVal, x: LangVal, y: LangVal): LangVal {
            // H = helper
            return builtin_func_apply(if_function_builtin_systemName, [b, x, y])
        }
        function H_and(x: LangVal, y: LangVal): LangVal {
            return H_if(x, y, false_v)
        }
        ASSERT(!any_delay_just_p(x))
        function end_2<T extends LangVal>(x: T, y: T, f1: (x: T) => LangVal, f2: (x: T) => LangVal): LangVal {
            return H_and(
                builtin_func_apply(equal_p_function_builtin_systemName, [f1(x), f1(y)]),
                builtin_func_apply(equal_p_function_builtin_systemName, [f2(x), f2(y)]))
        }
        switch (type_of(x)) {
            case null_t:
                return true_v
            case symbol_t:
                return symbol_equal_p(x as LangValSymbol, y as LangValSymbol) ? true_v : false_v // type WIP
            case data_t:
                return end_2(x as LangValData, y as LangValData, data_name, data_list) // type WIP
            case construction_t:
                return end_2(x as LangValCons, y as LangValCons, construction_head, construction_tail)
            case error_t:
                return end_2(x as LangValError, y as LangValError, error_name, error_list) // type WIP
            default:
        }
        return ERROR()
    }],
    [apply_function_builtin_systemName, 2, (f: LangVal, xs: LangVal, error_v: LangVal) => {
        // WIP delay未正確處理(影響較小)
        let jslist: Array<LangVal> = []
        let iter: LangVal = force_all(xs)
        while (construction_p(iter)) {
            jslist.push(construction_head(iter))
            iter = force_all(construction_tail(iter))
        }
        if (!null_p(iter)) {
            return error_v
        }
        return apply(f, jslist)
    }],
    [evaluate_function_builtin_systemName, 2, (env: LangVal, x: LangVal, error_v: LangVal) => {
        // WIP delay未正確處理(影響較小)
        const maybeenv = val2env(env)
        if (maybeenv === false) {
            return error_v
        }
        return evaluate(maybeenv, x)
    }],

    make_builtin_p_func(symbol_p_function_builtin_systemName, symbol_p),

    [list_chooseOne_function_builtin_systemName, 1, (xs: LangVal, error_v: LangVal) => {
        // 一般返回第一个，可以因为优化返回其他的任意一个
        // xs可以無限長，不判斷是否真的是list
        xs = force1(xs)
        if (any_delay_just_p(xs)) {
            return builtin_func_apply(list_chooseOne_function_builtin_systemName, [xs])
        }
        if (!construction_p(xs)) {
            return error_v
        }
        return construction_head(xs)
    }],

    [if_function_builtin_systemName, 3, (b, x, y, error_v) => {
        b = force1(b)
        if (any_delay_just_p(b)) {
            return builtin_func_apply(if_function_builtin_systemName, [b, x, y])
        }
        if (!data_p(b)) {
            return error_v
        }
        // WIP delay未正確處理(影響較小)
        const nam = force_all(data_name(b))
        if (!symbol_p(nam)) {
            return error_v
        }
        if (symbol_equal_p(nam, true_symbol)) {
            return x
        }
        if (symbol_equal_p(nam, false_symbol)) {
            return y
        }
        return error_v
    }],
]
function real_apply(f: LangVal, xs: Array<LangVal>): LangVal {
    // WIP delay未正確處理(影響較小)
    function make_error_v() {
        return new_error(system_symbol,
            new_list(
                function_builtin_use_systemName,
                new_list(
                    apply_function_builtin_systemName,
                    new_list(f, jsArray_to_list(xs)))))
    }
    f = force1(f)
    if (any_delay_just_p(f)) {
        return apply(f, xs)
    }
    if (!data_p(f)) {
        return make_error_v()
    }
    const f_type = force_all(data_name(f))
    if (!(symbol_p(f_type) && symbol_equal_p(f_type, function_symbol))) {
        return make_error_v()
    }
    const f_list = force_all(data_list(f))
    if (!construction_p(f_list)) {
        return make_error_v()
    }
    let args_pat = force_all_rec(construction_head(f_list))
    const f_list_cdr = force_all(construction_tail(f_list))
    if (!(construction_p(f_list_cdr) && null_p(force_all(construction_tail(f_list_cdr))))) {
        return make_error_v()
    }
    const f_code = construction_head(f_list_cdr)
    let env: Env = env_null_v

    // https://github.com/Microsoft/TypeScript/issues/10272
    function isNotEmpty<T>(arr: T[]): arr is { shift(): T; } & Array<T> {
        return !!arr.length;
    }
    while (!null_p(args_pat)) {
        if (name_p(args_pat)) {
            env = env_set(env, args_pat, jsArray_to_list(xs))
            xs = []
            args_pat = null_v
        } else if (construction_p(args_pat)) {
            if (isNotEmpty(xs)) {
                const x: LangVal = xs.shift()
                env = env_set(env, construction_head(args_pat), x)
                args_pat = construction_tail(args_pat)
            } else {
                return make_error_v()
            }
        } else {
            return make_error_v()
        }
    }
    if (xs.length !== 0) {
        return make_error_v()
    }
    return evaluate(env, f_code)
}

function real_builtin_func_apply(f: LangVal, xs: Array<LangVal>): LangVal {
    const error_v = new_error(system_symbol,
        new_list(function_builtin_use_systemName,
            new_list(f, jsArray_to_list(xs))))
    for (let i = 0; i < real_builtin_func_apply_s.length; i++) {
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(f, real_builtin_func_apply_s[i][0])) {
            const actually_length = real_builtin_func_apply_s[i][1]
            if (xs.length !== actually_length) {
                return error_v
            }
            const f = real_builtin_func_apply_s[i][2]
            // type WIP
            switch (actually_length) {
                case 1:
                    return (f as (x: LangVal, error_v: LangVal) => LangVal)(xs[0], error_v)
                case 2:
                    return (f as (x: LangVal, y: LangVal, error_v: LangVal) => LangVal)(xs[0], xs[1], error_v)
                case 3:
                    return (f as (x: LangVal, y: LangVal, z: LangVal, error_v: LangVal) => LangVal)(xs[0], xs[1], xs[2], error_v)
                default:
            }
            return ERROR()
        }
    }
    return error_v
}

function real_builtin_form_apply(env: Env, f: LangVal, xs: Array<LangVal>): LangVal {
    const error_v = new_error(system_symbol,
        new_list(form_builtin_use_systemName,
            new_list(env2val(env), f, jsArray_to_list(xs)))) // WIP delay未正確處理(影響較小)

    if (jsbool_equal_p(f, quote_form_builtin_systemName)) {
        if (xs.length !== 1) {
            return error_v
        }
        return xs[0]
    } else if (jsbool_equal_p(f, lambda_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v
        }
        return new_lambda(env, xs[0], xs[1], error_v)
    }
    return error_v
}

function new_lambda(
    env: Env,
    args_pat: LangVal,
    body: LangVal,
    error_v: LangVal | null = null): LangVal {
    // 允許返回不同的物--允許實現進行對所有實現有效的優化[比如:消除無用環境中的變量] TODO 未實現
    function make_error_v(): LangVal {
        if (error_v === null) {
            return new_error(system_symbol,
                new_list(form_builtin_use_systemName,
                    new_list(
                        env2val(env),
                        lambda_form_builtin_systemName,
                        jsArray_to_list([args_pat, body]))))
        } else {
            return error_v
        }
    }
    function make_quote(x: LangVal): LangVal {
        return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x)
    }
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
            return make_error_v()
        }
    }
    let args_pat_vars_val = args_pat // 是 jsArray_to_list(args_pat_vars) : LangVal
    if (args_pat_is_dot) {
        args_pat_vars_val = jsArray_to_list(args_pat_vars)
    }
    let env_vars: Array<LangVal> = [] // : JSList LangVal/Name
    env_foreach(env, function(k, v) {
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

function jsbool_equal_p(x: LangVal, y: LangVal): boolean {
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
    function end_2<T extends LangVal>(x: T, y: T, f1: (x: T) => LangVal, f2: (x: T) => LangVal): boolean {
        if (jsbool_equal_p(f1(x), f1(y)) && jsbool_equal_p(f2(x), f2(y))) {
            lang_set_do(x, y)
            return true
        } else {
            return false
        }
    }
    if (null_p(x)) {
        lang_set_do(x, null_v)
        lang_set_do(y, null_v)
        return true
    } else if (symbol_p(x)) {
        return symbol_equal_p(x, y as LangValSymbol) // type WIP
    } else if (construction_p(x)) {
        return end_2(x, y as LangValCons, construction_head, construction_tail) // type WIP
    } else if (error_p(x)) {
        return end_2(x, y as LangValError, error_name, error_list) // type WIP
    } else if (data_p(x)) {
        return end_2(x, y as LangValData, data_name, data_list) // type WIP
    }
    return ERROR()
}
export { jsbool_equal_p as equal_p }

function jsbool_no_force_equal_p(x: LangVal, y: LangVal): boolean {
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
    function end_2<T extends LangVal>(x: T, y: T, f1: (x: T) => LangVal, f2: (x: T) => LangVal): boolean {
        if (jsbool_no_force_equal_p(f1(x), f1(y)) && jsbool_no_force_equal_p(f2(x), f2(y))) {
            lang_set_do(x, y)
            return true
        } else {
            return false
        }
    }
    if (null_p(x)) {
        lang_set_do(x, null_v)
        lang_set_do(y, null_v)
        return true
    } else if (symbol_p(x)) {
        return symbol_equal_p(x, y as LangValSymbol) // type WIP
    } else if (construction_p(x)) {
        return end_2(x, y as LangValCons, construction_head, construction_tail) // type WIP
    } else if (error_p(x)) {
        return end_2(x, y as LangValError, error_name, error_list) // type WIP
    } else if (data_p(x)) {
        return end_2(x, y as LangValData, data_name, data_list) // type WIP
    } else if (delay_evaluate_p(x)) {
        return false //WIP
    } else if (delay_builtin_func_p(x)) {
        return false //WIP
    } else if (delay_builtin_form_p(x)) {
        return false //WIP
    } else if (delay_apply_p(x)) {
        return false //WIP
    }
    return ERROR()
}

// {{{ 相對獨立的部分。parser/printer
function make_printer(forcer: (x: LangVal) => LangVal): (x: LangVal) => string {
    function print(x: LangVal): string {
        // [[[ 大量重複代碼 print <-> complex_print
        x = forcer(x)
        let temp = ""
        let prefix = ""
        if (null_p(x)) {
            return "()"
        } else if (construction_p(x)) {
            temp = "("
            prefix = ""
            while (construction_p(x)) {
                temp += prefix + print(construction_head(x))
                prefix = " "
                x = forcer(construction_tail(x))
            }
            if (null_p(x)) {
                temp += ")"
            } else {
                temp += " . " + print(x) + ")"
            }
            return temp
        } else if (data_p(x)) {
            return "#" + print(new_construction(data_name(x), data_list(x)))
        } else if (error_p(x)) {
            return "!" + print(new_construction(error_name(x), error_list(x)))
        } else if (symbol_p(x)) {
            return un_symbol(x)
        } else if (delay_evaluate_p(x)) {
            return "$(" + print(env2val(delay_evaluate_env(x))) + " " + print(delay_evaluate_x(x)) + ")"
        } else if (delay_builtin_func_p(x)) {
            return "%(" + print(delay_builtin_func_f(x)) + " " + print(jsArray_to_list(delay_builtin_func_xs(x))) + ")"
        } else if (delay_builtin_form_p(x)) {
            return "@(" +
                print(env2val(delay_builtin_form_env(x))) +
                " " + print(delay_builtin_form_f(x)) +
                " " + print(jsArray_to_list(delay_builtin_form_xs(x))) +
                ")"
        } else if (delay_apply_p(x)) {
            return "^(" + print(delay_apply_f(x)) + " " + print(jsArray_to_list(delay_apply_xs(x))) + ")"
        }
        return ERROR() // 大量重複代碼 print <-> complex_print ]]]
    }
    return print
}

const print = make_printer(un_just_all)
const print_force_all_rec = make_printer(force_all)
export { print, print_force_all_rec }

function read(x: string): LangVal {
    // [[[ 大量重複代碼 read <-> complex_parse
    let state = x.split("") // State : List Char
    function eof() {
        return state.length === 0
    }
    function get(): string {
        return state.shift() as string // type WIP
    }
    function put(x: string) {
        state.unshift(x)
    }
    function error(): never {
        throw "TheLanguage parse ERROR!"
    }
    function a_space_p(x: string): boolean {
        return x === " " || x === "\n" || x === "\t" || x === "\r"
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
    function symbol() {
        if (eof()) {
            return false
        }
        let x = get()
        let ret = ""
        if (!a_symbol_p(x)) {
            put(x)
            return false
        }
        while (a_symbol_p(x) && !eof()) {
            ret += x
            x = get()
        }
        if (a_symbol_p(x)) {
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
        const HOLE: LangVal = new_symbol('!!@@READ||HOLE@@!!')
        let ret: LangVal = HOLE
        function set_last(lst: LangVal): void {
            if (ret === HOLE) {
                ret = lst
                return
            }
            let x = ret
            while (true) {
                if (!construction_p(x)) {
                    return ERROR()
                }
                const d = construction_tail(x)
                if (d === HOLE) {
                    break
                }
                x = construction_tail(x)
            }
            if (!construction_p(x)) {
                return ERROR()
            }
            if (x[2] !== HOLE) {
                return ERROR()
            }
            x[2] = lst // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
        }
        function last_add(x: LangVal) {
            set_last(new_construction(x, HOLE))
        }
        while (true) {
            space()
            if (eof()) {
                return error()
            }
            x = get()
            if (x === ")") {
                set_last(null_v)
                return ret
            }
            if (x === ".") {
                space()
                const e: LangVal = val()
                set_last(e)
                space()
                if (eof()) {
                    return error()
                }
                x = get()
                if (x !== ")") {
                    return error()
                }
                return ret
            }
            put(x)
            const e: LangVal = val()
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
            return error()
        }
        if (!construction_p(xs)) {
            return error()
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
        const xs = list()
        if (xs === false) {
            return error()
        }
        if (!construction_p(xs)) {
            return error()
        }
        return new_error(construction_head(xs), construction_tail(xs))
    }
    function make_read_two(prefix: string, k: (x: LangVal, y: LangVal) => LangVal): () => false | LangVal {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = list()
            if (xs === false) {
                return error()
            }
            if (!construction_p(xs)) {
                return error()
            }
            const x = construction_tail(xs)
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return error()
            }
            return k(construction_head(xs), construction_head(x))
        }
    }
    function make_read_three(prefix: string, k: (x: LangVal, y: LangVal, z: LangVal) => LangVal): () => false | LangVal {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = list()
            if (xs === false) {
                return error()
            }
            if (!construction_p(xs)) {
                return error()
            }
            const x = construction_tail(xs)
            if (!construction_p(x)) {
                return error()
            }
            const x_d = construction_tail(x)
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return error()
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d))
        }
    }
    const readeval = make_read_two("$", (e, x) => {
        const env = val2env(e)
        if (env === false) {
            return error()
        }
        return evaluate(env, x)
    })
    const readfuncapply = make_read_two("%", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        return builtin_func_apply(f, jsxs)
    })
    const readformbuiltin = make_read_three("@", (e, f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        const env = val2env(e)
        if (env === false) {
            return error()
        }
        return builtin_form_apply(env, f, jsxs)
    })
    const readapply = make_read_two("^", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        return apply(f, jsxs)
    })
    function a_symbol_p(x: string): boolean {
        if (a_space_p(x)) {
            return false
        }
        const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&'
        ]
        for (let i = 0; i < not_xs.length; i++) {
            if (x == not_xs[i]) {
                return false
            }
        }
        return true
    }
    function val(): LangVal {
        space()
        const fs: Array<() => false | LangVal> = [list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply]
        for (let i = 0; i < fs.length; i++) {
            const x: false | LangVal = fs[i]()
            if (x !== false) {
                return x
            }
        }
        return error()
    }
    return val() // 大量重複代碼 read <-> complex_parse ]]]
}
export { read }

// 相對獨立的部分。parser/printer }}}

// {{{ 相對獨立的部分。complex parser/complex printer
function complex_parse(x: string): LangVal {
    // [[[ 大量重複代碼 read <-> complex_parse
    let state = x.split("") // State : List Char
    function eof() {
        return state.length === 0
    }
    function get(): string {
        return state.shift() as string // type WIP
    }
    function put(x: string) {
        state.unshift(x)
    }
    function error(): never {
        throw "TheLanguage parse ERROR!"
    }
    function a_space_p(x: string): boolean {
        return x === " " || x === "\n" || x === "\t" || x === "\r"
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
    function symbol() {
        if (eof()) {
            return false
        }
        let x = get()
        let ret = ""
        if (!a_symbol_p(x)) {
            put(x)
            return false
        }
        while (a_symbol_p(x) && !eof()) {
            ret += x
            x = get()
        }
        if (a_symbol_p(x)) {
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
        const HOLE: LangVal = new_symbol('!!@@READ||HOLE@@!!')
        let ret: LangVal = HOLE
        function set_last(lst: LangVal): void {
            if (ret === HOLE) {
                ret = lst
                return
            }
            let x = ret
            while (true) {
                if (!construction_p(x)) {
                    return ERROR()
                }
                const d = construction_tail(x)
                if (d === HOLE) {
                    break
                }
                x = construction_tail(x)
            }
            if (!construction_p(x)) {
                return ERROR()
            }
            if (x[2] !== HOLE) {
                return ERROR()
            }
            x[2] = lst // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
        }
        function last_add(x: LangVal) {
            set_last(new_construction(x, HOLE))
        }
        while (true) {
            space()
            if (eof()) {
                return error()
            }
            x = get()
            if (x === ")") {
                set_last(null_v)
                return ret
            }
            if (x === ".") {
                space()
                const e: LangVal = val()
                set_last(e)
                space()
                if (eof()) {
                    return error()
                }
                x = get()
                if (x !== ")") {
                    return error()
                }
                return ret
            }
            put(x)
            const e: LangVal = val()
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
            return error()
        }
        if (!construction_p(xs)) {
            return error()
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
        const xs = list()
        if (xs === false) {
            return error()
        }
        if (!construction_p(xs)) {
            return error()
        }
        return new_error(construction_head(xs), construction_tail(xs))
    }
    function make_read_two(prefix: string, k: (x: LangVal, y: LangVal) => LangVal): () => false | LangVal {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = list()
            if (xs === false) {
                return error()
            }
            if (!construction_p(xs)) {
                return error()
            }
            const x = construction_tail(xs)
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return error()
            }
            return k(construction_head(xs), construction_head(x))
        }
    }
    function make_read_three(prefix: string, k: (x: LangVal, y: LangVal, z: LangVal) => LangVal): () => false | LangVal {
        return () => {
            if (eof()) {
                return false
            }
            const c = get()
            if (c !== prefix) {
                put(c)
                return false
            }
            const xs = list()
            if (xs === false) {
                return error()
            }
            if (!construction_p(xs)) {
                return error()
            }
            const x = construction_tail(xs)
            if (!construction_p(x)) {
                return error()
            }
            const x_d = construction_tail(x)
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return error()
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d))
        }
    }
    const readeval = make_read_two("$", (e, x) => {
        const env = val2env(e)
        if (env === false) {
            return error()
        }
        return evaluate(env, x)
    })
    const readfuncapply = make_read_two("%", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        return builtin_func_apply(f, jsxs)
    })
    const readformbuiltin = make_read_three("@", (e, f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        const env = val2env(e)
        if (env === false) {
            return error()
        }
        return builtin_form_apply(env, f, jsxs)
    })
    const readapply = make_read_two("^", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => error())
        return apply(f, jsxs)
    })
    function a_symbol_p(x: string): boolean {
        if (a_space_p(x)) {
            return false
        }
        const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&'
        ]
        for (let i = 0; i < not_xs.length; i++) {
            if (x == not_xs[i]) {
                return false
            }
        }
        return true
    }
    function val(): LangVal {
        space()
        const fs: Array<() => false | LangVal> = [list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply]
        for (let i = 0; i < fs.length; i++) {
            const x: false | LangVal = fs[i]()
            if (x !== false) {
                return x
            }
        }
        return error()
    }
    return val() // 大量重複代碼 read <-> complex_parse ]]]
    function un_maybe<T>(x: false | T): T {
        if (x === false) {
            return error()
        }
        return x
    }
    function not_eof() {
        return !eof()
    }
    function assert_get(c: string) {
        un_maybe(not_eof())
        un_maybe(get() === c)
    }
    function readsysname_no_pack(): false | LangVal {
        if (eof()) {
            return false
        }
        const head = get()
        switch (head) {
            case '&': {
                un_maybe(not_eof())
                const c0 = get()
                if (c0 === '+') {
                    const x = readsysname_no_pack_inner_must()
                    return new_list(form_symbol, new_list(system_symbol, x))
                }
                else {
                    put(c0)
                }
                const x = readsysname_no_pack_inner_must()
                return new_list(form_symbol, x)
            } case ':': {
                un_maybe(not_eof())
                const c0 = get()
                if (c0 === '&') {
                    assert_get('>')
                    const x = readsysname_no_pack_inner_must()
                    return new_list(typeAnnotation_symbol,
                        new_list(form_symbol,
                            new_list(function_symbol, something_symbol, x)),
                        theThing_symbol)
                }
                else if (c0 === '>') {
                    const x = readsysname_no_pack_inner_must()
                    return new_list(typeAnnotation_symbol,
                        new_list(function_symbol, something_symbol, x),
                        theThing_symbol)
                } else {
                    put(c0)
                }
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_symbol, x, theThing_symbol)
            } case '+': {
                const x = readsysname_no_pack_inner_must()
                return new_list(system_symbol, x)
            } case '[': {
                const x = readsysname_no_pack_inner_must()
                assert_get(']')
                return may_xfx_xf(x)
            } case '_': {
                assert_get(':')
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_symbol, x, something_symbol)
            } default: {
                put(head)
                const x = symbol()
                if (x === false) {
                    return false
                }
                return may_xfx_xf(x)
            }
        }
        return ERROR()
        function readsysname_no_pack_inner_must(strict = false): LangVal {
            function readsysname_no_pack_bracket() {
                assert_get('[')
                const x = readsysname_no_pack_inner_must()
                assert_get(']')
                return x
            }
            // 重複自val()
            const fs: Array<() => false | LangVal> = strict ? [list, symbol, readsysname_no_pack_bracket, data,
                readerror, readeval, readfuncapply, readformbuiltin, readapply] :
                [list, readsysname_no_pack, data,
                    readerror, readeval, readfuncapply, readformbuiltin, readapply]
            for (let i = 0; i < fs.length; i++) {
                const x: false | LangVal = fs[i]()
                if (x !== false) {
                    return x
                }
            }
            return error()
        }
        function may_xfx_xf(x: LangVal): LangVal {
            if (eof()) {
                return x
            }
            const head = get()
            switch (head) {
                case '.': {
                    const y = readsysname_no_pack_inner_must()
                    return new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(x), something_symbol), y)
                } case ':': {
                    const y = readsysname_no_pack_inner_must()
                    return new_list(typeAnnotation_symbol, y, x)
                } case '~': {
                    return new_list(isOrNot_symbol, x)
                } case '@': {
                    const y = readsysname_no_pack_inner_must()
                    return new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(x, something_symbol), something_symbol), y)
                } case '?': {
                    return new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, x))
                } case '/': {
                    let ys: Array<LangVal> = []
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
                    return new_list(sub_symbol, x, jsArray_to_list(ys))
                } default: {
                    put(head)
                    return x
                }
            }
            return ERROR()
        }
        return ERROR()
    }
    function readsysname() {
        const x = readsysname_no_pack()
        if (x === false) {
            return false
        }
        if (symbol_p(x)) {
            return x
        }
        return systemName_make(x)
    }
}
export { complex_parse }
function complex_print(val: LangVal): string {
    function print_sys_name(x: LangVal, where: 'inner' | 'top'): string {
        // 是 complex_print(systemName_make(x))
        // x : LangVal
        // inner : JSBoolean
        if (symbol_p(x)) {
            return un_symbol(x)
        }
        function inner_bracket(x: string): string {
            if (where === 'inner') {
                return '[' + x + ']'
            } else if (where === 'top') {
                return x
            }
            return ERROR()
        }
        const maybe_xs = maybe_list_to_jsArray(x)
        if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], typeAnnotation_symbol)) {
            // new_list(typeAnnotation_symbol, maybe_xs[1], maybe_xs[2])
            const maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1])
            if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], function_symbol)) {
                // new_list(typeAnnotation_symbol, new_list(function_symbol, maybe_lst_2[1], maybe_lst_2[2]), maybe_xs[2])
                const maybe_lst_3 = maybe_list_to_jsArray(maybe_lst_2[1])
                if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(maybe_lst_3[0]), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(maybe_lst_3[0], 'inner') + '.' + print_sys_name(maybe_xs[2], 'inner'))
                }
                else if (construction_p(maybe_lst_2[1]) && jsbool_no_force_equal_p(construction_tail(maybe_lst_2[1]), something_symbol) && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(construction_head(maybe_lst_2[1]), something_symbol), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(construction_head(maybe_lst_2[1]), 'inner') + '@' + print_sys_name(maybe_xs[2], 'inner'))
                } else if (jsbool_no_force_equal_p(maybe_lst_2[1], something_symbol) && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, maybe_lst_2[2]), theThing_symbol)
                    return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], 'inner'))
                }
            } const maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2])
            if (jsbool_no_force_equal_p(maybe_xs[1], function_symbol) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isOrNot_symbol)) {
                // new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, maybe_lst_44[1]))
                return inner_bracket(print_sys_name(maybe_lst_44[1], 'inner') + '?')
            }
            if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) && jsbool_no_force_equal_p(maybe_lst_2[0], form_symbol)) {
                // new_list(typeAnnotation_symbol, new_list(form_symbol, maybe_lst_2[1]), theThing_symbol)
                const maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1])
                if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], function_symbol) && jsbool_no_force_equal_p(maybe_lst_88[1], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, maybe_lst_88[2])), theThing_symbol)
                    return inner_bracket(':&>' + print_sys_name(maybe_lst_88[2], 'inner'))
                }
            }
            const hd: string = jsbool_no_force_equal_p(maybe_xs[2], something_symbol) ? '_' :
                jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) ? '' :
                    print_sys_name(maybe_xs[2], 'inner')
            return inner_bracket(hd + ':' + print_sys_name(maybe_xs[1], 'inner'))
        }
        else if (maybe_xs !== false && maybe_xs.length === 2) {
            if (jsbool_no_force_equal_p(maybe_xs[0], form_symbol)) {
                // new_list(form_symbol, maybe_xs[1])
                const maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1])
                if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], system_symbol)) {
                    // new_list(form_symbol, new_list(system_symbol, maybe_lst_288[1]))
                    return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], 'inner'))
                }
                return inner_bracket('&' + print_sys_name(maybe_xs[1], 'inner'))
            } else if (jsbool_no_force_equal_p(maybe_xs[0], isOrNot_symbol)) {
                // new_list(isOrNot_symbol, maybe_xs[1])
                return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + '~')
            } else if (jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
                // new_list(system_symbol, maybe_xs[1])
                return inner_bracket('+' + print_sys_name(maybe_xs[1], 'inner'))
            }
        } else if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], sub_symbol)) {
            // new_list(sub_symbol, maybe_xs[1], maybe_xs[2])
            const maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[2])
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
            return print(systemName_make(x))
        }
        return ERROR()
    }
    // [[[ 大量重複代碼 print <-> complex_print
    let x = read(print(val)) // 去除所有just
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
        if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_symbol) && jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
            // systemName_make(maybe_xs[1])
            return print_sys_name(maybe_xs[1], 'top')
        }
        return "#" + complex_print(new_construction(name, list))
    } else if (error_p(x)) {
        return "!" + complex_print(new_construction(error_name(x), error_list(x)))
    } else if (symbol_p(x)) {
        return un_symbol(x)
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
    return ERROR() // 大量重複代碼 print <-> complex_print ]]]
}
export { complex_print }
// 相對獨立的部分。complex parser/complex printer }}}

// {{{ 相對獨立的部分。IO
const return_inputOutput_systemName = complex_parse('效應/[:物]')
const bind_inputOutput_systemName = complex_parse('效應/連')
const ecmascript_systemName = systemName_make(complex_parse('(為符名連 e c m a s c r i p t)'))
export {
    return_inputOutput_systemName,
    bind_inputOutput_systemName,
    ecmascript_systemName
}
//WIP
// 相對獨立的部分。IO }}}
