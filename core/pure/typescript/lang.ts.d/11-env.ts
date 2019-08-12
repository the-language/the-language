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

// {{{ 相對獨立的部分。變量之環境

export type Enviroment = (EnviromentNode | EnviromentTree) & [boolean, any, any]
type EnviromentNodeG<resta extends Array<LangVal>, val extends LangVal> = [false, resta, val]
interface EnviromentNodeI extends EnviromentNodeG<Array<LangVal>, LangVal> { }
type EnviromentNode = EnviromentNodeI & [false, Array<any>, any]
type EnviromentNull = EnviromentTreeG<RecordStringNull>
type EnviromentTreeG<a extends RecordStringG<Enviroment>> = [true, a, null]
interface EnviromentTreeI extends EnviromentTreeG<RecordStringG<Enviroment>> { }
type EnviromentTree = EnviromentTreeI & [true, RecordStringG<any>, null]
function make_enviroment_null_v(): EnviromentNull {
    return [true, {}, null]
}
const enviroment_null_v: EnviromentNull = make_enviroment_null_v()
function enviroment_null_p(x: Enviroment): x is EnviromentNull {
    if (x[0]) {
        return recordstring_null_p(x[1])
    }
    return false
}
function enviroment_helper_print0(x: LangVal, ref: Array<LangVal>, ret: Array<string>): void {
    x = force_uncomment_all(x)
    if (atom_p(x)) {
        ret.push("^", un_atom(x))
    } else if (construction_p(x)) {
        ret.push(".")
        ref.push(construction_head(x), construction_tail(x))
    } else if (null_p(x)) {
        ret.push("_")
    } else if (data_p(x)) {
        ret.push("#")
        ref.push(data_name(x), data_list(x))
    } else {
        return LANG_ERROR()
    }
}
function enviroment_helper_print_step(xs: Array<LangVal>): [Array<string>, Array<LangVal>] {
    const rs: Array<LangVal> = []
    const ss: Array<string> = []
    for (const x of xs) {
        enviroment_helper_print0(x, rs, ss)
    }
    return [ss, rs]
}
function enviroment_helper_node_expand(env: EnviromentNode): EnviromentTree {
    const e = enviroment_helper_print_step(env[1])
    const es: Array<string> = e[0]
    const ev: Array<LangVal> = e[1]
    const t: RecordStringG<Enviroment> = {}
    LANG_ASSERT(es.length !== 0)
    t[es[es.length - 1]] = [false, ev, env[2]]
    let result: EnviromentTree = [true, t, null]
    for (let i = es.length - 2; i >= 0; i--) {
        const t: RecordStringG<Enviroment> = {}
        t[es[i]] = result
        result = [true, t, null]
    }
    return result
}
function enviroment_helper_tree_shadow_copy(x: EnviromentTree): EnviromentTree {
    return [true, recordstring_shadow_copy(x[1]), null]
}
function enviroment_set(env: Enviroment, key: LangVal, val: LangVal) {
    const result: Enviroment = make_enviroment_null_v()
    return run_trampoline(enviroment_set_helper(env, [key], val, result, result))
}
function enviroment_set_helper(env: Enviroment, key: Array<LangVal>, val: LangVal, return_pointer: Enviroment, real_return: Enviroment): Trampoline<Enviroment> {
    if (key.length === 0) {
        LANG_ASSERT(enviroment_null_p(env) || (env[0] === false && env[1].length === 0))
        return_pointer[0] = false
        return_pointer[1] = key
        return_pointer[2] = val
        return trampoline_return(real_return)
    }
    if (env[0]) { // EnviromentTree
        const result_tmp: EnviromentTree = enviroment_helper_tree_shadow_copy(env)
        return_pointer[0] = result_tmp[0]
        return_pointer[1] = result_tmp[1]
        return_pointer[2] = result_tmp[2]
        const result: EnviromentTree = return_pointer as EnviromentTree
        const a = enviroment_helper_print_step(key)
        const as: Array<string> = a[0]
        const av: Array<LangVal> = a[1]
        let pointer: EnviromentTree = result // poiter表層為已複製，可修改的。
        for (const k of as) {
            let m: EnviromentTree = null as unknown as EnviromentTree
            if (k in pointer[1]) {
                let t = pointer[1][k]
                if (t[0]) {
                    m = enviroment_helper_tree_shadow_copy(t)
                } else {
                    m = enviroment_helper_node_expand(t)
                }
            } else {
                m = [true, {}, null]
            }
            LANG_ASSERT(m !== null)
            pointer[1][k] = m
            pointer = m
        }
        if (enviroment_null_p(pointer)) {
            let p: [boolean, any, any] = pointer
            p[0] = false
            p[1] = av
            p[2] = val
            return trampoline_return(real_return)
        } else {
            return trampoline_delay(() => enviroment_set_helper(pointer, av, val, pointer, real_return))
        }
    } else { // EnviromentNode
        return trampoline_delay(() => enviroment_set_helper(enviroment_helper_node_expand(env), key, val, return_pointer, real_return))
    }
    return LANG_ERROR()
}

