/*
--    The Language
--    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU Affero General Public License as published
--    by the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.

--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU Affero General Public License for more details.

--    You should have received a copy of the GNU Affero General Public License
--    along with this program.  If not, see <https://www.gnu.org/licenses/>.
local TS = {}
function TS.throw(value)
  error("Uncaught " .. tostring(value), 2)
end
function TS.string_split(input, sep)
	local result = {}
	local count = 0
	for str in input:gmatch(sep == "" and "." or "[^" .. sep .. "]+") do
		count = count + 1
		result[count] = str
	end
	return result
end
local _exports = {};
local force_all_rec, new_list, force_all, force1, real_evaluate, name_p, real_apply, real_builtin_func_apply, real_builtin_form_apply, new_lambda, jsbool_equal_p, jsbool_no_force_equal_p, simple_print, complex_print;
local ERROR = function()
	TS.throw("TheLanguage PANIC");
end;
local ASSERT = function(x)
	if not x then
		return ERROR();
	end;
end;
local symbol_t = 0;
local construction_t = 1;
local null_t = 2;
local data_t = 3;
local error_t = 4;
local just_t = 5;
local delay_evaluate_t = 6;
local delay_builtin_func_t = 7;
local delay_builtin_form_t = 8;
local delay_apply_t = 9;
local type_of = function(x)
	return x[1];
end;
local new_symbol = function(x)
	return symbol_t, x;
end;
local symbol_p = function(x)
	return x[1] == 0;
end;
local un_symbol = function(x)
	return x[2];
end;
_exports.new_symbol, _exports.symbol_p, _exports.un_symbol = new_symbol, symbol_p, un_symbol;
local new_construction = function(x, y)
	return construction_t, x, y;
end;
local construction_p = function(x)
	return x[1] == construction_t;
end;
local construction_head = function(x)
	return unpack(x[2]);
end;
local construction_tail = function(x)
	return unpack(x[3]);
end;
_exports.new_construction, _exports.construction_p, _exports.construction_head, _exports.construction_tail = new_construction, construction_p, construction_head, construction_tail;
local null_v = { null_t };
local null_p = function(x)
	return x[1] == null_t;
end;
_exports.null_v, _exports.null_p = null_v, null_p;
local new_data = function(x, y)
	return data_t, x, y;
end;
local data_p = function(x)
	return x[1] == data_t;
end;
local data_name = function(x)
	return unpack(x[2]);
end;
local data_list = function(x)
	return unpack(x[3]);
end;
_exports.new_data, _exports.data_p, _exports.data_name, _exports.data_list = new_data, data_p, data_name, data_list;
local new_error = function(x, y)
	return error_t, x, y;
end;
local error_p = function(x)
	return x[1] == error_t;
end;
local error_name = function(x)
	return unpack(x[2]);
end;
local error_list = function(x)
	return unpack(x[3]);
end;
_exports.new_error, _exports.error_p, _exports.error_name, _exports.error_list = new_error, error_p, error_name, error_list;
local lang_set_do = function(x, y)
	if x == y then
		return nil;
	end;
	x[1] = just_t;
	x[2] = y;
	x[3] = nil;
	x[4] = nil;
end;
local just_p = function(x)
	return x[1] == just_t;
end;
local un_just = function(x)
	return unpack(x[2]);
end;
local evaluate = function(x, y)
	return delay_evaluate_t, x, y;
end;
_exports.evaluate = evaluate;
local delay_evaluate_p = function(x)
	return x[1] == delay_evaluate_t;
end;
local delay_evaluate_env = function(x)
	return x[2];
end;
local delay_evaluate_x = function(x)
	return unpack(x[3]);
end;
local builtin_form_apply = function(x, y, z)
	return delay_builtin_form_t, x, y, z;
end;
local delay_builtin_form_p = function(x)
	return x[1] == delay_builtin_form_t;
end;
local delay_builtin_form_env = function(x)
	return x[2];
end;
local delay_builtin_form_f = function(x)
	return unpack(x[3]);
end;
local delay_builtin_form_xs = function(x)
	return x[4];
end;
local builtin_func_apply = function(x, y)
	return delay_builtin_func_t, x, y;
end;
local delay_builtin_func_p = function(x)
	return x[1] == delay_builtin_func_t;
end;
local delay_builtin_func_f = function(x)
	return unpack(x[2]);
end;
local delay_builtin_func_xs = function(x)
	return x[3];
end;
local apply = function(f, xs)
	return delay_apply_t, f, xs;
end;
_exports.apply = apply;
local delay_apply_p = function(x)
	return x[1] == delay_apply_t;
end;
local delay_apply_f = function(x)
	return unpack(x[2]);
end;
local delay_apply_xs = function(x)
	return x[3];
end;
force_all_rec = function(raw)
	local x = { force_all(raw) };
	if data_p(x) then
		local a = x[2];
		local d = x[3];
		x[2] = { force_all_rec(a) };
		x[3] = { force_all_rec(d) };
		return unpack(x);
	elseif error_p(x) then
		local a = x[2];
		local d = x[3];
		x[2] = { force_all_rec(a) };
		x[3] = { force_all_rec(d) };
		return unpack(x);
	elseif construction_p(x) then
		local a = x[2];
		local d = x[3];
		x[2] = { force_all_rec(a) };
		x[3] = { force_all_rec(d) };
		return unpack(x);
	end;
	return unpack(x);
end;
_exports.force_all_rec = force_all_rec;
local system_symbol = { new_symbol("太始初核") };
local name_symbol = { new_symbol("符名") };
local function_symbol = { new_symbol("化滅") };
local form_symbol = { new_symbol("式形") };
local equal_symbol = { new_symbol("等同") };
local evaluate_sym = { new_symbol("解算") };
local theThing_symbol = { new_symbol("特定其物") };
local something_symbol = { new_symbol("省略一物") };
local mapping_symbol = { new_symbol("映表") };
local if_symbol = { new_symbol("若") };
local typeAnnotation_symbol = { new_symbol("一類何物") };
local isOrNot_symbol = { new_symbol("是非") };
local sub_symbol = { new_symbol("其子") };
local true_symbol = { new_symbol("陽") };
local false_symbol = { new_symbol("陰") };
local quote_symbol = { new_symbol("引用") };
local apply_symbol = { new_symbol("應用") };
local null_symbol = { new_symbol("空") };
local construction_symbol = { new_symbol("連") };
local data_symbol = { new_symbol("構") };
local error_symbol = { new_symbol("誤") };
local symbol_symbol = { new_symbol("詞素") };
local list_symbol = { new_symbol("列") };
local head_symbol = { new_symbol("首") };
local tail_symbol = { new_symbol("尾") };
local thing_symbol = { new_symbol("物") };
local theWorldStopped_symbol = { new_symbol("宇宙亡矣") };
local effect_symbol = { new_symbol("效應") };
local sequentialWordFormation_symbol = { new_symbol('為符名連') };
local inputOutput_symbol = { new_symbol("出入改滅") };
_exports.system_symbol, _exports.name_symbol, _exports.function_symbol, _exports.form_symbol, _exports.equal_symbol, _exports.evaluate_sym, _exports.theThing_symbol, _exports.something_symbol, _exports.mapping_symbol, _exports.if_symbol, _exports.typeAnnotation_symbol, _exports.isOrNot_symbol, _exports.sub_symbol, _exports.true_symbol, _exports.false_symbol, _exports.quote_symbol, _exports.apply_symbol, _exports.null_symbol, _exports.construction_symbol, _exports.data_symbol, _exports.error_symbol, _exports.symbol_symbol, _exports.list_symbol, _exports.head_symbol, _exports.tail_symbol, _exports.thing_symbol, _exports.theWorldStopped_symbol, _exports.effect_symbol, _exports.sequentialWordFormation_symbol, _exports.inputOutput_symbol = system_symbol, name_symbol, function_symbol, form_symbol, equal_symbol, evaluate_sym, theThing_symbol, something_symbol, mapping_symbol, if_symbol, typeAnnotation_symbol, isOrNot_symbol, sub_symbol, true_symbol, false_symbol, quote_symbol, apply_symbol, null_symbol, construction_symbol, data_symbol, error_symbol, symbol_symbol, list_symbol, head_symbol, tail_symbol, thing_symbol, theWorldStopped_symbol, effect_symbol, sequentialWordFormation_symbol, inputOutput_symbol;
local the_world_stopped_v = { new_error(system_symbol, { new_list(theWorldStopped_symbol, something_symbol) }) };
local systemName_make = function(x)
	return new_data(name_symbol, { new_list(system_symbol, x) });
end;
local make_builtin_f_new_sym_f = function(x_sym)
	return systemName_make({ new_list(typeAnnotation_symbol, { new_list(function_symbol, something_symbol, x_sym) }, theThing_symbol) });
end;
local make_builtin_f_get_sym_f = function(t_sym, x_sym)
	return systemName_make({ new_list(typeAnnotation_symbol, { new_list(function_symbol, { new_list(t_sym) }, something_symbol) }, x_sym) });
end;
local make_builtin_f_p_sym_f = function(t_sym)
	return systemName_make({ new_list(typeAnnotation_symbol, function_symbol, { new_list(isOrNot_symbol, { new_list(typeAnnotation_symbol, t_sym, something_symbol) }) }) });
end;
local new_data_function_builtin_systemName = { make_builtin_f_new_sym_f(data_symbol) };
local data_name_function_builtin_systemName = { make_builtin_f_get_sym_f(data_symbol, name_symbol) };
local data_list_function_builtin_systemName = { make_builtin_f_get_sym_f(data_symbol, list_symbol) };
local data_p_function_builtin_systemName = { make_builtin_f_p_sym_f(data_symbol) };
local new_error_function_builtin_systemName = { make_builtin_f_new_sym_f(error_symbol) };
local error_name_function_builtin_systemName = { make_builtin_f_get_sym_f(error_symbol, name_symbol) };
local error_list_function_builtin_systemName = { make_builtin_f_get_sym_f(error_symbol, list_symbol) };
local error_p_function_builtin_systemName = { make_builtin_f_p_sym_f(error_symbol) };
local new_construction_function_builtin_systemName = { make_builtin_f_new_sym_f(construction_symbol) };
local construction_p_function_builtin_systemName = { make_builtin_f_p_sym_f(construction_symbol) };
local construction_head_function_builtin_systemName = { make_builtin_f_get_sym_f(construction_symbol, head_symbol) };
local construction_tail_function_builtin_systemName = { make_builtin_f_get_sym_f(construction_symbol, tail_symbol) };
local symbol_p_function_builtin_systemName = { make_builtin_f_p_sym_f(symbol_symbol) };
local null_p_function_builtin_systemName = { make_builtin_f_p_sym_f(null_symbol) };
local equal_p_function_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, function_symbol, { new_list(isOrNot_symbol, equal_symbol) }) }) };
local apply_function_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, { new_list(function_symbol, { new_construction(function_symbol, something_symbol) }, something_symbol) }, apply_symbol) }) };
local evaluate_function_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, function_symbol, evaluate_sym) }) };
local list_chooseOne_function_builtin_systemName = { make_builtin_f_get_sym_f(list_symbol, { new_list(typeAnnotation_symbol, thing_symbol, something_symbol) }) };
local if_function_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, function_symbol, if_symbol) }) };
local quote_form_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, form_symbol, quote_symbol) }) };
local lambda_form_builtin_systemName = { systemName_make({ new_list(typeAnnotation_symbol, { new_list(form_symbol, { new_list(function_symbol, something_symbol, function_symbol) }) }, theThing_symbol) }) };
local function_builtin_use_systemName = { systemName_make({ new_list(form_symbol, { new_list(system_symbol, function_symbol) }) }) };
local form_builtin_use_systemName = { systemName_make({ new_list(form_symbol, { new_list(system_symbol, form_symbol) }) }) };
local form_use_systemName = { systemName_make({ new_list(form_symbol, form_symbol) }) };
_exports.new_data_function_builtin_systemName, _exports.data_name_function_builtin_systemName, _exports.data_list_function_builtin_systemName, _exports.data_p_function_builtin_systemName, _exports.new_error_function_builtin_systemName, _exports.error_name_function_builtin_systemName, _exports.error_list_function_builtin_systemName, _exports.error_p_function_builtin_systemName, _exports.new_construction_function_builtin_systemName, _exports.construction_p_function_builtin_systemName, _exports.construction_head_function_builtin_systemName, _exports.construction_tail_function_builtin_systemName, _exports.symbol_p_function_builtin_systemName, _exports.null_p_function_builtin_systemName, _exports.equal_p_function_builtin_systemName, _exports.apply_function_builtin_systemName, _exports.evaluate_function_builtin_systemName, _exports.list_chooseOne_function_builtin_systemName, _exports.if_function_builtin_systemName, _exports.quote_form_builtin_systemName, _exports.lambda_form_builtin_systemName, _exports.function_builtin_use_systemName, _exports.form_builtin_use_systemName, _exports.form_use_systemName = new_data_function_builtin_systemName, data_name_function_builtin_systemName, data_list_function_builtin_systemName, data_p_function_builtin_systemName, new_error_function_builtin_systemName, error_name_function_builtin_systemName, error_list_function_builtin_systemName, error_p_function_builtin_systemName, new_construction_function_builtin_systemName, construction_p_function_builtin_systemName, construction_head_function_builtin_systemName, construction_tail_function_builtin_systemName, symbol_p_function_builtin_systemName, null_p_function_builtin_systemName, equal_p_function_builtin_systemName, apply_function_builtin_systemName, evaluate_function_builtin_systemName, list_chooseOne_function_builtin_systemName, if_function_builtin_systemName, quote_form_builtin_systemName, lambda_form_builtin_systemName, function_builtin_use_systemName, form_builtin_use_systemName, form_use_systemName;
local false_v = { new_data(false_symbol, { new_list() }) };
local true_v = { new_data(true_symbol, { new_list() }) };
local symbol_equal_p = function(x, y)
	if x == y then
		return true;
	end;
	if un_symbol(x) == un_symbol(y) then
		lang_set_do(x, y);
		return true;
	else
		return false;
	end;
end;
local jsArray_to_list = function(xs)
	local ret = null_v;
	for i = (#xs) - 1, 0, -1 do
		ret = { new_construction(xs[i + 1], ret) };
	end;
	return unpack(ret);
end;
local list_to_jsArray = function(xs, k_done, k_tail)
	local ret = {};
	while construction_p(xs) do
		table.insert(ret, { construction_head(xs) });
		xs = { construction_tail(xs) };
	end;
	if null_p(xs) then
		return k_done(ret);
	end;
	return k_tail(ret, xs);
end;
local maybe_list_to_jsArray = function(xs)
	return list_to_jsArray(xs, function(xs)
		return xs;
	end, function(xs, x)
		return false;
	end);
end;
new_list = function(...)
	local xs = { ... };
	return jsArray_to_list(xs);
end;
_exports.jsArray_to_list, _exports.maybe_list_to_jsArray, _exports.new_list = jsArray_to_list, maybe_list_to_jsArray, new_list;
local un_just_all = function(raw)
	local x = raw;
	local xs = {};
	while just_p(x) do
		table.insert(xs, x);
		x = { un_just(x) };
	end;
	do
		local i = 0;
		while i < (#xs) do
			lang_set_do(xs[i + 1], x);
			i = i + 1;
		end;
	end;
	return unpack(x);
end;
local any_delay_just_p = function(x)
	return just_p(x) or delay_evaluate_p(x) or delay_builtin_form_p(x) or delay_builtin_func_p(x) or delay_apply_p(x);
end;
_exports.delay_p = any_delay_just_p;
force_all = function(raw, parents_history, ref_novalue_replace)
	if parents_history == nil then parents_history = {} end;
	if ref_novalue_replace == nil then ref_novalue_replace = { false, false } end;
	local history = {};
	local x = raw;
	local xs = {};
	local replace_this_with_stopped = function()
		ref_novalue_replace[2] = true;
		lang_set_do(x, the_world_stopped_v);
		do
			local i = 0;
			while i < (#xs) do
				lang_set_do(xs[i + 1], the_world_stopped_v);
				i = i + 1;
			end;
		end;
		return unpack(the_world_stopped_v);
	end;
	local make_history = function()
		local ret = {};
		for x_id in pairs(history) do
			ret[x_id] = true;
		end;
		for x_id in pairs(parents_history) do
			ret[x_id] = true;
		end;
		return ret;
	end;
	while any_delay_just_p(x) do
		local x_id = simple_print(x);
		if parents_history[x_id] == true then
			return replace_this_with_stopped();
		end;
		if history[x_id] == true then
			ref_novalue_replace[1] = true;
			if delay_evaluate_p(x) then
				return replace_this_with_stopped();
			elseif delay_builtin_func_p(x) then
				local f = { delay_builtin_func_f(x) };
				local xs = delay_builtin_func_xs(x);
				local elim_s = { data_name_function_builtin_systemName, data_list_function_builtin_systemName, data_p_function_builtin_systemName, error_name_function_builtin_systemName, error_list_function_builtin_systemName, error_p_function_builtin_systemName, construction_p_function_builtin_systemName, construction_head_function_builtin_systemName, construction_tail_function_builtin_systemName, symbol_p_function_builtin_systemName, null_p_function_builtin_systemName };
				local is_elim = false;
				do
					local i = 0;
					while i < (#elim_s) do
						if jsbool_equal_p(elim_s[i + 1], f) then
							is_elim = true;
						end;
						i = i + 1;
					end;
				end;
				if is_elim then
					ASSERT((#xs) == 1);
					ASSERT(ref_novalue_replace[2] == false);
					local inner = { force_all(xs[1], make_history(), ref_novalue_replace) };
					if ref_novalue_replace[2] then
						return force_all({ builtin_func_apply(f, { inner }) });
					else
						return unpack(ERROR());
					end;
				end;
				if jsbool_equal_p(f, equal_p_function_builtin_systemName) then
					return replace_this_with_stopped();
				elseif jsbool_equal_p(f, apply_function_builtin_systemName) then
					return replace_this_with_stopped();
				elseif jsbool_equal_p(f, evaluate_function_builtin_systemName) then
					return replace_this_with_stopped();
				elseif jsbool_equal_p(f, if_function_builtin_systemName) then
					ASSERT((#xs) == 3);
					ASSERT(ref_novalue_replace[2] == false);
					local tf = { force_all(xs[1], make_history(), ref_novalue_replace) };
					if ref_novalue_replace[2] then
						return force_all({ builtin_func_apply(if_function_builtin_systemName, { tf, xs[2], xs[3] }) });
					else
						return unpack(ERROR());
					end;
				end;
				return unpack(ERROR());
			elseif delay_builtin_form_p(x) then
				return replace_this_with_stopped();
			elseif delay_apply_p(x) then
				return replace_this_with_stopped();
			end;
			return unpack(ERROR());
		end;
		history[x_id] = true;
		table.insert(xs, x);
		x = { force1(x) };
	end;
	do
		local i = 0;
		while i < (#xs) do
			lang_set_do(xs[i + 1], x);
			i = i + 1;
		end;
	end;
	return unpack(x);
end;
force1 = function(raw)
	local x = { un_just_all(raw) };
	local ret;
	ASSERT(not just_p(x));
	if delay_evaluate_p(x) then
		ret = { real_evaluate(delay_evaluate_env(x), { delay_evaluate_x(x) }) };
	elseif delay_builtin_form_p(x) then
		ret = { real_builtin_form_apply(delay_builtin_form_env(x), { delay_builtin_form_f(x) }, delay_builtin_form_xs(x)) };
	elseif delay_builtin_func_p(x) then
		ret = { real_builtin_func_apply({ delay_builtin_func_f(x) }, delay_builtin_func_xs(x)) };
	elseif delay_apply_p(x) then
		ret = { real_apply({ delay_apply_f(x) }, delay_apply_xs(x)) };
	else
		ret = x;
	end;
	ret = { un_just_all(ret) };
	lang_set_do(x, ret);
	return unpack(ret);
end;
_exports.force_all, _exports.force1 = force_all, force1;
local env_null_v = {};
local env_set = function(env, key, val)
	local ret = {};
	do
		local i = 0;
		while i < (#env) do
			if jsbool_equal_p(env[i + 0 + 1], key) then
				ret[i + 0 + 1] = key;
				ret[i + 1 + 1] = val;
				do
					i = i + 2;
					while i < (#env) do
						ret[i + 0 + 1] = env[i + 0 + 1];
						ret[i + 1 + 1] = env[i + 1 + 1];
						i = i + 2;
					end;
				end;
				return ret;
			else
				ret[i + 0 + 1] = env[i + 0 + 1];
				ret[i + 1 + 1] = env[i + 1 + 1];
			end;
			i = i + 2;
		end;
	end;
	ret[(#env) + 0 + 1] = key;
	ret[(#env) + 1 + 1] = val;
	return ret;
end;
local env_get = function(env, key, default_v)
	do
		local i = 0;
		while i < (#env) do
			if jsbool_equal_p(env[i + 0 + 1], key) then
				return env[i + 1 + 1];
			end;
			i = i + 2;
		end;
	end;
	return default_v;
end;
local must_env_get = function(env, key)
	do
		local i = 0;
		while i < (#env) do
			if jsbool_equal_p(env[i + 0 + 1], key) then
				return unpack(env[i + 1 + 1]);
			end;
			i = i + 2;
		end;
	end;
	return unpack(ERROR());
end;
local env2val = function(env)
	local ret = null_v;
	do
		local i = 0;
		while i < (#env) do
			ret = { new_construction({ new_list(env[i + 0 + 1], env[i + 1 + 1]) }, ret) };
			i = i + 2;
		end;
	end;
	return new_data(mapping_symbol, { new_list(ret) });
end;
local env_foreach = function(env, f)
	do
		local i = 0;
		while i < (#env) do
			f(env[i + 0 + 1], env[i + 1 + 1]);
			i = i + 2;
		end;
	end;
end;
local val2env = function(x)
	x = { force_all(x) };
	if not data_p(x) then
		return false;
	end;
	local s = { force_all({ data_name(x) }) };
	if not symbol_p(s) then
		return false;
	end;
	if not symbol_equal_p(s, mapping_symbol) then
		return false;
	end;
	s = { force_all({ data_list(x) }) };
	if not construction_p(s) then
		return false;
	end;
	if not null_p({ force_all({ construction_tail(s) }) }) then
		return false;
	end;
	local ret = {};
	local xs = { force_all({ construction_head(s) }) };
	while not null_p(xs) do
		if not construction_p(xs) then
			return false;
		end;
		local x = { force_all({ construction_head(xs) }) };
		xs = { force_all({ construction_tail(xs) }) };
		if not construction_p(x) then
			return false;
		end;
		local k = { construction_head(x) };
		x = { force_all({ construction_tail(x) }) };
		if not construction_p(x) then
			return false;
		end;
		local v = { construction_head(x) };
		if not null_p({ force_all({ construction_tail(x) }) }) then
			return false;
		end;
		local not_breaked = true;
		do
			local i = 0;
			while i < (#ret) do
				if jsbool_equal_p(ret[i + 0 + 1], k) then
					ret[i + 1 + 1] = v;
					not_breaked = false;
					break;
				end;
				i = i + 2;
			end;
		end;
		if not_breaked then
			table.insert(ret, k);
			table.insert(ret, v);
		end;
	end;
	return ret;
end;
_exports.env_null_v, _exports.env_set, _exports.env_get, _exports.env2val, _exports.env_foreach, _exports.val2env = env_null_v, env_set, env_get, env2val, env_foreach, val2env;
real_evaluate = function(env, raw)
	local x = { force1(raw) };
	if any_delay_just_p(x) then
		return evaluate(env, x);
	end;
	local error_v = { new_error(system_symbol, { new_list(function_builtin_use_systemName, { new_list(evaluate_function_builtin_systemName, { new_list({ env2val(env) }, x) }) }) }) };
	if construction_p(x) then
		local xs = {};
		local rest = x;
		while not null_p(rest) do
			if any_delay_just_p(rest) then
				return evaluate(env, x);
			elseif construction_p(rest) then
				table.insert(xs, { construction_head(rest) });
				rest = { force1({ construction_tail(rest) }) };
			else
				return unpack(error_v);
			end;
		end;
		if jsbool_equal_p(xs[1], form_builtin_use_systemName) then
			if (#xs) == 1 then
				return unpack(error_v);
			end;
			local f = xs[2];
			local args = {};
			do
				local i = 2;
				while i < (#xs) do
					args[i - 2 + 1] = xs[i + 1];
					i = i + 1;
				end;
			end;
			return builtin_form_apply(env, f, args);
		elseif jsbool_equal_p(xs[1], form_use_systemName) then
			if (#xs) == 1 then
				return unpack(error_v);
			end;
			local f = { force_all({ evaluate(env, xs[2]) }) };
			if not data_p(f) then
				return unpack(error_v);
			end;
			local f_type = { force1({ data_name(f) }) };
			if any_delay_just_p(f_type) then
				return evaluate(env, x);
			end;
			if not symbol_p(f_type) then
				return unpack(error_v);
			end;
			if not symbol_equal_p(f_type, form_symbol) then
				return unpack(error_v);
			end;
			local f_list = { force1({ data_list(f) }) };
			if any_delay_just_p(f_list) then
				return evaluate(env, x);
			end;
			if not construction_p(f_list) then
				return unpack(error_v);
			end;
			local f_x = { construction_head(f_list) };
			local f_list_cdr = { force1({ construction_tail(f_list) }) };
			if any_delay_just_p(f_list_cdr) then
				return evaluate(env, x);
			end;
			if not null_p(f_list_cdr) then
				return unpack(error_v);
			end;
			local args = { { env2val(env) } };
			do
				local i = 2;
				while i < (#xs) do
					args[i - 1 + 1] = xs[i + 1];
					i = i + 1;
				end;
			end;
			return apply(f_x, args);
		elseif jsbool_equal_p(xs[1], function_builtin_use_systemName) then
			if (#xs) == 1 then
				return unpack(error_v);
			end;
			local f = xs[2];
			local args = {};
			do
				local i = 2;
				while i < (#xs) do
					args[i - 2 + 1] = { evaluate(env, xs[i + 1]) };
					i = i + 1;
				end;
			end;
			return builtin_func_apply(f, args);
		else
			local f = { evaluate(env, xs[1]) };
			local args = {};
			do
				local i = 1;
				while i < (#xs) do
					args[i - 1 + 1] = { evaluate(env, xs[i + 1]) };
					i = i + 1;
				end;
			end;
			return apply(f, args);
		end;
	elseif null_p(x) then
		return unpack(x);
	elseif name_p(x) then
		return env_get(env, x, error_v);
	elseif error_p(x) then
		return unpack(error_v);
	end;
	return unpack(ERROR());
end;
name_p = function(x)
	return symbol_p(x) or data_p(x);
end;
local make_builtin_p_func = function(p_sym, p_jsfunc)
	return p_sym, 1, function(x, error_v)
		x = { force1(x) };
		if any_delay_just_p(x) then
			return builtin_func_apply(p_sym, { x });
		end;
		if p_jsfunc(x) then
			return unpack(true_v);
		end;
		return unpack(false_v);
	end;
end;
local make_builtin_get_func = function(f_sym, p_jsfunc, f_jsfunc)
	return f_sym, 1, function(x, error_v)
		x = { force1(x) };
		if any_delay_just_p(x) then
			return builtin_func_apply(f_sym, { x });
		end;
		if p_jsfunc(x) then
			return f_jsfunc(x);
		end;
		return unpack(error_v);
	end;
end;
local real_builtin_func_apply_s = { { make_builtin_p_func(data_p_function_builtin_systemName, data_p) }, { new_data_function_builtin_systemName, 2, new_data }, { make_builtin_get_func(data_name_function_builtin_systemName, data_p, data_name) }, { make_builtin_get_func(data_list_function_builtin_systemName, data_p, data_list) }, { make_builtin_p_func(error_p_function_builtin_systemName, error_p) }, { new_error_function_builtin_systemName, 2, new_error }, { make_builtin_get_func(error_name_function_builtin_systemName, error_p, error_name) }, { make_builtin_get_func(error_list_function_builtin_systemName, error_p, error_list) }, { make_builtin_p_func(null_p_function_builtin_systemName, null_p) }, { new_construction_function_builtin_systemName, 2, new_construction }, { make_builtin_p_func(construction_p_function_builtin_systemName, construction_p) }, { make_builtin_get_func(construction_head_function_builtin_systemName, construction_p, construction_head) }, { make_builtin_get_func(construction_tail_function_builtin_systemName, construction_p, construction_tail) }, { equal_p_function_builtin_systemName, 2, function(x, y, error_v)
	if x == y then
		return unpack(true_v);
	end;
	x = { force1(x) };
	y = { force1(y) };
	if any_delay_just_p(x) or any_delay_just_p(y) then
		return builtin_func_apply(equal_p_function_builtin_systemName, { x, y });
	end;
	if x == y then
		return unpack(true_v);
	end;
	if type_of(x) ~= type_of(y) then
		return unpack(false_v);
	end;
	local H_if = function(b, x, y)
		return builtin_func_apply(if_function_builtin_systemName, { b, x, y });
	end;
	local H_and = function(x, y)
		return H_if(x, y, false_v);
	end;
	ASSERT(not any_delay_just_p(x));
	local end_2 = function(x, y, f1, f2)
		return H_and({ builtin_func_apply(equal_p_function_builtin_systemName, { { f1(x) }, { f1(y) } }) }, { builtin_func_apply(equal_p_function_builtin_systemName, { { f2(x) }, { f2(y) } }) });
	end;
	repeat
		local _0 = false;
		if type_of(x) == ( null_t ) then
			return unpack(true_v);
		end;
		if type_of(x) == ( symbol_t ) then
			return unpack((symbol_equal_p(x, y) and true_v or false_v));
		end;
		if type_of(x) == ( data_t ) then
			return end_2(x, y, data_name, data_list);
		end;
		if type_of(x) == ( construction_t ) then
			return end_2(x, y, construction_head, construction_tail);
		end;
		if type_of(x) == ( error_t ) then
			return end_2(x, y, error_name, error_list);
		end;
	until true;
	return unpack(ERROR());
end }, { apply_function_builtin_systemName, 2, function(f, xs, error_v)
	local jslist = {};
	local iter = { force_all(xs) };
	while construction_p(iter) do
		table.insert(jslist, { construction_head(iter) });
		iter = { force_all({ construction_tail(iter) }) };
	end;
	if not null_p(iter) then
		return unpack(error_v);
	end;
	return apply(f, jslist);
end }, { evaluate_function_builtin_systemName, 2, function(env, x, error_v)
	local maybeenv = val2env(env);
	if maybeenv == false then
		return unpack(error_v);
	end;
	return evaluate(maybeenv, x);
end }, { make_builtin_p_func(symbol_p_function_builtin_systemName, symbol_p) }, { list_chooseOne_function_builtin_systemName, 1, function(xs, error_v)
	xs = { force1(xs) };
	if any_delay_just_p(xs) then
		return builtin_func_apply(list_chooseOne_function_builtin_systemName, { xs });
	end;
	if not construction_p(xs) then
		return unpack(error_v);
	end;
	return construction_head(xs);
end }, { if_function_builtin_systemName, 3, function(b, x, y, error_v)
	b = { force1(b) };
	if any_delay_just_p(b) then
		return builtin_func_apply(if_function_builtin_systemName, { b, x, y });
	end;
	if not data_p(b) then
		return unpack(error_v);
	end;
	local nam = { force_all({ data_name(b) }) };
	if not symbol_p(nam) then
		return unpack(error_v);
	end;
	if symbol_equal_p(nam, true_symbol) then
		return unpack(x);
	end;
	if symbol_equal_p(nam, false_symbol) then
		return unpack(y);
	end;
	return unpack(error_v);
end } };
real_apply = function(f, xs)
	local make_error_v = function()
		return new_error(system_symbol, { new_list(function_builtin_use_systemName, { new_list(apply_function_builtin_systemName, { new_list(f, { jsArray_to_list(xs) }) }) }) });
	end;
	f = { force1(f) };
	if any_delay_just_p(f) then
		return apply(f, xs);
	end;
	if not data_p(f) then
		return make_error_v();
	end;
	local f_type = { force_all({ data_name(f) }) };
	if not (symbol_p(f_type) and symbol_equal_p(f_type, function_symbol)) then
		return make_error_v();
	end;
	local f_list = { force_all({ data_list(f) }) };
	if not construction_p(f_list) then
		return make_error_v();
	end;
	local args_pat = { force_all_rec({ construction_head(f_list) }) };
	local f_list_cdr = { force_all({ construction_tail(f_list) }) };
	if not (construction_p(f_list_cdr) and null_p({ force_all({ construction_tail(f_list_cdr) }) })) then
		return make_error_v();
	end;
	local f_code = { construction_head(f_list_cdr) };
	local env = env_null_v;
	local isNotEmpty = function(arr)
		return not not (#arr);
	end;
	while not null_p(args_pat) do
		if name_p(args_pat) then
			env = env_set(env, args_pat, { jsArray_to_list(xs) });
			xs = {};
			args_pat = null_v;
		elseif construction_p(args_pat) then
			if isNotEmpty(xs) then
				local x = table.remove(xs, 1);
				env = env_set(env, { construction_head(args_pat) }, x);
				args_pat = { construction_tail(args_pat) };
			else
				return make_error_v();
			end;
		else
			return make_error_v();
		end;
	end;
	if (#xs) ~= 0 then
		return make_error_v();
	end;
	return evaluate(env, f_code);
end;
real_builtin_func_apply = function(f, xs)
	local error_v = { new_error(system_symbol, { new_list(function_builtin_use_systemName, { new_list(f, { jsArray_to_list(xs) }) }) }) };
	do
		local i = 0;
		while i < (#real_builtin_func_apply_s) do
			if jsbool_equal_p(f, real_builtin_func_apply_s[i + 1][1]) then
				local actually_length = real_builtin_func_apply_s[i + 1][2];
				if (#xs) ~= actually_length then
					return unpack(error_v);
				end;
				local f = real_builtin_func_apply_s[i + 1][3];
				repeat
					local _0 = false;
					if actually_length == ( 1 ) then
						return (f)(xs[1], error_v);
					end;
					if actually_length == ( 2 ) then
						return (f)(xs[1], xs[2], error_v);
					end;
					if actually_length == ( 3 ) then
						return (f)(xs[1], xs[2], xs[3], error_v);
					end;
				until true;
				return unpack(ERROR());
			end;
			i = i + 1;
		end;
	end;
	return unpack(error_v);
end;
real_builtin_form_apply = function(env, f, xs)
	local error_v = { new_error(system_symbol, { new_list(form_builtin_use_systemName, { new_list({ env2val(env) }, f, { jsArray_to_list(xs) }) }) }) };
	if jsbool_equal_p(f, quote_form_builtin_systemName) then
		if (#xs) ~= 1 then
			return unpack(error_v);
		end;
		return unpack(xs[1]);
	elseif jsbool_equal_p(f, lambda_form_builtin_systemName) then
		if (#xs) ~= 2 then
			return unpack(error_v);
		end;
		return new_lambda(env, xs[1], xs[2], error_v);
	end;
	return unpack(error_v);
end;
new_lambda = function(env, args_pat, body, error_v)
	if error_v == nil then error_v = nil end;
	local make_error_v = function()
		if error_v == nil then
			return new_error(system_symbol, { new_list(form_builtin_use_systemName, { new_list({ env2val(env) }, lambda_form_builtin_systemName, { jsArray_to_list({ args_pat, body }) }) }) });
		else
			return unpack(error_v);
		end;
	end;
	local make_quote = function(x)
		return new_list(form_builtin_use_systemName, quote_form_builtin_systemName, x);
	end;
	args_pat = { force_all_rec(args_pat) };
	local args_pat_vars = {};
	local args_pat_is_dot = false;
	local args_pat_iter = args_pat;
	while not null_p(args_pat_iter) do
		if name_p(args_pat_iter) then
			table.insert(args_pat_vars, args_pat_iter);
			args_pat_is_dot = true;
			args_pat_iter = null_v;
		elseif construction_p(args_pat_iter) then
			table.insert(args_pat_vars, { construction_head(args_pat_iter) });
			args_pat_iter = { construction_tail(args_pat_iter) };
		else
			return make_error_v();
		end;
	end;
	local args_pat_vars_val = args_pat;
	if args_pat_is_dot then
		args_pat_vars_val = { jsArray_to_list(args_pat_vars) };
	end;
	local env_vars = {};
	env_foreach(env, function(k, v)
		do
			local i = 0;
			while i < (#args_pat_vars) do
				if jsbool_equal_p(args_pat_vars[i + 1], k) then
					return nil;
				end;
				i = i + 1;
			end;
		end;
		table.insert(env_vars, k);
	end);
	local new_args_pat = args_pat_vars_val;
	for i = (#env_vars) - 1, 0, -1 do
		new_args_pat = { new_construction(env_vars[i + 1], new_args_pat) };
	end;
	local new_args = args_pat_vars_val;
	for i = (#env_vars) - 1, 0, -1 do
		new_args = { new_construction({ make_quote({ must_env_get(env, env_vars[i + 1]) }) }, new_args) };
	end;
	return new_data(function_symbol, { new_list(args_pat, { new_construction({ make_quote({ new_data(function_symbol, { new_list(new_args_pat, body) }) }) }, new_args) }) });
end;
jsbool_equal_p = function(x, y)
	if x == y then
		return true;
	end;
	x = { force_all(x) };
	y = { force_all(y) };
	if x == y then
		return true;
	end;
	local x_type = type_of(x);
	local y_type = type_of(y);
	if x_type ~= y_type then
		return false;
	end;
	local end_2 = function(x, y, f1, f2)
		if jsbool_equal_p({ f1(x) }, { f1(y) }) and jsbool_equal_p({ f2(x) }, { f2(y) }) then
			lang_set_do(x, y);
			return true;
		else
			return false;
		end;
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
	end;
	return ERROR();
end;
_exports.equal_p = jsbool_equal_p;
jsbool_no_force_equal_p = function(x, y)
	if x == y then
		return true;
	end;
	x = { un_just_all(x) };
	y = { un_just_all(y) };
	if x == y then
		return true;
	end;
	local x_type = type_of(x);
	local y_type = type_of(y);
	if x_type ~= y_type then
		return false;
	end;
	local end_2 = function(x, y, f1, f2)
		if jsbool_no_force_equal_p({ f1(x) }, { f1(y) }) and jsbool_no_force_equal_p({ f2(x) }, { f2(y) }) then
			lang_set_do(x, y);
			return true;
		else
			return false;
		end;
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
	end;
	return ERROR();
end;
simple_print = function(x)
	x = { un_just_all(x) };
	local temp = "";
	local prefix = "";
	if null_p(x) then
		return "()";
	elseif construction_p(x) then
		temp = "(";
		prefix = "";
		while construction_p(x) do
			temp = (temp) .. ((prefix) .. simple_print({ construction_head(x) }));
			prefix = " ";
			x = { un_just_all({ construction_tail(x) }) };
		end;
		if null_p(x) then
			temp = (temp) .. (")");
		else
			temp = (temp) .. (((" . ") .. simple_print(x)) .. ")");
		end;
		return temp;
	elseif data_p(x) then
		return ("#") .. simple_print({ new_construction({ data_name(x) }, { data_list(x) }) });
	elseif error_p(x) then
		return ("!") .. simple_print({ new_construction({ error_name(x) }, { error_list(x) }) });
	elseif symbol_p(x) then
		return un_symbol(x);
	elseif delay_evaluate_p(x) then
		return (((("$(") .. simple_print({ env2val(delay_evaluate_env(x)) })) .. " ") .. simple_print({ delay_evaluate_x(x) })) .. ")";
	elseif delay_builtin_func_p(x) then
		return (((("%(") .. simple_print({ delay_builtin_func_f(x) })) .. " ") .. simple_print({ jsArray_to_list(delay_builtin_func_xs(x)) })) .. ")";
	elseif delay_builtin_form_p(x) then
		return (((((("@(") .. simple_print({ env2val(delay_builtin_form_env(x)) })) .. " ") .. simple_print({ delay_builtin_form_f(x) })) .. " ") .. simple_print({ jsArray_to_list(delay_builtin_form_xs(x)) })) .. ")";
	elseif delay_apply_p(x) then
		return (((("^(") .. simple_print({ delay_apply_f(x) })) .. " ") .. simple_print({ jsArray_to_list(delay_apply_xs(x)) })) .. ")";
	end;
	return ERROR();
end;
local simple_print_force_all_rec = function(x)
	return simple_print({ force_all_rec(x) });
end;
_exports.simple_print, _exports.simple_print_force_all_rec = simple_print, simple_print_force_all_rec;
local simple_parse = function(x)
	local a_symbol_p, val;
	local state = TS.string_split(x, "");
	local eof = function()
		return (#state) == 0;
	end;
	local get = function()
		return table.remove(state, 1);
	end;
	local put = function(x)
		table.insert(state, 1, x);
	end;
	local parse_error = function()
		TS.throw("TheLanguage parse ERROR!");
	end;
	local a_space_p = function(x)
		return x == " " or x == "\n" or x == "\t" or x == "\r";
	end;
	local space = function()
		if eof() then
			return false;
		end;
		local x = get();
		if not a_space_p(x) then
			put(x);
			return false;
		end;
		while a_space_p(x) and not eof() do
			x = get();
		end;
		if not a_space_p(x) then
			put(x);
		end;
		return true;
	end;
	local symbol = function()
		if eof() then
			return false;
		end;
		local x = get();
		local ret = "";
		if not a_symbol_p(x) then
			put(x);
			return false;
		end;
		while a_symbol_p(x) and not eof() do
			ret = (ret) .. (x);
			x = get();
		end;
		if a_symbol_p(x) then
			ret = (ret) .. (x);
		else
			put(x);
		end;
		return { new_symbol(ret) };
	end;
	local list = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "(" then
			put(x);
			return false;
		end;
		local HOLE = { new_symbol('!!@@READ||HOLE@@!!') };
		local ret = HOLE;
		local set_last = function(lst)
			if ret == HOLE then
				ret = lst;
				return nil;
			end;
			local x = ret;
			while true do
				if not construction_p(x) then
					return ERROR();
				end;
				local d = { construction_tail(x) };
				if d == HOLE then
					break;
				end;
				x = { construction_tail(x) };
			end;
			if not construction_p(x) then
				return ERROR();
			end;
			if { construction_tail(x) } ~= HOLE then
				return ERROR();
			end;
			x[3] = lst;
		end;
		local last_add = function(x)
			set_last({ new_construction(x, HOLE) });
		end;
		while true do
			space();
			if eof() then
				return parse_error();
			end;
			x = get();
			if x == ")" then
				set_last(null_v);
				return ret;
			end;
			if x == "." then
				space();
				local e = { val() };
				set_last(e);
				space();
				if eof() then
					return parse_error();
				end;
				x = get();
				if x ~= ")" then
					return parse_error();
				end;
				return ret;
			end;
			put(x);
			local e = { val() };
			last_add(e);
		end;
	end;
	local data = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "#" then
			put(x);
			return false;
		end;
		local xs = list();
		if xs == false then
			return parse_error();
		end;
		if not construction_p(xs) then
			return parse_error();
		end;
		return { new_data({ construction_head(xs) }, { construction_tail(xs) }) };
	end;
	local readerror = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "!" then
			put(x);
			return false;
		end;
		local xs = list();
		if xs == false then
			return parse_error();
		end;
		if not construction_p(xs) then
			return parse_error();
		end;
		return { new_error({ construction_head(xs) }, { construction_tail(xs) }) };
	end;
	local make_read_two = function(prefix, k)
		return function()
			if eof() then
				return false;
			end;
			local c = get();
			if c ~= prefix then
				put(c);
				return false;
			end;
			local xs = list();
			if xs == false then
				return parse_error();
			end;
			if not construction_p(xs) then
				return parse_error();
			end;
			local x = { construction_tail(xs) };
			if not (construction_p(x) and null_p({ construction_tail(x) })) then
				return parse_error();
			end;
			return { k({ construction_head(xs) }, { construction_head(x) }) };
		end;
	end;
	local make_read_three = function(prefix, k)
		return function()
			if eof() then
				return false;
			end;
			local c = get();
			if c ~= prefix then
				put(c);
				return false;
			end;
			local xs = list();
			if xs == false then
				return parse_error();
			end;
			if not construction_p(xs) then
				return parse_error();
			end;
			local x = { construction_tail(xs) };
			if not construction_p(x) then
				return parse_error();
			end;
			local x_d = { construction_tail(x) };
			if not (construction_p(x_d) and null_p({ construction_tail(x_d) })) then
				return parse_error();
			end;
			return { k({ construction_head(xs) }, { construction_head(x) }, { construction_head(x_d) }) };
		end;
	end;
	local readeval = make_read_two("$", function(e, x)
		local env = val2env(e);
		if env == false then
			return unpack(parse_error());
		end;
		return evaluate(env, x);
	end);
	local readfuncapply = make_read_two("%", function(f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		return builtin_func_apply(f, jsxs);
	end);
	local readformbuiltin = make_read_three("@", function(e, f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		local env = val2env(e);
		if env == false then
			return unpack(parse_error());
		end;
		return builtin_form_apply(env, f, jsxs);
	end);
	local readapply = make_read_two("^", function(f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		return apply(f, jsxs);
	end);
	a_symbol_p = function(x)
		if a_space_p(x) then
			return false;
		end;
		local not_xs = { "(", ")", "!", "#", ".", "$", "%", "^", "@", '~', '/', '-', '>', '_', ':', '?', '[', ']', '&' };
		do
			local i = 0;
			while i < (#not_xs) do
				if x == not_xs[i + 1] then
					return false;
				end;
				i = i + 1;
			end;
		end;
		return true;
	end;
	val = function()
		space();
		local fs = { list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply };
		do
			local i = 0;
			while i < (#fs) do
				local x = fs[i + 1]();
				if x ~= false then
					return unpack(x);
				end;
				i = i + 1;
			end;
		end;
		return unpack(parse_error());
	end;
	return val();
end;
_exports.simple_parse = simple_parse;
local complex_parse = function(x)
	local a_symbol_p, val;
	local state = TS.string_split(x, "");
	local eof = function()
		return (#state) == 0;
	end;
	local get = function()
		return table.remove(state, 1);
	end;
	local put = function(x)
		table.insert(state, 1, x);
	end;
	local parse_error = function()
		TS.throw("TheLanguage parse ERROR!");
	end;
	local a_space_p = function(x)
		return x == " " or x == "\n" or x == "\t" or x == "\r";
	end;
	local space = function()
		if eof() then
			return false;
		end;
		local x = get();
		if not a_space_p(x) then
			put(x);
			return false;
		end;
		while a_space_p(x) and not eof() do
			x = get();
		end;
		if not a_space_p(x) then
			put(x);
		end;
		return true;
	end;
	local symbol = function()
		if eof() then
			return false;
		end;
		local x = get();
		local ret = "";
		if not a_symbol_p(x) then
			put(x);
			return false;
		end;
		while a_symbol_p(x) and not eof() do
			ret = (ret) .. (x);
			x = get();
		end;
		if a_symbol_p(x) then
			ret = (ret) .. (x);
		else
			put(x);
		end;
		return { new_symbol(ret) };
	end;
	local list = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "(" then
			put(x);
			return false;
		end;
		local HOLE = { new_symbol('!!@@READ||HOLE@@!!') };
		local ret = HOLE;
		local set_last = function(lst)
			if ret == HOLE then
				ret = lst;
				return nil;
			end;
			local x = ret;
			while true do
				if not construction_p(x) then
					return ERROR();
				end;
				local d = { construction_tail(x) };
				if d == HOLE then
					break;
				end;
				x = { construction_tail(x) };
			end;
			if not construction_p(x) then
				return ERROR();
			end;
			if { construction_tail(x) } ~= HOLE then
				return ERROR();
			end;
			x[3] = lst;
		end;
		local last_add = function(x)
			set_last({ new_construction(x, HOLE) });
		end;
		while true do
			space();
			if eof() then
				return parse_error();
			end;
			x = get();
			if x == ")" then
				set_last(null_v);
				return ret;
			end;
			if x == "." then
				space();
				local e = { val() };
				set_last(e);
				space();
				if eof() then
					return parse_error();
				end;
				x = get();
				if x ~= ")" then
					return parse_error();
				end;
				return ret;
			end;
			put(x);
			local e = { val() };
			last_add(e);
		end;
	end;
	local data = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "#" then
			put(x);
			return false;
		end;
		local xs = list();
		if xs == false then
			return parse_error();
		end;
		if not construction_p(xs) then
			return parse_error();
		end;
		return { new_data({ construction_head(xs) }, { construction_tail(xs) }) };
	end;
	local readerror = function()
		if eof() then
			return false;
		end;
		local x = get();
		if x ~= "!" then
			put(x);
			return false;
		end;
		local xs = list();
		if xs == false then
			return parse_error();
		end;
		if not construction_p(xs) then
			return parse_error();
		end;
		return { new_error({ construction_head(xs) }, { construction_tail(xs) }) };
	end;
	local make_read_two = function(prefix, k)
		return function()
			if eof() then
				return false;
			end;
			local c = get();
			if c ~= prefix then
				put(c);
				return false;
			end;
			local xs = list();
			if xs == false then
				return parse_error();
			end;
			if not construction_p(xs) then
				return parse_error();
			end;
			local x = { construction_tail(xs) };
			if not (construction_p(x) and null_p({ construction_tail(x) })) then
				return parse_error();
			end;
			return { k({ construction_head(xs) }, { construction_head(x) }) };
		end;
	end;
	local make_read_three = function(prefix, k)
		return function()
			if eof() then
				return false;
			end;
			local c = get();
			if c ~= prefix then
				put(c);
				return false;
			end;
			local xs = list();
			if xs == false then
				return parse_error();
			end;
			if not construction_p(xs) then
				return parse_error();
			end;
			local x = { construction_tail(xs) };
			if not construction_p(x) then
				return parse_error();
			end;
			local x_d = { construction_tail(x) };
			if not (construction_p(x_d) and null_p({ construction_tail(x_d) })) then
				return parse_error();
			end;
			return { k({ construction_head(xs) }, { construction_head(x) }, { construction_head(x_d) }) };
		end;
	end;
	local readeval = make_read_two("$", function(e, x)
		local env = val2env(e);
		if env == false then
			return unpack(parse_error());
		end;
		return evaluate(env, x);
	end);
	local readfuncapply = make_read_two("%", function(f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		return builtin_func_apply(f, jsxs);
	end);
	local readformbuiltin = make_read_three("@", function(e, f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		local env = val2env(e);
		if env == false then
			return unpack(parse_error());
		end;
		return builtin_form_apply(env, f, jsxs);
	end);
	local readapply = make_read_two("^", function(f, xs)
		local jsxs = list_to_jsArray(xs, function(xs)
			return xs;
		end, function(xs, y)
			return parse_error();
		end);
		return apply(f, jsxs);
	end);
	a_symbol_p = function(x)
		if a_space_p(x) then
			return false;
		end;
		local not_xs = { "(", ")", "!", "#", ".", "$", "%", "^", "@", '~', '/', '-', '>', '_', ':', '?', '[', ']', '&' };
		do
			local i = 0;
			while i < (#not_xs) do
				if x == not_xs[i + 1] then
					return false;
				end;
				i = i + 1;
			end;
		end;
		return true;
	end;
	val = function()
		space();
		local fs = { list, readsysname, data, readerror, readeval, readfuncapply, readformbuiltin, readapply };
		do
			local i = 0;
			while i < (#fs) do
				local x = fs[i + 1]();
				if x ~= false then
					return unpack(x);
				end;
				i = i + 1;
			end;
		end;
		return unpack(parse_error());
	end;
	return val();
end;
_exports.complex_parse = complex_parse;
complex_print = function(val)
	local print_sys_name;
	print_sys_name = function(x, where)
		if symbol_p(x) then
			return un_symbol(x);
		end;
		local inner_bracket = function(x)
			if where == 'inner' then
				return (('[') .. x) .. ']';
			elseif where == 'top' then
				return x;
			end;
			return ERROR();
		end;
		local maybe_xs = maybe_list_to_jsArray(x);
		if maybe_xs ~= false and (#maybe_xs) == 3 and jsbool_no_force_equal_p(maybe_xs[1], typeAnnotation_symbol) then
			local maybe_lst_2 = maybe_list_to_jsArray(maybe_xs[2]);
			if maybe_lst_2 ~= false and (#maybe_lst_2) == 3 and jsbool_no_force_equal_p(maybe_lst_2[1], function_symbol) then
				local var_2_1 = maybe_lst_2[2];
				local maybe_lst_3 = maybe_list_to_jsArray(var_2_1);
				if maybe_lst_3 ~= false and (#maybe_lst_3) == 1 and jsbool_no_force_equal_p(maybe_lst_2[3], something_symbol) then
					return inner_bracket(((print_sys_name(maybe_lst_3[1], 'inner')) .. '.') .. print_sys_name(maybe_xs[3], 'inner'));
				elseif construction_p(var_2_1) and jsbool_no_force_equal_p({ construction_tail(var_2_1) }, something_symbol) and jsbool_no_force_equal_p(maybe_lst_2[3], something_symbol) then
					return inner_bracket(((print_sys_name({ construction_head(var_2_1) }, 'inner')) .. '@') .. print_sys_name(maybe_xs[3], 'inner'));
				elseif jsbool_no_force_equal_p(var_2_1, something_symbol) and jsbool_no_force_equal_p(maybe_xs[3], theThing_symbol) then
					return inner_bracket((':>') .. print_sys_name(maybe_lst_2[3], 'inner'));
				end;
			end;
			local maybe_lst_44 = maybe_list_to_jsArray(maybe_xs[3]);
			if jsbool_no_force_equal_p(maybe_xs[2], function_symbol) and maybe_lst_44 ~= false and (#maybe_lst_44) == 2 and jsbool_no_force_equal_p(maybe_lst_44[1], isOrNot_symbol) then
				return inner_bracket((print_sys_name(maybe_lst_44[2], 'inner')) .. '?');
			end;
			if maybe_lst_2 ~= false and (#maybe_lst_2) == 2 and jsbool_no_force_equal_p(maybe_xs[3], theThing_symbol) and jsbool_no_force_equal_p(maybe_lst_2[1], form_symbol) then
				local maybe_lst_88 = maybe_list_to_jsArray(maybe_lst_2[2]);
				if maybe_lst_88 ~= false and (#maybe_lst_88) == 3 and jsbool_no_force_equal_p(maybe_lst_88[1], function_symbol) and jsbool_no_force_equal_p(maybe_lst_88[2], something_symbol) then
					return inner_bracket((':&>') .. print_sys_name(maybe_lst_88[3], 'inner'));
				end;
			end;
			local hd = (jsbool_no_force_equal_p(maybe_xs[3], something_symbol) and '_' or (jsbool_no_force_equal_p(maybe_xs[3], theThing_symbol) and '' or print_sys_name(maybe_xs[3], 'inner')));
			return inner_bracket(((hd) .. ':') .. print_sys_name(maybe_xs[2], 'inner'));
		elseif maybe_xs ~= false and (#maybe_xs) == 2 then
			if jsbool_no_force_equal_p(maybe_xs[1], form_symbol) then
				local maybe_lst_288 = maybe_list_to_jsArray(maybe_xs[2]);
				if maybe_lst_288 ~= false and (#maybe_lst_288) == 2 and jsbool_no_force_equal_p(maybe_lst_288[1], system_symbol) then
					return inner_bracket(('&+') .. print_sys_name(maybe_lst_288[2], 'inner'));
				end;
				return inner_bracket(('&') .. print_sys_name(maybe_xs[2], 'inner'));
			elseif jsbool_no_force_equal_p(maybe_xs[1], isOrNot_symbol) then
				return inner_bracket((print_sys_name(maybe_xs[2], 'inner')) .. '~');
			elseif jsbool_no_force_equal_p(maybe_xs[1], system_symbol) then
				return inner_bracket(('+') .. print_sys_name(maybe_xs[2], 'inner'));
			end;
		elseif maybe_xs ~= false and (#maybe_xs) == 3 and jsbool_no_force_equal_p(maybe_xs[1], sub_symbol) then
			local maybe_lst_8934 = maybe_list_to_jsArray(maybe_xs[3]);
			if maybe_lst_8934 ~= false and (#maybe_lst_8934) ~= 0 then
				local tmp = "";
				do
					local i = 0;
					while i < (#maybe_lst_8934) do
						tmp = (tmp) .. (('/') .. print_sys_name(maybe_lst_8934[i + 1], 'inner'));
						i = i + 1;
					end;
				end;
				return inner_bracket((print_sys_name(maybe_xs[2], 'inner')) .. tmp);
			end;
		end;
		if where == 'inner' then
			return simple_print(x);
		elseif where == 'top' then
			return simple_print({ systemName_make(x) });
		end;
		return ERROR();
	end;
	local x = { simple_parse(simple_print(val)) };
	local temp = "";
	local prefix = "";
	if null_p(x) then
		return "()";
	elseif construction_p(x) then
		temp = "(";
		prefix = "";
		while construction_p(x) do
			temp = (temp) .. ((prefix) .. complex_print({ construction_head(x) }));
			prefix = " ";
			x = { construction_tail(x) };
		end;
		if null_p(x) then
			temp = (temp) .. (")");
		else
			temp = (temp) .. (((" . ") .. complex_print(x)) .. ")");
		end;
		return temp;
	elseif data_p(x) then
		local name = { data_name(x) };
		local list = { data_list(x) };
		local maybe_xs = maybe_list_to_jsArray(list);
		if maybe_xs ~= false and (#maybe_xs) == 2 and jsbool_no_force_equal_p(name, name_symbol) and jsbool_no_force_equal_p(maybe_xs[1], system_symbol) then
			return print_sys_name(maybe_xs[2], 'top');
		end;
		return ("#") .. complex_print({ new_construction(name, list) });
	elseif error_p(x) then
		return ("!") .. complex_print({ new_construction({ error_name(x) }, { error_list(x) }) });
	elseif symbol_p(x) then
		return un_symbol(x);
	elseif delay_evaluate_p(x) then
		return (((("$(") .. complex_print({ env2val(delay_evaluate_env(x)) })) .. " ") .. complex_print({ delay_evaluate_x(x) })) .. ")";
	elseif delay_builtin_func_p(x) then
		return (((("%(") .. complex_print({ delay_builtin_func_f(x) })) .. " ") .. complex_print({ jsArray_to_list(delay_builtin_func_xs(x)) })) .. ")";
	elseif delay_builtin_form_p(x) then
		return (((((("@(") .. complex_print({ env2val(delay_builtin_form_env(x)) })) .. " ") .. complex_print({ delay_builtin_form_f(x) })) .. " ") .. complex_print({ jsArray_to_list(delay_builtin_form_xs(x)) })) .. ")";
	elseif delay_apply_p(x) then
		return (((("^(") .. complex_print({ delay_apply_f(x) })) .. " ") .. complex_print({ jsArray_to_list(delay_apply_xs(x)) })) .. ")";
	end;
	return ERROR();
end;
_exports.complex_print = complex_print;
local return_inputOutput_systemName = { complex_parse('效應/[:物]') };
local bind_inputOutput_systemName = { complex_parse('效應/連') };
local ecmascript_systemName = { systemName_make({ complex_parse('(為符名連 e c m a s c r i p t)') }) };
_exports.return_inputOutput_systemName, _exports.bind_inputOutput_systemName, _exports.ecmascript_systemName = return_inputOutput_systemName, bind_inputOutput_systemName, ecmascript_systemName;
return _exports;
