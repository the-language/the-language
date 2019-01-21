/*
    The Language 臨時可用亂七八糟的測試系統
    Copyright (C) 2019  Zaoqi <zaomir@outlook.com>

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
var TL=require("./lang");
function ERROR(){
    null();
}
function ASSERT(x){
    if(!x){ERROR();}
}
function ASSERT_WITH_EXP(text, x){
    console.log("[TEST]"+text);
    ASSERT(x);
}
{
    var xs=["(你好 世界！)",
	    "!(#(a b) . c)",
	    "((a) . #(bb cd54rf 66))"];
    for(var i in xs){
	var x=xs[i];
	ASSERT_WITH_EXP("print_force(read(\""+x+"\")) === \""+x+"\"", TL.print_force(TL.read(x)) === x);
    }
}
