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

// {{{ 相對獨立的部分。Effect
type Return_Effect_SystemName = SystemName_Make<New_Construction<Sub_Atom, New_Construction<New_Construction<Effect_Atom, New_Construction<New_Construction<TypeAnnotation_Atom, New_Construction<Thing_Atom, New_Construction<Something_Atom, Null_V>>>, Null_V>>, Null_V>>>
const return_effect_systemName: Return_Effect_SystemName = systemName_make(new_construction(sub_atom, new_construction(new_construction(effect_atom, new_construction(new_construction(typeAnnotation_atom, new_construction(thing_atom, new_construction(something_atom, null_v))), null_v)), null_v)))
type Bind_Effect_SystemName = SystemName_Make<New_Construction<Sub_Atom, New_Construction<New_Construction<Effect_Atom, New_Construction<Construction_Atom, Null_V>>, Null_V>>>
const bind_effect_systemName: Bind_Effect_SystemName = systemName_make(new_construction(sub_atom, new_construction(new_construction(effect_atom, new_construction(construction_atom, null_v)), null_v)))
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
                            const x = new_atom('序甲')
                            const r = () => run_monad_helper(upval_rt, upval_op, upval_a, upval_st, new_data(function_atom, new_list(new_list(x), make_bind(new_list(make_quote(upval_b), x), make_quote(upval_nt)))))
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
