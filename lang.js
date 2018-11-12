/*
    The Language
    Copyright (C) 2018  Zaoqi

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
    var exports={};

    function ERROR(){
	throw "TheLanguage ERROR!";
    }
    function ASSERT(x){
	if(x){
	}else{
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
    
    function new_list(){
	var ret=null_v;
	for(var i=arguments.length-1;i>=0;i--){
	    ret=new_cons(arguments[i], ret);
	}
	return ret;
    }
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

    function new_error(name, list){/* LangVal, LangVal -> LangVal */
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
    function builtin_form_apply(env, f, xs){/* Env, Name, [NotEvaledLangVal] -> LangVal */
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
    function builtin_func_apply(f, xs){/* Env, Name, [LangVal] -> LangVal */
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
	var ret=x;
	if(just_p(x)){
	    ERROR();
	}else if(delay_eval_p(x)){
	    ret=real_eval(delay_eval_env(x), delay_eval_x(x));
	}else if(delay_builtin_form_p(x)){
	    ret=real_builtin_form_apply(delay_builtin_form_env(x), delay_builtin_form_f(x), delay_builtin_form_xs(x));
	}else if(delay_builtin_func_p(x)){
	    ret=real_builtin_func_apply(delay_builtin_func_f(x), delay_builtin_func_xs(x));
	}else{
	    ret=x;
	}
	ret=un_just_all(x);
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
    var is_sym=new_symbol("邪乎否与");
    var bool_sym=new_symbol("陰陽");
    var quote_sym=new_symbol("引用");
    var apply_sym=new_symbol("用調應使");
    var builtin_equal_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, bool_sym), equal_sym)));
    var builtin_quote_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, form_sym, quote_sym)));
    var builtin_apply=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, new_cons(func_sym, sth_sym), sth_sym), apply_sym)));
    var use_builtin_func_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, new_list(sys_sym, func_sym))));
    var use_builtin_form_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, new_list(sys_sym, form_sym))));
    var use_form_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, form_sym)));
    var false_v=new_data(new_symbol("陰"), new_list());
    var true_v=new_data(new_symbol("陽"), new_list());
    function real_eval(env, raw){
	var x=force1(raw);
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
		    WIP
		}
	    }
	    if(jsbool_equal_p(xs[0], use_builtin_form_sym)){/* WARNING delay未正確處理(影響較小) */
		if(xs.length===1){
		    WIP
		}
		var f=xs[1];
		var args=[];
		for(var i=2;i<xs.length;i++){
		    args[i-2]=xs[i];
		}
		return builtin_form_apply(env, f, args);
	    }else if(jsbool_equal_p(xs[0], use_builtin_func_sym)){/* WARNING delay未正確處理(影響較小) */
		WIP
	    }else if(jsbool_equal_p(xs[0], use_form_sym)){/* WARNING delay未正確處理(影響較小) */
		if(xs.length===1){
		    WIP
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
	    return WIP;
	default:
	    ERROR();
	}
	ERROR();
    }
    function lang_apply(f, xs){/* LangVal, [LangVal] -> LangVal */
	WIP
    }
    function real_builtin_func_apply(f, xs){
	/*if(jsbool_equal_p(f, builtin_equal_sym)){
	    if(xs.length!==2){
		return error_v;
	    }
	    var x=xs[0];
	    var y=xs[1];
	    if(x===y){
		return true_v;
	    }
	    x=force1(x);
	    y=force1(y);
	    if(any_delay_just_p(x) || any_delay_just_p(y)){
		return builtin_apply(f, [x, y]); // not fully implemented -- Halting
	    }
	    if(x===y){
		return true_v;
	    }
	    if(x[0] !== y[0]){
		return false_v;
	    }
	    
	    WIP
	    }*/
	WIP
    }
    function real_builtin_form_apply(env, f, xs){/* Env, Name, [NotEvaled LangVal] -> LangVal */
	var error_v=WIP;
	/* WARNING delay未正確處理(影響較小) */
	if(jsbool_equal_p(f, builtin_quote_sym)){
	    WIP
	}
	WIP
    }
    function jsbool_equal_p(x, y){/* LangVal, LangVal -> JSBoolean */
	var x=force_all(langbool_equal_p(x, y));
	ASSERT(data_p(x));
	var name=force_all(data_name(x));
	ASSERT(symbol_p(name));
	if(name==="陰"){
	    return false;
	}else if(name==="陽"){
	    return true;
	}
	ERROR();
    }
    function langbool_equal_p(x, y){/* LangVal, LangVal -> LangVal */
	return builtin_func_apply(builtin_equal_sym, [x, y]);
    }
    
    
    return exports;
})();
