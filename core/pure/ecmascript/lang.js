exports.__esModule = true;
function LANG_ERROR() {
    throw "TheLanguage PANIC";
}
function LANG_ASSERT(x) {
    if (!x) {
        return LANG_ERROR();
    }
}
function recordstring_null_p(x) {
    for (var k in x) {
        return false;
    }
    return true;
}
function recordstring_shadow_copy(x) {
    var result = {};
    for (var k in x) {
        result[k] = x[k];
    }
    return result;
}
var atom_t = 0;
var construction_t = 1;
var null_t = 2;
var data_t = 3;
var just_t = 4;
var delay_evaluate_t = 5;
var delay_builtin_func_t = 6;
var delay_builtin_form_t = 7;
var delay_apply_t = 8;
var comment_t = 10;
var hole_t = 9;
function new_comment(comment, x) {
    return [comment_t, comment, x];
}
exports.new_comment = new_comment;
function comment_p(x) {
    return x[0] === comment_t;
}
exports.comment_p = comment_p;
function comment_comment(x) {
    return x[1];
}
exports.comment_comment = comment_comment;
function comment_x(x) {
    return x[2];
}
exports.comment_x = comment_x;
function un_comment_all(x) {
    while (comment_p(x)) {
        x = comment_x(x);
    }
    return x;
}
exports.un_comment_all = un_comment_all;
function atom_p(x) {
    return x[0] === atom_t;
}
exports.atom_p = atom_p;
function new_atom(x) {
    return [atom_t, x];
}
exports.new_atom = new_atom;
function un_atom(x) {
    return x[1];
}
exports.un_atom = un_atom;
function atom_equal_p(x, y) {
    if (x === y) {
        return true;
    }
    if (un_atom(x) === un_atom(y)) {
        lang_assert_equal_set_do(x, y);
        return true;
    }
    else {
        return false;
    }
}
exports.atom_equal_p = atom_equal_p;
function new_construction(x, y) {
    return [construction_t, x, y];
}
exports.new_construction = new_construction;
function construction_p(x) {
    return x[0] === construction_t;
}
exports.construction_p = construction_p;
function construction_head(x) {
    return x[1];
}
exports.construction_head = construction_head;
function construction_tail(x) {
    return x[2];
}
exports.construction_tail = construction_tail;
var null_v = [null_t];
exports.null_v = null_v;
function null_p(x) {
    return x[0] === null_t;
}
exports.null_p = null_p;
function new_data(x, y) {
    return [data_t, x, y];
}
exports.new_data = new_data;
function data_p(x) {
    return x[0] === data_t;
}
exports.data_p = data_p;
function data_name(x) {
    return x[1];
}
exports.data_name = data_name;
function data_list(x) {
    return x[2];
}
exports.data_list = data_list;
function just_p(x) {
    return x[0] === just_t;
}
exports.just_p = just_p;
function un_just(x) {
    return x[1];
}
function evaluate(x, y) {
    return [delay_evaluate_t, x, y];
}
exports.evaluate = evaluate;
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
exports.apply = apply;
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
    var x = force_all(raw);
    function conslike(xx) {
        xx[1] = force_all_rec(xx[1]);
        xx[2] = force_all_rec(xx[2]);
        return xx;
    }
    if (data_p(x)) {
        return conslike(x);
    }
    else if (construction_p(x)) {
        return conslike(x);
    }
    else if (comment_p(x)) {
        return conslike(x);
    }
    return x;
}
exports.force_all_rec = force_all_rec;
function force_uncomment_all_rec(raw) {
    var x = force_uncomment_all(raw);
    function conslike(xx) {
        xx[1] = force_all_rec(xx[1]);
        xx[2] = force_all_rec(xx[2]);
        if (comment_p(xx[1]) || comment_p(xx[2])) {
            var ret = lang_copy_do(xx);
            var a = xx[1];
            var d = xx[2];
            var a1 = force_uncomment_all_rec(a);
            var d1 = force_uncomment_all_rec(d);
            ret[1] = a1;
            ret[2] = d1;
            return ret;
        }
        else {
            return xx;
        }
    }
    if (data_p(x)) {
        return conslike(x);
    }
    else if (construction_p(x)) {
        return conslike(x);
    }
    return x;
}
exports.force_uncomment_all_rec = force_uncomment_all_rec;
var unlazy_all_rec = force_uncomment_all_rec;
exports.unlazy_all_rec = unlazy_all_rec;
function new_hole_do() {
    return [hole_t];
}
function hole_p(x) {
    return x[0] === hole_t;
}
function lang_assert_equal_set_do(x, y) {
    if (x === y) {
        return;
    }
    if (x === null_v) {
        x = y;
        y = null_v;
    }
    x[0] = just_t;
    x[1] = y;
    x[2] = false;
    x[3] = false;
}
function hole_set_do(rawx, rawy) {
    LANG_ASSERT(hole_p(rawx));
    LANG_ASSERT(!hole_p(rawy));
    var x = rawx;
    var y = rawy;
    x[0] = y[0];
    x[1] = y[1];
    x[2] = y[2];
    x[3] = y[3];
}
function lang_copy_do(x) {
    var ret = new_hole_do();
    hole_set_do(ret, x);
    return ret;
}
var system_atom = new_atom("太始初核");
var name_atom = new_atom("符名");
var function_atom = new_atom("化滅");
var form_atom = new_atom("式形");
var equal_atom = new_atom("等同");
var evaluate_sym = new_atom("解算");
var theThing_atom = new_atom("特定其物");
var something_atom = new_atom("省略一物");
var mapping_atom = new_atom("映表");
var if_atom = new_atom("如若");
var typeAnnotation_atom = new_atom("一類何物");
var isOrNot_atom = new_atom("是非");
var sub_atom = new_atom("其子");
var true_atom = new_atom("爻陽");
var false_atom = new_atom("爻陰");
var quote_atom = new_atom("引用");
var apply_atom = new_atom("應用");
var null_atom = new_atom("間空");
var construction_atom = new_atom("連頸");
var data_atom = new_atom("構物");
var error_atom = new_atom("謬誤");
var atom_atom = new_atom("詞素");
var list_atom = new_atom("列序");
var head_atom = new_atom("首始");
var tail_atom = new_atom("尾末");
var thing_atom = new_atom("之物");
var theWorldStopped_atom = new_atom("宇宙亡矣");
var effect_atom = new_atom("效應");
var comment_atom = new_atom("註疏");
var the_world_stopped_v = new_error(system_atom, new_list(theWorldStopped_atom, something_atom));
function systemName_make(x) {
    return new_data(name_atom, new_construction(system_atom, new_construction(x, null_v)));
}
function make_builtin_f_new_sym_f(x_sym) {
    return systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, something_atom, x_sym), theThing_atom));
}
function make_builtin_f_get_sym_f(t_sym, x_sym) {
    return systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, new_list(t_sym), something_atom), x_sym));
}
function make_builtin_f_p_sym_f(t_sym) {
    return systemName_make(new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, new_list(typeAnnotation_atom, t_sym, something_atom))));
}
var new_data_function_builtin_systemName = make_builtin_f_new_sym_f(data_atom);
var data_name_function_builtin_systemName = make_builtin_f_get_sym_f(data_atom, name_atom);
var data_list_function_builtin_systemName = make_builtin_f_get_sym_f(data_atom, list_atom);
var data_p_function_builtin_systemName = make_builtin_f_p_sym_f(data_atom);
var new_construction_function_builtin_systemName = make_builtin_f_new_sym_f(construction_atom);
var construction_p_function_builtin_systemName = make_builtin_f_p_sym_f(construction_atom);
var construction_head_function_builtin_systemName = make_builtin_f_get_sym_f(construction_atom, head_atom);
var construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f(construction_atom, tail_atom);
var atom_p_function_builtin_systemName = make_builtin_f_p_sym_f(atom_atom);
var null_p_function_builtin_systemName = make_builtin_f_p_sym_f(null_atom);
var equal_p_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, equal_atom)));
var apply_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, new_list(function_atom, new_construction(function_atom, something_atom), something_atom), apply_atom));
var evaluate_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, evaluate_sym));
var list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f(list_atom, new_list(typeAnnotation_atom, thing_atom, something_atom));
var if_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, if_atom));
var quote_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, form_atom, quote_atom));
var lambda_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, new_list(form_atom, new_list(function_atom, something_atom, function_atom)), theThing_atom));
var function_builtin_use_systemName = systemName_make(new_list(form_atom, new_list(system_atom, function_atom)));
var form_builtin_use_systemName = systemName_make(new_list(form_atom, new_list(system_atom, form_atom)));
var form_use_systemName = systemName_make(new_list(form_atom, form_atom));
var comment_function_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, function_atom, comment_atom));
var comment_form_builtin_systemName = systemName_make(new_list(typeAnnotation_atom, form_atom, comment_atom));
var false_v = new_data(false_atom, new_list());
var true_v = new_data(true_atom, new_list());
function new_error(name, list) {
    return new_data(error_atom, new_construction(name, new_construction(list, null_v)));
}
function jsArray_to_list(xs) {
    var ret = null_v;
    for (var i = xs.length - 1; i >= 0; i--) {
        ret = new_construction(xs[i], ret);
    }
    return ret;
}
exports.jsArray_to_list = jsArray_to_list;
function list_to_jsArray(xs, k_done, k_tail) {
    var ret = [];
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
    return list_to_jsArray(xs, function (x) { return x; }, function (_1, _2) { return false; });
}
exports.maybe_list_to_jsArray = maybe_list_to_jsArray;
function new_list() {
    var xs = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        xs[_i] = arguments[_i];
    }
    return jsArray_to_list(xs);
}
exports.new_list = new_list;
function un_just_all(raw) {
    if (!just_p(raw)) {
        return raw;
    }
    var x = raw;
    var xs = [];
    while (just_p(x)) {
        xs.push(x);
        x = un_just(x);
    }
    for (var _i = 0, xs_1 = xs; _i < xs_1.length; _i++) {
        var v = xs_1[_i];
        lang_assert_equal_set_do(v, x);
    }
    return x;
}
exports.un_just_all = un_just_all;
function un_just_comment_all(x) {
    while (just_p(x) || comment_p(x)) {
        x = un_just_all(un_comment_all(x));
    }
    return x;
}
exports.un_just_comment_all = un_just_comment_all;
function delay_p(x) {
    return delay_evaluate_p(x) ||
        delay_builtin_form_p(x) ||
        delay_builtin_func_p(x) ||
        delay_apply_p(x);
}
exports.delay_p = delay_p;
function delay_just_p(x) {
    return just_p(x) || delay_p(x);
}
exports.delay_just_p = delay_just_p;
function lazy_p(x) {
    return delay_just_p(x) || comment_p(x);
}
exports.lazy_p = lazy_p;
function delay2delay_evaluate(x) {
    if (delay_evaluate_p(x)) {
        return x;
    }
    else if (delay_builtin_form_p(x)) {
        throw 'WIP';
    }
    else if (delay_builtin_func_p(x)) {
        throw 'WIP';
    }
    else if (delay_apply_p(x)) {
        throw 'WIP';
    }
    return LANG_ERROR();
}
function delay_env(x) {
    return delay_evaluate_env(delay2delay_evaluate(x));
}
exports.delay_env = delay_env;
function delay_x(x) {
    return delay_evaluate_x(delay2delay_evaluate(x));
}
exports.delay_x = delay_x;
function force_all_inner(raw, parents_history, ref_novalue_replace, xs) {
    if (parents_history === void 0) { parents_history = {}; }
    if (ref_novalue_replace === void 0) { ref_novalue_replace = [false, false]; }
    if (xs === void 0) { xs = []; }
    var history = {};
    var x = raw;
    function do_rewrite(newval) {
        lang_assert_equal_set_do(x, newval);
        for (var i = 0; i < xs.length; i++) {
            lang_assert_equal_set_do(xs[i], newval);
        }
        return newval;
    }
    function replace_this_with_stopped() {
        ref_novalue_replace[1] = true;
        return do_rewrite_force_all(the_world_stopped_v);
    }
    function do_rewrite_force_all(newval) {
        do_rewrite(newval);
        if (delay_just_p(newval)) {
            xs.push(x);
            return force_all_inner(newval, parents_history, [false, false], xs);
        }
        return newval;
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
    for (var i = 0; delay_just_p(x) && i < 32; i++) {
        xs.push(x);
        x = force1(x);
    }
    while (delay_just_p(x)) {
        var x_id = simple_print(x);
        if (parents_history[x_id] === true) {
            return replace_this_with_stopped();
        }
        if (history[x_id] === true) {
            ref_novalue_replace[0] = true;
            if (delay_evaluate_p(x)) {
                return replace_this_with_stopped();
            }
            else if (delay_builtin_func_p(x)) {
                var f = delay_builtin_func_f(x);
                var xs_2 = delay_builtin_func_xs(x);
                var elim_s = [data_name_function_builtin_systemName,
                    data_list_function_builtin_systemName,
                    data_p_function_builtin_systemName,
                    construction_p_function_builtin_systemName,
                    construction_head_function_builtin_systemName,
                    construction_tail_function_builtin_systemName,
                    atom_p_function_builtin_systemName,
                    null_p_function_builtin_systemName];
                var is_elim = false;
                for (var _i = 0, elim_s_1 = elim_s; _i < elim_s_1.length; _i++) {
                    var elim_s_v = elim_s_1[_i];
                    if (equal_p(elim_s_v, f)) {
                        is_elim = true;
                        break;
                    }
                }
                if (is_elim) {
                    LANG_ASSERT(xs_2.length === 1);
                    LANG_ASSERT(ref_novalue_replace[1] === false);
                    var inner = force_all_inner(xs_2[0], make_history(), ref_novalue_replace);
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(f, [inner]));
                    }
                    else {
                        return LANG_ERROR();
                    }
                }
                if (equal_p(f, equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (equal_p(f, apply_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (equal_p(f, evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (equal_p(f, if_function_builtin_systemName)) {
                    LANG_ASSERT(xs_2.length === 3);
                    LANG_ASSERT(ref_novalue_replace[1] === false);
                    var tf = force_all_inner(xs_2[0], make_history(), ref_novalue_replace);
                    if (ref_novalue_replace[1]) {
                        return do_rewrite_force_all(builtin_func_apply(if_function_builtin_systemName, [tf, xs_2[1], xs_2[2]]));
                    }
                    else {
                        return LANG_ERROR();
                    }
                }
                return LANG_ERROR();
            }
            else if (delay_builtin_form_p(x)) {
                return replace_this_with_stopped();
            }
            else if (delay_apply_p(x)) {
                return replace_this_with_stopped();
            }
            return LANG_ERROR();
        }
        history[x_id] = true;
        xs.push(x);
        x = force1(x);
    }
    return do_rewrite(x);
}
function force1(raw) {
    var x = un_just_all(raw);
    var ret;
    LANG_ASSERT(!just_p(x));
    if (delay_evaluate_p(x)) {
        ret = real_evaluate(delay_evaluate_env(x), delay_evaluate_x(x), raw);
    }
    else if (delay_builtin_form_p(x)) {
        ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x), raw);
    }
    else if (delay_builtin_func_p(x)) {
        ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x), raw);
    }
    else if (delay_apply_p(x)) {
        ret = real_apply(delay_apply_f(x), delay_apply_xs(x), raw);
    }
    else {
        ret = x;
    }
    ret = un_just_all(ret);
    lang_assert_equal_set_do(x, ret);
    return ret;
}
exports.force1 = force1;
function force_all(raw) {
    return force_all_inner(raw);
}
exports.force_all = force_all;
function force_uncomment_all(x) {
    while (delay_just_p(x) || comment_p(x)) {
        x = force_all(un_comment_all(x));
    }
    return x;
}
exports.force_uncomment_all = force_uncomment_all;
function force_uncomment1(raw) {
    if (comment_p(raw)) {
        return comment_x(raw);
    }
    else {
        return force1(raw);
    }
}
exports.force_uncomment1 = force_uncomment1;
function unlazy1(x) {
    while (comment_p(x)) {
        x = comment_x(x);
    }
    x = force1(x);
    while (comment_p(x)) {
        x = comment_x(x);
    }
    return x;
}
exports.unlazy1 = unlazy1;
function unlazy_list_1_keepcomment(list, not_list_k, delay_just_k, k) {
    var ret = [];
    var comments = [];
    var i = un_just_all(list);
    var not_forced = true;
    while (true) {
        if (null_p(i)) {
            return k(comments, ret);
        }
        else if (comment_p(i)) {
            comments.push(comment_comment(i));
            i = comment_x(i);
        }
        else if (construction_p(i)) {
            ret.push(construction_head(i));
            i = construction_tail(i);
        }
        else if (delay_just_p(i)) {
            if (not_forced) {
                not_forced = false;
                i = force1(i);
            }
            else {
                return delay_just_k();
            }
        }
        else {
            return not_list_k();
        }
    }
}
function name_unlazy1_p3(x) {
    if (lazy_p(x)) {
        x = unlazy1(x);
    }
    if (lazy_p(x)) {
        return null;
    }
    if (atom_p(x)) {
        return true;
    }
    if (!data_p(x)) {
        return false;
    }
    var n = data_name(x);
    if (lazy_p(n)) {
        n = unlazy1(n);
    }
    if (lazy_p(n)) {
        return null;
    }
    if (!atom_p(n)) {
        return false;
    }
    return atom_equal_p(n, name_atom);
}
function make_enviroment_null_v() {
    return [true, {}, null];
}
var enviroment_null_v = make_enviroment_null_v();
function enviroment_null_p(x) {
    if (x[0]) {
        return recordstring_null_p(x[1]);
    }
    return false;
}
function enviroment_helper_print0(x, ref, ret) {
    x = force_uncomment_all(x);
    if (atom_p(x)) {
        ret.push("^", un_atom(x));
    }
    else if (construction_p(x)) {
        ret.push(".");
        ref.push(construction_head(x), construction_tail(x));
    }
    else if (null_p(x)) {
        ret.push("_");
    }
    else if (data_p(x)) {
        ret.push("#");
        ref.push(data_name(x), data_list(x));
    }
    else {
        return LANG_ERROR();
    }
}
function enviroment_helper_print_step(xs) {
    var rs = [];
    var ss = [];
    for (var _i = 0, xs_3 = xs; _i < xs_3.length; _i++) {
        var x = xs_3[_i];
        enviroment_helper_print0(x, rs, ss);
    }
    return [ss, rs];
}
function enviroment_helper_node_expand(env) {
    var e = enviroment_helper_print_step(env[1]);
    var es = e[0];
    var ev = e[1];
    var t = {};
    LANG_ASSERT(es.length !== 0);
    t[es[es.length - 1]] = [false, ev, env[2]];
    var result = [true, t, null];
    for (var i = es.length - 2; i >= 0; i--) {
        var t_1 = {};
        t_1[es[i]] = result;
        result = [true, t_1, null];
    }
    return result;
}
function enviroment_helper_tree_shadow_copy(x) {
    return [true, recordstring_shadow_copy(x[1]), null];
}
function enviroment_set(env, key, val) {
    var result = make_enviroment_null_v();
    return run_trampoline(enviroment_set_helper(env, [key], val, result, result));
}
function enviroment_set_helper(env, key, val, return_pointer, real_return) {
    if (key.length === 0) {
        LANG_ASSERT(enviroment_null_p(env) || (env[0] === false && env[1].length === 0));
        return_pointer[0] = false;
        return_pointer[1] = key;
        return_pointer[2] = val;
        return trampoline_return(real_return);
    }
    if (env[0]) {
        var result_tmp = enviroment_helper_tree_shadow_copy(env);
        return_pointer[0] = result_tmp[0];
        return_pointer[1] = result_tmp[1];
        return_pointer[2] = result_tmp[2];
        var result = return_pointer;
        var a = enviroment_helper_print_step(key);
        var as = a[0];
        var av_1 = a[1];
        var pointer_1 = result;
        for (var _i = 0, as_1 = as; _i < as_1.length; _i++) {
            var k = as_1[_i];
            var m = null;
            if (k in pointer_1[1]) {
                var t = pointer_1[1][k];
                if (t[0]) {
                    m = enviroment_helper_tree_shadow_copy(t);
                }
                else {
                    m = enviroment_helper_node_expand(t);
                }
            }
            else {
                m = [true, {}, null];
            }
            LANG_ASSERT(m !== null);
            pointer_1[1][k] = m;
            pointer_1 = m;
        }
        if (enviroment_null_p(pointer_1)) {
            var p = pointer_1;
            p[0] = false;
            p[1] = av_1;
            p[2] = val;
            return trampoline_return(real_return);
        }
        else {
            return trampoline_delay(function () { return enviroment_set_helper(pointer_1, av_1, val, pointer_1, real_return); });
        }
    }
    else {
        return trampoline_delay(function () { return enviroment_set_helper(enviroment_helper_node_expand(env), key, val, return_pointer, real_return); });
    }
    return LANG_ERROR();
}
var env_null_v = [];
exports.env_null_v = env_null_v;
function env_set(env, key, val) {
    var ret = [];
    for (var i = 0; i < env.length; i = i + 2) {
        if (equal_p(env[i + 0], key)) {
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
exports.env_set = env_set;
function env_get(env, key, default_v) {
    for (var i = 0; i < env.length; i = i + 2) {
        if (equal_p(env[i + 0], key)) {
            return env[i + 1];
        }
    }
    return default_v;
}
exports.env_get = env_get;
function must_env_get(env, key) {
    for (var i = 0; i < env.length; i = i + 2) {
        if (equal_p(env[i + 0], key)) {
            return env[i + 1];
        }
    }
    return LANG_ERROR();
}
function env2val(env) {
    var ret = null_v;
    for (var i = 0; i < env.length; i = i + 2) {
        ret = new_construction(new_list(env[i + 0], env[i + 1]), ret);
    }
    return new_data(mapping_atom, new_list(ret));
}
exports.env2val = env2val;
function env_foreach(env, f) {
    for (var i = 0; i < env.length; i = i + 2) {
        f(env[i + 0], env[i + 1]);
    }
}
exports.env_foreach = env_foreach;
function val2env(x) {
    x = force_all(x);
    if (!data_p(x)) {
        return false;
    }
    var s = force_all(data_name(x));
    if (!atom_p(s)) {
        return false;
    }
    if (!atom_equal_p(s, mapping_atom)) {
        return false;
    }
    s = force_all(data_list(x));
    if (!construction_p(s)) {
        return false;
    }
    if (!null_p(force_all(construction_tail(s)))) {
        return false;
    }
    var ret = [];
    var xs = force_all(construction_head(s));
    while (!null_p(xs)) {
        if (!construction_p(xs)) {
            return false;
        }
        var x_1 = force_all(construction_head(xs));
        xs = force_all(construction_tail(xs));
        if (!construction_p(x_1)) {
            return false;
        }
        var k = construction_head(x_1);
        x_1 = force_all(construction_tail(x_1));
        if (!construction_p(x_1)) {
            return false;
        }
        var v = construction_head(x_1);
        if (!null_p(force_all(construction_tail(x_1)))) {
            return false;
        }
        var not_breaked = true;
        for (var i = 0; i < ret.length; i = i + 2) {
            if (equal_p(ret[i + 0], k)) {
                ret[i + 1] = v;
                not_breaked = false;
                break;
            }
        }
        if (not_breaked) {
            ret.push(k, v);
        }
    }
    return ret;
}
exports.val2env = val2env;
function real_evaluate(env, raw, selfvalraw) {
    var x = force1(raw);
    if (delay_just_p(x)) {
        return selfvalraw;
    }
    var error_v = function () { return new_error(system_atom, new_list(function_builtin_use_systemName, new_list(evaluate_function_builtin_systemName, new_list(env2val(env), x)))); };
    if (construction_p(x)) {
        return unlazy_list_1_keepcomment(x, error_v, function () { return selfvalraw; }, function (comments, xs) {
            if (comments.length !== 0) {
                throw 'WIP';
            }
            if (equal_p(xs[0], form_builtin_use_systemName)) {
                if (xs.length === 1) {
                    return error_v();
                }
                var f = xs[1];
                var args = [];
                for (var i = 2; i < xs.length; i++) {
                    args.push(xs[i]);
                }
                return builtin_form_apply(env, f, args);
            }
            else if (equal_p(xs[0], form_use_systemName)) {
                if (xs.length === 1) {
                    return error_v();
                }
                var f = force_all(evaluate(env, xs[1]));
                if (!data_p(f)) {
                    return error_v();
                }
                var f_type = force1(data_name(f));
                if (delay_just_p(f_type)) {
                    return selfvalraw;
                }
                if (!atom_p(f_type)) {
                    return error_v();
                }
                if (!atom_equal_p(f_type, form_atom)) {
                    return error_v();
                }
                var f_list = force1(data_list(f));
                if (delay_just_p(f_list)) {
                    return selfvalraw;
                }
                if (!construction_p(f_list)) {
                    return error_v();
                }
                var f_x = construction_head(f_list);
                var f_list_cdr = force1(construction_tail(f_list));
                if (delay_just_p(f_list_cdr)) {
                    return selfvalraw;
                }
                if (!null_p(f_list_cdr)) {
                    return error_v();
                }
                var args = [env2val(env)];
                for (var i = 2; i < xs.length; i++) {
                    args.push(xs[i]);
                }
                return apply(f_x, args);
            }
            else if (equal_p(xs[0], function_builtin_use_systemName)) {
                if (xs.length === 1) {
                    return error_v();
                }
                var f = xs[1];
                var args = [];
                for (var i = 2; i < xs.length; i++) {
                    args.push(evaluate(env, xs[i]));
                }
                return builtin_func_apply(f, args);
            }
            else {
                var f = evaluate(env, xs[0]);
                var args = [];
                for (var i = 1; i < xs.length; i++) {
                    args.push(evaluate(env, xs[i]));
                }
                return apply(f, args);
            }
        });
    }
    else if (null_p(x)) {
        return x;
    }
    var r = name_unlazy1_p3(x);
    if (r === null) {
        return selfvalraw;
    }
    if (r === true) {
        return env_get(env, x, error_v());
    }
    return error_v();
}
function make_builtin_p_func(p_sym, p_jsfunc) {
    return [p_sym,
        1,
        function (x) {
            x = force1(x);
            if (delay_just_p(x)) {
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
        function (x, error_v) {
            x = force1(x);
            if (delay_just_p(x)) {
                return builtin_func_apply(f_sym, [x]);
            }
            if (p_jsfunc(x)) {
                return f_jsfunc(x);
            }
            return error_v();
        }];
}
var real_builtin_func_apply_s = [
    make_builtin_p_func(data_p_function_builtin_systemName, data_p),
    [new_data_function_builtin_systemName, 2, new_data],
    make_builtin_get_func(data_name_function_builtin_systemName, data_p, data_name),
    make_builtin_get_func(data_list_function_builtin_systemName, data_p, data_list),
    make_builtin_p_func(null_p_function_builtin_systemName, null_p),
    [new_construction_function_builtin_systemName, 2, new_construction],
    make_builtin_p_func(construction_p_function_builtin_systemName, construction_p),
    make_builtin_get_func(construction_head_function_builtin_systemName, construction_p, construction_head),
    make_builtin_get_func(construction_tail_function_builtin_systemName, construction_p, construction_tail),
    [equal_p_function_builtin_systemName, 2, function (x, y, error_v) {
            if (x === y) {
                return true_v;
            }
            x = force1(x);
            y = force1(y);
            if (delay_just_p(x) || delay_just_p(y)) {
                return builtin_func_apply(equal_p_function_builtin_systemName, [x, y]);
            }
            if (x === y) {
                return true_v;
            }
            function H_if(b, xx, yy) {
                return builtin_func_apply(if_function_builtin_systemName, [b, xx, yy]);
            }
            function H_and(xx, yy) {
                return H_if(xx, yy, false_v);
            }
            LANG_ASSERT(!delay_just_p(x));
            function end_2(xx, yy, f1, f2) {
                return H_and(builtin_func_apply(equal_p_function_builtin_systemName, [f1(xx), f1(yy)]), builtin_func_apply(equal_p_function_builtin_systemName, [f2(xx), f2(yy)]));
            }
            if (null_p(x)) {
                if (!null_p(x)) {
                    return false_v;
                }
                return true_v;
            }
            else if (atom_p(x)) {
                if (!atom_p(y)) {
                    return false_v;
                }
                if (atom_equal_p(x, y)) {
                    return true_v;
                }
                else {
                    return false_v;
                }
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
            return LANG_ERROR();
        }],
    [apply_function_builtin_systemName, 2, function (f, xs, error_v) {
            var jslist = [];
            var iter = force_all(xs);
            while (construction_p(iter)) {
                jslist.push(construction_head(iter));
                iter = force_all(construction_tail(iter));
            }
            if (!null_p(iter)) {
                return error_v();
            }
            return apply(f, jslist);
        }],
    [evaluate_function_builtin_systemName, 2, function (env, x, error_v) {
            var maybeenv = val2env(env);
            if (maybeenv === false) {
                return error_v();
            }
            return evaluate(maybeenv, x);
        }],
    make_builtin_p_func(atom_p_function_builtin_systemName, atom_p),
    [list_chooseOne_function_builtin_systemName, 1, function (xs, error_v) {
            xs = force1(xs);
            if (delay_just_p(xs)) {
                return builtin_func_apply(list_chooseOne_function_builtin_systemName, [xs]);
            }
            if (!construction_p(xs)) {
                return error_v();
            }
            return construction_head(xs);
        }],
    [if_function_builtin_systemName, 3, function (b, x, y, error_v) {
            b = force1(b);
            if (delay_just_p(b)) {
                return builtin_func_apply(if_function_builtin_systemName, [b, x, y]);
            }
            if (!data_p(b)) {
                return error_v();
            }
            var nam = force_all(data_name(b));
            if (!atom_p(nam)) {
                return error_v();
            }
            if (atom_equal_p(nam, true_atom)) {
                return x;
            }
            if (atom_equal_p(nam, false_atom)) {
                return y;
            }
            return error_v();
        }],
    [comment_function_builtin_systemName, 2, new_comment],
];
function real_apply(f, xs, selfvalraw) {
    var error_v = function () { return new_error(system_atom, new_list(function_builtin_use_systemName, new_list(apply_function_builtin_systemName, new_list(f, jsArray_to_list(xs))))); };
    f = force1(f);
    if (delay_just_p(f)) {
        return selfvalraw;
    }
    if (!data_p(f)) {
        return error_v();
    }
    var f_type = force_all(data_name(f));
    if (!(atom_p(f_type) && atom_equal_p(f_type, function_atom))) {
        return error_v();
    }
    var f_list = force_all(data_list(f));
    if (!construction_p(f_list)) {
        return error_v();
    }
    var args_pat = force_all_rec(construction_head(f_list));
    var f_list_cdr = force_all(construction_tail(f_list));
    if (!(construction_p(f_list_cdr) && null_p(force_all(construction_tail(f_list_cdr))))) {
        return error_v();
    }
    var f_code = construction_head(f_list_cdr);
    var env = env_null_v;
    var xs_i = 0;
    while (!null_p(args_pat)) {
        var r = name_unlazy1_p3(args_pat);
        if (r === null) {
            return selfvalraw;
        }
        if (r === true) {
            var x = null_v;
            for (var i = xs.length - 1; i >= xs_i; i--) {
                x = new_construction(xs[i], x);
            }
            env = env_set(env, args_pat, x);
            xs_i = xs.length;
            args_pat = null_v;
        }
        else if (construction_p(args_pat)) {
            if (xs_i < xs.length) {
                var x = xs[xs_i];
                xs_i++;
                env = env_set(env, construction_head(args_pat), x);
                args_pat = construction_tail(args_pat);
            }
            else {
                return error_v();
            }
        }
        else {
            return error_v();
        }
    }
    if (xs.length !== xs_i) {
        return error_v();
    }
    return evaluate(env, f_code);
}
function real_builtin_func_apply(f, xs, selfvalraw) {
    var error_v = function () { return new_error(system_atom, new_list(function_builtin_use_systemName, new_list(f, jsArray_to_list(xs)))); };
    for (var _i = 0, real_builtin_func_apply_s_1 = real_builtin_func_apply_s; _i < real_builtin_func_apply_s_1.length; _i++) {
        var xx = real_builtin_func_apply_s_1[_i];
        if (equal_p(f, xx[0])) {
            if (xs.length !== xx[1]) {
                return error_v();
            }
            if (xx[1] === 1) {
                return xx[2](xs[0], error_v, selfvalraw);
            }
            else if (xx[1] === 2) {
                return xx[2](xs[0], xs[1], error_v, selfvalraw);
            }
            else if (xx[1] === 3) {
                return xx[2](xs[0], xs[1], xs[2], error_v, selfvalraw);
            }
            return LANG_ERROR();
        }
    }
    return error_v();
}
function real_builtin_form_apply(env, f, xs, selfvalraw) {
    var error_v = function () { return new_error(system_atom, new_list(form_builtin_use_systemName, new_list(env2val(env), f, jsArray_to_list(xs)))); };
    if (equal_p(f, quote_form_builtin_systemName)) {
        if (xs.length !== 1) {
            return error_v();
        }
        return xs[0];
    }
    else if (equal_p(f, lambda_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v();
        }
        return new_lambda(env, xs[0], xs[1], error_v);
    }
    else if (equal_p(f, comment_form_builtin_systemName)) {
        if (xs.length !== 2) {
            return error_v();
        }
        return new_comment(xs[0], evaluate(env, xs[1]));
    }
    return error_v();
}
function make_quote(x) {
    return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x);
}
function new_lambda(env, args_pat, body, error_v) {
    args_pat = unlazy_all_rec(args_pat);
    var args_pat_vars = [];
    var args_pat_is_dot = false;
    var args_pat_iter = args_pat;
    while (!null_p(args_pat_iter)) {
        var r = name_unlazy1_p3(args_pat_iter);
        LANG_ASSERT(r !== null);
        if (r) {
            args_pat_vars.push(args_pat_iter);
            args_pat_is_dot = true;
            args_pat_iter = null_v;
        }
        else if (construction_p(args_pat_iter)) {
            args_pat_vars.push(construction_head(args_pat_iter));
            args_pat_iter = construction_tail(args_pat_iter);
        }
        else {
            return error_v();
        }
    }
    var args_pat_vars_val;
    if (args_pat_is_dot) {
        args_pat_vars_val = jsArray_to_list(args_pat_vars);
    }
    else {
        args_pat_vars_val = args_pat;
    }
    var env_vars = [];
    env_foreach(env, function (k, v) {
        for (var i = 0; i < args_pat_vars.length; i++) {
            if (equal_p(args_pat_vars[i], k)) {
                return;
            }
        }
        env_vars.push(k);
    });
    var new_args_pat = args_pat_vars_val;
    for (var i = env_vars.length - 1; i >= 0; i--) {
        new_args_pat = new_construction(env_vars[i], new_args_pat);
    }
    var new_args = args_pat_vars_val;
    for (var i = env_vars.length - 1; i >= 0; i--) {
        new_args = new_construction(make_quote(must_env_get(env, env_vars[i])), new_args);
    }
    return new_data(function_atom, new_list(args_pat, new_construction(make_quote(new_data(function_atom, new_list(new_args_pat, body))), new_args)));
}
function jsbool_equal_p_inner(x, y) {
    if (x === y) {
        return true;
    }
    x = force_all(x);
    y = force_all(y);
    if (x === y) {
        return true;
    }
    function end_2(xx, yy, f1, f2) {
        var r1 = jsbool_equal_p_inner(f1(xx), f1(yy));
        var r2 = jsbool_equal_p_inner(f2(xx), f2(yy));
        if (r1 === true && r2 === true) {
            lang_assert_equal_set_do(xx, yy);
            return true;
        }
        else if (r1 !== false && r2 !== false) {
            return null;
        }
        else {
            return false;
        }
    }
    if (comment_p(x)) {
        var x2 = un_comment_all(x);
        var ret = jsbool_equal_p_inner(x2, y);
        if (ret === true) {
            ret = null;
        }
        return ret;
    }
    else if (comment_p(y)) {
        var y2 = un_comment_all(y);
        var ret = jsbool_equal_p_inner(x, y2);
        if (ret === true) {
            ret = null;
        }
        return ret;
    }
    else if (null_p(x)) {
        if (!null_p(y)) {
            return false;
        }
        lang_assert_equal_set_do(x, y);
        return true;
    }
    else if (atom_p(x)) {
        if (!atom_p(y)) {
            return false;
        }
        return atom_equal_p(x, y);
    }
    else if (construction_p(x)) {
        if (!construction_p(y)) {
            return false;
        }
        return end_2(x, y, construction_head, construction_tail);
    }
    else if (data_p(x)) {
        if (!data_p(y)) {
            return false;
        }
        return end_2(x, y, data_name, data_list);
    }
    return LANG_ERROR();
}
function equal_p(x, y) {
    return jsbool_equal_p_inner(x, y) !== false;
}
exports.equal_p = equal_p;
function jsbool_no_force_isomorphism_p(x, y) {
    if (x === y) {
        return true;
    }
    x = un_just_all(x);
    y = un_just_all(y);
    if (x === y) {
        return true;
    }
    function end_2(xx, yy, f1, f2) {
        if (jsbool_no_force_isomorphism_p(f1(xx), f1(yy)) && jsbool_no_force_isomorphism_p(f2(xx), f2(yy))) {
            lang_assert_equal_set_do(xx, yy);
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
        lang_assert_equal_set_do(x, null_v);
        lang_assert_equal_set_do(y, null_v);
        return true;
    }
    else if (atom_p(x)) {
        if (!atom_p(y)) {
            return false;
        }
        return atom_equal_p(x, y);
    }
    else if (construction_p(x)) {
        if (!construction_p(y)) {
            return false;
        }
        return end_2(x, y, construction_head, construction_tail);
    }
    else if (data_p(x)) {
        if (!data_p(y)) {
            return false;
        }
        return end_2(x, y, data_name, data_list);
    }
    else if (delay_p(x)) {
        return false;
    }
    return LANG_ERROR();
}
function simple_print(x) {
    x = un_just_all(x);
    var temp = "";
    var prefix = "";
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
    else if (atom_p(x)) {
        return un_atom(x);
    }
    else if (comment_p(x)) {
        return ";(" + simple_print(comment_comment(x)) + " " + simple_print(comment_x(x)) + ")";
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
    return LANG_ERROR();
}
exports.simple_print = simple_print;
function complex_parse(x) {
    var state_const = x;
    var state = 0;
    function eof() {
        return state_const.length === state;
    }
    function get() {
        LANG_ASSERT(!eof());
        var ret = state_const[state];
        state++;
        return ret;
    }
    function put(chr) {
        LANG_ASSERT(state_const[state - 1] === chr);
        state--;
    }
    function parse_error(x) {
        if (x === void 0) { x = ""; }
        throw "TheLanguage parse ERROR!" + x;
    }
    function a_space_p(chr) {
        return chr === " " || chr === "\n" || chr === "\t" || chr === "\r";
    }
    function space() {
        if (eof()) {
            return false;
        }
        var x = get();
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
    function atom() {
        if (eof()) {
            return false;
        }
        var x = get();
        var ret = "";
        if (!a_atom_p(x)) {
            put(x);
            return false;
        }
        while (a_atom_p(x) && !eof()) {
            ret += x;
            x = get();
        }
        if (a_atom_p(x)) {
            ret += x;
        }
        else {
            put(x);
        }
        return new_atom(ret);
    }
    function readlist() {
        if (eof()) {
            return false;
        }
        var x = get();
        if (x !== "(") {
            put(x);
            return false;
        }
        var ret_last = new_hole_do();
        var ret = ret_last;
        function last_add_do(val) {
            var ret_last2 = new_hole_do();
            hole_set_do(ret_last, new_construction(val, ret_last2));
            ret_last = ret_last2;
        }
        while (true) {
            space();
            if (eof()) {
                return parse_error();
            }
            x = get();
            if (x === ")") {
                hole_set_do(ret_last, null_v);
                return ret;
            }
            if (x === ".") {
                space();
                var e_1 = val();
                hole_set_do(ret_last, e_1);
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
            var e = val();
            last_add_do(e);
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
        var xs = readlist();
        if (xs === false) {
            return parse_error();
        }
        if (!construction_p(xs)) {
            return parse_error();
        }
        return new_data(construction_head(xs), construction_tail(xs));
    }
    function make_read_two(prefix, k) {
        return function () {
            if (eof()) {
                return false;
            }
            var c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            var xs = readlist();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            var x = construction_tail(xs);
            if (!(construction_p(x) && null_p(construction_tail(x)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x));
        };
    }
    function make_read_three(prefix, k) {
        return function () {
            if (eof()) {
                return false;
            }
            var c = get();
            if (c !== prefix) {
                put(c);
                return false;
            }
            var xs = readlist();
            if (xs === false) {
                return parse_error();
            }
            if (!construction_p(xs)) {
                return parse_error();
            }
            var x = construction_tail(xs);
            if (!construction_p(x)) {
                return parse_error();
            }
            var x_d = construction_tail(x);
            if (!(construction_p(x_d) && null_p(construction_tail(x_d)))) {
                return parse_error();
            }
            return k(construction_head(xs), construction_head(x), construction_head(x_d));
        };
    }
    var readeval = make_read_two("$", function (ev, val) {
        var env = val2env(ev);
        if (env === false) {
            return parse_error();
        }
        return evaluate(env, val);
    });
    var readfuncapply = make_read_two("%", function (f, xs) {
        var jsxs = list_to_jsArray(xs, function (v) { return v; }, function (_1, _2) { return parse_error(); });
        return builtin_func_apply(f, jsxs);
    });
    var readformbuiltin = make_read_three("@", function (e, f, xs) {
        var jsxs = list_to_jsArray(xs, function (v) { return v; }, function (_1, _2) { return parse_error(); });
        var env = val2env(e);
        if (env === false) {
            return parse_error();
        }
        return builtin_form_apply(env, f, jsxs);
    });
    var readapply = make_read_two("^", function (f, xs) {
        var jsxs = list_to_jsArray(xs, function (v) { return v; }, function (_1, _2) { return parse_error(); });
        return apply(f, jsxs);
    });
    var readcomment = make_read_two(";", function (comment, x) { return new_comment(comment, x); });
    function a_atom_p(chr) {
        if (a_space_p(chr)) {
            return false;
        }
        for (var _i = 0, _a = ["(", ")", "!", "#", ".", "$", "%", "^", "@",
            '~', '/', '-', '>', '_', ':', '?', '[', ']', '&', ';'
        ]; _i < _a.length; _i++) {
            var v = _a[_i];
            if (v === chr) {
                return false;
            }
        }
        return true;
    }
    function val() {
        space();
        var fs = [readlist, readsysname, data, readeval, readfuncapply, readformbuiltin, readapply, readcomment];
        for (var _i = 0, fs_1 = fs; _i < fs_1.length; _i++) {
            var f = fs_1[_i];
            var x_2 = f();
            if (x_2 !== false) {
                return x_2;
            }
        }
        return parse_error();
    }
    return val();
    function un_maybe(vl) {
        if (vl === false) {
            return parse_error();
        }
        return vl;
    }
    function not_eof() {
        return !eof();
    }
    function assert_get(c) {
        un_maybe(not_eof());
        un_maybe(get() === c);
    }
    function readsysname_no_pack_inner_must(strict) {
        if (strict === void 0) { strict = false; }
        function readsysname_no_pack_bracket() {
            assert_get('[');
            var x = readsysname_no_pack_inner_must();
            assert_get(']');
            return x;
        }
        var fs;
        if (strict) {
            fs = [readlist, atom, readsysname_no_pack_bracket, data,
                readeval, readfuncapply, readformbuiltin, readapply, readcomment];
        }
        else {
            fs = [readlist, readsysname_no_pack, data,
                readeval, readfuncapply, readformbuiltin, readapply, readcomment];
        }
        for (var _i = 0, fs_2 = fs; _i < fs_2.length; _i++) {
            var f = fs_2[_i];
            var x_3 = f();
            if (x_3 !== false) {
                return x_3;
            }
        }
        return parse_error();
    }
    function may_xfx_xf(vl) {
        if (eof()) {
            return vl;
        }
        var head = get();
        if (head === '.') {
            var y = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_atom, new_list(function_atom, new_list(vl), something_atom), y);
        }
        else if (head === ':') {
            var y = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_atom, y, vl);
        }
        else if (head === '~') {
            return new_list(isOrNot_atom, vl);
        }
        else if (head === '@') {
            var y = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_atom, new_list(function_atom, new_construction(vl, something_atom), something_atom), y);
        }
        else if (head === '?') {
            return new_list(typeAnnotation_atom, function_atom, new_list(isOrNot_atom, vl));
        }
        else if (head === '/') {
            var ys = [vl];
            while (true) {
                var y = readsysname_no_pack_inner_must(true);
                ys.push(y);
                if (eof()) {
                    break;
                }
                var c0 = get();
                if (c0 !== '/') {
                    put(c0);
                    break;
                }
            }
            return new_list(sub_atom, jsArray_to_list(ys));
        }
        else {
            put(head);
            return vl;
        }
    }
    function readsysname_no_pack() {
        if (eof()) {
            return false;
        }
        var head = get();
        if (head === '&') {
            un_maybe(not_eof());
            var c0 = get();
            if (c0 === '+') {
                var x_4 = readsysname_no_pack_inner_must();
                return new_list(form_atom, new_list(system_atom, x_4));
            }
            else {
                put(c0);
            }
            var x_5 = readsysname_no_pack_inner_must();
            return new_list(form_atom, x_5);
        }
        else if (head === ':') {
            un_maybe(not_eof());
            var c0 = get();
            if (c0 === '&') {
                assert_get('>');
                var x_6 = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_atom, new_list(form_atom, new_list(function_atom, something_atom, x_6)), theThing_atom);
            }
            else if (c0 === '>') {
                var x_7 = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_atom, new_list(function_atom, something_atom, x_7), theThing_atom);
            }
            else {
                put(c0);
            }
            var x_8 = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_atom, x_8, theThing_atom);
        }
        else if (head === '+') {
            var x_9 = readsysname_no_pack_inner_must();
            return new_list(system_atom, x_9);
        }
        else if (head === '[') {
            var x_10 = readsysname_no_pack_inner_must();
            assert_get(']');
            return may_xfx_xf(x_10);
        }
        else if (head === '_') {
            assert_get(':');
            var x_11 = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_atom, x_11, something_atom);
        }
        else {
            put(head);
            var x_12 = atom();
            if (x_12 === false) {
                return false;
            }
            return may_xfx_xf(x_12);
        }
    }
    function readsysname() {
        var x = readsysname_no_pack();
        if (x === false) {
            return false;
        }
        if (atom_p(x)) {
            return x;
        }
        return systemName_make(x);
    }
}
exports.complex_parse = complex_parse;
function complex_print(val) {
    function print_sys_name(x, is_inner_bool) {
        if (atom_p(x)) {
            return un_atom(x);
        }
        function inner_bracket(vl) {
            if (is_inner_bool) {
                return '[' + vl + ']';
            }
            else {
                return vl;
            }
        }
        var maybe_xs = maybe_list_to_jsArray(x);
        if (maybe_xs !== false && maybe_xs.length === 3 && jsbool_no_force_isomorphism_p(maybe_xs[0], typeAnnotation_atom)) {
            var maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1]);
            if (maybe_lst_2 !== false && maybe_lst_2.length === 3 && jsbool_no_force_isomorphism_p(maybe_lst_2[0], function_atom)) {
                var var_2_1 = maybe_lst_2[1];
                var maybe_lst_3 = maybe_list_to_jsArray(var_2_1);
                if (maybe_lst_3 !== false && maybe_lst_3.length === 1 && jsbool_no_force_isomorphism_p(maybe_lst_2[2], something_atom)) {
                    return inner_bracket(print_sys_name(maybe_lst_3[0], true) + '.' + print_sys_name(maybe_xs[2], true));
                }
                else if (construction_p(var_2_1) && jsbool_no_force_isomorphism_p(construction_tail(var_2_1), something_atom) && jsbool_no_force_isomorphism_p(maybe_lst_2[2], something_atom)) {
                    return inner_bracket(print_sys_name(construction_head(var_2_1), true) + '@' + print_sys_name(maybe_xs[2], true));
                }
                else if (jsbool_no_force_isomorphism_p(var_2_1, something_atom) && jsbool_no_force_isomorphism_p(maybe_xs[2], theThing_atom)) {
                    return inner_bracket(':>' + print_sys_name(maybe_lst_2[2], true));
                }
            }
            var maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2]);
            if (jsbool_no_force_isomorphism_p(maybe_xs[1], function_atom) && maybe_lst_44 !== false && maybe_lst_44.length === 2 && jsbool_no_force_isomorphism_p(maybe_lst_44[0], isOrNot_atom)) {
                return inner_bracket(print_sys_name(maybe_lst_44[1], true) + '?');
            }
            if (maybe_lst_2 !== false && maybe_lst_2.length === 2 && jsbool_no_force_isomorphism_p(maybe_xs[2], theThing_atom) && jsbool_no_force_isomorphism_p(maybe_lst_2[0], form_atom)) {
                var maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1]);
                if (maybe_lst_88 !== false && maybe_lst_88.length === 3 && jsbool_no_force_isomorphism_p(maybe_lst_88[0], function_atom) && jsbool_no_force_isomorphism_p(maybe_lst_88[1], something_atom)) {
                    return inner_bracket(':&>' + print_sys_name(maybe_lst_88[2], true));
                }
            }
            var hd = void 0;
            if (jsbool_no_force_isomorphism_p(maybe_xs[2], something_atom)) {
                hd = '_';
            }
            else if (jsbool_no_force_isomorphism_p(maybe_xs[2], theThing_atom)) {
                hd = '';
            }
            else {
                hd = print_sys_name(maybe_xs[2], true);
            }
            return inner_bracket(hd + ':' + print_sys_name(maybe_xs[1], true));
        }
        else if (maybe_xs !== false && maybe_xs.length === 2) {
            if (jsbool_no_force_isomorphism_p(maybe_xs[0], form_atom)) {
                var maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1]);
                if (maybe_lst_288 !== false && maybe_lst_288.length === 2 && jsbool_no_force_isomorphism_p(maybe_lst_288[0], system_atom)) {
                    return inner_bracket('&+' + print_sys_name(maybe_lst_288[1], true));
                }
                return inner_bracket('&' + print_sys_name(maybe_xs[1], true));
            }
            else if (jsbool_no_force_isomorphism_p(maybe_xs[0], isOrNot_atom)) {
                return inner_bracket(print_sys_name(maybe_xs[1], true) + '~');
            }
            else if (jsbool_no_force_isomorphism_p(maybe_xs[0], system_atom)) {
                return inner_bracket('+' + print_sys_name(maybe_xs[1], true));
            }
            else if (jsbool_no_force_isomorphism_p(maybe_xs[0], sub_atom)) {
                var maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[1]);
                if (maybe_lst_8934 !== false && maybe_lst_8934.length > 1) {
                    var tmp = print_sys_name(maybe_lst_8934[0], true);
                    for (var i = 1; i < maybe_lst_8934.length; i++) {
                        tmp += '/' + print_sys_name(maybe_lst_8934[i], true);
                    }
                    return inner_bracket(tmp);
                }
            }
        }
        if (is_inner_bool) {
            return simple_print(x);
        }
        else {
            return simple_print(systemName_make(x));
        }
    }
    var x = complex_parse(simple_print(val));
    var temp = "";
    var prefix = "";
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
        var name_1 = data_name(x);
        var list = data_list(x);
        var maybe_xs = maybe_list_to_jsArray(list);
        if (maybe_xs !== false && maybe_xs.length === 2 && jsbool_no_force_isomorphism_p(name_1, name_atom) && jsbool_no_force_isomorphism_p(maybe_xs[0], system_atom)) {
            return print_sys_name(maybe_xs[1], false);
        }
        return "#" + complex_print(new_construction(name_1, list));
    }
    else if (atom_p(x)) {
        return un_atom(x);
    }
    else if (comment_p(x)) {
        return ";(" + complex_print(comment_comment(x)) + " " + complex_print(comment_x(x)) + ")";
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
    return LANG_ERROR();
}
exports.complex_print = complex_print;
function machinetext_parse(rawstr) {
    var state = rawstr.length;
    function parse_error(x) {
        if (x === void 0) { x = ""; }
        throw 'MT parse ERROR ' + x;
    }
    function parse_assert(x) {
        if (!x) {
            return parse_error();
        }
    }
    function get_do() {
        parse_assert(is_not_eof());
        state--;
        return rawstr[state];
    }
    function is_eof() {
        return state === 0;
    }
    function is_not_eof() {
        return !is_eof();
    }
    var stack = [];
    function conslike(c) {
        var y = stack.pop();
        var x = stack.pop();
        if (x === undefined || y === undefined) {
            return parse_error();
        }
        else {
            return stack.unshift(c(x, y));
        }
    }
    while (is_not_eof()) {
        var chr = get_do();
        if (chr === '^') {
            var tmp = '';
            while (true) {
                var chr_1 = get_do();
                if (chr_1 === '^') {
                    break;
                }
                tmp = chr_1 + tmp;
            }
            stack.unshift(new_atom(tmp));
        }
        else if (chr === '.') {
            conslike(new_construction);
        }
        else if (chr === '#') {
            conslike(new_data);
        }
        else if (chr === '$') {
            conslike(function (env, val) {
                var r_env = val2env(env);
                if (r_env === false) {
                    return parse_error();
                }
                else {
                    return evaluate(r_env, val);
                }
            });
        }
        else if (chr === '_') {
            stack.unshift(null_v);
        }
        else {
            return parse_error();
        }
    }
    parse_assert(is_eof());
    parse_assert(stack.length === 1);
    return stack[0];
}
exports.machinetext_parse = machinetext_parse;
function machinetext_print(x) {
    var stack = [x];
    var result = "";
    var _loop_1 = function () {
        var new_stack = [];
        for (var _i = 0, stack_1 = stack; _i < stack_1.length; _i++) {
            var x_13 = stack_1[_i];
            x_13 = un_just_all(x_13);
            var conslike = function (xx, s, g1, g2) {
                result += (s);
                return new_stack.push(g1(xx), g2(xx));
            };
            if (atom_p(x_13)) {
                result += ('^' + un_atom(x_13) + '^');
            }
            else if (construction_p(x_13)) {
                conslike(x_13, '.', construction_head, construction_tail);
            }
            else if (null_p(x_13)) {
                result += ('_');
            }
            else if (data_p(x_13)) {
                conslike(x_13, '#', data_name, data_list);
            }
            else if (delay_p(x_13)) {
                var y = delay2delay_evaluate(x_13);
                conslike(y, '$', (function (vl) { return env2val(delay_evaluate_env(vl)); }), delay_evaluate_x);
            }
            else {
                return { value: LANG_ERROR() };
            }
        }
        stack = new_stack;
    };
    while (stack.length !== 0) {
        var state_1 = _loop_1();
        if (typeof state_1 === "object")
            return state_1.value;
    }
    return result;
}
exports.machinetext_print = machinetext_print;
function trampoline_return(x) {
    return function () { return [false, x]; };
}
exports.trampoline_return = trampoline_return;
function trampoline_delay(x) {
    return function () { return [true, x()]; };
}
exports.trampoline_delay = trampoline_delay;
function run_trampoline(x) {
    var i = x();
    while (i[0]) {
        i = i[1]();
    }
    return i[1];
}
exports.run_trampoline = run_trampoline;
var return_effect_systemName = systemName_make(new_construction(sub_atom, new_construction(new_construction(effect_atom, new_construction(new_construction(typeAnnotation_atom, new_construction(thing_atom, new_construction(something_atom, null_v))), null_v)), null_v)));
exports.return_effect_systemName = return_effect_systemName;
var bind_effect_systemName = systemName_make(new_construction(sub_atom, new_construction(new_construction(effect_atom, new_construction(construction_atom, null_v)), null_v)));
exports.bind_effect_systemName = bind_effect_systemName;
function new_effect_bind(monad, func) {
    return new_data(bind_effect_systemName, new_list(monad, func));
}
exports.new_effect_bind = new_effect_bind;
function new_effect_return(x) {
    return new_data(return_effect_systemName, x);
}
exports.new_effect_return = new_effect_return;
function run_monad_helper(return_handler, op_handler, code, state, next) {
    if (next === void 0) { next = false; }
    function make_bind(x, f) {
        throw 'WIP';
    }
    code = force_all(code);
    if (data_p(code)) {
        var name_2 = data_name(code);
        var list = data_list(code);
        if (equal_p(name_2, return_effect_systemName)) {
            list = force_all(list);
            if (construction_p(list)) {
                var list_a = construction_head(list);
                var list_d = force_all(construction_tail(list));
                if (null_p(list_d)) {
                    if (next === false) {
                        var upval_v_1 = list_a;
                        var upval_st_1 = state;
                        var r = function () { return return_handler(upval_v_1, upval_st_1); };
                        return trampoline_delay(r);
                    }
                    else {
                        var upval_rt_1 = return_handler;
                        var upval_op_1 = op_handler;
                        var upval_v_2 = list_a;
                        var upval_st_2 = state;
                        var r = function () { return run_monad_helper(upval_rt_1, upval_op_1, apply(next, upval_v_2), upval_st_2); };
                        return trampoline_delay(r);
                    }
                }
            }
        }
        else if (equal_p(name_2, bind_effect_systemName)) {
            list = force_all(list);
            if (construction_p(list)) {
                var list_a = construction_head(list);
                var list_d = force_all(construction_tail(list));
                if (construction_p(list_d)) {
                    var list_d_a = construction_head(list_d);
                    var list_d_d = force_all(construction_tail(list_d));
                    if (null_p(list_d_d)) {
                        if (next === false) {
                            var upval_rt_2 = return_handler;
                            var upval_op_2 = op_handler;
                            var upval_a_1 = list_a;
                            var upval_b_1 = list_d_a;
                            var upval_st_3 = state;
                            var r = function () { return run_monad_helper(upval_rt_2, upval_op_2, upval_a_1, upval_st_3, upval_b_1); };
                            return trampoline_delay(r);
                        }
                        else {
                            var upval_rt_3 = return_handler;
                            var upval_op_3 = op_handler;
                            var upval_a_2 = list_a;
                            var upval_b_2 = list_d_a;
                            var upval_st_4 = state;
                            var upval_nt_1 = next;
                            var x_14 = new_atom('序甲');
                            var r = function () { return run_monad_helper(upval_rt_3, upval_op_3, upval_a_2, upval_st_4, new_data(function_atom, new_list(new_list(x_14), make_bind(new_list(make_quote(upval_b_2), x_14), make_quote(upval_nt_1))))); };
                            return trampoline_delay(r);
                        }
                    }
                }
            }
        }
    }
    if (next === false) {
        return trampoline_delay(function () { return op_handler(code, state, return_handler); });
    }
    else {
        return trampoline_delay(function () { return op_handler(code, state, function (val2, state2) { return trampoline_delay(function () { return run_monad_helper(return_handler, op_handler, apply(next, [val2]), state2); }); }); });
    }
}
function run_monad_trampoline(return_handler, op_handler, code, state) {
    return run_monad_helper(return_handler, op_handler, code, state);
}
exports.run_monad_trampoline = run_monad_trampoline;
function run_monad_stackoverflow(return_handler, op_handler, code, state) {
    return run_trampoline(run_monad_helper((function (v, s) { return trampoline_return(return_handler(v, s)); }), (function (op, st, rs) { return trampoline_return(op_handler(op, st, function (v, s) { return run_trampoline(rs(v, s)); })); }), code, state));
}
exports.run_monad_stackoverflow = run_monad_stackoverflow;
