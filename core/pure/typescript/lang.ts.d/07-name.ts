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

// {{{ 相對獨立的部分。符號名稱

type System_Atom = New_Atom<"太始初核">
const system_atom: System_Atom = new_atom("太始初核")
type Name_Atom = New_Atom<"符名">
const name_atom: Name_Atom = new_atom("符名")
const function_atom = new_atom("化滅")
const form_atom = new_atom("式形")
const equal_atom = new_atom("等同")
const evaluate_sym = new_atom("解算")
const theThing_atom = new_atom("特定其物")
type Something_Atom = New_Atom<"省略一物">
const something_atom: Something_Atom = new_atom("省略一物")
const mapping_atom = new_atom("映表")
const if_atom = new_atom("如若")
type TypeAnnotation_Atom = New_Atom<"一類何物">
const typeAnnotation_atom: TypeAnnotation_Atom = new_atom("一類何物")
const isOrNot_atom = new_atom("是非")
type Sub_Atom = New_Atom<"其子">
const sub_atom: Sub_Atom = new_atom("其子")
const true_atom = new_atom("爻陽")
const false_atom = new_atom("爻陰")
const quote_atom = new_atom("引用")
const apply_atom = new_atom("應用")
const null_atom = new_atom("間空")
type Construction_Atom = New_Atom<"連頸">
const construction_atom: Construction_Atom = new_atom("連頸")
const data_atom = new_atom("構物")
const error_atom = new_atom("謬誤")
const atom_atom = new_atom("詞素")
const list_atom = new_atom("列序")
const head_atom = new_atom("首始")
const tail_atom = new_atom("尾末")
type Thing_Atom = New_Atom<"之物">
const thing_atom: Thing_Atom = new_atom("之物")
const theWorldStopped_atom = new_atom("宇宙亡矣")
type Effect_Atom = New_Atom<"效應">
const effect_atom: Effect_Atom = new_atom("效應")
//unused//const sequentialWordFormation_atom = new_atom('為符名連')
//unused//const inputOutput_atom = new_atom("出入改滅")
const comment_atom = new_atom("註疏")

const the_world_stopped_v: LangVal = new_error(system_atom, new_list(theWorldStopped_atom, something_atom))

// 指內建標識符系統
type SystemName_Make<X extends LangVal> = New_Data<Name_Atom, New_Construction<System_Atom, New_Construction<X, Null_V>>>
function systemName_make<X extends LangVal>(x: X): SystemName_Make<X> {
    return new_data(name_atom, new_construction(system_atom, new_construction(x, null_v)))
}
function make_builtin_f_new_sym_f(x_sym: LangValAtom): LangValSysName {
    return systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, something_atom, x_sym), theThing_atom))
}
function make_builtin_f_get_sym_f(t_sym: LangValAtom, x_sym: LangVal): LangValSysName {
    return systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, new_list(t_sym), something_atom), x_sym))
}
function make_builtin_f_p_sym_f(t_sym: LangValAtom): LangValSysName {
    return systemName_make(new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, new_list(typeAnnotation_atom, t_sym, something_atom))))
}
const new_data_function_builtin_systemName = make_builtin_f_new_sym_f(data_atom)
const data_name_function_builtin_systemName = make_builtin_f_get_sym_f(data_atom, name_atom)
const data_list_function_builtin_systemName = make_builtin_f_get_sym_f(data_atom, list_atom)
const data_p_function_builtin_systemName = make_builtin_f_p_sym_f(data_atom)

const new_error_function_builtin_systemName = make_builtin_f_new_sym_f(error_atom)
const error_name_function_builtin_systemName = make_builtin_f_get_sym_f(error_atom, name_atom)
const error_list_function_builtin_systemName = make_builtin_f_get_sym_f(error_atom, list_atom)
const error_p_function_builtin_systemName = make_builtin_f_p_sym_f(error_atom)

const new_construction_function_builtin_systemName = make_builtin_f_new_sym_f(construction_atom)
const construction_p_function_builtin_systemName = make_builtin_f_p_sym_f(construction_atom)
const construction_head_function_builtin_systemName = make_builtin_f_get_sym_f(construction_atom, head_atom)
const construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f(construction_atom, tail_atom)

const atom_p_function_builtin_systemName = make_builtin_f_p_sym_f(atom_atom)

const null_p_function_builtin_systemName = make_builtin_f_p_sym_f(null_atom)

const equal_p_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, equal_atom)))
const apply_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, new_construction(function_atom, something_atom), something_atom), apply_atom))
const evaluate_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, evaluate_sym))
const list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f(list_atom, new_list(typeAnnotation_atom, thing_atom, something_atom))
const if_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, if_atom))

const quote_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, form_atom, quote_atom))
const lambda_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, new_list(form_atom, new_list(function_atom, something_atom, function_atom)), theThing_atom))

const function_builtin_use_systemName = systemName_make(new_list(form_atom, new_list(system_atom, function_atom)))
const form_builtin_use_systemName = systemName_make(new_list(form_atom, new_list(system_atom, form_atom)))
const form_use_systemName = systemName_make(new_list(form_atom, form_atom))

const comment_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, comment_atom))
const comment_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, form_atom, comment_atom))

const false_v: LangVal = new_data(false_atom, new_list())
const true_v: LangVal = new_data(true_atom, new_list())
// 相對獨立的部分。符號名稱 }}}
