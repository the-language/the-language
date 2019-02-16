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
'use strict';
var TheLanguage = (function() {
    var enable_nodejs = true;
    var in_nodejs = module ? true : false; // fix me?
    var exports = {};
    if (enable_nodejs && in_nodejs) {
        // fix me?
        exports = module.exports;
    }

    function ERROR() {
        var PANIC = null;
        PANIC();
    }

    function ASSERT(x) {
        if (!x) {
            ERROR();
        }
    }

    function DEBUG(x) {
        //禁用 console.log(x);
    }

    function jsnull_p(x) {
        // undefined/null
        return x == null;
    }

    // {{{ 相對獨立的部分。內建數據結構
    var symbol_t = 0;
    var cons_t = 1;
    var null_t = 2;
    var data_t = 3;
    var error_t = 4;
    var just_t = 5;
    var delay_eval_t = 6;
    var delay_builtin_func_t = 7;
    var delay_builtin_form_t = 8;
    var delay_apply_t = 9;

    function type_of(x) {
        return x[0];
    }

    function make_one_p(t) {
        return function(x) {
            return x[0] === t;
        };
    }
    var make_two_p = make_one_p;
    var make_three_p = make_one_p;

    function make_new_one(t) {
        return function(x) {
            return [t, x];
        };
    }

    function make_new_two(t) {
        return function(x, y) {
            return [t, x, y]; // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
        };
    }

    function make_new_three(t) {
        return function(x, y, z) {
            return [t, x, y, z];
        };
    }

    function make_get_one_a(t) {
        return function(x) {
            ASSERT(x[0] === t);
            return x[1];
        };
    }
    var make_get_two_a = make_get_one_a;
    var make_get_three_a = make_get_one_a;

    function make_get_two_b(t) {
        return function(x) {
            ASSERT(x[0] === t);
            return x[2];
        };
    }
    var make_get_three_b = make_get_two_b;

    function make_get_three_c(t) {
        return function(x) {
            ASSERT(x[0] === t);
            return x[3];
        };
    }

    var new_symbol = make_new_one(symbol_t);
    var symbol_p = make_one_p(symbol_t); // String
    var un_symbol = make_get_one_a(symbol_t);
    exports.new_symbol = new_symbol;
    exports.symbol_p = symbol_p;
    exports.un_symbol = un_symbol;

    var new_cons = make_new_two(cons_t);
    var cons_p = make_two_p(cons_t);
    var cons_car = make_get_two_a(cons_t);
    var cons_cdr = make_get_two_b(cons_t);
    exports.new_cons = new_cons;
    exports.cons_p = cons_p;
    exports.cons_head = cons_car;
    exports.cons_tail = cons_cdr;

    var null_v = [null_t];

    function null_p(x) {
        return x[0] === null_t;
    }
    exports.null_v = null_v;
    exports.null_p = null_p;

    var new_data = make_new_two(data_t);
    var data_p = make_two_p(data_t);
    var data_name = make_get_two_a(data_t);
    var data_list = make_get_two_b(data_t);
    exports.new_data = new_data;
    exports.data_p = data_p;
    exports.data_name = data_name;
    exports.data_list = data_list;

    var new_error = make_new_two(error_t);
    var error_p = make_two_p(error_t);
    var error_name = make_get_two_a(error_t);
    var error_list = make_get_two_b(error_t);
    exports.new_error = new_error;
    exports.error_p = error_p;
    exports.error_name = error_name;
    exports.error_list = error_list;

    function lang_set_do(x, y) {
        // 只用于x与y等价的情况
        if (x === y) {
            return;
        }
        x[0] = just_t;
        x[1] = y;
        x[2] = null;
        x[3] = null;
    }
    var just_p = make_one_p(just_t);
    var un_just = make_get_one_a(just_t);
    var lang_eval = make_new_two(delay_eval_t);
    exports.eval = lang_eval;
    var delay_eval_p = make_two_p(delay_eval_t);
    var delay_eval_env = make_get_two_a(delay_eval_t); // Env
    var delay_eval_x = make_get_two_b(delay_eval_t);
    var builtin_form_apply = make_new_three(delay_builtin_form_t);
    var delay_builtin_form_p = make_three_p(delay_builtin_form_t);
    var delay_builtin_form_env = make_get_three_a(delay_builtin_form_t); // Env
    var delay_builtin_form_f = make_get_three_b(delay_builtin_form_t);
    var delay_builtin_form_xs = make_get_three_c(delay_builtin_form_t); // JSList LangVal
    var builtin_func_apply = make_new_two(delay_builtin_func_t);
    var delay_builtin_func_p = make_two_p(delay_builtin_func_t);
    var delay_builtin_func_f = make_get_two_a(delay_builtin_func_t); // LangVal/Name
    var delay_builtin_func_xs = make_get_two_b(delay_builtin_func_t); // JSList LangVal
    var lang_apply = make_new_two(delay_apply_t);
    exports.apply = lang_apply;
    var delay_apply_p = make_two_p(delay_apply_t);
    var delay_apply_f = make_get_two_a(delay_apply_t);
    var delay_apply_xs = make_get_two_b(delay_apply_t); // JSList LangVal
    function force_all_rec(x) {
        x = force_all(x);
        switch (type_of(x)) {
            case data_t:
            case error_t:
            case cons_t:
                x[1] = force_all_rec(x[1]);
                x[2] = force_all_rec(x[2]);
                return x;
            default:
                return x;
        }
    }
    exports.force_rec = force_all_rec;
    // 相對獨立的部分。內建數據結構 }}}

    // {{{ 相對獨立的部分。符號名稱
    exports.symbols = {};
    var sys_sym = new_symbol("太始初核");
    exports.symbols.system = sys_sym;
    var name_sym = new_symbol("符名");
    exports.symbols.name = name_sym;
    var func_sym = new_symbol("化滅");
    exports.symbols.func = func_sym;
    var form_sym = new_symbol("式形");
    exports.symbols.form = form_sym;
    var equal_sym = new_symbol("等同");
    exports.symbols.equal = equal_sym;
    var eval_sym = new_symbol("解算");
    exports.symbols.eval = eval_sym;
    var the_sym = new_symbol("特定其物");
    exports.symbols.the_thing = the_sym;
    var sth_sym = new_symbol("省略一物");
    exports.symbols.something = sth_sym;
    var map_sym = new_symbol("映表");
    exports.symbols.mapping = map_sym;
    var if_sym = new_symbol("若");
    exports.symbols.if = if_sym;
    var a_sym = new_symbol("一類何物");
    exports.symbols.type_annotation = a_sym;
    var isornot_sym = new_symbol("是非");
    exports.symbols.is_or_not = isornot_sym;
    var sub_sym = new_symbol("其子");
    exports.symbols.sub_sym = sub_sym;
    var true_sym = new_symbol("陽");
    exports.symbols.true = true_sym;
    var false_sym = new_symbol("陰");
    exports.symbols.false = false_sym;
    var quote_sym = new_symbol("引用");
    exports.symbols.quote = quote_sym;
    var apply_sym = new_symbol("應用");
    exports.symbols.apply = apply_sym;
    var null_sym = new_symbol("空");
    exports.symbols.null = null_sym;
    var cons_sym = new_symbol("連");
    exports.symbols.cons = cons_sym;
    var data_sym = new_symbol("構");
    exports.symbols.data = data_sym;
    var error_sym = new_symbol("誤");
    exports.symbols.error = error_sym;
    var sym_sym = new_symbol("詞素");
    exports.symbols.symbol = sym_sym;
    var list_sym = new_symbol("列");
    exports.symbols.list = list_sym;
    var head_sym = new_symbol("首");
    exports.symbols.head = head_sym;
    var tail_sym = new_symbol("尾");
    exports.symbols.tail = tail_sym;
    var thing_sym = new_symbol("物");
    exports.symbols.thing = thing_sym;
    var the_world_stopped_sym = new_symbol("宇宙亡矣");
    exports.symbols.the_world_stopped = the_world_stopped_sym;
    var the_world_stopped_v = new_error(sys_sym, new_list(the_world_stopped_sym, sth_sym));

    function make_sys_sym_f(x) {
        return new_data(name_sym, new_list(sys_sym, x));
    }

    function make_builtin_f_new_sym_f(x_sym) {
        return make_sys_sym_f(new_list(a_sym, new_list(func_sym, sth_sym, x_sym), the_sym));
    }

    function make_builtin_f_get_sym_f(t_sym, x_sym) {
        return make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_list(t_sym), sth_sym), x_sym));
    }

    function make_builtin_f_p_sym_f(t_sym) {
        return make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, t_sym, sth_sym))));
    }
    exports.symbols.builtin = {};
    exports.symbols.builtin.func = {};
    var builtin_func_new_data_sym = make_builtin_f_new_sym_f(data_sym);
    exports.symbols.builtin.func.new_data = builtin_func_new_data_sym;
    var builtin_func_data_name_sym = make_builtin_f_get_sym_f(data_sym, name_sym);
    exports.symbols.builtin.func.data_name = builtin_func_data_name_sym;
    var builtin_func_data_list_sym = make_builtin_f_get_sym_f(data_sym, list_sym);
    exports.symbols.builtin.func.data_list = builtin_func_data_list_sym;
    var builtin_func_data_p_sym = make_builtin_f_p_sym_f(data_sym);
    exports.symbols.builtin.func.data_p = builtin_func_data_p_sym;

    var builtin_func_new_error_sym = make_builtin_f_new_sym_f(error_sym);
    exports.symbols.builtin.func.new_error = builtin_func_new_error_sym;
    var builtin_func_error_name_sym = make_builtin_f_get_sym_f(error_sym, name_sym);
    exports.symbols.builtin.func.error_name = builtin_func_error_name_sym;
    var builtin_func_error_list_sym = make_builtin_f_get_sym_f(error_sym, list_sym);
    exports.symbols.builtin.func.error_list = builtin_func_error_list_sym;
    var builtin_func_error_p_sym = make_builtin_f_p_sym_f(error_sym);
    exports.symbols.builtin.func.error_p = builtin_func_error_p_sym;

    var builtin_func_new_cons_sym = make_builtin_f_new_sym_f(cons_sym);
    exports.symbols.builtin.func.new_cons = builtin_func_new_cons_sym;
    var builtin_func_cons_p_sym = make_builtin_f_p_sym_f(cons_sym);
    exports.symbols.builtin.func.cons_p = builtin_func_cons_p_sym;
    var builtin_func_cons_head_sym = make_builtin_f_get_sym_f(cons_sym, head_sym);
    exports.symbols.builtin.func.cons_head = builtin_func_cons_head_sym;
    var builtin_func_cons_tail_sym = make_builtin_f_get_sym_f(cons_sym, tail_sym);
    exports.symbols.builtin.func.cons_tail = builtin_func_cons_tail_sym;

    var builtin_func_sym_p_sym = make_builtin_f_p_sym_f(sym_sym);
    exports.symbols.builtin.func.symbol_p = builtin_func_sym_p_sym;

    var builtin_func_null_p_sym = make_builtin_f_p_sym_f(null_sym);
    exports.symbols.builtin.func.null_p = builtin_func_null_p_sym;

    var builtin_func_equal_sym = make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, equal_sym)));
    exports.symbols.builtin.func.equal_p = builtin_func_equal_sym;
    var builtin_func_apply_sym = make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_cons(func_sym, sth_sym), sth_sym), apply_sym));
    exports.symbols.builtin.func.apply = builtin_func_apply_sym;
    var builtin_func_eval_sym = make_sys_sym_f(new_list(a_sym, func_sym, eval_sym));
    exports.symbols.builtin.func.eval = builtin_func_eval_sym;
    var builtin_func_list_choose_sym = make_builtin_f_get_sym_f(list_sym, new_list(a_sym, thing_sym, sth_sym));
    exports.symbols.builtin.func.list_choose_one = builtin_func_list_choose_sym;
    var builtin_func_if_sym = make_sys_sym_f(new_list(a_sym, func_sym, if_sym));
    exports.symbols.builtin.func.if = builtin_func_if_sym;

    exports.symbols.builtin.form = {};
    var builtin_form_quote_sym = make_sys_sym_f(new_list(a_sym, form_sym, quote_sym));
    exports.symbols.builtin.form.quote = builtin_form_quote_sym;
    var builtin_form_lambda_sym = make_sys_sym_f(new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, func_sym)), the_sym));
    exports.symbols.builtin.form.lambda = builtin_form_lambda_sym;

    var use_builtin_func_sym = make_sys_sym_f(new_list(form_sym, new_list(sys_sym, func_sym)));
    exports.symbols.use_builtin_function = use_builtin_func_sym;
    var use_builtin_form_sym = make_sys_sym_f(new_list(form_sym, new_list(sys_sym, form_sym)));
    exports.symbols.use_builtin_form = use_builtin_form_sym;
    var use_form_sym = make_sys_sym_f(new_list(form_sym, form_sym));
    exports.symbols.use_form = use_form_sym;
    var false_v = new_data(false_sym, new_list());
    var true_v = new_data(true_sym, new_list());

    function symbol_eq_p(x, y) {
        ASSERT(symbol_p(x) && symbol_p(y));
        if (x === y) {
            return true;
        }
        // 其他語言暫未實現。 WIP
        if (un_symbol(x) === un_symbol(y)) {
            lang_set_do(x, y);
            return true;
        } else {
            return false;
        }
    }
    // 相對獨立的部分。符號名稱 }}}

    // {{{ 相對獨立的部分。對內建數據結構的簡單處理
    function jslist2list(xs) {
        // JSList a -> LangVal
        var ret = null_v;
        for (var i = xs.length - 1; i >= 0; i--) {
            ret = new_cons(xs[i], ret);
        }
        return ret;
    }

    function list2jslist(xs, k_done, k_tail) {
        // LangVal, (JSList a -> b), (JSList a, LangVal -> b) -> b
        if (jsnull_p(k_done)) {
            k_done = function(x) {
                return x;
            };
        }
        var ret = [];
        while (cons_p(xs)) {
            ret.push(cons_car(xs));
            xs = cons_cdr(xs);
        }
        if (null_p(xs)) {
            return k_done(ret);
        }
        return k_tail(ret, xs);
    }

    function maybe_list2js(xs) {
        // LangVal -> Maybe (JSList LangVal)
        return list2jslist(xs, function(xs) {
            return xs;
        }, function(xs, x) {
            return false;
        });
    }

    function new_list() {
        return jslist2list(arguments);
    }
    exports.jslist2list = jslist2list;
    exports.new_list = new_list;

    function un_just_all(raw) {
        var x = raw;
        var xs = [];
        while (just_p(x)) {
            xs.push(x);
            x = un_just(x);
        }
        for (var i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], x);
        }
        return x;
    }

    function any_delay_just_p(x) {
        return just_p(x) || delay_eval_p(x) || delay_builtin_form_p(x) || delay_builtin_func_p(x) || delay_apply_p(x);
    }
    exports.delay_p = any_delay_just_p;

    function force_all(raw, parents_history, ref_novalue_replace) {
        // LangVal -> LangVal
        // *history : Map String True
        // ref_novalue_replace : [finding_minimal_novalue : Bool, found_minimal_novalue : Bool]
        if (jsnull_p(parents_history)) {
            parents_history = {};
        }
        if (jsnull_p(ref_novalue_replace)) {
            ref_novalue_replace = [false, false];
        }
        var history = {};
        var x = raw;
        var xs = [];

        function replace_this_with_stopped() {
            // 語言標準允許替換沒有值的東西為那種錯誤。
            ref_novalue_replace[1] = true;
            lang_set_do(x, the_world_stopped_v);
            for (var i = 0; i < xs.length; i++) {
                lang_set_do(xs[i], the_world_stopped_v);
            }
            return the_world_stopped_v;
        }

        function make_history() {
            var ret = {};
            for (var x_id in history) {
                ret[x_id] = true;
            }
            for (var x_id in parents_history) {
                ret[x_id] = true;
            }
            return ret;
        }
        while (any_delay_just_p(x)) {
            var x_id = print(x);
            if (parents_history[x_id] === true) {
                return replace_this_with_stopped();
            }
            if (history[x_id] === true) {
                ref_novalue_replace[0] = true;
                // 減少替換範圍：(f <沒有值>) 的(f _)
                switch (type_of(x)) {
                    case delay_eval_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    case delay_builtin_func_t:
                        var f = delay_builtin_func_f(x); // LangVal/Name
                        var xs = delay_builtin_func_xs(x); // JSList LangVal
                        var elim_s = [builtin_func_data_name_sym, builtin_func_data_list_sym, builtin_func_data_p_sym, builtin_func_error_name_sym, builtin_func_error_list_sym, builtin_func_error_p_sym, builtin_func_cons_p_sym, builtin_func_cons_head_sym, builtin_func_cons_tail_sym, builtin_func_sym_p_sym, builtin_func_null_p_sym];
                        var is_elim = false;
                        for (var i = 0; i < elim_s.length; i++) {
                            if (jsbool_equal_p(elim_s[i], f)) {
                                is_elim = true;
                            }
                        }
                        if (is_elim) {
                            ASSERT(xs.length === 1);
                            ASSERT(ref_novalue_replace[1] === false);
                            var inner = force_all(xs[0], make_history(), ref_novalue_replace);
                            if (ref_novalue_replace[1]) {
                                return force_all(builtin_func_apply(f, [inner]));
                            } else {
                                ERROR(); //我覺得沒有這種情況
                                return replace_this_with_stopped();
                            }
                        }
                        if (jsbool_equal_p(f, builtin_func_equal_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_apply_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_eval_sym)) {
                            return replace_this_with_stopped(); //WIP
                        } else if (jsbool_equal_p(f, builtin_func_if_sym)) {
                            ASSERT(xs.length === 3);
                            ASSERT(ref_novalue_replace[1] === false);
                            var tf = force_all(xs[0], make_history(), ref_novalue_replace);
                            if (ref_novalue_replace[1]) {
                                return force_all(builtin_func_apply(builtin_func_if_sym, [tf, xs[1], xs[2]]));
                            } else {
                                ERROR(); //我覺得沒有這種情況
                                return replace_this_with_stopped();
                            }
                        }
                        ERROR(); //我覺得沒有這種情況
                    case delay_builtin_form_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    case delay_apply_t:
                        return replace_this_with_stopped(); // 可能未減少應該減少的？
                    default:
                }
                ERROR();
            }
            history[x_id] = true;
            xs.push(x);
            x = force1(x);
        }
        for (var i = 0; i < xs.length; i++) {
            lang_set_do(xs[i], x);
        }
        return x;
    }

    function force1(raw) {
        // LangVal -> LangVal
        var x = un_just_all(raw);
        var ret;
        ASSERT(!just_p(x));
        if (delay_eval_p(x)) {
            ret = real_eval(delay_eval_env(x), delay_eval_x(x));
        } else if (delay_builtin_form_p(x)) {
            ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x));
        } else if (delay_builtin_func_p(x)) {
            ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x));
        } else if (delay_apply_p(x)) {
            ret = real_lang_apply(delay_apply_f(x), delay_apply_xs(x));
        } else {
            ret = x;
        }
        ret = un_just_all(ret);
        lang_set_do(x, ret);
        return ret;
    }
    exports.force = force_all;
    exports.force1 = force1;
    // 相對獨立的部分。對內建數據結構的簡單處理 }}}

    // {{{ 相對獨立的部分。變量之環境
    var env_null_v = [];

    function env_set(env, key, val) {
        // Env k v, k, v -> Env k v
        var ret = [];
        for (var i = 0; i < env.length; i = i + 2) {
            // WIP delay未正確處理(影響較小)
            if (jsbool_equal_p(env[i + 0], key)) {
                ret[i + 0] = key;
                ret[i + 1] = val;
                for (i = i + 2; i < env.length; i = i + 2) {
                    ret[i + 0] = env[i + 0];
                    ret[i + 1] = env[i + 1];
                }
                return ret;
            } else {
                ret[i + 0] = env[i + 0];
                ret[i + 1] = env[i + 1];
            }
        }
        ret[env.length + 0] = key;
        ret[env.length + 1] = val;
        return ret;
    }

    function env_get(env, key, default_v) {
        // Env k v, k, v -> v
        for (var i = 0; i < env.length; i = i + 2) {
            if (jsbool_equal_p(env[i + 0], key)) {
                return env[i + 1];
            }
        }
        return default_v;
    }

    function must_env_get(env, key) {
        // Env k v, k, v -> v
        for (var i = 0; i < env.length; i = i + 2) {
            if (jsbool_equal_p(env[i + 0], key)) {
                return env[i + 1];
            }
        }
        ERROR();
    }
    exports.env_null_v = env_null_v;
    exports.env_set = env_set;
    exports.env_get = env_get;

    function env2val(env) {
        // Env k v -> LangVal
        var ret = null_v;
        for (var i = 0; i < env.length; i = i + 2) {
            ret = new_cons(new_list(env[i + 0], env[i + 1]), ret);
        }
        return new_data(map_sym, new_list(ret));
    }

    function env_foreach(env, f) {
        // env : Env k v
        // f : k, v -> _
        for (var i = 0; i < env.length; i = i + 2) {
            f(env[i + 0], env[i + 1]);
        }
    }

    function val2env(x) {
        // LangVal -> Maybe (Env k v)
        x = force_all(x);
        if (!data_p(x)) {
            return false;
        }
        var s = force_all(data_name(x));
        if (!symbol_p(s)) {
            return false;
        }
        if (!symbol_eq_p(s, map_sym)) {
            return false;
        }
        s = force_all(data_list(x));
        if (!cons_p(s)) {
            return false;
        }
        if (!null_p(force_all(cons_cdr(s)))) {
            return false;
        }
        var ret = [];
        var xs = force_all(cons_car(s));
        while (!null_p(xs)) {
            if (!cons_p(xs)) {
                return false;
            }
            var x = force_all(cons_car(xs));
            xs = force_all(cons_cdr(xs));
            if (!cons_p(x)) {
                return false;
            }
            var k = cons_car(x);
            x = force_all(cons_cdr(x));
            if (!cons_p(x)) {
                return false;
            }
            var v = cons_car(x);
            if (!null_p(force_all(cons_cdr(x)))) {
                return false;
            }
            (function() {
                for (var i = 0; i < ret.length; i = i + 2) {
                    if (jsbool_equal_p(ret[i + 0], k)) {
                        ret[i + 1] = v;
                        return;
                    }
                }
                ret.push(k);
                ret.push(v);
            })();
        }
        return ret;
    }
    exports.env2val = env2val;
    exports.val2env = val2env;
    // 相對獨立的部分。變量之環境 }}}

    function real_eval(env, raw) {
        // Env, LangVal -> LangVal
        var x = force1(raw);
        if (any_delay_just_p(x)) {
            return lang_eval(env, x);
        }
        var error_v = new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_eval_sym, new_list(env2val(env), x))));
        switch (type_of(x)) {
            case cons_t:
                var xs = [];
                var rest = x;
                while (!null_p(rest)) {
                    if (any_delay_just_p(rest)) {
                        return lang_eval(env, x);
                    } else if (cons_p(rest)) {
                        xs.push(cons_car(rest));
                        // WIP delay未正確處理(影響較小)
                        rest = force1(cons_cdr(rest));
                    } else {
                        DEBUG("[ERROR/eval] not list");
                        return error_v;
                    }
                }
                // WIP delay未正確處理(影響較小)
                if (jsbool_equal_p(xs[0], use_builtin_form_sym)) {
                    if (xs.length === 1) {
                        DEBUG("[ERROR/eval] builtin_form/len=1");
                        return error_v;
                    }
                    var f = xs[1];
                    var args = [];
                    for (var i = 2; i < xs.length; i++) {
                        args[i - 2] = xs[i];
                    }
                    return builtin_form_apply(env, f, args);
                } else if (jsbool_equal_p(xs[0], use_form_sym)) {
                    if (xs.length === 1) {
                        DEBUG("[ERROR/eval] form/len=1");
                        return error_v;
                    }
                    // WIP delay未正確處理(影響較小)
                    var f = force_all(lang_eval(env, xs[1]));
                    if (!data_p(f)) {
                        DEBUG("[ERROR/eval] form/not data{{{" + complex_print(f) + "}}}");
                        return error_v;
                    }
                    var f_type = force1(data_name(f));
                    if (any_delay_just_p(f_type)) {
                        return lang_eval(env, x);
                    }
                    if (!symbol_p(f_type)) {
                        DEBUG("[ERROR/eval] form/not form/not symbol");
                        return error_v;
                    }
                    if (!symbol_eq_p(f_type, form_sym)) {
                        DEBUG("[ERROR/eval] form/not form");
                        return error_v;
                    }
                    var f_list = force1(data_list(f));
                    if (any_delay_just_p(f_list)) {
                        return lang_eval(env, x);
                    }
                    if (!cons_p(f_list)) {
                        DEBUG("[ERROR/eval] form/not form/0");
                        return error_v;
                    }
                    var f_x = cons_car(f_list);
                    var f_list_cdr = force1(cons_cdr(f_list));
                    if (any_delay_just_p(f_list_cdr)) {
                        return lang_eval(env, x);
                    }
                    if (!null_p(f_list_cdr)) {
                        DEBUG("[ERROR/eval] form/not form/multi args");
                        return error_v;
                    }
                    var args = [env2val(env)];
                    for (var i = 2; i < xs.length; i++) {
                        args[i - 1] = xs[i];
                    }
                    return lang_apply(f_x, args);
                } else if (jsbool_equal_p(xs[0], use_builtin_func_sym)) {
                    if (xs.length === 1) {
                        return error_v;
                    }
                    var f = xs[1];
                    var args = [];
                    for (var i = 2; i < xs.length; i++) {
                        args[i - 2] = lang_eval(env, xs[i]);
                    }
                    return builtin_func_apply(f, args);
                } else {
                    var f = lang_eval(env, xs[0]);
                    var args = [];
                    for (var i = 1; i < xs.length; i++) {
                        args[i - 1] = lang_eval(env, xs[i]);
                    }
                    return lang_apply(f, args);
                }
                break;
            case null_t:
                return x;
            case symbol_t: //name_p
            case data_t: //name_p
                return env_get(env, x, error_v);
            case error_t:
                return error_v;
            default:
        }
        ERROR();
    }

    function name_p(x) {
        var t = type_of(x);
        return t === symbol_t || t === data_t;
    }

    function make_builtin_p_func(p_sym, p_jsfunc) {
        return [p_sym, 1, function(x, error_v) {
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
        return [f_sym, 1, function(x, error_v) {
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
    var real_builtin_func_apply_s = [
        make_builtin_p_func(builtin_func_data_p_sym, data_p),
        [builtin_func_new_data_sym, 2, new_data],
        make_builtin_get_func(builtin_func_data_name_sym, data_p, data_name),
        make_builtin_get_func(builtin_func_data_list_sym, data_p, data_list),

        make_builtin_p_func(builtin_func_error_p_sym, error_p),
        [builtin_func_new_error_sym, 2, new_error],
        make_builtin_get_func(builtin_func_error_name_sym, error_p, error_name),
        make_builtin_get_func(builtin_func_error_list_sym, error_p, error_list),

        make_builtin_p_func(builtin_func_null_p_sym, null_p),
        [builtin_func_new_cons_sym, 2, new_cons],
        make_builtin_p_func(builtin_func_cons_p_sym, cons_p),
        make_builtin_get_func(builtin_func_cons_head_sym, cons_p, cons_car),
        make_builtin_get_func(builtin_func_cons_tail_sym, cons_p, cons_cdr),

        [builtin_func_equal_sym, 2, function(x, y, error_v) {
            if (x === y) {
                return true_v;
            }
            x = force1(x);
            y = force1(y);
            if (any_delay_just_p(x) || any_delay_just_p(y)) {
                return builtin_func_apply(builtin_func_equal_sym, [x, y]); // not fully implemented -- Halting
            }
            if (x === y) {
                return true_v;
            }
            if (type_of(x) !== type_of(y)) {
                return false_v;
            }

            function H_if(b, x, y) {
                // H = helper
                return builtin_func_apply(builtin_func_if_sym, [b, x, y]);
            }

            function H_and(x, y) {
                return H_if(x, y, false_v);
            }
            ASSERT(!any_delay_just_p(x));

            function end_2(f1, f2) {
                return H_and(builtin_func_apply(builtin_func_equal_sym, [f1(x), f1(y)]), builtin_func_apply(builtin_func_equal_sym, [f2(x), f2(y)]));
            }
            switch (type_of(x)) {
                case null_t:
                    return true_v;
                case symbol_t:
                    return symbol_eq_p(x, y) ? true_v : false_v;
                case data_t:
                    return end_2(data_name, data_list);
                case cons_t:
                    return end_2(cons_car, cons_cdr);
                case error_t:
                    return end_2(error_name, error_list);
                default:
            }
            ERROR();
        }],
        [builtin_func_apply_sym, 2, function(f, xs, error_v) {
            // WIP delay未正確處理(影響較小)
            var jslist = [];
            var iter = force_all(xs);
            while (cons_p(iter)) {
                jslist.push(cons_car(iter));
                iter = force_all(cons_cdr(iter));
            }
            if (!null_p(iter)) {
                return error_v;
            }
            return lang_apply(f, jslist);
        }],
        [builtin_func_eval_sym, 2, function(env, x, error_v) {
            // WIP delay未正確處理(影響較小)
            var maybeenv = val2env(env);
            if (maybeenv === false) {
                return error_v;
            }
            return lang_eval(maybeenv, x);
        }],

        make_builtin_p_func(builtin_func_sym_p_sym, symbol_p),

        [builtin_func_list_choose_sym, 1, function(xs, error_v) {
            // 一般返回第一个，可以因为优化返回其他的任意一个
            // xs可以無限長，不判斷是否真的是list
            xs = force1(xs);
            if (any_delay_just_p(xs)) {
                return builtin_func_apply(builtin_func_list_choose_sym, [xs]);
            }
            if (!cons_p(xs)) {
                return error_v;
            }
            return cons_car(xs);
        }],
        [builtin_func_if_sym, 3, function(b, x, y, error_v) {
            b = force1(b);
            if (any_delay_just_p(b)) {
                return builtin_func_apply(builtin_func_if_sym, [b, x, y]);
            }
            if (!data_p(b)) {
                return error_v;
            }
            // WIP delay未正確處理(影響較小)
            var nam = force_all(data_name(b));
            if (!symbol_p(nam)) {
                return error_v;
            }
            if (symbol_eq_p(nam, true_sym)) {
                return x;
            }
            if (symbol_eq_p(nam, false_sym)) {
                return y;
            }
            return error_v;
        }],
    ];

    function real_lang_apply(f, xs) {
        // LangVal, JSList LangVal -> LangVal
        // WIP delay未正確處理(影響較小)
        function make_error_v() {
            return new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_apply_sym, new_list(f, jslist2list(xs)))));
        }
        f = force1(f);
        if (any_delay_just_p(f)) {
            return lang_apply(f, xs);
        }
        if (!data_p(f)) {
            return make_error_v();
        }
        var f_type = force_all(data_name(f));
        if (!(symbol_p(f_type) && symbol_eq_p(f_type, func_sym))) {
            return make_error_v();
        }
        var f_list = force_all(data_list(f));
        if (!cons_p(f_list)) {
            return make_error_v();
        }
        var args_pat = force_all_rec(cons_car(f_list));
        var f_list_cdr = force_all(cons_cdr(f_list));
        if (!(cons_p(f_list_cdr) && null_p(force_all(cons_cdr(f_list_cdr))))) {
            return make_error_v();
        }
        var f_code = cons_car(f_list_cdr);
        var env = env_null_v;
        while (!null_p(args_pat)) {
            if (name_p(args_pat)) {
                env = env_set(env, args_pat, jslist2list(xs));
                xs = [];
                args_pat = null_v;
            } else if (cons_p(args_pat)) {
                if (xs.length === 0) {
                    return make_error_v();
                }
                env = env_set(env, cons_car(args_pat), xs.shift()); // xs.shift() 表達式副作用!
                args_pat = cons_cdr(args_pat);
            } else {
                return make_error_v();
            }
        }
        if (xs.length !== 0) {
            return make_error_v();
        }
        return lang_eval(env, f_code);
    }

    function real_builtin_func_apply(f, xs) {
        // Name, JSList LangVal -> LangVal
        var error_v = new_error(sys_sym, new_list(use_builtin_func_sym, new_list(f, jslist2list(xs))));
        for (var i = 0; i < real_builtin_func_apply_s.length; i++) {
            // WIP delay未正確處理(影響較小)
            if (jsbool_equal_p(f, real_builtin_func_apply_s[i][0])) {
                if (xs.length != real_builtin_func_apply_s[i][1]) {
                    return error_v;
                }
                xs.push(error_v);
                return real_builtin_func_apply_s[i][2].apply(null, xs);
            }
        }
        return error_v;
    }

    function real_builtin_form_apply(env, f, xs) {
        // Env, Name, JSList NotEvaledLangVal -> LangVal
        var error_v = new_error(sys_sym, new_list(use_builtin_form_sym, new_list(env2val(env), f, jslist2list(xs))));
        // WIP delay未正確處理(影響較小)
        if (jsbool_equal_p(f, builtin_form_quote_sym)) {
            if (xs.length !== 1) {
                return error_v;
            }
            return xs[0];
        } else if (jsbool_equal_p(f, builtin_form_lambda_sym)) {
            if (xs.length !== 2) {
                return error_v;
            }
            return new_lambda(env, xs[0], xs[1], error_v);
        }
        return error_v;
    }

    function new_lambda(env, args_pat, body, error_v) {
        // 允許返回不同的物--允許實現進行對所有實現有效的優化[比如:消除無用環境中的變量] TODO 未實現
        function make_error_v() {
            if (jsnull_p(error_v)) {
                return new_error(sys_sym, new_list(use_builtin_form_sym, new_list(env2val(env), builtin_form_lambda_sym, jslist2list([args_pat, body]))));
            } else {
                return error_v;
            }
        }

        function make_quote(x) {
            return new_list(use_builtin_form_sym, builtin_form_quote_sym, x);
        }

        args_pat = force_all_rec(args_pat); // WIP delay未正確處理(影響較小)

        var args_pat_vars = []; // : JSList LangVal/Name 順序有要求
        var args_pat_is_dot = false; // : Bool
        var args_pat_iter = args_pat;
        while (!null_p(args_pat_iter)) {
            if (name_p(args_pat_iter)) {
                args_pat_vars.push(args_pat_iter);
                args_pat_is_dot = true;
                args_pat_iter = null_v;
            } else if (cons_p(args_pat_iter)) {
                args_pat_vars.push(cons_car(args_pat_iter));
                args_pat_iter = cons_cdr(args_pat_iter);
            } else {
                return make_error_v();
            }
        }
        var args_pat_vars_val = args_pat; // 是 jslist2list(args_pat_vars) : LangVal
        if (args_pat_is_dot) {
            args_pat_vars_val = jslist2list(args_pat_vars);
        }

        var env_vars = []; // : JSList LangVal/Name
        env_foreach(env, function(k, v) {
            for (var i = 0; i < args_pat_vars; i++) {
                if (jsbool_equal_p(args_pat_vars[i], k)) { // WIP delay未正確處理(影響較小)
                    exist = true;
                    return;
                }
            }
            env_vars.push(k);
        });

        var new_args_pat = args_pat_vars_val; // : LangVal
        for (var i = env_vars.length - 1; i >= 0; i--) {
            new_args_pat = new_cons(env_vars[i], new_args_pat);
        }

        var new_args = args_pat_vars_val; // : LangVal
        for (var i = env_vars.length - 1; i >= 0; i--) {
            new_args = new_cons(make_quote(must_env_get(env, env_vars[i])), new_args);
        }

        return new_data(func_sym, new_list(args_pat, new_cons(make_quote(new_data(func_sym, new_list(new_args_pat, body))), new_args)));
    }

    function jsbool_equal_p(x, y) {
        // LangVal, LangVal -> JSBoolean
        if (x === y) {
            return true;
        }
        x = force_all(x);
        y = force_all(y);
        if (x === y) {
            return true;
        }
        var x_type = type_of(x);
        var y_type = type_of(y);
        if (x_type !== y_type) {
            return false;
        }

        function end_2(f1, f2) {
            if (jsbool_equal_p(f1(x), f1(y)) && jsbool_equal_p(f2(x), f2(y))) {
                lang_set_do(x, y);
                return true;
            } else {
                return false;
            }
        }
        switch (x_type) {
            case null_t:
                lang_set_do(x, null_v);
                lang_set_do(y, null_v);
                return true;
            case symbol_t:
                return symbol_eq_p(x, y);
            case cons_t:
                return end_2(cons_car, cons_cdr);
            case error_t:
                return end_2(error_name, error_list);
            case data_t:
                return end_2(data_name, data_list);
            default:
        }
        ERROR();
    }
    exports.equal_p = jsbool_equal_p;

    function langbool_equal_p(x, y) {
        return builtin_func_apply(builtin_func_equal_sym, [x, y]);
    }

    function jsbool_no_force_equal_p(x, y) {
        // LangVal, LangVal -> JSBoolean
        if (x === y) {
            return true;
        }
        x = un_just_all(x);
        y = un_just_all(y);
        if (x === y) {
            return true;
        }
        var x_type = type_of(x);
        var y_type = type_of(y);
        if (x_type !== y_type) {
            return false;
        }

        function end_2(f1, f2) {
            if (jsbool_no_force_equal_p(f1(x), f1(y)) && jsbool_no_force_equal_p(f2(x), f2(y))) {
                lang_set_do(x, y);
                return true;
            } else {
                return false;
            }
        }
        switch (x_type) {
            case null_t:
                lang_set_do(x, null_v);
                lang_set_do(y, null_v);
                return true;
            case symbol_t:
                return symbol_eq_p(x, y);
            case cons_t:
                return end_2(cons_car, cons_cdr);
            case error_t:
                return end_2(error_name, error_list);
            case data_t:
                return end_2(data_name, data_list);

            case delay_eval_t:
                return false; //WIP
            case delay_builtin_func_t:
                return false; //WIP
            case delay_builtin_form_t:
                return false; //WIP
            case delay_apply_t:
                return false; //WIP
            default:
        }
        ERROR();
    }

    // {{{ 相對獨立的部分。parser/printer
    function make_printer(forcer) {
        function print(x) {
            // LangVal -> JSString
            // [[[ 大量重複代碼 print <-> complex_print
            x = forcer(x);
            var temp = "";
            var prefix = "";
            switch (type_of(x)) {
                case null_t:
                    return "()";
                case cons_t:
                    temp = "(";
                    prefix = "";
                    while (cons_p(x)) {
                        temp += prefix + print(cons_car(x));
                        prefix = " ";
                        x = forcer(cons_cdr(x));
                    }
                    if (null_p(x)) {
                        temp += ")";
                    } else {
                        temp += " . " + print(x) + ")";
                    }
                    return temp;
                case data_t:
                    return "#" + print(new_cons(data_name(x), data_list(x)));
                case error_t:
                    return "!" + print(new_cons(error_name(x), error_list(x)));
                case symbol_t:
                    return un_symbol(x);
                case delay_eval_t:
                    return "$(" + print(env2val(delay_eval_env(x))) + " " + print(delay_eval_x(x)) + ")";
                case delay_builtin_func_t:
                    return "%(" + print(delay_builtin_func_f(x)) + " " + print(jslist2list(delay_builtin_func_xs(x))) + ")";
                case delay_builtin_form_t:
                    return "@(" + print(env2val(delay_builtin_form_env(x))) + " " + print(delay_builtin_form_f(x)) + " " + print(jslist2list(delay_builtin_form_xs(x))) + ")";
                case delay_apply_t:
                    return "^(" + print(delay_apply_f(x)) + " " + print(jslist2list(delay_apply_xs(x))) + ")";
                default:
            }
            ERROR();
            // 大量重複代碼 print <-> complex_print ]]]
        }
        return print;
    }
    var print = make_printer(un_just_all);
    var print_force_rec = make_printer(force_all);
    exports.print_force_rec = print_force_rec;
    exports.print = print;

    function read(x) {
        // JSString -> LangVal
        // [[[ 大量重複代碼 read <-> complex_parse
        var state = x.split(""); // State : List Char
        function eof() {
            return state.length === 0;
        }

        function get() {
            return state.shift();
        }

        function put(x) {
            state.unshift(x);
        }

        function error() {
            throw "TheLanguage parse ERROR!";
        }

        function a_space_p(x) {
            return x === " " || x === "\n" || x === "\t" || x === "\r";
        }

        function space() {
            var p = a_space_p;
            if (eof()) {
                return false;
            }
            var x = get();
            if (!p(x)) {
                put(x);
                return false;
            }
            while (p(x) && !eof()) {
                x = get();
            }
            if (!p(x)) {
                put(x);
            }
            return true;
        }

        function symbol() {
            var p = a_symbol_p;
            if (eof()) {
                return false;
            }
            var x = get();
            var ret = "";
            if (!p(x)) {
                put(x);
                return false;
            }
            while (p(x) && !eof()) {
                ret += x;
                x = get();
            }
            if (p(x)) {
                ret += x;
            } else {
                put(x);
            }
            return new_symbol(ret);
        }

        function list() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "(") {
                put(x);
                return false;
            }
            var ret = null;

            function set_last(lst) {
                if (ret === null) {
                    ret = lst;
                    return;
                }
                var x = ret;
                while (true) {
                    if (!cons_p(x)) {
                        ERROR();
                    }
                    var d = cons_cdr(x);
                    if (d === null) {
                        break;
                    }
                    x = cons_cdr(x);
                }
                if (!cons_p(x)) {
                    ERROR();
                }
                if (x[2] !== null) {
                    ERROR();
                }
                x[2] = lst; // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
            }

            function last_add(x) {
                set_last(new_cons(x, null));
            }
            while (true) {
                space();
                if (eof()) {
                    error();
                }
                x = get();
                if (x === ")") {
                    set_last(null_v);
                    return ret;
                }
                if (x === ".") {
                    space();
                    var e = val();
                    if (e === false) {
                        error();
                    }
                    set_last(e);
                    space();
                    if (eof()) {
                        error();
                    }
                    x = get();
                    if (x !== ")") {
                        error();
                    }
                    return ret;
                }
                put(x);
                var e = val();
                if (e === false) {
                    error();
                }
                last_add(e);
            }
        }

        function data() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "#") {
                put(x);
                return false;
            }
            var xs = list();
            if (xs === false) {
                error();
            }
            if (!cons_p(xs)) {
                error();
            }
            return new_data(cons_car(xs), cons_cdr(xs));
        }

        function readerror() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "!") {
                put(x);
                return false;
            }
            var xs = list();
            if (xs === false) {
                error();
            }
            if (!cons_p(xs)) {
                error();
            }
            return new_error(cons_car(xs), cons_cdr(xs));
        }

        function make_read_two(prefix, k) {
            return function() {
                if (eof()) {
                    return false;
                }
                var x = get();
                if (x !== prefix) {
                    put(x);
                    return false;
                }
                var xs = list();
                if (xs === false) {
                    error();
                }
                if (!cons_p(xs)) {
                    error();
                }
                x = cons_cdr(xs);
                if (!(cons_p(x) && null_p(cons_cdr(x)))) {
                    error();
                }
                return k(cons_car(xs), cons_car(x));
            };
        }

        function make_read_three(prefix, k) {
            return function() {
                if (eof()) {
                    return false;
                }
                var x = get();
                if (x !== prefix) {
                    put(x);
                    return false;
                }
                var xs = list();
                if (xs === false) {
                    error();
                }
                if (!cons_p(xs)) {
                    error();
                }
                x = cons_cdr(xs);
                if (!cons_p(x)) {
                    error();
                }
                x_d = cons_cdr(x);
                if (!(cons_p(x_d) && null_p(cons_cdr(x_d)))) {
                    error();
                }
                return k(cons_car(xs), cons_car(x), cons_car(x_d));
            };
        }
        var readeval = make_read_two("$", function(e, x) {
            var env = val2env(e);
            if (env === false) {
                error();
            }
            return lang_eval(env, x);
        });
        var readfuncapply = make_read_two("%", function(f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            return builtin_func_apply(f, jsxs);
        });
        var readformbuiltin = make_read_three("@", function(e, f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            var env = val2env(e);
            if (env === false) {
                error();
            }
            return builtin_form_apply(env, f, jsxs);
        });
        var readapply = make_read_two("^", function(f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            return lang_apply(f, jsxs);
        });

        function a_symbol_p(x) {
            if (a_space_p(x)) {
                return false;
            }
            var not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@"];
            for (var i = 0; i < not_xs.length; i++) {
                if (x == not_xs[i]) {
                    return false;
                }
            }
            return true;
        }

        function val() {
            space();
            var fs = [list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
            for (var i = 0; i < fs.length; i++) {
                var x = fs[i]();
                if (x !== false) {
                    return x;
                }
            }
            error();
        }
        return val();
        // 大量重複代碼 read <-> complex_parse ]]]
    }
    exports.read = read;
    // 相對獨立的部分。parser/printer }}}

    // {{{ 相對獨立的部分。complex parser/complex printer
    function complex_parse(x) {
        // JSString -> LangVal
        // [[[ 大量重複代碼 read <-> complex_parse
        var state = x.split(""); // State : List Char
        function eof() {
            return state.length === 0;
        }

        function get() {
            return state.shift();
        }

        function put(x) {
            state.unshift(x);
        }

        function error() {
            throw "TheLanguage parse ERROR!";
        }

        function a_space_p(x) {
            return x === " " || x === "\n" || x === "\t" || x === "\r";
        }

        function space() {
            var p = a_space_p;
            if (eof()) {
                return false;
            }
            var x = get();
            if (!p(x)) {
                put(x);
                return false;
            }
            while (p(x) && !eof()) {
                x = get();
            }
            if (!p(x)) {
                put(x);
            }
            return true;
        }

        function symbol() {
            var p = a_symbol_p;
            if (eof()) {
                return false;
            }
            var x = get();
            var ret = "";
            if (!p(x)) {
                put(x);
                return false;
            }
            while (p(x) && !eof()) {
                ret += x;
                x = get();
            }
            if (p(x)) {
                ret += x;
            } else {
                put(x);
            }
            return new_symbol(ret);
        }

        function list() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "(") {
                put(x);
                return false;
            }
            var ret = null;

            function set_last(lst) {
                if (ret === null) {
                    ret = lst;
                    return;
                }
                var x = ret;
                while (true) {
                    if (!cons_p(x)) {
                        ERROR();
                    }
                    var d = cons_cdr(x);
                    if (d === null) {
                        break;
                    }
                    x = cons_cdr(x);
                }
                if (!cons_p(x)) {
                    ERROR();
                }
                if (x[2] !== null) {
                    ERROR();
                }
                x[2] = lst; // 實現底層依賴[編號 0] read, complex_parse <-> 內建數據結構
            }

            function last_add(x) {
                set_last(new_cons(x, null));
            }
            while (true) {
                space();
                if (eof()) {
                    error();
                }
                x = get();
                if (x === ")") {
                    set_last(null_v);
                    return ret;
                }
                if (x === ".") {
                    space();
                    var e = val();
                    if (e === false) {
                        error();
                    }
                    set_last(e);
                    space();
                    if (eof()) {
                        error();
                    }
                    x = get();
                    if (x !== ")") {
                        error();
                    }
                    return ret;
                }
                put(x);
                var e = val();
                if (e === false) {
                    error();
                }
                last_add(e);
            }
        }

        function data() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "#") {
                put(x);
                return false;
            }
            var xs = list();
            if (xs === false) {
                error();
            }
            if (!cons_p(xs)) {
                error();
            }
            return new_data(cons_car(xs), cons_cdr(xs));
        }

        function readerror() {
            if (eof()) {
                return false;
            }
            var x = get();
            if (x !== "!") {
                put(x);
                return false;
            }
            var xs = list();
            if (xs === false) {
                error();
            }
            if (!cons_p(xs)) {
                error();
            }
            return new_error(cons_car(xs), cons_cdr(xs));
        }

        function make_read_two(prefix, k) {
            return function() {
                if (eof()) {
                    return false;
                }
                var x = get();
                if (x !== prefix) {
                    put(x);
                    return false;
                }
                var xs = list();
                if (xs === false) {
                    error();
                }
                if (!cons_p(xs)) {
                    error();
                }
                x = cons_cdr(xs);
                if (!(cons_p(x) && null_p(cons_cdr(x)))) {
                    error();
                }
                return k(cons_car(xs), cons_car(x));
            };
        }

        function make_read_three(prefix, k) {
            return function() {
                if (eof()) {
                    return false;
                }
                var x = get();
                if (x !== prefix) {
                    put(x);
                    return false;
                }
                var xs = list();
                if (xs === false) {
                    error();
                }
                if (!cons_p(xs)) {
                    error();
                }
                x = cons_cdr(xs);
                if (!cons_p(x)) {
                    error();
                }
                x_d = cons_cdr(x);
                if (!(cons_p(x_d) && null_p(cons_cdr(x_d)))) {
                    error();
                }
                return k(cons_car(xs), cons_car(x), cons_car(x_d));
            };
        }
        var readeval = make_read_two("$", function(e, x) {
            var env = val2env(e);
            if (env === false) {
                error();
            }
            return lang_eval(env, x);
        });
        var readfuncapply = make_read_two("%", function(f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            return builtin_func_apply(f, jsxs);
        });
        var readformbuiltin = make_read_three("@", function(e, f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            var env = val2env(e);
            if (env === false) {
                error();
            }
            return builtin_form_apply(env, f, jsxs);
        });
        var readapply = make_read_two("^", function(f, xs) {
            var jsxs = list2jslist(xs, function(x) {
                return x;
            }, function(x, y) {
                error();
            });
            return lang_apply(f, jsxs);
        });

        function a_symbol_p(x) {
            if (a_space_p(x)) {
                return false;
            }
            var not_xs = ["(", ")", "!", "#", ".", "$", "%", "^", "@", '~', '/', '-', '>', '_', ':', '?', '[', ']', '&'];
            for (var i = 0; i < not_xs.length; i++) {
                if (x == not_xs[i]) {
                    return false;
                }
            }
            return true;
        }

        function un_maybe(x) {
            if (x === false) {
                error();
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

        function val() {
            space();
            var fs = [list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
            for (var i = 0; i < fs.length; i++) {
                var x = fs[i]();
                if (x !== false) {
                    return x;
                }
            }
            error();
        }
        return val();

        // 大量重複代碼 read <-> complex_parse ]]]

        function readsysname_no_pack() {
            if (eof()) {
                return false;
            }
            var head = get();
            switch (head) {
                case '&':
                    un_maybe(not_eof());
                    var c0 = get();
                    if (c0 === ':') {
                        assert_get('>');
                        var x = readsysname_no_pack_inner_must();
                        return new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, x)), the_sym);
                    } else if (c0 === '+') {
                        var x = readsysname_no_pack_inner_must();
                        return new_list(form_sym, new_list(sys_sym, x));
                    } else {
                        put(c0);
                    }
                    var x = readsysname_no_pack_inner_must();
                    return new_list(form_sym, x);
                case ':':
                    un_maybe(not_eof());
                    var c0 = get();
                    if (c0 === '>') {
                        var x = readsysname_no_pack_inner_must();
                        return new_list(a_sym, new_list(func_sym, sth_sym, x), the_sym);
                    } else {
                        put(c0);
                    }
                    var x = readsysname_no_pack_inner_must();
                    return new_list(a_sym, x, sth_sym);
                case '+':
                    var x = readsysname_no_pack_inner_must();
                    return new_list(sys_sym, x);
                case '[':
                    var x = readsysname_no_pack_inner_must();
                    assert_get(']');
                    return may_xfx_xf(x);
                default:
                    put(head);
                    var x = symbol();
                    if (x === false) {
                        return false;
                    }
                    return may_xfx_xf(x);
            }
            ERROR();

            function readsysname_no_pack_inner_must(strict) {
                function readsysname_no_pack_bracket() {
                    assert_get('[');
                    var x = readsysname_no_pack_inner_must();
                    assert_get(']');
                    return x;
                }
                var fs;
                if (strict) {
                    fs = [list, symbol, readsysname_no_pack_bracket, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
                } else {
                    fs = [list, readsysname_no_pack, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
                }
                for (var i = 0; i < fs.length; i++) {
                    var x = fs[i]();
                    if (x !== false) {
                        return x;
                    }
                }
                error();
            }

            function may_xfx_xf(x) {
                if (eof()) {
                    return x;
                }
                var head = get();
                switch (head) {
                    case '.':
                        var y = readsysname_no_pack_inner_must();
                        return new_list(a_sym, new_list(func_sym, new_list(x), sth_sym), y);
                    case ':':
                        var y = readsysname_no_pack_inner_must();
                        return new_list(a_sym, y, x);
                    case '~':
                        return new_list(isornot_sym, x);
                    case '@':
                        var y = readsysname_no_pack_inner_must();
                        return new_list(a_sym, new_list(func_sym, new_cons(x, sth_sym), sth_sym), y);
                    case '?':
                        return new_list(a_sym, func_sym, new_list(isornot_sym, x));
                    case '/':
                        var ys = [];
                        while (true) {
                            var y = readsysname_no_pack_inner_must(true);
                            ys.push(y);
                            if (eof()) {
                                break;
                            }
                            var c0 = get();
                            if (c0 !== '/') {
                                put(x0);
                                break;
                            }
                        }
                        return new_list(sub_sym, x, jslist2list(ys));
                    default:
                        put(head);
                        return x;
                }
                ERROR();
            }
            ERROR();
        }

        function readsysname() {
            var x = readsysname_no_pack();
            if (x === false) {
                return false;
            }
            if (symbol_p(x)) {
                return x;
            }
            return make_sys_sym_f(x);
        }
    }

    function complex_print(val) {
        // LangVal -> JSString
        function print_sys_name(x, where) {
            // 是 complex_print(make_sys_sym_f(x))
            // x : LangVal
            // inner : JSBoolean
            if (symbol_p(x)) {
                return un_symbol(x);
            }

            function inner_bracket(x) {
                if (where === 'inner') {
                    return '[' + x + ']';
                } else if (where === 'top') {
                    return x;
                }
                ERROR();
            }
            var maybe_xs = maybe_list2js(x);
            if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], a_sym)) {
                // new_list(a_sym, maybe_xs[1], maybe_xs[2])
                var maybe_lst_2 = maybe_list2js(maybe_xs[1]);
                if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_equal_p(maybe_lst_2[0], func_sym)) {
                    // new_list(a_sym, new_list(func_sym, maybe_lst_2[1], maybe_lst_2[2]), maybe_xs[2])
                    var maybe_lst_3 = maybe_list2js(maybe_lst_2[1]);
                    if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_equal_p(maybe_lst_2[2], sth_sym)) {
                        // new_list(a_sym, new_list(func_sym, new_list(maybe_lst_3[0]), sth_sym), maybe_xs[2])
                        return inner_bracket(print_sys_name(maybe_lst_3[0], 'inner') + '.' + print_sys_name(maybe_xs[2], 'inner'));
                    } else if (cons_p(maybe_lst_2[1]) && jsbool_no_force_equal_p(cons_cdr(maybe_lst_2[1]), sth_sym) && jsbool_no_force_equal_p(maybe_lst_2[2], sth_sym)) {
                        // new_list(a_sym, new_list(func_sym, new_cons(cons_car(maybe_lst_2[1]), sth_sym), sth_sym), maybe_xs[2]);
                        return inner_bracket(print_sys_name(cons_car(maybe_lst_2[1]), 'inner') + '@' + print_sys_name(maybe_xs[2], 'inner'));
                    } else if (jsbool_no_force_equal_p(maybe_lst_2[1], sth_sym) && jsbool_no_force_equal_p(maybe_xs[2], the_sym)) {
                        // new_list(a_sym, new_list(func_sym, sth_sym, maybe_lst_2[2]), the_sym)
                        return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], 'inner'));
                    }
                }
                var maybe_lst_44 = maybe_list2js(maybe_xs[2]);
                if (jsbool_no_force_equal_p(maybe_xs[1], func_sym) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_equal_p(maybe_lst_44[0], isornot_sym)) {
                    // new_list(a_sym, func_sym, new_list(isornot_sym, maybe_lst_44[1]))
                    var maybe_lst_45 = maybe_list2js(maybe_lst_44[1]);
                    return inner_bracket(print_sys_name(maybe_lst_44[1], 'inner') + '?');
                }
                if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_equal_p(maybe_xs[2], the_sym) && jsbool_no_force_equal_p(maybe_lst_2[0], form_sym)) {
                    // new_list(a_sym, new_list(form_sym, maybe_lst_2[1]), the_sym)
                    var maybe_lst_88 = maybe_list2js(maybe_lst_2[1]);
                    if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_equal_p(maybe_lst_88[0], func_sym) && jsbool_no_force_equal_p(maybe_lst_88[1], sth_sym)) {
                        // new_list(a_sym, new_list(form_sym, new_list(func_sym, sth_sym, maybe_lst_88[2])), the_sym)
                        return inner_bracket('&:>' + print_sys_name(maybe_lst_88[2], 'inner'));
                    }
                }
                return inner_bracket((jsbool_no_force_equal_p(maybe_xs[2], sth_sym) ? '' : print_sys_name(maybe_xs[2], 'inner')) + ':' + print_sys_name(maybe_xs[1], 'inner'));
            } else if (maybe_xs !== false && maybe_xs.length === 2) {
                if (jsbool_no_force_equal_p(maybe_xs[0], form_sym)) {
                    // new_list(form_sym, maybe_xs[1])
                    var maybe_lst_288 = maybe_list2js(maybe_xs[1]);
                    if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_equal_p(maybe_lst_288[0], sys_sym)) {
                        // new_list(form_sym, new_list(sys_sym, maybe_lst_288[1]))
                        return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], 'inner'));
                    }
                    return inner_bracket('&' + print_sys_name(maybe_xs[1], 'inner'));
                } else if (jsbool_no_force_equal_p(maybe_xs[0], isornot_sym)) {
                    // new_list(isornot_sym, maybe_xs[1])
                    return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + '~');
                } else if (jsbool_no_force_equal_p(maybe_xs[0], sys_sym)) {
                    // new_list(sys_sym, maybe_xs[1])
                    return inner_bracket('+' + print_sys_name(maybe_xs[1], 'inner'));
                }
            } else if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_equal_p(maybe_xs[0], sub_sym)) {
                // new_list(sub_sym, maybe_xs[1], maybe_xs[2])
                var maybe_lst_8934 = maybe_list2js(maybe_xs[2]);
                if (maybe_lst_8934 !== false && maybe_lst_8934.length !== 0) {
                    var tmp = "";
                    for (var i = 0; i < maybe_lst_8934.length; i++) {
                        tmp += '/' + print_sys_name(maybe_lst_8934[i], 'inner');
                    }
                    return inner_bracket(print_sys_name(maybe_xs[1], 'inner') + tmp);
                }
            }
            if (where === 'inner') {
                return print(x);
            } else if (where === 'top') {
                return print(make_sys_sym_f(x));
            }
            ERROR();
        }
        // [[[ 大量重複代碼 print <-> complex_print
        var x = read(print(val)); // 去除所有just
        var temp = "";
        var prefix = "";
        switch (type_of(x)) {
            case null_t:
                return "()";
            case cons_t:
                temp = "(";
                prefix = "";
                while (cons_p(x)) {
                    temp += prefix + complex_print(cons_car(x));
                    prefix = " ";
                    x = cons_cdr(x);
                }
                if (null_p(x)) {
                    temp += ")";
                } else {
                    temp += " . " + complex_print(x) + ")";
                }
                return temp;
            case data_t:
                var name = data_name(x);
                var list = data_list(x);
                var maybe_xs = maybe_list2js(list);
                if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_equal_p(name, name_sym) && jsbool_no_force_equal_p(maybe_xs[0], sys_sym)) {
                    // make_sys_sym_f(maybe_xs[1])
                    return print_sys_name(maybe_xs[1], 'top');
                }
                return "#" + complex_print(new_cons(name, list));
            case error_t:
                return "!" + complex_print(new_cons(error_name(x), error_list(x)));
            case symbol_t:
                return un_symbol(x);
            case delay_eval_t:
                return "$(" + complex_print(env2val(delay_eval_env(x))) + " " + complex_print(delay_eval_x(x)) + ")";
            case delay_builtin_func_t:
                return "%(" + complex_print(delay_builtin_func_f(x)) + " " + complex_print(jslist2list(delay_builtin_func_xs(x))) + ")";
            case delay_builtin_form_t:
                return "@(" + complex_print(env2val(delay_builtin_form_env(x))) + " " + complex_print(delay_builtin_form_f(x)) + " " + complex_print(jslist2list(delay_builtin_form_xs(x))) + ")";
            case delay_apply_t:
                return "^(" + complex_print(delay_apply_f(x)) + " " + complex_print(jslist2list(delay_apply_xs(x))) + ")";
            default:
        }
        ERROR();
        // 大量重複代碼 print <-> complex_print ]]]
    }
    exports.complex_parse = complex_parse;
    exports.complex_print = complex_print;

    // 相對獨立的部分。complex parser/complex printer }}}

    // {{{ 相對獨立的部分。IO

    exports.symbols.io = {}
    var io_return_sym = complex_parse('效應/[:物]');
    exports.symbols.io.return = io_return_sym;
    var io_bind_sym = complex_parse('效應/連');
    exports.symbols.io.bind = io_bind_sym;
    //WIP

    // 相對獨立的部分。IO }}}

    return exports;
})();