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
