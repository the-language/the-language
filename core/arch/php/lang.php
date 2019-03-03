<?php
namespace be4f692e;
function ERROR() {
}
function ASSERT($x) {
    if (!$x) {
        return ERROR();
    }
}
$symbol_t = 0;
$construction_t = 1;
$null_t = 2;
$data_t = 3;
$error_t = 4;
$just_t = 5;
$delay_evaluate_t = 6;
$delay_builtin_func_t = 7;
$delay_builtin_form_t = 8;
$delay_apply_t = 9;
function new_symbol($x) {
    return array($symbol_t, $x);
}
function symbol_p($x) {
    return $x[0] === 0;
}
function un_symbol($x) {
    return $x[1];
}
function new_construction($x, $y) {
    return array($construction_t, $x, $y);
}
function construction_p($x) {
    return $x[0] === $construction_t;
}
function construction_head($x) {
    return $x[1];
}
function construction_tail($x) {
    return $x[2];
}
$null_v = array($null_t);
function null_p($x) {
    return $x[0] === $null_t;
}
function new_data($x, $y) {
    return array($data_t, $x, $y);
}
function data_p($x) {
    return $x[0] === $data_t;
}
function data_name($x) {
    return $x[1];
}
function data_list($x) {
    return $x[2];
}
function new_error($x, $y) {
    return array($error_t, $x, $y);
}
function error_p($x) {
    return $x[0] === $error_t;
}
function error_name($x) {
    return $x[1];
}
function error_list($x) {
    return $x[2];
}
function lang_set_do($x, $y) {
    if ($x === $y) {
        return;
    }
    $x[0] = $just_t;
    $x[1] = $y;
    $x[2] = $undefined;
    $x[3] = $undefined;
}
function just_p($x) {
    return $x[0] === $just_t;
}
function un_just($x) {
    return $x[1];
}
function evaluate($x, $y) {
    return array($delay_evaluate_t, $x, $y);
}
function delay_evaluate_p($x) {
    return $x[0] === $delay_evaluate_t;
}
function delay_evaluate_env($x) {
    return $x[1];
}
function delay_evaluate_x($x) {
    return $x[2];
}
function builtin_form_apply($x, $y, $z) {
    return array($delay_builtin_form_t, $x, $y, $z);
}
function delay_builtin_form_p($x) {
    return $x[0] === $delay_builtin_form_t;
}
function delay_builtin_form_env($x) {
    return $x[1];
}
function delay_builtin_form_f($x) {
    return $x[2];
}
function delay_builtin_form_xs($x) {
    return $x[3];
}
function builtin_func_apply($x, $y) {
    return array($delay_builtin_func_t, $x, $y);
}
function delay_builtin_func_p($x) {
    return $x[0] === $delay_builtin_func_t;
}
function delay_builtin_func_f($x) {
    return $x[1];
}
function delay_builtin_func_xs($x) {
    return $x[2];
}
function apply($f, $xs) {
    return array($delay_apply_t, $f, $xs);
}
function delay_apply_p($x) {
    return $x[0] === $delay_apply_t;
}
function delay_apply_f($x) {
    return $x[1];
}
function delay_apply_xs($x) {
    return $x[2];
}
function force_all_rec($raw) {
    $x = force_all($raw);
    if (data_p($x)) {
        $a = $x[1];
        $d = $x[2];
        $x[1] = force_all_rec($a);
        $x[2] = force_all_rec($d);
        return $x;
    }
    else if (error_p($x)) {
        $a = $x[1];
        $d = $x[2];
        $x[1] = force_all_rec($a);
        $x[2] = force_all_rec($d);
        return $x;
    }
    else if (construction_p($x)) {
        $a = $x[1];
        $d = $x[2];
        $x[1] = force_all_rec($a);
        $x[2] = force_all_rec($d);
        return $x;
    }
    return $x;
}
$system_symbol = new_symbol("太始初核");
$name_symbol = new_symbol("符名");
$function_symbol = new_symbol("化滅");
$form_symbol = new_symbol("式形");
$equal_symbol = new_symbol("等同");
$evaluate_sym = new_symbol("解算");
$theThing_symbol = new_symbol("特定其物");
$something_symbol = new_symbol("省略一物");
$mapping_symbol = new_symbol("映表");
$if_symbol = new_symbol("若");
$typeAnnotation_symbol = new_symbol("一類何物");
$isOrNot_symbol = new_symbol("是非");
$sub_symbol = new_symbol("其子");
$true_symbol = new_symbol("陽");
$false_symbol = new_symbol("陰");
$quote_symbol = new_symbol("引用");
$apply_symbol = new_symbol("應用");
$null_symbol = new_symbol("空");
$construction_symbol = new_symbol("連");
$data_symbol = new_symbol("構");
$error_symbol = new_symbol("誤");
$symbol_symbol = new_symbol("詞素");
$list_symbol = new_symbol("列");
$head_symbol = new_symbol("首");
$tail_symbol = new_symbol("尾");
$thing_symbol = new_symbol("物");
$theWorldStopped_symbol = new_symbol("宇宙亡矣");
$effect_symbol = new_symbol("效應");
$sequentialWordFormation_symbol = new_symbol("為符名連");
$inputOutput_symbol = new_symbol("出入改滅");
$the_world_stopped_v = new_error($system_symbol, new_list($theWorldStopped_symbol, $something_symbol));
function systemName_make($x) {
    return new_data($name_symbol, new_list($system_symbol, $x));
}
function make_builtin_f_new_sym_f($x_sym) {
    return systemName_make(new_list($typeAnnotation_symbol, new_list($function_symbol, $something_symbol, $x_sym), $theThing_symbol));
}
function make_builtin_f_get_sym_f($t_sym, $x_sym) {
    return systemName_make(new_list($typeAnnotation_symbol, new_list($function_symbol, new_list($t_sym), $something_symbol), $x_sym));
}
function make_builtin_f_p_sym_f($t_sym) {
    return systemName_make(new_list($typeAnnotation_symbol, $function_symbol, new_list($isOrNot_symbol, new_list($typeAnnotation_symbol, $t_sym, $something_symbol))));
}
$new_data_function_builtin_systemName = make_builtin_f_new_sym_f($data_symbol);
$data_name_function_builtin_systemName = make_builtin_f_get_sym_f($data_symbol, $name_symbol);
$data_list_function_builtin_systemName = make_builtin_f_get_sym_f($data_symbol, $list_symbol);
$data_p_function_builtin_systemName = make_builtin_f_p_sym_f($data_symbol);
$new_error_function_builtin_systemName = make_builtin_f_new_sym_f($error_symbol);
$error_name_function_builtin_systemName = make_builtin_f_get_sym_f($error_symbol, $name_symbol);
$error_list_function_builtin_systemName = make_builtin_f_get_sym_f($error_symbol, $list_symbol);
$error_p_function_builtin_systemName = make_builtin_f_p_sym_f($error_symbol);
$new_construction_function_builtin_systemName = make_builtin_f_new_sym_f($construction_symbol);
$construction_p_function_builtin_systemName = make_builtin_f_p_sym_f($construction_symbol);
$construction_head_function_builtin_systemName = make_builtin_f_get_sym_f($construction_symbol, $head_symbol);
$construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f($construction_symbol, $tail_symbol);
$symbol_p_function_builtin_systemName = make_builtin_f_p_sym_f($symbol_symbol);
$null_p_function_builtin_systemName = make_builtin_f_p_sym_f($null_symbol);
$equal_p_function_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, $function_symbol, new_list($isOrNot_symbol, $equal_symbol)));
$apply_function_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, new_list($function_symbol, new_construction($function_symbol, $something_symbol), $something_symbol), $apply_symbol));
$evaluate_function_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, $function_symbol, $evaluate_sym));
$list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f($list_symbol, new_list($typeAnnotation_symbol, $thing_symbol, $something_symbol));
$if_function_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, $function_symbol, $if_symbol));
$quote_form_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, $form_symbol, $quote_symbol));
$lambda_form_builtin_systemName = systemName_make(new_list($typeAnnotation_symbol, new_list($form_symbol, new_list($function_symbol, $something_symbol, $function_symbol)), $theThing_symbol));
$function_builtin_use_systemName = systemName_make(new_list($form_symbol, new_list($system_symbol, $function_symbol)));
$form_builtin_use_systemName = systemName_make(new_list($form_symbol, new_list($system_symbol, $form_symbol)));
$form_use_systemName = systemName_make(new_list($form_symbol, $form_symbol));
$false_v = new_data($false_symbol, new_list());
$true_v = new_data($true_symbol, new_list());
function symbol_equal_p($x, $y) {
    if ($x === $y) {
        return true;
    }
    if (un_symbol($x) === un_symbol($y)) {
        lang_set_do($x, $y);
        return true;
    }
    else {
        return false;
    }
}
function jsArray_to_list($xs) {
    $ret = $null_v;
    for ($i = count($xs) - 1; $i >= 0; $i--) {
        $ret = new_construction($xs[$i], $ret);
    }
    return $ret;
}
function list_to_jsArray($xs, $k_done, $k_tail) {
    $ret = array();
    while (construction_p($xs)) {
        array_push($ret, construction_head($xs));
        $xs = construction_tail($xs);
    }
    if (null_p($xs)) {
        return k_done($ret);
    }
    return k_tail($ret, $xs);
}
function maybe_list_to_jsArray($xs) {
    return list_to_jsArray($xs, function ($xs){
    return xs;
    }, function ($xs, $x){
    return false;
    });
}
function new_list($xs) {
    return jsArray_to_list($xs);
}
function un_just_all($raw) {
    $x = $raw;
    $xs = array();
    while (just_p($x)) {
        array_push($xs, $x);
        $x = un_just($x);
    }
    for ($i = 0; $i < count($xs); $i++) {
        lang_set_do($xs[$i], $x);
    }
    return $x;
}
function any_delay_just_p($x) {
    return just_p($x) || delay_evaluate_p($x) || delay_builtin_form_p($x) || delay_builtin_func_p($x) || delay_apply_p($x);
}
function force_all($raw, $parents_history = array(), $ref_novalue_replace = array(false, false)) {
    $history = array();
    $x = $raw;
    $xs = array();
    function replace_this_with_stopped() {
        $ref_novalue_replace[1] = true;
        lang_set_do($x, $the_world_stopped_v);
        for ($i = 0; $i < count($xs); $i++) {
            lang_set_do($xs[$i], $the_world_stopped_v);
        }
        return $the_world_stopped_v;
    }
    function make_history() {
        $ret = array();
        foreach ($history as $x_id) {
            $ret[$x_id] = true;
        }
        foreach ($parents_history as $x_id) {
            $ret[$x_id] = true;
        }
        return $ret;
    }
    while (any_delay_just_p($x)) {
        $x_id = simple_print($x);
        if ($parents_history[$x_id] === true) {
            return replace_this_with_stopped();
        }
        if ($history[$x_id] === true) {
            $ref_novalue_replace[0] = true;
            if (delay_evaluate_p($x)) {
                return replace_this_with_stopped();
            }
            else if (delay_builtin_func_p($x)) {
                $f = delay_builtin_func_f($x);
                $xs = delay_builtin_func_xs($x);
                $elim_s = array($data_name_function_builtin_systemName,
                    $data_list_function_builtin_systemName,
                    $data_p_function_builtin_systemName,
                    $error_name_function_builtin_systemName,
                    $error_list_function_builtin_systemName,
                    $error_p_function_builtin_systemName,
                    $construction_p_function_builtin_systemName,
                    $construction_head_function_builtin_systemName,
                    $construction_tail_function_builtin_systemName,
                    $symbol_p_function_builtin_systemName,
                    $null_p_function_builtin_systemName);
                $is_elim = false;
                for ($i = 0; $i < count($elim_s); $i++) {
                    if (jsbool_equal_p($elim_s[$i], $f)) {
                        $is_elim = true;
                    }
                }
                if ($is_elim) {
                    ASSERT(count($xs) === 1);
                    ASSERT($ref_novalue_replace[1] === false);
                    $inner = force_all($xs[0], make_history(), $ref_novalue_replace);
                    if ($ref_novalue_replace[1]) {
                        return force_all(builtin_func_apply($f, array($inner)));
                    }
                    else {
                        return ERROR();
                    }
                }
                if (jsbool_equal_p($f, $equal_p_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (jsbool_equal_p($f, $apply_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (jsbool_equal_p($f, $evaluate_function_builtin_systemName)) {
                    return replace_this_with_stopped();
                }
                else if (jsbool_equal_p($f, $if_function_builtin_systemName)) {
                    ASSERT(count($xs) === 3);
                    ASSERT($ref_novalue_replace[1] === false);
                    $tf = force_all($xs[0], make_history(), $ref_novalue_replace);
                    if ($ref_novalue_replace[1]) {
                        return force_all(builtin_func_apply($if_function_builtin_systemName, array($tf, $xs[1], $xs[2])));
                    }
                    else {
                        return ERROR();
                    }
                }
                return ERROR();
            }
            else if (delay_builtin_form_p($x)) {
                return replace_this_with_stopped();
            }
            else if (delay_apply_p($x)) {
                return replace_this_with_stopped();
            }
            return ERROR();
        }
        $history[$x_id] = true;
        array_push($xs, $x);
        $x = force1($x);
    }
    for ($i = 0; $i < count($xs); $i++) {
        lang_set_do($xs[$i], $x);
    }
    return $x;
}
function force1($raw) {
    $x = un_just_all($raw);
    $ret;
    ASSERT(!just_p($x));
    if (delay_evaluate_p($x)) {
        $ret = real_evaluate(delay_evaluate_env($x), delay_evaluate_x($x));
    }
    else if (delay_builtin_form_p($x)) {
        $ret = real_builtin_form_apply(delay_builtin_form_env($x), delay_builtin_form_f($x), delay_builtin_form_xs($x));
    }
    else if (delay_builtin_func_p($x)) {
        $ret = real_builtin_func_apply(delay_builtin_func_f($x), delay_builtin_func_xs($x));
    }
    else if (delay_apply_p($x)) {
        $ret = real_apply(delay_apply_f($x), delay_apply_xs($x));
    }
    else {
        $ret = $x;
    }
    $ret = un_just_all($ret);
    lang_set_do($x, $ret);
    return $ret;
}
$env_null_v = array();
function env_set($env, $key, $val) {
    $ret = array();
    for ($i = 0; $i < count($env); $i = $i + 2) {
        if (jsbool_equal_p($env[$i + 0], $key)) {
            $ret[$i + 0] = $key;
            $ret[$i + 1] = $val;
            for ($i = $i + 2; $i < count($env); $i = $i + 2) {
                $ret[$i + 0] = $env[$i + 0];
                $ret[$i + 1] = $env[$i + 1];
            }
            return $ret;
        }
        else {
            $ret[$i + 0] = $env[$i + 0];
            $ret[$i + 1] = $env[$i + 1];
        }
    }
    $ret[count($env) + 0] = $key;
    $ret[count($env) + 1] = $val;
    return $ret;
}
function env_get($env, $key, $default_v) {
    for ($i = 0; $i < count($env); $i = $i + 2) {
        if (jsbool_equal_p($env[$i + 0], $key)) {
            return $env[$i + 1];
        }
    }
    return $default_v;
}
function must_env_get($env, $key) {
    for ($i = 0; $i < count($env); $i = $i + 2) {
        if (jsbool_equal_p($env[$i + 0], $key)) {
            return $env[$i + 1];
        }
    }
    return ERROR();
}
function env2val($env) {
    $ret = $null_v;
    for ($i = 0; $i < count($env); $i = $i + 2) {
        $ret = new_construction(new_list($env[$i + 0], $env[$i + 1]), $ret);
    }
    return new_data($mapping_symbol, new_list($ret));
}
function env_foreach($env, $f) {
    for ($i = 0; $i < count($env); $i = $i + 2) {
        f($env[$i + 0], $env[$i + 1]);
    }
}
function val2env($x) {
    $x = force_all($x);
    if (!data_p($x)) {
        return false;
    }
    $s = force_all(data_name($x));
    if (!symbol_p($s)) {
        return false;
    }
    if (!symbol_equal_p($s, $mapping_symbol)) {
        return false;
    }
    $s = force_all(data_list($x));
    if (!construction_p($s)) {
        return false;
    }
    if (!null_p(force_all(construction_tail($s)))) {
        return false;
    }
    $ret = array();
    $xs = force_all(construction_head($s));
    while (!null_p($xs)) {
        if (!construction_p($xs)) {
            return false;
        }
        $x = force_all(construction_head($xs));
        $xs = force_all(construction_tail($xs));
        if (!construction_p($x)) {
            return false;
        }
        $k = construction_head($x);
        $x = force_all(construction_tail($x));
        if (!construction_p($x)) {
            return false;
        }
        $v = construction_head($x);
        if (!null_p(force_all(construction_tail($x)))) {
            return false;
        }
        $not_breaked = true;
        for ($i = 0; $i < count($ret); $i = $i + 2) {
            if (jsbool_equal_p($ret[$i + 0], $k)) {
                $ret[$i + 1] = $v;
                $not_breaked = false;
                break;
            }
        }
        if ($not_breaked) {
            array_push($ret, $k);
            array_push($ret, $v);
        }
    }
    return $ret;
}
function real_evaluate($env, $raw) {
    $x = force1($raw);
    if (any_delay_just_p($x)) {
        return evaluate($env, $x);
    }
    $error_v = new_error($system_symbol, new_list($function_builtin_use_systemName, new_list($evaluate_function_builtin_systemName, new_list(env2val($env), $x))));
    if (construction_p($x)) {
        $xs = array();
        $rest = $x;
        while (!null_p($rest)) {
            if (any_delay_just_p($rest)) {
                return evaluate($env, $x);
            }
            else if (construction_p($rest)) {
                array_push($xs, construction_head($rest));
                $rest = force1(construction_tail($rest));
            }
            else {
                return $error_v;
            }
        }
        if (jsbool_equal_p($xs[0], $form_builtin_use_systemName)) {
            if (count($xs) === 1) {
                return $error_v;
            }
            $f = $xs[1];
            $args = array();
            for ($i = 2; $i < count($xs); $i++) {
                $args[$i - 2] = $xs[$i];
            }
            return builtin_form_apply($env, $f, $args);
        }
        else if (jsbool_equal_p($xs[0], $form_use_systemName)) {
            if (count($xs) === 1) {
                return $error_v;
            }
            $f = force_all(evaluate($env, $xs[1]));
            if (!data_p($f)) {
                return $error_v;
            }
            $f_type = force1(data_name($f));
            if (any_delay_just_p($f_type)) {
                return evaluate($env, $x);
            }
            if (!symbol_p($f_type)) {
                return $error_v;
            }
            if (!symbol_equal_p($f_type, $form_symbol)) {
                return $error_v;
            }
            $f_list = force1(data_list($f));
            if (any_delay_just_p($f_list)) {
                return evaluate($env, $x);
            }
            if (!construction_p($f_list)) {
                return $error_v;
            }
            $f_x = construction_head($f_list);
            $f_list_cdr = force1(construction_tail($f_list));
            if (any_delay_just_p($f_list_cdr)) {
                return evaluate($env, $x);
            }
            if (!null_p($f_list_cdr)) {
                return $error_v;
            }
            $args = array(env2val($env));
            for ($i = 2; $i < count($xs); $i++) {
                $args[$i - 1] = $xs[$i];
            }
            return apply($f_x, $args);
        }
        else if (jsbool_equal_p($xs[0], $function_builtin_use_systemName)) {
            if (count($xs) === 1) {
                return $error_v;
            }
            $f = $xs[1];
            $args = array();
            for ($i = 2; $i < count($xs); $i++) {
                $args[$i - 2] = evaluate($env, $xs[$i]);
            }
            return builtin_func_apply($f, $args);
        }
        else {
            $f = evaluate($env, $xs[0]);
            $args = array();
            for ($i = 1; $i < count($xs); $i++) {
                $args[$i - 1] = evaluate($env, $xs[$i]);
            }
            return apply($f, $args);
        }
    }
    else if (null_p($x)) {
        return $x;
    }
    else if (name_p($x)) {
        return env_get($env, $x, $error_v);
    }
    else if (error_p($x)) {
        return $error_v;
    }
    return ERROR();
}
function name_p($x) {
    return symbol_p($x) || data_p($x);
}
function make_builtin_p_func($p_sym, $p_jsfunc) {
    return array($p_sym,
        1,
        function ($x, $error_v) {
            $x = force1($x);
            if (any_delay_just_p($x)) {
                return builtin_func_apply($p_sym, array($x));
            }
            if (p_jsfunc($x)) {
                return $true_v;
            }
            return $false_v;
        });
}
function make_builtin_get_func($f_sym, $p_jsfunc, $f_jsfunc) {
    return array($f_sym,
        1,
        function ($x, $error_v) {
            $x = force1($x);
            if (any_delay_just_p($x)) {
                return builtin_func_apply($f_sym, array($x));
            }
            if (p_jsfunc($x)) {
                return f_jsfunc($x);
            }
            return $error_v;
        });
}
$real_builtin_func_apply_s = [
    make_builtin_p_func($data_p_function_builtin_systemName, $data_p),
    array($new_data_function_builtin_systemName, 2, $new_data),
    make_builtin_get_func($data_name_function_builtin_systemName, $data_p, $data_name),
    make_builtin_get_func($data_list_function_builtin_systemName, $data_p, $data_list),
    make_builtin_p_func($error_p_function_builtin_systemName, $error_p),
    array($new_error_function_builtin_systemName, 2, $new_error),
    make_builtin_get_func($error_name_function_builtin_systemName, $error_p, $error_name),
    make_builtin_get_func($error_list_function_builtin_systemName, $error_p, $error_list),
    make_builtin_p_func($null_p_function_builtin_systemName, $null_p),
    array($new_construction_function_builtin_systemName, 2, $new_construction),
    make_builtin_p_func($construction_p_function_builtin_systemName, $construction_p),
    make_builtin_get_func($construction_head_function_builtin_systemName, $construction_p, $construction_head),
    make_builtin_get_func($construction_tail_function_builtin_systemName, $construction_p, $construction_tail),
    array($equal_p_function_builtin_systemName, 2, function ($x, $y, $error_v) {
            if ($x === $y) {
                return $true_v;
            }
            $x = force1($x);
            $y = force1($y);
            if (any_delay_just_p($x) || any_delay_just_p($y)) {
                return builtin_func_apply($equal_p_function_builtin_systemName, array($x, $y));
            }
            if ($x === $y) {
                return $true_v;
            }
            function H_if($b, $x, $y) {
                return builtin_func_apply($if_function_builtin_systemName, array($b, $x, $y));
            }
            function H_and($x, $y) {
                return H_if($x, $y, $false_v);
            }
            ASSERT(!any_delay_just_p($x));
            function end_2($x, $y, $f1, $f2) {
                return H_and(builtin_func_apply($equal_p_function_builtin_systemName, array(f1($x), f1($y))), builtin_func_apply($equal_p_function_builtin_systemName, array(f2($x), f2($y))));
            }
            if (null_p($x)) {
                if (!null_p($x)) {
                    return $false_v;
                }
                return $true_v;
            }
            else if (symbol_p($x)) {
                if (!symbol_p($y)) {
                    return $false_v;
                }
                return symbol_equal_p($x, $y) ? $true_v : $false_v;
            }
            else if (data_p($x)) {
                if (!data_p($y)) {
                    return $false_v;
                }
                return end_2($x, $y, $data_name, $data_list);
            }
            else if (construction_p($x)) {
                if (!construction_p($y)) {
                    return $false_v;
                }
                return end_2($x, $y, $construction_head, $construction_tail);
            }
            else if (error_p($x)) {
                if (!error_p($y)) {
                    return $false_v;
                }
                return end_2($x, $y, $error_name, $error_list);
            }
            return ERROR();
        }),
    array($apply_function_builtin_systemName, 2, function ($f, $xs, $error_v) {
            $jslist = array();
            $iter = force_all($xs);
            while (construction_p($iter)) {
                array_push($jslist, construction_head($iter));
                $iter = force_all(construction_tail($iter));
            }
            if (!null_p($iter)) {
                return $error_v;
            }
            return apply($f, $jslist);
        }),
    array($evaluate_function_builtin_systemName, 2, function ($env, $x, $error_v) {
            $maybeenv = val2env($env);
            if ($maybeenv === false) {
                return $error_v;
            }
            return evaluate($maybeenv, $x);
        }),
    make_builtin_p_func($symbol_p_function_builtin_systemName, $symbol_p),
    array($list_chooseOne_function_builtin_systemName, 1, function ($xs, $error_v) {
            $xs = force1($xs);
            if (any_delay_just_p($xs)) {
                return builtin_func_apply($list_chooseOne_function_builtin_systemName, array($xs));
            }
            if (!construction_p($xs)) {
                return $error_v;
            }
            return construction_head($xs);
        }),
    array($if_function_builtin_systemName, 3, function ($b, $x, $y, $error_v) {
            $b = force1($b);
            if (any_delay_just_p($b)) {
                return builtin_func_apply($if_function_builtin_systemName, array($b, $x, $y));
            }
            if (!data_p($b)) {
                return $error_v;
            }
            $nam = force_all(data_name($b));
            if (!symbol_p($nam)) {
                return $error_v;
            }
            if (symbol_equal_p($nam, $true_symbol)) {
                return $x;
            }
            if (symbol_equal_p($nam, $false_symbol)) {
                return $y;
            }
            return $error_v;
        }),
];
function real_apply($f, $xs) {
    function make_error_v() {
        return new_error($system_symbol, new_list($function_builtin_use_systemName, new_list($apply_function_builtin_systemName, new_list($f, jsArray_to_list($xs)))));
    }
    $f = force1($f);
    if (any_delay_just_p($f)) {
        return apply($f, $xs);
    }
    if (!data_p($f)) {
        return make_error_v();
    }
    $f_type = force_all(data_name($f));
    if (!(symbol_p($f_type) && symbol_equal_p($f_type, $function_symbol))) {
        return make_error_v();
    }
    $f_list = force_all(data_list($f));
    if (!construction_p($f_list)) {
        return make_error_v();
    }
    $args_pat = force_all_rec(construction_head($f_list));
    $f_list_cdr = force_all(construction_tail($f_list));
    if (!(construction_p($f_list_cdr) && null_p(force_all(construction_tail($f_list_cdr))))) {
        return make_error_v();
    }
    $f_code = construction_head($f_list_cdr);
    $env = $env_null_v;
    $xs_i = 0;
    while (!null_p($args_pat)) {
        if (name_p($args_pat)) {
            $x = $null_v;
            for ($i = count($xs) - 1; $i >= $xs_i; $i--) {
                $x = new_construction($xs[$i], $x);
            }
            $env = env_set($env, $args_pat, $x);
            $xs_i = count($xs);
            $args_pat = $null_v;
        }
        else if (construction_p($args_pat)) {
            if ($xs_i < count($xs)) {
                $x = $xs[$xs_i];
                $xs_i++;
                $env = env_set($env, construction_head($args_pat), $x);
                $args_pat = construction_tail($args_pat);
            }
            else {
                return make_error_v();
            }
        }
        else {
            return make_error_v();
        }
    }
    if (count($xs) !== $xs_i) {
        return make_error_v();
    }
    return evaluate($env, $f_code);
}
function real_builtin_func_apply($f, $xs) {
    $error_v = new_error($system_symbol, new_list($function_builtin_use_systemName, new_list($f, jsArray_to_list($xs))));
    for ($i = 0; $i < count($real_builtin_func_apply_s); $i++) {
        if (jsbool_equal_p($f, $real_builtin_func_apply_s[$i][0])) {
            $actually_length = $real_builtin_func_apply_s[$i][1];
            if (count($xs) !== $actually_length) {
                return $error_v;
            }
            $f = $real_builtin_func_apply_s[$i][2];
            if ($actually_length === 1) {
                return f($xs[0], $error_v);
            }
            else if ($actually_length === 2) {
                return f($xs[0], $xs[1], $error_v);
            }
            else if ($actually_length === 3) {
                return f($xs[0], $xs[1], $xs[2], $error_v);
            }
            return ERROR();
        }
    }
    return $error_v;
}
function real_builtin_form_apply($env, $f, $xs) {
    $error_v = new_error($system_symbol, new_list($form_builtin_use_systemName, new_list(env2val($env), $f, jsArray_to_list($xs))));
    if (jsbool_equal_p($f, $quote_form_builtin_systemName)) {
        if (count($xs) !== 1) {
            return $error_v;
        }
        return $xs[0];
    }
    else if (jsbool_equal_p($f, $lambda_form_builtin_systemName)) {
        if (count($xs) !== 2) {
            return $error_v;
        }
        return new_lambda($env, $xs[0], $xs[1], $error_v);
    }
    return $error_v;
}
function new_lambda($env, $args_pat, $body, $error_v = $undefined) {
    function make_error_v() {
        if ($error_v === $undefined) {
            return new_error($system_symbol, new_list($form_builtin_use_systemName, new_list(env2val($env), $lambda_form_builtin_systemName, jsArray_to_list(array($args_pat, $body)))));
        }
        else {
            return $error_v;
        }
    }
    function make_quote($x) {
        return new_list($form_builtin_use_systemName, $quote_form_builtin_systemName, $x);
    }
    $args_pat = force_all_rec($args_pat);
    $args_pat_vars = array();
    $args_pat_is_dot = false;
    $args_pat_iter = $args_pat;
    while (!null_p($args_pat_iter)) {
        if (name_p($args_pat_iter)) {
            array_push($args_pat_vars, $args_pat_iter);
            $args_pat_is_dot = true;
            $args_pat_iter = $null_v;
        }
        else if (construction_p($args_pat_iter)) {
            array_push($args_pat_vars, construction_head($args_pat_iter));
            $args_pat_iter = construction_tail($args_pat_iter);
        }
        else {
            return make_error_v();
        }
    }
    $args_pat_vars_val = $args_pat;
    if ($args_pat_is_dot) {
        $args_pat_vars_val = jsArray_to_list($args_pat_vars);
    }
    $env_vars = array();
    env_foreach($env, function ($k, $v) {
        for ($i = 0; $i < count($args_pat_vars); $i++) {
            if (jsbool_equal_p($args_pat_vars[$i], $k)) {
                return;
            }
        }
        array_push($env_vars, $k);
    });
    $new_args_pat = $args_pat_vars_val;
    for ($i = count($env_vars) - 1; $i >= 0; $i--) {
        $new_args_pat = new_construction($env_vars[$i], $new_args_pat);
    }
    $new_args = $args_pat_vars_val;
    for ($i = count($env_vars) - 1; $i >= 0; $i--) {
        $new_args = new_construction(make_quote(must_env_get($env, $env_vars[$i])), $new_args);
    }
    return new_data($function_symbol, new_list($args_pat, new_construction(make_quote(new_data($function_symbol, new_list($new_args_pat, $body))), $new_args)));
}
function jsbool_equal_p($x, $y) {
    if ($x === $y) {
        return true;
    }
    $x = force_all($x);
    $y = force_all($y);
    if ($x === $y) {
        return true;
    }
    function end_2($x, $y, $f1, $f2) {
        if (jsbool_equal_p(f1($x), f1($y)) && jsbool_equal_p(f2($x), f2($y))) {
            lang_set_do($x, $y);
            return true;
        }
        else {
            return false;
        }
    }
    if (null_p($x)) {
        if (!null_p($y)) {
            return false;
        }
        lang_set_do($x, $null_v);
        lang_set_do($y, $null_v);
        return true;
    }
    else if (symbol_p($x)) {
        if (!symbol_p($y)) {
            return false;
        }
        return symbol_equal_p($x, $y);
    }
    else if (construction_p($x)) {
        if (!construction_p($y)) {
            return false;
        }
        return end_2($x, $y, $construction_head, $construction_tail);
    }
    else if (error_p($x)) {
        if (!error_p($y)) {
            return false;
        }
        return end_2($x, $y, $error_name, $error_list);
    }
    else if (data_p($x)) {
        if (!data_p($y)) {
            return false;
        }
        return end_2($x, $y, $data_name, $data_list);
    }
    return ERROR();
}
function jsbool_no_force_equal_p($x, $y) {
    if ($x === $y) {
        return true;
    }
    $x = un_just_all($x);
    $y = un_just_all($y);
    if ($x === $y) {
        return true;
    }
    function end_2($x, $y, $f1, $f2) {
        if (jsbool_no_force_equal_p(f1($x), f1($y)) && jsbool_no_force_equal_p(f2($x), f2($y))) {
            lang_set_do($x, $y);
            return true;
        }
        else {
            return false;
        }
    }
    if (null_p($x)) {
        if (!null_p($y)) {
            return false;
        }
        lang_set_do($x, $null_v);
        lang_set_do($y, $null_v);
        return true;
    }
    else if (symbol_p($x)) {
        if (!symbol_p($y)) {
            return false;
        }
        return symbol_equal_p($x, $y);
    }
    else if (construction_p($x)) {
        if (!construction_p($y)) {
            return false;
        }
        return end_2($x, $y, $construction_head, $construction_tail);
    }
    else if (error_p($x)) {
        if (!error_p($y)) {
            return false;
        }
        return end_2($x, $y, $error_name, $error_list);
    }
    else if (data_p($x)) {
        if (!data_p($y)) {
            return false;
        }
        return end_2($x, $y, $data_name, $data_list);
    }
    else if (delay_evaluate_p($x)) {
        return false;
    }
    else if (delay_builtin_func_p($x)) {
        return false;
    }
    else if (delay_builtin_form_p($x)) {
        return false;
    }
    else if (delay_apply_p($x)) {
        return false;
    }
    return ERROR();
}
function simple_print($x) {
    $x = un_just_all($x);
    $temp = "";
    $prefix = "";
    if (null_p($x)) {
        return "()";
    }
    else if (construction_p($x)) {
        $temp .= "(";
        $prefix .= "";
        while (construction_p($x)) {
            $temp .= $prefix .= simple_print(construction_head($x));
            $prefix .= " ";
            $x = un_just_all(construction_tail($x));
        }
        if (null_p($x)) {
            $temp .= ")";
        }
        else {
            $temp .= " . " .= simple_print($x) .= ")";
        }
        return $temp;
    }
    else if (data_p($x)) {
        return "#" .= simple_print(new_construction(data_name($x), data_list($x)));
    }
    else if (error_p($x)) {
        return "!" .= simple_print(new_construction(error_name($x), error_list($x)));
    }
    else if (symbol_p($x)) {
        return un_symbol($x);
    }
    else if (delay_evaluate_p($x)) {
        return "$(" .= simple_print(env2val(delay_evaluate_env($x))) .= " " .= simple_print(delay_evaluate_x($x)) .= ")";
    }
    else if (delay_builtin_func_p($x)) {
        return "%(" .= simple_print(delay_builtin_func_f($x)) .= " " .= simple_print(jsArray_to_list(delay_builtin_func_xs($x))) .= ")";
    }
    else if (delay_builtin_form_p($x)) {
        return "@(" .= simple_print(env2val(delay_builtin_form_env($x))) .= " " .= simple_print(delay_builtin_form_f($x)) .= " " .= simple_print(jsArray_to_list(delay_builtin_form_xs($x))) .= ")";
    }
    else if (delay_apply_p($x)) {
        return "^(" .= simple_print(delay_apply_f($x)) .= " " .= simple_print(jsArray_to_list(delay_apply_xs($x))) .= ")";
    }
    return ERROR();
}
function simple_print_force_all_rec($x) {
    return simple_print(force_all_rec($x));
}
function simple_parse($x) {
    $state_const = $x;
    $state = 0;
    function eof() {
        return count($state_const) === $state;
    }
    function get() {
        ASSERT(!eof());
        $ret = $state_const[$state];
        $state++;
        return $ret;
    }
    function put($x) {
        ASSERT($state_const[$state - 1] === $x);
        $state--;
    }
    function parse_error() {
    }
    function a_space_p($x) {
        return $x .= " " || $x .= "\n" || $x .= "\t" || $x .= "\r";
    }
    function space() {
        if (eof()) {
            return false;
        }
        $x = get();
        if (!a_space_p($x)) {
            put($x);
            return false;
        }
        while (a_space_p($x) && !eof()) {
            $x = get();
        }
        if (!a_space_p($x)) {
            put($x);
        }
        return true;
    }
    function symbol() {
        if (eof()) {
            return false;
        }
        $x = get();
        $ret = "";
        if (!a_symbol_p($x)) {
            put($x);
            return false;
        }
        while (a_symbol_p($x) && !eof()) {
            $ret .= $x;
            $x = get();
        }
        if (a_symbol_p($x)) {
            $ret .= $x;
        }
        else {
            put($x);
        }
        return new_symbol($ret);
    }
    function list() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "(") {
            put($x);
            return false;
        }
        $HOLE = new_symbol("!!@@READ||HOLE@@!!");
        $ret = $HOLE;
        function set_last($lst) {
            if ($ret === $HOLE) {
                $ret = $lst;
                return;
            }
            $x = $ret;
            while (true) {
                if (!construction_p($x)) {
                    return ERROR();
                }
                $d = construction_tail($x);
                if ($d === $HOLE) {
                    break;
                }
                $x = construction_tail($x);
            }
            if (!construction_p($x)) {
                return ERROR();
            }
            if (construction_tail($x) !== $HOLE) {
                return ERROR();
            }
            $x[2] = $lst;
        }
        function last_add($x) {
            set_last(new_construction($x, $HOLE));
        }
        while (true) {
            space();
            if (eof()) {
                return parse_error();
            }
            $x = get();
            if ($x .= ")") {
                set_last($null_v);
                return $ret;
            }
            if ($x .= ".") {
                space();
                $e = val();
                set_last($e);
                space();
                if (eof()) {
                    return parse_error();
                }
                $x = get();
                if ($x .= ")") {
                    return parse_error();
                }
                return $ret;
            }
            put($x);
            $e = val();
            last_add($e);
        }
    }
    function data() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "#") {
            put($x);
            return false;
        }
        $xs = list();
        if ($xs === false) {
            return parse_error();
        }
        if (!construction_p($xs)) {
            return parse_error();
        }
        return new_data(construction_head($xs), construction_tail($xs));
    }
    function readerror() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "!") {
            put($x);
            return false;
        }
        $xs = list();
        if ($xs === false) {
            return parse_error();
        }
        if (!construction_p($xs)) {
            return parse_error();
        }
        return new_error(construction_head($xs), construction_tail($xs));
    }
    function make_read_two($prefix, $k) {
        return function () {
            if (eof()) {
                return false;
            }
            $c = get();
            if ($c !== $prefix) {
                put($c);
                return false;
            }
            $xs = list();
            if ($xs === false) {
                return parse_error();
            }
            if (!construction_p($xs)) {
                return parse_error();
            }
            $x = construction_tail($xs);
            if (!(construction_p($x) && null_p(construction_tail($x)))) {
                return parse_error();
            }
            return k(construction_head($xs), construction_head($x));
        };
    }
    function make_read_three($prefix, $k) {
        return function () {
            if (eof()) {
                return false;
            }
            $c = get();
            if ($c !== $prefix) {
                put($c);
                return false;
            }
            $xs = list();
            if ($xs === false) {
                return parse_error();
            }
            if (!construction_p($xs)) {
                return parse_error();
            }
            $x = construction_tail($xs);
            if (!construction_p($x)) {
                return parse_error();
            }
            $x_d = construction_tail($x);
            if (!(construction_p($x_d) && null_p(construction_tail($x_d)))) {
                return parse_error();
            }
            return k(construction_head($xs), construction_head($x), construction_head($x_d));
        };
    }
    $readeval = make_read_two("$", function ($e, $x) {
        $env = val2env($e);
        if ($env === false) {
            return parse_error();
        }
        return evaluate($env, $x);
    });
    $readfuncapply = make_read_two("%", function ($f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        return builtin_func_apply($f, $jsxs);
    });
    $readformbuiltin = make_read_three("@", function ($e, $f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        $env = val2env($e);
        if ($env === false) {
            return parse_error();
        }
        return builtin_form_apply($env, $f, $jsxs);
    });
    $readapply = make_read_two("^", function ($f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        return apply($f, $jsxs);
    });
    function a_symbol_p($x) {
        if (a_space_p($x)) {
            return false;
        }
        $not_xs = array("(", ")", "!", "#", ".", "$", "%", "^", "@",
            "~", "/", "-", ">", "_", ":", "?", "[", "]", "&"
        );
        for ($i = 0; $i < count($not_xs); $i++) {
            if ($x .= $not_xs[$i]) {
                return false;
            }
        }
        return true;
    }
    function val() {
        space();
        $fs = array($list, $symbol, $data, $readerror, $readeval, $readfuncapply, $readformbuiltin, $readapply);
        for ($i = 0; $i < count($fs); $i++) {
            $x = $fs[$i]();
            if ($x !== false) {
                return $x;
            }
        }
        return parse_error();
    }
    return val();
}
function complex_parse($x) {
    $state_const = $x;
    $state = 0;
    function eof() {
        return count($state_const) === $state;
    }
    function get() {
        ASSERT(!eof());
        $ret = $state_const[$state];
        $state++;
        return $ret;
    }
    function put($x) {
        ASSERT($state_const[$state - 1] === $x);
        $state--;
    }
    function parse_error() {
    }
    function a_space_p($x) {
        return $x .= " " || $x .= "\n" || $x .= "\t" || $x .= "\r";
    }
    function space() {
        if (eof()) {
            return false;
        }
        $x = get();
        if (!a_space_p($x)) {
            put($x);
            return false;
        }
        while (a_space_p($x) && !eof()) {
            $x = get();
        }
        if (!a_space_p($x)) {
            put($x);
        }
        return true;
    }
    function symbol() {
        if (eof()) {
            return false;
        }
        $x = get();
        $ret = "";
        if (!a_symbol_p($x)) {
            put($x);
            return false;
        }
        while (a_symbol_p($x) && !eof()) {
            $ret .= $x;
            $x = get();
        }
        if (a_symbol_p($x)) {
            $ret .= $x;
        }
        else {
            put($x);
        }
        return new_symbol($ret);
    }
    function list() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "(") {
            put($x);
            return false;
        }
        $HOLE = new_symbol("!!@@READ||HOLE@@!!");
        $ret = $HOLE;
        function set_last($lst) {
            if ($ret === $HOLE) {
                $ret = $lst;
                return;
            }
            $x = $ret;
            while (true) {
                if (!construction_p($x)) {
                    return ERROR();
                }
                $d = construction_tail($x);
                if ($d === $HOLE) {
                    break;
                }
                $x = construction_tail($x);
            }
            if (!construction_p($x)) {
                return ERROR();
            }
            if (construction_tail($x) !== $HOLE) {
                return ERROR();
            }
            $x[2] = $lst;
        }
        function last_add($x) {
            set_last(new_construction($x, $HOLE));
        }
        while (true) {
            space();
            if (eof()) {
                return parse_error();
            }
            $x = get();
            if ($x .= ")") {
                set_last($null_v);
                return $ret;
            }
            if ($x .= ".") {
                space();
                $e = val();
                set_last($e);
                space();
                if (eof()) {
                    return parse_error();
                }
                $x = get();
                if ($x .= ")") {
                    return parse_error();
                }
                return $ret;
            }
            put($x);
            $e = val();
            last_add($e);
        }
    }
    function data() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "#") {
            put($x);
            return false;
        }
        $xs = list();
        if ($xs === false) {
            return parse_error();
        }
        if (!construction_p($xs)) {
            return parse_error();
        }
        return new_data(construction_head($xs), construction_tail($xs));
    }
    function readerror() {
        if (eof()) {
            return false;
        }
        $x = get();
        if ($x .= "!") {
            put($x);
            return false;
        }
        $xs = list();
        if ($xs === false) {
            return parse_error();
        }
        if (!construction_p($xs)) {
            return parse_error();
        }
        return new_error(construction_head($xs), construction_tail($xs));
    }
    function make_read_two($prefix, $k) {
        return function () {
            if (eof()) {
                return false;
            }
            $c = get();
            if ($c !== $prefix) {
                put($c);
                return false;
            }
            $xs = list();
            if ($xs === false) {
                return parse_error();
            }
            if (!construction_p($xs)) {
                return parse_error();
            }
            $x = construction_tail($xs);
            if (!(construction_p($x) && null_p(construction_tail($x)))) {
                return parse_error();
            }
            return k(construction_head($xs), construction_head($x));
        };
    }
    function make_read_three($prefix, $k) {
        return function () {
            if (eof()) {
                return false;
            }
            $c = get();
            if ($c !== $prefix) {
                put($c);
                return false;
            }
            $xs = list();
            if ($xs === false) {
                return parse_error();
            }
            if (!construction_p($xs)) {
                return parse_error();
            }
            $x = construction_tail($xs);
            if (!construction_p($x)) {
                return parse_error();
            }
            $x_d = construction_tail($x);
            if (!(construction_p($x_d) && null_p(construction_tail($x_d)))) {
                return parse_error();
            }
            return k(construction_head($xs), construction_head($x), construction_head($x_d));
        };
    }
    $readeval = make_read_two("$", function ($e, $x) {
        $env = val2env($e);
        if ($env === false) {
            return parse_error();
        }
        return evaluate($env, $x);
    });
    $readfuncapply = make_read_two("%", function ($f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        return builtin_func_apply($f, $jsxs);
    });
    $readformbuiltin = make_read_three("@", function ($e, $f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        $env = val2env($e);
        if ($env === false) {
            return parse_error();
        }
        return builtin_form_apply($env, $f, $jsxs);
    });
    $readapply = make_read_two("^", function ($f, $xs) {
        $jsxs = list_to_jsArray($xs, function ($xs){
        return xs;
        }, function ($xs, $y){
        return parse_error();
        });
        return apply($f, $jsxs);
    });
    function a_symbol_p($x) {
        if (a_space_p($x)) {
            return false;
        }
        $not_xs = array("(", ")", "!", "#", ".", "$", "%", "^", "@",
            "~", "/", "-", ">", "_", ":", "?", "[", "]", "&"
        );
        for ($i = 0; $i < count($not_xs); $i++) {
            if ($x .= $not_xs[$i]) {
                return false;
            }
        }
        return true;
    }
    function val() {
        space();
        $fs = array($list, $readsysname, $data, $readerror, $readeval, $readfuncapply, $readformbuiltin, $readapply);
        for ($i = 0; $i < count($fs); $i++) {
            $x = $fs[$i]();
            if ($x !== false) {
                return $x;
            }
        }
        return parse_error();
    }
    return val();
    function un_maybe($x) {
        if ($x === false) {
            return parse_error();
        }
        return $x;
    }
    function not_eof() {
        return !eof();
    }
    function assert_get($c) {
        un_maybe(not_eof());
        un_maybe(get() === $c);
    }
    function readsysname_no_pack() {
        if (eof()) {
            return false;
        }
        $head = get();
        if ($head .= "&") {
            un_maybe(not_eof());
            $c0 = get();
            if ($c0 .= "+") {
                $x = readsysname_no_pack_inner_must();
                return new_list($form_symbol, new_list($system_symbol, $x));
            }
            else {
                put($c0);
            }
            $x = readsysname_no_pack_inner_must();
            return new_list($form_symbol, $x);
        }
        else if ($head .= ":") {
            un_maybe(not_eof());
            $c0 = get();
            if ($c0 .= "&") {
                assert_get(">");
                $x = readsysname_no_pack_inner_must();
                return new_list($typeAnnotation_symbol, new_list($form_symbol, new_list($function_symbol, $something_symbol, $x)), $theThing_symbol);
            }
            else if ($c0 .= ">") {
                $x = readsysname_no_pack_inner_must();
                return new_list($typeAnnotation_symbol, new_list($function_symbol, $something_symbol, $x), $theThing_symbol);
            }
            else {
                put($c0);
            }
            $x = readsysname_no_pack_inner_must();
            return new_list($typeAnnotation_symbol, $x, $theThing_symbol);
        }
        else if ($head .= "+") {
            $x = readsysname_no_pack_inner_must();
            return new_list($system_symbol, $x);
        }
        else if ($head .= "[") {
            $x = readsysname_no_pack_inner_must();
            assert_get("]");
            return may_xfx_xf($x);
        }
        else if ($head .= "_") {
            assert_get(":");
            $x = readsysname_no_pack_inner_must();
            return new_list($typeAnnotation_symbol, $x, $something_symbol);
        }
        else {
            put($head);
            $x = symbol();
            if ($x === false) {
                return false;
            }
            return may_xfx_xf($x);
        }
        return ERROR();
        function readsysname_no_pack_inner_must($strict = false) {
            function readsysname_no_pack_bracket() {
                assert_get("[");
                $x = readsysname_no_pack_inner_must();
                assert_get("]");
                return $x;
            }
            $fs = $strict ? array($list, $symbol, $readsysname_no_pack_bracket, $data,
                $readerror, $readeval, $readfuncapply, $readformbuiltin, $readapply) :
                array($list, $readsysname_no_pack, $data,
                    $readerror, $readeval, $readfuncapply, $readformbuiltin, $readapply);
            for ($i = 0; $i < count($fs); $i++) {
                $x = $fs[$i]();
                if ($x !== false) {
                    return $x;
                }
            }
            return parse_error();
        }
        function may_xfx_xf($x) {
            if (eof()) {
                return $x;
            }
            $head = get();
            if ($head .= ".") {
                $y = readsysname_no_pack_inner_must();
                return new_list($typeAnnotation_symbol, new_list($function_symbol, new_list($x), $something_symbol), $y);
            }
            else if ($head .= ":") {
                $y = readsysname_no_pack_inner_must();
                return new_list($typeAnnotation_symbol, $y, $x);
            }
            else if ($head .= "~") {
                return new_list($isOrNot_symbol, $x);
            }
            else if ($head .= "@") {
                $y = readsysname_no_pack_inner_must();
                return new_list($typeAnnotation_symbol, new_list($function_symbol, new_construction($x, $something_symbol), $something_symbol), $y);
            }
            else if ($head .= "?") {
                return new_list($typeAnnotation_symbol, $function_symbol, new_list($isOrNot_symbol, $x));
            }
            else if ($head .= "/") {
                $ys = array();
                while (true) {
                    $y = readsysname_no_pack_inner_must(true);
                    array_push($ys, $y);
                    if (eof()) {
                        break;
                    }
                    $c0 = get();
                    if ($c0 .= "/") {
                        put($c0);
                        break;
                    }
                }
                return new_list($sub_symbol, $x, jsArray_to_list($ys));
            }
            else {
                put($head);
                return $x;
            }
            return ERROR();
        }
        return ERROR();
    }
    function readsysname() {
        $x = readsysname_no_pack();
        if ($x === false) {
            return false;
        }
        if (symbol_p($x)) {
            return $x;
        }
        return systemName_make($x);
    }
}
function complex_print($val) {
    function print_sys_name($x, $where) {
        if (symbol_p($x)) {
            return un_symbol($x);
        }
        function inner_bracket($x) {
            if ($where .= "inner") {
                return "[" .= $x .= "]";
            }
            else if ($where .= "top") {
                return $x;
            }
            return ERROR();
        }
        $maybe_xs = maybe_list_to_jsArray($x);
        if ($maybe_xs !== false && count($maybe_xs) === 3 && jsbool_no_force_equal_p($maybe_xs[0], $typeAnnotation_symbol)) {
            $maybe_lst_2 = maybe_list_to_jsArray($maybe_xs[1]);
            if ($maybe_lst_2 !== false && count($maybe_lst_2) === 3 && jsbool_no_force_equal_p($maybe_lst_2[0], $function_symbol)) {
                $var_2_1 = $maybe_lst_2[1];
                $maybe_lst_3 = maybe_list_to_jsArray($var_2_1);
                if ($maybe_lst_3 !== false && count($maybe_lst_3) === 1 && jsbool_no_force_equal_p($maybe_lst_2[2], $something_symbol)) {
                    return inner_bracket(print_sys_name($maybe_lst_3[0], "inner") .= "." .= print_sys_name($maybe_xs[2], "inner"));
                }
                else if (construction_p($var_2_1) && jsbool_no_force_equal_p(construction_tail($var_2_1), $something_symbol) && jsbool_no_force_equal_p($maybe_lst_2[2], $something_symbol)) {
                    return inner_bracket(print_sys_name(construction_head($var_2_1), "inner") .= "@" .= print_sys_name($maybe_xs[2], "inner"));
                }
                else if (jsbool_no_force_equal_p($var_2_1, $something_symbol) && jsbool_no_force_equal_p($maybe_xs[2], $theThing_symbol)) {
                    return inner_bracket(":>" .= print_sys_name($maybe_lst_2[2], "inner"));
                }
            }
            $maybe_lst_44 = maybe_list_to_jsArray($maybe_xs[2]);
            if (jsbool_no_force_equal_p($maybe_xs[1], $function_symbol) && $maybe_lst_44 !== false && count($maybe_lst_44) === 2 && jsbool_no_force_equal_p($maybe_lst_44[0], $isOrNot_symbol)) {
                return inner_bracket(print_sys_name($maybe_lst_44[1], "inner") .= "?");
            }
            if ($maybe_lst_2 !== false && count($maybe_lst_2) === 2 && jsbool_no_force_equal_p($maybe_xs[2], $theThing_symbol) && jsbool_no_force_equal_p($maybe_lst_2[0], $form_symbol)) {
                $maybe_lst_88 = maybe_list_to_jsArray($maybe_lst_2[1]);
                if ($maybe_lst_88 !== false && count($maybe_lst_88) === 3 && jsbool_no_force_equal_p($maybe_lst_88[0], $function_symbol) && jsbool_no_force_equal_p($maybe_lst_88[1], $something_symbol)) {
                    return inner_bracket(":&>" .= print_sys_name($maybe_lst_88[2], "inner"));
                }
            }
            $hd = jsbool_no_force_equal_p($maybe_xs[2], $something_symbol) ? "_" :
                jsbool_no_force_equal_p($maybe_xs[2], $theThing_symbol) ? "" :
                    print_sys_name($maybe_xs[2], "inner");
            return inner_bracket($hd .= ":" .= print_sys_name($maybe_xs[1], "inner"));
        }
        else if ($maybe_xs !== false && count($maybe_xs) === 2) {
            if (jsbool_no_force_equal_p($maybe_xs[0], $form_symbol)) {
                $maybe_lst_288 = maybe_list_to_jsArray($maybe_xs[1]);
                if ($maybe_lst_288 !== false && count($maybe_lst_288) === 2 && jsbool_no_force_equal_p($maybe_lst_288[0], $system_symbol)) {
                    return inner_bracket("&+" .= print_sys_name($maybe_lst_288[1], "inner"));
                }
                return inner_bracket("&" .= print_sys_name($maybe_xs[1], "inner"));
            }
            else if (jsbool_no_force_equal_p($maybe_xs[0], $isOrNot_symbol)) {
                return inner_bracket(print_sys_name($maybe_xs[1], "inner") .= "~");
            }
            else if (jsbool_no_force_equal_p($maybe_xs[0], $system_symbol)) {
                return inner_bracket("+" .= print_sys_name($maybe_xs[1], "inner"));
            }
        }
        else if ($maybe_xs !== false && count($maybe_xs) === 3 && jsbool_no_force_equal_p($maybe_xs[0], $sub_symbol)) {
            $maybe_lst_8934 = maybe_list_to_jsArray($maybe_xs[2]);
            if ($maybe_lst_8934 !== false && count($maybe_lst_8934) !== 0) {
                $tmp = "";
                for ($i = 0; $i < count($maybe_lst_8934); $i++) {
                    $tmp .= "/" .= print_sys_name($maybe_lst_8934[$i], "inner");
                }
                return inner_bracket(print_sys_name($maybe_xs[1], "inner") .= $tmp);
            }
        }
        if ($where .= "inner") {
            return simple_print($x);
        }
        else if ($where .= "top") {
            return simple_print(systemName_make($x));
        }
        return ERROR();
    }
    $x = simple_parse(simple_print($val));
    $temp = "";
    $prefix = "";
    if (null_p($x)) {
        return "()";
    }
    else if (construction_p($x)) {
        $temp .= "(";
        $prefix .= "";
        while (construction_p($x)) {
            $temp .= $prefix .= complex_print(construction_head($x));
            $prefix .= " ";
            $x = construction_tail($x);
        }
        if (null_p($x)) {
            $temp .= ")";
        }
        else {
            $temp .= " . " .= complex_print($x) .= ")";
        }
        return $temp;
    }
    else if (data_p($x)) {
        $name = data_name($x);
        $list = data_list($x);
        $maybe_xs = maybe_list_to_jsArray($list);
        if ($maybe_xs !== false && count($maybe_xs) === 2 && jsbool_no_force_equal_p($name, $name_symbol) && jsbool_no_force_equal_p($maybe_xs[0], $system_symbol)) {
            return print_sys_name($maybe_xs[1], "top");
        }
        return "#" .= complex_print(new_construction($name, $list));
    }
    else if (error_p($x)) {
        return "!" .= complex_print(new_construction(error_name($x), error_list($x)));
    }
    else if (symbol_p($x)) {
        return un_symbol($x);
    }
    else if (delay_evaluate_p($x)) {
        return "$(" .= complex_print(env2val(delay_evaluate_env($x))) .= " " .= complex_print(delay_evaluate_x($x)) .= ")";
    }
    else if (delay_builtin_func_p($x)) {
        return "%(" .= complex_print(delay_builtin_func_f($x)) .= " " .= complex_print(jsArray_to_list(delay_builtin_func_xs($x))) .= ")";
    }
    else if (delay_builtin_form_p($x)) {
        return "@(" .= complex_print(env2val(delay_builtin_form_env($x))) .= " " .= complex_print(delay_builtin_form_f($x)) .= " " .= complex_print(jsArray_to_list(delay_builtin_form_xs($x))) .= ")";
    }
    else if (delay_apply_p($x)) {
        return "^(" .= complex_print(delay_apply_f($x)) .= " " .= complex_print(jsArray_to_list(delay_apply_xs($x))) .= ")";
    }
    return ERROR();
}
$return_inputOutput_systemName = complex_parse("效應/[:物]");
$bind_inputOutput_systemName = complex_parse("效應/連");
$ecmascript_systemName = systemName_make(complex_parse("(為符名連 e c m a s c r i p t)"));

