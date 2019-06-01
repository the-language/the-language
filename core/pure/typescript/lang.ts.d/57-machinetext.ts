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
    const result = new_hole_do()
    let stack: Array<(x: LangVal) => void> = [(x) => hole_set_do(result, x)]
    let state = 0
    function parse_error(x: string = ""): never {
        throw 'MT parse ERROR ' + x
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
                    return parse_error('can_new_symbol_unicodechar_p("' + tmp + '") == false')
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
function machinetext_print_step2_do(x: LangVal, ret_push_do: (x: string) => void, new_stack_push_do: (x: LangVal) => void): void {
    x = un_just_all(x)
    const conslike = function <T>(xx: T, s: string, g1: (x: T) => LangVal, g2: (x: T) => LangVal): void {
        ret_push_do(s)
        new_stack_push_do(g1(xx))
        return new_stack_push_do(g2(xx))
    }
    if (symbol_p(x)) {
        ret_push_do('^')
        ret_push_do(un_symbol_unicodechar(x))
        return ret_push_do('^')
    } else if (construction_p(x)) {
        return conslike(x, '.', construction_head, construction_tail)
    } else if (null_p(x)) {
        return ret_push_do('_')
    } else if (data_p(x)) {
        return conslike(x, '#', data_name, data_list)
    } else if (error_p(x)) {
        return conslike(x, '!', error_name, error_list)
    } else if (delay_p(x)) {
        const y = delay2delay_evaluate(x)
        return conslike(y, '$', ((vl) => env2val(delay_evaluate_env(vl))), delay_evaluate_x)
    } else {
        return LANG_ERROR()
    }
}
function machinetext_print_step(stack: Array<LangVal>): [Array<string>, Array<LangVal>] {
    const result: Array<string> = []
    const new_stack: Array<LangVal> = []
    for (let x of stack) {
        machinetext_print_step2_do(x, (v) => result.push(v), (v) => new_stack.push(v))
    }
    return [result, new_stack]
}
function machinetext_print(x: LangVal): string {
    let stack: Array<LangVal> = [x]
    let result: string = ""
    while (stack.length !== 0) {
        const tmpret__new_stack = machinetext_print_step(stack)
        const tmpret = tmpret__new_stack[0]
        const new_stack = tmpret__new_stack[1]
        for (const s of tmpret) {
            result += s
        }
        stack = new_stack
    }
    return result
}
export { machinetext_parse, machinetext_print }
// 相對獨立的部分。machinetext parse/print }}}
