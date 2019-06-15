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
// 相對獨立的部分。符號名稱 }}}
