<?php
$__TS__ArrayPush = (function ($arr, ...$lUa_Vararg_LuA) use (&$lUa_I_LuA) {
    $items = $lUa_Vararg_LuA;
    $lUaTmP_1_LuAtMp = (is_string($items) ? strlen($items) : count($items));
    $lUaTmP_2_LuAtMp = 1;
    for ($lUa_I_LuA = 1; $lUaTmP_2_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_1_LuAtMp : $lUa_I_LuA > $lUaTmP_1_LuAtMp; $lUa_I_LuA += $lUaTmP_2_LuAtMp) {
        try {
            (function () use (&$arr, &$items, &$lUa_I_LuA) {
                $____TS_index = $lUa_I_LuA;
                $item = $items[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                $arr[] = $item;
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return (is_string($arr) ? strlen($arr) : count($arr));
});
$____exports = [];
$LANG_ERROR = NULL;
$LANG_ASSERT = NULL;
$symbols_set_neg = NULL;
$symbol_t = NULL;
$construction_t = NULL;
$null_t = NULL;
$data_t = NULL;
$error_t = NULL;
$just_t = NULL;
$delay_evaluate_t = NULL;
$delay_builtin_func_t = NULL;
$delay_builtin_form_t = NULL;
$delay_apply_t = NULL;
$comment_t = NULL;
$hole_t = NULL;
$new_comment = NULL;
$comment_p = NULL;
$comment_x = NULL;
$un_comment_all = NULL;
$symbol_p = NULL;
$un_symbol_unicodechar = NULL;
$un_symbol = NULL;
$new_construction = NULL;
$construction_p = NULL;
$construction_head = NULL;
$construction_tail = NULL;
$null_v = NULL;
$null_p = NULL;
$new_data = NULL;
$data_p = NULL;
$data_name = NULL;
$data_list = NULL;
$new_error = NULL;
$error_p = NULL;
$error_name = NULL;
$error_list = NULL;
$just_p = NULL;
$un_just = NULL;
$evaluate = NULL;
$delay_evaluate_p = NULL;
$delay_evaluate_env = NULL;
$delay_evaluate_x = NULL;
$builtin_form_apply = NULL;
$delay_builtin_form_p = NULL;
$delay_builtin_form_env = NULL;
$delay_builtin_form_f = NULL;
$delay_builtin_form_xs = NULL;
$builtin_func_apply = NULL;
$delay_builtin_func_p = NULL;
$delay_builtin_func_f = NULL;
$delay_builtin_func_xs = NULL;
$apply = NULL;
$delay_apply_p = NULL;
$delay_apply_f = NULL;
$delay_apply_xs = NULL;
$force_all_rec = NULL;
$new_hole_do = NULL;
$hole_p = NULL;
$lang_set_do = NULL;
$hole_set_do = NULL;
$lang_copy_do = NULL;
$system_symbol = NULL;
$function_symbol = NULL;
$form_symbol = NULL;
$mapping_symbol = NULL;
$the_world_stopped_v = NULL;
$data_name_function_builtin_systemName = NULL;
$data_list_function_builtin_systemName = NULL;
$data_p_function_builtin_systemName = NULL;
$error_name_function_builtin_systemName = NULL;
$error_list_function_builtin_systemName = NULL;
$error_p_function_builtin_systemName = NULL;
$construction_p_function_builtin_systemName = NULL;
$construction_head_function_builtin_systemName = NULL;
$construction_tail_function_builtin_systemName = NULL;
$symbol_p_function_builtin_systemName = NULL;
$null_p_function_builtin_systemName = NULL;
$equal_p_function_builtin_systemName = NULL;
$apply_function_builtin_systemName = NULL;
$evaluate_function_builtin_systemName = NULL;
$if_function_builtin_systemName = NULL;
$quote_form_builtin_systemName = NULL;
$lambda_form_builtin_systemName = NULL;
$function_builtin_use_systemName = NULL;
$form_builtin_use_systemName = NULL;
$form_use_systemName = NULL;
$comment_form_builtin_systemName = NULL;
$symbol_equal_p = NULL;
$jsArray_to_list = NULL;
$new_list = NULL;
$un_just_all = NULL;
$any_delay_p = NULL;
$any_delay_just_p = NULL;
$force_all = NULL;
$force1 = NULL;
$force_uncomment_all = NULL;
$env_null_v = NULL;
$env_set = NULL;
$env_get = NULL;
$must_env_get = NULL;
$env2val = NULL;
$env_foreach = NULL;
$real_evaluate = NULL;
$name_p = NULL;
$real_builtin_func_apply_s = NULL;
$real_apply = NULL;
$real_builtin_func_apply = NULL;
$real_builtin_form_apply = NULL;
$make_quote = NULL;
$new_lambda = NULL;
$jsbool_equal_p = NULL;
$simple_print = NULL;
$symbols_set_init = NULL;
$symbols_set_neg_init = NULL;
$LANG_ERROR = (function () {
    throw new Exception("TheLanguage PANIC");
});
$LANG_ASSERT = (function ($x) use (&$LANG_ERROR) {
    if (!($x)) {
        return $LANG_ERROR();
    }
});
$new_comment = (function ($comment, $x) use (&$comment_t) {
    return [$comment_t, $comment, $x];
});
$comment_p = (function ($x) use (&$comment_t) {
    return ($x[(-1 + 1)] == $comment_t);
});
$comment_x = (function ($x) {
    return $x[(1 + 1)];
});
$un_comment_all = (function ($x) use (&$comment_p, &$comment_x) {
    while ($comment_p($x)) {
        try {
            (function () use (&$comment_x, &$x) {
                $x = $comment_x($x);
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $x;
});
$symbol_p = (function ($x) use (&$symbol_t) {
    return ($x[(-1 + 1)] == $symbol_t);
});
$un_symbol_unicodechar = (function ($x) {
    return $x[(0 + 1)];
});
$un_symbol = (function ($x) use (&$symbols_set_neg, &$un_symbol_unicodechar) {
    $lUaTmP_3_LuAtMp = $un_symbol_unicodechar($x);
    return $symbols_set_neg()[(is_int($lUaTmP_3_LuAtMp) ? $lUaTmP_3_LuAtMp - 1 : $lUaTmP_3_LuAtMp)];
});
$new_construction = (function ($x, $y) use (&$construction_t) {
    return [$construction_t, $x, $y];
});
$construction_p = (function ($x) use (&$construction_t) {
    return ($x[(-1 + 1)] == $construction_t);
});
$construction_head = (function ($x) {
    return $x[(0 + 1)];
});
$construction_tail = (function ($x) {
    return $x[(1 + 1)];
});
$null_p = (function ($x) use (&$null_t) {
    return ($x[(-1 + 1)] == $null_t);
});
$new_data = (function ($x, $y) use (&$data_t) {
    return [$data_t, $x, $y];
});
$data_p = (function ($x) use (&$data_t) {
    return ($x[(-1 + 1)] == $data_t);
});
$data_name = (function ($x) {
    return $x[(0 + 1)];
});
$data_list = (function ($x) {
    return $x[(1 + 1)];
});
$new_error = (function ($x, $y) use (&$error_t) {
    return [$error_t, $x, $y];
});
$error_p = (function ($x) use (&$error_t) {
    return ($x[(-1 + 1)] == $error_t);
});
$error_name = (function ($x) {
    return $x[(0 + 1)];
});
$error_list = (function ($x) {
    return $x[(1 + 1)];
});
$just_p = (function ($x) use (&$just_t) {
    return ($x[(-1 + 1)] == $just_t);
});
$un_just = (function ($x) {
    return $x[(0 + 1)];
});
$evaluate = (function ($x, $y) use (&$delay_evaluate_t) {
    return [$delay_evaluate_t, $x, $y];
});
$delay_evaluate_p = (function ($x) use (&$delay_evaluate_t) {
    return ($x[(-1 + 1)] == $delay_evaluate_t);
});
$delay_evaluate_env = (function ($x) {
    return $x[(0 + 1)];
});
$delay_evaluate_x = (function ($x) {
    return $x[(1 + 1)];
});
$builtin_form_apply = (function ($x, $y, $z) use (&$delay_builtin_form_t) {
    return [$delay_builtin_form_t, $x, $y, $z];
});
$delay_builtin_form_p = (function ($x) use (&$delay_builtin_form_t) {
    return ($x[(-1 + 1)] == $delay_builtin_form_t);
});
$delay_builtin_form_env = (function ($x) {
    return $x[(0 + 1)];
});
$delay_builtin_form_f = (function ($x) {
    return $x[(1 + 1)];
});
$delay_builtin_form_xs = (function ($x) {
    return $x[(2 + 1)];
});
$builtin_func_apply = (function ($x, $y) use (&$delay_builtin_func_t) {
    return [$delay_builtin_func_t, $x, $y];
});
$delay_builtin_func_p = (function ($x) use (&$delay_builtin_func_t) {
    return ($x[(-1 + 1)] == $delay_builtin_func_t);
});
$delay_builtin_func_f = (function ($x) {
    return $x[(0 + 1)];
});
$delay_builtin_func_xs = (function ($x) {
    return $x[(1 + 1)];
});
$apply = (function ($f, $xs) use (&$delay_apply_t) {
    return [$delay_apply_t, $f, $xs];
});
$delay_apply_p = (function ($x) use (&$delay_apply_t) {
    return ($x[(-1 + 1)] == $delay_apply_t);
});
$delay_apply_f = (function ($x) {
    return $x[(0 + 1)];
});
$delay_apply_xs = (function ($x) {
    return $x[(1 + 1)];
});
$force_all_rec = (function ($raw) use (&$comment_p, &$construction_p, &$data_p, &$error_p, &$force_all, &$force_all_rec) {
    $x = $force_all($raw);
    $conslike = (function ($xx) use (&$force_all_rec) {
        $xx[(0 + 1)] = $force_all_rec($xx[(0 + 1)]);
        $xx[(1 + 1)] = $force_all_rec($xx[(1 + 1)]);
        return $xx;
    });
    if ($data_p($x)) {
        return $conslike($x);
    } elseif ($error_p($x)) {
        return $conslike($x);
    } elseif ($construction_p($x)) {
        return $conslike($x);
    } elseif ($comment_p($x)) {
        return $conslike($x);
    }
    return $x;
});
$new_hole_do = (function () use (&$hole_t) {
    return [$hole_t];
});
$hole_p = (function ($x) use (&$hole_t) {
    return ($x[(-1 + 1)] == $hole_t);
});
$lang_set_do = (function ($x, $y) use (&$just_t) {
    if (($x == $y)) {
        return;
    }
    $x[(-1 + 1)] = $just_t;
    $x[(0 + 1)] = $y;
    $x[(1 + 1)] = false;
    $x[(2 + 1)] = false;
});
$hole_set_do = (function ($rawx, $rawy) use (&$LANG_ASSERT, &$hole_p) {
    $LANG_ASSERT($hole_p($rawx));
    $x = $rawx;
    $y = $rawy;
    $x[(-1 + 1)] = $y[(-1 + 1)];
    $x[(0 + 1)] = $y[(0 + 1)];
    $x[(1 + 1)] = $y[(1 + 1)];
    $x[(2 + 1)] = $y[(2 + 1)];
});
$lang_copy_do = (function ($x) use (&$hole_set_do, &$new_hole_do) {
    $ret = $new_hole_do();
    $hole_set_do($ret, $x);
    return $ret;
});
$symbol_equal_p = (function ($x, $y) use (&$lang_set_do, &$un_symbol_unicodechar) {
    if (($x == $y)) {
        return true;
    }
    if (($un_symbol_unicodechar($x) == $un_symbol_unicodechar($y))) {
        $lang_set_do($x, $y);
        return true;
    } else {
        return false;
    }

});
$jsArray_to_list = (function ($xs) use (&$new_construction, &$null_v) {
    $ret = $null_v;
    
    {
        $i = ((is_string($xs) ? strlen($xs) : count($xs)) - 1);
        while (($i >= 0)) {
            try {
                (function () use (&$i, &$new_construction, &$ret, &$xs) {
                    $ret = $new_construction($xs[($i + 0)], $ret);
                    $i = ($i - 1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $ret;
});
$new_list = (function (...$lUa_Vararg_LuA) use (&$jsArray_to_list) {
    $xs = $lUa_Vararg_LuA;
    return $jsArray_to_list($xs);
});
$un_just_all = (function ($raw) use (&$__TS__ArrayPush, &$just_p, &$lUa_I_LuA, &$lang_set_do, &$un_just) {
    if (!($just_p($raw))) {
        return $raw;
    }
    $x = $raw;
    $xs = [];
    while ($just_p($x)) {
        try {
            (function () use (&$__TS__ArrayPush, &$un_just, &$x, &$xs) {
                $__TS__ArrayPush($xs, $x);
                $x = $un_just($x);
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    $lUaTmP_4_LuAtMp = (is_string($xs) ? strlen($xs) : count($xs));
    $lUaTmP_5_LuAtMp = 1;
    for ($lUa_I_LuA = 1; $lUaTmP_5_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_4_LuAtMp : $lUa_I_LuA > $lUaTmP_4_LuAtMp; $lUa_I_LuA += $lUaTmP_5_LuAtMp) {
        try {
            (function () use (&$lUa_I_LuA, &$lang_set_do, &$x, &$xs) {
                $____TS_index = $lUa_I_LuA;
                $v = $xs[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                $lang_set_do($v, $x);
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $x;
});
$any_delay_p = (function ($x) use (&$delay_apply_p, &$delay_builtin_form_p, &$delay_builtin_func_p, &$delay_evaluate_p) {
    return ((($delay_evaluate_p($x) || $delay_builtin_form_p($x)) ||
        $delay_builtin_func_p($x)) ||
        $delay_apply_p($x));
});
$any_delay_just_p = (function ($x) use (&$any_delay_p, &$just_p) {
    return ($just_p($x) || $any_delay_p($x));
});
$force_all = (function ($raw, $parents_history, $ref_novalue_replace, $xs) use (&$LANG_ASSERT, &$LANG_ERROR, &$__TS__ArrayPush, &$any_delay_just_p, &$apply_function_builtin_systemName, &$builtin_func_apply, &$construction_head_function_builtin_systemName, &$construction_p_function_builtin_systemName, &$construction_tail_function_builtin_systemName, &$data_list_function_builtin_systemName, &$data_name_function_builtin_systemName, &$data_p_function_builtin_systemName, &$delay_apply_p, &$delay_builtin_form_p, &$delay_builtin_func_f, &$delay_builtin_func_p, &$delay_builtin_func_xs, &$delay_evaluate_p, &$equal_p_function_builtin_systemName, &$error_list_function_builtin_systemName, &$error_name_function_builtin_systemName, &$error_p_function_builtin_systemName, &$evaluate_function_builtin_systemName, &$force1, &$force_all, &$if_function_builtin_systemName, &$jsbool_equal_p, &$lUa_I_LuA, &$lang_set_do, &$null_p_function_builtin_systemName, &$simple_print, &$symbol_p_function_builtin_systemName, &$the_world_stopped_v) {
    if (($parents_history == NULL)) {
        $parents_history = [];
    }
    if (($ref_novalue_replace == NULL)) {
        $ref_novalue_replace = [false, false];
    }
    if (($xs == NULL)) {
        $xs = [];
    }
    $x = NULL;
    $do_rewrite = NULL;
    $do_rewrite_force_all = NULL;
    $do_rewrite = (function ($newval) use (&$lang_set_do, &$x, &$xs) {
        $lang_set_do($x, $newval);
        
        {
            $i = 0;
            while (($i < (is_string($xs) ? strlen($xs) : count($xs)))) {
                try {
                    (function () use (&$i, &$lang_set_do, &$newval, &$xs) {
                        $lang_set_do($xs[($i + 0)], $newval);
                        $i = ($i + 1);
                    })();
                } catch (Exception $lUa_E_LuA) {
                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                        break;
                    } else {
                        throw $lUa_E_LuA;
                    }

                }
            }
        }

        return $newval;
    });
    $do_rewrite_force_all = (function ($newval) use (&$__TS__ArrayPush, &$any_delay_just_p, &$do_rewrite, &$force_all, &$parents_history, &$x, &$xs) {
        $do_rewrite($newval);
        if ($any_delay_just_p($newval)) {
            $__TS__ArrayPush($xs, $x);
            return $force_all($newval, $parents_history, [false, false], $xs);
        }
        return $newval;
    });
    $history = [];
    $x = $raw;
    $replace_this_with_stopped = (function () use (&$do_rewrite_force_all, &$ref_novalue_replace, &$the_world_stopped_v) {
        $ref_novalue_replace[(0 + 1)] = true;
        return $do_rewrite_force_all($the_world_stopped_v);
    });
    $make_history = (function () use (&$history, &$lUa_I_LuA, &$parents_history) {
        $ret = [];
        foreach ($history as $lUa_I_LuA => $lUa_V_LuA) {
            try {
                (function () use (&$lUa_I_LuA, &$ret) {
                    $x_id = $lUa_I_LuA;
                    $ret[(is_int($x_id) ? $x_id - 1 : $x_id)] = true;
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        foreach ($parents_history as $lUa_I_LuA => $lUa_V_LuA) {
            try {
                (function () use (&$lUa_I_LuA, &$ret) {
                    $x_id = $lUa_I_LuA;
                    $ret[(is_int($x_id) ? $x_id - 1 : $x_id)] = true;
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        return $ret;
    });
    
    {
        $i = 0;
        while (($any_delay_just_p($x) && ($i < 32))) {
            try {
                (function () use (&$__TS__ArrayPush, &$force1, &$i, &$x, &$xs) {
                    $__TS__ArrayPush($xs, $x);
                    $x = $force1($x);
                    $i = ($i + 1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    while ($any_delay_just_p($x)) {
        try {
            (function () use (&$LANG_ASSERT, &$LANG_ERROR, &$__TS__ArrayPush, &$apply_function_builtin_systemName, &$builtin_func_apply, &$construction_head_function_builtin_systemName, &$construction_p_function_builtin_systemName, &$construction_tail_function_builtin_systemName, &$data_list_function_builtin_systemName, &$data_name_function_builtin_systemName, &$data_p_function_builtin_systemName, &$delay_apply_p, &$delay_builtin_form_p, &$delay_builtin_func_f, &$delay_builtin_func_p, &$delay_builtin_func_xs, &$delay_evaluate_p, &$do_rewrite_force_all, &$equal_p_function_builtin_systemName, &$error_list_function_builtin_systemName, &$error_name_function_builtin_systemName, &$error_p_function_builtin_systemName, &$evaluate_function_builtin_systemName, &$force1, &$force_all, &$history, &$if_function_builtin_systemName, &$jsbool_equal_p, &$lUa_I_LuA, &$make_history, &$null_p_function_builtin_systemName, &$parents_history, &$ref_novalue_replace, &$replace_this_with_stopped, &$simple_print, &$symbol_p_function_builtin_systemName, &$x, &$xs) {
                $x_id = $simple_print($x);
                if (($parents_history[(is_int($x_id) ? $x_id - 1 : $x_id)] == true)) {
                    return $replace_this_with_stopped();
                }
                if (($history[(is_int($x_id) ? $x_id - 1 : $x_id)] == true)) {
                    $ref_novalue_replace[(-1 + 1)] = true;
                    if ($delay_evaluate_p($x)) {
                        return $replace_this_with_stopped();
                    } elseif ($delay_builtin_func_p($x)) {
                        $f = $delay_builtin_func_f($x);
                        $xs_1 = $delay_builtin_func_xs($x);
                        $elim_s = [
                            $data_name_function_builtin_systemName,
                            $data_list_function_builtin_systemName,
                            $data_p_function_builtin_systemName,
                            $error_name_function_builtin_systemName,
                            $error_list_function_builtin_systemName,
                            $error_p_function_builtin_systemName,
                            $construction_p_function_builtin_systemName,
                            $construction_head_function_builtin_systemName,
                            $construction_tail_function_builtin_systemName,
                            $symbol_p_function_builtin_systemName,
                            $null_p_function_builtin_systemName
                        ];
                        $is_elim = false;
                        $lUaTmP_6_LuAtMp = (is_string($elim_s) ? strlen($elim_s) : count($elim_s));
                        $lUaTmP_7_LuAtMp = 1;
                        for ($lUa_I_LuA = 1; $lUaTmP_7_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_6_LuAtMp : $lUa_I_LuA > $lUaTmP_6_LuAtMp; $lUa_I_LuA += $lUaTmP_7_LuAtMp) {
                            try {
                                (function () use (&$elim_s, &$f, &$is_elim, &$jsbool_equal_p, &$lUa_I_LuA) {
                                    $____TS_index = $lUa_I_LuA;
                                    $elim_s_v = $elim_s[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                                    if ($jsbool_equal_p($elim_s_v, $f)) {
                                        $is_elim = true;
                                        throw new Exception("lUa_bReAk_LuA");
                                    }
                                })();
                            } catch (Exception $lUa_E_LuA) {
                                if ($e->getMessage() == "lUa_bReAk_LuA") {
                                    break;
                                } else {
                                    throw $lUa_E_LuA;
                                }

                            }
                        }
                        if ($is_elim) {
                            $LANG_ASSERT(((is_string($xs_1) ? strlen($xs_1) : count($xs_1)) == 1));
                            $LANG_ASSERT(($ref_novalue_replace[(0 + 1)] == false));
                            $inner = $force_all($xs_1[(-1 + 1)], $make_history(), $ref_novalue_replace);
                            if ($ref_novalue_replace[(0 + 1)]) {
                                return $do_rewrite_force_all($builtin_func_apply($f, [$inner]));
                            } else {
                                return $LANG_ERROR();
                            }

                        }
                        if ($jsbool_equal_p($f, $equal_p_function_builtin_systemName)) {
                            return $replace_this_with_stopped();
                        } elseif ($jsbool_equal_p($f, $apply_function_builtin_systemName)) {
                            return $replace_this_with_stopped();
                        } elseif ($jsbool_equal_p($f, $evaluate_function_builtin_systemName)) {
                            return $replace_this_with_stopped();
                        } elseif ($jsbool_equal_p($f, $if_function_builtin_systemName)) {
                            $LANG_ASSERT(((is_string($xs_1) ? strlen($xs_1) : count($xs_1)) == 3));
                            $LANG_ASSERT(($ref_novalue_replace[(0 + 1)] == false));
                            $tf = $force_all($xs_1[(-1 + 1)], $make_history(), $ref_novalue_replace);
                            if ($ref_novalue_replace[(0 + 1)]) {
                                return $do_rewrite_force_all(
                                    $builtin_func_apply($if_function_builtin_systemName, [$tf, $xs_1[(0 + 1)], $xs_1[(1 + 1)]])
                                );
                            } else {
                                return $LANG_ERROR();
                            }

                        }
                        return $LANG_ERROR();
                    } elseif ($delay_builtin_form_p($x)) {
                        return $replace_this_with_stopped();
                    } elseif ($delay_apply_p($x)) {
                        return $replace_this_with_stopped();
                    }
                    return $LANG_ERROR();
                }
                $history[(is_int($x_id) ? $x_id - 1 : $x_id)] = true;
                $__TS__ArrayPush($xs, $x);
                $x = $force1($x);
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $do_rewrite($x);
});
$force1 = (function ($raw) use (&$LANG_ASSERT, &$delay_apply_f, &$delay_apply_p, &$delay_apply_xs, &$delay_builtin_form_env, &$delay_builtin_form_f, &$delay_builtin_form_p, &$delay_builtin_form_xs, &$delay_builtin_func_f, &$delay_builtin_func_p, &$delay_builtin_func_xs, &$delay_evaluate_env, &$delay_evaluate_p, &$delay_evaluate_x, &$just_p, &$lang_set_do, &$real_apply, &$real_builtin_form_apply, &$real_builtin_func_apply, &$real_evaluate, &$un_just_all) {
    $x = $un_just_all($raw);
    $ret = NULL;
    $LANG_ASSERT(!($just_p($x)));
    if ($delay_evaluate_p($x)) {
        $ret = $real_evaluate($delay_evaluate_env($x), $delay_evaluate_x($x), $raw);
    } elseif ($delay_builtin_form_p($x)) {
        $ret = $real_builtin_form_apply(
            $delay_builtin_form_env($x),
            $delay_builtin_form_f($x),
            $delay_builtin_form_xs($x),
            $raw
        );
    } elseif ($delay_builtin_func_p($x)) {
        $ret = $real_builtin_func_apply($delay_builtin_func_f($x), $delay_builtin_func_xs($x), $raw);
    } elseif ($delay_apply_p($x)) {
        $ret = $real_apply($delay_apply_f($x), $delay_apply_xs($x), $raw);
    } else {
        $ret = $x;
    }

    $ret = $un_just_all($ret);
    $lang_set_do($x, $ret);
    return $ret;
});
$force_uncomment_all = (function ($x) use (&$any_delay_just_p, &$comment_p, &$force_all, &$un_comment_all) {
    while (($any_delay_just_p($x) || $comment_p($x))) {
        try {
            (function () use (&$force_all, &$un_comment_all, &$x) {
                $x = $force_all($un_comment_all($x));
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $x;
});
$env_set = (function ($env, $key, $val) use (&$jsbool_equal_p) {
    $ret = [];
    
    {
        $i = 0;
        while (($i < (is_string($env) ? strlen($env) : count($env)))) {
            try {
                (function () use (&$env, &$i, &$jsbool_equal_p, &$key, &$ret, &$val) {
                    if ($jsbool_equal_p($env[(($i + 0) + 0)], $key)) {
                        $ret[(($i + 0) + 0)] = $key;
                        $ret[(($i + 1) + 0)] = $val;
                        
                        {
                            $i = ($i + 2);
                            while (($i < (is_string($env) ? strlen($env) : count($env)))) {
                                try {
                                    (function () use (&$env, &$i, &$ret) {
                                        $ret[(($i + 0) + 0)] = $env[(($i + 0) + 0)];
                                        $ret[(($i + 1) + 0)] = $env[(($i + 1) + 0)];
                                        $i = ($i + 2);
                                    })();
                                } catch (Exception $lUa_E_LuA) {
                                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                                        break;
                                    } else {
                                        throw $lUa_E_LuA;
                                    }

                                }
                            }
                        }

                        return $ret;
                    } else {
                        $ret[(($i + 0) + 0)] = $env[(($i + 0) + 0)];
                        $ret[(($i + 1) + 0)] = $env[(($i + 1) + 0)];
                    }

                    $i = ($i + 2);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    $ret[(((is_string($env) ? strlen($env) : count($env)) + 0) + 0)] = $key;
    $ret[(((is_string($env) ? strlen($env) : count($env)) + 1) + 0)] = $val;
    return $ret;
});
$env_get = (function ($env, $key, $default_v) use (&$jsbool_equal_p) {
    
    {
        $i = 0;
        while (($i < (is_string($env) ? strlen($env) : count($env)))) {
            try {
                (function () use (&$env, &$i, &$jsbool_equal_p, &$key) {
                    if ($jsbool_equal_p($env[(($i + 0) + 0)], $key)) {
                        return $env[(($i + 1) + 0)];
                    }
                    $i = ($i + 2);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $default_v;
});
$must_env_get = (function ($env, $key) use (&$LANG_ERROR, &$jsbool_equal_p) {
    
    {
        $i = 0;
        while (($i < (is_string($env) ? strlen($env) : count($env)))) {
            try {
                (function () use (&$env, &$i, &$jsbool_equal_p, &$key) {
                    if ($jsbool_equal_p($env[(($i + 0) + 0)], $key)) {
                        return $env[(($i + 1) + 0)];
                    }
                    $i = ($i + 2);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $LANG_ERROR();
});
$env2val = (function ($env) use (&$mapping_symbol, &$new_construction, &$new_data, &$new_list, &$null_v) {
    $ret = $null_v;
    
    {
        $i = 0;
        while (($i < (is_string($env) ? strlen($env) : count($env)))) {
            try {
                (function () use (&$env, &$i, &$new_construction, &$new_list, &$ret) {
                    $ret = $new_construction($new_list($env[(($i + 0) + 0)], $env[(($i + 1) + 0)]), $ret);
                    $i = ($i + 2);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $new_data($mapping_symbol, $new_list($ret));
});
$env_foreach = (function ($env, $f) {
    
    {
        $i = 0;
        while (($i < (is_string($env) ? strlen($env) : count($env)))) {
            try {
                (function () use (&$env, &$f, &$i) {
                    $f($env[(($i + 0) + 0)], $env[(($i + 1) + 0)]);
                    $i = ($i + 2);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

});
$real_evaluate = (function ($env, $raw, $selfvalraw) use (&$LANG_ERROR, &$__TS__ArrayPush, &$any_delay_just_p, &$apply, &$builtin_form_apply, &$builtin_func_apply, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$env2val, &$env_get, &$error_p, &$evaluate, &$evaluate_function_builtin_systemName, &$force1, &$force_all, &$form_builtin_use_systemName, &$form_symbol, &$form_use_systemName, &$function_builtin_use_systemName, &$jsbool_equal_p, &$name_p, &$new_error, &$new_list, &$null_p, &$symbol_equal_p, &$symbol_p, &$system_symbol) {
    $x = $force1($raw);
    if ($any_delay_just_p($x)) {
        return $selfvalraw;
    }
    $error_v = $new_error($system_symbol, $new_list(
        $function_builtin_use_systemName,
        $new_list($evaluate_function_builtin_systemName, $new_list($env2val($env), $x))
    ));
    if ($construction_p($x)) {
        $xs = [];
        $rest = $x;
        while (!($null_p($rest))) {
            try {
                (function () use (&$__TS__ArrayPush, &$any_delay_just_p, &$construction_head, &$construction_p, &$construction_tail, &$error_v, &$force1, &$rest, &$selfvalraw, &$xs) {
                    if ($any_delay_just_p($rest)) {
                        return $selfvalraw;
                    } elseif ($construction_p($rest)) {
                        $__TS__ArrayPush($xs, $construction_head($rest));
                        $rest = $force1($construction_tail($rest));
                    } else {
                        return $error_v;
                    }

                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        if ($jsbool_equal_p($xs[(-1 + 1)], $form_builtin_use_systemName)) {
            if (((is_string($xs) ? strlen($xs) : count($xs)) == 1)) {
                return $error_v;
            }
            $f = $xs[(0 + 1)];
            $args = [];
            
            {
                $i = 2;
                while (($i < (is_string($xs) ? strlen($xs) : count($xs)))) {
                    try {
                        (function () use (&$__TS__ArrayPush, &$args, &$i, &$xs) {
                            $__TS__ArrayPush($args, $xs[($i + 0)]);
                            $i = ($i + 1);
                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
            }

            return $builtin_form_apply($env, $f, $args);
        } elseif ($jsbool_equal_p($xs[(-1 + 1)], $form_use_systemName)) {
            if (((is_string($xs) ? strlen($xs) : count($xs)) == 1)) {
                return $error_v;
            }
            $f_1 = $force_all($evaluate($env, $xs[(0 + 1)]));
            if (!($data_p($f_1))) {
                return $error_v;
            }
            $f_type = $force1($data_name($f_1));
            if ($any_delay_just_p($f_type)) {
                return $selfvalraw;
            }
            if (!($symbol_p($f_type))) {
                return $error_v;
            }
            if (!($symbol_equal_p($f_type, $form_symbol))) {
                return $error_v;
            }
            $f_list = $force1($data_list($f_1));
            if ($any_delay_just_p($f_list)) {
                return $selfvalraw;
            }
            if (!($construction_p($f_list))) {
                return $error_v;
            }
            $f_x = $construction_head($f_list);
            $f_list_cdr = $force1($construction_tail($f_list));
            if ($any_delay_just_p($f_list_cdr)) {
                return $selfvalraw;
            }
            if (!($null_p($f_list_cdr))) {
                return $error_v;
            }
            $args_1 = [$env2val($env)];
            
            {
                $i_1 = 2;
                while (($i_1 < (is_string($xs) ? strlen($xs) : count($xs)))) {
                    try {
                        (function () use (&$__TS__ArrayPush, &$args_1, &$i_1, &$xs) {
                            $__TS__ArrayPush($args_1, $xs[($i_1 + 0)]);
                            $i_1 = ($i_1 + 1);
                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
            }

            return $apply($f_x, $args_1);
        } elseif ($jsbool_equal_p($xs[(-1 + 1)], $function_builtin_use_systemName)) {
            if (((is_string($xs) ? strlen($xs) : count($xs)) == 1)) {
                return $error_v;
            }
            $f_2 = $xs[(0 + 1)];
            $args_2 = [];
            
            {
                $i_2 = 2;
                while (($i_2 < (is_string($xs) ? strlen($xs) : count($xs)))) {
                    try {
                        (function () use (&$__TS__ArrayPush, &$args_2, &$env, &$evaluate, &$i_2, &$xs) {
                            $__TS__ArrayPush($args_2, $evaluate($env, $xs[($i_2 + 0)]));
                            $i_2 = ($i_2 + 1);
                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
            }

            return $builtin_func_apply($f_2, $args_2);
        } else {
            $f_3 = $evaluate($env, $xs[(-1 + 1)]);
            $args_3 = [];
            
            {
                $i_3 = 1;
                while (($i_3 < (is_string($xs) ? strlen($xs) : count($xs)))) {
                    try {
                        (function () use (&$__TS__ArrayPush, &$args_3, &$env, &$evaluate, &$i_3, &$xs) {
                            $__TS__ArrayPush($args_3, $evaluate($env, $xs[($i_3 + 0)]));
                            $i_3 = ($i_3 + 1);
                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
            }

            return $apply($f_3, $args_3);
        }

    } elseif ($null_p($x)) {
        return $x;
    } elseif ($name_p($x)) {
        return $env_get($env, $x, $error_v);
    } elseif ($error_p($x)) {
        return $error_v;
    }
    return $LANG_ERROR();
});
$name_p = (function ($x) use (&$data_p, &$symbol_p) {
    return ($symbol_p($x) || $data_p($x));
});
$real_apply = (function ($f, $xs, $selfvalraw) use (&$any_delay_just_p, &$apply_function_builtin_systemName, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$env_null_v, &$env_set, &$evaluate, &$force1, &$force_all, &$force_all_rec, &$function_builtin_use_systemName, &$function_symbol, &$jsArray_to_list, &$name_p, &$new_construction, &$new_error, &$new_list, &$null_p, &$null_v, &$symbol_equal_p, &$symbol_p, &$system_symbol) {
    $make_error_v = (function () use (&$apply_function_builtin_systemName, &$f, &$function_builtin_use_systemName, &$jsArray_to_list, &$new_error, &$new_list, &$system_symbol, &$xs) {
        return $new_error($system_symbol, $new_list(
            $function_builtin_use_systemName,
            $new_list($apply_function_builtin_systemName, $new_list($f, $jsArray_to_list($xs)))
        ));
    });
    $f = $force1($f);
    if ($any_delay_just_p($f)) {
        return $selfvalraw;
    }
    if (!($data_p($f))) {
        return $make_error_v();
    }
    $f_type = $force_all($data_name($f));
    if (!(($symbol_p($f_type) && $symbol_equal_p($f_type, $function_symbol)))) {
        return $make_error_v();
    }
    $f_list = $force_all($data_list($f));
    if (!($construction_p($f_list))) {
        return $make_error_v();
    }
    $args_pat = $force_all_rec($construction_head($f_list));
    $f_list_cdr = $force_all($construction_tail($f_list));
    if (!(($construction_p($f_list_cdr) &&
        $null_p($force_all($construction_tail($f_list_cdr)))))) {
        return $make_error_v();
    }
    $f_code = $construction_head($f_list_cdr);
    $env = $env_null_v;
    $xs_i = 0;
    while (!($null_p($args_pat))) {
        try {
            (function () use (&$args_pat, &$construction_head, &$construction_p, &$construction_tail, &$env, &$env_set, &$make_error_v, &$name_p, &$new_construction, &$null_v, &$xs, &$xs_i) {
                if ($name_p($args_pat)) {
                    $x = $null_v;
                    
                    {
                        $i = ((is_string($xs) ? strlen($xs) : count($xs)) - 1);
                        while (($i >= $xs_i)) {
                            try {
                                (function () use (&$i, &$new_construction, &$x, &$xs) {
                                    $x = $new_construction($xs[($i + 0)], $x);
                                    $i = ($i - 1);
                                })();
                            } catch (Exception $lUa_E_LuA) {
                                if ($e->getMessage() == "lUa_bReAk_LuA") {
                                    break;
                                } else {
                                    throw $lUa_E_LuA;
                                }

                            }
                        }
                    }

                    $env = $env_set($env, $args_pat, $x);
                    $xs_i = (is_string($xs) ? strlen($xs) : count($xs));
                    $args_pat = $null_v;
                } elseif ($construction_p($args_pat)) {
                    if (($xs_i < (is_string($xs) ? strlen($xs) : count($xs)))) {
                        $x_1 = $xs[($xs_i + 0)];
                        $xs_i = ($xs_i + 1);
                        $env = $env_set($env, $construction_head($args_pat), $x_1);
                        $args_pat = $construction_tail($args_pat);
                    } else {
                        return $make_error_v();
                    }

                } else {
                    return $make_error_v();
                }

            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    if (((is_string($xs) ? strlen($xs) : count($xs)) != $xs_i)) {
        return $make_error_v();
    }
    return $evaluate($env, $f_code);
});
$real_builtin_func_apply = (function ($f, $xs, $selfvalraw) use (&$LANG_ERROR, &$function_builtin_use_systemName, &$jsArray_to_list, &$jsbool_equal_p, &$new_error, &$new_list, &$real_builtin_func_apply_s, &$system_symbol) {
    $error_v = $new_error(
        $system_symbol,
        $new_list($function_builtin_use_systemName, $new_list($f, $jsArray_to_list($xs)))
    );
    
    {
        $i = 0;
        while (($i <
            (is_string($real_builtin_func_apply_s) ? strlen($real_builtin_func_apply_s) : count($real_builtin_func_apply_s)))) {
            try {
                (function () use (&$LANG_ERROR, &$error_v, &$f, &$i, &$jsbool_equal_p, &$real_builtin_func_apply_s, &$xs) {
                    if ($jsbool_equal_p($f, $real_builtin_func_apply_s[($i + 0)][(-1 + 1)])) {
                        $actually_length = $real_builtin_func_apply_s[($i + 0)][(0 + 1)];
                        if (((is_string($xs) ? strlen($xs) : count($xs)) != $actually_length)) {
                            return $error_v;
                        }
                        $f_1 = $real_builtin_func_apply_s[($i + 0)][(1 + 1)];
                        if (($actually_length == 1)) {
                            return $f_1($xs[(-1 + 1)], $error_v);
                        } elseif (($actually_length == 2)) {
                            return $f_1($xs[(-1 + 1)], $xs[(0 + 1)], $error_v);
                        } elseif (($actually_length == 3)) {
                            return $f_1($xs[(-1 + 1)], $xs[(0 + 1)], $xs[(1 + 1)], $error_v);
                        }
                        return $LANG_ERROR();
                    }
                    $i = ($i + 1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $error_v;
});
$real_builtin_form_apply = (function ($env, $f, $xs, $selfvalraw) use (&$comment_form_builtin_systemName, &$env2val, &$evaluate, &$form_builtin_use_systemName, &$jsArray_to_list, &$jsbool_equal_p, &$lambda_form_builtin_systemName, &$new_comment, &$new_error, &$new_lambda, &$new_list, &$quote_form_builtin_systemName, &$system_symbol) {
    $error_v = $new_error($system_symbol, $new_list(
        $form_builtin_use_systemName,
        $new_list($env2val($env), $f, $jsArray_to_list($xs))
    ));
    if ($jsbool_equal_p($f, $quote_form_builtin_systemName)) {
        if (((is_string($xs) ? strlen($xs) : count($xs)) != 1)) {
            return $error_v;
        }
        return $xs[(-1 + 1)];
    } elseif ($jsbool_equal_p($f, $lambda_form_builtin_systemName)) {
        if (((is_string($xs) ? strlen($xs) : count($xs)) != 2)) {
            return $error_v;
        }
        return $new_lambda($env, $xs[(-1 + 1)], $xs[(0 + 1)], $error_v);
    } elseif ($jsbool_equal_p($f, $comment_form_builtin_systemName)) {
        if (((is_string($xs) ? strlen($xs) : count($xs)) != 2)) {
            return $error_v;
        }
        return $new_comment($xs[(-1 + 1)], $evaluate($env, $xs[(0 + 1)]));
    }
    return $error_v;
});
$make_quote = (function ($x) use (&$form_builtin_use_systemName, &$new_list, &$quote_form_builtin_systemName) {
    return $new_list($form_builtin_use_systemName, $quote_form_builtin_systemName, $x);
});
$new_lambda = (function ($env, $args_pat, $body, $error_v) use (&$__TS__ArrayPush, &$construction_head, &$construction_p, &$construction_tail, &$env2val, &$env_foreach, &$force_all_rec, &$form_builtin_use_systemName, &$function_symbol, &$jsArray_to_list, &$jsbool_equal_p, &$lambda_form_builtin_systemName, &$make_quote, &$must_env_get, &$name_p, &$new_construction, &$new_data, &$new_error, &$new_list, &$null_p, &$null_v, &$system_symbol) {
    if (($error_v == NULL)) {
        $error_v = false;
    }
    $make_error_v = (function () use (&$args_pat, &$body, &$env, &$env2val, &$error_v, &$form_builtin_use_systemName, &$jsArray_to_list, &$lambda_form_builtin_systemName, &$new_error, &$new_list, &$system_symbol) {
        if (($error_v == false)) {
            return $new_error($system_symbol, $new_list($form_builtin_use_systemName, $new_list(
                $env2val($env),
                $lambda_form_builtin_systemName,
                $jsArray_to_list([$args_pat, $body])
            )));
        } else {
            return $error_v;
        }

    });
    $args_pat = $force_all_rec($args_pat);
    $args_pat_vars = [];
    $args_pat_is_dot = false;
    $args_pat_iter = $args_pat;
    while (!($null_p($args_pat_iter))) {
        try {
            (function () use (&$__TS__ArrayPush, &$args_pat_is_dot, &$args_pat_iter, &$args_pat_vars, &$construction_head, &$construction_p, &$construction_tail, &$make_error_v, &$name_p, &$null_v) {
                if ($name_p($args_pat_iter)) {
                    $__TS__ArrayPush($args_pat_vars, $args_pat_iter);
                    $args_pat_is_dot = true;
                    $args_pat_iter = $null_v;
                } elseif ($construction_p($args_pat_iter)) {
                    $__TS__ArrayPush($args_pat_vars, $construction_head($args_pat_iter));
                    $args_pat_iter = $construction_tail($args_pat_iter);
                } else {
                    return $make_error_v();
                }

            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    $args_pat_vars_val = $args_pat;
    if ($args_pat_is_dot) {
        $args_pat_vars_val = $jsArray_to_list($args_pat_vars);
    }
    $env_vars = [];
    $env_foreach(
        $env,
        (function ($k, $v) use (&$__TS__ArrayPush, &$args_pat_vars, &$env_vars, &$jsbool_equal_p) {
            
            {
                $i = 0;
                while (($i <
                    (is_string($args_pat_vars) ? strlen($args_pat_vars) : count($args_pat_vars)))) {
                    try {
                        (function () use (&$args_pat_vars, &$i, &$jsbool_equal_p, &$k) {
                            if ($jsbool_equal_p($args_pat_vars[($i + 0)], $k)) {
                                return;
                            }
                            $i = ($i + 1);
                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
            }

            $__TS__ArrayPush($env_vars, $k);
        })
    );
    $new_args_pat = $args_pat_vars_val;
    
    {
        $i = ((is_string($env_vars) ? strlen($env_vars) : count($env_vars)) - 1);
        while (($i >= 0)) {
            try {
                (function () use (&$env_vars, &$i, &$new_args_pat, &$new_construction) {
                    $new_args_pat = $new_construction($env_vars[($i + 0)], $new_args_pat);
                    $i = ($i - 1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    $new_args = $args_pat_vars_val;
    
    {
        $i_1 = ((is_string($env_vars) ? strlen($env_vars) : count($env_vars)) - 1);
        while (($i_1 >= 0)) {
            try {
                (function () use (&$env, &$env_vars, &$i_1, &$make_quote, &$must_env_get, &$new_args, &$new_construction) {
                    $new_args = $new_construction($make_quote($must_env_get($env, $env_vars[($i_1 + 0)])), $new_args);
                    $i_1 = ($i_1 - 1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    }

    return $new_data($function_symbol, $new_list($args_pat, $new_construction(
        $make_quote($new_data($function_symbol, $new_list($new_args_pat, $body))),
        $new_args
    )));
});
$jsbool_equal_p = (function ($x, $y) use (&$LANG_ERROR, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$error_list, &$error_name, &$error_p, &$force_all, &$jsbool_equal_p, &$lang_set_do, &$null_p, &$null_v, &$symbol_equal_p, &$symbol_p) {
    if (($x == $y)) {
        return true;
    }
    $x = $force_all($x);
    $y = $force_all($y);
    if (($x == $y)) {
        return true;
    }
    $end_2 = (function ($xx, $yy, $f1, $f2) use (&$jsbool_equal_p, &$lang_set_do) {
        if (($jsbool_equal_p($f1($xx), $f1($yy)) && $jsbool_equal_p($f2($xx), $f2($yy)))) {
            $lang_set_do($xx, $yy);
            return true;
        } else {
            return false;
        }

    });
    if ($null_p($x)) {
        if (!($null_p($y))) {
            return false;
        }
        $lang_set_do($x, $null_v);
        $lang_set_do($y, $null_v);
        return true;
    } elseif ($symbol_p($x)) {
        if (!($symbol_p($y))) {
            return false;
        }
        return $symbol_equal_p($x, $y);
    } elseif ($construction_p($x)) {
        if (!($construction_p($y))) {
            return false;
        }
        return $end_2($x, $y, $construction_head, $construction_tail);
    } elseif ($error_p($x)) {
        if (!($error_p($y))) {
            return false;
        }
        return $end_2($x, $y, $error_name, $error_list);
    } elseif ($data_p($x)) {
        if (!($data_p($y))) {
            return false;
        }
        return $end_2($x, $y, $data_name, $data_list);
    }
    return $LANG_ERROR();
});
$simple_print = (function ($x) use (&$LANG_ERROR, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_apply_f, &$delay_apply_p, &$delay_apply_xs, &$delay_builtin_form_env, &$delay_builtin_form_f, &$delay_builtin_form_p, &$delay_builtin_form_xs, &$delay_builtin_func_f, &$delay_builtin_func_p, &$delay_builtin_func_xs, &$delay_evaluate_env, &$delay_evaluate_p, &$delay_evaluate_x, &$env2val, &$error_list, &$error_name, &$error_p, &$jsArray_to_list, &$new_construction, &$null_p, &$simple_print, &$symbol_p, &$tostring, &$un_just_all, &$un_symbol) {
    $x = $un_just_all($x);
    $temp = "";
    $prefix = "";
    if ($null_p($x)) {
        return "()";
    } elseif ($construction_p($x)) {
        $temp = "(";
        $prefix = "";
        while ($construction_p($x)) {
            try {
                (function () use (&$construction_head, &$construction_tail, &$prefix, &$simple_print, &$temp, &$tostring, &$un_just_all, &$x) {
                    $temp = ($tostring($temp) .
                        ($tostring($prefix) . $tostring($simple_print($construction_head($x)))));
                    $prefix = " ";
                    $x = $un_just_all($construction_tail($x));
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        if ($null_p($x)) {
            $temp = ($tostring($temp) . ")");
        } else {
            $temp = ($tostring($temp) . (" . " . ($tostring($simple_print($x)) . ")")));
        }

        return $temp;
    } elseif ($data_p($x)) {
        return ("#" .
            $tostring($simple_print($new_construction($data_name($x), $data_list($x)))));
    } elseif ($error_p($x)) {
        return ("!" .
            $tostring($simple_print($new_construction($error_name($x), $error_list($x)))));
    } elseif ($symbol_p($x)) {
        return $un_symbol($x);
    } elseif ($delay_evaluate_p($x)) {
        return ("\$(" .
            ($tostring($simple_print($env2val($delay_evaluate_env($x)))) .
            (" " . ($tostring($simple_print($delay_evaluate_x($x))) . ")"))));
    } elseif ($delay_builtin_func_p($x)) {
        return ("%(" .
            ($tostring($simple_print($delay_builtin_func_f($x))) .
            (" " .
            ($tostring($simple_print($jsArray_to_list($delay_builtin_func_xs($x)))) . ")"))));
    } elseif ($delay_builtin_form_p($x)) {
        return ("@(" .
            ($tostring($simple_print($env2val($delay_builtin_form_env($x)))) .
            (" " .
            ($tostring($simple_print($delay_builtin_form_f($x))) .
            (" " .
            ($tostring($simple_print($jsArray_to_list($delay_builtin_form_xs($x)))) . ")"))))));
    } elseif ($delay_apply_p($x)) {
        return ("^(" .
            ($tostring($simple_print($delay_apply_f($x))) .
            (" " . ($tostring($simple_print($jsArray_to_list($delay_apply_xs($x)))) . ")"))));
    }
    return $LANG_ERROR();
});
$symbols_set_init = (function () {
    return [
        "0" => "0",
        "1" => "1",
        "2" => "2",
        "3" => "3",
        "4" => "4",
        "5" => "5",
        "6" => "6",
        "7" => "7",
        "8" => "8",
        "9" => "9",
        "A" => "A",
        "B" => "B",
        "C" => "C",
        "D" => "D",
        "E" => "E",
        "F" => "F",
        "G" => "G",
        "H" => "H",
        "I" => "I",
        "J" => "J",
        "K" => "K",
        "L" => "L",
        "M" => "M",
        "N" => "N",
        "O" => "O",
        "P" => "P",
        "Q" => "Q",
        "R" => "R",
        "S" => "S",
        "T" => "T",
        "U" => "U",
        "V" => "V",
        "W" => "W",
        "X" => "X",
        "Y" => "Y",
        "Z" => "Z",
        "a" => "a",
        "b" => "b",
        "c" => "c",
        "d" => "d",
        "e" => "e",
        "f" => "f",
        "g" => "g",
        "h" => "h",
        "i" => "i",
        "j" => "j",
        "k" => "k",
        "l" => "l",
        "m" => "m",
        "n" => "n",
        "o" => "o",
        "p" => "p",
        "q" => "q",
        "r" => "r",
        "s" => "s",
        "t" => "t",
        "u" => "u",
        "v" => "v",
        "w" => "w",
        "x" => "x",
        "y" => "y",
        "z" => "z",
        "一類何物" => "㝉",
        "之物" => "𫙦",
        "其子" => "𦮪",
        "出入改滅" => "𢒟",
        "列序" => "𠜺",
        "化滅" => "𠏁",
        "參形" => "𠫰",
        "吾自" => "𦣹",
        "太始初核" => "𣝗",
        "如若" => "𦱡",
        "宇宙亡矣" => "𨹹",
        "尾末" => "𡲵",
        "序丁" => "𠆤",
        "序丙" => "𠇮",
        "序乙" => "㐈",
        "序甲" => "𠇚",
        "式形" => "佱",
        "引用" => "㧈",
        "應用" => "𤰆",
        "效應" => "効",
        "映表" => "𤅔",
        "是非" => "欤",
        "構物" => "𡒫",
        "為符名連" => "‐",
        "特定其物" => "亓",
        "省略一物" => "畧",
        "符名" => "謼",
        "等同" => "弌",
        "解算" => "筭",
        "註疏" => "疎",
        "詞素" => "𧥝",
        "謬誤" => "䥘",
        "連頸" => "丩",
        "間空" => "𣣓",
        "陰" => "侌",
        "陽" => "𣆄",
        "首始" => "𩠐"
    ];
});
$symbols_set_neg_init = (function () {
    return [
        "0" => "0",
        "1" => "1",
        "2" => "2",
        "3" => "3",
        "4" => "4",
        "5" => "5",
        "6" => "6",
        "7" => "7",
        "8" => "8",
        "9" => "9",
        "A" => "A",
        "B" => "B",
        "C" => "C",
        "D" => "D",
        "E" => "E",
        "F" => "F",
        "G" => "G",
        "H" => "H",
        "I" => "I",
        "J" => "J",
        "K" => "K",
        "L" => "L",
        "M" => "M",
        "N" => "N",
        "O" => "O",
        "P" => "P",
        "Q" => "Q",
        "R" => "R",
        "S" => "S",
        "T" => "T",
        "U" => "U",
        "V" => "V",
        "W" => "W",
        "X" => "X",
        "Y" => "Y",
        "Z" => "Z",
        "a" => "a",
        "b" => "b",
        "c" => "c",
        "d" => "d",
        "e" => "e",
        "f" => "f",
        "g" => "g",
        "h" => "h",
        "i" => "i",
        "j" => "j",
        "k" => "k",
        "l" => "l",
        "m" => "m",
        "n" => "n",
        "o" => "o",
        "p" => "p",
        "q" => "q",
        "r" => "r",
        "s" => "s",
        "t" => "t",
        "u" => "u",
        "v" => "v",
        "w" => "w",
        "x" => "x",
        "y" => "y",
        "z" => "z",
        "㝉" => "一類何物",
        "𫙦" => "之物",
        "𦮪" => "其子",
        "𢒟" => "出入改滅",
        "𠜺" => "列序",
        "𠏁" => "化滅",
        "𠫰" => "參形",
        "𦣹" => "吾自",
        "𣝗" => "太始初核",
        "𦱡" => "如若",
        "𨹹" => "宇宙亡矣",
        "𡲵" => "尾末",
        "𠆤" => "序丁",
        "𠇮" => "序丙",
        "㐈" => "序乙",
        "𠇚" => "序甲",
        "佱" => "式形",
        "㧈" => "引用",
        "𤰆" => "應用",
        "効" => "效應",
        "𤅔" => "映表",
        "欤" => "是非",
        "𡒫" => "構物",
        "‐" => "為符名連",
        "亓" => "特定其物",
        "畧" => "省略一物",
        "謼" => "符名",
        "弌" => "等同",
        "筭" => "解算",
        "疎" => "註疏",
        "𧥝" => "詞素",
        "䥘" => "謬誤",
        "丩" => "連頸",
        "𣣓" => "間空",
        "侌" => "陰",
        "𣆄" => "陽",
        "𩠐" => "首始"
    ];
});
$symbols_set = NULL;
$symbols_set = (function () use (&$symbols_set, &$symbols_set_init) {
    $r = $symbols_set_init();
    $symbols_set = (function () use (&$r) {
        return $r;
    });
    return $r;
});
$symbols_set_neg = (function () use (&$symbols_set_neg, &$symbols_set_neg_init) {
    $r = $symbols_set_neg_init();
    $symbols_set_neg = (function () use (&$r) {
        return $r;
    });
    return $r;
});
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
$comment_t = 11;
$hole_t = 10;
$comment_comment = (function ($x) {
    return $x[(0 + 1)];
});
$____exports["new_comment"] = $new_comment;
$____exports["comment_p"] = $comment_p;
$____exports["comment_comment"] = $comment_comment;
$____exports["comment_x"] = $comment_x;
$____exports["un_comment_all"] = $un_comment_all;
$can_new_symbol_unicodechar_p = (function ($x) use (&$symbols_set_neg) {
    return ($symbols_set_neg()[(is_int($x) ? $x - 1 : $x)] != NULL);
});
$new_symbol_unicodechar = (function ($x) use (&$symbol_t) {
    return [$symbol_t, $x];
});
$can_new_symbol_p = (function ($x) use (&$symbols_set) {
    return ($symbols_set()[(is_int($x) ? $x - 1 : $x)] != NULL);
});
$new_symbol = (function ($x) use (&$new_symbol_unicodechar, &$symbols_set) {
    return $new_symbol_unicodechar($symbols_set()[(is_int($x) ? $x - 1 : $x)]);
});
$____exports["can_new_symbol_p"] = $can_new_symbol_p;
$____exports["New_Symbol"] = $New_Symbol;
$____exports["new_symbol"] = $new_symbol;
$____exports["symbol_p"] = $symbol_p;
$____exports["un_symbol"] = $un_symbol;
$____exports["New_Construction"] = $New_Construction;
$____exports["new_construction"] = $new_construction;
$____exports["construction_p"] = $construction_p;
$____exports["construction_head"] = $construction_head;
$____exports["construction_tail"] = $construction_tail;
$null_v = [$null_t];
$____exports["Null_V"] = $Null_V;
$____exports["null_v"] = $null_v;
$____exports["null_p"] = $null_p;
$____exports["New_Data"] = $New_Data;
$____exports["new_data"] = $new_data;
$____exports["data_p"] = $data_p;
$____exports["data_name"] = $data_name;
$____exports["data_list"] = $data_list;
$____exports["New_Error"] = $New_Error;
$____exports["new_error"] = $new_error;
$____exports["error_p"] = $error_p;
$____exports["error_name"] = $error_name;
$____exports["error_list"] = $error_list;
$____exports["just_p"] = $just_p;
$____exports["evaluate"] = $evaluate;
$____exports["apply"] = $apply;
$force_uncomment_all_rec = (function ($raw) use (&$comment_p, &$construction_p, &$data_p, &$error_p, &$force_all_rec, &$force_uncomment_all, &$force_uncomment_all_rec, &$lang_copy_do) {
    $x = $force_uncomment_all($raw);
    $conslike = (function ($xx) use (&$comment_p, &$force_all_rec, &$force_uncomment_all_rec, &$lang_copy_do) {
        $xx[(0 + 1)] = $force_all_rec($xx[(0 + 1)]);
        $xx[(1 + 1)] = $force_all_rec($xx[(1 + 1)]);
        if (($comment_p($xx[(0 + 1)]) || $comment_p($xx[(1 + 1)]))) {
            $ret = $lang_copy_do($xx);
            $a = $xx[(0 + 1)];
            $d = $xx[(1 + 1)];
            $a1 = $force_uncomment_all_rec($a);
            $d1 = $force_uncomment_all_rec($d);
            $ret[(0 + 1)] = $a1;
            $ret[(1 + 1)] = $d1;
            return $ret;
        } else {
            return $xx;
        }

    });
    if ($data_p($x)) {
        return $conslike($x);
    } elseif ($error_p($x)) {
        return $conslike($x);
    } elseif ($construction_p($x)) {
        return $conslike($x);
    }
    return $x;
});
$____exports["force_all_rec"] = $force_all_rec;
$____exports["force_uncomment_all_rec"] = $force_uncomment_all_rec;
$system_symbol = $new_symbol("太始初核");
$name_symbol = $new_symbol("符名");
$function_symbol = $new_symbol("化滅");
$form_symbol = $new_symbol("式形");
$equal_symbol = $new_symbol("等同");
$evaluate_sym = $new_symbol("解算");
$theThing_symbol = $new_symbol("特定其物");
$something_symbol = $new_symbol("省略一物");
$mapping_symbol = $new_symbol("映表");
$if_symbol = $new_symbol("如若");
$typeAnnotation_symbol = $new_symbol("一類何物");
$isOrNot_symbol = $new_symbol("是非");
$sub_symbol = $new_symbol("其子");
$true_symbol = $new_symbol("陽");
$false_symbol = $new_symbol("陰");
$quote_symbol = $new_symbol("引用");
$apply_symbol = $new_symbol("應用");
$null_symbol = $new_symbol("間空");
$construction_symbol = $new_symbol("連頸");
$data_symbol = $new_symbol("構物");
$error_symbol = $new_symbol("謬誤");
$symbol_symbol = $new_symbol("詞素");
$list_symbol = $new_symbol("列序");
$head_symbol = $new_symbol("首始");
$tail_symbol = $new_symbol("尾末");
$thing_symbol = $new_symbol("之物");
$theWorldStopped_symbol = $new_symbol("宇宙亡矣");
$effect_symbol = $new_symbol("效應");
$comment_symbol = $new_symbol("註疏");
$the_world_stopped_v = $new_error($system_symbol, $new_list($theWorldStopped_symbol, $something_symbol));
$systemName_make = (function ($x) use (&$name_symbol, &$new_construction, &$new_data, &$null_v, &$system_symbol) {
    return $new_data($name_symbol, $new_construction($system_symbol, $new_construction($x, $null_v)));
});
$make_builtin_f_new_sym_f = (function ($x_sym) use (&$function_symbol, &$new_list, &$something_symbol, &$systemName_make, &$theThing_symbol, &$typeAnnotation_symbol) {
    return $systemName_make($new_list(
        $typeAnnotation_symbol,
        $new_list($function_symbol, $something_symbol, $x_sym),
        $theThing_symbol
    ));
});
$make_builtin_f_get_sym_f = (function ($t_sym, $x_sym) use (&$function_symbol, &$new_list, &$something_symbol, &$systemName_make, &$typeAnnotation_symbol) {
    return $systemName_make($new_list(
        $typeAnnotation_symbol,
        $new_list($function_symbol, $new_list($t_sym), $something_symbol),
        $x_sym
    ));
});
$make_builtin_f_p_sym_f = (function ($t_sym) use (&$function_symbol, &$isOrNot_symbol, &$new_list, &$something_symbol, &$systemName_make, &$typeAnnotation_symbol) {
    return $systemName_make($new_list(
        $typeAnnotation_symbol,
        $function_symbol,
        $new_list($isOrNot_symbol, $new_list($typeAnnotation_symbol, $t_sym, $something_symbol))
    ));
});
$new_data_function_builtin_systemName = $make_builtin_f_new_sym_f($data_symbol);
$data_name_function_builtin_systemName = $make_builtin_f_get_sym_f($data_symbol, $name_symbol);
$data_list_function_builtin_systemName = $make_builtin_f_get_sym_f($data_symbol, $list_symbol);
$data_p_function_builtin_systemName = $make_builtin_f_p_sym_f($data_symbol);
$new_error_function_builtin_systemName = $make_builtin_f_new_sym_f($error_symbol);
$error_name_function_builtin_systemName = $make_builtin_f_get_sym_f($error_symbol, $name_symbol);
$error_list_function_builtin_systemName = $make_builtin_f_get_sym_f($error_symbol, $list_symbol);
$error_p_function_builtin_systemName = $make_builtin_f_p_sym_f($error_symbol);
$new_construction_function_builtin_systemName = $make_builtin_f_new_sym_f($construction_symbol);
$construction_p_function_builtin_systemName = $make_builtin_f_p_sym_f($construction_symbol);
$construction_head_function_builtin_systemName = $make_builtin_f_get_sym_f($construction_symbol, $head_symbol);
$construction_tail_function_builtin_systemName = $make_builtin_f_get_sym_f($construction_symbol, $tail_symbol);
$symbol_p_function_builtin_systemName = $make_builtin_f_p_sym_f($symbol_symbol);
$null_p_function_builtin_systemName = $make_builtin_f_p_sym_f($null_symbol);
$equal_p_function_builtin_systemName = $systemName_make($new_list(
    $typeAnnotation_symbol,
    $function_symbol,
    $new_list($isOrNot_symbol, $equal_symbol)
));
$apply_function_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $new_list(
    $function_symbol,
    $new_construction($function_symbol, $something_symbol),
    $something_symbol
), $apply_symbol));
$evaluate_function_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $function_symbol, $evaluate_sym));
$list_chooseOne_function_builtin_systemName = $make_builtin_f_get_sym_f($list_symbol, $new_list($typeAnnotation_symbol, $thing_symbol, $something_symbol));
$if_function_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $function_symbol, $if_symbol));
$quote_form_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $form_symbol, $quote_symbol));
$lambda_form_builtin_systemName = $systemName_make($new_list(
    $typeAnnotation_symbol,
    $new_list($form_symbol, $new_list($function_symbol, $something_symbol, $function_symbol)),
    $theThing_symbol
));
$function_builtin_use_systemName = $systemName_make($new_list($form_symbol, $new_list($system_symbol, $function_symbol)));
$form_builtin_use_systemName = $systemName_make($new_list($form_symbol, $new_list($system_symbol, $form_symbol)));
$form_use_systemName = $systemName_make($new_list($form_symbol, $form_symbol));
$comment_function_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $function_symbol, $comment_symbol));
$comment_form_builtin_systemName = $systemName_make($new_list($typeAnnotation_symbol, $form_symbol, $comment_symbol));
$false_v = $new_data($false_symbol, $new_list());
$true_v = $new_data($true_symbol, $new_list());
$list_to_jsArray = (function ($xs, $k_done, $k_tail) use (&$__TS__ArrayPush, &$construction_head, &$construction_p, &$construction_tail, &$null_p) {
    $ret = [];
    while ($construction_p($xs)) {
        try {
            (function () use (&$__TS__ArrayPush, &$construction_head, &$construction_tail, &$ret, &$xs) {
                $__TS__ArrayPush($ret, $construction_head($xs));
                $xs = $construction_tail($xs);
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    if ($null_p($xs)) {
        return $k_done($ret);
    }
    return $k_tail($ret, $xs);
});
$maybe_list_to_jsArray = (function ($xs) use (&$list_to_jsArray) {
    return $list_to_jsArray($xs, (function ($x) {
        return $x;
    }), (function ($_1, $_2) {
        return false;
    }));
});
$____exports["jsArray_to_list"] = $jsArray_to_list;
$____exports["maybe_list_to_jsArray"] = $maybe_list_to_jsArray;
$____exports["new_list"] = $new_list;
$un_just_comment_all = (function ($x) use (&$comment_p, &$just_p, &$un_comment_all, &$un_just_all) {
    while (($just_p($x) || $comment_p($x))) {
        try {
            (function () use (&$un_comment_all, &$un_just_all, &$x) {
                $x = $un_just_all($un_comment_all($x));
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $x;
});
$____exports["un_just"] = $un_just_all;
$____exports["un_just_comment_all"] = $un_just_comment_all;
$____exports["delay_p"] = $any_delay_p;
$____exports["delay_just_p"] = $any_delay_just_p;
$any_delay2delay_evaluate = (function ($x) use (&$LANG_ERROR, &$delay_apply_p, &$delay_builtin_form_p, &$delay_builtin_func_p, &$delay_evaluate_p) {
    if ($delay_evaluate_p($x)) {
        return $x;
    } elseif ($delay_builtin_form_p($x)) {
        throw new Exception("WIP");
    } elseif ($delay_builtin_func_p($x)) {
        throw new Exception("WIP");
    } elseif ($delay_apply_p($x)) {
        throw new Exception("WIP");
    }
    return $LANG_ERROR();
});
$any_delay_env = (function ($x) use (&$any_delay2delay_evaluate, &$delay_evaluate_env) {
    return $delay_evaluate_env($any_delay2delay_evaluate($x));
});
$any_delay_x = (function ($x) use (&$any_delay2delay_evaluate, &$delay_evaluate_x) {
    return $delay_evaluate_x($any_delay2delay_evaluate($x));
});
$____exports["delay_env"] = $any_delay_env;
$____exports["delay_x"] = $any_delay_x;
$force_all_export = (function ($raw) use (&$force_all) {
    return $force_all($raw);
});
$force_uncomment1 = (function ($raw) use (&$comment_p, &$comment_x, &$force1) {
    if ($comment_p($raw)) {
        return $comment_x($raw);
    } else {
        return $force1($raw);
    }

});
$____exports["force_all"] = $force_all_export;
$____exports["force1"] = $force1;
$____exports["force_uncomment1"] = $force_uncomment1;
$____exports["force_uncomment_all"] = $force_uncomment_all;
$env_null_v = [];
$val2env = (function ($x) use (&$__TS__ArrayPush, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$force_all, &$jsbool_equal_p, &$mapping_symbol, &$null_p, &$symbol_equal_p, &$symbol_p) {
    $x = $force_all($x);
    if (!($data_p($x))) {
        return false;
    }
    $s = $force_all($data_name($x));
    if (!($symbol_p($s))) {
        return false;
    }
    if (!($symbol_equal_p($s, $mapping_symbol))) {
        return false;
    }
    $s = $force_all($data_list($x));
    if (!($construction_p($s))) {
        return false;
    }
    if (!($null_p($force_all($construction_tail($s))))) {
        return false;
    }
    $ret = [];
    $xs = $force_all($construction_head($s));
    while (!($null_p($xs))) {
        try {
            (function () use (&$__TS__ArrayPush, &$construction_head, &$construction_p, &$construction_tail, &$force_all, &$jsbool_equal_p, &$null_p, &$ret, &$xs) {
                if (!($construction_p($xs))) {
                    return false;
                }
                $x_1 = $force_all($construction_head($xs));
                $xs = $force_all($construction_tail($xs));
                if (!($construction_p($x_1))) {
                    return false;
                }
                $k = $construction_head($x_1);
                $x_1 = $force_all($construction_tail($x_1));
                if (!($construction_p($x_1))) {
                    return false;
                }
                $v = $construction_head($x_1);
                if (!($null_p($force_all($construction_tail($x_1))))) {
                    return false;
                }
                $not_breaked = true;
                
                {
                    $i = 0;
                    while (($i < (is_string($ret) ? strlen($ret) : count($ret)))) {
                        try {
                            (function () use (&$i, &$jsbool_equal_p, &$k, &$not_breaked, &$ret, &$v) {
                                if ($jsbool_equal_p($ret[(($i + 0) + 0)], $k)) {
                                    $ret[(($i + 1) + 0)] = $v;
                                    $not_breaked = false;
                                    throw new Exception("lUa_bReAk_LuA");
                                }
                                $i = ($i + 2);
                            })();
                        } catch (Exception $lUa_E_LuA) {
                            if ($e->getMessage() == "lUa_bReAk_LuA") {
                                break;
                            } else {
                                throw $lUa_E_LuA;
                            }

                        }
                    }
                }

                if ($not_breaked) {
                    $__TS__ArrayPush($ret, $k);
                    $__TS__ArrayPush($ret, $v);
                }
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $ret;
});
$____exports["env_null_v"] = $env_null_v;
$____exports["env_set"] = $env_set;
$____exports["env_get"] = $env_get;
$____exports["env2val"] = $env2val;
$____exports["env_foreach"] = $env_foreach;
$____exports["val2env"] = $val2env;
$make_builtin_p_func = (function ($p_sym, $p_jsfunc) use (&$any_delay_just_p, &$builtin_func_apply, &$false_v, &$force1, &$true_v) {
    return [
        $p_sym,
        1,
        (function ($x, $error_v) use (&$any_delay_just_p, &$builtin_func_apply, &$false_v, &$force1, &$p_jsfunc, &$p_sym, &$true_v) {
            $x = $force1($x);
            if ($any_delay_just_p($x)) {
                return $builtin_func_apply($p_sym, [$x]);
            }
            if ($p_jsfunc($x)) {
                return $true_v;
            }
            return $false_v;
        })
    ];
});
$make_builtin_get_func = (function ($f_sym, $p_jsfunc, $f_jsfunc) use (&$any_delay_just_p, &$builtin_func_apply, &$force1) {
    return [
        $f_sym,
        1,
        (function ($x, $error_v) use (&$any_delay_just_p, &$builtin_func_apply, &$f_jsfunc, &$f_sym, &$force1, &$p_jsfunc) {
            $x = $force1($x);
            if ($any_delay_just_p($x)) {
                return $builtin_func_apply($f_sym, [$x]);
            }
            if ($p_jsfunc($x)) {
                return $f_jsfunc($x);
            }
            return $error_v;
        })
    ];
});
$real_builtin_func_apply_s = [
    $make_builtin_p_func($data_p_function_builtin_systemName, $data_p),
    [$new_data_function_builtin_systemName, 2, $new_data],
    $make_builtin_get_func($data_name_function_builtin_systemName, $data_p, $data_name),
    $make_builtin_get_func($data_list_function_builtin_systemName, $data_p, $data_list),
    $make_builtin_p_func($error_p_function_builtin_systemName, $error_p),
    [$new_error_function_builtin_systemName, 2, $new_error],
    $make_builtin_get_func($error_name_function_builtin_systemName, $error_p, $error_name),
    $make_builtin_get_func($error_list_function_builtin_systemName, $error_p, $error_list),
    $make_builtin_p_func($null_p_function_builtin_systemName, $null_p),
    [$new_construction_function_builtin_systemName, 2, $new_construction],
    $make_builtin_p_func($construction_p_function_builtin_systemName, $construction_p),
    $make_builtin_get_func(
        $construction_head_function_builtin_systemName,
        $construction_p,
        $construction_head
    ),
    $make_builtin_get_func(
        $construction_tail_function_builtin_systemName,
        $construction_p,
        $construction_tail
    ),
    [
        $equal_p_function_builtin_systemName,
        2,
        (function ($x, $y, $error_v) use (&$LANG_ASSERT, &$LANG_ERROR, &$any_delay_just_p, &$builtin_func_apply, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$equal_p_function_builtin_systemName, &$error_list, &$error_name, &$error_p, &$false_v, &$force1, &$if_function_builtin_systemName, &$null_p, &$symbol_equal_p, &$symbol_p, &$true_v) {
            if (($x == $y)) {
                return $true_v;
            }
            $x = $force1($x);
            $y = $force1($y);
            if (($any_delay_just_p($x) || $any_delay_just_p($y))) {
                return $builtin_func_apply($equal_p_function_builtin_systemName, [$x, $y]);
            }
            if (($x == $y)) {
                return $true_v;
            }
            $H_if = (function ($b, $xx, $yy) use (&$builtin_func_apply, &$if_function_builtin_systemName) {
                return $builtin_func_apply($if_function_builtin_systemName, [$b, $xx, $yy]);
            });
            $H_and = (function ($xx, $yy) use (&$H_if, &$false_v) {
                return $H_if($xx, $yy, $false_v);
            });
            $LANG_ASSERT(!($any_delay_just_p($x)));
            $end_2 = (function ($xx, $yy, $f1, $f2) use (&$H_and, &$builtin_func_apply, &$equal_p_function_builtin_systemName) {
                return $H_and(
                    $builtin_func_apply($equal_p_function_builtin_systemName, [$f1($xx), $f1($yy)]),
                    $builtin_func_apply($equal_p_function_builtin_systemName, [$f2($xx), $f2($yy)])
                );
            });
            if ($null_p($x)) {
                if (!($null_p($x))) {
                    return $false_v;
                }
                return $true_v;
            } elseif ($symbol_p($x)) {
                if (!($symbol_p($y))) {
                    return $false_v;
                }
                return (($symbol_equal_p($x, $y) && $true_v) || $false_v);
            } elseif ($data_p($x)) {
                if (!($data_p($y))) {
                    return $false_v;
                }
                return $end_2($x, $y, $data_name, $data_list);
            } elseif ($construction_p($x)) {
                if (!($construction_p($y))) {
                    return $false_v;
                }
                return $end_2($x, $y, $construction_head, $construction_tail);
            } elseif ($error_p($x)) {
                if (!($error_p($y))) {
                    return $false_v;
                }
                return $end_2($x, $y, $error_name, $error_list);
            }
            return $LANG_ERROR();
        })
    ],
    [
        $apply_function_builtin_systemName,
        2,
        (function ($f, $xs, $error_v) use (&$__TS__ArrayPush, &$apply, &$construction_head, &$construction_p, &$construction_tail, &$force_all, &$null_p) {
            $jslist = [];
            $iter = $force_all($xs);
            while ($construction_p($iter)) {
                try {
                    (function () use (&$__TS__ArrayPush, &$construction_head, &$construction_tail, &$force_all, &$iter, &$jslist) {
                        $__TS__ArrayPush($jslist, $construction_head($iter));
                        $iter = $force_all($construction_tail($iter));
                    })();
                } catch (Exception $lUa_E_LuA) {
                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                        break;
                    } else {
                        throw $lUa_E_LuA;
                    }

                }
            }
            if (!($null_p($iter))) {
                return $error_v;
            }
            return $apply($f, $jslist);
        })
    ],
    [
        $evaluate_function_builtin_systemName,
        2,
        (function ($env, $x, $error_v) use (&$evaluate, &$val2env) {
            $maybeenv = $val2env($env);
            if (($maybeenv == false)) {
                return $error_v;
            }
            return $evaluate($maybeenv, $x);
        })
    ],
    $make_builtin_p_func($symbol_p_function_builtin_systemName, $symbol_p),
    [
        $list_chooseOne_function_builtin_systemName,
        1,
        (function ($xs, $error_v) use (&$any_delay_just_p, &$builtin_func_apply, &$construction_head, &$construction_p, &$force1, &$list_chooseOne_function_builtin_systemName) {
            $xs = $force1($xs);
            if ($any_delay_just_p($xs)) {
                return $builtin_func_apply($list_chooseOne_function_builtin_systemName, [$xs]);
            }
            if (!($construction_p($xs))) {
                return $error_v;
            }
            return $construction_head($xs);
        })
    ],
    [
        $if_function_builtin_systemName,
        3,
        (function ($b, $x, $y, $error_v) use (&$any_delay_just_p, &$builtin_func_apply, &$data_name, &$data_p, &$false_symbol, &$force1, &$force_all, &$if_function_builtin_systemName, &$symbol_equal_p, &$symbol_p, &$true_symbol) {
            $b = $force1($b);
            if ($any_delay_just_p($b)) {
                return $builtin_func_apply($if_function_builtin_systemName, [$b, $x, $y]);
            }
            if (!($data_p($b))) {
                return $error_v;
            }
            $nam = $force_all($data_name($b));
            if (!($symbol_p($nam))) {
                return $error_v;
            }
            if ($symbol_equal_p($nam, $true_symbol)) {
                return $x;
            }
            if ($symbol_equal_p($nam, $false_symbol)) {
                return $y;
            }
            return $error_v;
        })
    ],
    [$comment_function_builtin_systemName, 2, $new_comment]
];
$____exports["equal_p"] = $jsbool_equal_p;
$jsbool_no_force_equal_p = (function ($x, $y) use (&$LANG_ERROR, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_apply_p, &$delay_builtin_form_p, &$delay_builtin_func_p, &$delay_evaluate_p, &$error_list, &$error_name, &$error_p, &$jsbool_no_force_equal_p, &$lang_set_do, &$null_p, &$null_v, &$symbol_equal_p, &$symbol_p, &$un_just_all) {
    if (($x == $y)) {
        return true;
    }
    $x = $un_just_all($x);
    $y = $un_just_all($y);
    if (($x == $y)) {
        return true;
    }
    $end_2 = (function ($xx, $yy, $f1, $f2) use (&$jsbool_no_force_equal_p, &$lang_set_do) {
        if (($jsbool_no_force_equal_p($f1($xx), $f1($yy)) &&
            $jsbool_no_force_equal_p($f2($xx), $f2($yy)))) {
            $lang_set_do($xx, $yy);
            return true;
        } else {
            return false;
        }

    });
    if ($null_p($x)) {
        if (!($null_p($y))) {
            return false;
        }
        $lang_set_do($x, $null_v);
        $lang_set_do($y, $null_v);
        return true;
    } elseif ($symbol_p($x)) {
        if (!($symbol_p($y))) {
            return false;
        }
        return $symbol_equal_p($x, $y);
    } elseif ($construction_p($x)) {
        if (!($construction_p($y))) {
            return false;
        }
        return $end_2($x, $y, $construction_head, $construction_tail);
    } elseif ($error_p($x)) {
        if (!($error_p($y))) {
            return false;
        }
        return $end_2($x, $y, $error_name, $error_list);
    } elseif ($data_p($x)) {
        if (!($data_p($y))) {
            return false;
        }
        return $end_2($x, $y, $data_name, $data_list);
    } elseif ($delay_evaluate_p($x)) {
        throw new Exception("WIP");
    } elseif ($delay_builtin_func_p($x)) {
        throw new Exception("WIP");
    } elseif ($delay_builtin_form_p($x)) {
        throw new Exception("WIP");
    } elseif ($delay_apply_p($x)) {
        throw new Exception("WIP");
    }
    return $LANG_ERROR();
});
$simple_print_force_all_rec = (function ($x) use (&$force_all_rec, &$simple_print) {
    return $simple_print($force_all_rec($x));
});
$____exports["simple_print"] = $simple_print;
$____exports["simple_print_force_all_rec"] = $simple_print_force_all_rec;
$complex_parse = (function ($x) use (&$LANG_ASSERT, &$__TS__ArrayPush, &$apply, &$builtin_form_apply, &$builtin_func_apply, &$can_new_symbol_p, &$construction_head, &$construction_p, &$construction_tail, &$evaluate, &$form_symbol, &$function_symbol, &$hole_set_do, &$isOrNot_symbol, &$jsArray_to_list, &$lUa_I_LuA, &$list_to_jsArray, &$new_construction, &$new_data, &$new_error, &$new_hole_do, &$new_list, &$new_symbol, &$null_p, &$null_v, &$something_symbol, &$sub_symbol, &$symbol_p, &$systemName_make, &$system_symbol, &$theThing_symbol, &$tostring, &$typeAnnotation_symbol, &$val2env) {
    $state_const = NULL;
    $state = NULL;
    $eof = NULL;
    $get = NULL;
    $put = NULL;
    $parse_error = NULL;
    $a_space_p = NULL;
    $space = NULL;
    $symbol = NULL;
    $readlist = NULL;
    $data = NULL;
    $readerror = NULL;
    $readeval = NULL;
    $readfuncapply = NULL;
    $readformbuiltin = NULL;
    $readapply = NULL;
    $a_symbol_p = NULL;
    $val = NULL;
    $un_maybe = NULL;
    $not_eof = NULL;
    $assert_get = NULL;
    $readsysname_no_pack_inner_must = NULL;
    $may_xfx_xf = NULL;
    $readsysname_no_pack = NULL;
    $readsysname = NULL;
    $eof = (function () use (&$state, &$state_const) {
        return ((is_string($state_const) ? strlen($state_const) : count($state_const)) == $state);
    });
    $get = (function () use (&$LANG_ASSERT, &$eof, &$state, &$state_const) {
        $LANG_ASSERT(!($eof()));
        $lUaTmP_8_LuAtMp = ($state + 0);
        $ret = substr($state_const, $lUaTmP_8_LuAtMp, ($state + 1) - $lUaTmP_8_LuAtMp);
        $state = ($state + 1);
        return $ret;
    });
    $put = (function ($chr) use (&$LANG_ASSERT, &$state, &$state_const) {
        $lUaTmP_9_LuAtMp = (($state - 1) + 0);
        $LANG_ASSERT(
            (substr($state_const, $lUaTmP_9_LuAtMp, (($state - 1) + 1) - $lUaTmP_9_LuAtMp) ==
                $chr)
        );
        $state = ($state - 1);
    });
    $parse_error = (function ($x) use (&$tostring) {
        if (($x_1 == NULL)) {
            $x_1 = "";
        }
        throw new Exception(("TheLanguage parse ERROR!" . $tostring($x_1)));
    });
    $a_space_p = (function ($chr) {
        return (((($chr == " ") || ($chr == "\n")) || ($chr == "\t")) || ($chr == "\r"));
    });
    $space = (function () use (&$a_space_p, &$eof, &$get, &$put) {
        if ($eof()) {
            return false;
        }
        $x_1 = $get();
        if (!($a_space_p($x_1))) {
            $put($x_1);
            return false;
        }
        while (($a_space_p($x_1) && !($eof()))) {
            try {
                (function () use (&$get, &$x_1) {
                    $x_1 = $get();
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        if (!($a_space_p($x_1))) {
            $put($x_1);
        }
        return true;
    });
    $symbol = (function () use (&$a_symbol_p, &$can_new_symbol_p, &$eof, &$get, &$new_symbol, &$parse_error, &$put, &$tostring) {
        if ($eof()) {
            return false;
        }
        $x_1 = $get();
        $ret = "";
        if (!($a_symbol_p($x_1))) {
            $put($x_1);
            return false;
        }
        while (($a_symbol_p($x_1) && !($eof()))) {
            try {
                (function () use (&$get, &$ret, &$tostring, &$x_1) {
                    $ret = ($tostring($ret) . $tostring($x_1));
                    $x_1 = $get();
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        if ($a_symbol_p($x_1)) {
            $ret = ($tostring($ret) . $tostring($x_1));
        } else {
            $put($x_1);
        }

        if ($can_new_symbol_p($ret)) {
            return $new_symbol($ret);
        } else {
            return $parse_error(("Not Symbol" . $tostring($ret)));
        }

    });
    $readlist = (function () use (&$eof, &$get, &$hole_set_do, &$new_construction, &$new_hole_do, &$null_v, &$parse_error, &$put, &$space, &$val) {
        if ($eof()) {
            return false;
        }
        $x_1 = $get();
        if (($x_1 != "(")) {
            $put($x_1);
            return false;
        }
        $ret_last = $new_hole_do();
        $ret = $ret_last;
        $last_add_do = (function ($val) use (&$hole_set_do, &$new_construction, &$new_hole_do, &$ret_last) {
            $ret_last2 = $new_hole_do();
            $hole_set_do($ret_last, $new_construction($val_1, $ret_last2));
            $ret_last = $ret_last2;
        });
        while (true) {
            try {
                (function () use (&$eof, &$get, &$hole_set_do, &$last_add_do, &$null_v, &$parse_error, &$put, &$ret, &$ret_last, &$space, &$val, &$x_1) {
                    $space();
                    if ($eof()) {
                        return $parse_error();
                    }
                    $x_1 = $get();
                    if (($x_1 == ")")) {
                        $hole_set_do($ret_last, $null_v);
                        return $ret;
                    }
                    if (($x_1 == ".")) {
                        $space();
                        $e = $val();
                        $hole_set_do($ret_last, $e);
                        $space();
                        if ($eof()) {
                            return $parse_error();
                        }
                        $x_1 = $get();
                        if (($x_1 != ")")) {
                            return $parse_error();
                        }
                        return $ret;
                    }
                    $put($x_1);
                    $e_1 = $val();
                    $last_add_do($e_1);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
    });
    $data = (function () use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$new_data, &$parse_error, &$put, &$readlist) {
        if ($eof()) {
            return false;
        }
        $x_1 = $get();
        if (($x_1 != "#")) {
            $put($x_1);
            return false;
        }
        $xs = $readlist();
        if (($xs == false)) {
            return $parse_error();
        }
        if (!($construction_p($xs))) {
            return $parse_error();
        }
        return $new_data($construction_head($xs), $construction_tail($xs));
    });
    $readerror = (function () use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$new_error, &$parse_error, &$put, &$readlist) {
        if ($eof()) {
            return false;
        }
        $x_1 = $get();
        if (($x_1 != "!")) {
            $put($x_1);
            return false;
        }
        $xs = $readlist();
        if (($xs == false)) {
            return $parse_error();
        }
        if (!($construction_p($xs))) {
            return $parse_error();
        }
        return $new_error($construction_head($xs), $construction_tail($xs));
    });
    $a_symbol_p = (function ($chr) use (&$a_space_p, &$lUa_I_LuA) {
        if ($a_space_p($chr)) {
            return false;
        }
        $____TS_array = ["(", ")", "!", "#", ".", "\$", "%", "^", "@", "~", "/", "-", ">", "_", ":", "?", "[", "]", "&"];
        $lUaTmP_10_LuAtMp = (is_string($____TS_array) ? strlen($____TS_array) : count($____TS_array));
        $lUaTmP_11_LuAtMp = 1;
        for ($lUa_I_LuA = 1; $lUaTmP_11_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_10_LuAtMp : $lUa_I_LuA > $lUaTmP_10_LuAtMp; $lUa_I_LuA += $lUaTmP_11_LuAtMp) {
            try {
                (function () use (&$____TS_array, &$chr, &$lUa_I_LuA) {
                    $____TS_index = $lUa_I_LuA;
                    $v = $____TS_array[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                    if (($v == $chr)) {
                        return false;
                    }
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        return true;
    });
    $val = (function () use (&$data, &$parse_error, &$readapply, &$readerror, &$readeval, &$readformbuiltin, &$readfuncapply, &$readlist, &$readsysname, &$space) {
        $space();
        $fs = [
            $readlist,
            $readsysname,
            $data,
            $readerror,
            $readeval,
            $readfuncapply,
            $readformbuiltin,
            $readapply
        ];
        
        {
            $i = 0;
            while (($i < (is_string($fs) ? strlen($fs) : count($fs)))) {
                try {
                    (function () use (&$fs, &$i) {
                        $x_1 = $fs[($i + 0)]();
                        if (($x_1 != false)) {
                            return $x_1;
                        }
                        $i = ($i + 1);
                    })();
                } catch (Exception $lUa_E_LuA) {
                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                        break;
                    } else {
                        throw $lUa_E_LuA;
                    }

                }
            }
        }

        return $parse_error();
    });
    $un_maybe = (function ($vl) use (&$parse_error) {
        if (($vl == false)) {
            return $parse_error();
        }
        return $vl;
    });
    $not_eof = (function () use (&$eof) {
        return !($eof());
    });
    $assert_get = (function ($c) use (&$get, &$not_eof, &$un_maybe) {
        $un_maybe($not_eof());
        $un_maybe(($get() == $c));
    });
    $readsysname_no_pack_inner_must = (function ($strict) use (&$assert_get, &$data, &$parse_error, &$readapply, &$readerror, &$readeval, &$readformbuiltin, &$readfuncapply, &$readlist, &$readsysname_no_pack, &$readsysname_no_pack_inner_must, &$symbol) {
        if (($strict == NULL)) {
            $strict = false;
        }
        $readsysname_no_pack_bracket = (function () use (&$assert_get, &$readsysname_no_pack_inner_must) {
            $assert_get("[");
            $x_1 = $readsysname_no_pack_inner_must();
            $assert_get("]");
            return $x_1;
        });
        $fs = (($strict &&
            [
            $readlist,
            $symbol,
            $readsysname_no_pack_bracket,
            $data,
            $readerror,
            $readeval,
            $readfuncapply,
            $readformbuiltin,
            $readapply
        ]) ||
            [
            $readlist,
            $readsysname_no_pack,
            $data,
            $readerror,
            $readeval,
            $readfuncapply,
            $readformbuiltin,
            $readapply
        ]);
        
        {
            $i = 0;
            while (($i < (is_string($fs) ? strlen($fs) : count($fs)))) {
                try {
                    (function () use (&$fs, &$i) {
                        $x_1 = $fs[($i + 0)]();
                        if (($x_1 != false)) {
                            return $x_1;
                        }
                        $i = ($i + 1);
                    })();
                } catch (Exception $lUa_E_LuA) {
                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                        break;
                    } else {
                        throw $lUa_E_LuA;
                    }

                }
            }
        }

        return $parse_error();
    });
    $may_xfx_xf = (function ($vl) use (&$__TS__ArrayPush, &$eof, &$function_symbol, &$get, &$isOrNot_symbol, &$jsArray_to_list, &$new_construction, &$new_list, &$put, &$readsysname_no_pack_inner_must, &$something_symbol, &$sub_symbol, &$typeAnnotation_symbol) {
        if ($eof()) {
            return $vl;
        }
        $head = $get();
        if (($head == ".")) {
            $y = $readsysname_no_pack_inner_must();
            return $new_list(
                $typeAnnotation_symbol,
                $new_list($function_symbol, $new_list($vl), $something_symbol),
                $y
            );
        } elseif (($head == ":")) {
            $y_1 = $readsysname_no_pack_inner_must();
            return $new_list($typeAnnotation_symbol, $y_1, $vl);
        } elseif (($head == "~")) {
            return $new_list($isOrNot_symbol, $vl);
        } elseif (($head == "@")) {
            $y_2 = $readsysname_no_pack_inner_must();
            return $new_list(
                $typeAnnotation_symbol,
                $new_list($function_symbol, $new_construction($vl, $something_symbol), $something_symbol),
                $y_2
            );
        } elseif (($head == "?")) {
            return $new_list($typeAnnotation_symbol, $function_symbol, $new_list($isOrNot_symbol, $vl));
        } elseif (($head == "/")) {
            $ys = [$vl];
            while (true) {
                try {
                    (function () use (&$__TS__ArrayPush, &$eof, &$get, &$put, &$readsysname_no_pack_inner_must, &$ys) {
                        $y_3 = $readsysname_no_pack_inner_must(true);
                        $__TS__ArrayPush($ys, $y_3);
                        if ($eof()) {
                            throw new Exception("lUa_bReAk_LuA");
                        }
                        $c0 = $get();
                        if (($c0 != "/")) {
                            $put($c0);
                            throw new Exception("lUa_bReAk_LuA");
                        }
                    })();
                } catch (Exception $lUa_E_LuA) {
                    if ($e->getMessage() == "lUa_bReAk_LuA") {
                        break;
                    } else {
                        throw $lUa_E_LuA;
                    }

                }
            }
            return $new_list($sub_symbol, $jsArray_to_list($ys));
        } else {
            $put($head);
            return $vl;
        }

    });
    $readsysname_no_pack = (function () use (&$assert_get, &$eof, &$form_symbol, &$function_symbol, &$get, &$may_xfx_xf, &$new_list, &$not_eof, &$put, &$readsysname_no_pack_inner_must, &$something_symbol, &$symbol, &$system_symbol, &$theThing_symbol, &$typeAnnotation_symbol, &$un_maybe) {
        if ($eof()) {
            return false;
        }
        $head = $get();
        if (($head == "&")) {
            $un_maybe($not_eof());
            $c0 = $get();
            if (($c0 == "+")) {
                $x_1 = $readsysname_no_pack_inner_must();
                return $new_list($form_symbol, $new_list($system_symbol, $x_1));
            } else {
                $put($c0);
            }

            $x_2 = $readsysname_no_pack_inner_must();
            return $new_list($form_symbol, $x_2);
        } elseif (($head == ":")) {
            $un_maybe($not_eof());
            $c0_1 = $get();
            if (($c0_1 == "&")) {
                $assert_get(">");
                $x_3 = $readsysname_no_pack_inner_must();
                return $new_list(
                    $typeAnnotation_symbol,
                    $new_list($form_symbol, $new_list($function_symbol, $something_symbol, $x_3)),
                    $theThing_symbol
                );
            } elseif (($c0_1 == ">")) {
                $x_4 = $readsysname_no_pack_inner_must();
                return $new_list(
                    $typeAnnotation_symbol,
                    $new_list($function_symbol, $something_symbol, $x_4),
                    $theThing_symbol
                );
            } else {
                $put($c0_1);
            }

            $x_5 = $readsysname_no_pack_inner_must();
            return $new_list($typeAnnotation_symbol, $x_5, $theThing_symbol);
        } elseif (($head == "+")) {
            $x_6 = $readsysname_no_pack_inner_must();
            return $new_list($system_symbol, $x_6);
        } elseif (($head == "[")) {
            $x_7 = $readsysname_no_pack_inner_must();
            $assert_get("]");
            return $may_xfx_xf($x_7);
        } elseif (($head == "_")) {
            $assert_get(":");
            $x_8 = $readsysname_no_pack_inner_must();
            return $new_list($typeAnnotation_symbol, $x_8, $something_symbol);
        } else {
            $put($head);
            $x_9 = $symbol();
            if (($x_9 == false)) {
                return false;
            }
            return $may_xfx_xf($x_9);
        }

    });
    $readsysname = (function () use (&$readsysname_no_pack, &$symbol_p, &$systemName_make) {
        $x_1 = $readsysname_no_pack();
        if (($x_1 == false)) {
            return false;
        }
        if ($symbol_p($x_1)) {
            return $x_1;
        }
        return $systemName_make($x_1);
    });
    $state_const = $x;
    $state = 0;
    $make_read_two = (function ($prefix, $k) use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$null_p, &$parse_error, &$put, &$readlist) {
        return (function () use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$k, &$null_p, &$parse_error, &$prefix, &$put, &$readlist) {
            if ($eof()) {
                return false;
            }
            $c = $get();
            if (($c != $prefix)) {
                $put($c);
                return false;
            }
            $xs = $readlist();
            if (($xs == false)) {
                return $parse_error();
            }
            if (!($construction_p($xs))) {
                return $parse_error();
            }
            $x_1 = $construction_tail($xs);
            if (!(($construction_p($x_1) && $null_p($construction_tail($x_1))))) {
                return $parse_error();
            }
            return $k($construction_head($xs), $construction_head($x_1));
        });
    });
    $make_read_three = (function ($prefix, $k) use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$null_p, &$parse_error, &$put, &$readlist) {
        return (function () use (&$construction_head, &$construction_p, &$construction_tail, &$eof, &$get, &$k, &$null_p, &$parse_error, &$prefix, &$put, &$readlist) {
            if ($eof()) {
                return false;
            }
            $c = $get();
            if (($c != $prefix)) {
                $put($c);
                return false;
            }
            $xs = $readlist();
            if (($xs == false)) {
                return $parse_error();
            }
            if (!($construction_p($xs))) {
                return $parse_error();
            }
            $x_1 = $construction_tail($xs);
            if (!($construction_p($x_1))) {
                return $parse_error();
            }
            $x_d = $construction_tail($x_1);
            if (!(($construction_p($x_d) && $null_p($construction_tail($x_d))))) {
                return $parse_error();
            }
            return $k($construction_head($xs), $construction_head($x_1), $construction_head($x_d));
        });
    });
    $readeval = $make_read_two("\$", (function ($ev, $val) use (&$evaluate, &$parse_error, &$val2env) {
        $env = $val2env($ev);
        if (($env == false)) {
            return $parse_error();
        }
        return $evaluate($env, $val_1);
    }));
    $readfuncapply = $make_read_two(
        "%",
        (function ($f, $xs) use (&$builtin_func_apply, &$list_to_jsArray, &$parse_error) {
            $jsxs = $list_to_jsArray($xs, (function ($v) {
                return $v;
            }), (function ($_1, $_2) use (&$parse_error) {
                return $parse_error();
            }));
            return $builtin_func_apply($f, $jsxs);
        })
    );
    $readformbuiltin = $make_read_three(
        "@",
        (function ($e, $f, $xs) use (&$builtin_form_apply, &$list_to_jsArray, &$parse_error, &$val2env) {
            $jsxs = $list_to_jsArray($xs, (function ($v) {
                return $v;
            }), (function ($_1, $_2) use (&$parse_error) {
                return $parse_error();
            }));
            $env = $val2env($e);
            if (($env == false)) {
                return $parse_error();
            }
            return $builtin_form_apply($env, $f, $jsxs);
        })
    );
    $readapply = $make_read_two("^", (function ($f, $xs) use (&$apply, &$list_to_jsArray, &$parse_error) {
        $jsxs = $list_to_jsArray($xs, (function ($v) {
            return $v;
        }), (function ($_1, $_2) use (&$parse_error) {
            return $parse_error();
        }));
        return $apply($f, $jsxs);
    }));
    return $val();
});
$____exports["complex_parse"] = $complex_parse;
$complex_print = (function ($val) use (&$LANG_ERROR, &$complex_parse, &$complex_print, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_apply_f, &$delay_apply_p, &$delay_apply_xs, &$delay_builtin_form_env, &$delay_builtin_form_f, &$delay_builtin_form_p, &$delay_builtin_form_xs, &$delay_builtin_func_f, &$delay_builtin_func_p, &$delay_builtin_func_xs, &$delay_evaluate_env, &$delay_evaluate_p, &$delay_evaluate_x, &$env2val, &$error_list, &$error_name, &$error_p, &$form_symbol, &$function_symbol, &$isOrNot_symbol, &$jsArray_to_list, &$jsbool_no_force_equal_p, &$maybe_list_to_jsArray, &$name_symbol, &$new_construction, &$null_p, &$simple_print, &$something_symbol, &$sub_symbol, &$symbol_p, &$systemName_make, &$system_symbol, &$theThing_symbol, &$tostring, &$typeAnnotation_symbol, &$un_symbol) {
    $print_sys_name = (function ($x, $is_inner_bool) use (&$construction_head, &$construction_p, &$construction_tail, &$form_symbol, &$function_symbol, &$isOrNot_symbol, &$jsbool_no_force_equal_p, &$maybe_list_to_jsArray, &$print_sys_name, &$simple_print, &$something_symbol, &$sub_symbol, &$symbol_p, &$systemName_make, &$system_symbol, &$theThing_symbol, &$tostring, &$typeAnnotation_symbol, &$un_symbol) {
        if ($symbol_p($x)) {
            return $un_symbol($x);
        }
        $inner_bracket = (function ($vl) use (&$is_inner_bool, &$tostring) {
            if ($is_inner_bool) {
                return ("[" . ($tostring($vl) . "]"));
            } else {
                return $vl;
            }

        });
        $maybe_xs = $maybe_list_to_jsArray($x);
        if (((($maybe_xs != false) &&
            ((is_string($maybe_xs) ? strlen($maybe_xs) : count($maybe_xs)) == 3)) &&
            $jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $typeAnnotation_symbol))) {
            $maybe_lst_2 = $maybe_list_to_jsArray($maybe_xs[(0 + 1)]);
            if (((($maybe_lst_2 != false) &&
                ((is_string($maybe_lst_2) ? strlen($maybe_lst_2) : count($maybe_lst_2)) == 3)) &&
                $jsbool_no_force_equal_p($maybe_lst_2[(-1 + 1)], $function_symbol))) {
                $var_2_1 = $maybe_lst_2[(0 + 1)];
                $maybe_lst_3 = $maybe_list_to_jsArray($var_2_1);
                if (((($maybe_lst_3 != false) &&
                    ((is_string($maybe_lst_3) ? strlen($maybe_lst_3) : count($maybe_lst_3)) == 1)) &&
                    $jsbool_no_force_equal_p($maybe_lst_2[(1 + 1)], $something_symbol))) {
                    return $inner_bracket(($tostring($print_sys_name($maybe_lst_3[(-1 + 1)], true)) .
                        ("." . $tostring($print_sys_name($maybe_xs[(1 + 1)], true)))));
                } elseif ((($construction_p($var_2_1) &&
                    $jsbool_no_force_equal_p($construction_tail($var_2_1), $something_symbol)) &&
                    $jsbool_no_force_equal_p($maybe_lst_2[(1 + 1)], $something_symbol))) {
                    return $inner_bracket(($tostring($print_sys_name($construction_head($var_2_1), true)) .
                        ("@" . $tostring($print_sys_name($maybe_xs[(1 + 1)], true)))));
                } elseif (($jsbool_no_force_equal_p($var_2_1, $something_symbol) &&
                    $jsbool_no_force_equal_p($maybe_xs[(1 + 1)], $theThing_symbol))) {
                    return $inner_bracket((":>" . $tostring($print_sys_name($maybe_lst_2[(1 + 1)], true))));
                }
            }
            $maybe_lst_44 = $maybe_list_to_jsArray($maybe_xs[(1 + 1)]);
            if (((($jsbool_no_force_equal_p($maybe_xs[(0 + 1)], $function_symbol) &&
                ($maybe_lst_44 != false)) &&
                ((is_string($maybe_lst_44) ? strlen($maybe_lst_44) : count($maybe_lst_44)) == 2)) &&
                $jsbool_no_force_equal_p($maybe_lst_44[(-1 + 1)], $isOrNot_symbol))) {
                return $inner_bracket(($tostring($print_sys_name($maybe_lst_44[(0 + 1)], true)) . "?"));
            }
            if ((((($maybe_lst_2 != false) &&
                ((is_string($maybe_lst_2) ? strlen($maybe_lst_2) : count($maybe_lst_2)) == 2)) &&
                $jsbool_no_force_equal_p($maybe_xs[(1 + 1)], $theThing_symbol)) &&
                $jsbool_no_force_equal_p($maybe_lst_2[(-1 + 1)], $form_symbol))) {
                $maybe_lst_88 = $maybe_list_to_jsArray($maybe_lst_2[(0 + 1)]);
                if ((((($maybe_lst_88 != false) &&
                    ((is_string($maybe_lst_88) ? strlen($maybe_lst_88) : count($maybe_lst_88)) == 3)) &&
                    $jsbool_no_force_equal_p($maybe_lst_88[(-1 + 1)], $function_symbol)) &&
                    $jsbool_no_force_equal_p($maybe_lst_88[(0 + 1)], $something_symbol))) {
                    return $inner_bracket((":&>" . $tostring($print_sys_name($maybe_lst_88[(1 + 1)], true))));
                }
            }
            $hd = ((($jsbool_no_force_equal_p($maybe_xs[(1 + 1)], $something_symbol) && "_") ||
                ($jsbool_no_force_equal_p($maybe_xs[(1 + 1)], $theThing_symbol) && "")) ||
                $print_sys_name($maybe_xs[(1 + 1)], true));
            return $inner_bracket(($tostring($hd) . (":" . $tostring($print_sys_name($maybe_xs[(0 + 1)], true)))));
        } elseif ((($maybe_xs != false) &&
            ((is_string($maybe_xs) ? strlen($maybe_xs) : count($maybe_xs)) == 2))) {
            if ($jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $form_symbol)) {
                $maybe_lst_288 = $maybe_list_to_jsArray($maybe_xs[(0 + 1)]);
                if (((($maybe_lst_288 != false) &&
                    ((is_string($maybe_lst_288) ? strlen($maybe_lst_288) : count($maybe_lst_288)) ==
                    2)) &&
                    $jsbool_no_force_equal_p($maybe_lst_288[(-1 + 1)], $system_symbol))) {
                    return $inner_bracket(("&+" . $tostring($print_sys_name($maybe_lst_288[(0 + 1)], true))));
                }
                return $inner_bracket(("&" . $tostring($print_sys_name($maybe_xs[(0 + 1)], true))));
            } elseif ($jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $isOrNot_symbol)) {
                return $inner_bracket(($tostring($print_sys_name($maybe_xs[(0 + 1)], true)) . "~"));
            } elseif ($jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $system_symbol)) {
                return $inner_bracket(("+" . $tostring($print_sys_name($maybe_xs[(0 + 1)], true))));
            } elseif ($jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $sub_symbol)) {
                $maybe_lst_8934 = $maybe_list_to_jsArray($maybe_xs[(0 + 1)]);
                if ((($maybe_lst_8934 != false) &&
                    ((is_string($maybe_lst_8934) ? strlen($maybe_lst_8934) : count($maybe_lst_8934)) >
                    1))) {
                    $tmp = $print_sys_name($maybe_lst_8934[(-1 + 1)], true);
                    
                    {
                        $i = 1;
                        while (($i <
                            (is_string($maybe_lst_8934) ? strlen($maybe_lst_8934) : count($maybe_lst_8934)))) {
                            try {
                                (function () use (&$i, &$maybe_lst_8934, &$print_sys_name, &$tmp, &$tostring) {
                                    $tmp = ($tostring($tmp) .
                                        ("/" . $tostring($print_sys_name($maybe_lst_8934[($i + 0)], true))));
                                    $i = ($i + 1);
                                })();
                            } catch (Exception $lUa_E_LuA) {
                                if ($e->getMessage() == "lUa_bReAk_LuA") {
                                    break;
                                } else {
                                    throw $lUa_E_LuA;
                                }

                            }
                        }
                    }

                    return $inner_bracket($tmp);
                }
            }
        }
        if ($is_inner_bool) {
            return $simple_print($x);
        } else {
            return $simple_print($systemName_make($x));
        }

    });
    $x = $complex_parse($simple_print($val));
    $temp = "";
    $prefix = "";
    if ($null_p($x)) {
        return "()";
    } elseif ($construction_p($x)) {
        $temp = "(";
        $prefix = "";
        while ($construction_p($x)) {
            try {
                (function () use (&$complex_print, &$construction_head, &$construction_tail, &$prefix, &$temp, &$tostring, &$x) {
                    $temp = ($tostring($temp) .
                        ($tostring($prefix) . $tostring($complex_print($construction_head($x)))));
                    $prefix = " ";
                    $x = $construction_tail($x);
                })();
            } catch (Exception $lUa_E_LuA) {
                if ($e->getMessage() == "lUa_bReAk_LuA") {
                    break;
                } else {
                    throw $lUa_E_LuA;
                }

            }
        }
        if ($null_p($x)) {
            $temp = ($tostring($temp) . ")");
        } else {
            $temp = ($tostring($temp) . (" . " . ($tostring($complex_print($x)) . ")")));
        }

        return $temp;
    } elseif ($data_p($x)) {
        $name = $data_name($x);
        $list = $data_list($x);
        $maybe_xs = $maybe_list_to_jsArray($list);
        if ((((($maybe_xs != false) &&
            ((is_string($maybe_xs) ? strlen($maybe_xs) : count($maybe_xs)) == 2)) &&
            $jsbool_no_force_equal_p($name, $name_symbol)) &&
            $jsbool_no_force_equal_p($maybe_xs[(-1 + 1)], $system_symbol))) {
            return $print_sys_name($maybe_xs[(0 + 1)], false);
        }
        return ("#" . $tostring($complex_print($new_construction($name, $list))));
    } elseif ($error_p($x)) {
        return ("!" .
            $tostring($complex_print($new_construction($error_name($x), $error_list($x)))));
    } elseif ($symbol_p($x)) {
        return $un_symbol($x);
    } elseif ($delay_evaluate_p($x)) {
        return ("\$(" .
            ($tostring($complex_print($env2val($delay_evaluate_env($x)))) .
            (" " . ($tostring($complex_print($delay_evaluate_x($x))) . ")"))));
    } elseif ($delay_builtin_func_p($x)) {
        return ("%(" .
            ($tostring($complex_print($delay_builtin_func_f($x))) .
            (" " .
            ($tostring($complex_print($jsArray_to_list($delay_builtin_func_xs($x)))) . ")"))));
    } elseif ($delay_builtin_form_p($x)) {
        return ("@(" .
            ($tostring($complex_print($env2val($delay_builtin_form_env($x)))) .
            (" " .
            ($tostring($complex_print($delay_builtin_form_f($x))) .
            (" " .
            ($tostring($complex_print($jsArray_to_list($delay_builtin_form_xs($x)))) . ")"))))));
    } elseif ($delay_apply_p($x)) {
        return ("^(" .
            ($tostring($complex_print($delay_apply_f($x))) .
            (" " . ($tostring($complex_print($jsArray_to_list($delay_apply_xs($x)))) . ")"))));
    }
    return $LANG_ERROR();
});
$____exports["complex_print"] = $complex_print;
$machinetext_parse = (function ($rawstr) use (&$__TS__ArrayPush, &$can_new_symbol_unicodechar_p, &$env_null_v, &$evaluate, &$evaluate_function_builtin_systemName, &$function_builtin_use_systemName, &$hole_set_do, &$lUa_I_LuA, &$make_quote, &$new_construction, &$new_data, &$new_error, &$new_hole_do, &$new_list, &$new_symbol_unicodechar, &$null_v, &$tostring) {
    $result = $new_hole_do();
    $stack = [$result];
    $state = 0;
    $parse_error = (function () {
        throw new Exception("MT parse ERROR");
    });
    $parse_assert = (function ($x) use (&$parse_error) {
        if (!($x)) {
            return $parse_error();
        }
    });
    $get_do = (function () use (&$parse_assert, &$rawstr, &$state) {
        $parse_assert(((is_string($rawstr) ? strlen($rawstr) : count($rawstr)) > $state));
        $lUaTmP_12_LuAtMp = ($state + 0);
        $result_1 = substr($rawstr, $lUaTmP_12_LuAtMp, ($state + 1) - $lUaTmP_12_LuAtMp);
        $state = ($state + 1);
        return $result_1;
    });
    while (((is_string($stack) ? strlen($stack) : count($stack)) != 0)) {
        try {
            (function () use (&$__TS__ArrayPush, &$can_new_symbol_unicodechar_p, &$env_null_v, &$evaluate, &$evaluate_function_builtin_systemName, &$function_builtin_use_systemName, &$get_do, &$hole_set_do, &$lUa_I_LuA, &$make_quote, &$new_construction, &$new_data, &$new_error, &$new_hole_do, &$new_list, &$new_symbol_unicodechar, &$null_v, &$parse_error, &$stack, &$tostring) {
                $new_stack = [];
                $lUaTmP_13_LuAtMp = (is_string($stack) ? strlen($stack) : count($stack));
                $lUaTmP_14_LuAtMp = 1;
                for ($lUa_I_LuA = 1; $lUaTmP_14_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_13_LuAtMp : $lUa_I_LuA > $lUaTmP_13_LuAtMp; $lUa_I_LuA += $lUaTmP_14_LuAtMp) {
                    try {
                        (function () use (&$__TS__ArrayPush, &$can_new_symbol_unicodechar_p, &$env_null_v, &$evaluate, &$evaluate_function_builtin_systemName, &$function_builtin_use_systemName, &$get_do, &$hole_set_do, &$lUa_I_LuA, &$make_quote, &$new_construction, &$new_data, &$new_error, &$new_hole_do, &$new_list, &$new_stack, &$new_symbol_unicodechar, &$null_v, &$parse_error, &$stack, &$tostring) {
                            $____TS_index = $lUa_I_LuA;
                            $hol = $stack[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                            $chr = $get_do();
                            $conslike = NULL;
                            $conslike = (function ($c) use (&$__TS__ArrayPush, &$hol, &$hole_set_do, &$new_hole_do, &$new_stack) {
                                $hol1 = $new_hole_do();
                                $hol2 = $new_hole_do();
                                $__TS__ArrayPush($new_stack, $hol1);
                                $__TS__ArrayPush($new_stack, $hol2);
                                $hole_set_do($hol, $c($hol1, $hol2));
                            });
                            if (($chr == "^")) {
                                $tmp = "";
                                while (true) {
                                    try {
                                        (function () use (&$get_do, &$tmp, &$tostring) {
                                            $chr_1 = $get_do();
                                            if (($chr_1 == "^")) {
                                                throw new Exception("lUa_bReAk_LuA");
                                            }
                                            $tmp = ($tostring($tmp) . $tostring($chr_1));
                                        })();
                                    } catch (Exception $lUa_E_LuA) {
                                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                                            break;
                                        } else {
                                            throw $lUa_E_LuA;
                                        }

                                    }
                                }
                                if ($can_new_symbol_unicodechar_p($tmp)) {
                                    $hole_set_do($hol, $new_symbol_unicodechar($tmp));
                                } else {
                                    return $parse_error();
                                }

                            } elseif (($chr == ".")) {
                                $conslike($new_construction);
                            } elseif (($chr == "#")) {
                                $conslike($new_data);
                            } elseif (($chr == "!")) {
                                $conslike($new_error);
                            } elseif (($chr == "\$")) {
                                $conslike(
                                    (function ($x, $y) use (&$env_null_v, &$evaluate, &$evaluate_function_builtin_systemName, &$function_builtin_use_systemName, &$make_quote, &$new_list) {
                                        return $evaluate($env_null_v, $new_list(
                                            $function_builtin_use_systemName,
                                            $evaluate_function_builtin_systemName,
                                            $make_quote($x),
                                            $make_quote($y)
                                        ));
                                    })
                                );
                            } elseif (($chr == "_")) {
                                $hole_set_do($hol, $null_v);
                            } else {
                                return $parse_error();
                            }

                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
                $stack = $new_stack;
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    $parse_assert(($state == (is_string($rawstr) ? strlen($rawstr) : count($rawstr))));
    return $result;
});
$machinetext_print = (function ($x) use (&$LANG_ERROR, &$__TS__ArrayPush, &$any_delay2delay_evaluate, &$any_delay_p, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_evaluate_env, &$delay_evaluate_x, &$env2val, &$error_list, &$error_name, &$error_p, &$lUa_I_LuA, &$null_p, &$symbol_p, &$tostring, &$un_just_all, &$un_symbol_unicodechar) {
    $stack = [$x];
    $result = "";
    while (((is_string($stack) ? strlen($stack) : count($stack)) != 0)) {
        try {
            (function () use (&$LANG_ERROR, &$__TS__ArrayPush, &$any_delay2delay_evaluate, &$any_delay_p, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_evaluate_env, &$delay_evaluate_x, &$env2val, &$error_list, &$error_name, &$error_p, &$lUa_I_LuA, &$null_p, &$result, &$stack, &$symbol_p, &$tostring, &$un_just_all, &$un_symbol_unicodechar) {
                $new_stack = [];
                $lUaTmP_15_LuAtMp = (is_string($stack) ? strlen($stack) : count($stack));
                $lUaTmP_16_LuAtMp = 1;
                for ($lUa_I_LuA = 1; $lUaTmP_16_LuAtMp >= 0 ? $lUa_I_LuA < $lUaTmP_15_LuAtMp : $lUa_I_LuA > $lUaTmP_15_LuAtMp; $lUa_I_LuA += $lUaTmP_16_LuAtMp) {
                    try {
                        (function () use (&$LANG_ERROR, &$__TS__ArrayPush, &$any_delay2delay_evaluate, &$any_delay_p, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$delay_evaluate_env, &$delay_evaluate_x, &$env2val, &$error_list, &$error_name, &$error_p, &$lUa_I_LuA, &$new_stack, &$null_p, &$result, &$stack, &$symbol_p, &$tostring, &$un_just_all, &$un_symbol_unicodechar) {
                            $____TS_index = $lUa_I_LuA;
                            $x_1 = $stack[(is_int($____TS_index) ? $____TS_index - 1 : $____TS_index)];
                            $x_1 = $un_just_all($x_1);
                            $conslike = NULL;
                            $conslike = (function ($xx, $s, $g1, $g2) use (&$__TS__ArrayPush, &$new_stack, &$result, &$tostring) {
                                $result = ($tostring($result) . $tostring($s));
                                $__TS__ArrayPush($new_stack, $g1($xx));
                                $__TS__ArrayPush($new_stack, $g2($xx));
                            });
                            if ($symbol_p($x_1)) {
                                $result = ($tostring($result) . "^");
                                $result = ($tostring($result) . $tostring($un_symbol_unicodechar($x_1)));
                                $result = ($tostring($result) . "^");
                            } elseif ($construction_p($x_1)) {
                                $conslike($x_1, ".", $construction_head, $construction_tail);
                            } elseif ($null_p($x_1)) {
                                $result = ($tostring($result) . "_");
                            } elseif ($data_p($x_1)) {
                                $conslike($x_1, "#", $data_name, $data_list);
                            } elseif ($error_p($x_1)) {
                                $conslike($x_1, "!", $error_name, $error_list);
                            } elseif ($any_delay_p($x_1)) {
                                $y = $any_delay2delay_evaluate($x_1);
                                $conslike($y, "\$", (function ($vl) use (&$delay_evaluate_env, &$env2val) {
                                    return $env2val($delay_evaluate_env($vl));
                                }), $delay_evaluate_x);
                            } else {
                                return $LANG_ERROR();
                            }

                        })();
                    } catch (Exception $lUa_E_LuA) {
                        if ($e->getMessage() == "lUa_bReAk_LuA") {
                            break;
                        } else {
                            throw $lUa_E_LuA;
                        }

                    }
                }
                $stack = $new_stack;
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $result;
});
$____exports["machinetext_parse"] = $machinetext_parse;
$____exports["machinetext_print"] = $machinetext_print;
$trampoline_return = (function ($x) {
    return (function () use (&$x) {
        return [false, $x];
    });
});
$trampoline_delay = (function ($x) {
    return (function () use (&$x) {
        return [true, $x()];
    });
});
$run_trampoline = (function ($x) {
    $i = $x();
    while ($i[(-1 + 1)]) {
        try {
            (function () use (&$i) {
                $i = $i[(0 + 1)]();
            })();
        } catch (Exception $lUa_E_LuA) {
            if ($e->getMessage() == "lUa_bReAk_LuA") {
                break;
            } else {
                throw $lUa_E_LuA;
            }

        }
    }
    return $i[(0 + 1)];
});
$____exports["trampoline_return"] = $trampoline_return;
$____exports["trampoline_delay"] = $trampoline_delay;
$____exports["run_trampoline"] = $run_trampoline;
$return_effect_systemName = $systemName_make($new_construction(
    $sub_symbol,
    $new_construction($new_construction($effect_symbol, $new_construction($new_construction(
        $typeAnnotation_symbol,
        $new_construction($thing_symbol, $new_construction($something_symbol, $null_v))
    ), $null_v)), $null_v)
));
$bind_effect_systemName = $systemName_make($new_construction($sub_symbol, $new_construction(
    $new_construction($effect_symbol, $new_construction($construction_symbol, $null_v)),
    $null_v
)));
$new_effect_bind = (function ($monad, $func) use (&$bind_effect_systemName, &$new_data, &$new_list) {
    return $new_data($bind_effect_systemName, $new_list($monad, $func));
});
$new_effect_return = (function ($x) use (&$new_data, &$return_effect_systemName) {
    return $new_data($return_effect_systemName, $x);
});
$run_monad_helper = (function ($return_handler, $op_handler, $code, $state, $next) use (&$apply, &$bind_effect_systemName, &$construction_head, &$construction_p, &$construction_tail, &$data_list, &$data_name, &$data_p, &$force_all, &$function_symbol, &$jsbool_equal_p, &$make_quote, &$new_data, &$new_list, &$new_symbol, &$null_p, &$return_effect_systemName, &$run_monad_helper, &$trampoline_delay) {
    if (($next == NULL)) {
        $next = false;
    }
    $make_bind = (function ($x, $f) {
        throw new Exception("WIP");
    });
    $code = $force_all($code);
    if ($data_p($code)) {
        $name = $data_name($code);
        $list = $data_list($code);
        if ($jsbool_equal_p($name, $return_effect_systemName)) {
            $list = $force_all($list);
            if ($construction_p($list)) {
                $list_a = $construction_head($list);
                $list_d = $force_all($construction_tail($list));
                if ($null_p($list_d)) {
                    if (($next == false)) {
                        $upval_v = $list_a;
                        $upval_st = $state;
                        $r = NULL;
                        $r = (function () use (&$return_handler, &$upval_st, &$upval_v) {
                            return $return_handler($upval_v, $upval_st);
                        });
                        return $trampoline_delay($r);
                    } else {
                        $upval_rt = NULL;
                        $upval_rt = $return_handler;
                        $upval_op = NULL;
                        $upval_op = $op_handler;
                        $upval_v_1 = $list_a;
                        $upval_st_1 = $state;
                        $r_1 = NULL;
                        $r_1 = (function () use (&$apply, &$next, &$run_monad_helper, &$upval_op, &$upval_rt, &$upval_st_1, &$upval_v_1) {
                            return $run_monad_helper($upval_rt, $upval_op, $apply($next, $upval_v_1), $upval_st_1);
                        });
                        return $trampoline_delay($r_1);
                    }

                }
            }
        } elseif ($jsbool_equal_p($name, $bind_effect_systemName)) {
            $list = $force_all($list);
            if ($construction_p($list)) {
                $list_a_1 = $construction_head($list);
                $list_d_1 = $force_all($construction_tail($list));
                if ($construction_p($list_d_1)) {
                    $list_d_a = $construction_head($list_d_1);
                    $list_d_d = $force_all($construction_tail($list_d_1));
                    if ($null_p($list_d_d)) {
                        if (($next == false)) {
                            $upval_rt_1 = NULL;
                            $upval_rt_1 = $return_handler;
                            $upval_op_1 = NULL;
                            $upval_op_1 = $op_handler;
                            $upval_a = $list_a_1;
                            $upval_b = $list_d_a;
                            $upval_st_2 = $state;
                            $r_2 = NULL;
                            $r_2 = (function () use (&$run_monad_helper, &$upval_a, &$upval_b, &$upval_op_1, &$upval_rt_1, &$upval_st_2) {
                                return $run_monad_helper($upval_rt_1, $upval_op_1, $upval_a, $upval_st_2, $upval_b);
                            });
                            return $trampoline_delay($r_2);
                        } else {
                            $upval_rt_2 = NULL;
                            $upval_rt_2 = $return_handler;
                            $upval_op_2 = NULL;
                            $upval_op_2 = $op_handler;
                            $upval_a_1 = $list_a_1;
                            $upval_b_1 = $list_d_a;
                            $upval_st_3 = $state;
                            $upval_nt = $next;
                            $x = $new_symbol("序甲");
                            $r_3 = NULL;
                            $r_3 = (function () use (&$function_symbol, &$make_bind, &$make_quote, &$new_data, &$new_list, &$run_monad_helper, &$upval_a_1, &$upval_b_1, &$upval_nt, &$upval_op_2, &$upval_rt_2, &$upval_st_3, &$x) {
                                return $run_monad_helper(
                                    $upval_rt_2,
                                    $upval_op_2,
                                    $upval_a_1,
                                    $upval_st_3,
                                    $new_data($function_symbol, $new_list(
                                        $new_list($x),
                                        $make_bind($new_list($make_quote($upval_b_1), $x), $make_quote($upval_nt))
                                    ))
                                );
                            });
                            return $trampoline_delay($r_3);
                        }

                    }
                }
            }
        }
    }
    if (($next == false)) {
        return $trampoline_delay((function () use (&$code, &$op_handler, &$return_handler, &$state) {
            return $op_handler($code, $state, $return_handler);
        }));
    } else {
        return $trampoline_delay(
            (function () use (&$apply, &$code, &$next, &$op_handler, &$return_handler, &$run_monad_helper, &$state, &$trampoline_delay) {
                return $op_handler(
                    $code,
                    $state,
                    (function ($val2, $state2) use (&$apply, &$next, &$op_handler, &$return_handler, &$run_monad_helper, &$trampoline_delay) {
                        return $trampoline_delay(
                            (function () use (&$apply, &$next, &$op_handler, &$return_handler, &$run_monad_helper, &$state2, &$val2) {
                                return $run_monad_helper($return_handler, $op_handler, $apply($next, [$val2]), $state2);
                            })
                        );
                    })
                );
            })
        );
    }

});
$run_monad_trampoline = (function ($return_handler, $op_handler, $code, $state) use (&$run_monad_helper) {
    return $run_monad_helper($return_handler, $op_handler, $code, $state);
});
$run_monad_stackoverflow = (function ($return_handler, $op_handler, $code, $state) use (&$run_monad_helper, &$run_trampoline, &$trampoline_return) {
    return $run_trampoline(
        $run_monad_helper((function ($v, $s) use (&$return_handler, &$trampoline_return) {
            return $trampoline_return($return_handler($v, $s));
        }), (function ($op, $st, $rs) use (&$op_handler, &$run_trampoline, &$trampoline_return) {
            return $trampoline_return($op_handler($op, $st, (function ($v, $s) use (&$rs, &$run_trampoline) {
                return $run_trampoline($rs($v, $s));
            })));
        }), $code, $state)
    );
});
$____exports["Return_Effect_SystemName"] = $Return_Effect_SystemName;
$____exports["return_effect_systemName"] = $return_effect_systemName;
$____exports["Bind_Effect_SystemName"] = $Bind_Effect_SystemName;
$____exports["bind_effect_systemName"] = $bind_effect_systemName;
$____exports["new_effect_bind"] = $new_effect_bind;
$____exports["new_effect_return"] = $new_effect_return;
$____exports["run_monad_trampoline"] = $run_monad_trampoline;
$____exports["run_monad_stackoverflow"] = $run_monad_stackoverflow;


