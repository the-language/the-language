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


// {{{ 相對獨立的部分。machinetext parse/print
// 註疏系統WIP
function machinetext_parse(rawstr: string): LangVal {
    let state = rawstr.length
    function parse_error(x: string = ""): never {
        throw 'MT parse ERROR ' + x
    }
    function parse_assert(x: boolean): void {
        if (!x) { return parse_error() }
    }
    function get_do(): string {
        parse_assert(is_not_eof())
        state--
        return rawstr[state]
    }
    function is_eof(): boolean {
        return state === 0
    }
    function is_not_eof(): boolean {
        return !is_eof()
    }
    const stack: Array<LangVal> = []
    function conslike(c: (x: LangVal, y: LangVal) => LangVal) {
        const y = stack.pop()
        const x = stack.pop()
        if (x === undefined || y === undefined) {
            return parse_error()
        } else {
            return stack.unshift(c(x, y))
        }
    }
    while (is_not_eof()) {
        const chr = get_do()
        if (chr === '^') {
            let tmp: string = ''
            while (true) {
                const chr: string = get_do()
                if (chr === '^') { break }
                tmp = chr + tmp
            }
            if (can_new_atom_unicodechar_p(tmp)) {
                stack.unshift(new_atom_unicodechar(tmp))
            } else {
                return parse_error('can_new_atom_unicodechar_p("' + tmp + '") == false')
            }
        } else if (chr === '.') {
            conslike(new_construction)
        } else if (chr === '#') {
            conslike(new_data)
        } else if (chr === '!') {
            conslike(new_error)
        } else if (chr === '$') {
            conslike((env, val) => {
                const r_env = val2env(env)
                if (r_env === false) {
                    return parse_error()
                } else {
                    return evaluate(r_env, val)
                }
            })
        } else if (chr === '_') {
            stack.unshift(null_v)
        } else {
            return parse_error()
        }
    }
    parse_assert(is_eof())
    parse_assert(stack.length === 1)
    return stack[0]
}
// 註疏系統WIP
// 此print或許可以小幅度修改後用於equal,合理的print無限數據... （廣度優先）
function machinetext_print(x: LangVal): string {
    let stack: Array<LangVal> = [x]
    let result: string = ""
    while (stack.length !== 0) {
        const new_stack: Array<LangVal> = []
        for (let x of stack) {
            x = un_just_all(x)
            const conslike = function <T>(xx: T, s: string, g1: (x: T) => LangVal, g2: (x: T) => LangVal) {
                result += (s)
                return new_stack.push(g1(xx), g2(xx))
            }
            if (atom_p(x)) {
                result += ('^' + un_atom_unicodechar(x) + '^')
            } else if (construction_p(x)) {
                conslike(x, '.', construction_head, construction_tail)
            } else if (null_p(x)) {
                result += ('_')
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
        stack = new_stack
    }
    return result
}
export { machinetext_parse, machinetext_print }
// 相對獨立的部分。machinetext parse/print }}}
