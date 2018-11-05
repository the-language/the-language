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
    
    return exports;
})();
