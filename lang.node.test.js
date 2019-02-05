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
let TL = require("./lang")

let print_do = console.log

function ERROR() {
    null()
}

function ASSERT(x) {
    if (!x) {
        ERROR()
    }
}

function ASSERT_WITH_EXP(text, x) {
    print_do("[TEST]" + text)
    ASSERT(x);
} {
    let xs = [
        "(你好 世界！)",
        "!(#(a b) . c)",
        "((a) . #(bb cd54rf 66))",
        "(k 0 9 8 . o)",
        "(() ((((())))) . *)",
        "$(#(映表 ((ha ga))) ha)",
        '^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))',
    ]
    for (let i in xs) {
        let x = xs[i]
        ASSERT_WITH_EXP("print(read(\"" + x + "\")) === \"" + x + "\"", TL.print(TL.read(x)) === x)
    }
}
print_do("------[TEST/eval]-------")

{
    let xs = [
        ["$(#(映表 ((ha ga))) ha)", "ga"],
        ["$(#(映表 ((#(#(a b) . c) ga))) #(#(a b) . c))", "ga"],
        ["$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) HA))", "HA"],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 連) 特定其物)) () ()))', '(())'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) ()))', '#(陰)'],
        ['$(#(映表 ((Haa PP) (Ba GAAP))) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 誤) 特定其物)) Ba Haa))', '!(GAAP . PP)'],
        ['$(#(映表 ()) Not)', '!(太始初核 #(符名 太始初核 (式形 (太始初核 化滅))) (#(符名 太始初核 (一類何物 化滅 解算)) (#(映表 ()) Not)))'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 誤) 特定其物)) () ())))', '!(太始初核 #(符名 太始初核 (式形 (太始初核 化滅))) (#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (!(()))))'],
        ['^(#(化滅 (X) X) (()))', '()'],
        ['^(#(化滅 X X) (A B))', '(A B)'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 (連) 省略一物) 首)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) (8 113 9P))))', '8'],
        ['^(#(化滅 (X . Y) Y) (A B C D 87687))', '(B C D 87687)'],
        ['^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))', '!(太始初核 宇宙亡矣 省略一物)'],
        //['$(#(映表 ()) (#(符名 太始初核 (式形 式形)) #(式形 #(化滅 (E . Y) Y)) A B))', '(A B)'],
        //['$(#(映表 ()) (#(符名 太始初核 (式形 式形)) #(式形 #(化滅 (E) E))))', '#(映表 ())'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))', '()'],
    ]
    for (let i in xs) {
        let x = xs[i]
        let r = TL.print_force_rec(TL.read(x[0]))
        ASSERT_WITH_EXP("print_force_rec(read(\"" + x[0] + "\")) === \"" + x[1] + "\"", r === x[1])
    }
}