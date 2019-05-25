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

// 用export{}，不用export const .../export function...，否則生成的ES3代碼內部使用exports，使其他代碼有能力破壞，而且性能不夠好

function LANG_ERROR(): never {
    throw "TheLanguage PANIC"
}
function LANG_ASSERT(x: boolean): void {
    if (!x) {
        return LANG_ERROR()
    }
}

type OrFalse<x> = x | false

// {{{ 相對獨立的部分。UUC
let symbols_set: (() => Symbols_Set) = () => {
    const r = symbols_set_init()
    symbols_set = () => r
    return r
}
let symbols_set_neg: (() => Symbols_Set_Neg) = () => {
    const r = symbols_set_neg_init()
    symbols_set_neg = () => r
    return r
}
// 相對獨立的部分。UUC }}}


// {{{ 相對獨立的部分。內建數據結構
// 如果沒有const不能過google-closure-compiler -O ADVANCED
const enum LangValType {
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

    hole_t,

    comment_t,
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

// 以下爲對TypeScript類型系統的hack，因爲不支援遞回的`type`

export type LangValSymbolUnicodecharG<a extends keyof Symbols_Set_Neg> = [LangValType.symbol_t, a]
export type LangValSymbol = LangValSymbolUnicodecharG<keyof Symbols_Set_Neg>

export type LangValConsG<a extends LangVal, b extends LangVal> = [LangValType.construction_t, a, b]
interface LangValConsI extends LangValConsG<LangVal, LangVal> { }
export type LangValCons = LangValConsI & [LangValType.construction_t, HackRec_LangVal, HackRec_LangVal]

export type LangValNull = [LangValType.null_t]

export type LangValDataG<a extends LangVal, b extends LangVal> = [LangValType.data_t, a, b]
interface LangValDataI extends LangValDataG<LangVal, LangVal> { }
export type LangValData = LangValDataI & [LangValType.data_t, HackRec_LangVal, HackRec_LangVal]

export type LangValErrorG<a extends LangVal, b extends LangVal> = [LangValType.error_t, a, b]
interface LangValErrorI extends LangValErrorG<LangVal, LangVal> { }
export type LangValError = LangValErrorI & [LangValType.error_t, HackRec_LangVal, HackRec_LangVal]

export type LangValJustG<a extends LangVal> = [LangValType.just_t, a, false, false]
interface LangValJustI extends LangValJustG<LangVal> { }
export type LangValJust = LangValJustI & [LangValType.just_t, HackRec_LangVal, false, false]

type LangValDelayEvaluateG<a extends Env, b extends LangVal> = [LangValType.delay_evaluate_t, a, b]
interface LangValDelayEvaluateI extends LangValDelayEvaluateG<Env, LangVal> { }
type LangValDelayEvaluate = LangValDelayEvaluateI & [LangValType.delay_evaluate_t, HackRec_Env, HackRec_LangVal]

type LangValDelayBuiltinFuncG<a extends LangVal, b extends Array<LangVal>> = [LangValType.delay_builtin_func_t, a, b]
interface LangValDelayBuiltinFuncI extends LangValDelayBuiltinFuncG<LangVal, Array<LangVal>> { }
type LangValDelayBuiltinFunc = LangValDelayBuiltinFuncI & [LangValType.delay_builtin_func_t, HackRec_LangVal, Array<HackRec_LangVal>]

type LangValDelayBuiltinFormG<a extends Env, b extends LangVal, c extends Array<LangVal>> = [LangValType.delay_builtin_form_t, a, b, c]
interface LangValDelayBuiltinFormI extends LangValDelayBuiltinFormG<Env, LangVal, Array<LangVal>> { }
type LangValDelayBuiltinForm = LangValDelayBuiltinFormI & [LangValType.delay_builtin_form_t, HackRec_Env, HackRec_LangVal, Array<HackRec_LangVal>]

type LangValDelayApplyG<a extends LangVal, b extends Array<LangVal>> = [LangValType.delay_apply_t, a, b]
interface LangValDelayApplyI extends LangValDelayApplyG<LangVal, Array<LangVal>> { }
type LangValDelayApply = LangValDelayApplyI & [LangValType.delay_apply_t, HackRec_LangVal, Array<HackRec_LangVal>]

export type LangValDelay = LangValDelayEvaluate | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply
export type LangValDelayG<a extends LangVal> = LangValDelay // 可能不可用類型描述
export type LangValJustDelay = LangValJust | LangValDelay
export type LangValJustDelayG<a extends LangVal> = LangValJustDelay // 可能不可用類型描述
export type LangValSysNameG<x extends LangVal> = SystemName_Make<x>
export type LangValSysName = LangValSysNameG<LangVal>
export type LangValName = LangValData | LangValSymbol

const comment_t = LangValType.comment_t
export type LangValCommentG<a extends LangVal, b extends LangVal> = [LangValType.comment_t, a, b]
interface LangValCommentI extends LangValCommentG<LangVal, LangVal> { }
export type LangValComment = LangValCommentI & LangValCommentG<HackRec_LangVal, HackRec_LangVal>

const hole_t = LangValType.hole_t
type LangValHole = [LangValType.hole_t]
export type LangVal = LangValSymbol | LangValCons | LangValNull | LangValData | LangValError | LangValJust | LangValDelayEvaluate | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply | LangValComment | LangValHole
type HackRec_LangVal = any
type HackRec_Env = any


/* !!!Racket Code Generator!!! (string-append "// TEST Racket Code Generator 0\n"
"// TEST Racket Code Generator 1\n"
"// TEST Racket Code Generator 2\n") */
// !!!Generated by Racket!!! !!!BEGIN!!!
// TEST Racket Code Generator 0
// TEST Racket Code Generator 1
// TEST Racket Code Generator 2

// !!!Generated by Racket!!! !!!END!!!

function new_comment<C extends LangVal, X extends LangVal>(comment: C, x: X): LangValCommentG<C, X> {
    return [comment_t, comment, x]
}
function comment_p(x: LangVal): x is LangValComment {
    return x[0] === comment_t
}
function comment_comment<C extends LangVal, X extends LangVal>(x: LangValCommentG<C, X>): C {
    return x[1]
}
function comment_x<C extends LangVal, X extends LangVal>(x: LangValCommentG<C, X>): X {
    return x[2]
}
function un_comment_all(x: LangVal): LangVal {
    while (comment_p(x)) {
        x = comment_x(x)
    }
    return x
}
export { new_comment, comment_p, comment_comment, comment_x, un_comment_all }

function can_new_symbol_unicodechar_p(x: string): x is keyof Symbols_Set_Neg {
    return x in symbols_set_neg()
}
type New_Symbol_Unicodechar<X extends keyof Symbols_Set_Neg> = LangValSymbolUnicodecharG<X>
function new_symbol_unicodechar<X extends keyof Symbols_Set_Neg>(x: X): New_Symbol_Unicodechar<X> {
    return [symbol_t, x]
}
function symbol_p(x: LangVal): x is LangValSymbol {
    return x[0] === symbol_t
}
function un_symbol_unicodechar<X extends keyof Symbols_Set_Neg>(x: LangValSymbolUnicodecharG<X>): X {
    return x[1]
}
function can_new_symbol_p(x: string): x is keyof Symbols_Set {
    return x in symbols_set()
}
type New_Symbol<X extends keyof Symbols_Set> = New_Symbol_Unicodechar<Symbols_Set[X]>
function new_symbol<X extends keyof Symbols_Set>(x: X): New_Symbol<X> {
    return new_symbol_unicodechar(symbols_set()[x])
}
function un_symbol(x: LangValSymbol): keyof Symbols_Set {
    return symbols_set_neg()[un_symbol_unicodechar(x)]
}
export { can_new_symbol_p, New_Symbol, new_symbol, symbol_p, un_symbol }

type New_Construction<X extends LangVal, Y extends LangVal> = LangValConsG<X, Y>
function new_construction<X extends LangVal, Y extends LangVal>(x: X, y: Y): New_Construction<X, Y> {
    return [construction_t, x, y]
}
function construction_p(x: LangVal): x is LangValCons {
    return x[0] === construction_t
}
function construction_head<X extends LangVal, Y extends LangVal>(x: LangValConsG<X, Y>): X {
    return x[1]
}
function construction_tail<X extends LangVal, Y extends LangVal>(x: LangValConsG<X, Y>): Y {
    return x[2]
}
export { New_Construction, new_construction, construction_p, construction_head, construction_tail }

type Null_V = LangValNull
const null_v: Null_V = [null_t]
function null_p(x: LangVal): x is LangValNull {
    return x[0] === null_t
}
export { Null_V, null_v, null_p }

type New_Data<X extends LangVal, Y extends LangVal> = LangValDataG<X, Y>
function new_data<X extends LangVal, Y extends LangVal>(x: X, y: Y): New_Data<X, Y> {
    return [data_t, x, y]
}
function data_p(x: LangVal): x is LangValData {
    return x[0] === data_t
}
function data_name<X extends LangVal, Y extends LangVal>(x: LangValDataG<X, Y>): X {
    return x[1]
}
function data_list<X extends LangVal, Y extends LangVal>(x: LangValDataG<X, Y>): Y {
    return x[2]
}
export { New_Data, new_data, data_p, data_name, data_list }

type New_Error<X extends LangVal, Y extends LangVal> = LangValErrorG<X, Y>
function new_error<X extends LangVal, Y extends LangVal>(x: X, y: Y): New_Error<X, Y> {
    return [error_t, x, y]
}
function error_p(x: LangVal): x is LangValError {
    return x[0] === error_t
}
function error_name<X extends LangVal, Y extends LangVal>(x: LangValErrorG<X, Y>): X {
    return x[1]
}
function error_list<X extends LangVal, Y extends LangVal>(x: LangValErrorG<X, Y>): Y {
    return x[2]
}
export { New_Error, new_error, error_p, error_name, error_list }

function just_p(x: LangVal): x is LangValJust {
    return x[0] === just_t
}
export { just_p }
function un_just(x: LangValJust): LangVal {
    return x[1]
}
function evaluate(x: Env, y: LangVal): LangValDelayEvaluate {
    return [delay_evaluate_t, x, y]
}
export { evaluate }
function delay_evaluate_p(x: LangVal): x is LangValDelayEvaluate {
    return x[0] === delay_evaluate_t
}
function delay_evaluate_env(x: LangValDelayEvaluate): Env {
    return x[1]
}
function delay_evaluate_x(x: LangValDelayEvaluate): LangVal {
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

function apply(f: LangVal, xs: Array<LangVal>): LangValDelayApply {
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
function force_all_rec(raw: LangVal): LangVal {
    const x = force_all(raw)
    function conslike<S, T extends [S, LangVal, LangVal] & LangVal>(xx: T & Array<any>): T & Array<any> {
        xx[1] = force_all_rec(xx[1])
        xx[2] = force_all_rec(xx[2])
        return xx
    }
    if (data_p(x)) {
        return conslike(x)
    } else if (error_p(x)) {
        return conslike(x)
    } else if (construction_p(x)) {
        return conslike(x)
    } else if (comment_p(x)) {
        return conslike(x)
    }
    return x
}
function force_uncomment_all_rec(raw: LangVal): LangVal {
    const x = force_uncomment_all(raw)
    function conslike<S, T extends [S, LangVal, LangVal] & LangVal>(xx: T & Array<any>): T & Array<any> {
        xx[1] = force_all_rec(xx[1])
        xx[2] = force_all_rec(xx[2])
        if (comment_p(xx[1]) || comment_p(xx[2])) {
            const ret: T & Array<any> = lang_copy_do(xx)
            const a: LangVal = xx[1]
            const d: LangVal = xx[2]
            const a1: LangVal = force_uncomment_all_rec(a)
            const d1: LangVal = force_uncomment_all_rec(d)
            ret[1] = a1
            ret[2] = d1
            return ret
        } else {
            return xx
        }
    }
    if (data_p(x)) {
        return conslike(x)
    } else if (error_p(x)) {
        return conslike(x)
    } else if (construction_p(x)) {
        return conslike(x)
    }
    return x
}
export { force_all_rec, force_uncomment_all_rec }

function new_hole_do(): LangValHole {
    return [hole_t]
}
function hole_p(x: LangVal): x is LangValHole {
    return x[0] === hole_t
}
function lang_set_do(x: LangVal, y: LangVal): void {
    // 只用于x与y等价的情况
    if (x === y) {
        return
    }
    x[0] = just_t
    x[1] = y
    x[2] = false
    x[3] = false
}
function hole_set_do(rawx: LangValHole, rawy: LangVal): void {
    LANG_ASSERT(hole_p(rawx)) // 可能曾经是hole，现在不是。
    LANG_ASSERT(!hole_p(rawy)) // 複製hole則意義改變。
    const x = rawx as Array<any>
    const y = rawy as Array<any>
    x[0] = y[0]
    x[1] = y[1]
    x[2] = y[2]
    x[3] = y[3]
}
function lang_copy_do<T extends LangVal>(x: T): T {
    const ret = new_hole_do()
    hole_set_do(ret, x)
    return ret as any // type WIP
}
// 相對獨立的部分。內建數據結構 }}}

// {{{ 相對獨立的部分。符號名稱

type System_Symbol = New_Symbol<"太始初核">
const system_symbol: System_Symbol = new_symbol("太始初核")
type Name_Symbol = New_Symbol<"符名">
const name_symbol: Name_Symbol = new_symbol("符名")
const function_symbol = new_symbol("化滅")
const form_symbol = new_symbol("式形")
const equal_symbol = new_symbol("等同")
const evaluate_sym = new_symbol("解算")
const theThing_symbol = new_symbol("特定其物")
type Something_Symbol = New_Symbol<"省略一物">
const something_symbol: Something_Symbol = new_symbol("省略一物")
const mapping_symbol = new_symbol("映表")
const if_symbol = new_symbol("如若")
type TypeAnnotation_Symbol = New_Symbol<"一類何物">
const typeAnnotation_symbol: TypeAnnotation_Symbol = new_symbol("一類何物")
const isOrNot_symbol = new_symbol("是非")
type Sub_Symbol = New_Symbol<"其子">
const sub_symbol: Sub_Symbol = new_symbol("其子")
const true_symbol = new_symbol("爻陽")
const false_symbol = new_symbol("爻陰")
const quote_symbol = new_symbol("引用")
const apply_symbol = new_symbol("應用")
const null_symbol = new_symbol("間空")
type Construction_Symbol = New_Symbol<"連頸">
const construction_symbol: Construction_Symbol = new_symbol("連頸")
const data_symbol = new_symbol("構物")
const error_symbol = new_symbol("謬誤")
const symbol_symbol = new_symbol("詞素")
const list_symbol = new_symbol("列序")
const head_symbol = new_symbol("首始")
const tail_symbol = new_symbol("尾末")
type Thing_Symbol = New_Symbol<"之物">
const thing_symbol: Thing_Symbol = new_symbol("之物")
const theWorldStopped_symbol = new_symbol("宇宙亡矣")
type Effect_Symbol = New_Symbol<"效應">
const effect_symbol: Effect_Symbol = new_symbol("效應")
//unused//const sequentialWordFormation_symbol = new_symbol('為符名連')
//unused//const inputOutput_symbol = new_symbol("出入改滅")
const comment_symbol = new_symbol("註疏")

const the_world_stopped_v: LangVal = new_error(system_symbol, new_list(theWorldStopped_symbol, something_symbol))

// 指內建標識符系統
type SystemName_Make<X extends LangVal> = New_Data<Name_Symbol, New_Construction<System_Symbol, New_Construction<X, Null_V>>>
function systemName_make<X extends LangVal>(x: X): SystemName_Make<X> {
    return new_data(name_symbol, new_construction(system_symbol, new_construction(x, null_v)))
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

const comment_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, comment_symbol))
const comment_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, form_symbol, comment_symbol))