// 以下为OLD
export type Env = Array<LangVal> // WIP

const env_null_v: Env = []
function env_set(env: Env, key: LangVal, val: LangVal): Env {
    let ret: Env = []
    for (let i = 0; i < env.length; i = i + 2) {
        // WIP delay未正確處理(影響較小)
        if (equal_p(env[i + 0], key)) {
            ret[i + 0] = key
            ret[i + 1] = val
            for (i = i + 2; i < env.length; i = i + 2) {
                ret[i + 0] = env[i + 0]
                ret[i + 1] = env[i + 1]
            }
            return ret
        } else {
            ret[i + 0] = env[i + 0]
            ret[i + 1] = env[i + 1]
        }
    }
    ret[env.length + 0] = key
    ret[env.length + 1] = val
    return ret
}

function env_get<T>(env: Env, key: LangVal, default_v: T): T | LangVal {
    for (let i = 0; i < env.length; i = i + 2) {
        if (equal_p(env[i + 0], key)) {
            return env[i + 1]
        }
    }
    return default_v
}

function must_env_get(env: Env, key: LangVal): LangVal {
    for (let i = 0; i < env.length; i = i + 2) {
        if (equal_p(env[i + 0], key)) {
            return env[i + 1]
        }
    }
    return LANG_ERROR()
}

function env2val(env: Env): LangVal {
    let ret: LangVal = null_v
    for (let i = 0; i < env.length; i = i + 2) {
        ret = new_construction(new_list(env[i + 0], env[i + 1]), ret)
    }
    return new_data(mapping_atom, new_list(ret))
}

function env_foreach(env: Env, f: (k: LangVal, v: LangVal) => void): void {
    for (let i = 0; i < env.length; i = i + 2) {
        f(env[i + 0], env[i + 1])
    }
}

function val2env(x: LangVal): OrFalse<Env> {
    x = force_all(x)
    if (!data_p(x)) {
        return false
    }
    let s: LangVal = force_all(data_name(x))
    if (!atom_p(s)) {
        return false
    }
    if (!atom_equal_p(s, mapping_atom)) {
        return false
    }
    s = force_all(data_list(x))
    if (!construction_p(s)) {
        return false
    }
    if (!null_p(force_all(construction_tail(s)))) {
        return false
    }
    let ret: Env = []
    let xs: LangVal = force_all(construction_head(s))
    while (!null_p(xs)) {
        if (!construction_p(xs)) {
            return false
        }
        let x = force_all(construction_head(xs))
        xs = force_all(construction_tail(xs))
        if (!construction_p(x)) {
            return false
        }
        const k = construction_head(x)
        x = force_all(construction_tail(x))
        if (!construction_p(x)) {
            return false
        }
        const v = construction_head(x)
        if (!null_p(force_all(construction_tail(x)))) {
            return false
        }
        let not_breaked: boolean = true
        for (let i = 0; i < ret.length; i = i + 2) {
            if (equal_p(ret[i + 0], k)) {
                ret[i + 1] = v
                not_breaked = false
                break
            }
        }
        if (not_breaked) {
            ret.push(k, v)
        }
    }
    return ret
}

export {
    env_null_v,
    env_set,
    env_get,
    env2val,
    env_foreach,
    val2env,
}
// 相對獨立的部分。變量之環境 }}}
