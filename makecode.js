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

function data(x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.new_data, x, y)
}
E.data = data

function error(x, y) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.new_error, x, y)
}
E.error = error

function calc(env, x) {
    return L.new_list(L.symbols.use_builtin_function, L.symbols.builtin.function.eval, env, x)
}
E.calc = calc