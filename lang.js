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
	WIP();
    }
    function ASSERT(x){
	if(x){
	}else{
	    ERROR()
	}
    }
    var symbol_t=0;
    var cons_t=1;
    var null_t=2;
    var data_t=3;
    var error_t=4;
    var just_t=5;
    var delay_eval_t=6;

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
    function any_delay_just_p(x){
	return just_p(x) || delay_eval_p(x);
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
    function force1(x){/* LangVal -> LangVal */
	if(just_p(x)){
	    return un_just(x);
	}else if(delay_eval_p(x)){
	    var ret=real_eval(delay_eval_env(x), delay_eval_x(x));
	    lang_set_do(x, ret);
	    return ret;
	}else{
	    return x;
	}
    }
    exports.force=force_all;
    
    function real_eval(env, raw){
	var x=force_all(raw);
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
	return lang_eval(env_null_v, new_list(use_builtin_sym, builtin_equal_sym, new_list(use_builtin_sym, builtin_quote_sym, x), new_list(use_builtin_sym, builtin_quote_sym, y)));
    }
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
    var builtin_equal_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, new_list(func_sym, sth_sym, bool_sym), equal_sym)));
    var builtin_quote_sym=new_data(sys_sym, new_list(name_sym, new_list(a_sym, form_sym, quote_sym)));
    var use_builtin_sym=new_data(sys_sym, new_list(name_sym, new_list(form_sym, sys_sym)));

    
    
    return exports;
})();