const false_v: LangVal = new_data(false_symbol, new_list())
const true_v: LangVal = new_data(true_symbol, new_list())
function symbol_equal_p(x: LangValSymbol, y: LangValSymbol): boolean {
    if (x === y) {
        return true
    }
    if (un_symbol_unicodechar(x) === un_symbol_unicodechar(y)) {
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
        lang_set_do(v, x)
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
export { delay_p, delay_just_p }

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

function force_all_inner(
    raw: LangVal,
    parents_history: { [key: string]: true } = {},
    ref_novalue_replace: [boolean, boolean] = [false, false],
    xs: Array<LangVal> = []): LangVal {
    // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
    let history: { [key: string]: true } = {}
    let x: LangVal = raw
    function do_rewrite(newval: LangVal): LangVal {
        lang_set_do(x, newval)
        for (let i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], newval)
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
                    symbol_p_function_builtin_systemName,
                    null_p_function_builtin_systemName]
                let is_elim = false
                for (const elim_s_v of elim_s) {
                    if (jsbool_equal_p(elim_s_v, f)) {
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
                if (jsbool_equal_p(f, equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, apply_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped() //WIP
                } else if (jsbool_equal_p(f, if_function_builtin_systemName)) {
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
    lang_set_do(x, ret)
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
export { force_all, force1, force_uncomment1, force_uncomment_all }
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
    return LANG_ERROR()
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

function val2env(x: LangVal): OrFalse<Env> {
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
        let not_breaked: boolean = true
        for (let i = 0; i < ret.length; i = i + 2) {
            if (jsbool_equal_p(ret[i + 0], k)) {
                ret[i + 1] = v
                not_breaked = false
                break
            }
        }
        if (not_breaked) {
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
    val2env,
}
// 相對獨立的部分。變量之環境 }}}

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
    let stack1 = [x]
    let stack2 = [y]
    while (stack1.length !== 0) {
        const [ret1, new_stack1] = machinetext_print_step(stack1)
        const [ret2, new_stack2] = machinetext_print_step(stack2)
        if (ret1.length !== ret2.length) { return false }
        for (let i = 0; i < ret1.length; i++) {
            if (ret1[i] !== ret2[i]) { return false }
        }
        stack1 = new_stack1
        stack2 = new_stack2
    }
    return stack2.length === 0
}

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
    } else if (symbol_p(x)) {
        return un_symbol(x)
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
    function symbol() {
        if (eof()) {
            return false
        }
        let x = get()
        let ret: string = ""
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
        if (can_new_symbol_p(ret)) {
            return new_symbol(ret)
        } else {
            return parse_error("Not Symbol" + ret)
        }
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
    function a_symbol_p(chr: string): boolean {
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
            fs = [readlist, symbol, readsysname_no_pack_bracket, data,
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
            return new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(vl), something_symbol), y)
        } else if (head === ':') {
            const y = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_symbol, y, vl)
        } else if (head === '~') {
            return new_list(isOrNot_symbol, vl)
        } else if (head === '@') {
            const y = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(vl, something_symbol), something_symbol), y)
        } else if (head === '?') {
            return new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, vl))
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
            return new_list(sub_symbol, jsArray_to_list(ys))
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
                return new_list(form_symbol, new_list(system_symbol, x))
            } else {
                put(c0)
            }
            const x = readsysname_no_pack_inner_must()
            return new_list(form_symbol, x)
        } else if (head === ':') {
            un_maybe(not_eof())
            const c0 = get()
            if (c0 === '&') {
                assert_get('>')
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_symbol,
                    new_list(form_symbol,
                        new_list(function_symbol, something_symbol, x)),
                    theThing_symbol)
            } else if (c0 === '>') {
                const x = readsysname_no_pack_inner_must()
                return new_list(typeAnnotation_symbol,
                    new_list(function_symbol, something_symbol, x),
                    theThing_symbol)
            } else {
                put(c0)
            }
            const x = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_symbol, x, theThing_symbol)
        } else if (head === '+') {
            const x = readsysname_no_pack_inner_must()
            return new_list(system_symbol, x)
        } else if (head === '[') {
            const x = readsysname_no_pack_inner_must()
            assert_get(']')
            return may_xfx_xf(x)
        } else if (head === '_') {
            assert_get(':')
            const x = readsysname_no_pack_inner_must()
            return new_list(typeAnnotation_symbol, x, something_symbol)
        } else {
            put(head)
            const x = symbol()
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
        if (symbol_p(x)) {
            return x
        }
        return systemName_make(x)
    }
}
export { complex_parse }
function complex_print(val: LangVal): string {
    function print_sys_name(x: LangVal, is_inner_bool: boolean): string {
        // 是 complex_print(systemName_make(x))
        if (symbol_p(x)) {
            return un_symbol(x)
        }
        function inner_bracket(vl: string): string {
            if (is_inner_bool) {
                return '[' + vl + ']'
            } else {
                return vl
            }
        }
        const maybe_xs = maybe_list_to_jsArray(x)
        if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], typeAnnotation_symbol)) {
            // new_list(typeAnnotation_symbol, maybe_xs[1], maybe_xs[2])
            const maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1])
            if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], function_symbol)) {
                const var_2_1 = maybe_lst_2[1]
                // new_list(typeAnnotation_symbol, new_list(function_symbol, var_2_1, maybe_lst_2[2]), maybe_xs[2])
                const maybe_lst_3 = maybe_list_to_jsArray(var_2_1)
                if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(maybe_lst_3[0]), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(maybe_lst_3[0], true) + '.' + print_sys_name(maybe_xs[2], true))
                } else if (construction_p(var_2_1) && jsbool_no_force_equal_p(construction_tail(var_2_1), something_symbol) && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(construction_head(var_2_1), something_symbol), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(construction_head(var_2_1), true) + '@' + print_sys_name(maybe_xs[2], true))
                } else if (jsbool_no_force_equal_p(var_2_1, something_symbol) && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, maybe_lst_2[2]), theThing_symbol)
                    return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], true))
                }
            } const maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2])
            if (jsbool_no_force_equal_p(maybe_xs[1], function_symbol) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isOrNot_symbol)) {
                // new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, maybe_lst_44[1]))
                return inner_bracket(print_sys_name(maybe_lst_44[1], true) + '?')
            }
            if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) && jsbool_no_force_equal_p(maybe_lst_2[0], form_symbol)) {
                // new_list(typeAnnotation_symbol, new_list(form_symbol, var_2_1), theThing_symbol)
                const maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1])
                if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], function_symbol) && jsbool_no_force_equal_p(maybe_lst_88[1], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, maybe_lst_88[2])), theThing_symbol)
                    return inner_bracket(':&>' + print_sys_name(maybe_lst_88[2], true))
                }
            }
            const hd: string = jsbool_no_force_equal_p(maybe_xs[2], something_symbol) ? '_' :
                jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) ? '' :
                    print_sys_name(maybe_xs[2], true)
            return inner_bracket(hd + ':' + print_sys_name(maybe_xs[1], true))
        } else if (maybe_xs !== false && maybe_xs.length === 2) {
            if (jsbool_no_force_equal_p(maybe_xs[0], form_symbol)) {
                // new_list(form_symbol, maybe_xs[1])
                const maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1])
                if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], system_symbol)) {
                    // new_list(form_symbol, new_list(system_symbol, maybe_lst_288[1]))
                    return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], true))
                }
                return inner_bracket('&' + print_sys_name(maybe_xs[1], true))
            } else if (jsbool_no_force_equal_p(maybe_xs[0], isOrNot_symbol)) {
                // new_list(isOrNot_symbol, maybe_xs[1])
                return inner_bracket(print_sys_name(maybe_xs[1], true) + '~')
            } else if (jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
                // new_list(system_symbol, maybe_xs[1])
                return inner_bracket('+' + print_sys_name(maybe_xs[1], true))
            } else if (jsbool_no_force_equal_p(maybe_xs[0], sub_symbol)) {
                // new_list(sub_symbol, maybe_xs[1])
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
        if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_symbol) && jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
            // systemName_make(maybe_xs[1])
            return print_sys_name(maybe_xs[1], false)
        }
        return "#" + complex_print(new_construction(name, list))
    } else if (error_p(x)) {
        return "!" + complex_print(new_construction(error_name(x), error_list(x)))
    } else if (symbol_p(x)) {
        return un_symbol(x)
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


// {{{ 相對獨立的部分。machinetext parse/print
// 註疏系統WIP
function machinetext_parse(rawstr: string): LangVal {
    const result = new_hole_do()
    let stack: Array<(x: LangVal) => void> = [(x) => hole_set_do(result, x)]
    let state = 0
    function parse_error(): never {
        throw 'MT parse ERROR'
    }
    function parse_assert(x: boolean): void {
        if (!x) { return parse_error() }
    }
    function get_do(): string {
        parse_assert(rawstr.length > state)
        const result: string = rawstr[state]
        state++
        return result
    }
    let callbacks: Array<() => void> = []
    while (stack.length !== 0) {
        const new_stack: Array<(x: LangVal) => void> = []
        for (const hol of stack) {
            const chr: string = get_do()
            const conslike = (c: (x: LangVal, y: LangVal) => LangVal) => {
                const hol1 = new_hole_do()
                const hol2 = new_hole_do()
                new_stack.push((x) => hole_set_do(hol1, x))
                new_stack.push((x) => hole_set_do(hol2, x))
                hol(c(hol1, hol2))
            }
            if (chr === '^') {
                let tmp: string = ''
                while (true) {
                    const chr: string = get_do()
                    if (chr === '^') { break }
                    tmp += chr
                }
                if (can_new_symbol_unicodechar_p(tmp)) {
                    hol(new_symbol_unicodechar(tmp))
                } else {
                    return parse_error()
                }
            } else if (chr === '.') {
                conslike(new_construction)
            } else if (chr === '#') {
                conslike(new_data)
            } else if (chr === '!') {
                conslike(new_error)
            } else if (chr === '$') {
                let env: OrFalse<LangVal> = false
                let v_x: OrFalse<LangVal> = false
                new_stack.push((x) => { env = x })
                new_stack.push((x) => { v_x = x })
                callbacks.push(() => {
                    if (env === false || v_x === false) {
                        return LANG_ERROR()
                    } else {
                        const r_env = val2env(env)
                        if (r_env === false) {
                            return parse_error()
                        } else {
                            hol(evaluate(r_env, v_x))
                        }
                    }
                })
            } else if (chr === '_') {
                hol(null_v)
            } else {
                return parse_error()
            }
        }
        stack = new_stack
    }
    parse_assert(state === rawstr.length)
    for (let i = callbacks.length - 1; i >= 0; i--) {//順序有關。
        callbacks[i]()
    }
    return result
}
// 註疏系統WIP
// 此print或許可以小幅度修改後用於equal,合理的print無限數據... （廣度優先）
function machinetext_print_step(stack: Array<LangVal>): [Array<string>, Array<LangVal>] {
    const result: Array<string> = []
    const new_stack: Array<LangVal> = []
    for (let x of stack) {
        x = un_just_all(x)
        const conslike = function <T>(xx: T, s: string, g1: (x: T) => LangVal, g2: (x: T) => LangVal): void {
            result.push(s)
            new_stack.push(g1(xx))
            new_stack.push(g2(xx))
        }
        if (symbol_p(x)) {
            result.push('^')
            result.push(un_symbol_unicodechar(x))
            result.push('^')
        } else if (construction_p(x)) {
            conslike(x, '.', construction_head, construction_tail)
        } else if (null_p(x)) {
            result.push('_')
        } else if (data_p(x)) {
            conslike(x, '#', data_name, data_list)
        } else if (error_p(x)) {
            conslike(x, '!', error_name, error_list)
        } else if (delay_p(x)) {
            const y = delay2delay_evaluate(x)
            conslike(y, '$', ((vl) => env2val(delay_evaluate_env(vl))), delay_evaluate_x)
        } else {
            return LANG_ERROR()
        }
    }
    return [result, new_stack]
}
function machinetext_print(x: LangVal): string {
    let stack: Array<LangVal> = [x]
    let result: string = ""
    while (stack.length !== 0) {
        const [tmpret, new_stack] = machinetext_print_step(stack)
        for (const s of tmpret) {
            result += s
        }
        stack = new_stack
    }
    return result
}
export { machinetext_parse, machinetext_print }
// 相對獨立的部分。machinetext parse/print }}}

// {{{ 相對獨立的部分。trampoline
type TrampolineHelper<T> = () => ([false, T] | [true, Trampoline<T>])
export interface Trampoline<T> extends TrampolineHelper<T> { }
function trampoline_return<T>(x: T): Trampoline<T> {
    return () => [false, x]
}
function trampoline_delay<T>(x: () => Trampoline<T>): Trampoline<T> {
    return () => [true, x()]
}
function run_trampoline<T>(x: Trampoline<T>): T {
    let i = x()
    while (i[0]) {
        i = i[1]()
    }
    return i[1]
}
export { trampoline_return, trampoline_delay, run_trampoline }
// 相對獨立的部分。trampoline }}}

// {{{ 相對獨立的部分。Effect
type Return_Effect_SystemName = SystemName_Make<New_Construction<Sub_Symbol, New_Construction<New_Construction<Effect_Symbol, New_Construction<New_Construction<TypeAnnotation_Symbol, New_Construction<Thing_Symbol, New_Construction<Something_Symbol, Null_V>>>, Null_V>>, Null_V>>>
const return_effect_systemName: Return_Effect_SystemName = systemName_make(new_construction(sub_symbol, new_construction(new_construction(effect_symbol, new_construction(new_construction(typeAnnotation_symbol, new_construction(thing_symbol, new_construction(something_symbol, null_v))), null_v)), null_v)))
type Bind_Effect_SystemName = SystemName_Make<New_Construction<Sub_Symbol, New_Construction<New_Construction<Effect_Symbol, New_Construction<Construction_Symbol, Null_V>>, Null_V>>>
const bind_effect_systemName: Bind_Effect_SystemName = systemName_make(new_construction(sub_symbol, new_construction(new_construction(effect_symbol, new_construction(construction_symbol, null_v)), null_v)))
function new_effect_bind(monad: LangVal, func: LangVal): LangVal {
    return new_data(bind_effect_systemName, new_list(monad, func))
}
function new_effect_return(x: LangVal): LangVal {
    return new_data(return_effect_systemName, x)
}
// 註疏系統WIP
function run_monad_helper<St, T>(
    return_handler: (val: LangVal, state: St) => Trampoline<T>,
    op_handler: (op: LangVal, state: St, resume: (val: LangVal, state: St) => Trampoline<T>) => Trampoline<T>,
    code: LangVal,
    state: St,
    next: OrFalse<LangVal> = false,
): Trampoline<T> {
    function make_bind(x: LangVal, f: LangVal): LangVal {
        throw 'WIP'
    }

    code = force_all(code)
    if (data_p(code)) {
        const name = data_name(code)
        let list = data_list(code)
        if (jsbool_equal_p(name, return_effect_systemName)) {
            list = force_all(list)
            if (construction_p(list)) {
                const list_a = construction_head(list)
                const list_d = force_all(construction_tail(list))
                if (null_p(list_d)) {
                    if (next === false) {
                        const upval_v = list_a // luaj有BUG，只能這樣寫
                        const upval_st = state
                        const r = () => return_handler(upval_v, upval_st)
                        return trampoline_delay(r)
                    } else {
                        const upval_rt = return_handler // luaj有BUG，只能這樣寫
                        const upval_op = op_handler
                        const upval_v = list_a
                        const upval_st = state
                        const r = () => run_monad_helper(upval_rt, upval_op, apply(next, upval_v), upval_st)
                        return trampoline_delay(r)
                    }
                }
            }
        } else if (jsbool_equal_p(name, bind_effect_systemName)) {
            list = force_all(list)
            if (construction_p(list)) {
                const list_a = construction_head(list)
                const list_d = force_all(construction_tail(list))
                if (construction_p(list_d)) {
                    const list_d_a = construction_head(list_d)
                    const list_d_d = force_all(construction_tail(list_d))
                    if (null_p(list_d_d)) {
                        if (next === false) {
                            const upval_rt = return_handler // luaj有BUG，只能這樣寫
                            const upval_op = op_handler
                            const upval_a = list_a
                            const upval_b = list_d_a
                            const upval_st = state
                            const r = () => run_monad_helper(upval_rt, upval_op, upval_a, upval_st, upval_b)
                            return trampoline_delay(r)
                        } else {
                            const upval_rt = return_handler// luaj有BUG，只能這樣寫
                            const upval_op = op_handler
                            const upval_a = list_a
                            const upval_b = list_d_a
                            const upval_st = state
                            const upval_nt = next
                            const x = new_symbol('序甲')
                            const r = () => run_monad_helper(upval_rt, upval_op, upval_a, upval_st, new_data(function_symbol, new_list(new_list(x), make_bind(new_list(make_quote(upval_b), x), make_quote(upval_nt)))))
                            return trampoline_delay(r)
                        }
                    }
                }
            }
        }
    }
    // op
    if (next === false) {
        return trampoline_delay(() => op_handler(code, state, return_handler))
    } else {
        return trampoline_delay(() => op_handler(code, state, (val2, state2) => trampoline_delay(() => run_monad_helper(return_handler, op_handler, apply(next, [val2]), state2))))
    }
}
// 註疏系統WIP
function run_monad_trampoline<St, T>(
    return_handler: (val: LangVal, state: St) => Trampoline<T>,
    op_handler: (op: LangVal, state: St, resume: (val: LangVal, state: St) => Trampoline<T>) => Trampoline<T>,
    code: LangVal,
    state: St,
): Trampoline<T> {
    return run_monad_helper(return_handler, op_handler, code, state)
}
function run_monad_stackoverflow<St, T>(
    return_handler: (val: LangVal, state: St) => T,
    op_handler: (op: LangVal, state: St, resume: (val: LangVal, state: St) => T) => T,
    code: LangVal,
    state: St,
): T {
    return run_trampoline(run_monad_helper(((v, s) => trampoline_return(return_handler(v, s))), ((op, st, rs) => trampoline_return(op_handler(op, st, (v, s) => run_trampoline(rs(v, s))))), code, state))
}

export {
    Return_Effect_SystemName,
    return_effect_systemName,
    Bind_Effect_SystemName,
    bind_effect_systemName,
    new_effect_bind,
    new_effect_return,
    run_monad_trampoline,
    run_monad_stackoverflow,
}
//WIP
// 相對獨立的部分。Effect }}}

// {{{ 相對獨立的部分。UUC
/* !!!Racket Code Generator!!!
(require (prefix-in uuc: "../../../ununicode/ununicode.rkt"))
((lambda ()

;; 字符串(`(symbol->string k)`)在不同平臺中排序是相同的。
(define all-char (make-immutable-hash (hash-map (uuc:all-char) (lambda (k v) (cons (symbol->string k) v)))))
(define symbols-set-v (string-append "{ " (apply string-append (add-between (hash-map all-char (lambda (xa xd) (string-append "\"" xa "\": \"" (string xd) "\"")) #t) ", ")) " }"))
(define symbols-set-neg-v (string-append "{ " (apply string-append (add-between (hash-map all-char (lambda (xa xd) (string-append "\"" (string xd) "\": \"" xa "\"")) #t) ", ")) " }"))

(define (v->t x) (string-replace x "," "\n"))

(string-append
  (string-append "interface Symbols_Set" (v->t symbols-set-v)) "\n"
  (string-append "function symbols_set_init():Symbols_Set{return " symbols-set-v "}") "\n"
  (string-append "interface Symbols_Set_Neg" (v->t symbols-set-neg-v)) "\n"
  (string-append "function symbols_set_neg_init():Symbols_Set_Neg{return " symbols-set-neg-v "}"))

))
*/
// !!!Generated by Racket!!! !!!BEGIN!!!
interface Symbols_Set {
    "0": "0"
    "1": "1"
    "2": "2"
    "3": "3"
    "4": "4"
    "5": "5"
    "6": "6"
    "7": "7"
    "8": "8"
    "9": "9"
    "A": "A"
    "B": "B"
    "C": "C"
    "D": "D"
    "E": "E"
    "F": "F"
    "G": "G"
    "H": "H"
    "I": "I"
    "J": "J"
    "K": "K"
    "L": "L"
    "M": "M"
    "N": "N"
    "O": "O"
    "P": "P"
    "Q": "Q"
    "R": "R"
    "S": "S"
    "T": "T"
    "U": "U"
    "V": "V"
    "W": "W"
    "X": "X"
    "Y": "Y"
    "Z": "Z"
    "a": "a"
    "b": "b"
    "c": "c"
    "d": "d"
    "e": "e"
    "f": "f"
    "g": "g"
    "h": "h"
    "i": "i"
    "j": "j"
    "k": "k"
    "l": "l"
    "m": "m"
    "n": "n"
    "o": "o"
    "p": "p"
    "q": "q"
    "r": "r"
    "s": "s"
    "t": "t"
    "u": "u"
    "v": "v"
    "w": "w"
    "x": "x"
    "y": "y"
    "z": "z"
    "一類何物": "㝉"
    "之物": "𫙦"
    "其子": "𦮪"
    "出入改滅": "𢒟"
    "列序": "𠜺"
    "化滅": "𠏁"
    "參形": "𠫰"
    "吾自": "𦣹"
    "太始初核": "𣝗"
    "如若": "𦱡"
    "宇宙亡矣": "𨹹"
    "尾末": "𡲵"
    "序丁": "𠆤"
    "序丙": "𠇮"
    "序乙": "㐈"
    "序甲": "𠇚"
    "式形": "佱"
    "引用": "㧈"
    "應用": "𤰆"
    "效應": "効"
    "映表": "𤅔"
    "是非": "欤"
    "構物": "𡒫"
    "為符名連": "‐"
    "爻陰": "侌"
    "爻陽": "𣆄"
    "特定其物": "亓"
    "省略一物": "畧"
    "符名": "謼"
    "等同": "弌"
    "解算": "筭"
    "註疏": "疎"
    "詞素": "𧥝"
    "謬誤": "䥘"
    "連頸": "丩"
    "間空": "𣣓"
    "首始": "𩠐"
}
function symbols_set_init(): Symbols_Set { return { "0": "0", "1": "1", "2": "2", "3": "3", "4": "4", "5": "5", "6": "6", "7": "7", "8": "8", "9": "9", "A": "A", "B": "B", "C": "C", "D": "D", "E": "E", "F": "F", "G": "G", "H": "H", "I": "I", "J": "J", "K": "K", "L": "L", "M": "M", "N": "N", "O": "O", "P": "P", "Q": "Q", "R": "R", "S": "S", "T": "T", "U": "U", "V": "V", "W": "W", "X": "X", "Y": "Y", "Z": "Z", "a": "a", "b": "b", "c": "c", "d": "d", "e": "e", "f": "f", "g": "g", "h": "h", "i": "i", "j": "j", "k": "k", "l": "l", "m": "m", "n": "n", "o": "o", "p": "p", "q": "q", "r": "r", "s": "s", "t": "t", "u": "u", "v": "v", "w": "w", "x": "x", "y": "y", "z": "z", "一類何物": "㝉", "之物": "𫙦", "其子": "𦮪", "出入改滅": "𢒟", "列序": "𠜺", "化滅": "𠏁", "參形": "𠫰", "吾自": "𦣹", "太始初核": "𣝗", "如若": "𦱡", "宇宙亡矣": "𨹹", "尾末": "𡲵", "序丁": "𠆤", "序丙": "𠇮", "序乙": "㐈", "序甲": "𠇚", "式形": "佱", "引用": "㧈", "應用": "𤰆", "效應": "効", "映表": "𤅔", "是非": "欤", "構物": "𡒫", "為符名連": "‐", "爻陰": "侌", "爻陽": "𣆄", "特定其物": "亓", "省略一物": "畧", "符名": "謼", "等同": "弌", "解算": "筭", "註疏": "疎", "詞素": "𧥝", "謬誤": "䥘", "連頸": "丩", "間空": "𣣓", "首始": "𩠐" } }
interface Symbols_Set_Neg {
    "0": "0"
    "1": "1"
    "2": "2"
    "3": "3"
    "4": "4"
    "5": "5"
    "6": "6"
    "7": "7"
    "8": "8"
    "9": "9"
    "A": "A"
    "B": "B"
    "C": "C"
    "D": "D"
    "E": "E"
    "F": "F"
    "G": "G"
    "H": "H"
    "I": "I"
    "J": "J"
    "K": "K"
    "L": "L"
    "M": "M"
    "N": "N"
    "O": "O"
    "P": "P"
    "Q": "Q"
    "R": "R"
    "S": "S"
    "T": "T"
    "U": "U"
    "V": "V"
    "W": "W"
    "X": "X"
    "Y": "Y"
    "Z": "Z"
    "a": "a"
    "b": "b"
    "c": "c"
    "d": "d"
    "e": "e"
    "f": "f"
    "g": "g"
    "h": "h"
    "i": "i"
    "j": "j"
    "k": "k"
    "l": "l"
    "m": "m"
    "n": "n"
    "o": "o"
    "p": "p"
    "q": "q"
    "r": "r"
    "s": "s"
    "t": "t"
    "u": "u"
    "v": "v"
    "w": "w"
    "x": "x"
    "y": "y"
    "z": "z"
    "㝉": "一類何物"
    "𫙦": "之物"
    "𦮪": "其子"
    "𢒟": "出入改滅"
    "𠜺": "列序"
    "𠏁": "化滅"
    "𠫰": "參形"
    "𦣹": "吾自"
    "𣝗": "太始初核"
    "𦱡": "如若"
    "𨹹": "宇宙亡矣"
    "𡲵": "尾末"
    "𠆤": "序丁"
    "𠇮": "序丙"
    "㐈": "序乙"
    "𠇚": "序甲"
    "佱": "式形"
    "㧈": "引用"
    "𤰆": "應用"
    "効": "效應"
    "𤅔": "映表"
    "欤": "是非"
    "𡒫": "構物"
    "‐": "為符名連"
    "侌": "爻陰"
    "𣆄": "爻陽"
    "亓": "特定其物"
    "畧": "省略一物"
    "謼": "符名"
    "弌": "等同"
    "筭": "解算"
    "疎": "註疏"
    "𧥝": "詞素"
    "䥘": "謬誤"
    "丩": "連頸"
    "𣣓": "間空"
    "𩠐": "首始"
}
function symbols_set_neg_init(): Symbols_Set_Neg { return { "0": "0", "1": "1", "2": "2", "3": "3", "4": "4", "5": "5", "6": "6", "7": "7", "8": "8", "9": "9", "A": "A", "B": "B", "C": "C", "D": "D", "E": "E", "F": "F", "G": "G", "H": "H", "I": "I", "J": "J", "K": "K", "L": "L", "M": "M", "N": "N", "O": "O", "P": "P", "Q": "Q", "R": "R", "S": "S", "T": "T", "U": "U", "V": "V", "W": "W", "X": "X", "Y": "Y", "Z": "Z", "a": "a", "b": "b", "c": "c", "d": "d", "e": "e", "f": "f", "g": "g", "h": "h", "i": "i", "j": "j", "k": "k", "l": "l", "m": "m", "n": "n", "o": "o", "p": "p", "q": "q", "r": "r", "s": "s", "t": "t", "u": "u", "v": "v", "w": "w", "x": "x", "y": "y", "z": "z", "㝉": "一類何物", "𫙦": "之物", "𦮪": "其子", "𢒟": "出入改滅", "𠜺": "列序", "𠏁": "化滅", "𠫰": "參形", "𦣹": "吾自", "𣝗": "太始初核", "𦱡": "如若", "𨹹": "宇宙亡矣", "𡲵": "尾末", "𠆤": "序丁", "𠇮": "序丙", "㐈": "序乙", "𠇚": "序甲", "佱": "式形", "㧈": "引用", "𤰆": "應用", "効": "效應", "𤅔": "映表", "欤": "是非", "𡒫": "構物", "‐": "為符名連", "侌": "爻陰", "𣆄": "爻陽", "亓": "特定其物", "畧": "省略一物", "謼": "符名", "弌": "等同", "筭": "解算", "疎": "註疏", "𧥝": "詞素", "䥘": "謬誤", "丩": "連頸", "𣣓": "間空", "𩠐": "首始" } }
// !!!Generated by Racket!!! !!!END!!!

// 相對獨立的部分。UUC }}}
