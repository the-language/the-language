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
let L = require('./lang')
let E = module.exports

function quote(x) {
    return L.new_list(L.symbols.use_builtin_form, L.symbols.builtin.form.quote, x)
}
E.quote = quote

function cons(x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.new_cons, x, y)
}
E.cons = cons

function data(x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.new_data, x, y)
}
E.data = data
let null_v = L.null_v
E.null_v = null_v
let S = L.new_symbol
E.S = S

function list(...xs) {
    var r = L.null_v;
    while (xs.length !== 0) {
        r = cons(xs.pop(), r)
    }
    return r
}
E.list = list

function car(p) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.cons_car, x, y)
}
E.car = car

function cdr(p) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.cons_cdr, x, y)
}
E.cdr = cdr

function error(x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.new_error, x, y)
}
E.error = error

function calc(env, x) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.eval, env, x)
}
E.calc = calc

function make_func(args, x) {
    return data(quote(L.symbols.function), list(args, x));
}
E.make_func = make_func

function make_macro(args, x) {
    return data(quote(L.symbols.form), list(make_func(args, x)))
}
E.make_macro = make_macro

function if_then_else(b, x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.if, b, x, y)
}
E.if_then_else = if_then_else

let env_null_v = quote(L.env2val(L.env_null_v))
E.env_null_v = env_null_v