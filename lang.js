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
	throw "TheLanguage ERROR!";
    }
    function ASSERT(x){
	if(!x){
	    ERROR();
	}
    }
    var symbol_t=0;
    var cons_t=1;
    var null_t=2;
    var data_t=3;
    var error_t=4;
    var just_t=5;
    var delay_eval_t=6;
    var delay_builtin_func_t=7;
    var delay_builtin_form_t=8;

    function new_symbol(x){/* String -> LangVal */
	return [symbol_t,x];
    }
    function symbol_p(x){
	return x[0]===symbol_t;
    }
    function un_symbol(x){
	return x[1];
    }
    exports.new_symbol=new_symbol;
    exports.symbol_p=symbol_p;
    exports.un_symbol=un_symbol;

    function new_cons(a,d){/* LangVal, LangVal -> LangVal */
	return [cons_t, a, d];
    }
    function cons_p(x){
	return x[0]===cons_t;
    }
    function cons_car(x){
	return x[1];
    }
    function cons_cdr(x){
	return x[2];
    }
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

    function new_data(name, list){/* LangVal, LangVal -> LangVal */
	return [data_t, name, list];
    }
    function data_p(x){
	return x[0]===data_p;
    }
    function data_name(x){
	return x[1];
    }
    function data_list(x){
	return x[2];
    }
    exports.new_data=new_data;
    exports.data_p=data_p;
    exports.data_name=data_name;
    exports.data_list=data_list;

    function new_error(name, list){
	/* LangVal, LangVal -> LangVal */
	return [error_t, name, list];
    }
    function error_p(x){
	return x[0]===error_t;
    }
    function error_name(x){
	return x[1];
    }
    function error_list(x){
	return x[2];
    }
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
    }
    function just_p(x){
	return x[0]===just_t;
    }
    function un_just(x){
	return x[1];
    }
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
    function lang_eval(env, x){
	return [delay_eval_t, env, x];
    }
    function delay_eval_p(x){
	return x[0]===delay_eval_t;
    }
    function delay_eval_env(x){
	return x[1];
    }
    function delay_eval_x(x){
	return x[2];
    }
    function builtin_form_apply(env, f, xs){
	/* Env, Name, [NotEvaledLangVal] -> LangVal */
	return [delay_builtin_form_t, [env, f], xs];
    }
    function delay_builtin_form_p(x){
	return x[0]===delay_builtin_form_t;
    }
    function delay_builtin_form_env(x){
	return x[1][0];
    }
    function delay_builtin_form_f(x){
	return x[1][1];
    }
    function delay_builtin_form_xs(x){
	return x[2];
    }
    function builtin_func_apply(f, xs){
	/* Env, Name, [LangVal] -> LangVal */
	return [delay_builtin_func_t, f, xs];
    }
    function delay_builtin_func_p(x){
	return x[0]===delay_builtin_func_t;
    }
    function delay_builtin_func_f(x){
	return x[1];
    }
    function delay_builtin_func_xs(x){
	return x[2];
    }
    function any_delay_just_p(x){
	return just_p(x) || delay_eval_p(x) || delay_builtin_form_p(x) || delay_builtin_func_p(x);
    }
    exports.eval=lang_eval;
    exports.delay_p=any_delay_just_p;

    var env_null_v=[];
    function env_set(env, key, val){
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
    function env_get(env, key, default_v){
	for(var i=0;i<env.length;i=i+2){
	    if(jsbool_equal_p(env[i+0], key)){
		return env[i+1];
	    }
	}
	return default_v;
    }

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
	}else{
	    ret=x;
	}
	ret=un_just_all(ret);
	lang_set_do(x, ret);
	return ret;
    }
    exports.force=force_all;
    
    var sys_sym=new_symbol("太始初核");
    var name_sym=new_symbol("符名號標");
    var func_sym=new_symbol("化變滅演");
    var form_sym=new_symbol("式形法特");
    var equal_sym=new_symbol("等同皆一");
    var eval_sym=new_symbol("算釋解計");
    var the_sym=new_symbol("特一定其");
    var sth_sym=new_symbol("省略之其");
    var a_sym=new_symbol("一");
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
    
    var builtin_func_new_data_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, data_sym), the_sym)));
    var builtin_func_data_name_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(data_sym), sth_sym), name_sym)));
    var builtin_func_data_list_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(data_sym), sth_sym), list_sym)));
    var builtin_func_data_p_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, data_sym)))));
    
    var builtin_func_new_error_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, error_sym), the_sym)));
    var builtin_func_error_name_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(error_sym), sth_sym), name_sym)));
    var builtin_func_error_list_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(error_sym), sth_sym), list_sym)));
    var builtin_func_error_p_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, error_sym)))));
    
    var builtin_func_new_cons_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, cons_sym), the_sym)));
    var builtin_func_cons_p_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, cons_sym)))));
    var builtin_func_cons_head_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(cons_sym), sth_sym), head_sym)));
    var builtin_func_cons_tail_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_list(cons_sym), sth_sym), tail_sym)));

    var builtin_func_sym_p_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, sym_sym)))));

    var builtin_func_null_p_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, new_list(a_sym, null_sym)))));
    
    var builtin_func_equal_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, new_list(isornot_sym, equal_sym))));
    var builtin_form_quote_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, form_sym, quote_sym)));
    var builtin_func_apply_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_cons(func_sym, sth_sym), sth_sym), apply_sym)));
    var builtin_func_eval_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, func_sym, eval_sym)));
    
    var use_builtin_func_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, new_list(sys_sym, func_sym))));
    var use_builtin_form_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, new_list(sys_sym, form_sym))));
    var use_form_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, form_sym)));
    var false_v=new_data(false_sym, new_list());
    var true_v=new_data(true_sym, new_list());
    function real_eval(env, raw){
	var x=force1(raw);
	var error_v=WIP;
	if(any_delay_just_p(x)){
	    return lang_eval(env, x);
	}
	switch(x[0]){
	case cons_t:
	    var xs=[];
	    var rest=x;
	    /* WARNING delay未正確處理(影響較小) */
	    while(!null_p(rest)){
		if(any_delay_just_p(rest)){
		    return lang_eval(env, x);
		}else if(cons_p(rest)){
		    xs[xs.length]=cons_car(rest);
		    rest=force1(cons_cdr(rest));
		}else{
		    return error_t;
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
	    }else if(jsbool_equal_p(xs[0], use_builtin_func_sym)){
		if(xs.length===1){
		    return error_v;
		}
		var f=xs[1];
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=lang_eval(xs[i]);
		}
		return builtin_func_apply(f, args);
	    }else if(jsbool_equal_p(xs[0], use_form_sym)){
		if(xs.length===1){
		    return error_v;
		}
		var f=lang_eval(env, xs[1]);
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=lang_eval(env, xs[i]);
		}
		WIP
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
	    return env_get(env, x, WIP);
	case error_t:
	    return error_v;
	default:
	    ERROR();
	}
	ERROR();
    }
    function lang_apply(f, xs){
	/* LangVal, [LangVal] -> LangVal */
	return builtin_func_apply(builtin_func_apply_sym, new_list(f, jslist2list(xs)));
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
	    if(x[0] !== y[0]){
		return false_v;
	    }
	    WIP
	}],
	[builtin_func_apply_sym, 2, function(f, xs, error_v){
	    WIP
	}],
	[builtin_func_eval_sym, 2, function(env, x, error_v){
	    WIP
	}],

	make_builtin_p_func(builtin_func_sym_p_sym, symbol_p),
	];
    function real_builtin_func_apply(f, xs){
	/* Name, [LangVal] -> LangVal */
	var error_v=WIP;
	/* WARNING delay未正確處理(影響較小) */
	for(var i=0;i<real_builtin_func_apply_s.length;i++){
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
	/* Env, Name, [NotEvaled LangVal] -> LangVal */
	var error_v=WIP;
	/* WARNING delay未正確處理(影響較小) */
	if(jsbool_equal_p(f, builtin_form_quote_sym)){
	    if(xs.length!==1){
		return error_v;
	    }
	    return xs[0];
	}
	WIP
    }
    function jsbool_equal_p(x, y){
	/* LangVal, LangVal -> JSBoolean */
	var x=force_all(langbool_equal_p(x, y));
	ASSERT(data_p(x));
	var name=force_all(data_name(x));
	ASSERT(symbol_p(name));
	if(name===false_sym){
	    return false;
	}else if(name===true_sym){
	    return true;
	}
	ERROR();
    }
    function langbool_equal_p(x, y){/* LangVal, LangVal -> LangVal */
	return builtin_func_apply(builtin_func_equal_sym, [x, y]);
    }
    
    
    return exports;
})();
