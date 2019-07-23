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
            ret.push(k)
            ret.push(v)
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
