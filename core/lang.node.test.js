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
'use strict';
const L = require("./lang")

const print_do = console.log

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
}
print_do("------[TEST/read,print]-------"); {
    const xs = [
        "(你好 世界！)",
        "!(#(a b) . c)",
        "((a) . #(bb cd54rf 66))",
        "(k 0 9 8 . o)",
        "(() ((((())))) . *)",
        "$(#(映表 ((ha ga))) ha)",
        '^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))',
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP("print(read(\"" + x + "\")) === \"" + x + "\"", L.print(L.read(x)) === x)
    }
}
print_do("------[TEST/eval]-------"); {
    const xs = [
        ["$(#(映表 ((ha ga))) ha)", "ga"],
        ["$(#(映表 ((#(#(a b) . c) ga))) #(#(a b) . c))", "ga"],
        ["$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) HA))", "HA"],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 連) 特定其物)) () ()))', '(())'],
        ['%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (()))', '#(陰)'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) ()))', '#(陰)'],
        ['%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (%(#(符名 太始初核 (一類何物 (化滅 省略一物 連) 特定其物)) (() ()))))', '#(陽)'],
        ['$(#(映表 ((Haa PP) (Ba GAAP))) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 誤) 特定其物)) Ba Haa))', '!(GAAP . PP)'],
        ['$(#(映表 ()) Not)', '!(太始初核 #(符名 太始初核 (式形 (太始初核 化滅))) (#(符名 太始初核 (一類何物 化滅 解算)) (#(映表 ()) Not)))'],
        ['^(#(化滅 (X) X) (()))', '()'],
        ['^(#(化滅 X X) (A B))', '(A B)'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 (連) 省略一物) 首)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) (8 113 9P))))', '8'],
        ['^(#(化滅 (X . Y) Y) (A B C D 87687))', '(B C D 87687)'],
        ['%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))))', '#(陰)'],
        ['^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))', '!(太始初核 宇宙亡矣 省略一物)'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E . X) X)))))', '()'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E . Y) Y))) A B))', '(A B)'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E) E)))))', '#(映表 ())'],
        ['$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))', '()'],
    ]
    for (const x of xs) {
        const r = L.print_force_rec(L.read(x[0]))
        ASSERT_WITH_EXP("print_force_rec(read(\"" + x[0] + "\")) === \"" + x[1] + "\"", r === x[1])
    }
}
print_do("------[TEST/complex_print]-------"); {
    let xs = [
        [L.symbols.builtin.function.data_name, '構.符名']
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP("complex_print(read(\"" + L.print(x[0]) + "\")) === \"" + x[1] + "\"", L.complex_print(x[0]) === x[1])
    }
}