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
function ERROR() {
    throw "TheLanguage PANIC";
}
function ASSERT(x) {
    if (!x) {
        return ERROR();
    }
}
const symbol_t = 0 /* symbol_t */;
const construction_t = 1 /* construction_t */;
const null_t = 2 /* null_t */;
const data_t = 3 /* data_t */;
const error_t = 4 /* error_t */;
const just_t = 5 /* just_t */;
const delay_evaluate_t = 6 /* delay_evaluate_t */;
const delay_builtin_func_t = 7 /* delay_builtin_func_t */;
const delay_builtin_form_t = 8 /* delay_builtin_form_t */;
const delay_apply_t = 9 /* delay_apply_t */;
/* 遞歸類型 A hack: [Unused] [error TS2312: An interface can only extend an object type or intersection of object types with statically known members.]
    type trec < T > = [null, t, t] | null
    interface t extends trec < null > {}
    */
function new_symbol(x) {
    return [symbol_t, x];
}
function symbol_p(x) {
    return x[0] === 0 /* symbol_t */;
}
function un_symbol(x) {
    return x[1];
}
export { new_symbol, symbol_p, un_symbol };
function new_construction(x, y) {
    return [construction_t, x, y]; // 實現底層依賴[編號 0] simple_parse, complex_parse <-> 內建數據結構
}
function construction_p(x) {
    return x[0] === construction_t;
}
function construction_head(x) {
    return x[1];
}
function construction_tail(x) {
    return x[2];
}
export { new_construction, construction_p, construction_head, construction_tail };
const null_v = [null_t];
function null_p(x) {
    return x[0] === null_t;
}
export { null_v, null_p };
function new_data(x, y) {
    return [data_t, x, y];
}
function data_p(x) {
    return x[0] === data_t;
}
function data_name(x) {
    return x[1];
}
function data_list(x) {
    return x[2];
}
export { new_data, data_p, data_name, data_list };
function new_error(x, y) {
    return [error_t, x, y];
}
function error_p(x) {
    return x[0] === error_t;
}
function error_name(x) {
    return x[1];
}
function error_list(x) {
    return x[2];
}
export { new_error, error_p, error_name, error_list };
function lang_set_do(x, y) {
    // 只用于x与y等价的情况
    if (x === y) {
        return;
    }
    x[0] = just_t;
    x[1] = y;
    x[2] = false;
    x[3] = false;
}
function just_p(x) {
    return x[0] === just_t;
}
function un_just(x) {
    return x[1];
}
function evaluate(x, y) {
    return [delay_evaluate_t, x, y];
}
export { evaluate };
function delay_evaluate_p(x) {
    return x[0] === delay_evaluate_t;
}
function delay_evaluate_env(x) {
    return x[1];
}
function delay_evaluate_x(x) {
    return x[2];
}
function builtin_form_apply(x, y, z) {
    return [delay_builtin_form_t, x, y, z];
}
function delay_builtin_form_p(x) {
    return x[0] === delay_builtin_form_t;
}
function delay_builtin_form_env(x) {
    return x[1];
}
function delay_builtin_form_f(x) {
    return x[2];
}
function delay_builtin_form_xs(x) {
    return x[3];
}
function builtin_func_apply(x, y) {
    return [delay_builtin_func_t, x, y];
}
function delay_builtin_func_p(x) {
    return x[0] === delay_builtin_func_t;
}
function delay_builtin_func_f(x) {
    return x[1];
}
function delay_builtin_func_xs(x) {
    return x[2];
}
function apply(f, xs) {
    return [delay_apply_t, f, xs];
}
export { apply };
function delay_apply_p(x) {
    return x[0] === delay_apply_t;
}
function delay_apply_f(x) {
    return x[1];
}
function delay_apply_xs(x) {
    return x[2];
}
function force_all_rec(raw) {
    const x = force_all(raw);
    if (data_p(x)) {
        const a = x[1];
        const d = x[2];
        x[1] = force_all_rec(a);
        x[2] = force_all_rec(d);
        return x;
    }
    else if (error_p(x)) {
        const a = x[1];
        const d = x[2];
        x[1] = force_all_rec(a);
        x[2] = force_all_rec(d);
        return x;
    }
    else if (construction_p(x)) {
        const a = x[1];
        const d = x[2];
        x[1] = force_all_rec(a);
        x[2] = force_all_rec(d);
        return x;
    }
    return x;
}
export { force_all_rec };
// 相對獨立的部分。內建數據結構 }}}
// {{{ 相對獨立的部分。符號名稱
const system_symbol = new_symbol("太始初核");
const name_symbol = new_symbol("符名");
const function_symbol = new_symbol("化滅");
const form_symbol = new_symbol("式形");
const equal_symbol = new_symbol("等同");
const evaluate_sym = new_symbol("解算");
const theThing_symbol = new_symbol("特定其物");
const something_symbol = new_symbol("省略一物");
const mapping_symbol = new_symbol("映表");
const if_symbol = new_symbol("若");
const typeAnnotation_symbol = new_symbol("一類何物");
const isOrNot_symbol = new_symbol("是非");
const sub_symbol = new_symbol("其子");
const true_symbol = new_symbol("陽");
const false_symbol = new_symbol("陰");
const quote_symbol = new_symbol("引用");
const apply_symbol = new_symbol("應用");
const null_symbol = new_symbol("空");
const construction_symbol = new_symbol("連");
const data_symbol = new_symbol("構");
const error_symbol = new_symbol("誤");
const symbol_symbol = new_symbol("詞素");
const list_symbol = new_symbol("列");
const head_symbol = new_symbol("首");
const tail_symbol = new_symbol("尾");
const thing_symbol = new_symbol("物");
const theWorldStopped_symbol = new_symbol("宇宙亡矣");
const effect_symbol = new_symbol("效應");
const sequentialWordFormation_symbol = new_symbol('為符名連');
const inputOutput_symbol = new_symbol("出入改滅");
export { system_symbol, name_symbol, function_symbol, form_symbol, equal_symbol, evaluate_sym, theThing_symbol, something_symbol, mapping_symbol, if_symbol, typeAnnotation_symbol, isOrNot_symbol, sub_symbol, true_symbol, false_symbol, quote_symbol, apply_symbol, null_symbol, construction_symbol, data_symbol, error_symbol, symbol_symbol, list_symbol, head_symbol, tail_symbol, thing_symbol, theWorldStopped_symbol, effect_symbol, sequentialWordFormation_symbol, inputOutput_symbol };
const the_world_stopped_v = new_error(system_symbol, new_list(theWorldStopped_symbol, something_symbol));
function systemName_make(x) {
    return new_data(name_symbol, new_list(system_symbol, x));
}
function make_builtin_f_new_sym_f(x_sym) {
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, x_sym), theThing_symbol));
}
function make_builtin_f_get_sym_f(t_sym, x_sym) {
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(t_sym), something_symbol), x_sym));
}
function make_builtin_f_p_sym_f(t_sym) {
    return systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, new_list(typeAnnotation_symbol, t_sym, something_symbol))));
}
const new_data_function_builtin_systemName = make_builtin_f_new_sym_f(data_symbol);
const data_name_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, name_symbol);
const data_list_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, list_symbol);
const data_p_function_builtin_systemName = make_builtin_f_p_sym_f(data_symbol);
const new_error_function_builtin_systemName = make_builtin_f_new_sym_f(error_symbol);
const error_name_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, name_symbol);
const error_list_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, list_symbol);
const error_p_function_builtin_systemName = make_builtin_f_p_sym_f(error_symbol);
const new_construction_function_builtin_systemName = make_builtin_f_new_sym_f(construction_symbol);
const construction_p_function_builtin_systemName = make_builtin_f_p_sym_f(construction_symbol);
const construction_head_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, head_symbol);
const construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, tail_symbol);
const symbol_p_function_builtin_systemName = make_builtin_f_p_sym_f(symbol_symbol);
const null_p_function_builtin_systemName = make_builtin_f_p_sym_f(null_symbol);
const equal_p_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, equal_symbol)));
const apply_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(function_symbol, something_symbol), something_symbol), apply_symbol));
const evaluate_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, evaluate_sym));
const list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f(list_symbol, new_list(typeAnnotation_symbol, thing_symbol, something_symbol));
const if_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, if_symbol));
const quote_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, form_symbol, quote_symbol));
const lambda_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, function_symbol)), theThing_symbol));
const function_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, function_symbol)));
const form_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, form_symbol)));
const form_use_systemName = systemName_make(new_list(form_symbol, form_symbol));
export { new_data_function_builtin_systemName, data_name_function_builtin_systemName, data_list_function_builtin_systemName, data_p_function_builtin_systemName, new_error_function_builtin_systemName, error_name_function_builtin_systemName, error_list_function_builtin_systemName, error_p_function_builtin_systemName, new_construction_function_builtin_systemName, construction_p_function_builtin_systemName, construction_head_function_builtin_systemName, construction_tail_function_builtin_systemName, symbol_p_function_builtin_systemName, null_p_function_builtin_systemName, equal_p_function_builtin_systemName, apply_function_builtin_systemName, evaluate_function_builtin_systemName, list_chooseOne_function_builtin_systemName, if_function_builtin_systemName, quote_form_builtin_systemName, lambda_form_builtin_systemName, function_builtin_use_systemName, form_builtin_use_systemName, form_use_systemName };
const false_v = new_data(false_symbol, new_list());
const true_v = new_data(true_symbol, new_list());
function symbol_equal_p(x, y) {
    if (x === y) {
        return true;
    }
    // 其他自然語言暫未實現。  改為在new_symbol 和 新函數 localized_complex_print實現 WIP
    if (un_symbol(x) === un_symbol(y)) {
        lang_set_do(x, y);
        return true;
    }
    else {
        return false;
    }
}
// 相對獨立的部分。符號名稱 }}}
// {{{ 相對獨立的部分。對內建數據結構的簡單處理
function jsArray_to_list(xs) {
    let ret = null_v;
    for (let i = xs.length - 1; i >= 0; i--) {
        ret = new_construction(xs[i], ret);
    }
    return ret;
}
function list_to_jsArray(xs, k_done, k_tail) {
    let ret = [];
    while (construction_p(xs)) {
        ret.push(construction_head(xs));
        xs = construction_tail(xs);
    }
    if (null_p(xs)) {
        return k_done(ret);
    }
    return k_tail(ret, xs);
}
function maybe_list_to_jsArray(xs) {
    return list_to_jsArray(xs, (xs) => xs, (xs, x) => false);
}
function new_list(...xs) {
    return jsArray_to_list(xs);
}
export { jsArray_to_list, maybe_list_to_jsArray, new_list };
function un_just_all(raw) {
    let x = raw;
    let xs = [];
    while (just_p(x)) {
        xs.push(x);
        x = un_just(x);
    }
    for (let i = 0; i < xs.length; i++) {
        lang_set_do(xs[i], x);
    }
    return x;
}
function any_delay_just_p(x) {
    return just_p(x) ||
        delay_evaluate_p(x) ||
        delay_builtin_form_p(x) ||
        delay_builtin_func_p(x) ||
        delay_apply_p(x);
}
export { any_delay_just_p as delay_p };
function force_all(raw, parents_history = {}, ref_novalue_replace = [false, false]) {
    // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
    let history = {};
    let x = raw;
    let xs = [];
    function replace_this_with_stopped() {
        // 語言標準允許替換沒有值的東西為那種錯誤。
        ref_novalue_replace[1] = true;
        lang_set_do(x, the_world_stopped_v);
        for (let i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], the_world_stopped_v);
        }
        return the_world_stopped_v;
    }
    function do_rewrite_force_all(newval) {
        lang_set_do(x, newval);
        for (let i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], newval);
        }
        if (any_delay_just_p(newval)) {
            newval = force_all(newval);
            lang_set_do(x, newval);
            for (let i = 0; i < xs.length; i++) {
                lang_set_do(xs[i], newval);
            }
        }
        return newval;
    }
    function make_history() {
        let ret = {};
        for (const x_id in history) {
            ret[x_id] = true;
        }
        for (const x_id in parents_history) {
            ret[x_id] = true;
        }
        return ret;
    }
    while (any_delay_just_p(x)) {
        const x_id = simple_print(x);
        if (parents_history[x_id] === true) {
            return replace_this_with_stopped();
        }
        if (history[x_id] === true) {
            ref_novalue_replace[0] = true; // 減少替換範圍：(f <沒有值>) 的(f _)
            if (delay_evaluate_p(x)) {
                return replace_this_with_stopped(); // 可能未減少應該減少的？
            }
            else if (delay_builtin_func_p(x)) {
                const f = delay_builtin_func_f(x); // LangVal/Name
                const xs = delay_builtin_func_xs(x); // JSList LangVal
                const elim_s = [data_name_function_builtin_systemName,
                    data_list_function_builtin_systemName,
                    data_p_function_builtin_systemName,
                    error_name_function_builtin_systemName,
                    error_list_function_builtin_systemName,
                    error_p_function_builtin_systemName,
                    construction_p_function_builtin_systemName,
                    construction_head_function_builtin_systemName,
                    construction_tail_function_builtin_systemName,
                    symbol_p_function_builtin_systemName,
                    null_p_function_builtin_systemName];
                let is_elim = false;
                for (let i = 0; i < elim_s.length; i++) {
                    if (jsbool_equal_p(elim_s[i], f)) {
                        is_elim = true;
                    }
                }
                if (is_elim) {
                    ASSERT(xs.length === 1);
                    ASSERT(ref_novalue_replace[1] === false);
                    const inner = force_all(xs[0], make_history(), ref_novalue_replace);
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(f, [inner]));
                    }
                    else {
                        return ERROR(); //我覺得沒有這種情況
                    }
                }
                if (jsbool_equal_p(f, equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped(); //WIP
                }
                else if (jsbool_equal_p(f, apply_function_builtin_systemName)) {
                    return replace_this_with_stopped(); //WIP
                }
                else if (jsbool_equal_p(f, evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped(); //WIP
                }
                else if (jsbool_equal_p(f, if_function_builtin_systemName)) {
                    ASSERT(xs.length === 3);
                    ASSERT(ref_novalue_replace[1] === false);
                    const tf = force_all(xs[0], make_history(), ref_novalue_replace);
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(if_function_builtin_systemName, [tf, xs[1], xs[2]]));
                    }
                    else {
                        return ERROR(); //我覺得沒有這種情況
                    }
                }
                return ERROR(); //我覺得沒有這種情況
            }
            else if (delay_builtin_form_p(x)) {
                return replace_this_with_stopped(); // 可能未減少應該減少的？
            }
            else if (delay_apply_p(x)) {
                return replace_this_with_stopped(); // 可能未減少應該減少的？
            }
            return ERROR();
        }
        history[x_id] = true;
        xs.push(x);
        x = force1(x);
    }
    for (let i = 0; i < xs.length; i++) {
        lang_set_do(xs[i], x);
    }
    return x;
}
function force1(raw) {
    const x = un_just_all(raw);
    let ret;
    ASSERT(!just_p(x));
    if (delay_evaluate_p(x)) {
        ret = real_evaluate(delay_evaluate_env(x), delay_evaluate_x(x));
    }
    else if (delay_builtin_form_p(x)) {
        ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x));
    }
    else if (delay_builtin_func_p(x)) {
        ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x));
    }
    else if (delay_apply_p(x)) {
        ret = real_apply(delay_apply_f(x), delay_apply_xs(x));
    }
    else {
        ret = x;
    }
    ret = un_just_all(ret);
    lang_set_do(x, ret);
    return ret;
}
export { force_all, force1 };
const env_null_v = [];
function env_set(env, key, val) {
    let ret = [];
    for (let i = 0; i < env.length; i = i + 2) {
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(env[i + 0], key)) {
            ret[i + 0] = key;
            ret[i + 1] = val;
            for (i = i + 2; i < env.length; i = i + 2) {
                ret[i + 0] = env[i + 0];
                ret[i + 1] = env[i + 1];
            }
            return ret;
        }
        else {
            ret[i + 0] = env[i + 0];
            ret[i + 1] = env[i + 1];
        }
    }
    ret[env.length + 0] = key;
    ret[env.length + 1] = val;
    return ret;
}
function env_get(env, key, default_v) {
    for (let i = 0; i < env.length; i = i + 2) {
        if (jsbool_equal_p(env[i + 0], key)) {
            return env[i + 1];
        }
    }
    return default_v;
}
function must_env_get(env, key) {
    for (let i = 0; i < env.length; i = i + 2) {
        if (jsbool_equal_p(env[i + 0], key)) {
            return env[i + 1];
        }
    }
    return ERROR();
}
function env2val(env) {
    let ret = null_v;
    for (let i = 0; i < env.length; i = i + 2) {
        ret = new_construction(new_list(env[i + 0], env[i + 1]), ret);
    }
    return new_data(mapping_symbol, new_list(ret));
}
function env_foreach(env, f) {
    for (let i = 0; i < env.length; i = i + 2) {
        f(env[i + 0], env[i + 1]);
    }
}
function val2env(x) {
    x = force_all(x);
    if (!data_p(x)) {
        return false;
    }
    let s = force_all(data_name(x));
    if (!symbol_p(s)) {
        return false;
    }
    if (!symbol_equal_p(s, mapping_symbol)) {
        return false;
    }
    s = force_all(data_list(x));
    if (!construction_p(s)) {
        return false;
    }
    if (!null_p(force_all(construction_tail(s)))) {
        return false;
    }
    let ret = [];
    let xs = force_all(construction_head(s));
    while (!null_p(xs)) {
        if (!construction_p(xs)) {
            return false;
        }
        let x = force_all(construction_head(xs));
        xs = force_all(construction_tail(xs));
        if (!construction_p(x)) {
            return false;
        }
        const k = construction_head(x);
        x = force_all(construction_tail(x));
        if (!construction_p(x)) {
            return false;
        }
        const v = construction_head(x);
        if (!null_p(force_all(construction_tail(x)))) {
            return false;
        }
        let not_breaked = true;
        for (let i = 0; i < ret.length; i = i + 2) {
            if (jsbool_equal_p(ret[i + 0], k)) {
                ret[i + 1] = v;
                not_breaked = false;
                break;
            }
        }
        if (not_breaked) {
            ret.push(k);
            ret.push(v);
        }
    }
    return ret;
}
export { env_null_v, env_set, env_get, env2val, env_foreach, val2env };
// 相對獨立的部分。變量之環境 }}}
function real_evaluate(env, raw) {
    const x = force1(raw);
    if (any_delay_just_p(x)) {
        return evaluate(env, x);
    }
    const error_v = new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(evaluate_function_builtin_systemName, new_list(env2val(env), x))));
    if (construction_p(x)) {
        let xs = [];
        let rest = x;
        while (!null_p(rest)) {
            if (any_delay_just_p(rest)) {
                return evaluate(env, x);
            }
            else if (construction_p(rest)) {
                xs.push(construction_head(rest)); // WIP delay未正確處理(影響較小)
                rest = force1(construction_tail(rest));
            }
            else {
                return error_v;
            }
        }
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(xs[0], form_builtin_use_systemName)) {
            if (xs.length === 1) {
                return error_v;
            }
            const f = xs[1];
            let args = [];
            for (let i = 2; i < xs.length; i++) {
                args[i - 2] = xs[i];
            }
            return builtin_form_apply(env, f, args);
        }
        else if (jsbool_equal_p(xs[0], form_use_systemName)) {
            if (xs.length === 1) {
                return error_v;
            }
            // WIP delay未正確處理(影響較小)
            const f = force_all(evaluate(env, xs[1]));
            if (!data_p(f)) {
                return error_v;
            }
            const f_type = force1(data_name(f));
            if (any_delay_just_p(f_type)) {
                return evaluate(env, x);
            }
            if (!symbol_p(f_type)) {
                return error_v;
            }
            if (!symbol_equal_p(f_type, form_symbol)) {
                return error_v;
            }
            const f_list = force1(data_list(f));
            if (any_delay_just_p(f_list)) {
                return evaluate(env, x);
            }
            if (!construction_p(f_list)) {
                return error_v;
            }
            const f_x = construction_head(f_list);
            const f_list_cdr = force1(construction_tail(f_list));
            if (any_delay_just_p(f_list_cdr)) {
                return evaluate(env, x);
            }
            if (!null_p(f_list_cdr)) {
                return error_v;
            }
            const args = [env2val(env)];
            for (let i = 2; i < xs.length; i++) {
                args[i - 1] = xs[i];
            }
            return apply(f_x, args);
        }
        else if (jsbool_equal_p(xs[0], function_builtin_use_systemName)) {
            if (xs.length === 1) {
                return error_v;
            }
            const f = xs[1];
            let args = [];
            for (let i = 2; i < xs.length; i++) {
                args[i - 2] = evaluate(env, xs[i]);
            }
            return builtin_func_apply(f, args);
        }
        else {
            const f = evaluate(env, xs[0]);
            let args = [];
            for (let i = 1; i < xs.length; i++) {
                args[i - 1] = evaluate(env, xs[i]);
            }
            return apply(f, args);
        }
    }
    else if (null_p(x)) {
        return x;
    }
    else if (name_p(x)) {
        return env_get(env, x, error_v);
    }
    else if (error_p(x)) {
        return error_v;
    }
    return ERROR();
}
function name_p(x) {
    return symbol_p(x) || data_p(x);
}
function make_builtin_p_func(p_sym, p_jsfunc) {
    return [p_sym,
        1,
        (x, error_v) => {
            x = force1(x);
            if (any_delay_just_p(x)) {
                return builtin_func_apply(p_sym, [x]);
            }
            if (p_jsfunc(x)) {
                return true_v;
            }
            return false_v;
        }];
}
function make_builtin_get_func(f_sym, p_jsfunc, f_jsfunc) {
    return [f_sym,
        1,
        (x, error_v) => {
            x = force1(x);
            if (any_delay_just_p(x)) {
                return builtin_func_apply(f_sym, [x]);
            }
            if (p_jsfunc(x)) {
                return f_jsfunc(x);
            }
            return error_v;
        }];
}
const real_builtin_func_apply_s = [
    make_builtin_p_func(data_p_function_builtin_systemName, data_p),
    [new_data_function_builtin_systemName, 2, new_data],
    make_builtin_get_func(data_name_function_builtin_systemName, data_p, data_name),
    make_builtin_get_func(data_list_function_builtin_systemName, data_p, data_list),
    make_builtin_p_func(error_p_function_builtin_systemName, error_p),
    [new_error_function_builtin_systemName, 2, new_error],
    make_builtin_get_func(error_name_function_builtin_systemName, error_p, error_name),
    make_builtin_get_func(error_list_function_builtin_systemName, error_p, error_list),
    make_builtin_p_func(null_p_function_builtin_systemName, null_p),
    [new_construction_function_builtin_systemName, 2, new_construction],
    make_builtin_p_func(construction_p_function_builtin_systemName, construction_p),
    make_builtin_get_func(construction_head_function_builtin_systemName, construction_p, construction_head),
    make_builtin_get_func(construction_tail_function_builtin_systemName, construction_p, construction_tail),
    [equal_p_function_builtin_systemName, 2, (x, y, error_v) => {
            if (x === y) {
                return true_v;
            }
            x = force1(x);
            y = force1(y);
            if (any_delay_just_p(x) || any_delay_just_p(y)) {
                return builtin_func_apply(equal_p_function_builtin_systemName, [x, y]); // not fully implemented -- Halting
            }
            if (x === y) {
                return true_v;
            }
            function H_if(b, x, y) {
                // H = helper
                return builtin_func_apply(if_function_builtin_systemName, [b, x, y]);
            }
            function H_and(x, y) {
                return H_if(x, y, false_v);
            }
            ASSERT(!any_delay_just_p(x));
            function end_2(x, y, f1, f2) {
                return H_and(builtin_func_apply(equal_p_function_builtin_systemName, [f1(x), f1(y)]), builtin_func_apply(equal_p_function_builtin_systemName, [f2(x), f2(y)]));
            }
            if (null_p(x)) {
                if (!null_p(x)) {
                    return false_v;
                }
                return true_v;
            }
            else if (symbol_p(x)) {
                if (!symbol_p(y)) {
                    return false_v;
                }
                return symbol_equal_p(x, y) ? true_v : false_v;
            }
            else if (data_p(x)) {
                if (!data_p(y)) {
                    return false_v;
                }
                return end_2(x, y, data_name, data_list);
            }
            else if (construction_p(x)) {
                if (!construction_p(y)) {
                    return false_v;
                }
                return end_2(x, y, construction_head, construction_tail);
            }
            else if (error_p(x)) {
                if (!error_p(y)) {
                    return false_v;
                }
                return end_2(x, y, error_name, error_list);
            }
            return ERROR();
        }],
    [apply_function_builtin_systemName, 2, (f, xs, error_v) => {
            // WIP delay未正確處理(影響較小)
            let jslist = [];
            let iter = force_all(xs);
            while (construction_p(iter)) {
                jslist.push(construction_head(iter));
                iter = force_all(construction_tail(iter));
            }
            if (!null_p(iter)) {
                return error_v;
            }
            return apply(f, jslist);
        }],
    [evaluate_function_builtin_systemName, 2, (env, x, error_v) => {
            // WIP delay未正確處理(影響較小)
            const maybeenv = val2env(env);
            if (maybeenv === false) {
                return error_v;
            }
            return evaluate(maybeenv, x);
        }],
    make_builtin_p_func(symbol_p_function_builtin_systemName, symbol_p),
    [list_chooseOne_function_builtin_systemName, 1, (xs, error_v) => {
            // 一般返回第一个，可以因为优化返回其他的任意一个
            // xs可以無限長，不判斷是否真的是list
            xs = force1(xs);
            if (any_delay_just_p(xs)) {
                return builtin_func_apply(list_chooseOne_function_builtin_systemName, [xs]);
            }
            if (!construction_p(xs)) {
                return error_v;
            }
            return construction_head(xs);
        }],
    [if_function_builtin_systemName, 3, (b, x, y, error_v) => {
            b = force1(b);
            if (any_delay_just_p(b)) {
                return builtin_func_apply(if_function_builtin_systemName, [b, x, y]);
            }
            if (!data_p(b)) {
                return error_v;
            }
            // WIP delay未正確處理(影響較小)
            const nam = force_all(data_name(b));
            if (!symbol_p(nam)) {
                return error_v;
            }
            if (symbol_equal_p(nam, true_symbol)) {
                return x;
            }
            if (symbol_equal_p(nam, false_symbol)) {
                return y;
            }
            return error_v;
        }],
];
function real_apply(f, xs) {
    // WIP delay未正確處理(影響較小)
    function make_error_v() {
        return new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(apply_function_builtin_systemName, new_list(f, jsArray_to_list(xs)))));
    }
    f = force1(f);
    if (any_delay_just_p(f)) {
        return apply(f, xs);
    }
    if (!data_p(f)) {
        return make_error_v();
    }
    const f_type = force_all(data_name(f));
    if (!(symbol_p(f_type) && symbol_equal_p(f_type, function_symbol))) {
        return make_error_v();
    }
    const f_list = force_all(data_list(f));
    if (!construction_p(f_list)) {
        return make_error_v();
    }
    let args_pat = force_all_rec(construction_head(f_list));
    const f_list_cdr = force_all(construction_tail(f_list));
    if (!(construction_p(f_list_cdr) && null_p(force_all(construction_tail(f_list_cdr))))) {
        return make_error_v();
    }
    const f_code = construction_head(f_list_cdr);
    let env = env_null_v;
    let xs_i = 0;
    while (!null_p(args_pat)) {
        if (name_p(args_pat)) {
            let x = null_v;
            for (let i = xs.length - 1; i >= xs_i; i--) {
                x = new_construction(xs[i], x);
            }
            env = env_set(env, args_pat, x);
            xs_i = xs.length;
            args_pat = null_v;
        }
        else if (construction_p(args_pat)) {
            if (xs_i < xs.length) {
                const x = xs[xs_i];
                xs_i++;
                env = env_set(env, construction_head(args_pat), x);
                args_pat = construction_tail(args_pat);
            }
            else {
                return make_error_v();
            }
        }
        else {
            return make_error_v();
        }
    }
    if (xs.length !== xs_i) {
        return make_error_v();
    }
    return evaluate(env, f_code);
}
function real_builtin_func_apply(f, xs) {
    const error_v = new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(f, jsArray_to_list(xs))));
    for (let i = 0; i < real_builtin_func_apply_s.length; i++) {
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(f, real_builtin_func_apply_s[i][0])) {
            const actually_length = real_builtin_func_apply_s[i][1];
            if (xs.length !== actually_length) {
                return error_v;
            }
            const f = real_builtin_func_apply_s[i][2];
            // type WIP
            if (actually_length === 1) {
                return f(xs[0], error_v);
            }
            else if (actually_length === 2) {
                return f(xs[0], xs[1], error_v);
            }
            else if (actually_length === 3) {
                return f(xs[0], xs[1], xs[2], error_v);
            }
            return ERROR();
        }
    }
    return error_v;
}
function real_builtin_form_apply(env, f, xs) {
    const error_v = new_error(system_symbol, new_list(form_builtin_use_systemName, new_list(env2val(env), f, jsArray_to_list(xs)))); // WIP delay未正確處理(影響較小)
    if (jsbool_equal_p(f, quote_form_builtin_systemName)) {
        if (xs.length !== 1) {
            return error_v;
        }
        return xs[0];
    }
    else if (jsbool_equal_p(f, lambda_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v;
        }
        return new_lambda(env, xs[0], xs[1], error_v);
    }
    return error_v;
}
function new_lambda(env, args_pat, body, error_v = false) {
    // 允許返回不同的物--允許實現進行對所有實現有效的優化[比如:消除無用環境中的變量] TODO 未實現
    function make_error_v() {
        if (error_v === false) {
            return new_error(system_symbol, new_list(form_builtin_use_systemName, new_list(env2val(env), lambda_form_builtin_systemName, jsArray_to_list([args_pat, body]))));
        }
        else {
            return error_v;
        }
    }
    function make_quote(x) {
        return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x);
    }
    args_pat = force_all_rec(args_pat); // WIP delay未正確處理(影響較小)
    let args_pat_vars = []; // : JSList LangVal/Name 順序有要求
    let args_pat_is_dot = false;
    let args_pat_iter = args_pat;
    while (!null_p(args_pat_iter)) {
        if (name_p(args_pat_iter)) {
            args_pat_vars.push(args_pat_iter);
            args_pat_is_dot = true;
            args_pat_iter = null_v;
        }
        else if (construction_p(args_pat_iter)) {
            args_pat_vars.push(construction_head(args_pat_iter));
            args_pat_iter = construction_tail(args_pat_iter);
        }
        else {
            return make_error_v();
        }
    }
    let args_pat_vars_val = args_pat; // 是 jsArray_to_list(args_pat_vars) : LangVal
    if (args_pat_is_dot) {
        args_pat_vars_val = jsArray_to_list(args_pat_vars);
    }
    let env_vars = []; // : JSList LangVal/Name
    env_foreach(env, function (k, v) {
        for (let i = 0; i < args_pat_vars.length; i++) {
            if (jsbool_equal_p(args_pat_vars[i], k)) {
                // WIP delay未正確處理(影響較小)
                return;
            }
        }
        env_vars.push(k);
    });
    let new_args_pat = args_pat_vars_val; // : LangVal
    for (let i = env_vars.length - 1; i >= 0; i--) {
        new_args_pat = new_construction(env_vars[i], new_args_pat);
    }
    let new_args = args_pat_vars_val; // : LangVal
    for (let i = env_vars.length - 1; i >= 0; i--) {
        new_args = new_construction(make_quote(must_env_get(env, env_vars[i])), new_args);
    }
    return new_data(function_symbol, new_list(args_pat, new_construction(make_quote(new_data(function_symbol, new_list(new_args_pat, body))), new_args)));
}
function jsbool_equal_p(x, y) {
    if (x === y) {
        return true;
    }
    x = force_all(x);
    y = force_all(y);
    if (x === y) {
        return true;
    }
    function end_2(x, y, f1, f2) {
        if (jsbool_equal_p(f1(x), f1(y)) && jsbool_equal_p(f2(x), f2(y))) {
            lang_set_do(x, y);
            return true;
        }
        else {
            return false;
        }
    }
    if (null_p(x)) {
        if (!null_p(y)) {
            return false;
        }
        lang_set_do(x, null_v);
        lang_set_do(y, null_v);
        return true;
    }
    else if (symbol_p(x)) {
        if (!symbol_p(y)) {
            return false;
        }
        return symbol_equal_p(x, y);
    }
    else if (construction_p(x)) {
        if (!construction_p(y)) {
            return false;
        }
        return end_2(x, y, construction_head, construction_tail);
    }
    else if (error_p(x)) {
        if (!error_p(y)) {
            return false;
        }
        return end_2(x, y, error_name, error_list);
    }
    else if (data_p(x)) {
        if (!data_p(y)) {
            return false;
        }
        return end_2(x, y, data_name, data_list);
    }
    return ERROR();
}
export { jsbool_equal_p as equal_p };
function jsbool_no_force_equal_p(x, y) {
    if (x === y) {
        return true;
    }
    x = un_just_all(x);
    y = un_just_all(y);
    if (x === y) {
        return true;
    }
    function end_2(x, y, f1, f2) {
        if (jsbool_no_force_equal_p(f1(x), f1(y)) && jsbool_no_force_equal_p(f2(x), f2(y))) {
            lang_set_do(x, y);
            return true;
        }
        else {
            return false;
        }
    }
    if (null_p(x)) {
        if (!null_p(y)) {
            return false;
        }
        lang_set_do(x, null_v);
        lang_set_do(y, null_v);
        return true;
    }
    else if (symbol_p(x)) {
        if (!symbol_p(y)) {
            return false;
        }
        return symbol_equal_p(x, y);
    }
    else if (construction_p(x)) {
        if (!construction_p(y)) {
            return false;
        }
        return end_2(x, y, construction_head, construction_tail);
    }
    else if (error_p(x)) {
        if (!error_p(y)) {
            return false;
        }
        return end_2(x, y, error_name, error_list);
    }
    else if (data_p(x)) {
        if (!data_p(y)) {
            return false;
        }
        return end_2(x, y, data_name, data_list);
    }
    else if (delay_evaluate_p(x)) {
        return false; //WIP
    }
    else if (delay_builtin_func_p(x)) {
        return false; //WIP
    }
    else if (delay_builtin_form_p(x)) {
        return false; //WIP
    }
    else if (delay_apply_p(x)) {
        return false; //WIP
    }
    return ERROR();
}
// {{{ 相對獨立的部分。simple parser/printer
function simple_print(x) {
    // [[[ 大量重複代碼 simple_print <-> complex_print
    x = un_just_all(x);
    let temp = "";
    let prefix = "";
    if (null_p(x)) {
        return "()";
    }
    else if (construction_p(x)) {
        temp = "(";
        prefix = "";
        while (construction_p(x)) {
            temp += prefix + simple_print(construction_head(x));
            prefix = " ";
            x = un_just_all(construction_tail(x));
        }
        if (null_p(x)) {
            temp += ")";
        }
        else {
            temp += " . " + simple_print(x) + ")";
        }
        return temp;
    }
    else if (data_p(x)) {
        return "#" + simple_print(new_construction(data_name(x), data_list(x)));
    }
    else if (error_p(x)) {
        return "!" + simple_print(new_construction(error_name(x), error_list(x)));
    }
    else if (symbol_p(x)) {
        return un_symbol(x);
    }
    else if (delay_evaluate_p(x)) {
        return "$(" + simple_print(env2val(delay_evaluate_env(x))) + " " + simple_print(delay_evaluate_x(x)) + ")";
    }
    else if (delay_builtin_func_p(x)) {
        return "%(" + simple_print(delay_builtin_func_f(x)) + " " + simple_print(jsArray_to_list(delay_builtin_func_xs(x))) + ")";
    }
    else if (delay_builtin_form_p(x)) {
        return "@(" +
            simple_print(env2val(delay_builtin_form_env(x))) +
            " " + simple_print(delay_builtin_form_f(x)) +
            " " + simple_print(jsArray_to_list(delay_builtin_form_xs(x))) +
            ")";
    }
    else if (delay_apply_p(x)) {
        return "^(" + simple_print(delay_apply_f(x)) + " " + simple_print(jsArray_to_list(delay_apply_xs(x))) + ")";
    }
    return ERROR(); // 大量重複代碼 simple_print <-> complex_print ]]]
}
function simple_print_force_all_rec(x) {
    return simple_print(force_all_rec(x));
}
export { simple_print, simple_print_force_all_rec };
function simple_parse(x) {
    // [[[ 大量重複代碼 simple_parse <-> complex_parse
    const state_const = x;
    let state = 0;
    function eof() {
        return state_const.length === state;
    }
    function get() {
        ASSERT(!eof());
        const ret = state_const[state];
        state++;
        return ret;
    }
    function put(x) {
        ASSERT(state_const[state - 1] === x);
        state--;
    }
    function parse_error() {
        throw "TheLanguage parse ERROR!";
    }
    function a_space_p(x) {
        return x === " " || x === "\n" || x === "\t" || x === "\r";
    }
    function space() {
        if (eof()) {
            return false;
        }
        let x = get();
        if (!a_space_p(x)) {
            put(x);
            return false;
        }
        while (a_space_p(x) && !eof()) {
            x = get();
        }
        if (!a_space_p(x)) {
            put(x);
        }
        return true;
    }
    function symbol() {
        if (eof()) {
            return false;
        }
        let x = get();
        let ret = "";
        if (!a_symbol_p(x)) {
            put(x);
            return false;
        }
        while (a_symbol_p(x) && !eof()) {
            ret += x;
            x = get();
        }
        if (a_symbol_p(x)) {
            ret += x;
        }
        else {
            put(x);
        }
        return new_symbol(ret);
    }
    function list() {
        if (eof()) {
            return false;
        }
        let x = get();
        if (x !== "(") {
            put(x);
            return false;
        }
        const HOLE = new_symbol('!!@@READ||HOLE@@!!');
        let ret = HOLE;
        function set_last(lst) {
            if (ret === HOLE) {
                ret = lst;
                return;
            }
            let x = ret;
            while (true) {
                if (!construction_p(x)) {
                    return ERROR();
                }
                const d = construction_tail(x);
                if (d === HOLE) {
                    break;
                }
                x = construction_tail(x);
            }
            if (!construction_p(x)) {
                return ERROR();
            }
            if (construction_tail(x) !== HOLE) {
                return ERROR();
            }
            // x[2]是construction_tail
            x[2] = lst; // 實現底層依賴[編號 0] simple_parse, complex_parse <-> 內建數據結構
        }
        function last_add(x) {
            set_last(new_construction(x, HOLE));
        }
        while (true) {
            space();
            if (eof()) {
                return parse_error();
            }
            x = get();
            if (x === ")") {
                set_last(null_v);
                return ret;
            }
            if (x === ".") {
                space();
                const e = val();
                set_last(e);
                space();
                if (eof()) {
                    return parse_error();
                }
                x = get();
                if (x !== ")") {
                    return parse_error();
                }
                return ret;
            }
            put(x);
            const e = val();
            last_add(e);
        }
    }
    function data() {
        if (eof()) {
            return false;
        }
        const x = get();
        if (x !== "#") {
            put(x);
            return false;
        }
        const xs = list();
        if (xs === false) {
            return parse_error();
        }
        if (!construction_p(xs)) {
            return parse_error();
        }
        return new_data(construction_head(xs), construction_tail(xs));
    }
    function readerror() {
        if (eof()) {
            return false;
        }
        const x = get();
        if (x !== "!") {
            put(x);
            return false;
        }
        const xs = list();
        if (xs === false) {
            return parse_error();
        }
        if (!construction_p(xs)) {
            return parse_error();
        }
        return new_error(construction_head(xs), construction_tail(xs));
    }
    function make_read_two(prefix, k) {
        return () => {
            if (eof()) {
                return false;
            }
            const c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            const xs = list();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            const x = construction_tail(xs);
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x));
        };
    }
    function make_read_three(prefix, k) {
        return () => {
            if (eof()) {
                return false;
            }
            const c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            const xs = list();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            const x = construction_tail(xs);
            if (!construction_p(x)) {
                return parse_error();
            }
            const x_d = construction_tail(x);
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d));
        };
    }
    const readeval = make_read_two("$", (e, x) => {
        const env = val2env(e);
        if (env === false) {
            return parse_error();
        }
        return evaluate(env, x);
    });
    const readfuncapply = make_read_two("%", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        return builtin_func_apply(f, jsxs);
    });
    const readformbuiltin = make_read_three("@", (e, f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        const env = val2env(e);
        if (env === false) {
            return parse_error();
        }
        return builtin_form_apply(env, f, jsxs);
    });
    const readapply = make_read_two("^", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        return apply(f, jsxs);
    });
    function a_symbol_p(x) {
        if (a_space_p(x)) {
            return false;
        }
        const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&'
        ];
        for (let i = 0; i < not_xs.length; i++) {
            if (x === not_xs[i]) {
                return false;
            }
        }
        return true;
    }
    function val() {
        space();
        const fs = [list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
        for (let i = 0; i < fs.length; i++) {
            const x = fs[i]();
            if (x !== false) {
                return x;
            }
        }
        return parse_error();
    }
    return val(); // 大量重複代碼 simple_parse <-> complex_parse ]]]
}
export { simple_parse };
// 相對獨立的部分。simple parser/printer }}}
// {{{ 相對獨立的部分。complex parser/complex printer
function complex_parse(x) {
    // [[[ 大量重複代碼 simple_parse <-> complex_parse
    const state_const = x;
    let state = 0;
    function eof() {
        return state_const.length === state;
    }
    function get() {
        ASSERT(!eof());
        const ret = state_const[state];
        state++;
        return ret;
    }
    function put(x) {
        ASSERT(state_const[state - 1] === x);
        state--;
    }
    function parse_error() {
        throw "TheLanguage parse ERROR!";
    }
    function a_space_p(x) {
        return x === " " || x === "\n" || x === "\t" || x === "\r";
    }
    function space() {
        if (eof()) {
            return false;
        }
        let x = get();
        if (!a_space_p(x)) {
            put(x);
            return false;
        }
        while (a_space_p(x) && !eof()) {
            x = get();
        }
        if (!a_space_p(x)) {
            put(x);
        }
        return true;
    }
    function symbol() {
        if (eof()) {
            return false;
        }
        let x = get();
        let ret = "";
        if (!a_symbol_p(x)) {
            put(x);
            return false;
        }
        while (a_symbol_p(x) && !eof()) {
            ret += x;
            x = get();
        }
        if (a_symbol_p(x)) {
            ret += x;
        }
        else {
            put(x);
        }
        return new_symbol(ret);
    }
    function list() {
        if (eof()) {
            return false;
        }
        let x = get();
        if (x !== "(") {
            put(x);
            return false;
        }
        const HOLE = new_symbol('!!@@READ||HOLE@@!!');
        let ret = HOLE;
        function set_last(lst) {
            if (ret === HOLE) {
                ret = lst;
                return;
            }
            let x = ret;
            while (true) {
                if (!construction_p(x)) {
                    return ERROR();
                }
                const d = construction_tail(x);
                if (d === HOLE) {
                    break;
                }
                x = construction_tail(x);
            }
            if (!construction_p(x)) {
                return ERROR();
            }
            if (construction_tail(x) !== HOLE) {
                return ERROR();
            }
            // x[2]是construction_tail
            x[2] = lst; // 實現底層依賴[編號 0] simple_parse, complex_parse <-> 內建數據結構
        }
        function last_add(x) {
            set_last(new_construction(x, HOLE));
        }
        while (true) {
            space();
            if (eof()) {
                return parse_error();
            }
            x = get();
            if (x === ")") {
                set_last(null_v);
                return ret;
            }
            if (x === ".") {
                space();
                const e = val();
                set_last(e);
                space();
                if (eof()) {
                    return parse_error();
                }
                x = get();
                if (x !== ")") {
                    return parse_error();
                }
                return ret;
            }
            put(x);
            const e = val();
            last_add(e);
        }
    }
    function data() {
        if (eof()) {
            return false;
        }
        const x = get();
        if (x !== "#") {
            put(x);
            return false;
        }
        const xs = list();
        if (xs === false) {
            return parse_error();
        }
        if (!construction_p(xs)) {
            return parse_error();
        }
        return new_data(construction_head(xs), construction_tail(xs));
    }
    function readerror() {
        if (eof()) {
            return false;
        }
        const x = get();
        if (x !== "!") {
            put(x);
            return false;
        }
        const xs = list();
        if (xs === false) {
            return parse_error();
        }
        if (!construction_p(xs)) {
            return parse_error();
        }
        return new_error(construction_head(xs), construction_tail(xs));
    }
    function make_read_two(prefix, k) {
        return () => {
            if (eof()) {
                return false;
            }
            const c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            const xs = list();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            const x = construction_tail(xs);
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x));
        };
    }
    function make_read_three(prefix, k) {
        return () => {
            if (eof()) {
                return false;
            }
            const c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            const xs = list();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            const x = construction_tail(xs);
            if (!construction_p(x)) {
                return parse_error();
            }
            const x_d = construction_tail(x);
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d));
        };
    }
    const readeval = make_read_two("$", (e, x) => {
        const env = val2env(e);
        if (env === false) {
            return parse_error();
        }
        return evaluate(env, x);
    });
    const readfuncapply = make_read_two("%", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        return builtin_func_apply(f, jsxs);
    });
    const readformbuiltin = make_read_three("@", (e, f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        const env = val2env(e);
        if (env === false) {
            return parse_error();
        }
        return builtin_form_apply(env, f, jsxs);
    });
    const readapply = make_read_two("^", (f, xs) => {
        const jsxs = list_to_jsArray(xs, (xs) => xs, (xs, y) => parse_error());
        return apply(f, jsxs);
    });
    function a_symbol_p(x) {
        if (a_space_p(x)) {
            return false;
        }
        const not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&'
        ];
        for (let i = 0; i < not_xs.length; i++) {
            if (x === not_xs[i]) {
                return false;
            }
        }
        return true;
    }
    function val() {
        space();
        const fs = [list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
        for (let i = 0; i < fs.length; i++) {
            const x = fs[i]();
            if (x !== false) {
                return x;
            }
        }
        return parse_error();
    }
    return val(); // 大量重複代碼 simple_parse <-> complex_parse ]]]
    function un_maybe(x) {
        if (x === false) {
            return parse_error();
        }
        return x;
    }
    function not_eof() {
        return !eof();
    }
    function assert_get(c) {
        un_maybe(not_eof());
        un_maybe(get() === c);
    }
    function readsysname_no_pack() {
        if (eof()) {
            return false;
        }
        const head = get();
        if (head === '&') {
            un_maybe(not_eof());
            const c0 = get();
            if (c0 === '+') {
                const x = readsysname_no_pack_inner_must();
                return new_list(form_symbol, new_list(system_symbol, x));
            }
            else {
                put(c0);
            }
            const x = readsysname_no_pack_inner_must();
            return new_list(form_symbol, x);
        }
        else if (head === ':') {
            un_maybe(not_eof());
            const c0 = get();
            if (c0 === '&') {
                assert_get('>');
                const x = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, x)), theThing_symbol);
            }
            else if (c0 === '>') {
                const x = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, x), theThing_symbol);
            }
            else {
                put(c0);
            }
            const x = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_symbol, x, theThing_symbol);
        }
        else if (head === '+') {
            const x = readsysname_no_pack_inner_must();
            return new_list(system_symbol, x);
        }
        else if (head === '[') {
            const x = readsysname_no_pack_inner_must();
            assert_get(']');
            return may_xfx_xf(x);
        }
        else if (head === '_') {
            assert_get(':');
            const x = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_symbol, x, something_symbol);
        }
        else {
            put(head);
            const x = symbol();
            if (x === false) {
                return false;
            }
            return may_xfx_xf(x);
        }
        return ERROR();
        function readsysname_no_pack_inner_must(strict = false) {
            function readsysname_no_pack_bracket() {
                assert_get('[');
                const x = readsysname_no_pack_inner_must();
                assert_get(']');
                return x;
            }
            // 重複自val()
            const fs = strict ? [list, symbol, readsysname_no_pack_bracket, data,
                readerror, readeval, readfuncapply, readformbuiltin, readapply] :
                [list, readsysname_no_pack, data,
                    readerror, readeval, readfuncapply, readformbuiltin, readapply];
            for (let i = 0; i < fs.length; i++) {
                const x = fs[i]();
                if (x !== false) {
                    return x;
                }
            }
            return parse_error();
        }
        function may_xfx_xf(x) {
            if (eof()) {
                return x;
            }
            const head = get();
            if (head === '.') {
                const y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(x), something_symbol), y);
            }
            else if (head === ':') {
                const y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, y, x);
            }
            else if (head === '~') {
                return new_list(isOrNot_symbol, x);
            }
            else if (head === '@') {
                const y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(x, something_symbol), something_symbol), y);
            }
            else if (head === '?') {
                return new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, x));
            }
            else if (head === '/') {
                let ys = [x];
                while (true) {
                    const y = readsysname_no_pack_inner_must(true);
                    ys.push(y);
                    if (eof()) {
                        break;
                    }
                    const c0 = get();
                    if (c0 !== '/') {
                        put(c0);
                        break;
                    }
                }
                return new_list(sub_symbol, jsArray_to_list(ys));
            }
            else {
                put(head);
                return x;
            }
            return ERROR();
        }
        return ERROR();
    }
    function readsysname() {
        const x = readsysname_no_pack();
        if (x === false) {
            return false;
        }
        if (symbol_p(x)) {
            return x;
        }
        return systemName_make(x);
    }
}
export { complex_parse };
function complex_print(val) {
    function print_sys_name(x, where) {
        // 是 complex_print(systemName_make(x))
        // x : LangVal
        // inner : JSBoolean
        if (symbol_p(x)) {
            return un_symbol(x);
        }
        function inner_bracket(x) {
            if (where === 'inner') {
                return '[' + x + ']';
            }
            else if (where === 'top') {
                return x;
            }
            return ERROR();
        }
        const maybe_xs = maybe_list_to_jsArray(x);
        if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], typeAnnotation_symbol)) {
            // new_list(typeAnnotation_symbol, maybe_xs[1], maybe_xs[2])
            const maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1]);
            if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], function_symbol)) {
                const var_2_1 = maybe_lst_2[1];
                // new_list(typeAnnotation_symbol, new_list(function_symbol, var_2_1, maybe_lst_2[2]), maybe_xs[2])
                const maybe_lst_3 = maybe_list_to_jsArray(var_2_1);
                if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(maybe_lst_3[0]), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(maybe_lst_3[0], 'inner') + '.' + print_sys_name(maybe_xs[2], 'inner'));
                }
                else if (construction_p(var_2_1) && jsbool_no_force_equal_p(construction_tail(var_2_1), something_symbol) && jsbool_no_force_equal_p(maybe_lst_2[2], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(construction_head(var_2_1), something_symbol), something_symbol), maybe_xs[2])
                    return inner_bracket(print_sys_name(construction_head(var_2_1), 'inner') + '@' + print_sys_name(maybe_xs[2], 'inner'));
                }
                else if (jsbool_no_force_equal_p(var_2_1, something_symbol) && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, maybe_lst_2[2]), theThing_symbol)
                    return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], 'inner'));
                }
            }
            const maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2]);
            if (jsbool_no_force_equal_p(maybe_xs[1], function_symbol) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isOrNot_symbol)) {
                // new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, maybe_lst_44[1]))
                return inner_bracket(print_sys_name(maybe_lst_44[1], 'inner') + '?');
            }
            if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) && jsbool_no_force_equal_p(maybe_lst_2[0], form_symbol)) {
                // new_list(typeAnnotation_symbol, new_list(form_symbol, var_2_1), theThing_symbol)
                const maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1]);
                if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], function_symbol) && jsbool_no_force_equal_p(maybe_lst_88[1], something_symbol)) {
                    // new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, maybe_lst_88[2])), theThing_symbol)
                    return inner_bracket(':&>' + print_sys_name(maybe_lst_88[2], 'inner'));
                }
            }
            const hd = jsbool_no_force_equal_p(maybe_xs[2], something_symbol) ? '_' :
                jsbool_no_force_equal_p(maybe_xs[2], theThing_symbol) ? '' :
                    print_sys_name(maybe_xs[2], 'inner');
            return inner_bracket(hd + ':' + print_sys_name(maybe_xs[1], 'inner'));
        }
        else if (maybe_xs !== false && maybe_xs.length === 2) {
            if (jsbool_no_force_equal_p(maybe_xs[0], form_symbol)) {
                // new_list(form_symbol, maybe_xs[1])
                const maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1]);
                if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], system_symbol)) {
                    // new_list(form_symbol, new_list(system_symbol, maybe_lst_288[1]))
                    return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], 'inner'));
                }
                return inner_bracket('&' + print_sys_name(maybe_xs[1], 'inner'));
            }
            else if (jsbool_no_force_equal_p(maybe_xs[0], isOrNot_symbol)) {
                // new_list(isOrNot_symbol, maybe_xs[1])
                return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + '~');
            }
            else if (jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
                // new_list(system_symbol, maybe_xs[1])
                return inner_bracket('+' + print_sys_name(maybe_xs[1], 'inner'));
            }
            else if (jsbool_no_force_equal_p(maybe_xs[0], sub_symbol)) {
                // new_list(sub_symbol, maybe_xs[1])
                const maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[1]);
                if (maybe_lst_8934 !== false && maybe_lst_8934.length > 1) {
                    let tmp = print_sys_name(maybe_lst_8934[0], 'inner');
                    for (let i = 1; i < maybe_lst_8934.length; i++) {
                        tmp += '/' + print_sys_name(maybe_lst_8934[i], 'inner');
                    }
                    return inner_bracket(tmp);
                }
            }
        }
        if (where === 'inner') {
            return simple_print(x);
        }
        else if (where === 'top') {
            return simple_print(systemName_make(x));
        }
        return ERROR();
    }
    // [[[ 大量重複代碼 simple_print <-> complex_print
    let x = simple_parse(simple_print(val)); // 去除所有just
    let temp = "";
    let prefix = "";
    if (null_p(x)) {
        return "()";
    }
    else if (construction_p(x)) {
        temp = "(";
        prefix = "";
        while (construction_p(x)) {
            temp += prefix + complex_print(construction_head(x));
            prefix = " ";
            x = construction_tail(x);
        }
        if (null_p(x)) {
            temp += ")";
        }
        else {
            temp += " . " + complex_print(x) + ")";
        }
        return temp;
    }
    else if (data_p(x)) {
        const name = data_name(x);
        const list = data_list(x);
        const maybe_xs = maybe_list_to_jsArray(list);
        if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_symbol) && jsbool_no_force_equal_p(maybe_xs[0], system_symbol)) {
            // systemName_make(maybe_xs[1])
            return print_sys_name(maybe_xs[1], 'top');
        }
        return "#" + complex_print(new_construction(name, list));
    }
    else if (error_p(x)) {
        return "!" + complex_print(new_construction(error_name(x), error_list(x)));
    }
    else if (symbol_p(x)) {
        return un_symbol(x);
    }
    else if (delay_evaluate_p(x)) {
        return "$(" + complex_print(env2val(delay_evaluate_env(x))) + " " + complex_print(delay_evaluate_x(x)) + ")";
    }
    else if (delay_builtin_func_p(x)) {
        return "%(" + complex_print(delay_builtin_func_f(x)) + " " + complex_print(jsArray_to_list(delay_builtin_func_xs(x))) + ")";
    }
    else if (delay_builtin_form_p(x)) {
        return "@(" +
            complex_print(env2val(delay_builtin_form_env(x))) +
            " " + complex_print(delay_builtin_form_f(x)) +
            " " + complex_print(jsArray_to_list(delay_builtin_form_xs(x))) +
            ")";
    }
    else if (delay_apply_p(x)) {
        return "^(" + complex_print(delay_apply_f(x)) + " " + complex_print(jsArray_to_list(delay_apply_xs(x))) + ")";
    }
    return ERROR(); // 大量重複代碼 simple_print <-> complex_print ]]]
}
export { complex_print };
// 相對獨立的部分。complex parser/complex printer }}}
/*
// {{{ 相對獨立的部分。IO
const return_inputOutput_systemName = complex_parse('效應/[:物]')
const bind_inputOutput_systemName = complex_parse('效應/連')
const ecmascript_systemName = systemName_make(complex_parse('(為符名連 e c m a s c r i p t)'))
export {
    return_inputOutput_systemName,
    bind_inputOutput_systemName,
    ecmascript_systemName
}
//WIP
// 相對獨立的部分。IO }}}
*/
