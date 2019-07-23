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

// {{{ 相對獨立的部分。內建數據結構
const enum LangValType {
    atom_t,
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
const atom_t = LangValType.atom_t
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

export type LangValAtomG<a extends string> = [LangValType.atom_t, a]
export type LangValAtom = LangValAtomG<string>

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
export type LangValLazy = LangValComment | LangValJustDelay
export type LangValLazyG<a extends LangVal> = LangValLazy // 可能不可用類型描述
export type LangValSysNameG<x extends LangVal> = SystemName_Make<x>
export type LangValSysName = LangValSysNameG<LangVal>
export type LangValName = LangValDataG<LangValLazyG<Name_Atom>, LangVal> | LangValAtom

const comment_t = LangValType.comment_t
export type LangValCommentG<a extends LangVal, b extends LangVal> = [LangValType.comment_t, a, b]
interface LangValCommentI extends LangValCommentG<LangVal, LangVal> { }
export type LangValComment = LangValCommentI & LangValCommentG<HackRec_LangVal, HackRec_LangVal>

const hole_t = LangValType.hole_t
type LangValHole = [LangValType.hole_t]
export type LangVal = LangValAtom | LangValCons | LangValNull | LangValData | LangValError | LangValJust | LangValDelayEvaluate | LangValDelayBuiltinFunc | LangValDelayBuiltinForm | LangValDelayApply | LangValComment | LangValHole
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

function atom_p(x: LangVal): x is LangValAtom {
    return x[0] === atom_t
}
type New_Atom<X extends string> = LangValAtomG<X>
function new_atom<X extends string>(x: X): New_Atom<X> {
    return [atom_t, x]
}
function un_atom<X extends string>(x: New_Atom<X>): X {
    return x[1]
}
function atom_equal_p(x: LangValAtom, y: LangValAtom): boolean {
    if (x === y) {
        return true
    }
    if (un_atom(x) === un_atom(y)) {
        lang_assert_equal_set_do(x, y)
        return true
    } else {
        return false
    }
}
export { New_Atom, new_atom, atom_p, un_atom, atom_equal_p }

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
// 註疏系統WIP
const unlazy_all_rec = force_uncomment_all_rec
export { force_all_rec, force_uncomment_all_rec, unlazy_all_rec }

function new_hole_do(): LangValHole {
    return [hole_t]
}
function hole_p(x: LangVal): x is LangValHole {
    return x[0] === hole_t
}
function lang_assert_equal_set_do(x: LangVal, y: LangVal): void {
    // 只用于x与y等价的情况，且一般情況下要求y比x簡單。
    if (x === y) {
        return
    }
    if (x === null_v) {
        x = y
        y = null_v
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
