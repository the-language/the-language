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

    function assert_equal(x, y){
	//可以对delay优化?
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
    exports.eval=lang_eval;
    exports.delay_p=(function(x){
	return just_p(x)||delay_eval_p(x);
    });

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
    
    function jsbool_equal_p(x, y){/* LangVal, LangVal -> JSBoolean */
	WIP
    }
    function langbool_equal_p(x, y){/* LangVal, LangVal -> LangVal */
	eval(WIP, WIP);
    }
    
    

    
    
    return exports;
})();
