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
var TheLanguage=(function(){
    var enable_nodejs=true;
    var in_nodejs=module?true:false;/* fix me? */
    var exports={};
    if(enable_nodejs&&in_nodejs){exports=module.exports;}/* fix me? */

    function ERROR(){
	var PANIC=null;
	PANIC();
    }
    function ASSERT(x){
	if(!x){
	    ERROR();
	}
    }

    /* {{{ 相對獨立的部分。內建數據結構 */
    var symbol_t=0;
    var cons_t=1;
    var null_t=2;
    var data_t=3;
    var error_t=4;
    var just_t=5;
    var delay_eval_t=6;
    var delay_builtin_func_t=7;
    var delay_builtin_form_t=8;
    var delay_apply_t=9;

    function type_of(x){
	return x[0];
    }
    function make_one_p(t){
	return function(x){
	    return x[0]===t;
	};
    }
    var make_two_p=make_one_p;
    var make_three_p=make_one_p;
    function make_new_one(t){
	return function(x){
	    return [t, x];
	};
    }
    function make_new_two(t){
	return function(x, y){
	    return [t, x, y];/* 實現底層依賴[編號 0] parser <-> 內建數據結構 */
	};
    }
    function make_new_three(t){
	return function(x, y, z){
	    return [t, x, y, z];
	};
    }
    function make_get_one_a(t){
	return function(x){
	    ASSERT(x[0]===t);
	    return x[1];
	};
    }
    var make_get_two_a=make_get_one_a;
    var make_get_three_a=make_get_one_a;
    function make_get_two_b(t){
	return function(x){
	    ASSERT(x[0]===t);
	    return x[2];
	};
    }
    var make_get_three_b=make_get_two_b;
    function make_get_three_c(t){
	return function(x){
	    ASSERT(x[0]===t);
	    return x[3];
	};
    }
    
    var new_symbol=make_new_one(symbol_t);
    var symbol_p=make_one_p(symbol_t);/* String */
    var un_symbol=make_get_one_a(symbol_t);
    exports.new_symbol=new_symbol;
    exports.symbol_p=symbol_p;
    exports.un_symbol=un_symbol;

    var new_cons=make_new_two(cons_t);
    var cons_p=make_two_p(cons_t);
    var cons_car=make_get_two_a(cons_t);
    var cons_cdr=make_get_two_b(cons_t);
    exports.new_cons=new_cons;
    exports.cons_p=cons_p;
    exports.cons_car=cons_car;
    exports.cons_cdr=cons_cdr;
    
    var null_v=[null_t];
    function null_p(x){
	return x[0]===null_t;
    }
    exports.null_v=null_v;
    exports.null_p=null_p;

    var new_data=make_new_two(data_t);
    var data_p=make_two_p(data_t);
    var data_name=make_get_two_a(data_t);
    var data_list=make_get_two_b(data_t);
    exports.new_data=new_data;
    exports.data_p=data_p;
    exports.data_name=data_name;
    exports.data_list=data_list;

    var new_error=make_new_two(error_t);
    var error_p=make_two_p(error_t);
    var error_name=make_get_two_a(error_t);
    var error_list=make_get_two_b(error_t);
    exports.new_error=new_error;
    exports.error_p=error_p;
    exports.error_name=error_name;
    exports.error_list=error_list;

    function lang_set_do(x, y){
	if(x===y){
	    return;
	}
	x[0]=just_t;
	x[1]=y;
	x[2]=null;
	x[3]=null;
    }
    var just_p=make_one_p(just_t);
    var un_just=make_get_one_a(just_t);
    var lang_eval=make_new_two(delay_eval_t);
    var delay_eval_p=make_two_p(delay_eval_t);
    var delay_eval_env=make_get_two_a(delay_eval_t);/* Env */
    var delay_eval_x=make_get_two_b(delay_eval_t);
    var builtin_form_apply=make_new_three(delay_builtin_form_t);
    var delay_builtin_form_p=make_three_p(delay_builtin_form_t);
    var delay_builtin_form_env=make_get_three_a(delay_builtin_form_t);
    var delay_builtin_form_f=make_get_three_b(delay_builtin_form_t);
    var delay_builtin_form_xs=make_get_three_c(delay_builtin_form_t);
    var builtin_func_apply=make_new_two(delay_builtin_func_t);
    var delay_builtin_func_p=make_two_p(delay_builtin_func_t);
    var delay_builtin_func_f=make_get_two_a(delay_builtin_func_t);/* LangVal/Name */
    var delay_builtin_func_xs=make_get_two_b(delay_builtin_func_t);/* JSList LangVal */
    var lang_apply=make_new_two(delay_apply_t);
    var delay_apply_p=make_two_p(delay_apply_t);
    var delay_apply_f=make_get_two_a(delay_apply_t);
    var delay_apply_xs=make_get_two_b(delay_apply_t);/* JSList LangVal */
    function force_all_rec(x){
	x=force_all(x);
	switch(type_of(x)){
	case data_t:case error_t:case cons_t:
	    x[1]=force_all_rec(x[1]);
	    x[2]=force_all_rec(x[2]);
	    return x;
	default:
	    return x;
	}
    }
    exports.force_rec=force_all_rec;
    /* 相對獨立的部分。內建數據結構 }}} */

    /* {{{ 相對獨立的部分。對內建數據結構的簡單處理 */
    function jslist2list(xs){
	var ret=null_v;
	for(var i=xs.length-1;i>=0;i--){
	    ret=new_cons(xs[i], ret);
	}
	return ret;
    }
    function new_list(){
	return jslist2list(arguments);
    }
    exports.jslist2list=jslist2list;
    exports.new_list=new_list;
    
    function un_just_all(raw){
	var x=raw;
	var xs=[];
	while(just_p(x)){
	    xs[xs.length]=x;
	    x=un_just;
	}
	for(var i=0;i<xs.length;i++){
	    lang_set_do(xs[i], x);
	}
	return x;
    }
    
    function any_delay_just_p(x){
	return just_p(x) || delay_eval_p(x) || delay_builtin_form_p(x) || delay_builtin_func_p(x) || delay_apply_p(x);
    }
    exports.eval=lang_eval;
    exports.delay_p=any_delay_just_p;

    function force_all(raw){/* LangVal -> LangVal */
	var x=raw;
	var xs=[];
	while(any_delay_just_p(x)){
	    xs[xs.length]=x;
	    x=force1(x);
	}
	for(var i=0;i<xs.length;i++){
	    lang_set_do(xs[i], x);
	}
	return x;
    }
    function force1(raw){/* LangVal -> LangVal */
	var x=un_just_all(raw);
	var ret;
	ASSERT(!just_p(x));
	if(delay_eval_p(x)){
	    ret=real_eval(delay_eval_env(x), delay_eval_x(x));
	}else if(delay_builtin_form_p(x)){
	    ret=real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x));
	}else if(delay_builtin_func_p(x)){
	    ret=real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x));
	}else if(delay_apply_p(x)){
	    ret=real_lang_apply(delay_apply_f(x), delay_apply_xs(x));
	}else{
	    ret=x;
	}
	ret=un_just_all(ret);
	lang_set_do(x, ret);
	return ret;
    }
    exports.force=force_all;
    /* 相對獨立的部分。對內建數據結構的簡單處理 }}} */
    
    /* {{{ 相對獨立的部分。符號名稱 */
    var sys_sym=new_symbol("太始初核");
    var name_sym=new_symbol("符名號標");
    var func_sym=new_symbol("化變滅演");
    var form_sym=new_symbol("式形法特");
    var equal_sym=new_symbol("等同皆一");
    var eval_sym=new_symbol("算釋解計");
    var the_sym=new_symbol("特一定其");
    var sth_sym=new_symbol("省略之其");
    var map_sym=new_symbol("鍵表映界");
    var if_sym=new_symbol("若");
    var a_sym=new_symbol("一類何物");
    var one_sym=new_symbol("一");
    var isornot_sym=new_symbol("邪乎否与");
    var true_sym=new_symbol("陽");
    var false_sym=new_symbol("陰");
    var bool_sym=new_symbol("陰陽");
    var quote_sym=new_symbol("引用");
    var apply_sym=new_symbol("用調應使");
    var null_sym=new_symbol("空");
    var cons_sym=new_symbol("連");
    var data_sym=new_symbol("構");
    var error_sym=new_symbol("誤");
    var sym_sym=new_symbol("符");
    var list_sym=new_symbol("列");
    var head_sym=new_symbol("首");
    var tail_sym=new_symbol("尾");
    function make_sys_sym_f(x){
	return new_data(sys_sym, new_list(name_sym, x));
    }
    function make_builtin_f_new_sym_f(x_sym){
	return make_sys_sym_f(new_list(a_sym, new_list(func_sym, sth_sym, x_sym), the_sym));
    }
    function make_builtin_f_get_sym_f(t_sym, x_sym){
	return make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_list(t_sym), sth_sym), x_sym));
    }
    function make_builtin_f_p_sym_f(t_sym){
	return make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, t_sym))));
    }
    var builtin_func_new_data_sym=make_builtin_f_new_sym_f(data_sym);
    var builtin_func_data_name_sym=make_builtin_f_get_sym_f(data_sym, name_sym);
    var builtin_func_data_list_sym=make_builtin_f_get_sym_f(data_sym, list_sym);
    var builtin_func_data_p_sym=make_builtin_f_p_sym_f(data_sym);
    
    var builtin_func_new_error_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, error_sym), the_sym)));
    var builtin_func_error_name_sym=make_builtin_f_get_sym_f(error_sym, name_sym);
    var builtin_func_error_list_sym=make_builtin_f_get_sym_f(error_sym, list_sym)
    var builtin_func_error_p_sym=make_builtin_f_p_sym_f(error_sym);
    
    var builtin_func_new_cons_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, cons_sym), the_sym)));
    var builtin_func_cons_p_sym=make_builtin_f_p_sym_f(cons_sym);
    var builtin_func_cons_head_sym=make_builtin_f_get_sym_f(cons_sym, head_sym);
    var builtin_func_cons_tail_sym=make_builtin_f_get_sym_f(cons_sym, tail_sym);

    var builtin_func_sym_p_sym=make_builtin_f_p_sym_f(sym_sym);

    var builtin_func_null_p_sym=make_builtin_f_p_sym_f(null_sym);
    
    var builtin_func_equal_sym=make_sys_sym_f(new_list(a_sym, func_sym, new_list(isornot_sym, equal_sym)));
    var builtin_form_quote_sym=make_sys_sym_f(new_list(a_sym, form_sym, quote_sym));
    var builtin_func_apply_sym=make_sys_sym_f(new_list(a_sym, new_list(func_sym, new_cons(func_sym, sth_sym), sth_sym), apply_sym));
    var builtin_func_eval_sym=make_sys_sym_f(new_list(a_sym, func_sym, eval_sym));
    var builtin_func_list_choose_sym=make_builtin_f_get_sym_f(list_sym, one_sym);
    var builtin_func_if_sym=make_sys_sym_f(new_list(a_sym, func_sym, if_sym));
    
    var use_builtin_func_sym=make_sys_sym_f(new_list(form_sym, new_list(sys_sym, func_sym)));
    var use_builtin_form_sym=make_sys_sym_f(new_list(form_sym, new_list(sys_sym, form_sym)));
    var use_form_sym=make_sys_sym_f(new_list(form_sym, form_sym));
    var false_v=new_data(false_sym, new_list());
    var true_v=new_data(true_sym, new_list());
    function symbol_eq_p(x,y){
	return un_symbol(x)===un_symbol(y);/* 其他語言暫未實現。 TODO */
    }
    /* 相對獨立的部分。符號名稱 }}} */
    
    /* {{{ 相對獨立的部分。變量之環境 */
    var env_null_v=[];
    function env_set(env, key, val){/* Env k v, k, v -> Env k v */
	var ret=[];
	for(var i=0;i<env.length;i=i+2){
	    if(jsbool_equal_p(env[i+0], key)){
		ret[i+0]=key;
		ret[i+1]=val;
		for(i=i+2;i<env.length;i=i+2){
		    ret[i+0]=env[i+0];
		    ret[i+1]=env[i+1];
		}
		return ret;
	    }else{
		ret[i+0]=env[i+0];
		ret[i+1]=env[i+1];
	    }
	}
	ret[env.length+0]=key;
	ret[env.length+1]=val;
	return ret;
    }
    function env_get(env, key, default_v){/* Env k v, k, v -> v */
	for(var i=0;i<env.length;i=i+2){
	    if(jsbool_equal_p(env[i+0], key)){
		return env[i+1];
	    }
	}
	return default_v;
    }
    exports.env_null_v=env_null_v;
    exports.env_set=env_set;
    exports.env_get=env_get;

    function env2val(env){/* Env k v -> LangVal */
	var ret=null_v;
	for(var i=0;i<env.length;i=i+2){
	    ret=new_cons(new_list(env[i+0], env[i+1]), ret);
	}
	return new_data(map_sym, new_list(ret));
    }
    function val2env(x){/* LangVal -> Maybe (Env k v) */
	x=force_all(x);
	if(!data_p(x)){return false;}
	var s=force_all(data_name(x));
	if(!symbol_p(s)){return false;}
	if(!symbol_eq_p(s,map_sym)){return false;}
	s=force_all(data_list(x));
	if(!cons_p(s)){return false;}
	if(!null_p(force_all(cons_cdr(s)))){return false;}
	var ret=[];
	var xs=force_all(cons_car(s));
	while(!null_p(xs)){
	    if(!cons_p(xs)){return false;}
	    var x=force_all(cons_car(xs));
	    xs=force_all(cons_cdr(xs));
	    if(!cons_p(x)){return false;}
	    var k=cons_car(x);
	    x=force_all(cons_cdr(x));
	    if(!cons_p(x)){return false;}
	    var v=cons_car(x);
	    if(!null_p(force_all(cons_cdr(x)))){return false;}
	    (function(){
		for(var i=0;i<ret.length;i=i+2){
		    if(jsbool_equal_p(ret[i+0], k))
		    {ret[i+1]=v;return;}
		}
		ret[ret.length]=k;
		ret[ret.length]=v;
	    })();
	}
	return ret;
    }
    exports.env2val=env2val;
    exports.val2env=val2env;
    /* 相對獨立的部分。變量之環境 }}} */

    function real_eval(env, raw){/* Env, LangVal -> LangVal */
	var x=force1(raw);
	if(any_delay_just_p(x)){
	    return lang_eval(env, x);
	}
	var error_v=new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_eval_sym, new_list(env2val(env), x))));
	switch(type_of(x)){
	case cons_t:
	    var xs=[];
	    var rest=x;
	    while(!null_p(rest)){
		if(any_delay_just_p(rest)){
		    return lang_eval(env, x);
		}else if(cons_p(rest)){
		    xs[xs.length]=cons_car(rest);
		    /* WARNING delay未正確處理(影響較小) */
		    rest=force1(cons_cdr(rest));
		}else{
		    return error_v;
		}
	    }
	    /* WARNING delay未正確處理(影響較小) */
	    if(jsbool_equal_p(xs[0], use_builtin_form_sym)){
		if(xs.length===1){
		    return error_v;
		}
		var f=xs[1];
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=xs[i];
		}
		return builtin_form_apply(env, f, args);
	    }else if(jsbool_equal_p(xs[0], use_form_sym)){
		if(xs.length===1){
		    return error_v;
		}
		var f=force1(xs[1]);
		if(any_just_delay_p(f)){return lang_eval(env, x);}
		if(!data_p(f)){return error_v;}
		var f_type=force1(data_name(f));
		if(any_delay_just_p(f_type)){return lang_eval(env, x);}
		if(!symbol_p(f_type)){return error_v;}
		if(!symbol_eq_p(f_type, form_sym)){return error_v;}
		var f_list=force1(data_list(f));
		if(any_delay_just_p(f_list)){return lang_eval(env, x);}
		if(!cons_p(f_list)){return error_v;}
		var f_x=cons_car(f_list);
		var f_list_cdr=force1(cons_cdr(f_list));
		if(any_delay_just_p(f_list_cdr)){return lang_eval(env, x);}
		if(!null_p(f_list_cdr)){return error_v;}
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=xs[i];
		}
		return lang_apply(f_x, args);
	    }else if(jsbool_equal_p(xs[0], use_builtin_func_sym)){
		if(xs.length===1){
		    return error_v;
		}
		var f=xs[1];
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=lang_eval(env, xs[i]);
		}
		return builtin_func_apply(f, args);
	    }else{
		var f=lang_eval(env, xs[0]);
		var args=[];
		for(var i=1;i<xs.length;i++){
		    args[i-1]=lang_eval(env, xs[i]);
		}
		return lang_apply(f, args);
	    }
	    break;
	case null_t:
	    return x;
	case symbol_t:case data_p:
	    return env_get(env, x, error_v);
	case error_t:
	    return error_v;
	default:
	    ERROR();
	}
	ERROR();
    }
    
    function make_builtin_p_func(p_sym, p_jsfunc){
	return
	[p_sym, 1, function(x, error_v){
	    x=force1(x);
	    if(any_delay_just_p(x)){
		return builtin_func_apply(p_sym, [x]);
	    }
	    if(p_jsfunc(x)){
		return true_v;
	    }
	    if(error_p(x)){
		return error_v;
	    }
	    return false_v;
	}];
    }
    function make_builtin_get_func(f_sym, p_jsfunc, f_jsfunc){
	return
	[f_sym, 1, function(x, error_v){
	    x=force1(x);
	    if(any_delay_just_p(x)){
		return builtin_func_apply(f_sym, [x]);
	    }
	    if(p_jsfunc(x)){
		return f_jsfunc(x);
	    }
	    if(error_p(x)){
		return error_v;
	    }
	    return error_v;
	}];
    }
    var real_builtin_func_apply_s=[
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
	
	[builtin_func_equal_sym, 2, function(x, y, error_v){
	    if(x===y){
		return true_v;
	    }
	    x=force1(x);
	    y=force1(y);
	    if(any_delay_just_p(x) || any_delay_just_p(y)){
		return builtin_func_apply(builtin_func_equal_sym, [x, y]); /* not fully implemented -- Halting */
	    }
	    if(x===y){
		return true_v;
	    }
	    if(type_of(x) !== type_of(y)){
		return false_v;
	    }
	    function H_if(b,x,y){/* H = helper */
		return builtin_func_apply(builtin_func_if_sym, [b, x, y]);
	    }
	    function H_and(x,y){
		return H_if(x,y,false_v);
	    }
	    ASSERT(!any_delay_just_p(x));
	    var f1=null;
	    var f2=null;
	    switch(type_of(x)){
	    case null_t:
		return true_v;
	    case symbol_t:
		return symbol_eq_p(x, y)?true_v:false_v;
	    case data_t:f1=data_name;f2=data_list;
	    case cons_t:f1=cons_car;f2=cons_cdr;
	    case error_t:f1=error_name;f2=error_list;
	   	return H_and(builtin_func_apply(builtin_func_equal_sym, [f1(x), f1(y)]), builtin_func_apply(builtin_func_equal_sym, [f2(x), f2(y)]));
	    default:
	    }
	    ERROR();
	}],
	[builtin_func_apply_sym, 2, function(f, xs, error_v){
	    /* WARNING delay未正確處理(影響較小) */
	    var jslist=[];
	    var iter=force_all(xs);
	    while(cons_p(iter)){
		jslist[jslist.length]=cons_car(iter);
		iter=force_all(cons_cdr(iter));
	    }
	    if(!null_p(iter)){return error_v;}
	    return lang_apply(f, jslist);
	}],
	[builtin_func_eval_sym, 2, function(env, x, error_v){
	    /* WARNING delay未正確處理(影響較小) */
	    var maybeenv=val2env(env);
	    if(maybeenv===false){return error_v;}
	    return lang_eval(env, x);
	}],

	make_builtin_p_func(builtin_func_sym_p_sym, symbol_p),

	[builtin_func_list_choose_sym, 1, function(xs, error_v){
	    /* xs可以無限長，不判斷是否真的是list */
	    xs=force1(xs);
	    if(any_delay_just_p(xs)){
		return builtin_func_apply(builtin_func_list_choose_sym, [xs]);
	    }
	    if(!cons_p(xs)){return error_v;}
	    return cons_car(xs);
	}],
	[builtin_func_if_sym, 3, function(b, x, y, error_v){
	    b=force1(b);
	    if(any_delay_just_p(b)){
		return builtin_func_apply(builtin_func_if_sym, [b, x, y]);
	    }
	    if(!data_p(b)){return error_v;}
	    /* WARNING delay未正確處理(影響較小) */
	    var nam=force_all(data_name(b));
	    if(!symbol_p(nam)){return error_v;}
	    if(symbol_eq_p(nam, true_sym)){
		return x;
	    }
	    if(symbol_eq_p(nam, false_sym)){
		return y;
	    }
	    return error_v;
	}],
    ];
    function real_lang_apply(f, xs){/* LangVal, JSList LangVal -> LangVal */
	/* WARNING delay未正確處理(影響較小) */
	
	function make_error_v(){
	    return new_error(sys_sym, new_list(use_builtin_func_sym, new_list(builtin_func_apply_sym, new_list(f, jslist2list(xs)))));
	}
	f=force1(f);
	if(any_delay_just_p(f)){return lang_apply(f, xs);}
	if(!data_p(f)){return make_error_v();}
	var f_type=force_all(data_name(f));
	if(!(symbol_p(f_type)&&symbol_eq_p(f_type, func_sym))){return make_error_v();}
	var f_list=force_all(data_list(f));
	if(!cons_p(f_list)){return make_error_v();}
	var args_pat=force_all_rec(cons_car(f_list));
	var f_list_cdr=force_all(cons_cdr(f_list));
	if(!(cons_p(f_list_cdr)&&null_p(force_all(cons_cdr(f_list_cdr))))){return make_error_v();}
	var f_code=cons_car(f_list_cdr);
	var env=env_null_v;
	while(!null_p(args_pat)){
	    if(symbol_p(args_pat)){
		env=env_set(env, args_pat, jslist2list(xs));
		xs=[];
		args_pat=null_v;
	    }else if(cons_p(args_pat)){
		if(xs.length===0){return make_error_v();}
		env=env_set(env, cons_car(args_pat), xs.shift()/* 副作用! */);
		args_pat=cons_cdr(args_pat);
	    }
	    return make_error_v();
	}
	if(xs.length!==0){return make_error_v();}
	return lang_eval(env, f_code);
    }
    function real_builtin_func_apply(f, xs){/* Name, JSList LangVal -> LangVal */
	var error_v=new_error(sys_sym, new_list(use_builtin_func_sym, new_list(f, xs)));
	for(var i=0;i<real_builtin_func_apply_s.length;i++){
	    /* WARNING delay未正確處理(影響較小) */
	    if(jsbool_equal_p(f, real_builtin_func_apply_s[i][0])){
		if(xs.length!=real_builtin_func_apply_s[i][1]){
		    return error_v;
		}
		xs[xs.length]=error_v;
		return real_builtin_func_apply_s[i][2].apply(null, xs);
	    }
	}
	return error_v;
    }
    function real_builtin_form_apply(env, f, xs){
	/* Env, Name, JSList NotEvaledLangVal -> LangVal */
	var error_v=new_error(sys_sym, new_list(use_builtin_form_sym, new_list(f, xs)));
	/* WARNING delay未正確處理(影響較小) */
	if(jsbool_equal_p(f, builtin_form_quote_sym)){
	    if(xs.length!==1){
		return error_v;
	    }
	    return xs[0];
	}
	return error_v;
    }
    function jsbool_equal_p(x, y){
	/* LangVal, LangVal -> JSBoolean */
	var x=force_all(langbool_equal_p(x, y));
	ASSERT(data_p(x));
	var name=force_all(data_name(x));
	ASSERT(symbol_p(name));
	if(symbol_eq_p(name,false_sym)){
	    return false;
	}else if(symbol_eq_p(name, true_sym)){
	    return true;
	}
	ERROR();
    }
    exports.equal_p=jsbool_equal_p;
    function langbool_equal_p(x, y){
	return builtin_func_apply(builtin_func_equal_sym, [x, y]);
    }
    
    /* {{{ 相對獨立的部分。parser/printer */
    function make_printer(forcer){
	function print(x){/* LangVal -> JSString */
	    x=forcer(x);
	    var temp="";
	    var prefix="";
	    switch(type_of(x)){
	    case null_t:return "()";
	    case cons_t:
		temp="(";
		prefix="";
		while(cons_p(x)){
		    temp+=prefix+print(cons_car(x));
		    prefix=" ";
		    x=forcer(cons_cdr(x));
		}
		if(null_p(x)){
		    temp+=")";
		}else{
		    temp+=" . "+print(x)+")";
		}
		return temp;
	    case data_t:
		return "#"+print(new_cons(data_name(x), data_list(x)));
	    case error_t:
		return "!"+print(new_cons(error_name(x), error_list(x)));
	    case symbol_t:return un_symbol(x);
	    case delay_eval_t:
		return "$("+print(env2val(delay_eval_env(x)))+" "+print(delay_eval_x(x))+")";
	    case delay_builtin_func_t:
		return "%("+print(delay_builtin_func_f(x))+" "+print(jslist2list(delay_builtin_func_xs(x)))+")";
	    case delay_builtin_form_t:
		return "@("+print(delay_builtin_form_f(x))+" "+print(env2val(delay_builtin_form_env(x)))+" "+print(jslist2list(delay_builtin_form_xs(x)))+")";
	    case delay_apply_t:
		WIP();
	    default:
	    }
	    ERROR();
	}
	return print;
    }
    var print=make_printer(un_just_all);
    var print_force_rec=make_printer(force_all);
    exports.print_force_rec=print_force_rec;
    exports.print=print;
    
    function read(x){/* JSString -> LangVal */
	var state=x.split("");/* State : List Char */
	function eof(){
	    return state.length === 0;
	}
	function get(){
	    return state.shift();
	}
	function put(x){
	    state.unshift(x);
	}
	function error(){
	    throw "TheLanguage parse ERROR!";
	}
	
	function a_space_p(x){
	    return x ===" " || x === "\n" || x === "\t" || x === "\r";
	}
	function space(){
	    var p=a_space_p;
	    if(eof()){return false;}
	    var x=get();
	    if(!p(x)){
		put(x);
		return false;
	    }
	    while(p(x) && !eof()){
		x=get();
	    }
	    if(!p(x)){put(x);}
	    return true;
	}
	function symbol(){
	    var p=a_symbol_p;
	    if(eof()){return false;}
	    var x=get();
	    var ret="";
	    if(!p(x)){
		put(x);
		return false;
	    }
	    while(p(x) && !eof()){
		ret+=x;
		x=get();
	    }
	    if(p(x)){
		ret+=x;
	    }else{put(x);}
	    return new_symbol(ret);
	}
	function list(){
	    if(eof()){return false;}
	    var x=get();
	    if(x !== "("){put(x);return false;}
	    var ret=null;
	    function set_last(lst){
		if(ret === null){ret=lst;return;}
		var x=ret;
		while(true){
		    if(!cons_p(x)){ERROR();}
		    var d=cons_cdr(x);
		    if(d === null){break;}
		    x=cons_cdr(x);
		}
		if(!cons_p(x)){ERROR();}
		if(x[2] !== null){ERROR();}
		x[2]=lst;/* 實現底層依賴[編號 0] parser <-> 內建數據結構 */
	    }
	    function last_add(x){
		set_last(new_cons(x, null));
	    }
	    while(true){
		space();
		if(eof()){error();}
		x=get();
		if(x === ")"){
		    set_last(null_v);
		    return ret;
		}
		if(x === "."){
		    space();
		    var e=val();
		    if(e === false){error();}
		    set_last(e);
		    space();
		    if(eof()){error();}
		    x=get();
		    if(x !== ")"){error();}
		    return ret;
		}
		put(x);
		var e=val();
		if(e === false){error();}
		last_add(e);
	    }
	}
	function data(){
	    if(eof()){return false;}
	    var x=get();
	    if(x !== "#"){put(x);return false;}
	    var xs=list();
	    if(xs === false){error();}
	    if(!cons_p(xs)){error();}
	    return new_data(cons_car(xs), cons_cdr(xs));
	}
	function readerror(){
	    if(eof()){return false;}
	    var x=get();
	    if(x !== "!"){put(x);return false;}
	    var xs=list();
	    if(xs === false){error();}
	    if(!cons_p(xs)){error();}
	    return new_error(cons_car(xs), cons_cdr(xs));
	}
	function make_read_two(prefix, k){
	    return function (){
		if(eof()){return false;}
		var x=get();
		if(x !== prefix){put(x);return false;}
		var xs=list();
		if(xs === false){error();}
		if(!cons_p(xs)){error();}
		x=cons_cdr(xs);
		if(!(cons_p(x) && null_p(cons_cdr(x)))){error();}
		return k(cons_car(xs), cons_car(x));
	    };
	}
	var readeval=make_read_two("$",function(e, x){
	    var env=val2env(e);
	    if(env === false){error();}
	    return lang_eval(env, x);
	});
	var readfuncapply=make_read_two("%", function(){
	    error();/*WIP*/
	    return builtin_func_apply(null(cons_car(x)));
	});
	function readformbuiltin(){
	    return false;/*WIP*/
	}
	function readapply(){
	    return false;/*WIP*/
	}
	
	function a_symbol_p(x){
	    if(a_space_p(x)){return false;}
	    var not_xs=["(",")","!","#",".","$","%"];
	    for(var i=0;i<not_xs.length;i++){
		if(x==not_xs[i]){return false;}
	    }
	    return true;
	}
	function val(){
	    space();
	    var fs=[list, symbol, data, readerror, readeval, readfuncapply, readformbuiltin, readapply];
	    for(var i=0;i<fs.length;i++){
		var x=fs[i]();
		if(x !== false){return x;}
	    }
	    error();
	    /* WIP: delay */
	}
	return val();
    }
    exports.print=print;
    exports.read=read;
    /* 相對獨立的部分。parser/printer }}} */
    
    return exports;
})();
