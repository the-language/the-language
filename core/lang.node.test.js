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

const print_do = console.log

function ERROR() {
    null()
}

function ASSERT(x) {
    if (!x) {
        ERROR()
    }
}

const prelude = '\n' +
    'const L = require("' + process.cwd() + '/lang")\n' +
    'const print_do = console.log\n' +

    'function ERROR() {\n' +
    '    const ERR = undefined\n' +
    '    ERR()\n' +
    '}\n' +

    'function ASSERT(x) {\n' +
    '    if (!x) {\n' +
    '        ERROR()\n' +
    '    }\n' +
    '}\n' +

    'function ASSERT_WITH_EXP(text, x) {\n' +
    '    print_do("[TEST]" + text)\n' +
    '    ASSERT(x());\n' +
    '}\n'

function par_test_block(name, f) {
    const script = prelude + '\n' +
        //'print_do("----------[TEST/' + name + ']----------");\n'+
        '{\n(' + f.toString() + ')();\n}\n'
    const c_process = require('child_process')
    const fs = require('fs')
    c_process.exec('mktemp', function(error1, stdout, stderr) {
        ASSERT(!error1)
        const script_file = stdout.replace(/[\r\n]/g, "")
        fs.writeFile(script_file, script, function(error2) {
            ASSERT(!error2)
            var child = c_process.fork(script_file)
            child.on('close', function(code) {
                fs.unlink(script_file, function() {})
            })
        })
    })
}

function seq_test_block(name, f) {
    const script = prelude + '\n' +
        'print_do("----------[TEST/' + name + ']----------");\n' +
        '{\n(' + f.toString() + ')();\n}\n'
    eval(script)
}
const test_block = seq_test_block
test_block("read,print", function() {
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
        ASSERT_WITH_EXP("print(read(\"" + x + "\")) === \"" + x + "\"", () => L.print(L.read(x)) === x)
    }
})
test_block("eval", function() {
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
        ASSERT_WITH_EXP("print_force_rec(read(\"" + x[0] + "\")) === \"" + x[1] + "\"", () => L.print_force_rec(L.read(x[0])) === x[1])
    }
})
test_block('complex_parse', function() {
    const xs = [
        '()',
        '(() ())',
        '(世界 你好)',
        '!(ha . aa)',
        '#(ssdsds . #(asdsdwd . !(iwjxns)))',
        '^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))',
        '%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連)))) (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))))',
        '$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))',
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP('print(complex_parse("' + x + '")) === "' + x + '"', () => L.print(L.complex_parse(x)) === x)
    }
})
test_block('complex_parse,complex_print', function() {
    const xs = [
        ['構.符名', L.symbols.builtin.function.data_name],
        ['~;式形', L.symbols.use_form],
        ['解算:化滅', L.symbols.builtin.function.eval],
        ['~;(太始初核 式形)', L.symbols.use_builtin_form],
        ['[:構]?', L.symbols.builtin.function.data_p],
        ['等同?', L.symbols.builtin.function.equal_p],
        ['化滅@應用', L.symbols.builtin.function.apply],
        ['~;->化滅', L.symbols.builtin.form.lambda],
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP("print(complex_parse(\"" + x[0] + "\")) === \"" + L.print(x[1]) + "\"", () => L.print(L.complex_parse(x[0])) === L.print(x[1]))
        ASSERT_WITH_EXP("complex_print(read(\"" + L.print(x[1]) + "\")) === \"" + x[0] + "\"", () => L.complex_print(x[1]) === x[0])
    }
})

test_block('complex_parse,complex_print', function() {
    const xs = [
        '~;(太始初核 式形)',
        '[[:構]?]?',
        '[[[:[:構]]?]?]@hi',
        '^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))',
        '->構',
        '#(式形 #(化滅 (:映表 參形 :物) (~;(太始初核 化滅) ->構 (~;(太始初核 式形) 引用:式形 化滅) (~;(太始初核 化滅) ->連 參形 (~;(太始初核 化滅) ->連 (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 ~;(太始初核 化滅)) (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 解算:化滅) (~;(太始初核 化滅) ->連 (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 ~;(太始初核 式形)) (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 引用:式形) (~;(太始初核 化滅) ->連 :映表 ()))) (~;(太始初核 化滅) ->連 (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 ~;(太始初核 式形)) (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 引用:式形) (~;(太始初核 化滅) ->連 :物 ()))) ())))) ())))))',
        '(~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 ~;(太始初核 式形)) (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 引用:式形) (~;(太始初核 化滅) ->連 (~;(太始初核 式形) 引用:式形 AhHSa) ())))',
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP('complex_print(complex_parse("' + x + '"))  === "' + x + '"', () => L.complex_print(L.complex_parse(x)) === x)
    }
})
test_block('eval,complex_print,complex_parse', function() {
    const xs = [
        ["$(#(映表 ((ha ga))) ha)", "ga"],
        ['%([:連]? (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))))', '#(陰)'],
        ['%(若:化滅 (#(陰) A B))', 'B'],
        ['%(若:化滅 (#(陽) A B))', 'A'],
        ['%(若:化滅 (%([:連]? (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲)))))) A B))', 'B'],
        ['^($(#(映表 ()) (~;(太始初核 式形) ~;->化滅 () ())) ())', '()'],
        ['$(#(映表 ()) ((~;(太始初核 式形) ~;->化滅 (X) X) ()))', '()'],
        ['$(#(映表 ()) ((~;(太始初核 式形) ~;->化滅 (X) X) (~;(太始初核 式形) 引用:式形 Ha)))', 'Ha'],
        ['$(#(映表 ((X Ga))) ((~;(太始初核 式形) ~;->化滅 () X)))', 'Ga'],
    ]
    for (const x of xs) {
        ASSERT_WITH_EXP('complex_print(force_rec(complex_parse("' + x[0] + '")) === "' + x[1] + '"', () => L.complex_print(L.force_rec(L.complex_parse(x[0]))) === x[1])
    }
})