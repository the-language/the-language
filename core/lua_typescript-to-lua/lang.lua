--[[ Generated with https://github.com/Perryvw/TypescriptToLua ]]
-- Lua Library inline imports
__TS__ArrayPush = function(arr, ...)
    local items = ({...});
    for ____TS_index = 1, #items do
        local item = items[____TS_index];
        arr[(#arr) + 1] = item;
    end
    return #arr;
end;

__TS__ArrayShift = function(arr)
    return table.remove(arr, 1);
end;

__TS__StringSplit = function(source, separator, limit)
    if limit == nil then
        limit = 4294967295;
    end
    if limit == 0 then
        return {};
    end
    local out = {};
    local index = 0;
    local count = 0;
    if (separator == nil) or (separator == "") then
        while (index < ((#source) - 1)) and (count < limit) do
            out[count + 1] = string.sub(source, index + 1, index + 1);
            count = count + 1;
            index = index + 1;
        end
    else
        local separatorLength = #separator;
        local nextIndex = (string.find(source, separator) or 0) - 1;
        while (nextIndex >= 0) and (count < limit) do
            out[count + 1] = string.sub(source, index + 1, nextIndex);
            count = count + 1;
            index = nextIndex + separatorLength;
            nextIndex = (string.find(source, separator, index + 1, true) or 0) - 1;
        end
    end
    if count < limit then
        out[count + 1] = string.sub(source, index + 1);
    end
    return out;
end;

__TS__ArrayUnshift = function(arr, ...)
    local items = ({...});
    do
        local i = (#items) - 1;
        while i >= 0 do
            table.insert(arr, 1, items[i + 1]);
            i = i - 1;
        end
    end
    return #arr;
end;

local exports = exports or {};
local ERROR, ASSERT, construction_t, null_t, data_t, error_t, just_t, delay_evaluate_t, delay_builtin_func_t, delay_builtin_form_t, delay_apply_t, type_of, symbol_p, un_symbol, new_construction, construction_p, construction_head, construction_tail, null_v, null_p, new_data, data_p, data_name, data_list, new_error, error_p, error_name, error_list, lang_set_do, just_p, un_just, evaluate, delay_evaluate_p, delay_evaluate_env, delay_evaluate_x, builtin_form_apply, delay_builtin_form_p, delay_builtin_form_env, delay_builtin_form_f, delay_builtin_form_xs, builtin_func_apply, delay_builtin_func_p, delay_builtin_func_f, delay_builtin_func_xs, apply, delay_apply_p, delay_apply_f, delay_apply_xs, force_all_rec, system_symbol, function_symbol, form_symbol, mapping_symbol, the_world_stopped_v, data_name_function_builtin_systemName, data_list_function_builtin_systemName, data_p_function_builtin_systemName, error_name_function_builtin_systemName, error_list_function_builtin_systemName, error_p_function_builtin_systemName, construction_p_function_builtin_systemName, construction_head_function_builtin_systemName, construction_tail_function_builtin_systemName, symbol_p_function_builtin_systemName, null_p_function_builtin_systemName, equal_p_function_builtin_systemName, apply_function_builtin_systemName, evaluate_function_builtin_systemName, if_function_builtin_systemName, quote_form_builtin_systemName, lambda_form_builtin_systemName, function_builtin_use_systemName, form_builtin_use_systemName, form_use_systemName, symbol_equal_p, jsArray_to_list, new_list, un_just_all, any_delay_just_p, force_all, force1, env_null_v, env_set, env_get, must_env_get, env2val, env_foreach, real_evaluate, name_p, real_builtin_func_apply_s, real_apply, real_builtin_func_apply, real_builtin_form_apply, new_lambda, jsbool_equal_p, simple_print;
ERROR = function()
    error("TheLanguage PANIC");
end;
ASSERT = function(x)
    if not x then
        return ERROR();
    end
end;
type_of = function(x)
    return x[0 + 1];
end;
symbol_p = function(x)
    return x[0 + 1] == 0;
end;
un_symbol = function(x)
    return x[1 + 1];
end;
new_construction = function(x, y)
    return {construction_t, x, y};
end;
construction_p = function(x)
    return x[0 + 1] == construction_t;
end;
construction_head = function(x)
    return x[1 + 1];
end;
construction_tail = function(x)
    return x[2 + 1];
end;
null_p = function(x)
    return x[0 + 1] == null_t;
end;
new_data = function(x, y)
    return {data_t, x, y};
end;
data_p = function(x)
    return x[0 + 1] == data_t;
end;
data_name = function(x)
    return x[1 + 1];
end;
data_list = function(x)
    return x[2 + 1];
end;
new_error = function(x, y)
    return {error_t, x, y};
end;
error_p = function(x)
    return x[0 + 1] == error_t;
end;
error_name = function(x)
    return x[1 + 1];
end;
error_list = function(x)
    return x[2 + 1];
end;
lang_set_do = function(x, y)
    if x == y then
        return;
    end
    x[0 + 1] = just_t;
    x[1 + 1] = y;
    x[2 + 1] = nil;
    x[3 + 1] = nil;
end;
just_p = function(x)
    return x[0 + 1] == just_t;
end;
un_just = function(x)
    return x[1 + 1];
end;
evaluate = function(x, y)
    return {delay_evaluate_t, x, y};
end;
delay_evaluate_p = function(x)
    return x[0 + 1] == delay_evaluate_t;
end;
delay_evaluate_env = function(x)
    return x[1 + 1];
end;
delay_evaluate_x = function(x)
    return x[2 + 1];
end;
builtin_form_apply = function(x, y, z)
    return {delay_builtin_form_t, x, y, z};
end;
delay_builtin_form_p = function(x)
    return x[0 + 1] == delay_builtin_form_t;
end;
delay_builtin_form_env = function(x)
    return x[1 + 1];
end;
delay_builtin_form_f = function(x)
    return x[2 + 1];
end;
delay_builtin_form_xs = function(x)
    return x[3 + 1];
end;
builtin_func_apply = function(x, y)
    return {delay_builtin_func_t, x, y};
end;
delay_builtin_func_p = function(x)
    return x[0 + 1] == delay_builtin_func_t;
end;
delay_builtin_func_f = function(x)
    return x[1 + 1];
end;
delay_builtin_func_xs = function(x)
    return x[2 + 1];
end;
apply = function(f, xs)
    return {delay_apply_t, f, xs};
end;
delay_apply_p = function(x)
    return x[0 + 1] == delay_apply_t;
end;
delay_apply_f = function(x)
    return x[1 + 1];
end;
delay_apply_xs = function(x)
    return x[2 + 1];
end;
force_all_rec = function(raw)
    local x = force_all(raw);
    if data_p(x) then
        local a = x[1 + 1];
        local d = x[2 + 1];
        x[1 + 1] = force_all_rec(a);
        x[2 + 1] = force_all_rec(d);
        return x;
    elseif error_p(x) then
        local a = x[1 + 1];
        local d = x[2 + 1];
        x[1 + 1] = force_all_rec(a);
        x[2 + 1] = force_all_rec(d);
        return x;
    elseif construction_p(x) then
        local a = x[1 + 1];
        local d = x[2 + 1];
        x[1 + 1] = force_all_rec(a);
        x[2 + 1] = force_all_rec(d);
        return x;
    end
    return x;
end;
symbol_equal_p = function(x, y)
    if x == y then
        return true;
    end
    if un_symbol(x) == un_symbol(y) then
        lang_set_do(x, y);
        return true;
    else
        return false;
    end
end;
jsArray_to_list = function(xs)
    local ret = null_v;
    do
        local i = (#xs) - 1;
        while i >= 0 do
            ret = new_construction(xs[i + 1], ret);
            i = i - 1;
        end
    end
    return ret;
end;
new_list = function(...)
    local xs = ({...});
    return jsArray_to_list(xs);
end;
un_just_all = function(raw)
    local x = raw;
    local xs = {};
    while just_p(x) do
        __TS__ArrayPush(xs, x);
        x = un_just(x);
    end
    do
        local i = 0;
        while i < (#xs) do
            lang_set_do(xs[i + 1], x);
            i = i + 1;
        end
    end
    return x;
end;
any_delay_just_p = function(x)
    return (((just_p(x) or delay_evaluate_p(x)) or delay_builtin_form_p(x)) or delay_builtin_func_p(x)) or delay_apply_p(x);
end;
force_all = function(raw, parents_history, ref_novalue_replace)
    if parents_history == nil then
        parents_history = {};
    end
    if ref_novalue_replace == nil then
        ref_novalue_replace = {false, false};
    end
    local history = {};
    local x = raw;
    local xs = {};
    local replace_this_with_stopped;
    replace_this_with_stopped = function()
        ref_novalue_replace[1 + 1] = true;
        lang_set_do(x, the_world_stopped_v);
        do
            local i = 0;
            while i < (#xs) do
                lang_set_do(xs[i + 1], the_world_stopped_v);
                i = i + 1;
            end
        end
        return the_world_stopped_v;
    end;
    local make_history;
    make_history = function()
        local ret = {};
        for x_id in pairs(history) do
            ret[x_id] = true;
        end
        for x_id in pairs(parents_history) do
            ret[x_id] = true;
        end
        return ret;
    end;
    while any_delay_just_p(x) do
        local x_id = simple_print(x);
        if parents_history[x_id] == true then
            return replace_this_with_stopped();
        end
        if history[x_id] == true then
            ref_novalue_replace[0 + 1] = true;
            if delay_evaluate_p(x) then
                return replace_this_with_stopped();
            elseif delay_builtin_func_p(x) then
                local f = delay_builtin_func_f(x);
                local xs = delay_builtin_func_xs(x);
                local elim_s = {data_name_function_builtin_systemName, data_list_function_builtin_systemName, data_p_function_builtin_systemName, error_name_function_builtin_systemName, error_list_function_builtin_systemName, error_p_function_builtin_systemName, construction_p_function_builtin_systemName, construction_head_function_builtin_systemName, construction_tail_function_builtin_systemName, symbol_p_function_builtin_systemName, null_p_function_builtin_systemName};
                local is_elim = false;
                do
                    local i = 0;
                    while i < (#elim_s) do
                        if jsbool_equal_p(elim_s[i + 1], f) then
                            is_elim = true;
                        end
                        i = i + 1;
                    end
                end
                if is_elim then
                    ASSERT((#xs) == 1);
                    ASSERT(ref_novalue_replace[1 + 1] == false);
                    local inner = force_all(xs[0 + 1], make_history(), ref_novalue_replace);
                    if ref_novalue_replace[1 + 1] then
                        return force_all(builtin_func_apply(f, {inner}));
                    else
                        return ERROR();
                    end
                end
                if jsbool_equal_p(f, equal_p_function_builtin_systemName) then
                    return replace_this_with_stopped();
                elseif jsbool_equal_p(f, apply_function_builtin_systemName) then
                    return replace_this_with_stopped();
                elseif jsbool_equal_p(f, evaluate_function_builtin_systemName) then
                    return replace_this_with_stopped();
                elseif jsbool_equal_p(f, if_function_builtin_systemName) then
                    ASSERT((#xs) == 3);
                    ASSERT(ref_novalue_replace[1 + 1] == false);
                    local tf = force_all(xs[0 + 1], make_history(), ref_novalue_replace);
                    if ref_novalue_replace[1 + 1] then
                        return force_all(builtin_func_apply(if_function_builtin_systemName, {tf, xs[1 + 1], xs[2 + 1]}));
                    else
                        return ERROR();
                    end
                end
                return ERROR();
            elseif delay_builtin_form_p(x) then
                return replace_this_with_stopped();
            elseif delay_apply_p(x) then
                return replace_this_with_stopped();
            end
            return ERROR();
        end
        history[x_id] = true;
        __TS__ArrayPush(xs, x);
        x = force1(x);
    end
    do
        local i = 0;
        while i < (#xs) do
            lang_set_do(xs[i + 1], x);
            i = i + 1;
        end
    end
    return x;
end;
force1 = function(raw)
    local x = un_just_all(raw);
    local ret;
    ASSERT(not just_p(x));
    if delay_evaluate_p(x) then
        ret = real_evaluate(delay_evaluate_env(x), delay_evaluate_x(x));
    elseif delay_builtin_form_p(x) then
        ret = real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x));
    elseif delay_builtin_func_p(x) then
        ret = real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x));
    elseif delay_apply_p(x) then
        ret = real_apply(delay_apply_f(x), delay_apply_xs(x));
    else
        ret = x;
    end
    ret = un_just_all(ret);
    lang_set_do(x, ret);
    return ret;
end;
env_set = function(env, key, val)
    local ret = {};
    do
        local i = 0;
        while i < (#env) do
            if jsbool_equal_p(env[(i + 0) + 1], key) then
                ret[(i + 0) + 1] = key;
                ret[(i + 1) + 1] = val;
                do
                    i = i + 2;
                    while i < (#env) do
                        ret[(i + 0) + 1] = env[(i + 0) + 1];
                        ret[(i + 1) + 1] = env[(i + 1) + 1];
                        i = i + 2;
                    end
                end
                return ret;
            else
                ret[(i + 0) + 1] = env[(i + 0) + 1];
                ret[(i + 1) + 1] = env[(i + 1) + 1];
            end
            i = i + 2;
        end
    end
    ret[((#env) + 0) + 1] = key;
    ret[((#env) + 1) + 1] = val;
    return ret;
end;
env_get = function(env, key, default_v)
    do
        local i = 0;
        while i < (#env) do
            if jsbool_equal_p(env[(i + 0) + 1], key) then
                return env[(i + 1) + 1];
            end
            i = i + 2;
        end
    end
    return default_v;
end;
must_env_get = function(env, key)
    do
        local i = 0;
        while i < (#env) do
            if jsbool_equal_p(env[(i + 0) + 1], key) then
                return env[(i + 1) + 1];
            end
            i = i + 2;
        end
    end
    return ERROR();
end;
env2val = function(env)
    local ret = null_v;
    do
        local i = 0;
        while i < (#env) do
            ret = new_construction(new_list(env[(i + 0) + 1], env[(i + 1) + 1]), ret);
            i = i + 2;
        end
    end
    return new_data(mapping_symbol, new_list(ret));
end;
env_foreach = function(env, f)
    do
        local i = 0;
        while i < (#env) do
            f(env[(i + 0) + 1], env[(i + 1) + 1]);
            i = i + 2;
        end
    end
end;
real_evaluate = function(env, raw)
    local x = force1(raw);
    if any_delay_just_p(x) then
        return evaluate(env, x);
    end
    local error_v = new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(evaluate_function_builtin_systemName, new_list(env2val(env), x))));
    if construction_p(x) then
        local xs = {};
        local rest = x;
        while not null_p(rest) do
            if any_delay_just_p(rest) then
                return evaluate(env, x);
            elseif construction_p(rest) then
                __TS__ArrayPush(xs, construction_head(rest));
                rest = force1(construction_tail(rest));
            else
                return error_v;
            end
        end
        if jsbool_equal_p(xs[0 + 1], form_builtin_use_systemName) then
            if (#xs) == 1 then
                return error_v;
            end
            local f = xs[1 + 1];
            local args = {};
            do
                local i = 2;
                while i < (#xs) do
                    args[(i - 2) + 1] = xs[i + 1];
                    i = i + 1;
                end
            end
            return builtin_form_apply(env, f, args);
        elseif jsbool_equal_p(xs[0 + 1], form_use_systemName) then
            if (#xs) == 1 then
                return error_v;
            end
            local f = force_all(evaluate(env, xs[1 + 1]));
            if not data_p(f) then
                return error_v;
            end
            local f_type = force1(data_name(f));
            if any_delay_just_p(f_type) then
                return evaluate(env, x);
            end
            if not symbol_p(f_type) then
                return error_v;
            end
            if not symbol_equal_p(f_type, form_symbol) then
                return error_v;
            end
            local f_list = force1(data_list(f));
            if any_delay_just_p(f_list) then
                return evaluate(env, x);
            end
            if not construction_p(f_list) then
                return error_v;
            end
            local f_x = construction_head(f_list);
            local f_list_cdr = force1(construction_tail(f_list));
            if any_delay_just_p(f_list_cdr) then
                return evaluate(env, x);
            end
            if not null_p(f_list_cdr) then
                return error_v;
            end
            local args = {env2val(env)};
            do
                local i = 2;
                while i < (#xs) do
                    args[(i - 1) + 1] = xs[i + 1];
                    i = i + 1;
                end
            end
            return apply(f_x, args);
        elseif jsbool_equal_p(xs[0 + 1], function_builtin_use_systemName) then
            if (#xs) == 1 then
                return error_v;
            end
            local f = xs[1 + 1];
            local args = {};
            do
                local i = 2;
                while i < (#xs) do
                    args[(i - 2) + 1] = evaluate(env, xs[i + 1]);
                    i = i + 1;
                end
            end
            return builtin_func_apply(f, args);
        else
            local f = evaluate(env, xs[0 + 1]);
            local args = {};
            do
                local i = 1;
                while i < (#xs) do
                    args[(i - 1) + 1] = evaluate(env, xs[i + 1]);
                    i = i + 1;
                end
            end
            return apply(f, args);
        end
    elseif null_p(x) then
        return x;
    elseif name_p(x) then
        return env_get(env, x, error_v);
    elseif error_p(x) then
        return error_v;
    end
    return ERROR();
end;
name_p = function(x)
    return symbol_p(x) or data_p(x);
end;
real_apply = function(f, xs)
    local make_error_v;
    make_error_v = function()
        return new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(apply_function_builtin_systemName, new_list(f, jsArray_to_list(xs)))));
    end;
    f = force1(f);
    if any_delay_just_p(f) then
        return apply(f, xs);
    end
    if not data_p(f) then
        return make_error_v();
    end
    local f_type = force_all(data_name(f));
    if not (symbol_p(f_type) and symbol_equal_p(f_type, function_symbol)) then
        return make_error_v();
    end
    local f_list = force_all(data_list(f));
    if not construction_p(f_list) then
        return make_error_v();
    end
    local args_pat = force_all_rec(construction_head(f_list));
    local f_list_cdr = force_all(construction_tail(f_list));
    if not (construction_p(f_list_cdr) and null_p(force_all(construction_tail(f_list_cdr)))) then
        return make_error_v();
    end
    local f_code = construction_head(f_list_cdr);
    local env = env_null_v;
    local isNotEmpty;
    isNotEmpty = function(arr)
        return not (not (#arr));
    end;
    while not null_p(args_pat) do
        if name_p(args_pat) then
            env = env_set(env, args_pat, jsArray_to_list(xs));
            xs = {};
            args_pat = null_v;
        elseif construction_p(args_pat) then
            if isNotEmpty(xs) then
                local x = __TS__ArrayShift(xs);
                env = env_set(env, construction_head(args_pat), x);
                args_pat = construction_tail(args_pat);
            else
                return make_error_v();
            end
        else
            return make_error_v();
        end
    end
    if (#xs) ~= 0 then
        return make_error_v();
    end
    return evaluate(env, f_code);
end;
real_builtin_func_apply = function(f, xs)
    local error_v = new_error(system_symbol, new_list(function_builtin_use_systemName, new_list(f, jsArray_to_list(xs))));
    do
        local i = 0;
        while i < (#real_builtin_func_apply_s) do
            if jsbool_equal_p(f, real_builtin_func_apply_s[i + 1][0 + 1]) then
                local actually_length = real_builtin_func_apply_s[i + 1][1 + 1];
                if (#xs) ~= actually_length then
                    return error_v;
                end
                local f = real_builtin_func_apply_s[i + 1][2 + 1];
                if actually_length == 1 then
                    return (f)(xs[0 + 1], error_v);
                elseif actually_length == 2 then
                    return (f)(xs[0 + 1], xs[1 + 1], error_v);
                elseif actually_length == 3 then
                    return (f)(xs[0 + 1], xs[1 + 1], xs[2 + 1], error_v);
                end
                return ERROR();
            end
            i = i + 1;
        end
    end
    return error_v;
end;
real_builtin_form_apply = function(env, f, xs)
    local error_v = new_error(system_symbol, new_list(form_builtin_use_systemName, new_list(env2val(env), f, jsArray_to_list(xs))));
    if jsbool_equal_p(f, quote_form_builtin_systemName) then
        if (#xs) ~= 1 then
            return error_v;
        end
        return xs[0 + 1];
    elseif jsbool_equal_p(f, lambda_form_builtin_systemName) then
        if (#xs) ~= 2 then
            return error_v;
        end
        return new_lambda(env, xs[0 + 1], xs[1 + 1], error_v);
    end
    return error_v;
end;
new_lambda = function(env, args_pat, body, error_v)
    if error_v == nil then
        error_v = nil;
    end
    local make_error_v;
    make_error_v = function()
        if error_v == nil then
            return new_error(system_symbol, new_list(form_builtin_use_systemName, new_list(env2val(env), lambda_form_builtin_systemName, jsArray_to_list({args_pat, body}))));
        else
            return error_v;
        end
    end;
    local make_quote;
    make_quote = function(x)
        return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x);
    end;
    args_pat = force_all_rec(args_pat);
    local args_pat_vars = {};
    local args_pat_is_dot = false;
    local args_pat_iter = args_pat;
    while not null_p(args_pat_iter) do
        if name_p(args_pat_iter) then
            __TS__ArrayPush(args_pat_vars, args_pat_iter);
            args_pat_is_dot = true;
            args_pat_iter = null_v;
        elseif construction_p(args_pat_iter) then
            __TS__ArrayPush(args_pat_vars, construction_head(args_pat_iter));
            args_pat_iter = construction_tail(args_pat_iter);
        else
            return make_error_v();
        end
    end
    local args_pat_vars_val = args_pat;
    if args_pat_is_dot then
        args_pat_vars_val = jsArray_to_list(args_pat_vars);
    end
    local env_vars = {};
    env_foreach(env, function(k, v)
        do
            local i = 0;
            while i < (#args_pat_vars) do
                if jsbool_equal_p(args_pat_vars[i + 1], k) then
                    return;
                end
                i = i + 1;
            end
        end
        __TS__ArrayPush(env_vars, k);
    end);
    local new_args_pat = args_pat_vars_val;
    do
        local i = (#env_vars) - 1;
        while i >= 0 do
            new_args_pat = new_construction(env_vars[i + 1], new_args_pat);
            i = i - 1;
        end
    end
    local new_args = args_pat_vars_val;
    do
        local i = (#env_vars) - 1;
        while i >= 0 do
            new_args = new_construction(make_quote(must_env_get(env, env_vars[i + 1])), new_args);
            i = i - 1;
        end
    end
    return new_data(function_symbol, new_list(args_pat, new_construction(make_quote(new_data(function_symbol, new_list(new_args_pat, body))), new_args)));
end;
jsbool_equal_p = function(x, y)
    if x == y then
        return true;
    end
    x = force_all(x);
    y = force_all(y);
    if x == y then
        return true;
    end
    local x_type = type_of(x);
    local y_type = type_of(y);
    if x_type ~= y_type then
        return false;
    end
    local end_2;
    end_2 = function(x, y, f1, f2)
        if jsbool_equal_p(f1(x), f1(y)) and jsbool_equal_p(f2(x), f2(y)) then
            lang_set_do(x, y);
            return true;
        else
            return false;
        end
    end;
    if null_p(x) then
        lang_set_do(x, null_v);
        lang_set_do(y, null_v);
        return true;
    elseif symbol_p(x) then
        return symbol_equal_p(x, y);
    elseif construction_p(x) then
        return end_2(x, y, construction_head, construction_tail);
    elseif error_p(x) then
        return end_2(x, y, error_name, error_list);
    elseif data_p(x) then
        return end_2(x, y, data_name, data_list);
    end
    return ERROR();
end;
simple_print = function(x)
    x = un_just_all(x);
    local temp = "";
    local prefix = "";
    if null_p(x) then
        return "()";
    elseif construction_p(x) then
        temp = "(";
        prefix = "";
        while construction_p(x) do
            temp = temp .. (prefix .. simple_print(construction_head(x)));
            prefix = " ";
            x = un_just_all(construction_tail(x));
        end
        if null_p(x) then
            temp = temp .. ")";
        else
            temp = temp .. ((" . " .. simple_print(x)) .. ")");
        end
        return temp;
    elseif data_p(x) then
        return "#" .. simple_print(new_construction(data_name(x), data_list(x)));
    elseif error_p(x) then
        return "!" .. simple_print(new_construction(error_name(x), error_list(x)));
    elseif symbol_p(x) then
        return un_symbol(x);
    elseif delay_evaluate_p(x) then
        return ((("$(" .. simple_print(env2val(delay_evaluate_env(x)))) .. " ") .. simple_print(delay_evaluate_x(x))) .. ")";
    elseif delay_builtin_func_p(x) then
        return ((("%(" .. simple_print(delay_builtin_func_f(x))) .. " ") .. simple_print(jsArray_to_list(delay_builtin_func_xs(x)))) .. ")";
    elseif delay_builtin_form_p(x) then
        return ((((("@(" .. simple_print(env2val(delay_builtin_form_env(x)))) .. " ") .. simple_print(delay_builtin_form_f(x))) .. " ") .. simple_print(jsArray_to_list(delay_builtin_form_xs(x)))) .. ")";
    elseif delay_apply_p(x) then
        return ((("^(" .. simple_print(delay_apply_f(x))) .. " ") .. simple_print(jsArray_to_list(delay_apply_xs(x)))) .. ")";
    end
    return ERROR();
end;
local symbol_t = 0;
construction_t = 1;
null_t = 2;
data_t = 3;
error_t = 4;
just_t = 5;
delay_evaluate_t = 6;
delay_builtin_func_t = 7;
delay_builtin_form_t = 8;
delay_apply_t = 9;
local new_symbol;
new_symbol = function(x)
    return {symbol_t, x};
end;
exports.new_symbol = new_symbol;
exports.symbol_p = symbol_p;
exports.un_symbol = un_symbol;
exports.new_construction = new_construction;
exports.construction_p = construction_p;
exports.construction_head = construction_head;
exports.construction_tail = construction_tail;
null_v = {null_t};
exports.null_v = null_v;
exports.null_p = null_p;
exports.new_data = new_data;
exports.data_p = data_p;
exports.data_name = data_name;
exports.data_list = data_list;
exports.new_error = new_error;
exports.error_p = error_p;
exports.error_name = error_name;
exports.error_list = error_list;
exports.evaluate = evaluate;
exports.apply = apply;
exports.force_all_rec = force_all_rec;
system_symbol = new_symbol("太始初核");
local name_symbol = new_symbol("符名");
function_symbol = new_symbol("化滅");
form_symbol = new_symbol("式形");
local equal_symbol = new_symbol("等同");
local evaluate_sym = new_symbol("解算");
local theThing_symbol = new_symbol("特定其物");
local something_symbol = new_symbol("省略一物");
mapping_symbol = new_symbol("映表");
local if_symbol = new_symbol("若");
local typeAnnotation_symbol = new_symbol("一類何物");
local isOrNot_symbol = new_symbol("是非");
local sub_symbol = new_symbol("其子");
local true_symbol = new_symbol("陽");
local false_symbol = new_symbol("陰");
local quote_symbol = new_symbol("引用");
local apply_symbol = new_symbol("應用");
local null_symbol = new_symbol("空");
local construction_symbol = new_symbol("連");
local data_symbol = new_symbol("構");
local error_symbol = new_symbol("誤");
local symbol_symbol = new_symbol("詞素");
local list_symbol = new_symbol("列");
local head_symbol = new_symbol("首");
local tail_symbol = new_symbol("尾");
local thing_symbol = new_symbol("物");
local theWorldStopped_symbol = new_symbol("宇宙亡矣");
local effect_symbol = new_symbol("效應");
local sequentialWordFormation_symbol = new_symbol("為符名連");
local inputOutput_symbol = new_symbol("出入改滅");
exports.system_symbol = system_symbol;
exports.name_symbol = name_symbol;
exports.function_symbol = function_symbol;
exports.form_symbol = form_symbol;
exports.equal_symbol = equal_symbol;
exports.evaluate_sym = evaluate_sym;
exports.theThing_symbol = theThing_symbol;
exports.something_symbol = something_symbol;
exports.mapping_symbol = mapping_symbol;
exports.if_symbol = if_symbol;
exports.typeAnnotation_symbol = typeAnnotation_symbol;
exports.isOrNot_symbol = isOrNot_symbol;
exports.sub_symbol = sub_symbol;
exports.true_symbol = true_symbol;
exports.false_symbol = false_symbol;
exports.quote_symbol = quote_symbol;
exports.apply_symbol = apply_symbol;
exports.null_symbol = null_symbol;
exports.construction_symbol = construction_symbol;
exports.data_symbol = data_symbol;
exports.error_symbol = error_symbol;
exports.symbol_symbol = symbol_symbol;
exports.list_symbol = list_symbol;
exports.head_symbol = head_symbol;
exports.tail_symbol = tail_symbol;
exports.thing_symbol = thing_symbol;
exports.theWorldStopped_symbol = theWorldStopped_symbol;
exports.effect_symbol = effect_symbol;
exports.sequentialWordFormation_symbol = sequentialWordFormation_symbol;
exports.inputOutput_symbol = inputOutput_symbol;
the_world_stopped_v = new_error(system_symbol, new_list(theWorldStopped_symbol, something_symbol));
local systemName_make;
systemName_make = function(x)
    return new_data(name_symbol, new_list(system_symbol, x));
end;
local make_builtin_f_new_sym_f;
make_builtin_f_new_sym_f = function(x_sym)
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, x_sym), theThing_symbol));
end;
local make_builtin_f_get_sym_f;
make_builtin_f_get_sym_f = function(t_sym, x_sym)
    return systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(t_sym), something_symbol), x_sym));
end;
local make_builtin_f_p_sym_f;
make_builtin_f_p_sym_f = function(t_sym)
    return systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, new_list(typeAnnotation_symbol, t_sym, something_symbol))));
end;
local new_data_function_builtin_systemName = make_builtin_f_new_sym_f(data_symbol);
data_name_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, name_symbol);
data_list_function_builtin_systemName = make_builtin_f_get_sym_f(data_symbol, list_symbol);
data_p_function_builtin_systemName = make_builtin_f_p_sym_f(data_symbol);
local new_error_function_builtin_systemName = make_builtin_f_new_sym_f(error_symbol);
error_name_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, name_symbol);
error_list_function_builtin_systemName = make_builtin_f_get_sym_f(error_symbol, list_symbol);
error_p_function_builtin_systemName = make_builtin_f_p_sym_f(error_symbol);
local new_construction_function_builtin_systemName = make_builtin_f_new_sym_f(construction_symbol);
construction_p_function_builtin_systemName = make_builtin_f_p_sym_f(construction_symbol);
construction_head_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, head_symbol);
construction_tail_function_builtin_systemName = make_builtin_f_get_sym_f(construction_symbol, tail_symbol);
symbol_p_function_builtin_systemName = make_builtin_f_p_sym_f(symbol_symbol);
null_p_function_builtin_systemName = make_builtin_f_p_sym_f(null_symbol);
equal_p_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, equal_symbol)));
apply_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(function_symbol, something_symbol), something_symbol), apply_symbol));
evaluate_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, evaluate_sym));
local list_chooseOne_function_builtin_systemName = make_builtin_f_get_sym_f(list_symbol, new_list(typeAnnotation_symbol, thing_symbol, something_symbol));
if_function_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, function_symbol, if_symbol));
quote_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, form_symbol, quote_symbol));
lambda_form_builtin_systemName = systemName_make(new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, function_symbol)), theThing_symbol));
function_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, function_symbol)));
form_builtin_use_systemName = systemName_make(new_list(form_symbol, new_list(system_symbol, form_symbol)));
form_use_systemName = systemName_make(new_list(form_symbol, form_symbol));
exports.new_data_function_builtin_systemName = new_data_function_builtin_systemName;
exports.data_name_function_builtin_systemName = data_name_function_builtin_systemName;
exports.data_list_function_builtin_systemName = data_list_function_builtin_systemName;
exports.data_p_function_builtin_systemName = data_p_function_builtin_systemName;
exports.new_error_function_builtin_systemName = new_error_function_builtin_systemName;
exports.error_name_function_builtin_systemName = error_name_function_builtin_systemName;
exports.error_list_function_builtin_systemName = error_list_function_builtin_systemName;
exports.error_p_function_builtin_systemName = error_p_function_builtin_systemName;
exports.new_construction_function_builtin_systemName = new_construction_function_builtin_systemName;
exports.construction_p_function_builtin_systemName = construction_p_function_builtin_systemName;
exports.construction_head_function_builtin_systemName = construction_head_function_builtin_systemName;
exports.construction_tail_function_builtin_systemName = construction_tail_function_builtin_systemName;
exports.symbol_p_function_builtin_systemName = symbol_p_function_builtin_systemName;
exports.null_p_function_builtin_systemName = null_p_function_builtin_systemName;
exports.equal_p_function_builtin_systemName = equal_p_function_builtin_systemName;
exports.apply_function_builtin_systemName = apply_function_builtin_systemName;
exports.evaluate_function_builtin_systemName = evaluate_function_builtin_systemName;
exports.list_chooseOne_function_builtin_systemName = list_chooseOne_function_builtin_systemName;
exports.if_function_builtin_systemName = if_function_builtin_systemName;
exports.quote_form_builtin_systemName = quote_form_builtin_systemName;
exports.lambda_form_builtin_systemName = lambda_form_builtin_systemName;
exports.function_builtin_use_systemName = function_builtin_use_systemName;
exports.form_builtin_use_systemName = form_builtin_use_systemName;
exports.form_use_systemName = form_use_systemName;
local false_v = new_data(false_symbol, new_list());
local true_v = new_data(true_symbol, new_list());
local list_to_jsArray;
list_to_jsArray = function(xs, k_done, k_tail)
    local ret = {};
    while construction_p(xs) do
        __TS__ArrayPush(ret, construction_head(xs));
        xs = construction_tail(xs);
    end
    if null_p(xs) then
        return k_done(ret);
    end
    return k_tail(ret, xs);
end;
local maybe_list_to_jsArray;
maybe_list_to_jsArray = function(xs)
    return list_to_jsArray(xs, function(xs)
        return xs;
    end, function(xs, x)
        return false;
    end);
end;
exports.jsArray_to_list = jsArray_to_list;
exports.maybe_list_to_jsArray = maybe_list_to_jsArray;
exports.new_list = new_list;
exports.delay_p = any_delay_just_p;
exports.force_all = force_all;
exports.force1 = force1;
env_null_v = {};
local val2env;
val2env = function(x)
    x = force_all(x);
    if not data_p(x) then
        return false;
    end
    local s = force_all(data_name(x));
    if not symbol_p(s) then
        return false;
    end
    if not symbol_equal_p(s, mapping_symbol) then
        return false;
    end
    s = force_all(data_list(x));
    if not construction_p(s) then
        return false;
    end
    if not null_p(force_all(construction_tail(s))) then
        return false;
    end
    local ret = {};
    local xs = force_all(construction_head(s));
    while not null_p(xs) do
        if not construction_p(xs) then
            return false;
        end
        local x = force_all(construction_head(xs));
        xs = force_all(construction_tail(xs));
        if not construction_p(x) then
            return false;
        end
        local k = construction_head(x);
        x = force_all(construction_tail(x));
        if not construction_p(x) then
            return false;
        end
        local v = construction_head(x);
        if not null_p(force_all(construction_tail(x))) then
            return false;
        end
        local not_breaked = true;
        do
            local i = 0;
            while i < (#ret) do
                if jsbool_equal_p(ret[(i + 0) + 1], k) then
                    ret[(i + 1) + 1] = v;
                    not_breaked = false;
                    break;
                end
                i = i + 2;
            end
        end
        if not_breaked then
            __TS__ArrayPush(ret, k);
            __TS__ArrayPush(ret, v);
        end
    end
    return ret;
end;
exports.env_null_v = env_null_v;
exports.env_set = env_set;
exports.env_get = env_get;
exports.env2val = env2val;
exports.env_foreach = env_foreach;
exports.val2env = val2env;
local make_builtin_p_func;
make_builtin_p_func = function(p_sym, p_jsfunc)
    return {p_sym, 1, function(x, error_v)
        x = force1(x);
        if any_delay_just_p(x) then
            return builtin_func_apply(p_sym, {x});
        end
        if p_jsfunc(x) then
            return true_v;
        end
        return false_v;
    end};
end;
local make_builtin_get_func;
make_builtin_get_func = function(f_sym, p_jsfunc, f_jsfunc)
    return {f_sym, 1, function(x, error_v)
        x = force1(x);
        if any_delay_just_p(x) then
            return builtin_func_apply(f_sym, {x});
        end
        if p_jsfunc(x) then
            return f_jsfunc(x);
        end
        return error_v;
    end};
end;
real_builtin_func_apply_s = {make_builtin_p_func(data_p_function_builtin_systemName, data_p), {new_data_function_builtin_systemName, 2, new_data}, make_builtin_get_func(data_name_function_builtin_systemName, data_p, data_name), make_builtin_get_func(data_list_function_builtin_systemName, data_p, data_list), make_builtin_p_func(error_p_function_builtin_systemName, error_p), {new_error_function_builtin_systemName, 2, new_error}, make_builtin_get_func(error_name_function_builtin_systemName, error_p, error_name), make_builtin_get_func(error_list_function_builtin_systemName, error_p, error_list), make_builtin_p_func(null_p_function_builtin_systemName, null_p), {new_construction_function_builtin_systemName, 2, new_construction}, make_builtin_p_func(construction_p_function_builtin_systemName, construction_p), make_builtin_get_func(construction_head_function_builtin_systemName, construction_p, construction_head), make_builtin_get_func(construction_tail_function_builtin_systemName, construction_p, construction_tail), {equal_p_function_builtin_systemName, 2, function(x, y, error_v)
    if x == y then
        return true_v;
    end
    x = force1(x);
    y = force1(y);
    if any_delay_just_p(x) or any_delay_just_p(y) then
        return builtin_func_apply(equal_p_function_builtin_systemName, {x, y});
    end
    if x == y then
        return true_v;
    end
    if type_of(x) ~= type_of(y) then
        return false_v;
    end
    local H_if;
    H_if = function(b, x, y)
        return builtin_func_apply(if_function_builtin_systemName, {b, x, y});
    end;
    local H_and;
    H_and = function(x, y)
        return H_if(x, y, false_v);
    end;
    ASSERT(not any_delay_just_p(x));
    local end_2;
    end_2 = function(x, y, f1, f2)
        return H_and(builtin_func_apply(equal_p_function_builtin_systemName, {f1(x), f1(y)}), builtin_func_apply(equal_p_function_builtin_systemName, {f2(x), f2(y)}));
    end;
    if null_p(x) then
        return true_v;
    elseif symbol_p(x) then
        return (symbol_equal_p(x, y) and true_v) or false_v;
    elseif data_p(x) then
        return end_2(x, y, data_name, data_list);
    elseif construction_p(x) then
        return end_2(x, y, construction_head, construction_tail);
    elseif error_p(x) then
        return end_2(x, y, error_name, error_list);
    end
    return ERROR();
end}, {apply_function_builtin_systemName, 2, function(f, xs, error_v)
    local jslist = {};
    local iter = force_all(xs);
    while construction_p(iter) do
        __TS__ArrayPush(jslist, construction_head(iter));
        iter = force_all(construction_tail(iter));
    end
    if not null_p(iter) then
        return error_v;
    end
    return apply(f, jslist);
end}, {evaluate_function_builtin_systemName, 2, function(env, x, error_v)
    local maybeenv = val2env(env);
    if maybeenv == false then
        return error_v;
    end
    return evaluate(maybeenv, x);
end}, make_builtin_p_func(symbol_p_function_builtin_systemName, symbol_p), {list_chooseOne_function_builtin_systemName, 1, function(xs, error_v)
    xs = force1(xs);
    if any_delay_just_p(xs) then
        return builtin_func_apply(list_chooseOne_function_builtin_systemName, {xs});
    end
    if not construction_p(xs) then
        return error_v;
    end
    return construction_head(xs);
end}, {if_function_builtin_systemName, 3, function(b, x, y, error_v)
    b = force1(b);
    if any_delay_just_p(b) then
        return builtin_func_apply(if_function_builtin_systemName, {b, x, y});
    end
    if not data_p(b) then
        return error_v;
    end
    local nam = force_all(data_name(b));
    if not symbol_p(nam) then
        return error_v;
    end
    if symbol_equal_p(nam, true_symbol) then
        return x;
    end
    if symbol_equal_p(nam, false_symbol) then
        return y;
    end
    return error_v;
end}};
exports.equal_p = jsbool_equal_p;
local jsbool_no_force_equal_p;
jsbool_no_force_equal_p = function(x, y)
    if x == y then
        return true;
    end
    x = un_just_all(x);
    y = un_just_all(y);
    if x == y then
        return true;
    end
    local x_type = type_of(x);
    local y_type = type_of(y);
    if x_type ~= y_type then
        return false;
    end
    local end_2;
    end_2 = function(x, y, f1, f2)
        if jsbool_no_force_equal_p(f1(x), f1(y)) and jsbool_no_force_equal_p(f2(x), f2(y)) then
            lang_set_do(x, y);
            return true;
        else
            return false;
        end
    end;
    if null_p(x) then
        lang_set_do(x, null_v);
        lang_set_do(y, null_v);
        return true;
    elseif symbol_p(x) then
        return symbol_equal_p(x, y);
    elseif construction_p(x) then
        return end_2(x, y, construction_head, construction_tail);
    elseif error_p(x) then
        return end_2(x, y, error_name, error_list);
    elseif data_p(x) then
        return end_2(x, y, data_name, data_list);
    elseif delay_evaluate_p(x) then
        return false;
    elseif delay_builtin_func_p(x) then
        return false;
    elseif delay_builtin_form_p(x) then
        return false;
    elseif delay_apply_p(x) then
        return false;
    end
    return ERROR();
end;
local simple_print_force_all_rec;
simple_print_force_all_rec = function(x)
    return simple_print(force_all_rec(x));
end;
exports.simple_print = simple_print;
exports.simple_print_force_all_rec = simple_print_force_all_rec;
local simple_parse;
simple_parse = function(x)
    local state, eof, get, put, parse_error, a_space_p, space, symbol, list, data, readerror, readeval, readfuncapply, readformbuiltin, readapply, a_symbol_p, val;
    eof = function()
        return (#state) == 0;
    end;
    get = function()
        return __TS__ArrayShift(state);
    end;
    put = function(x)
        __TS__ArrayUnshift(state, x);
    end;
    parse_error = function()
        error("TheLanguage parse ERROR!");
    end;
    a_space_p = function(x)
        return (((x == " ") or (x == "\n")) or (x == "\t")) or (x == "\r");
    end;
    space = function()
        if eof() then
            return false;
        end
        local x = get();
        if not a_space_p(x) then
            put(x);
            return false;
        end
        while a_space_p(x) and (not eof()) do
            x = get();
        end
        if not a_space_p(x) then
            put(x);
        end
        return true;
    end;
    symbol = function()
        if eof() then
            return false;
        end
        local x = get();
        local ret = "";
        if not a_symbol_p(x) then
            put(x);
            return false;
        end
        while a_symbol_p(x) and (not eof()) do
            ret = ret .. x;
            x = get();
        end
        if a_symbol_p(x) then
            ret = ret .. x;
        else
            put(x);
        end
        return new_symbol(ret);
    end;
    list = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "(" then
            put(x);
            return false;
        end
        local HOLE = new_symbol("!!@@READ||HOLE@@!!");
        local ret = HOLE;
        local set_last;
        set_last = function(lst)
            if ret == HOLE then
                ret = lst;
                return;
            end
            local x = ret;
            while true do
                if not construction_p(x) then
                    return ERROR();
                end
                local d = construction_tail(x);
                if d == HOLE then
                    break;
                end
                x = construction_tail(x);
            end
            if not construction_p(x) then
                return ERROR();
            end
            if construction_tail(x) ~= HOLE then
                return ERROR();
            end
            x[2 + 1] = lst;
        end;
        local last_add;
        last_add = function(x)
            set_last(new_construction(x, HOLE));
        end;
        while true do
            space();
            if eof() then
                return parse_error();
            end
            x = get();
            if x == ")" then
                set_last(null_v);
                return ret;
            end
            if x == "." then
                space();
                local e = val();
                set_last(e);
                space();
                if eof() then
                    return parse_error();
                end
                x = get();
                if x ~= ")" then
                    return parse_error();
                end
                return ret;
            end
            put(x);
            local e = val();
            last_add(e);
        end
    end;
    data = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "#" then
            put(x);
            return false;
        end
        local xs = list();
        if xs == false then
            return parse_error();
        end
        if not construction_p(xs) then
            return parse_error();
        end
        return new_data(construction_head(xs), construction_tail(xs));
    end;
    readerror = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "!" then
            put(x);
            return false;
        end
        local xs = list();
        if xs == false then
            return parse_error();
        end
        if not construction_p(xs) then
            return parse_error();
        end
        return new_error(construction_head(xs), construction_tail(xs));
    end;
    a_symbol_p = function(x)
        if a_space_p(x) then
            return false;
        end
        local not_xs = {"(", ")", "!", "#", ".", "$", "%", "^", "@", "~", "/", "-", ">", "_", ":", "?", "[", "]", "&"};
        do
            local i = 0;
            while i < (#not_xs) do
                if x == not_xs[i + 1] then
                    return false;
                end
                i = i + 1;
            end
        end
        return true;
    end;
    val = function()
        space();
        local fs = {list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply};
        do
            local i = 0;
            while i < (#fs) do
                local x = fs[i + 1]();
                if x ~= false then
                    return x;
                end
                i = i + 1;
            end
        end
        return parse_error();
    end;
    state = __TS__StringSplit(x, "");
    local make_read_two;
    make_read_two = function(prefix, k)
        return function()
            if eof() then
                return false;
            end
            local c = get();
            if c ~= prefix then
                put(c);
                return false;
            end
            local xs = list();
            if xs == false then
                return parse_error();
            end
            if not construction_p(xs) then
                return parse_error();
            end
            local x = construction_tail(xs);
            if not (construction_p(x) and null_p(construction_tail(x))) then
                return parse_error();
            end
            return k(construction_head(xs), construction_head(x));
        end;
    end;
    local make_read_three;
    make_read_three = function(prefix, k)
        return function()
            if eof() then
                return false;
            end
            local c = get();
            if c ~= prefix then
                put(c);
                return false;
            end
            local xs = list();
            if xs == false then
                return parse_error();
            end
            if not construction_p(xs) then
                return parse_error();
            end
            local x = construction_tail(xs);
            if not construction_p(x) then
                return parse_error();
            end
            local x_d = construction_tail(x);
            if not (construction_p(x_d) and null_p(construction_tail(x_d))) then
                return parse_error();
            end
            return k(construction_head(xs), construction_head(x), construction_head(x_d));
        end;
    end;
    readeval = make_read_two("$", function(e, x)
        local env = val2env(e);
        if env == false then
            return parse_error();
        end
        return evaluate(env, x);
    end);
    readfuncapply = make_read_two("%", function(f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        return builtin_func_apply(f, jsxs);
    end);
    readformbuiltin = make_read_three("@", function(e, f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        local env = val2env(e);
        if env == false then
            return parse_error();
        end
        return builtin_form_apply(env, f, jsxs);
    end);
    readapply = make_read_two("^", function(f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        return apply(f, jsxs);
    end);
    return val();
end;
exports.simple_parse = simple_parse;
local complex_parse;
complex_parse = function(x)
    local state, eof, get, put, parse_error, a_space_p, space, symbol, list, data, readerror, readeval, readfuncapply, readformbuiltin, readapply, a_symbol_p, val, un_maybe, not_eof, assert_get, readsysname_no_pack, readsysname;
    eof = function()
        return (#state) == 0;
    end;
    get = function()
        return __TS__ArrayShift(state);
    end;
    put = function(x)
        __TS__ArrayUnshift(state, x);
    end;
    parse_error = function()
        error("TheLanguage parse ERROR!");
    end;
    a_space_p = function(x)
        return (((x == " ") or (x == "\n")) or (x == "\t")) or (x == "\r");
    end;
    space = function()
        if eof() then
            return false;
        end
        local x = get();
        if not a_space_p(x) then
            put(x);
            return false;
        end
        while a_space_p(x) and (not eof()) do
            x = get();
        end
        if not a_space_p(x) then
            put(x);
        end
        return true;
    end;
    symbol = function()
        if eof() then
            return false;
        end
        local x = get();
        local ret = "";
        if not a_symbol_p(x) then
            put(x);
            return false;
        end
        while a_symbol_p(x) and (not eof()) do
            ret = ret .. x;
            x = get();
        end
        if a_symbol_p(x) then
            ret = ret .. x;
        else
            put(x);
        end
        return new_symbol(ret);
    end;
    list = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "(" then
            put(x);
            return false;
        end
        local HOLE = new_symbol("!!@@READ||HOLE@@!!");
        local ret = HOLE;
        local set_last;
        set_last = function(lst)
            if ret == HOLE then
                ret = lst;
                return;
            end
            local x = ret;
            while true do
                if not construction_p(x) then
                    return ERROR();
                end
                local d = construction_tail(x);
                if d == HOLE then
                    break;
                end
                x = construction_tail(x);
            end
            if not construction_p(x) then
                return ERROR();
            end
            if construction_tail(x) ~= HOLE then
                return ERROR();
            end
            x[2 + 1] = lst;
        end;
        local last_add;
        last_add = function(x)
            set_last(new_construction(x, HOLE));
        end;
        while true do
            space();
            if eof() then
                return parse_error();
            end
            x = get();
            if x == ")" then
                set_last(null_v);
                return ret;
            end
            if x == "." then
                space();
                local e = val();
                set_last(e);
                space();
                if eof() then
                    return parse_error();
                end
                x = get();
                if x ~= ")" then
                    return parse_error();
                end
                return ret;
            end
            put(x);
            local e = val();
            last_add(e);
        end
    end;
    data = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "#" then
            put(x);
            return false;
        end
        local xs = list();
        if xs == false then
            return parse_error();
        end
        if not construction_p(xs) then
            return parse_error();
        end
        return new_data(construction_head(xs), construction_tail(xs));
    end;
    readerror = function()
        if eof() then
            return false;
        end
        local x = get();
        if x ~= "!" then
            put(x);
            return false;
        end
        local xs = list();
        if xs == false then
            return parse_error();
        end
        if not construction_p(xs) then
            return parse_error();
        end
        return new_error(construction_head(xs), construction_tail(xs));
    end;
    a_symbol_p = function(x)
        if a_space_p(x) then
            return false;
        end
        local not_xs = {"(", ")", "!", "#", ".", "$", "%", "^", "@", "~", "/", "-", ">", "_", ":", "?", "[", "]", "&"};
        do
            local i = 0;
            while i < (#not_xs) do
                if x == not_xs[i + 1] then
                    return false;
                end
                i = i + 1;
            end
        end
        return true;
    end;
    val = function()
        space();
        local fs = {list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply};
        do
            local i = 0;
            while i < (#fs) do
                local x = fs[i + 1]();
                if x ~= false then
                    return x;
                end
                i = i + 1;
            end
        end
        return parse_error();
    end;
    un_maybe = function(x)
        if x == false then
            return parse_error();
        end
        return x;
    end;
    not_eof = function()
        return not eof();
    end;
    assert_get = function(c)
        un_maybe(not_eof());
        un_maybe(get() == c);
    end;
    readsysname_no_pack = function()
        local readsysname_no_pack_inner_must, may_xfx_xf;
        readsysname_no_pack_inner_must = function(strict)
            if strict == nil then
                strict = false;
            end
            local readsysname_no_pack_bracket;
            readsysname_no_pack_bracket = function()
                assert_get("[");
                local x = readsysname_no_pack_inner_must();
                assert_get("]");
                return x;
            end;
            local fs = (strict and {list, symbol, readsysname_no_pack_bracket, data, readerror, readeval, readfuncapply, readformbuiltin, readapply}) or {list, readsysname_no_pack, data, readerror, readeval, readfuncapply, readformbuiltin, readapply};
            do
                local i = 0;
                while i < (#fs) do
                    local x = fs[i + 1]();
                    if x ~= false then
                        return x;
                    end
                    i = i + 1;
                end
            end
            return parse_error();
        end;
        may_xfx_xf = function(x)
            if eof() then
                return x;
            end
            local head = get();
            if head == "." then
                local y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, new_list(x), something_symbol), y);
            elseif head == ":" then
                local y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, y, x);
            elseif head == "~" then
                return new_list(isOrNot_symbol, x);
            elseif head == "@" then
                local y = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, new_construction(x, something_symbol), something_symbol), y);
            elseif head == "?" then
                return new_list(typeAnnotation_symbol, function_symbol, new_list(isOrNot_symbol, x));
            elseif head == "/" then
                local ys = {};
                while true do
                    local y = readsysname_no_pack_inner_must(true);
                    __TS__ArrayPush(ys, y);
                    if eof() then
                        break;
                    end
                    local c0 = get();
                    if c0 ~= "/" then
                        put(c0);
                        break;
                    end
                end
                return new_list(sub_symbol, x, jsArray_to_list(ys));
            else
                put(head);
                return x;
            end
            return ERROR();
        end;
        if eof() then
            return false;
        end
        local head = get();
        if head == "&" then
            un_maybe(not_eof());
            local c0 = get();
            if c0 == "+" then
                local x = readsysname_no_pack_inner_must();
                return new_list(form_symbol, new_list(system_symbol, x));
            else
                put(c0);
            end
            local x = readsysname_no_pack_inner_must();
            return new_list(form_symbol, x);
        elseif head == ":" then
            un_maybe(not_eof());
            local c0 = get();
            if c0 == "&" then
                assert_get(">");
                local x = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(form_symbol, new_list(function_symbol, something_symbol, x)), theThing_symbol);
            elseif c0 == ">" then
                local x = readsysname_no_pack_inner_must();
                return new_list(typeAnnotation_symbol, new_list(function_symbol, something_symbol, x), theThing_symbol);
            else
                put(c0);
            end
            local x = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_symbol, x, theThing_symbol);
        elseif head == "+" then
            local x = readsysname_no_pack_inner_must();
            return new_list(system_symbol, x);
        elseif head == "[" then
            local x = readsysname_no_pack_inner_must();
            assert_get("]");
            return may_xfx_xf(x);
        elseif head == "_" then
            assert_get(":");
            local x = readsysname_no_pack_inner_must();
            return new_list(typeAnnotation_symbol, x, something_symbol);
        else
            put(head);
            local x = symbol();
            if x == false then
                return false;
            end
            return may_xfx_xf(x);
        end
        return ERROR();
    end;
    readsysname = function()
        local x = readsysname_no_pack();
        if x == false then
            return false;
        end
        if symbol_p(x) then
            return x;
        end
        return systemName_make(x);
    end;
    state = __TS__StringSplit(x, "");
    local make_read_two;
    make_read_two = function(prefix, k)
        return function()
            if eof() then
                return false;
            end
            local c = get();
            if c ~= prefix then
                put(c);
                return false;
            end
            local xs = list();
            if xs == false then
                return parse_error();
            end
            if not construction_p(xs) then
                return parse_error();
            end
            local x = construction_tail(xs);
            if not (construction_p(x) and null_p(construction_tail(x))) then
                return parse_error();
            end
            return k(construction_head(xs), construction_head(x));
        end;
    end;
    local make_read_three;
    make_read_three = function(prefix, k)
        return function()
            if eof() then
                return false;
            end
            local c = get();
            if c ~= prefix then
                put(c);
                return false;
            end
            local xs = list();
            if xs == false then
                return parse_error();
            end
            if not construction_p(xs) then
                return parse_error();
            end
            local x = construction_tail(xs);
            if not construction_p(x) then
                return parse_error();
            end
            local x_d = construction_tail(x);
            if not (construction_p(x_d) and null_p(construction_tail(x_d))) then
                return parse_error();
            end
            return k(construction_head(xs), construction_head(x), construction_head(x_d));
        end;
    end;
    readeval = make_read_two("$", function(e, x)
        local env = val2env(e);
        if env == false then
            return parse_error();
        end
        return evaluate(env, x);
    end);
    readfuncapply = make_read_two("%", function(f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        return builtin_func_apply(f, jsxs);
    end);
    readformbuiltin = make_read_three("@", function(e, f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        local env = val2env(e);
        if env == false then
            return parse_error();
        end
        return builtin_form_apply(env, f, jsxs);
    end);
    readapply = make_read_two("^", function(f, xs)
        local jsxs = list_to_jsArray(xs, function(xs)
            return xs;
        end, function(xs, y)
            return parse_error();
        end);
        return apply(f, jsxs);
    end);
    return val();
end;
exports.complex_parse = complex_parse;
local complex_print;
complex_print = function(val)
    local print_sys_name;
    print_sys_name = function(x, where)
        if symbol_p(x) then
            return un_symbol(x);
        end
        local inner_bracket;
        inner_bracket = function(x)
            if where == "inner" then
                return ("[" .. x) .. "]";
            elseif where == "top" then
                return x;
            end
            return ERROR();
        end;
        local maybe_xs = maybe_list_to_jsArray(x);
        if ((maybe_xs ~= false) and ((#maybe_xs) == 3)) and jsbool_no_force_equal_p(maybe_xs[0 + 1], typeAnnotation_symbol) then
            local maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[1 + 1]);
            if ((maybe_lst_2 ~= false) and ((#maybe_lst_2) == 3)) and jsbool_no_force_equal_p(maybe_lst_2[0 + 1], function_symbol) then
                local var_2_1 = maybe_lst_2[1 + 1];
                local maybe_lst_3 = maybe_list_to_jsArray(var_2_1);
                if ((maybe_lst_3 ~= false) and ((#maybe_lst_3) == 1)) and jsbool_no_force_equal_p(maybe_lst_2[2 + 1], something_symbol) then
                    return inner_bracket((print_sys_name(maybe_lst_3[0 + 1], "inner") .. ".") .. print_sys_name(maybe_xs[2 + 1], "inner"));
                elseif (construction_p(var_2_1) and jsbool_no_force_equal_p(construction_tail(var_2_1), something_symbol)) and jsbool_no_force_equal_p(maybe_lst_2[2 + 1], something_symbol) then
                    return inner_bracket((print_sys_name(construction_head(var_2_1), "inner") .. "@") .. print_sys_name(maybe_xs[2 + 1], "inner"));
                elseif jsbool_no_force_equal_p(var_2_1, something_symbol) and jsbool_no_force_equal_p(maybe_xs[2 + 1], theThing_symbol) then
                    return inner_bracket(":>" .. print_sys_name(maybe_lst_2[2 + 1], "inner"));
                end
            end
            local maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[2 + 1]);
            if ((jsbool_no_force_equal_p(maybe_xs[1 + 1], function_symbol) and (maybe_lst_44 ~= false)) and ((#maybe_lst_44) == 2)) and jsbool_no_force_equal_p(maybe_lst_44[0 + 1], isOrNot_symbol) then
                return inner_bracket(print_sys_name(maybe_lst_44[1 + 1], "inner") .. "?");
            end
            if (((maybe_lst_2 ~= false) and ((#maybe_lst_2) == 2)) and jsbool_no_force_equal_p(maybe_xs[2 + 1], theThing_symbol)) and jsbool_no_force_equal_p(maybe_lst_2[0 + 1], form_symbol) then
                local maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[1 + 1]);
                if (((maybe_lst_88 ~= false) and ((#maybe_lst_88) == 3)) and jsbool_no_force_equal_p(maybe_lst_88[0 + 1], function_symbol)) and jsbool_no_force_equal_p(maybe_lst_88[1 + 1], something_symbol) then
                    return inner_bracket(":&>" .. print_sys_name(maybe_lst_88[2 + 1], "inner"));
                end
            end
            local hd = (jsbool_no_force_equal_p(maybe_xs[2 + 1], something_symbol) and "_") or ((jsbool_no_force_equal_p(maybe_xs[2 + 1], theThing_symbol) and "") or print_sys_name(maybe_xs[2 + 1], "inner"));
            return inner_bracket((hd .. ":") .. print_sys_name(maybe_xs[1 + 1], "inner"));
        elseif (maybe_xs ~= false) and ((#maybe_xs) == 2) then
            if jsbool_no_force_equal_p(maybe_xs[0 + 1], form_symbol) then
                local maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[1 + 1]);
                if ((maybe_lst_288 ~= false) and ((#maybe_lst_288) == 2)) and jsbool_no_force_equal_p(maybe_lst_288[0 + 1], system_symbol) then
                    return inner_bracket("&+" .. print_sys_name(maybe_lst_288[1 + 1], "inner"));
                end
                return inner_bracket("&" .. print_sys_name(maybe_xs[1 + 1], "inner"));
            elseif jsbool_no_force_equal_p(maybe_xs[0 + 1], isOrNot_symbol) then
                return inner_bracket(print_sys_name(maybe_xs[1 + 1], "inner") .. "~");
            elseif jsbool_no_force_equal_p(maybe_xs[0 + 1], system_symbol) then
                return inner_bracket("+" .. print_sys_name(maybe_xs[1 + 1], "inner"));
            end
        elseif ((maybe_xs ~= false) and ((#maybe_xs) == 3)) and jsbool_no_force_equal_p(maybe_xs[0 + 1], sub_symbol) then
            local maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[2 + 1]);
            if (maybe_lst_8934 ~= false) and ((#maybe_lst_8934) ~= 0) then
                local tmp = "";
                do
                    local i = 0;
                    while i < (#maybe_lst_8934) do
                        tmp = tmp .. ("/" .. print_sys_name(maybe_lst_8934[i + 1], "inner"));
                        i = i + 1;
                    end
                end
                return inner_bracket(print_sys_name(maybe_xs[1 + 1], "inner") .. tmp);
            end
        end
        if where == "inner" then
            return simple_print(x);
        elseif where == "top" then
            return simple_print(systemName_make(x));
        end
        return ERROR();
    end;
    local x = simple_parse(simple_print(val));
    local temp = "";
    local prefix = "";
    if null_p(x) then
        return "()";
    elseif construction_p(x) then
        temp = "(";
        prefix = "";
        while construction_p(x) do
            temp = temp .. (prefix .. complex_print(construction_head(x)));
            prefix = " ";
            x = construction_tail(x);
        end
        if null_p(x) then
            temp = temp .. ")";
        else
            temp = temp .. ((" . " .. complex_print(x)) .. ")");
        end
        return temp;
    elseif data_p(x) then
        local name = data_name(x);
        local list = data_list(x);
        local maybe_xs = maybe_list_to_jsArray(list);
        if (((maybe_xs ~= false) and ((#maybe_xs) == 2)) and jsbool_no_force_equal_p(name, name_symbol)) and jsbool_no_force_equal_p(maybe_xs[0 + 1], system_symbol) then
            return print_sys_name(maybe_xs[1 + 1], "top");
        end
        return "#" .. complex_print(new_construction(name, list));
    elseif error_p(x) then
        return "!" .. complex_print(new_construction(error_name(x), error_list(x)));
    elseif symbol_p(x) then
        return un_symbol(x);
    elseif delay_evaluate_p(x) then
        return ((("$(" .. complex_print(env2val(delay_evaluate_env(x)))) .. " ") .. complex_print(delay_evaluate_x(x))) .. ")";
    elseif delay_builtin_func_p(x) then
        return ((("%(" .. complex_print(delay_builtin_func_f(x))) .. " ") .. complex_print(jsArray_to_list(delay_builtin_func_xs(x)))) .. ")";
    elseif delay_builtin_form_p(x) then
        return ((((("@(" .. complex_print(env2val(delay_builtin_form_env(x)))) .. " ") .. complex_print(delay_builtin_form_f(x))) .. " ") .. complex_print(jsArray_to_list(delay_builtin_form_xs(x)))) .. ")";
    elseif delay_apply_p(x) then
        return ((("^(" .. complex_print(delay_apply_f(x))) .. " ") .. complex_print(jsArray_to_list(delay_apply_xs(x)))) .. ")";
    end
    return ERROR();
end;
exports.complex_print = complex_print;
local return_inputOutput_systemName = complex_parse("效應/[:物]");
local bind_inputOutput_systemName = complex_parse("效應/連");
local ecmascript_systemName = systemName_make(complex_parse("(為符名連 e c m a s c r i p t)"));
exports.return_inputOutput_systemName = return_inputOutput_systemName;
exports.bind_inputOutput_systemName = bind_inputOutput_systemName;
exports.ecmascript_systemName = ecmascript_systemName;
return exports;