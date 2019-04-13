/*
    The Language
    Copyright (C) 2019  Zaoqi <zaomir@outlook.com>

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
'use strict';
const L = require('./lang')
const _E = module.exports

const A = L.new_list // apply
function M(macro, ...args) { // apply macro
    return L.new_list(L.form_use_systemName, macro, ...args)
}

function quote(x) {
    return L.new_list(L.form_builtin_use_systemName, L.quote_form_builtin_systemName, x)
}
_E.quote = quote
const S = L.new_symbol
_E.S = S

function quoteS(x) {
    return quote(S(x))
}
_E.quoteS = quoteS

function cons(x, y) {
    return L.new_list(L.function_builtin_use_systemName, L.new_construction_function_builtin_systemName, x, y)
}
_E.cons = cons

function data(x, y) {
    return L.new_list(L.function_builtin_use_systemName, L.new_data_function_builtin_systemName, x, y)
}
_E.data = data
const null_v = L.null_v
_E.null_v = null_v

function list(...xs) {
    var r = L.null_v;
    while (xs.length !== 0) {
        r = cons(xs.pop(), r)
    }
    return r
}
_E.list = list

function car(p) {
    return L.new_list(L.function_builtin_use_systemName, L.construction_head_function_builtin_systemName, x, y)
}
_E.car = car

function cdr(p) {
    return L.new_list(L.function_builtin_use_systemName, L.construction_tail_function_builtin_systemName, x, y)
}
_E.cdr = cdr

function error(x, y) {
    return L.new_list(L.function_builtin_use_systemName, L.new_error_function_builtin_systemName, x, y)
}
_E.error = error

function calc(env, x) {
    return L.new_list(L.function_builtin_use_systemName, L.evaluate_function_builtin_systemName, env, x)
}
_E.calc = calc

function make_func(args, x) {
    return data(quote(L.function_symbol), list(args, x));
}
_E.make_func = make_func

function make_macro(args, x) {
    return data(quote(L.form_symbol), list(make_func(args, x)))
}
_E.make_macro = make_macro

function if_then_else(b, x, y) {
    return L.new_list(L.function_builtin_use_systemName, L.if_function_builtin_systemName, b, x, y)
}
_E.if_then_else = if_then_else

const env_null_v = quote(L.env2val(L.env_null_v))
_E.env_null_v = env_null_v
