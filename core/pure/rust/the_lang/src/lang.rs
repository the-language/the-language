/*
    lua2rust - Prelude
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
#![allow(dead_code)]
#![allow(unused_macros)]
#![allow(unused_mut)]
#![allow(unused_variables)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(unreachable_code)]
#![allow(unused_parens)]

#[derive(Debug, Copy, Clone, PartialEq, Eq)]
pub struct _lua_debug_loc {
    // line + column
    pub start: (usize, usize),
    pub end: (usize, usize),
}
impl std::fmt::Display for _lua_debug_loc {
    #[inline]
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "( start: ( line: {}, column: {} ), end: ( line: {}, column: {} ) )", self.start.0, self.start.1, self.end.0, self.end.1)
    }
}
pub type _lua_data = std::sync::Arc<_lua_data_unpack>;
#[inline]
pub fn _lua_data__pack(data: _lua_data_unpack) -> _lua_data {
    std::sync::Arc::new(data)
}
pub struct _lua_data_unpack_function (Box<Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data>);
impl std::hash::Hash for _lua_data_unpack_function {
    #[inline]
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        let sel: *const (Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data) = &*self.0;
        sel.hash(state);
    }
}
impl PartialEq for _lua_data_unpack_function {
    #[inline]
    fn eq(&self, other: &Self) -> bool {
        let sel: *const (Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data) = &*self.0;
        let other: *const (Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data) = &*other.0;
        sel == other
    }
}
impl Eq for _lua_data_unpack_function {}
impl std::fmt::Debug for _lua_data_unpack_function {
    #[inline]
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let sel: *const (Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data) = &*self.0;
        write!(f, "_lua_data_unpack_function({:p})", sel)
    }
}
#[derive(Debug)]
pub enum _lua_data_unpack_table {
    Map(std::collections::HashMap<_lua_data,_lua_data>),
    Vec(Vec<_lua_data>),
}
impl _lua_data_unpack_table {
    #[inline]
    pub fn pairs(&self) -> std::collections::hash_map::IntoIter<_lua_data,_lua_data> {
        match self {
            _lua_data_unpack_table::Map(v) => v.clone().into_iter(),
            _lua_data_unpack_table::Vec(v) => _lua_vec2table(v).into_iter(),
        }
    }
    #[inline]
    pub fn ipairs(&self) -> std::iter::Enumerate<std::slice::Iter<_lua_data>> {
        match self {
            _lua_data_unpack_table::Map(v) => panic!("WIP"),
            _lua_data_unpack_table::Vec(v) => v.iter().enumerate(),
        }
    }
}
impl std::hash::Hash for _lua_data_unpack_table {
    #[inline]
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        match self {
            _lua_data_unpack_table::Map(x) => {
                let sel: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*x;
                sel.hash(state);
            },
            _lua_data_unpack_table::Vec(x) => {
                let sel: *const Vec<_lua_data> = &*x;
                sel.hash(state);
            },
        }
    }
}
impl PartialEq for _lua_data_unpack_table {
    fn eq(&self, other: &Self) -> bool {
        if let (_lua_data_unpack_table::Map(x), _lua_data_unpack_table::Map(y)) = (self, other) {
            let x: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*x;
            let y: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*y;
            x == y
        } else if let (_lua_data_unpack_table::Vec(x), _lua_data_unpack_table::Vec(y)) = (self, other) {
            let x: *const Vec<_lua_data> = &*x;
            let y: *const Vec<_lua_data> = &*y;
            x == y
        } else {
            false
        }
    }
}
impl Eq for _lua_data_unpack_table {}
#[derive(Debug)]
pub struct _lua_data_unpack_number (f64);
impl std::hash::Hash for _lua_data_unpack_number {
    #[inline]
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.0.to_bits().hash(state);
    }
}
impl PartialEq for _lua_data_unpack_number {
    #[inline]
    fn eq(&self, other: &Self) -> bool {
        self.0 == other.0 // 此处可能和Lua实现不同。
    }
}
impl Eq for _lua_data_unpack_number {}
#[derive(Debug)]
pub struct _lua_data_unpack_table_pack (std::sync::RwLock<_lua_data_unpack_table>);
impl std::hash::Hash for _lua_data_unpack_table_pack {
    #[inline]
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.0.read().unwrap().hash(state)
    }
}
impl PartialEq for _lua_data_unpack_table_pack {
    #[inline]
    fn eq(&self, other: &Self) -> bool {
        *self.0.read().unwrap() == *other.0.read().unwrap()
    }
}
impl Eq for _lua_data_unpack_table_pack {}
#[derive(Hash,PartialEq,Eq,Debug)]
pub enum _lua_data_unpack {
    Number(_lua_data_unpack_number),
    String(Vec<char>),
    Table(_lua_data_unpack_table_pack),
    Function(_lua_data_unpack_function),
    True,
    False,
    Nil,
}
impl std::fmt::Display for _lua_data_unpack {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            _lua_data_unpack::Number(_lua_data_unpack_number(x)) => write!(f, "{}", x),
            _lua_data_unpack::String(x) => write!(f, "{}", x.iter().collect::<String>()),
            _lua_data_unpack::Table(x) => {
                match &*x.0.read().unwrap() {
                    _lua_data_unpack_table::Map(v) => {
                        let p: *const (std::collections::HashMap<_lua_data,_lua_data>) = v;
                        write!(f, "table: {:p}", p)
                    },
                    _lua_data_unpack_table::Vec(v) => {
                        let p: *const Vec<_lua_data> = v;
                        write!(f, "table: {:p}", p)
                    },
                }},
            _lua_data_unpack::Function(x) => {
                let p: *const (Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data) = &*x.0;
                write!(f, "function: {:p}", p)},
            _lua_data_unpack::True => write!(f, "true"),
            _lua_data_unpack::False => write!(f, "false"),
            _lua_data_unpack::Nil => write!(f, "nil"),
        }
    }
}
impl _lua_data_unpack {
    #[inline]
    pub fn as_bool(&self, loc: _lua_debug_loc) -> bool {
        match self {
            _lua_data_unpack::False | _lua_data_unpack::Nil => false,
            _ => true,
        }
    }
    #[inline]
    pub fn as_f64(&self, loc: _lua_debug_loc) -> f64 {
        if let _lua_data_unpack::Number(x) = self {
            x.0
        } else {
            panic!("isn't number: {:?}\nat {}", self, loc)
        }
    }
    #[inline]
    pub fn lua_tonumber(&self) -> _lua_data {
        if let _lua_data_unpack::String(x) = self {
            if let Ok(r) = x.iter().collect::<String>().parse::<f64>() {
                _lua_num(r)
            } else {
                _lua_nil()
            }
        } else if let _lua_data_unpack::Number(x) = self {
            _lua_data__pack(_lua_data_unpack::Number(_lua_data_unpack_number(x.0)))
        } else {
            _lua_nil()
        }
    }
    #[inline]
    pub fn as_string(&self, loc: _lua_debug_loc) -> String {
        if let _lua_data_unpack::String(x) = self {
            x.iter().collect()
        } else {
            panic!("isn't string: {:?}\nat {}", self, loc)
        }
    }
    #[inline]
    pub fn as_vecchar(&self, loc: _lua_debug_loc) -> &Vec<char> {
        if let _lua_data_unpack::String(x) = self {
            x
        } else {
            panic!("isn't string: {:?}\nat {}", self, loc)
        }
    }
    #[inline]
    pub fn from_bool(x: bool) -> Self {
        if x { _lua_data_unpack::True } else { _lua_data_unpack::False }
    }
    #[inline]
    pub fn as_table(&self, loc: _lua_debug_loc) -> &std::sync::RwLock<_lua_data_unpack_table> {
        if let _lua_data_unpack::Table(x) = self {
            &x.0
        } else {
            panic!("isn't table: {:?}\nat {}", self, loc)
        }
    }
}
#[inline]
pub fn _lua_str<'a>(x: &'a str) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::String(x.chars().collect()))
}
#[macro_export]
macro_rules! _lua_num {
    ($x:expr) => (_lua_num($x as f64))
}
#[inline]
pub fn _lua_num(x: f64) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Number(_lua_data_unpack_number(x)))
}
#[inline]
pub fn _lua_table(xs: Vec<(_lua_data, _lua_data)>) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Table(_lua_data_unpack_table_pack(std::sync::RwLock::new(_lua_data_unpack_table::Map(xs.iter().cloned().collect())))))
}
#[inline]
pub fn _lua_len(xs: _lua_data, loc: _lua_debug_loc) -> _lua_data {
    if let _lua_data_unpack::Table(t) = &*xs {
        match &*t.0.read().unwrap() {
            _lua_data_unpack_table::Map(v) => _lua_num!(v.len()), // FIX ME 此处与Lua不同
            _lua_data_unpack_table::Vec(v) => _lua_num!(v.len()),
        }
    } else if let _lua_data_unpack::String(x) = &*xs {
        _lua_num!(x.len())
    } else {
        panic!("attempt to get length of a value that isn't a table: {:?}\nat: {}", xs, loc)
    }
}
pub fn _lua_lookup(map: _lua_data, key: _lua_data, loc: _lua_debug_loc) -> _lua_data {
    if let _lua_data_unpack::Table(t) = &*map {
        match &*t.0.read().unwrap() {
            _lua_data_unpack_table::Map(v) => {
                if let Some(x) = v.get(&key) {
                    x.clone()
                } else {
                    _lua_data__pack(_lua_data_unpack::Nil)
                }},
            _lua_data_unpack_table::Vec(xs) => {
                if let _lua_data_unpack::Number(_lua_data_unpack_number(key)) = *key {
                    let k = (key-1.0) as usize;
                    if k as f64 == (key-1.0) && k < xs.len() {
                        xs[k].clone()
                    } else {
                        _lua_data__pack(_lua_data_unpack::Nil)
                    }
                } else {
                    _lua_data__pack(_lua_data_unpack::Nil)
                }
            },
        }
    } else {
        panic!("attempt to index a value that isn't a table: {:?}\nat: {}", map, loc)
    }
}
pub fn _lua_set(map: _lua_data, key: _lua_data, val: _lua_data, loc: _lua_debug_loc) {
    if let _lua_data_unpack::Table(t) = &*map {
        let t: &mut _lua_data_unpack_table = &mut t.0.write().unwrap();
        match t {
            _lua_data_unpack_table::Map(v) => {v.insert(key, val);},
            _lua_data_unpack_table::Vec(xs) => match *key {
                _lua_data_unpack::Number(_lua_data_unpack_number(k))
                    if ((k-1.0) as usize) as f64 == (k-1.0) && ((k-1.0) as usize) <= xs.len() => {
                        let key = (k-1.0) as usize;
                        if (key == xs.len()) {
                            xs.push(val)
                        } else {
                            xs[key] = val
                        }
                    },
                _ => {
                    let mut v = _lua_vec2table(&xs);
                    v.insert(key, val);
                    *t = _lua_data_unpack_table::Map(v);
                }
            },
        }
    } else {
        panic!("attempt to index a value that isn't a table: {:?}\nat: {}", map, loc);
    }
}
#[inline]
pub fn _lua_vec(xs: Vec<_lua_data>) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Table(_lua_data_unpack_table_pack(std::sync::RwLock::new(_lua_data_unpack_table::Vec(xs)))))
}
#[inline]
pub fn _lua_vec2table(xs: &Vec<_lua_data>) -> std::collections::HashMap<_lua_data, _lua_data> {
    let mut result = std::collections::HashMap::new();
    for i in 1..=xs.len() {
        result.insert(_lua_num(i as f64), xs[i-1].clone());
    }
    result
}
#[inline]
pub fn _lua_lambda(f: Box<Fn(Vec<_lua_data>, _lua_debug_loc) -> _lua_data>) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Function(_lua_data_unpack_function(f)))
}
#[inline]
pub fn _lua_call(f: _lua_data, args: Vec<_lua_data>, loc: _lua_debug_loc) -> _lua_data {
    if let _lua_data_unpack::Function(v) = &*f {
        v.0(args, loc)
    } else {
        panic!("attempt to call a value that isn't a function: {:?}\nat: {}", f, loc)
    }
}
#[inline]
pub fn _lua_not(x: _lua_data, loc: _lua_debug_loc) -> _lua_data {
    _lua_bool(!x.as_bool(loc))
}
#[inline]
pub fn _lua_bool(x: bool) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::from_bool(x))
}
#[macro_export]
macro_rules! _lua_op {
    (or, $x: expr, $y: expr, $loc: expr) => (if $x.as_bool($loc) { $x } else { $y });
    (and, $x: expr, $y: expr, $loc: expr) => (if !$x.as_bool($loc) { $x } else { $y });
    (add, $x: expr, $y: expr, $loc: expr) => (_lua_num($x.as_f64($loc) + $y.as_f64($loc)));
    (sub, $x: expr, $y: expr, $loc: expr) => (_lua_num($x.as_f64($loc) - $y.as_f64($loc)));
    (mul, $x: expr, $y: expr, $loc: expr) => (_lua_num($x.as_f64($loc) * $y.as_f64($loc)));
    (div, $x: expr, $y: expr, $loc: expr) => (_lua_num($x.as_f64($loc) / $y.as_f64($loc)));
    (rem, $x: expr, $y: expr, $loc: expr) => (panic!("not implemented: rem\nat: {}", $loc));
    (exp, $x: expr, $y: expr, $loc: expr) => (panic!("not implemented: exp\nat: {}", $loc));
    (eq, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x == $y));
    (not_eq, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x != $y));
    (less_eq, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x.as_f64($loc) <= $y.as_f64($loc)));
    (greater_eq, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x.as_f64($loc) >= $y.as_f64($loc)));
    (less, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x.as_f64($loc) < $y.as_f64($loc)));
    (greater, $x: expr, $y: expr, $loc: expr) => (_lua_bool($x.as_f64($loc) > $y.as_f64($loc)));
    // https://stackoverflow.com/questions/40792801/best-way-to-concatenate-vectors-in-rust
    (concat, $x: expr, $y: expr, $loc: expr) => (_lua_data__pack(_lua_data_unpack::String($x.as_vecchar($loc).iter().cloned().chain($y.as_vecchar($loc).iter().cloned()).collect())));
}
#[inline]
pub fn _lua_nil() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Nil)
}
#[inline]
pub fn _lua_true() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::True)
}
#[inline]
pub fn _lua_false() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::False)
}
#[inline]
pub fn _lua_neg(x: _lua_data, loc: _lua_debug_loc) -> _lua_data {
    _lua_num(-x.as_f64(loc))
}
pub fn lang() -> _lua_data {
    // https://www.lua.org/manual/5.3/manual.html#pdf-print
    let print = std::sync::Arc::new(std::sync::RwLock::new(_lua_lambda(Box::new(|xs, _| {
        println!("{}", xs.iter().fold(String::from(""), |acc, x| if acc == "" { format!("{}", x) } else { acc + "\t" + &format!("{}", x) }));
        _lua_nil()
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-tostring
    let tostring = std::sync::Arc::new(std::sync::RwLock::new(_lua_lambda(Box::new(|mut xs, _| {
        let x = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        _lua_str(&format!("{}", x))
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-tonumber
    // base未实现
    let tonumber = std::sync::Arc::new(std::sync::RwLock::new(_lua_lambda(Box::new(|mut xs, loc| {
        let arg: _lua_data = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        arg.lua_tonumber()
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-error
    // level未实现
    let error = std::sync::Arc::new(std::sync::RwLock::new(_lua_lambda(Box::new(|mut xs, loc| {
        let message: _lua_data = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        panic!("{}\nat: {}", message.as_string(loc), loc)
    }))));
    let table = std::sync::Arc::new(std::sync::RwLock::new(_lua_table(vec![
        // https://www.lua.org/manual/5.3/manual.html#pdf-table.insert
        (_lua_str("insert"), _lua_lambda(Box::new(|mut xs, loc| {
            if xs.len() <= 2 {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let value = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                if let _lua_data_unpack_table::Vec(v) = &mut *list.as_table(loc).write().unwrap() {
                    v.push(value);
                } else {
                    panic!("WIP");
                };
            } else {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let pos = ((if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64(loc) - 1.0) as usize;
                let value = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                if let _lua_data_unpack_table::Vec(v) = &mut *list.as_table(loc).write().unwrap() {
                    v.insert(pos, value);
                } else {
                    panic!("WIP");
                };
            }
            _lua_nil()
        }))),
        // https://www.lua.org/manual/5.3/manual.html#pdf-table.remove
        (_lua_str("remove"), _lua_lambda(Box::new(|mut xs, loc| {
            let mut result;
            if xs.len() <= 1 {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                if let _lua_data_unpack_table::Vec(v) = &mut *list.as_table(loc).write().unwrap() {
                    result = v.pop().unwrap();
                } else {
                    panic!("WIP");
                };
            } else {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let pos = ((if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64(loc) - 1.0) as usize;
                if let _lua_data_unpack_table::Vec(v) = &mut *list.as_table(loc).write().unwrap() {
                    result = v.remove(pos);
                } else {
                    panic!("WIP");
                };
            }
            result
        }))),
    ])));
    let string = std::sync::Arc::new(std::sync::RwLock::new(_lua_table(vec![
        // https://www.lua.org/manual/5.3/manual.html#pdf-string.sub
        // 只支持正整数
        (_lua_str("sub"), _lua_lambda(Box::new(|mut xs, loc| {
            let s = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) });
            let i = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64(loc) as usize;
            let j = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64(loc) as usize;
            _lua_data__pack(_lua_data_unpack::String(s.as_vecchar(loc)[i-1..j].to_vec()))
        }))),
    ])));
let __TS__ArrayPush = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*__TS__ArrayPush.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let arr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let items = std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_vararg.clone()));
for (_lua_tmp_k, _lua_tmp_v) in (items.read().unwrap().clone()).as_table(_lua_debug_loc { start: (23, 29), end: (23, 34) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let item=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
_lua_set((arr.read().unwrap().clone()),_lua_op!{add, _lua_len((arr.read().unwrap().clone()), _lua_debug_loc { start: (24, 12), end: (24, 16) }), _lua_num!(1), _lua_debug_loc { start: (24, 12), end: (24, 20) }},(item.read().unwrap().clone()), _lua_debug_loc { start: (24, 8), end: (24, 28) });
}
return _lua_len((arr.read().unwrap().clone()), _lua_debug_loc { start: (26, 11), end: (26, 15) });

_lua_nil()
}})); _lua_tmp.clone() };
let __TS__ArrayUnshift = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*__TS__ArrayUnshift.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let table = table.clone();
move |mut _lua_arg_tmp, _| {
let arr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let items = std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_vararg.clone()));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((items.read().unwrap().clone()), _lua_debug_loc { start: (32, 18), end: (32, 24) }), _lua_num!(1), _lua_debug_loc { start: (32, 18), end: (32, 28) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (33, 14), end: (33, 20) }}).as_bool(_lua_debug_loc { start: (33, 8), end: (36, 11) }) {
_lua_call(_lua_lookup((table.read().unwrap().clone()),_lua_str("insert"), _lua_debug_loc { start: (34, 12), end: (34, 46) }), vec![(arr.read().unwrap().clone()), _lua_num!(1), _lua_lookup((items.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (34, 39), end: (34, 44) }}, _lua_debug_loc { start: (34, 33), end: (34, 44) })], _lua_debug_loc { start: (34, 12), end: (34, 46) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (35, 16), end: (35, 21) }}; _lua_tmp.clone() };
}
}
return _lua_len((arr.read().unwrap().clone()), _lua_debug_loc { start: (38, 11), end: (38, 15) });

_lua_nil()
}})); _lua_tmp.clone() };
let LANG_ERROR = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let LANG_ASSERT = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let recordstring_null_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let recordstring_shadow_copy = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let trampoline_return = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let trampoline_delay = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let atom_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let null_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let just_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_evaluate_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_func_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_form_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_apply_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let comment_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let hole_t = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_comment = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let comment_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let comment_comment = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let comment_x = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let un_comment_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let atom_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let un_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let atom_equal_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_construction = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_head = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_tail = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let null_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let null_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_data = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_name = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_list = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let just_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let un_just = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let evaluate = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_evaluate_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_evaluate_env = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_evaluate_x = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let builtin_form_apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_form_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_form_env = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_form_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_form_xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let builtin_func_apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_func_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_func_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_builtin_func_xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_apply_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_apply_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_apply_xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let force_all_rec = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let unlazy_all_rec = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_hole_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let hole_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let lang_assert_equal_set_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let hole_set_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let lang_copy_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let system_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let name_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let function_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let form_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let mapping_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let error_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let the_world_stopped_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_name_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_list_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data_p_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_p_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_head_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let construction_tail_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let atom_p_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let null_p_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let equal_p_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let apply_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let evaluate_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let if_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let quote_form_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let lambda_form_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let function_builtin_use_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let form_builtin_use_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let form_use_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let comment_form_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_error = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let jsArray_to_list = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_list = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let un_just_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let delay_just_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let lazy_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let force_all_inner = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let force1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let force_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let force_uncomment_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let unlazy1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let unlazy_list_1_keepcomment = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let name_unlazy1_p3 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let make_enviroment_null_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_null_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_helper_print0 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_helper_print_step = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_helper_node_expand = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_helper_tree_shadow_copy = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let enviroment_set_helper = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let env_null_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let env_set = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let env_get = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let must_env_get = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let env2val = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let env_foreach = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let real_evaluate = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let real_builtin_func_apply_s = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let real_apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let real_builtin_func_apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let real_builtin_form_apply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let make_quote = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let new_lambda = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let jsbool_equal_p_inner = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let equal_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let simple_print = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*LANG_ERROR.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
move |mut _lua_arg_tmp, _| {
_lua_call((error.read().unwrap().clone()), vec![_lua_str("TheLanguage PANIC")], _lua_debug_loc { start: (43, 4), end: (43, 30) });

_lua_nil()
}})); _lua_tmp.clone() };
*LANG_ASSERT.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not((x.read().unwrap().clone()), _lua_debug_loc { start: (46, 7), end: (46, 12) })).as_bool(_lua_debug_loc { start: (46, 7), end: (46, 12) }) {
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (47, 15), end: (47, 27) });
}

_lua_nil()
}})); _lua_tmp.clone() };
*recordstring_null_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
for (_lua_tmp_k, _) in (x.read().unwrap().clone()).as_table(_lua_debug_loc { start: (51, 19), end: (51, 20) }).read().unwrap().pairs() {
let k=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_k.clone()));
return _lua_false();
}
return _lua_true();

_lua_nil()
}})); _lua_tmp.clone() };
*recordstring_shadow_copy.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let result = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
for (_lua_tmp_k, _) in (x.read().unwrap().clone()).as_table(_lua_debug_loc { start: (58, 19), end: (58, 20) }).read().unwrap().pairs() {
let k=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_k.clone()));
_lua_set((result.read().unwrap().clone()),(k.read().unwrap().clone()),_lua_lookup((x.read().unwrap().clone()),(k.read().unwrap().clone()), _lua_debug_loc { start: (59, 20), end: (59, 23) }), _lua_debug_loc { start: (59, 8), end: (59, 24) });
}
return (result.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*trampoline_return.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let x = x.clone();
move |mut _lua_arg_tmp, _| {
return _lua_vec(vec![_lua_false(), (x.read().unwrap().clone())]);

_lua_nil()
}}));

_lua_nil()
}})); _lua_tmp.clone() };
*trampoline_delay.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let x = x.clone();
move |mut _lua_arg_tmp, _| {
return _lua_vec(vec![_lua_true(), _lua_call((x.read().unwrap().clone()), vec![], _lua_debug_loc { start: (69, 8), end: (69, 11) })]);

_lua_nil()
}}));

_lua_nil()
}})); _lua_tmp.clone() };
*new_comment.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let comment_t = comment_t.clone();
move |mut _lua_arg_tmp, _| {
let comment = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(comment_t.read().unwrap().clone()), (comment.read().unwrap().clone()), (x.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*comment_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let comment_t = comment_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (76, 11), end: (76, 14) }), (comment_t.read().unwrap().clone()), _lua_debug_loc { start: (76, 11), end: (76, 28) }};

_lua_nil()
}})); _lua_tmp.clone() };
*comment_comment.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (79, 11), end: (79, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*comment_x.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (82, 11), end: (82, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*un_comment_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (85, 10), end: (85, 22) })).as_bool(_lua_debug_loc { start: (85, 4), end: (87, 7) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((comment_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (86, 12), end: (86, 24) }); _lua_tmp.clone() };
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*atom_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let atom_t = atom_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (91, 11), end: (91, 14) }), (atom_t.read().unwrap().clone()), _lua_debug_loc { start: (91, 11), end: (91, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*un_atom.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (94, 11), end: (94, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*atom_equal_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_atom = un_atom.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (97, 7), end: (97, 13) }}).as_bool(_lua_debug_loc { start: (97, 7), end: (97, 13) }) {
return _lua_true();
}
if (_lua_op!{eq, _lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (100, 7), end: (100, 17) }), _lua_call((un_atom.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (100, 21), end: (100, 31) }), _lua_debug_loc { start: (100, 7), end: (100, 31) }}).as_bool(_lua_debug_loc { start: (100, 7), end: (100, 31) }) {
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (101, 8), end: (101, 38) });
return _lua_true();
} else {
return _lua_false();
}

_lua_nil()
}})); _lua_tmp.clone() };
*new_construction.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let construction_t = construction_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(construction_t.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*construction_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let construction_t = construction_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (111, 11), end: (111, 14) }), (construction_t.read().unwrap().clone()), _lua_debug_loc { start: (111, 11), end: (111, 33) }};

_lua_nil()
}})); _lua_tmp.clone() };
*construction_head.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (114, 11), end: (114, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*construction_tail.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (117, 11), end: (117, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*null_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let null_t = null_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (120, 11), end: (120, 14) }), (null_t.read().unwrap().clone()), _lua_debug_loc { start: (120, 11), end: (120, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*new_data.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let data_t = data_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(data_t.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*data_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let data_t = data_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (126, 11), end: (126, 14) }), (data_t.read().unwrap().clone()), _lua_debug_loc { start: (126, 11), end: (126, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*data_name.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (129, 11), end: (129, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*data_list.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (132, 11), end: (132, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*just_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let just_t = just_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (135, 11), end: (135, 14) }), (just_t.read().unwrap().clone()), _lua_debug_loc { start: (135, 11), end: (135, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*un_just.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (138, 11), end: (138, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*evaluate.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_t = delay_evaluate_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(delay_evaluate_t.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*delay_evaluate_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_t = delay_evaluate_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (144, 11), end: (144, 14) }), (delay_evaluate_t.read().unwrap().clone()), _lua_debug_loc { start: (144, 11), end: (144, 35) }};

_lua_nil()
}})); _lua_tmp.clone() };
*delay_evaluate_env.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (147, 11), end: (147, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*delay_evaluate_x.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (150, 11), end: (150, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*builtin_form_apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_builtin_form_t = delay_builtin_form_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let z = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(delay_builtin_form_t.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone()), (z.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_form_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_builtin_form_t = delay_builtin_form_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (156, 11), end: (156, 14) }), (delay_builtin_form_t.read().unwrap().clone()), _lua_debug_loc { start: (156, 11), end: (156, 39) }};

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_form_env.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (159, 11), end: (159, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_form_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (162, 11), end: (162, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_form_xs.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(4), _lua_debug_loc { start: (165, 11), end: (165, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*builtin_func_apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_builtin_func_t = delay_builtin_func_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(delay_builtin_func_t.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_func_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_builtin_func_t = delay_builtin_func_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (171, 11), end: (171, 14) }), (delay_builtin_func_t.read().unwrap().clone()), _lua_debug_loc { start: (171, 11), end: (171, 39) }};

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_func_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (174, 11), end: (174, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*delay_builtin_func_xs.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (177, 11), end: (177, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_apply_t = delay_apply_t.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(delay_apply_t.read().unwrap().clone()), (f.read().unwrap().clone()), (xs.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*delay_apply_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_apply_t = delay_apply_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (183, 11), end: (183, 14) }), (delay_apply_t.read().unwrap().clone()), _lua_debug_loc { start: (183, 11), end: (183, 32) }};

_lua_nil()
}})); _lua_tmp.clone() };
*delay_apply_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (186, 11), end: (186, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*delay_apply_xs.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup((x.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (189, 11), end: (189, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*force_all_rec.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all = force_all.clone();
let force_all_rec = force_all_rec.clone();
let data_p = data_p.clone();
let construction_p = construction_p.clone();
let comment_p = comment_p.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (192, 14), end: (192, 28) })));
let conslike = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*conslike.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all_rec = force_all_rec.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_set((xx.read().unwrap().clone()),_lua_num!(2),_lua_call((force_all_rec.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (194, 30), end: (194, 34) })], _lua_debug_loc { start: (194, 16), end: (194, 36) }), _lua_debug_loc { start: (194, 8), end: (194, 36) });
_lua_set((xx.read().unwrap().clone()),_lua_num!(3),_lua_call((force_all_rec.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (195, 30), end: (195, 34) })], _lua_debug_loc { start: (195, 16), end: (195, 36) }), _lua_debug_loc { start: (195, 8), end: (195, 36) });
return (xx.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (198, 7), end: (198, 16) })).as_bool(_lua_debug_loc { start: (198, 7), end: (198, 16) }) {
return _lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (199, 15), end: (199, 26) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (200, 11), end: (200, 28) })).as_bool(_lua_debug_loc { start: (200, 11), end: (200, 28) }) {
return _lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (201, 15), end: (201, 26) });
} else if (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (202, 11), end: (202, 23) })).as_bool(_lua_debug_loc { start: (202, 11), end: (202, 23) }) {
return _lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (203, 15), end: (203, 26) });
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*new_hole_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let hole_t = hole_t.clone();
move |mut _lua_arg_tmp, _| {
return _lua_vec(vec![(hole_t.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*hole_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let hole_t = hole_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (211, 11), end: (211, 14) }), (hole_t.read().unwrap().clone()), _lua_debug_loc { start: (211, 11), end: (211, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*lang_assert_equal_set_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let null_v = null_v.clone();
let just_t = just_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (214, 7), end: (214, 13) }}).as_bool(_lua_debug_loc { start: (214, 7), end: (214, 13) }) {
return _lua_nil();
}
if (_lua_op!{eq, (x.read().unwrap().clone()), (null_v.read().unwrap().clone()), _lua_debug_loc { start: (217, 7), end: (217, 18) }}).as_bool(_lua_debug_loc { start: (217, 7), end: (217, 18) }) {
*x.write().unwrap() = { let _lua_tmp = (y.read().unwrap().clone()); _lua_tmp.clone() };
*y.write().unwrap() = { let _lua_tmp = (null_v.read().unwrap().clone()); _lua_tmp.clone() };
}
_lua_set((x.read().unwrap().clone()),_lua_num!(1),(just_t.read().unwrap().clone()), _lua_debug_loc { start: (221, 4), end: (221, 17) });
_lua_set((x.read().unwrap().clone()),_lua_num!(2),(y.read().unwrap().clone()), _lua_debug_loc { start: (222, 4), end: (222, 12) });
_lua_set((x.read().unwrap().clone()),_lua_num!(3),_lua_false(), _lua_debug_loc { start: (223, 4), end: (223, 16) });
_lua_set((x.read().unwrap().clone()),_lua_num!(4),_lua_false(), _lua_debug_loc { start: (224, 4), end: (224, 16) });

_lua_nil()
}})); _lua_tmp.clone() };
*hole_set_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let hole_p = hole_p.clone();
move |mut _lua_arg_tmp, _| {
let rawx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rawy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_call((hole_p.read().unwrap().clone()), vec![(rawx.read().unwrap().clone())], _lua_debug_loc { start: (228, 8), end: (228, 20) })], _lua_debug_loc { start: (227, 4), end: (229, 5) });
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_not(_lua_call((hole_p.read().unwrap().clone()), vec![(rawy.read().unwrap().clone())], _lua_debug_loc { start: (231, 12), end: (231, 24) }), _lua_debug_loc { start: (231, 8), end: (231, 24) })], _lua_debug_loc { start: (230, 4), end: (232, 5) });
let x = std::sync::Arc::new(std::sync::RwLock::new((rawx.read().unwrap().clone())));
let y = std::sync::Arc::new(std::sync::RwLock::new((rawy.read().unwrap().clone())));
_lua_set((x.read().unwrap().clone()),_lua_num!(1),_lua_lookup((y.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (235, 11), end: (235, 14) }), _lua_debug_loc { start: (235, 4), end: (235, 15) });
_lua_set((x.read().unwrap().clone()),_lua_num!(2),_lua_lookup((y.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (236, 11), end: (236, 14) }), _lua_debug_loc { start: (236, 4), end: (236, 15) });
_lua_set((x.read().unwrap().clone()),_lua_num!(3),_lua_lookup((y.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (237, 11), end: (237, 14) }), _lua_debug_loc { start: (237, 4), end: (237, 15) });
_lua_set((x.read().unwrap().clone()),_lua_num!(4),_lua_lookup((y.read().unwrap().clone()),_lua_num!(4), _lua_debug_loc { start: (238, 11), end: (238, 14) }), _lua_debug_loc { start: (238, 4), end: (238, 15) });

_lua_nil()
}})); _lua_tmp.clone() };
*lang_copy_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_hole_do.read().unwrap().clone()), vec![], _lua_debug_loc { start: (241, 16), end: (241, 29) })));
_lua_call((hole_set_do.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (242, 4), end: (242, 23) });
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*new_error.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_data = new_data.clone();
let error_atom = error_atom.clone();
let new_construction = new_construction.clone();
let null_v = null_v.clone();
move |mut _lua_arg_tmp, _| {
let name = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let list = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_data.read().unwrap().clone()), vec![(error_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(name.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(list.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (250, 12), end: (250, 42) })], _lua_debug_loc { start: (248, 8), end: (251, 9) })], _lua_debug_loc { start: (246, 11), end: (252, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
*jsArray_to_list.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let null_v = null_v.clone();
let new_construction = new_construction.clone();
move |mut _lua_arg_tmp, _| {
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new((null_v.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (257, 18), end: (257, 21) }), _lua_num!(1), _lua_debug_loc { start: (257, 18), end: (257, 25) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (258, 14), end: (258, 20) }}).as_bool(_lua_debug_loc { start: (258, 8), end: (261, 11) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((new_construction.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (259, 38), end: (259, 43) }}, _lua_debug_loc { start: (259, 35), end: (259, 43) }), (ret.read().unwrap().clone())], _lua_debug_loc { start: (259, 18), end: (259, 50) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (260, 16), end: (260, 21) }}; _lua_tmp.clone() };
}
}
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*new_list.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let jsArray_to_list = jsArray_to_list.clone();
move |mut _lua_arg_tmp, _| {
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_vararg.clone()));
return _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (267, 11), end: (267, 30) });

_lua_nil()
}})); _lua_tmp.clone() };
*un_just_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let just_p = just_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let un_just = un_just.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not(_lua_call((just_p.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (270, 11), end: (270, 22) }), _lua_debug_loc { start: (270, 7), end: (270, 22) })).as_bool(_lua_debug_loc { start: (270, 7), end: (270, 22) }) {
return (raw.read().unwrap().clone());
}
let x = std::sync::Arc::new(std::sync::RwLock::new((raw.read().unwrap().clone())));
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
while (_lua_call((just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (275, 10), end: (275, 19) })).as_bool(_lua_debug_loc { start: (275, 4), end: (278, 7) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (276, 8), end: (276, 30) });
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (277, 12), end: (277, 22) }); _lua_tmp.clone() };
}
for (_lua_tmp_k, _lua_tmp_v) in (xs.read().unwrap().clone()).as_table(_lua_debug_loc { start: (279, 26), end: (279, 28) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let v=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(v.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (280, 8), end: (280, 38) });
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*delay_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_p = delay_evaluate_p.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_apply_p = delay_apply_p.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_op!{or, _lua_op!{or, _lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (285, 11), end: (285, 30) }), _lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (285, 34), end: (285, 57) }), _lua_debug_loc { start: (285, 11), end: (285, 104) }}, _lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (285, 61), end: (285, 84) }), _lua_debug_loc { start: (285, 11), end: (285, 104) }}, _lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (285, 88), end: (285, 104) }), _lua_debug_loc { start: (285, 11), end: (285, 104) }};

_lua_nil()
}})); _lua_tmp.clone() };
*delay_just_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let just_p = just_p.clone();
let delay_p = delay_p.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_call((just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (288, 11), end: (288, 20) }), _lua_call((delay_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (288, 24), end: (288, 34) }), _lua_debug_loc { start: (288, 11), end: (288, 34) }};

_lua_nil()
}})); _lua_tmp.clone() };
*lazy_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_just_p = delay_just_p.clone();
let comment_p = comment_p.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (291, 11), end: (291, 26) }), _lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (291, 30), end: (291, 42) }), _lua_debug_loc { start: (291, 11), end: (291, 42) }};

_lua_nil()
}})); _lua_tmp.clone() };
*force_all_inner.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
let delay_just_p = delay_just_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let force_all_inner = force_all_inner.clone();
let the_world_stopped_v = the_world_stopped_v.clone();
let force1 = force1.clone();
let simple_print = simple_print.clone();
let delay_evaluate_p = delay_evaluate_p.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_builtin_func_f = delay_builtin_func_f.clone();
let delay_builtin_func_xs = delay_builtin_func_xs.clone();
let data_name_function_builtin_systemName = data_name_function_builtin_systemName.clone();
let data_list_function_builtin_systemName = data_list_function_builtin_systemName.clone();
let data_p_function_builtin_systemName = data_p_function_builtin_systemName.clone();
let construction_p_function_builtin_systemName = construction_p_function_builtin_systemName.clone();
let construction_head_function_builtin_systemName = construction_head_function_builtin_systemName.clone();
let construction_tail_function_builtin_systemName = construction_tail_function_builtin_systemName.clone();
let atom_p_function_builtin_systemName = atom_p_function_builtin_systemName.clone();
let null_p_function_builtin_systemName = null_p_function_builtin_systemName.clone();
let equal_p = equal_p.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
let builtin_func_apply = builtin_func_apply.clone();
let LANG_ERROR = LANG_ERROR.clone();
let equal_p_function_builtin_systemName = equal_p_function_builtin_systemName.clone();
let apply_function_builtin_systemName = apply_function_builtin_systemName.clone();
let evaluate_function_builtin_systemName = evaluate_function_builtin_systemName.clone();
let if_function_builtin_systemName = if_function_builtin_systemName.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let delay_apply_p = delay_apply_p.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let parents_history = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ref_novalue_replace = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (parents_history.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (294, 7), end: (294, 29) }}).as_bool(_lua_debug_loc { start: (294, 7), end: (294, 29) }) {
*parents_history.write().unwrap() = { let _lua_tmp = _lua_vec(vec![]); _lua_tmp.clone() };
}
if (_lua_op!{eq, (ref_novalue_replace.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (297, 7), end: (297, 33) }}).as_bool(_lua_debug_loc { start: (297, 7), end: (297, 33) }) {
*ref_novalue_replace.write().unwrap() = { let _lua_tmp = _lua_vec(vec![_lua_false(), _lua_false()]); _lua_tmp.clone() };
}
if (_lua_op!{eq, (xs.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (300, 7), end: (300, 16) }}).as_bool(_lua_debug_loc { start: (300, 7), end: (300, 16) }) {
*xs.write().unwrap() = { let _lua_tmp = _lua_vec(vec![]); _lua_tmp.clone() };
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let do_rewrite = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let do_rewrite_force_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*do_rewrite.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
let x = x.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp, _| {
let newval = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (newval.read().unwrap().clone())], _lua_debug_loc { start: (305, 8), end: (305, 43) });
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (308, 22), end: (308, 25) }), _lua_debug_loc { start: (308, 18), end: (308, 25) }}).as_bool(_lua_debug_loc { start: (308, 12), end: (311, 15) }) {
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (309, 44), end: (309, 49) }}, _lua_debug_loc { start: (309, 41), end: (309, 49) }), (newval.read().unwrap().clone())], _lua_debug_loc { start: (309, 16), end: (309, 59) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (310, 20), end: (310, 25) }}; _lua_tmp.clone() };
}
}
return (newval.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*do_rewrite_force_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let do_rewrite = do_rewrite.clone();
let delay_just_p = delay_just_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let xs = xs.clone();
let x = x.clone();
let force_all_inner = force_all_inner.clone();
let parents_history = parents_history.clone();
move |mut _lua_arg_tmp, _| {
let newval = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((do_rewrite.read().unwrap().clone()), vec![(newval.read().unwrap().clone())], _lua_debug_loc { start: (316, 8), end: (316, 26) });
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(newval.read().unwrap().clone())], _lua_debug_loc { start: (317, 11), end: (317, 31) })).as_bool(_lua_debug_loc { start: (317, 11), end: (317, 31) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (318, 12), end: (318, 34) });
return _lua_call((force_all_inner.read().unwrap().clone()), vec![(newval.read().unwrap().clone()), (parents_history.read().unwrap().clone()), _lua_vec(vec![_lua_false(), _lua_false()]), (xs.read().unwrap().clone())], _lua_debug_loc { start: (319, 19), end: (319, 79) });
}
return (newval.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
let history = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
*x.write().unwrap() = { let _lua_tmp = (raw.read().unwrap().clone()); _lua_tmp.clone() };
let replace_this_with_stopped = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*replace_this_with_stopped.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let ref_novalue_replace = ref_novalue_replace.clone();
let do_rewrite_force_all = do_rewrite_force_all.clone();
let the_world_stopped_v = the_world_stopped_v.clone();
move |mut _lua_arg_tmp, _| {
_lua_set((ref_novalue_replace.read().unwrap().clone()),_lua_num!(2),_lua_true(), _lua_debug_loc { start: (326, 8), end: (326, 37) });
return _lua_call((do_rewrite_force_all.read().unwrap().clone()), vec![(the_world_stopped_v.read().unwrap().clone())], _lua_debug_loc { start: (327, 15), end: (327, 56) });

_lua_nil()
}})); _lua_tmp.clone() };
let make_history = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_history.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let history = history.clone();
let parents_history = parents_history.clone();
move |mut _lua_arg_tmp, _| {
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
for (_lua_tmp_k, _) in (history.read().unwrap().clone()).as_table(_lua_debug_loc { start: (331, 26), end: (331, 33) }).read().unwrap().pairs() {
let x_id=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_k.clone()));
_lua_set((ret.read().unwrap().clone()),(x_id.read().unwrap().clone()),_lua_true(), _lua_debug_loc { start: (332, 12), end: (332, 28) });
}
for (_lua_tmp_k, _) in (parents_history.read().unwrap().clone()).as_table(_lua_debug_loc { start: (334, 26), end: (334, 41) }).read().unwrap().pairs() {
let x_id=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_k.clone()));
_lua_set((ret.read().unwrap().clone()),(x_id.read().unwrap().clone()),_lua_true(), _lua_debug_loc { start: (335, 12), end: (335, 28) });
}
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{and, _lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (341, 14), end: (341, 29) }), _lua_op!{less, (i.read().unwrap().clone()), _lua_num!(32), _lua_debug_loc { start: (341, 34), end: (341, 40) }}, _lua_debug_loc { start: (341, 14), end: (341, 40) }}).as_bool(_lua_debug_loc { start: (341, 8), end: (345, 11) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (342, 12), end: (342, 34) });
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (343, 16), end: (343, 25) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (344, 16), end: (344, 21) }}; _lua_tmp.clone() };
}
}
while (_lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (347, 10), end: (347, 25) })).as_bool(_lua_debug_loc { start: (347, 4), end: (416, 7) }) {
let x_id = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((simple_print.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (348, 21), end: (348, 36) })));
if (_lua_op!{eq, _lua_lookup((parents_history.read().unwrap().clone()),(x_id.read().unwrap().clone()), _lua_debug_loc { start: (349, 11), end: (349, 31) }), _lua_true(), _lua_debug_loc { start: (349, 11), end: (349, 40) }}).as_bool(_lua_debug_loc { start: (349, 11), end: (349, 40) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (350, 19), end: (350, 46) });
}
if (_lua_op!{eq, _lua_lookup((history.read().unwrap().clone()),(x_id.read().unwrap().clone()), _lua_debug_loc { start: (352, 11), end: (352, 23) }), _lua_true(), _lua_debug_loc { start: (352, 11), end: (352, 32) }}).as_bool(_lua_debug_loc { start: (352, 11), end: (352, 32) }) {
_lua_set((ref_novalue_replace.read().unwrap().clone()),_lua_num!(1),_lua_true(), _lua_debug_loc { start: (353, 12), end: (353, 41) });
if (_lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (354, 15), end: (354, 34) })).as_bool(_lua_debug_loc { start: (354, 15), end: (354, 34) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (355, 23), end: (355, 50) });
} else if (_lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (356, 19), end: (356, 42) })).as_bool(_lua_debug_loc { start: (356, 19), end: (356, 42) }) {
let f = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((delay_builtin_func_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (357, 26), end: (357, 49) })));
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((delay_builtin_func_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (358, 27), end: (358, 51) })));
let elim_s = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![(data_name_function_builtin_systemName.read().unwrap().clone()), (data_list_function_builtin_systemName.read().unwrap().clone()), (data_p_function_builtin_systemName.read().unwrap().clone()), (construction_p_function_builtin_systemName.read().unwrap().clone()), (construction_head_function_builtin_systemName.read().unwrap().clone()), (construction_tail_function_builtin_systemName.read().unwrap().clone()), (atom_p_function_builtin_systemName.read().unwrap().clone()), (null_p_function_builtin_systemName.read().unwrap().clone())])));
let is_elim = std::sync::Arc::new(std::sync::RwLock::new(_lua_false()));
for (_lua_tmp_k, _lua_tmp_v) in (elim_s.read().unwrap().clone()).as_table(_lua_debug_loc { start: (361, 45), end: (361, 51) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let elim_s_v=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
if (_lua_call((equal_p.read().unwrap().clone()), vec![(elim_s_v.read().unwrap().clone()), (f.read().unwrap().clone())], _lua_debug_loc { start: (362, 23), end: (362, 43) })).as_bool(_lua_debug_loc { start: (362, 23), end: (362, 43) }) {
*is_elim.write().unwrap() = { let _lua_tmp = _lua_true(); _lua_tmp.clone() };
break;
}
}
if ((is_elim.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (367, 19), end: (367, 26) }) {
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (368, 32), end: (368, 35) }), _lua_num!(1), _lua_debug_loc { start: (368, 32), end: (368, 40) }}], _lua_debug_loc { start: (368, 20), end: (368, 41) });
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, _lua_lookup((ref_novalue_replace.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (369, 32), end: (369, 53) }), _lua_false(), _lua_debug_loc { start: (369, 32), end: (369, 63) }}], _lua_debug_loc { start: (369, 20), end: (369, 64) });
let inner = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all_inner.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (371, 24), end: (371, 28) }), _lua_call((make_history.read().unwrap().clone()), vec![], _lua_debug_loc { start: (372, 24), end: (372, 38) }), (ref_novalue_replace.read().unwrap().clone())], _lua_debug_loc { start: (370, 34), end: (374, 21) })));
if (_lua_lookup((ref_novalue_replace.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (375, 23), end: (375, 44) })).as_bool(_lua_debug_loc { start: (375, 23), end: (375, 44) }) {
return _lua_call((do_rewrite_force_all.read().unwrap().clone()), vec![_lua_call((builtin_func_apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), _lua_vec(vec![(inner.read().unwrap().clone())])], _lua_debug_loc { start: (377, 28), end: (377, 58) })], _lua_debug_loc { start: (376, 31), end: (378, 25) });
} else {
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (380, 31), end: (380, 43) });
}
}
if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (equal_p_function_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (383, 19), end: (383, 66) })).as_bool(_lua_debug_loc { start: (383, 19), end: (383, 66) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (384, 27), end: (384, 54) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (apply_function_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (385, 23), end: (385, 68) })).as_bool(_lua_debug_loc { start: (385, 23), end: (385, 68) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (386, 27), end: (386, 54) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (evaluate_function_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (387, 23), end: (387, 71) })).as_bool(_lua_debug_loc { start: (387, 23), end: (387, 71) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (388, 27), end: (388, 54) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (if_function_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (389, 23), end: (389, 65) })).as_bool(_lua_debug_loc { start: (389, 23), end: (389, 65) }) {
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (390, 32), end: (390, 35) }), _lua_num!(3), _lua_debug_loc { start: (390, 32), end: (390, 40) }}], _lua_debug_loc { start: (390, 20), end: (390, 41) });
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, _lua_lookup((ref_novalue_replace.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (391, 32), end: (391, 53) }), _lua_false(), _lua_debug_loc { start: (391, 32), end: (391, 63) }}], _lua_debug_loc { start: (391, 20), end: (391, 64) });
let tf = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all_inner.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (393, 24), end: (393, 28) }), _lua_call((make_history.read().unwrap().clone()), vec![], _lua_debug_loc { start: (394, 24), end: (394, 38) }), (ref_novalue_replace.read().unwrap().clone())], _lua_debug_loc { start: (392, 31), end: (396, 21) })));
if (_lua_lookup((ref_novalue_replace.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (397, 23), end: (397, 44) })).as_bool(_lua_debug_loc { start: (397, 23), end: (397, 44) }) {
return _lua_call((do_rewrite_force_all.read().unwrap().clone()), vec![_lua_call((builtin_func_apply.read().unwrap().clone()), vec![(if_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![(tf.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (399, 84), end: (399, 88) }), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (399, 91), end: (399, 95) })])], _lua_debug_loc { start: (399, 28), end: (399, 98) })], _lua_debug_loc { start: (398, 31), end: (400, 25) });
} else {
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (402, 31), end: (402, 43) });
}
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (405, 23), end: (405, 35) });
} else if (_lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (406, 19), end: (406, 42) })).as_bool(_lua_debug_loc { start: (406, 19), end: (406, 42) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (407, 23), end: (407, 50) });
} else if (_lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (408, 19), end: (408, 35) })).as_bool(_lua_debug_loc { start: (408, 19), end: (408, 35) }) {
return _lua_call((replace_this_with_stopped.read().unwrap().clone()), vec![], _lua_debug_loc { start: (409, 23), end: (409, 50) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (411, 19), end: (411, 31) });
}
_lua_set((history.read().unwrap().clone()),(x_id.read().unwrap().clone()),_lua_true(), _lua_debug_loc { start: (413, 8), end: (413, 28) });
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (414, 8), end: (414, 30) });
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (415, 12), end: (415, 21) }); _lua_tmp.clone() };
}
return _lua_call((do_rewrite.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (417, 11), end: (417, 24) });

_lua_nil()
}})); _lua_tmp.clone() };
*force1.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
let just_p = just_p.clone();
let delay_evaluate_p = delay_evaluate_p.clone();
let real_evaluate = real_evaluate.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
let delay_evaluate_x = delay_evaluate_x.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let real_builtin_form_apply = real_builtin_form_apply.clone();
let delay_builtin_form_env = delay_builtin_form_env.clone();
let delay_builtin_form_f = delay_builtin_form_f.clone();
let delay_builtin_form_xs = delay_builtin_form_xs.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let real_builtin_func_apply = real_builtin_func_apply.clone();
let delay_builtin_func_f = delay_builtin_func_f.clone();
let delay_builtin_func_xs = delay_builtin_func_xs.clone();
let delay_apply_p = delay_apply_p.clone();
let real_apply = real_apply.clone();
let delay_apply_f = delay_apply_f.clone();
let delay_apply_xs = delay_apply_xs.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((un_just_all.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (420, 14), end: (420, 30) })));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_not(_lua_call((just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (423, 12), end: (423, 21) }), _lua_debug_loc { start: (423, 8), end: (423, 21) })], _lua_debug_loc { start: (422, 4), end: (424, 5) });
if (_lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (425, 7), end: (425, 26) })).as_bool(_lua_debug_loc { start: (425, 7), end: (425, 26) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((real_evaluate.read().unwrap().clone()), vec![_lua_call((delay_evaluate_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (427, 12), end: (427, 33) }), _lua_call((delay_evaluate_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (428, 12), end: (428, 31) }), (raw.read().unwrap().clone())], _lua_debug_loc { start: (426, 14), end: (430, 9) }); _lua_tmp.clone() };
} else if (_lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (431, 11), end: (431, 34) })).as_bool(_lua_debug_loc { start: (431, 11), end: (431, 34) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((real_builtin_form_apply.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (433, 12), end: (433, 37) }), _lua_call((delay_builtin_form_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (434, 12), end: (434, 35) }), _lua_call((delay_builtin_form_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (435, 12), end: (435, 36) }), (raw.read().unwrap().clone())], _lua_debug_loc { start: (432, 14), end: (437, 9) }); _lua_tmp.clone() };
} else if (_lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (438, 11), end: (438, 34) })).as_bool(_lua_debug_loc { start: (438, 11), end: (438, 34) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((real_builtin_func_apply.read().unwrap().clone()), vec![_lua_call((delay_builtin_func_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (440, 12), end: (440, 35) }), _lua_call((delay_builtin_func_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (441, 12), end: (441, 36) }), (raw.read().unwrap().clone())], _lua_debug_loc { start: (439, 14), end: (443, 9) }); _lua_tmp.clone() };
} else if (_lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (444, 11), end: (444, 27) })).as_bool(_lua_debug_loc { start: (444, 11), end: (444, 27) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((real_apply.read().unwrap().clone()), vec![_lua_call((delay_apply_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (446, 12), end: (446, 28) }), _lua_call((delay_apply_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (447, 12), end: (447, 29) }), (raw.read().unwrap().clone())], _lua_debug_loc { start: (445, 14), end: (449, 9) }); _lua_tmp.clone() };
} else {
*ret.write().unwrap() = { let _lua_tmp = (x.read().unwrap().clone()); _lua_tmp.clone() };
}
*ret.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (453, 10), end: (453, 26) }); _lua_tmp.clone() };
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (ret.read().unwrap().clone())], _lua_debug_loc { start: (454, 4), end: (454, 36) });
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*force_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all_inner = force_all_inner.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((force_all_inner.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (458, 11), end: (458, 31) });

_lua_nil()
}})); _lua_tmp.clone() };
*force_uncomment_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_just_p = delay_just_p.clone();
let comment_p = comment_p.clone();
let force_all = force_all.clone();
let un_comment_all = un_comment_all.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_op!{or, _lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (461, 10), end: (461, 25) }), _lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (461, 29), end: (461, 41) }), _lua_debug_loc { start: (461, 10), end: (461, 41) }}).as_bool(_lua_debug_loc { start: (461, 4), end: (465, 7) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![_lua_call((un_comment_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (463, 12), end: (463, 29) })], _lua_debug_loc { start: (462, 12), end: (464, 9) }); _lua_tmp.clone() };
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*unlazy1.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
let force1 = force1.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (469, 10), end: (469, 22) })).as_bool(_lua_debug_loc { start: (469, 4), end: (471, 7) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((comment_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (470, 12), end: (470, 24) }); _lua_tmp.clone() };
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (472, 8), end: (472, 17) }); _lua_tmp.clone() };
while (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (473, 10), end: (473, 22) })).as_bool(_lua_debug_loc { start: (473, 4), end: (475, 7) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((comment_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (474, 12), end: (474, 24) }); _lua_tmp.clone() };
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*unlazy_list_1_keepcomment.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
let null_p = null_p.clone();
let comment_p = comment_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let comment_comment = comment_comment.clone();
let comment_x = comment_x.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let delay_just_p = delay_just_p.clone();
let force1 = force1.clone();
move |mut _lua_arg_tmp, _| {
let list = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let not_list_k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let delay_just_k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let comments = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((un_just_all.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (481, 14), end: (481, 31) })));
let not_forced = std::sync::Arc::new(std::sync::RwLock::new(_lua_true()));
while (_lua_true()).as_bool(_lua_debug_loc { start: (483, 4), end: (508, 7) }) {
if (_lua_call((null_p.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (484, 11), end: (484, 20) })).as_bool(_lua_debug_loc { start: (484, 11), end: (484, 20) }) {
return _lua_call((k.read().unwrap().clone()), vec![(comments.read().unwrap().clone()), (ret.read().unwrap().clone())], _lua_debug_loc { start: (485, 19), end: (485, 35) });
} else if (_lua_call((comment_p.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (486, 15), end: (486, 27) })).as_bool(_lua_debug_loc { start: (486, 15), end: (486, 27) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(comments.read().unwrap().clone()), _lua_call((comment_comment.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (489, 16), end: (489, 34) })], _lua_debug_loc { start: (487, 12), end: (490, 13) });
*i.write().unwrap() = { let _lua_tmp = _lua_call((comment_x.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (491, 16), end: (491, 28) }); _lua_tmp.clone() };
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (492, 15), end: (492, 32) })).as_bool(_lua_debug_loc { start: (492, 15), end: (492, 32) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (495, 16), end: (495, 36) })], _lua_debug_loc { start: (493, 12), end: (496, 13) });
*i.write().unwrap() = { let _lua_tmp = _lua_call((construction_tail.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (497, 16), end: (497, 36) }); _lua_tmp.clone() };
} else if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (498, 15), end: (498, 30) })).as_bool(_lua_debug_loc { start: (498, 15), end: (498, 30) }) {
if ((not_forced.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (499, 15), end: (499, 25) }) {
*not_forced.write().unwrap() = { let _lua_tmp = _lua_false(); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(i.read().unwrap().clone())], _lua_debug_loc { start: (501, 20), end: (501, 29) }); _lua_tmp.clone() };
} else {
return _lua_call((delay_just_k.read().unwrap().clone()), vec![], _lua_debug_loc { start: (503, 23), end: (503, 37) });
}
} else {
return _lua_call((not_list_k.read().unwrap().clone()), vec![], _lua_debug_loc { start: (506, 19), end: (506, 31) });
}
}

_lua_nil()
}})); _lua_tmp.clone() };
*name_unlazy1_p3.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let lazy_p = lazy_p.clone();
let unlazy1 = unlazy1.clone();
let atom_p = atom_p.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let atom_equal_p = atom_equal_p.clone();
let name_atom = name_atom.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((lazy_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (511, 7), end: (511, 16) })).as_bool(_lua_debug_loc { start: (511, 7), end: (511, 16) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((unlazy1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (512, 12), end: (512, 22) }); _lua_tmp.clone() };
}
if (_lua_call((lazy_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (514, 7), end: (514, 16) })).as_bool(_lua_debug_loc { start: (514, 7), end: (514, 16) }) {
return _lua_nil();
}
if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (517, 7), end: (517, 16) })).as_bool(_lua_debug_loc { start: (517, 7), end: (517, 16) }) {
return _lua_true();
}
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (520, 11), end: (520, 20) }), _lua_debug_loc { start: (520, 7), end: (520, 20) })).as_bool(_lua_debug_loc { start: (520, 7), end: (520, 20) }) {
return _lua_false();
}
let n = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((data_name.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (523, 14), end: (523, 26) })));
if (_lua_call((lazy_p.read().unwrap().clone()), vec![(n.read().unwrap().clone())], _lua_debug_loc { start: (524, 7), end: (524, 16) })).as_bool(_lua_debug_loc { start: (524, 7), end: (524, 16) }) {
*n.write().unwrap() = { let _lua_tmp = _lua_call((unlazy1.read().unwrap().clone()), vec![(n.read().unwrap().clone())], _lua_debug_loc { start: (525, 12), end: (525, 22) }); _lua_tmp.clone() };
}
if (_lua_call((lazy_p.read().unwrap().clone()), vec![(n.read().unwrap().clone())], _lua_debug_loc { start: (527, 7), end: (527, 16) })).as_bool(_lua_debug_loc { start: (527, 7), end: (527, 16) }) {
return _lua_nil();
}
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(n.read().unwrap().clone())], _lua_debug_loc { start: (530, 11), end: (530, 20) }), _lua_debug_loc { start: (530, 7), end: (530, 20) })).as_bool(_lua_debug_loc { start: (530, 7), end: (530, 20) }) {
return _lua_false();
}
return _lua_call((atom_equal_p.read().unwrap().clone()), vec![(n.read().unwrap().clone()), (name_atom.read().unwrap().clone())], _lua_debug_loc { start: (533, 11), end: (533, 37) });

_lua_nil()
}})); _lua_tmp.clone() };
*make_enviroment_null_v.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
return _lua_vec(vec![_lua_true(), _lua_vec(vec![]), _lua_nil()]);

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_null_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let recordstring_null_p = recordstring_null_p.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_lookup((x.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (539, 7), end: (539, 10) })).as_bool(_lua_debug_loc { start: (539, 7), end: (539, 10) }) {
return _lua_call((recordstring_null_p.read().unwrap().clone()), vec![_lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (540, 35), end: (540, 38) })], _lua_debug_loc { start: (540, 15), end: (540, 40) });
}
return _lua_false();

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_helper_print0.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_uncomment_all = force_uncomment_all.clone();
let atom_p = atom_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let un_atom = un_atom.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let refe = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.write().unwrap() = { let _lua_tmp = _lua_call((force_uncomment_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (545, 8), end: (545, 30) }); _lua_tmp.clone() };
if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (546, 7), end: (546, 16) })).as_bool(_lua_debug_loc { start: (546, 7), end: (546, 16) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_str("^"), _lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (550, 12), end: (550, 22) })], _lua_debug_loc { start: (547, 8), end: (551, 9) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (552, 11), end: (552, 28) })).as_bool(_lua_debug_loc { start: (552, 11), end: (552, 28) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_str(".")], _lua_debug_loc { start: (553, 8), end: (553, 33) });
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(refe.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (556, 12), end: (556, 32) }), _lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (557, 12), end: (557, 32) })], _lua_debug_loc { start: (554, 8), end: (558, 9) });
} else if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (559, 11), end: (559, 20) })).as_bool(_lua_debug_loc { start: (559, 11), end: (559, 20) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_str("_")], _lua_debug_loc { start: (560, 8), end: (560, 33) });
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (561, 11), end: (561, 20) })).as_bool(_lua_debug_loc { start: (561, 11), end: (561, 20) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_str("#")], _lua_debug_loc { start: (562, 8), end: (562, 33) });
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(refe.read().unwrap().clone()), _lua_call((data_name.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (565, 12), end: (565, 24) }), _lua_call((data_list.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (566, 12), end: (566, 24) })], _lua_debug_loc { start: (563, 8), end: (567, 9) });
} else {
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (569, 15), end: (569, 27) });
}

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_helper_print_step.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let enviroment_helper_print0 = enviroment_helper_print0.clone();
move |mut _lua_arg_tmp, _| {
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rs = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let ss = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
for (_lua_tmp_k, _lua_tmp_v) in (xs.read().unwrap().clone()).as_table(_lua_debug_loc { start: (575, 26), end: (575, 28) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let x=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
_lua_call((enviroment_helper_print0.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (rs.read().unwrap().clone()), (ss.read().unwrap().clone())], _lua_debug_loc { start: (576, 8), end: (576, 43) });
}
return _lua_vec(vec![(ss.read().unwrap().clone()), (rs.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_helper_node_expand.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let enviroment_helper_print_step = enviroment_helper_print_step.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let e = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((enviroment_helper_print_step.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (581, 43), end: (581, 48) })], _lua_debug_loc { start: (581, 14), end: (581, 50) })));
let es = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((e.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (582, 15), end: (582, 18) })));
let ev = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((e.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (583, 15), end: (583, 18) })));
let t = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{not_eq, _lua_len((es.read().unwrap().clone()), _lua_debug_loc { start: (585, 16), end: (585, 19) }), _lua_num!(0), _lua_debug_loc { start: (585, 16), end: (585, 24) }}], _lua_debug_loc { start: (585, 4), end: (585, 25) });
_lua_set((t.read().unwrap().clone()),_lua_lookup((es.read().unwrap().clone()),_lua_len((es.read().unwrap().clone()), _lua_debug_loc { start: (586, 9), end: (586, 12) }), _lua_debug_loc { start: (586, 6), end: (586, 12) }),_lua_vec(vec![_lua_false(), (ev.read().unwrap().clone()), _lua_lookup((env.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (586, 29), end: (586, 34) })]), _lua_debug_loc { start: (586, 4), end: (586, 36) });
let result = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![_lua_true(), (t.read().unwrap().clone()), _lua_nil()])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((es.read().unwrap().clone()), _lua_debug_loc { start: (589, 18), end: (589, 21) }), _lua_num!(2), _lua_debug_loc { start: (589, 18), end: (589, 25) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (590, 14), end: (590, 20) }}).as_bool(_lua_debug_loc { start: (590, 8), end: (595, 11) }) {
let t = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
_lua_set((t.read().unwrap().clone()),_lua_lookup((es.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (592, 17), end: (592, 22) }}, _lua_debug_loc { start: (592, 14), end: (592, 22) }),(result.read().unwrap().clone()), _lua_debug_loc { start: (592, 12), end: (592, 33) });
*result.write().unwrap() = { let _lua_tmp = _lua_vec(vec![_lua_true(), (t.read().unwrap().clone()), _lua_nil()]); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (594, 16), end: (594, 21) }}; _lua_tmp.clone() };
}
}
return (result.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_helper_tree_shadow_copy.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let recordstring_shadow_copy = recordstring_shadow_copy.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![_lua_true(), _lua_call((recordstring_shadow_copy.read().unwrap().clone()), vec![_lua_lookup((x.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (602, 33), end: (602, 36) })], _lua_debug_loc { start: (602, 8), end: (602, 38) }), _lua_nil()]);

_lua_nil()
}})); _lua_tmp.clone() };
*enviroment_set_helper.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let enviroment_null_p = enviroment_null_p.clone();
let trampoline_return = trampoline_return.clone();
let enviroment_helper_tree_shadow_copy = enviroment_helper_tree_shadow_copy.clone();
let enviroment_helper_print_step = enviroment_helper_print_step.clone();
let make_enviroment_null_v = make_enviroment_null_v.clone();
let enviroment_helper_node_expand = enviroment_helper_node_expand.clone();
let trampoline_delay = trampoline_delay.clone();
let enviroment_set_helper = enviroment_set_helper.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let return_pointer = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let real_return = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, _lua_len((key.read().unwrap().clone()), _lua_debug_loc { start: (607, 7), end: (607, 11) }), _lua_num!(0), _lua_debug_loc { start: (607, 7), end: (607, 16) }}).as_bool(_lua_debug_loc { start: (607, 7), end: (607, 16) }) {
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{or, _lua_call((enviroment_null_p.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (609, 12), end: (609, 34) }), _lua_op!{and, _lua_op!{eq, _lua_lookup((env.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (609, 39), end: (609, 44) }), _lua_false(), _lua_debug_loc { start: (609, 39), end: (609, 77) }}, _lua_op!{eq, _lua_lookup(_lua_lookup((env.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (609, 59), end: (609, 72) }),_lua_str("length"), _lua_debug_loc { start: (609, 59), end: (609, 72) }), _lua_num!(0), _lua_debug_loc { start: (609, 59), end: (609, 77) }}, _lua_debug_loc { start: (609, 39), end: (609, 77) }}, _lua_debug_loc { start: (609, 12), end: (609, 78) }}], _lua_debug_loc { start: (608, 8), end: (610, 9) });
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(1),_lua_false(), _lua_debug_loc { start: (611, 8), end: (611, 33) });
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(2),(key.read().unwrap().clone()), _lua_debug_loc { start: (612, 8), end: (612, 31) });
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(3),(val.read().unwrap().clone()), _lua_debug_loc { start: (613, 8), end: (613, 31) });
return _lua_call((trampoline_return.read().unwrap().clone()), vec![(real_return.read().unwrap().clone())], _lua_debug_loc { start: (614, 15), end: (614, 45) });
}
if (_lua_lookup((env.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (616, 7), end: (616, 12) })).as_bool(_lua_debug_loc { start: (616, 7), end: (616, 12) }) {
let result_tmp = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((enviroment_helper_tree_shadow_copy.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (617, 27), end: (617, 66) })));
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(1),_lua_lookup((result_tmp.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (618, 28), end: (618, 40) }), _lua_debug_loc { start: (618, 8), end: (618, 41) });
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(2),_lua_lookup((result_tmp.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (619, 28), end: (619, 40) }), _lua_debug_loc { start: (619, 8), end: (619, 41) });
_lua_set((return_pointer.read().unwrap().clone()),_lua_num!(3),_lua_lookup((result_tmp.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (620, 28), end: (620, 40) }), _lua_debug_loc { start: (620, 8), end: (620, 41) });
let result = std::sync::Arc::new(std::sync::RwLock::new((return_pointer.read().unwrap().clone())));
let a = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((enviroment_helper_print_step.read().unwrap().clone()), vec![(key.read().unwrap().clone())], _lua_debug_loc { start: (622, 18), end: (622, 51) })));
let astr = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((a.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (623, 21), end: (623, 24) })));
let av = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((a.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (624, 19), end: (624, 22) })));
let pointer = std::sync::Arc::new(std::sync::RwLock::new((result.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((astr.read().unwrap().clone()), _lua_debug_loc { start: (628, 22), end: (628, 27) }), _lua_debug_loc { start: (628, 18), end: (628, 27) }}).as_bool(_lua_debug_loc { start: (628, 12), end: (654, 15) }) {
let k = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((astr.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (629, 31), end: (629, 36) }}, _lua_debug_loc { start: (629, 26), end: (629, 36) })));
let m = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
if (_lua_op!{not_eq, _lua_lookup(_lua_lookup((pointer.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (631, 19), end: (631, 31) }),(k.read().unwrap().clone()), _lua_debug_loc { start: (631, 19), end: (631, 31) }), _lua_nil(), _lua_debug_loc { start: (631, 19), end: (631, 39) }}).as_bool(_lua_debug_loc { start: (631, 19), end: (631, 39) }) {
let t = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup(_lua_lookup((pointer.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (632, 30), end: (632, 42) }),(k.read().unwrap().clone()), _lua_debug_loc { start: (632, 30), end: (632, 42) })));
if (_lua_lookup((t.read().unwrap().clone()),_lua_num!(0), _lua_debug_loc { start: (633, 23), end: (633, 26) })).as_bool(_lua_debug_loc { start: (633, 23), end: (633, 26) }) {
*m.write().unwrap() = { let _lua_tmp = _lua_call((enviroment_helper_tree_shadow_copy.read().unwrap().clone()), vec![(t.read().unwrap().clone())], _lua_debug_loc { start: (634, 28), end: (634, 65) }); _lua_tmp.clone() };
} else {
if (_lua_op!{eq, _lua_lookup(_lua_lookup((t.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (636, 27), end: (636, 38) }),_lua_str("length"), _lua_debug_loc { start: (636, 27), end: (636, 38) }), _lua_num!(0), _lua_debug_loc { start: (636, 27), end: (636, 43) }}).as_bool(_lua_debug_loc { start: (636, 27), end: (636, 43) }) {
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, (i.read().unwrap().clone()), _lua_op!{sub, _lua_len((astr.read().unwrap().clone()), _lua_debug_loc { start: (637, 45), end: (637, 50) }), _lua_num!(1), _lua_debug_loc { start: (637, 45), end: (637, 54) }}, _lua_debug_loc { start: (637, 40), end: (637, 54) }}], _lua_debug_loc { start: (637, 28), end: (637, 55) });
let p = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_enviroment_null_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (638, 38), end: (638, 62) })));
_lua_set(_lua_lookup((pointer.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (639, 28), end: (639, 40) }),(k.read().unwrap().clone()),(p.read().unwrap().clone()), _lua_debug_loc { start: (639, 28), end: (639, 45) });
_lua_set((p.read().unwrap().clone()),_lua_num!(1),_lua_false(), _lua_debug_loc { start: (640, 28), end: (640, 40) });
_lua_set((p.read().unwrap().clone()),_lua_num!(2),(av.read().unwrap().clone()), _lua_debug_loc { start: (641, 28), end: (641, 37) });
_lua_set((p.read().unwrap().clone()),_lua_num!(3),(val.read().unwrap().clone()), _lua_debug_loc { start: (642, 28), end: (642, 38) });
return _lua_call((trampoline_return.read().unwrap().clone()), vec![(real_return.read().unwrap().clone())], _lua_debug_loc { start: (643, 35), end: (643, 65) });
}
*m.write().unwrap() = { let _lua_tmp = _lua_call((enviroment_helper_node_expand.read().unwrap().clone()), vec![(t.read().unwrap().clone())], _lua_debug_loc { start: (645, 28), end: (645, 60) }); _lua_tmp.clone() };
}
} else {
*m.write().unwrap() = { let _lua_tmp = _lua_vec(vec![_lua_true(), _lua_vec(vec![]), _lua_nil()]); _lua_tmp.clone() };
}
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{not_eq, (m.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (650, 28), end: (650, 36) }}], _lua_debug_loc { start: (650, 16), end: (650, 37) });
_lua_set(_lua_lookup((pointer.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (651, 16), end: (651, 28) }),(k.read().unwrap().clone()),(m.read().unwrap().clone()), _lua_debug_loc { start: (651, 16), end: (651, 33) });
*pointer.write().unwrap() = { let _lua_tmp = (m.read().unwrap().clone()); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (653, 20), end: (653, 25) }}; _lua_tmp.clone() };
}
}
if (_lua_call((enviroment_null_p.read().unwrap().clone()), vec![(pointer.read().unwrap().clone())], _lua_debug_loc { start: (656, 11), end: (656, 37) })).as_bool(_lua_debug_loc { start: (656, 11), end: (656, 37) }) {
let p = std::sync::Arc::new(std::sync::RwLock::new((pointer.read().unwrap().clone())));
_lua_set((p.read().unwrap().clone()),_lua_num!(1),_lua_false(), _lua_debug_loc { start: (658, 12), end: (658, 24) });
_lua_set((p.read().unwrap().clone()),_lua_num!(2),(av.read().unwrap().clone()), _lua_debug_loc { start: (659, 12), end: (659, 21) });
_lua_set((p.read().unwrap().clone()),_lua_num!(3),(val.read().unwrap().clone()), _lua_debug_loc { start: (660, 12), end: (660, 22) });
return _lua_call((trampoline_return.read().unwrap().clone()), vec![(real_return.read().unwrap().clone())], _lua_debug_loc { start: (661, 19), end: (661, 49) });
} else {
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![_lua_lambda(Box::new({let enviroment_set_helper = enviroment_set_helper.clone();
let pointer = pointer.clone();
let av = av.clone();
let val = val.clone();
let real_return = real_return.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((enviroment_set_helper.read().unwrap().clone()), vec![(pointer.read().unwrap().clone()), (av.read().unwrap().clone()), (val.read().unwrap().clone()), (pointer.read().unwrap().clone()), (real_return.read().unwrap().clone())], _lua_debug_loc { start: (664, 34), end: (664, 95) });

_lua_nil()
}}))], _lua_debug_loc { start: (663, 19), end: (665, 13) });
}
} else {
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![_lua_lambda(Box::new({let enviroment_set_helper = enviroment_set_helper.clone();
let enviroment_helper_node_expand = enviroment_helper_node_expand.clone();
let env = env.clone();
let key = key.clone();
let val = val.clone();
let return_pointer = return_pointer.clone();
let real_return = real_return.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((enviroment_set_helper.read().unwrap().clone()), vec![_lua_call((enviroment_helper_node_expand.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (670, 16), end: (670, 50) }), (key.read().unwrap().clone()), (val.read().unwrap().clone()), (return_pointer.read().unwrap().clone()), (real_return.read().unwrap().clone())], _lua_debug_loc { start: (669, 30), end: (675, 13) });

_lua_nil()
}}))], _lua_debug_loc { start: (668, 15), end: (676, 9) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (678, 11), end: (678, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
*env_set.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let equal_p = equal_p.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (684, 18), end: (684, 22) }), _lua_debug_loc { start: (684, 14), end: (684, 22) }}).as_bool(_lua_debug_loc { start: (684, 8), end: (702, 11) }) {
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (685, 28), end: (685, 33) }}, _lua_num!(1), _lua_debug_loc { start: (685, 27), end: (685, 38) }}, _lua_debug_loc { start: (685, 23), end: (685, 38) }), (key.read().unwrap().clone())], _lua_debug_loc { start: (685, 15), end: (685, 45) })).as_bool(_lua_debug_loc { start: (685, 15), end: (685, 45) }) {
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (686, 21), end: (686, 26) }}, _lua_num!(1), _lua_debug_loc { start: (686, 20), end: (686, 31) }},(key.read().unwrap().clone()), _lua_debug_loc { start: (686, 16), end: (686, 38) });
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (687, 21), end: (687, 26) }}, _lua_num!(1), _lua_debug_loc { start: (687, 20), end: (687, 31) }},(val.read().unwrap().clone()), _lua_debug_loc { start: (687, 16), end: (687, 38) });
{
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (689, 24), end: (689, 29) }}; _lua_tmp.clone() };
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (690, 30), end: (690, 34) }), _lua_debug_loc { start: (690, 26), end: (690, 34) }}).as_bool(_lua_debug_loc { start: (690, 20), end: (694, 23) }) {
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (691, 29), end: (691, 34) }}, _lua_num!(1), _lua_debug_loc { start: (691, 28), end: (691, 39) }},_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (691, 48), end: (691, 53) }}, _lua_num!(1), _lua_debug_loc { start: (691, 47), end: (691, 58) }}, _lua_debug_loc { start: (691, 43), end: (691, 58) }), _lua_debug_loc { start: (691, 24), end: (691, 59) });
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (692, 29), end: (692, 34) }}, _lua_num!(1), _lua_debug_loc { start: (692, 28), end: (692, 39) }},_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (692, 48), end: (692, 53) }}, _lua_num!(1), _lua_debug_loc { start: (692, 47), end: (692, 58) }}, _lua_debug_loc { start: (692, 43), end: (692, 58) }), _lua_debug_loc { start: (692, 24), end: (692, 59) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (693, 28), end: (693, 33) }}; _lua_tmp.clone() };
}
}
return (ret.read().unwrap().clone());
} else {
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (698, 21), end: (698, 26) }}, _lua_num!(1), _lua_debug_loc { start: (698, 20), end: (698, 31) }},_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (698, 40), end: (698, 45) }}, _lua_num!(1), _lua_debug_loc { start: (698, 39), end: (698, 50) }}, _lua_debug_loc { start: (698, 35), end: (698, 50) }), _lua_debug_loc { start: (698, 16), end: (698, 51) });
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (699, 21), end: (699, 26) }}, _lua_num!(1), _lua_debug_loc { start: (699, 20), end: (699, 31) }},_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (699, 40), end: (699, 45) }}, _lua_num!(1), _lua_debug_loc { start: (699, 39), end: (699, 50) }}, _lua_debug_loc { start: (699, 35), end: (699, 50) }), _lua_debug_loc { start: (699, 16), end: (699, 51) });
}
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (701, 16), end: (701, 21) }}; _lua_tmp.clone() };
}
}
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (704, 9), end: (704, 13) }), _lua_num!(0), _lua_debug_loc { start: (704, 9), end: (704, 17) }}, _lua_num!(1), _lua_debug_loc { start: (704, 8), end: (704, 22) }},(key.read().unwrap().clone()), _lua_debug_loc { start: (704, 4), end: (704, 29) });
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (705, 9), end: (705, 13) }), _lua_num!(1), _lua_debug_loc { start: (705, 9), end: (705, 17) }}, _lua_num!(1), _lua_debug_loc { start: (705, 8), end: (705, 22) }},(val.read().unwrap().clone()), _lua_debug_loc { start: (705, 4), end: (705, 29) });
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*env_get.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let equal_p = equal_p.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let default_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (711, 18), end: (711, 22) }), _lua_debug_loc { start: (711, 14), end: (711, 22) }}).as_bool(_lua_debug_loc { start: (711, 8), end: (716, 11) }) {
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (712, 28), end: (712, 33) }}, _lua_num!(1), _lua_debug_loc { start: (712, 27), end: (712, 38) }}, _lua_debug_loc { start: (712, 23), end: (712, 38) }), (key.read().unwrap().clone())], _lua_debug_loc { start: (712, 15), end: (712, 45) })).as_bool(_lua_debug_loc { start: (712, 15), end: (712, 45) }) {
return _lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (713, 28), end: (713, 33) }}, _lua_num!(1), _lua_debug_loc { start: (713, 27), end: (713, 38) }}, _lua_debug_loc { start: (713, 23), end: (713, 38) });
}
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (715, 16), end: (715, 21) }}; _lua_tmp.clone() };
}
}
return (default_v.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*must_env_get.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let equal_p = equal_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (723, 18), end: (723, 22) }), _lua_debug_loc { start: (723, 14), end: (723, 22) }}).as_bool(_lua_debug_loc { start: (723, 8), end: (728, 11) }) {
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (724, 28), end: (724, 33) }}, _lua_num!(1), _lua_debug_loc { start: (724, 27), end: (724, 38) }}, _lua_debug_loc { start: (724, 23), end: (724, 38) }), (key.read().unwrap().clone())], _lua_debug_loc { start: (724, 15), end: (724, 45) })).as_bool(_lua_debug_loc { start: (724, 15), end: (724, 45) }) {
return _lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (725, 28), end: (725, 33) }}, _lua_num!(1), _lua_debug_loc { start: (725, 27), end: (725, 38) }}, _lua_debug_loc { start: (725, 23), end: (725, 38) });
}
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (727, 16), end: (727, 21) }}; _lua_tmp.clone() };
}
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (730, 11), end: (730, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
*env2val.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let null_v = null_v.clone();
let new_construction = new_construction.clone();
let new_list = new_list.clone();
let new_data = new_data.clone();
let mapping_atom = mapping_atom.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new((null_v.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (736, 18), end: (736, 22) }), _lua_debug_loc { start: (736, 14), end: (736, 22) }}).as_bool(_lua_debug_loc { start: (736, 8), end: (742, 11) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (738, 30), end: (738, 35) }}, _lua_num!(1), _lua_debug_loc { start: (738, 29), end: (738, 40) }}, _lua_debug_loc { start: (738, 25), end: (738, 40) }), _lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (738, 48), end: (738, 53) }}, _lua_num!(1), _lua_debug_loc { start: (738, 47), end: (738, 58) }}, _lua_debug_loc { start: (738, 43), end: (738, 58) })], _lua_debug_loc { start: (738, 16), end: (738, 60) }), (ret.read().unwrap().clone())], _lua_debug_loc { start: (737, 18), end: (740, 13) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (741, 16), end: (741, 21) }}; _lua_tmp.clone() };
}
}
return _lua_call((new_data.read().unwrap().clone()), vec![(mapping_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (746, 8), end: (746, 21) })], _lua_debug_loc { start: (744, 11), end: (747, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
*env_foreach.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((env.read().unwrap().clone()), _lua_debug_loc { start: (752, 18), end: (752, 22) }), _lua_debug_loc { start: (752, 14), end: (752, 22) }}).as_bool(_lua_debug_loc { start: (752, 8), end: (755, 11) }) {
_lua_call((f.read().unwrap().clone()), vec![_lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (753, 19), end: (753, 24) }}, _lua_num!(1), _lua_debug_loc { start: (753, 18), end: (753, 29) }}, _lua_debug_loc { start: (753, 14), end: (753, 29) }), _lua_lookup((env.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (753, 37), end: (753, 42) }}, _lua_num!(1), _lua_debug_loc { start: (753, 36), end: (753, 47) }}, _lua_debug_loc { start: (753, 32), end: (753, 47) })], _lua_debug_loc { start: (753, 12), end: (753, 49) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (754, 16), end: (754, 21) }}; _lua_tmp.clone() };
}
}

_lua_nil()
}})); _lua_tmp.clone() };
*real_evaluate.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let evaluate_function_builtin_systemName = evaluate_function_builtin_systemName.clone();
let env2val = env2val.clone();
let construction_p = construction_p.clone();
let unlazy_list_1_keepcomment = unlazy_list_1_keepcomment.clone();
let error = error.clone();
let equal_p = equal_p.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let builtin_form_apply = builtin_form_apply.clone();
let form_use_systemName = form_use_systemName.clone();
let force_all = force_all.clone();
let evaluate = evaluate.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let form_atom = form_atom.clone();
let data_list = data_list.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let apply = apply.clone();
let builtin_func_apply = builtin_func_apply.clone();
let name_unlazy1_p3 = name_unlazy1_p3.clone();
let env_get = env_get.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force1.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (759, 14), end: (759, 25) })));
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (760, 7), end: (760, 22) })).as_bool(_lua_debug_loc { start: (760, 7), end: (760, 22) }) {
return (selfvalraw.read().unwrap().clone());
}
let error_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*error_v.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let evaluate_function_builtin_systemName = evaluate_function_builtin_systemName.clone();
let env2val = env2val.clone();
let env = env.clone();
let x = x.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((new_error.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_builtin_use_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(evaluate_function_builtin_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (770, 20), end: (770, 32) }), (x.read().unwrap().clone())], _lua_debug_loc { start: (769, 16), end: (772, 17) })], _lua_debug_loc { start: (767, 12), end: (773, 13) })], _lua_debug_loc { start: (765, 8), end: (774, 9) })], _lua_debug_loc { start: (763, 36), end: (775, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (776, 7), end: (776, 24) })).as_bool(_lua_debug_loc { start: (776, 7), end: (776, 24) }) {
return _lua_call((unlazy_list_1_keepcomment.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (error_v.read().unwrap().clone()), _lua_lambda(Box::new({let selfvalraw = selfvalraw.clone();
move |mut _lua_arg_tmp, _| {
return (selfvalraw.read().unwrap().clone());

_lua_nil()
}})), _lua_lambda(Box::new({let error = error.clone();
let equal_p = equal_p.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let error_v = error_v.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let builtin_form_apply = builtin_form_apply.clone();
let env = env.clone();
let form_use_systemName = form_use_systemName.clone();
let force_all = force_all.clone();
let evaluate = evaluate.clone();
let data_p = data_p.clone();
let force1 = force1.clone();
let data_name = data_name.clone();
let delay_just_p = delay_just_p.clone();
let selfvalraw = selfvalraw.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let form_atom = form_atom.clone();
let data_list = data_list.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let env2val = env2val.clone();
let apply = apply.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let builtin_func_apply = builtin_func_apply.clone();
move |mut _lua_arg_tmp, _| {
let comments = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{not_eq, _lua_len((comments.read().unwrap().clone()), _lua_debug_loc { start: (782, 19), end: (782, 28) }), _lua_num!(0), _lua_debug_loc { start: (782, 19), end: (782, 33) }}).as_bool(_lua_debug_loc { start: (782, 19), end: (782, 33) }) {
_lua_call((error.read().unwrap().clone()), vec![_lua_str("WIP")], _lua_debug_loc { start: (783, 20), end: (783, 32) });
}
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (785, 27), end: (785, 31) }), (form_builtin_use_systemName.read().unwrap().clone())], _lua_debug_loc { start: (785, 19), end: (785, 62) })).as_bool(_lua_debug_loc { start: (785, 19), end: (785, 62) }) {
if (_lua_op!{eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (786, 23), end: (786, 26) }), _lua_num!(1), _lua_debug_loc { start: (786, 23), end: (786, 31) }}).as_bool(_lua_debug_loc { start: (786, 23), end: (786, 31) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (787, 31), end: (787, 40) });
}
let f = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (789, 30), end: (789, 34) })));
let args = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(2)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (793, 34), end: (793, 37) }), _lua_debug_loc { start: (793, 30), end: (793, 37) }}).as_bool(_lua_debug_loc { start: (793, 24), end: (796, 27) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (794, 53), end: (794, 58) }}, _lua_debug_loc { start: (794, 50), end: (794, 58) })], _lua_debug_loc { start: (794, 28), end: (794, 60) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (795, 32), end: (795, 37) }}; _lua_tmp.clone() };
}
}
return _lua_call((builtin_form_apply.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (f.read().unwrap().clone()), (args.read().unwrap().clone())], _lua_debug_loc { start: (798, 27), end: (798, 59) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (799, 31), end: (799, 35) }), (form_use_systemName.read().unwrap().clone())], _lua_debug_loc { start: (799, 23), end: (799, 58) })).as_bool(_lua_debug_loc { start: (799, 23), end: (799, 58) }) {
if (_lua_op!{eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (800, 23), end: (800, 26) }), _lua_num!(1), _lua_debug_loc { start: (800, 23), end: (800, 31) }}).as_bool(_lua_debug_loc { start: (800, 23), end: (800, 31) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (801, 31), end: (801, 40) });
}
let f = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (804, 38), end: (804, 42) })], _lua_debug_loc { start: (804, 24), end: (804, 44) })], _lua_debug_loc { start: (803, 30), end: (805, 21) })));
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (806, 27), end: (806, 36) }), _lua_debug_loc { start: (806, 23), end: (806, 36) })).as_bool(_lua_debug_loc { start: (806, 23), end: (806, 36) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (807, 31), end: (807, 40) });
}
let f_type = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force1.read().unwrap().clone()), vec![_lua_call((data_name.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (810, 24), end: (810, 36) })], _lua_debug_loc { start: (809, 35), end: (811, 21) })));
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(f_type.read().unwrap().clone())], _lua_debug_loc { start: (812, 23), end: (812, 43) })).as_bool(_lua_debug_loc { start: (812, 23), end: (812, 43) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(f_type.read().unwrap().clone())], _lua_debug_loc { start: (815, 27), end: (815, 41) }), _lua_debug_loc { start: (815, 23), end: (815, 41) })).as_bool(_lua_debug_loc { start: (815, 23), end: (815, 41) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (816, 31), end: (816, 40) });
}
if (_lua_not(_lua_call((atom_equal_p.read().unwrap().clone()), vec![(f_type.read().unwrap().clone()), (form_atom.read().unwrap().clone())], _lua_debug_loc { start: (818, 27), end: (818, 58) }), _lua_debug_loc { start: (818, 23), end: (818, 58) })).as_bool(_lua_debug_loc { start: (818, 23), end: (818, 58) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (819, 31), end: (819, 40) });
}
let f_list = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force1.read().unwrap().clone()), vec![_lua_call((data_list.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (822, 24), end: (822, 36) })], _lua_debug_loc { start: (821, 35), end: (823, 21) })));
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (824, 23), end: (824, 43) })).as_bool(_lua_debug_loc { start: (824, 23), end: (824, 43) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (827, 27), end: (827, 49) }), _lua_debug_loc { start: (827, 23), end: (827, 49) })).as_bool(_lua_debug_loc { start: (827, 23), end: (827, 49) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (828, 31), end: (828, 40) });
}
let f_x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (830, 32), end: (830, 57) })));
let f_list_cdr = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force1.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (832, 24), end: (832, 49) })], _lua_debug_loc { start: (831, 39), end: (833, 21) })));
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(f_list_cdr.read().unwrap().clone())], _lua_debug_loc { start: (834, 23), end: (834, 47) })).as_bool(_lua_debug_loc { start: (834, 23), end: (834, 47) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(f_list_cdr.read().unwrap().clone())], _lua_debug_loc { start: (837, 27), end: (837, 45) }), _lua_debug_loc { start: (837, 23), end: (837, 45) })).as_bool(_lua_debug_loc { start: (837, 23), end: (837, 45) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (838, 31), end: (838, 40) });
}
let args = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![_lua_call((env2val.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (841, 24), end: (841, 36) })])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(2)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (845, 34), end: (845, 37) }), _lua_debug_loc { start: (845, 30), end: (845, 37) }}).as_bool(_lua_debug_loc { start: (845, 24), end: (848, 27) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (846, 53), end: (846, 58) }}, _lua_debug_loc { start: (846, 50), end: (846, 58) })], _lua_debug_loc { start: (846, 28), end: (846, 60) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (847, 32), end: (847, 37) }}; _lua_tmp.clone() };
}
}
return _lua_call((apply.read().unwrap().clone()), vec![(f_x.read().unwrap().clone()), (args.read().unwrap().clone())], _lua_debug_loc { start: (850, 27), end: (850, 43) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (851, 31), end: (851, 35) }), (function_builtin_use_systemName.read().unwrap().clone())], _lua_debug_loc { start: (851, 23), end: (851, 70) })).as_bool(_lua_debug_loc { start: (851, 23), end: (851, 70) }) {
if (_lua_op!{eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (852, 23), end: (852, 26) }), _lua_num!(1), _lua_debug_loc { start: (852, 23), end: (852, 31) }}).as_bool(_lua_debug_loc { start: (852, 23), end: (852, 31) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (853, 31), end: (853, 40) });
}
let f = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (855, 30), end: (855, 34) })));
let args = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(2)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (859, 34), end: (859, 37) }), _lua_debug_loc { start: (859, 30), end: (859, 37) }}).as_bool(_lua_debug_loc { start: (859, 24), end: (865, 27) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args.read().unwrap().clone()), _lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (862, 49), end: (862, 54) }}, _lua_debug_loc { start: (862, 46), end: (862, 54) })], _lua_debug_loc { start: (862, 32), end: (862, 56) })], _lua_debug_loc { start: (860, 28), end: (863, 29) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (864, 32), end: (864, 37) }}; _lua_tmp.clone() };
}
}
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (args.read().unwrap().clone())], _lua_debug_loc { start: (867, 27), end: (867, 54) });
} else {
let f = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (869, 44), end: (869, 48) })], _lua_debug_loc { start: (869, 30), end: (869, 50) })));
let args = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(1)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (873, 34), end: (873, 37) }), _lua_debug_loc { start: (873, 30), end: (873, 37) }}).as_bool(_lua_debug_loc { start: (873, 24), end: (879, 27) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args.read().unwrap().clone()), _lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (876, 49), end: (876, 54) }}, _lua_debug_loc { start: (876, 46), end: (876, 54) })], _lua_debug_loc { start: (876, 32), end: (876, 56) })], _lua_debug_loc { start: (874, 28), end: (877, 29) });
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (878, 32), end: (878, 37) }}; _lua_tmp.clone() };
}
}
return _lua_call((apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (args.read().unwrap().clone())], _lua_debug_loc { start: (881, 27), end: (881, 41) });
}

_lua_nil()
}}))], _lua_debug_loc { start: (777, 15), end: (884, 9) });
} else if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (885, 11), end: (885, 20) })).as_bool(_lua_debug_loc { start: (885, 11), end: (885, 20) }) {
return (x.read().unwrap().clone());
}
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((name_unlazy1_p3.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (888, 14), end: (888, 32) })));
if (_lua_op!{eq, (r.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (889, 7), end: (889, 15) }}).as_bool(_lua_debug_loc { start: (889, 7), end: (889, 15) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_op!{eq, (r.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (892, 7), end: (892, 16) }}).as_bool(_lua_debug_loc { start: (892, 7), end: (892, 16) }) {
return _lua_call((env_get.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (x.read().unwrap().clone()), _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (896, 12), end: (896, 21) })], _lua_debug_loc { start: (893, 15), end: (897, 9) });
}
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (899, 11), end: (899, 20) });

_lua_nil()
}})); _lua_tmp.clone() };
*real_apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let apply_function_builtin_systemName = apply_function_builtin_systemName.clone();
let jsArray_to_list = jsArray_to_list.clone();
let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let data_p = data_p.clone();
let force_all = force_all.clone();
let data_name = data_name.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let function_atom = function_atom.clone();
let data_list = data_list.clone();
let construction_p = construction_p.clone();
let force_all_rec = force_all_rec.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let env_null_v = env_null_v.clone();
let name_unlazy1_p3 = name_unlazy1_p3.clone();
let null_v = null_v.clone();
let new_construction = new_construction.clone();
let env_set = env_set.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*error_v.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let apply_function_builtin_systemName = apply_function_builtin_systemName.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((new_error.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_builtin_use_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(apply_function_builtin_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(f.read().unwrap().clone()), _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (910, 20), end: (910, 39) })], _lua_debug_loc { start: (908, 16), end: (911, 17) })], _lua_debug_loc { start: (906, 12), end: (912, 13) })], _lua_debug_loc { start: (904, 8), end: (913, 9) })], _lua_debug_loc { start: (902, 36), end: (914, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
*f.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (915, 8), end: (915, 17) }); _lua_tmp.clone() };
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (916, 7), end: (916, 22) })).as_bool(_lua_debug_loc { start: (916, 7), end: (916, 22) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (919, 11), end: (919, 20) }), _lua_debug_loc { start: (919, 7), end: (919, 20) })).as_bool(_lua_debug_loc { start: (919, 7), end: (919, 20) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (920, 15), end: (920, 24) });
}
let f_type = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((data_name.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (923, 8), end: (923, 20) })], _lua_debug_loc { start: (922, 19), end: (924, 5) })));
if (_lua_not(_lua_op!{and, _lua_call((atom_p.read().unwrap().clone()), vec![(f_type.read().unwrap().clone())], _lua_debug_loc { start: (925, 12), end: (925, 26) }), _lua_call((atom_equal_p.read().unwrap().clone()), vec![(f_type.read().unwrap().clone()), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (925, 31), end: (925, 66) }), _lua_debug_loc { start: (925, 12), end: (925, 66) }}, _lua_debug_loc { start: (925, 7), end: (925, 67) })).as_bool(_lua_debug_loc { start: (925, 7), end: (925, 67) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (926, 15), end: (926, 24) });
}
let f_list = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((data_list.read().unwrap().clone()), vec![(f.read().unwrap().clone())], _lua_debug_loc { start: (929, 8), end: (929, 20) })], _lua_debug_loc { start: (928, 19), end: (930, 5) })));
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (931, 11), end: (931, 33) }), _lua_debug_loc { start: (931, 7), end: (931, 33) })).as_bool(_lua_debug_loc { start: (931, 7), end: (931, 33) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (932, 15), end: (932, 24) });
}
let args_pat = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all_rec.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (935, 8), end: (935, 33) })], _lua_debug_loc { start: (934, 21), end: (936, 5) })));
let f_list_cdr = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(f_list.read().unwrap().clone())], _lua_debug_loc { start: (938, 8), end: (938, 33) })], _lua_debug_loc { start: (937, 23), end: (939, 5) })));
if (_lua_not(_lua_op!{and, _lua_call((construction_p.read().unwrap().clone()), vec![(f_list_cdr.read().unwrap().clone())], _lua_debug_loc { start: (940, 12), end: (940, 38) }), _lua_call((null_p.read().unwrap().clone()), vec![_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(f_list_cdr.read().unwrap().clone())], _lua_debug_loc { start: (942, 12), end: (942, 41) })], _lua_debug_loc { start: (941, 8), end: (943, 9) })], _lua_debug_loc { start: (940, 43), end: (944, 5) }), _lua_debug_loc { start: (940, 12), end: (944, 5) }}, _lua_debug_loc { start: (940, 7), end: (944, 6) })).as_bool(_lua_debug_loc { start: (940, 7), end: (944, 6) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (945, 15), end: (945, 24) });
}
let f_code = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(f_list_cdr.read().unwrap().clone())], _lua_debug_loc { start: (947, 19), end: (947, 48) })));
let env = std::sync::Arc::new(std::sync::RwLock::new((env_null_v.read().unwrap().clone())));
let xs_i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (950, 14), end: (950, 30) }), _lua_debug_loc { start: (950, 10), end: (950, 30) })).as_bool(_lua_debug_loc { start: (950, 4), end: (983, 7) }) {
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((name_unlazy1_p3.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (951, 18), end: (951, 43) })));
if (_lua_op!{eq, (r.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (952, 11), end: (952, 19) }}).as_bool(_lua_debug_loc { start: (952, 11), end: (952, 19) }) {
return (selfvalraw.read().unwrap().clone());
}
if (_lua_op!{eq, (r.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (955, 11), end: (955, 20) }}).as_bool(_lua_debug_loc { start: (955, 11), end: (955, 20) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new((null_v.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (958, 26), end: (958, 29) }), _lua_num!(1), _lua_debug_loc { start: (958, 26), end: (958, 33) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), (xs_i.read().unwrap().clone()), _lua_debug_loc { start: (959, 22), end: (959, 31) }}).as_bool(_lua_debug_loc { start: (959, 16), end: (962, 19) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((new_construction.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (960, 44), end: (960, 49) }}, _lua_debug_loc { start: (960, 41), end: (960, 49) }), (x.read().unwrap().clone())], _lua_debug_loc { start: (960, 24), end: (960, 54) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (961, 24), end: (961, 29) }}; _lua_tmp.clone() };
}
}
*env.write().unwrap() = { let _lua_tmp = _lua_call((env_set.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (args_pat.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (964, 18), end: (964, 43) }); _lua_tmp.clone() };
*xs_i.write().unwrap() = { let _lua_tmp = _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (965, 19), end: (965, 22) }); _lua_tmp.clone() };
*args_pat.write().unwrap() = { let _lua_tmp = (null_v.read().unwrap().clone()); _lua_tmp.clone() };
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (967, 15), end: (967, 39) })).as_bool(_lua_debug_loc { start: (967, 15), end: (967, 39) }) {
if (_lua_op!{less, (xs_i.read().unwrap().clone()), _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (968, 22), end: (968, 25) }), _lua_debug_loc { start: (968, 15), end: (968, 25) }}).as_bool(_lua_debug_loc { start: (968, 15), end: (968, 25) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((xs.read().unwrap().clone()),_lua_op!{add, (xs_i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (969, 29), end: (969, 37) }}, _lua_debug_loc { start: (969, 26), end: (969, 37) })));
*xs_i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (xs_i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (970, 23), end: (970, 31) }}; _lua_tmp.clone() };
*env.write().unwrap() = { let _lua_tmp = _lua_call((env_set.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (973, 20), end: (973, 47) }), (x.read().unwrap().clone())], _lua_debug_loc { start: (971, 22), end: (975, 17) }); _lua_tmp.clone() };
*args_pat.write().unwrap() = { let _lua_tmp = _lua_call((construction_tail.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (976, 27), end: (976, 54) }); _lua_tmp.clone() };
} else {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (978, 23), end: (978, 32) });
}
} else {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (981, 19), end: (981, 28) });
}
}
if (_lua_op!{not_eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (984, 7), end: (984, 10) }), (xs_i.read().unwrap().clone()), _lua_debug_loc { start: (984, 7), end: (984, 18) }}).as_bool(_lua_debug_loc { start: (984, 7), end: (984, 18) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (985, 15), end: (985, 24) });
}
return _lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (f_code.read().unwrap().clone())], _lua_debug_loc { start: (987, 11), end: (987, 32) });

_lua_nil()
}})); _lua_tmp.clone() };
*real_builtin_func_apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let jsArray_to_list = jsArray_to_list.clone();
let equal_p = equal_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
let real_builtin_func_apply_s = real_builtin_func_apply_s.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*error_v.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((new_error.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_builtin_use_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(f.read().unwrap().clone()), _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (996, 16), end: (996, 35) })], _lua_debug_loc { start: (994, 12), end: (997, 13) })], _lua_debug_loc { start: (992, 8), end: (998, 9) })], _lua_debug_loc { start: (990, 36), end: (999, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
for (_lua_tmp_k, _lua_tmp_v) in (real_builtin_func_apply_s.read().unwrap().clone()).as_table(_lua_debug_loc { start: (1000, 27), end: (1000, 52) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let xx=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), _lua_lookup((xx.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1001, 22), end: (1001, 26) })], _lua_debug_loc { start: (1001, 11), end: (1001, 28) })).as_bool(_lua_debug_loc { start: (1001, 11), end: (1001, 28) }) {
if (_lua_op!{not_eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (1002, 15), end: (1002, 18) }), _lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1002, 22), end: (1002, 26) }), _lua_debug_loc { start: (1002, 15), end: (1002, 27) }}).as_bool(_lua_debug_loc { start: (1002, 15), end: (1002, 27) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1003, 23), end: (1003, 32) });
}
if (_lua_op!{eq, _lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1005, 15), end: (1005, 19) }), _lua_num!(1), _lua_debug_loc { start: (1005, 15), end: (1005, 25) }}).as_bool(_lua_debug_loc { start: (1005, 15), end: (1005, 25) }) {
return _lua_call(_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1006, 23), end: (1006, 56) }), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1006, 29), end: (1006, 33) }), (error_v.read().unwrap().clone()), (selfvalraw.read().unwrap().clone())], _lua_debug_loc { start: (1006, 23), end: (1006, 56) });
} else if (_lua_op!{eq, _lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1007, 19), end: (1007, 23) }), _lua_num!(2), _lua_debug_loc { start: (1007, 19), end: (1007, 29) }}).as_bool(_lua_debug_loc { start: (1007, 19), end: (1007, 29) }) {
return _lua_call(_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1008, 23), end: (1008, 63) }), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1008, 29), end: (1008, 33) }), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1008, 36), end: (1008, 40) }), (error_v.read().unwrap().clone()), (selfvalraw.read().unwrap().clone())], _lua_debug_loc { start: (1008, 23), end: (1008, 63) });
} else if (_lua_op!{eq, _lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1009, 19), end: (1009, 23) }), _lua_num!(3), _lua_debug_loc { start: (1009, 19), end: (1009, 29) }}).as_bool(_lua_debug_loc { start: (1009, 19), end: (1009, 29) }) {
return _lua_call(_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1010, 23), end: (1010, 70) }), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1010, 29), end: (1010, 33) }), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1010, 36), end: (1010, 40) }), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1010, 43), end: (1010, 47) }), (error_v.read().unwrap().clone()), (selfvalraw.read().unwrap().clone())], _lua_debug_loc { start: (1010, 23), end: (1010, 70) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1012, 19), end: (1012, 31) });
}
}
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1015, 11), end: (1015, 20) });

_lua_nil()
}})); _lua_tmp.clone() };
*real_builtin_form_apply.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let env2val = env2val.clone();
let jsArray_to_list = jsArray_to_list.clone();
let equal_p = equal_p.clone();
let quote_form_builtin_systemName = quote_form_builtin_systemName.clone();
let lambda_form_builtin_systemName = lambda_form_builtin_systemName.clone();
let new_lambda = new_lambda.clone();
let comment_form_builtin_systemName = comment_form_builtin_systemName.clone();
let new_comment = new_comment.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*error_v.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let env2val = env2val.clone();
let env = env.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((new_error.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(form_builtin_use_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (1023, 16), end: (1023, 28) }), (f.read().unwrap().clone()), _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1025, 16), end: (1025, 35) })], _lua_debug_loc { start: (1022, 12), end: (1026, 13) })], _lua_debug_loc { start: (1020, 8), end: (1027, 9) })], _lua_debug_loc { start: (1018, 36), end: (1028, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (quote_form_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (1029, 7), end: (1029, 48) })).as_bool(_lua_debug_loc { start: (1029, 7), end: (1029, 48) }) {
if (_lua_op!{not_eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (1030, 11), end: (1030, 14) }), _lua_num!(1), _lua_debug_loc { start: (1030, 11), end: (1030, 19) }}).as_bool(_lua_debug_loc { start: (1030, 11), end: (1030, 19) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1031, 19), end: (1031, 28) });
}
return _lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1033, 15), end: (1033, 19) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (lambda_form_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (1034, 11), end: (1034, 53) })).as_bool(_lua_debug_loc { start: (1034, 11), end: (1034, 53) }) {
if (_lua_op!{not_eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (1035, 11), end: (1035, 14) }), _lua_num!(2), _lua_debug_loc { start: (1035, 11), end: (1035, 19) }}).as_bool(_lua_debug_loc { start: (1035, 11), end: (1035, 19) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1036, 19), end: (1036, 28) });
}
return _lua_call((new_lambda.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1038, 31), end: (1038, 35) }), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1038, 38), end: (1038, 42) }), (error_v.read().unwrap().clone())], _lua_debug_loc { start: (1038, 15), end: (1038, 53) });
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (comment_form_builtin_systemName.read().unwrap().clone())], _lua_debug_loc { start: (1039, 11), end: (1039, 54) })).as_bool(_lua_debug_loc { start: (1039, 11), end: (1039, 54) }) {
if (_lua_op!{not_eq, _lua_len((xs.read().unwrap().clone()), _lua_debug_loc { start: (1040, 11), end: (1040, 14) }), _lua_num!(2), _lua_debug_loc { start: (1040, 11), end: (1040, 19) }}).as_bool(_lua_debug_loc { start: (1040, 11), end: (1040, 19) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1041, 19), end: (1041, 28) });
}
return _lua_call((new_comment.read().unwrap().clone()), vec![_lua_lookup((xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1044, 12), end: (1044, 16) }), _lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1045, 26), end: (1045, 30) })], _lua_debug_loc { start: (1045, 12), end: (1045, 32) })], _lua_debug_loc { start: (1043, 15), end: (1046, 9) });
}
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1048, 11), end: (1048, 20) });

_lua_nil()
}})); _lua_tmp.clone() };
*make_quote.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_list = new_list.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let quote_form_builtin_systemName = quote_form_builtin_systemName.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_list.read().unwrap().clone()), vec![(form_builtin_use_systemName.read().unwrap().clone()), (quote_form_builtin_systemName.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (1051, 11), end: (1051, 82) });

_lua_nil()
}})); _lua_tmp.clone() };
*new_lambda.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let unlazy_all_rec = unlazy_all_rec.clone();
let null_p = null_p.clone();
let name_unlazy1_p3 = name_unlazy1_p3.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let null_v = null_v.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let jsArray_to_list = jsArray_to_list.clone();
let env_foreach = env_foreach.clone();
let equal_p = equal_p.clone();
let new_construction = new_construction.clone();
let make_quote = make_quote.clone();
let must_env_get = must_env_get.clone();
let new_data = new_data.clone();
let function_atom = function_atom.clone();
let new_list = new_list.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let args_pat = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let body = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*args_pat.write().unwrap() = { let _lua_tmp = _lua_call((unlazy_all_rec.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone())], _lua_debug_loc { start: (1054, 15), end: (1054, 39) }); _lua_tmp.clone() };
let args_pat_vars = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let args_pat_is_dot = std::sync::Arc::new(std::sync::RwLock::new(_lua_false()));
let args_pat_iter = std::sync::Arc::new(std::sync::RwLock::new((args_pat.read().unwrap().clone())));
while (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1058, 14), end: (1058, 35) }), _lua_debug_loc { start: (1058, 10), end: (1058, 35) })).as_bool(_lua_debug_loc { start: (1058, 4), end: (1074, 7) }) {
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((name_unlazy1_p3.read().unwrap().clone()), vec![(args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1059, 18), end: (1059, 48) })));
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{not_eq, (r.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (1060, 20), end: (1060, 28) }}], _lua_debug_loc { start: (1060, 8), end: (1060, 29) });
if ((r.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (1061, 11), end: (1061, 12) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args_pat_vars.read().unwrap().clone()), (args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1062, 12), end: (1062, 57) });
*args_pat_is_dot.write().unwrap() = { let _lua_tmp = _lua_true(); _lua_tmp.clone() };
*args_pat_iter.write().unwrap() = { let _lua_tmp = (null_v.read().unwrap().clone()); _lua_tmp.clone() };
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1065, 15), end: (1065, 44) })).as_bool(_lua_debug_loc { start: (1065, 15), end: (1065, 44) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(args_pat_vars.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1068, 16), end: (1068, 48) })], _lua_debug_loc { start: (1066, 12), end: (1069, 13) });
*args_pat_iter.write().unwrap() = { let _lua_tmp = _lua_call((construction_tail.read().unwrap().clone()), vec![(args_pat_iter.read().unwrap().clone())], _lua_debug_loc { start: (1070, 28), end: (1070, 60) }); _lua_tmp.clone() };
} else {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1072, 19), end: (1072, 28) });
}
}
let args_pat_vars_val = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
if ((args_pat_is_dot.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (1076, 7), end: (1076, 22) }) {
*args_pat_vars_val.write().unwrap() = { let _lua_tmp = _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(args_pat_vars.read().unwrap().clone())], _lua_debug_loc { start: (1077, 28), end: (1077, 58) }); _lua_tmp.clone() };
} else {
*args_pat_vars_val.write().unwrap() = { let _lua_tmp = (args_pat.read().unwrap().clone()); _lua_tmp.clone() };
}
let env_vars = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
_lua_call((env_foreach.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lambda(Box::new({let args_pat_vars = args_pat_vars.clone();
let equal_p = equal_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let env_vars = env_vars.clone();
move |mut _lua_arg_tmp, _| {
let k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((args_pat_vars.read().unwrap().clone()), _lua_debug_loc { start: (1087, 26), end: (1087, 40) }), _lua_debug_loc { start: (1087, 22), end: (1087, 40) }}).as_bool(_lua_debug_loc { start: (1087, 16), end: (1092, 19) }) {
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((args_pat_vars.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1088, 45), end: (1088, 50) }}, _lua_debug_loc { start: (1088, 31), end: (1088, 50) }), (k.read().unwrap().clone())], _lua_debug_loc { start: (1088, 23), end: (1088, 55) })).as_bool(_lua_debug_loc { start: (1088, 23), end: (1088, 55) }) {
return _lua_nil();
}
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1091, 24), end: (1091, 29) }}; _lua_tmp.clone() };
}
}
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(env_vars.read().unwrap().clone()), (k.read().unwrap().clone())], _lua_debug_loc { start: (1094, 12), end: (1094, 40) });

_lua_nil()
}}))], _lua_debug_loc { start: (1082, 4), end: (1096, 5) });
let new_args_pat = std::sync::Arc::new(std::sync::RwLock::new((args_pat_vars_val.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((env_vars.read().unwrap().clone()), _lua_debug_loc { start: (1099, 18), end: (1099, 27) }), _lua_num!(1), _lua_debug_loc { start: (1099, 18), end: (1099, 31) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (1100, 14), end: (1100, 20) }}).as_bool(_lua_debug_loc { start: (1100, 8), end: (1103, 11) }) {
*new_args_pat.write().unwrap() = { let _lua_tmp = _lua_call((new_construction.read().unwrap().clone()), vec![_lua_lookup((env_vars.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1101, 53), end: (1101, 58) }}, _lua_debug_loc { start: (1101, 44), end: (1101, 58) }), (new_args_pat.read().unwrap().clone())], _lua_debug_loc { start: (1101, 27), end: (1101, 74) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1102, 16), end: (1102, 21) }}; _lua_tmp.clone() };
}
}
let new_args = std::sync::Arc::new(std::sync::RwLock::new((args_pat_vars_val.read().unwrap().clone())));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_op!{sub, _lua_len((env_vars.read().unwrap().clone()), _lua_debug_loc { start: (1107, 18), end: (1107, 27) }), _lua_num!(1), _lua_debug_loc { start: (1107, 18), end: (1107, 31) }}));
while (_lua_op!{greater_eq, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (1108, 14), end: (1108, 20) }}).as_bool(_lua_debug_loc { start: (1108, 8), end: (1116, 11) }) {
*new_args.write().unwrap() = { let _lua_tmp = _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((make_quote.read().unwrap().clone()), vec![_lua_call((must_env_get.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_lookup((env_vars.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1111, 47), end: (1111, 52) }}, _lua_debug_loc { start: (1111, 38), end: (1111, 52) })], _lua_debug_loc { start: (1111, 20), end: (1111, 54) })], _lua_debug_loc { start: (1110, 16), end: (1112, 17) }), (new_args.read().unwrap().clone())], _lua_debug_loc { start: (1109, 23), end: (1114, 13) }); _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1115, 16), end: (1115, 21) }}; _lua_tmp.clone() };
}
}
return _lua_call((new_data.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(args_pat.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((make_quote.read().unwrap().clone()), vec![_lua_call((new_data.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(new_args_pat.read().unwrap().clone()), (body.read().unwrap().clone())], _lua_debug_loc { start: (1126, 24), end: (1126, 52) })], _lua_debug_loc { start: (1124, 20), end: (1127, 21) })], _lua_debug_loc { start: (1123, 16), end: (1128, 17) }), (new_args.read().unwrap().clone())], _lua_debug_loc { start: (1122, 12), end: (1130, 13) })], _lua_debug_loc { start: (1120, 8), end: (1131, 9) })], _lua_debug_loc { start: (1118, 11), end: (1132, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
*jsbool_equal_p_inner.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all = force_all.clone();
let jsbool_equal_p_inner = jsbool_equal_p_inner.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
let comment_p = comment_p.clone();
let un_comment_all = un_comment_all.clone();
let null_p = null_p.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1135, 7), end: (1135, 13) }}).as_bool(_lua_debug_loc { start: (1135, 7), end: (1135, 13) }) {
return _lua_true();
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1138, 8), end: (1138, 20) }); _lua_tmp.clone() };
*y.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1139, 8), end: (1139, 20) }); _lua_tmp.clone() };
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1140, 7), end: (1140, 13) }}).as_bool(_lua_debug_loc { start: (1140, 7), end: (1140, 13) }) {
return _lua_true();
}
let end_2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*end_2.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let jsbool_equal_p_inner = jsbool_equal_p_inner.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let r1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((jsbool_equal_p_inner.read().unwrap().clone()), vec![_lua_call((f1.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1145, 12), end: (1145, 18) }), _lua_call((f1.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1146, 12), end: (1146, 18) })], _lua_debug_loc { start: (1144, 19), end: (1147, 9) })));
let r2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((jsbool_equal_p_inner.read().unwrap().clone()), vec![_lua_call((f2.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1149, 12), end: (1149, 18) }), _lua_call((f2.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1150, 12), end: (1150, 18) })], _lua_debug_loc { start: (1148, 19), end: (1151, 9) })));
if (_lua_op!{and, _lua_op!{eq, (r1.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (1152, 11), end: (1152, 36) }}, _lua_op!{eq, (r2.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (1152, 26), end: (1152, 36) }}, _lua_debug_loc { start: (1152, 11), end: (1152, 36) }}).as_bool(_lua_debug_loc { start: (1152, 11), end: (1152, 36) }) {
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(xx.read().unwrap().clone()), (yy.read().unwrap().clone())], _lua_debug_loc { start: (1153, 12), end: (1153, 44) });
return _lua_true();
} else if (_lua_op!{and, _lua_op!{not_eq, (r1.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (1155, 15), end: (1155, 42) }}, _lua_op!{not_eq, (r2.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (1155, 31), end: (1155, 42) }}, _lua_debug_loc { start: (1155, 15), end: (1155, 42) }}).as_bool(_lua_debug_loc { start: (1155, 15), end: (1155, 42) }) {
return _lua_nil();
} else {
return _lua_false();
}

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1161, 7), end: (1161, 19) })).as_bool(_lua_debug_loc { start: (1161, 7), end: (1161, 19) }) {
let x2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((un_comment_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1162, 19), end: (1162, 36) })));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((jsbool_equal_p_inner.read().unwrap().clone()), vec![(x2.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1163, 20), end: (1163, 47) })));
if (_lua_op!{eq, (ret.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (1164, 11), end: (1164, 22) }}).as_bool(_lua_debug_loc { start: (1164, 11), end: (1164, 22) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_nil(); _lua_tmp.clone() };
}
return (ret.read().unwrap().clone());
} else if (_lua_call((comment_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1168, 11), end: (1168, 23) })).as_bool(_lua_debug_loc { start: (1168, 11), end: (1168, 23) }) {
let y2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((un_comment_all.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1169, 19), end: (1169, 36) })));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((jsbool_equal_p_inner.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y2.read().unwrap().clone())], _lua_debug_loc { start: (1170, 20), end: (1170, 47) })));
if (_lua_op!{eq, (ret.read().unwrap().clone()), _lua_true(), _lua_debug_loc { start: (1171, 11), end: (1171, 22) }}).as_bool(_lua_debug_loc { start: (1171, 11), end: (1171, 22) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_nil(); _lua_tmp.clone() };
}
return (ret.read().unwrap().clone());
} else if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1175, 11), end: (1175, 20) })).as_bool(_lua_debug_loc { start: (1175, 11), end: (1175, 20) }) {
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1176, 15), end: (1176, 24) }), _lua_debug_loc { start: (1176, 11), end: (1176, 24) })).as_bool(_lua_debug_loc { start: (1176, 11), end: (1176, 24) }) {
return _lua_false();
}
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1179, 8), end: (1179, 38) });
return _lua_true();
} else if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1181, 11), end: (1181, 20) })).as_bool(_lua_debug_loc { start: (1181, 11), end: (1181, 20) }) {
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1182, 15), end: (1182, 24) }), _lua_debug_loc { start: (1182, 11), end: (1182, 24) })).as_bool(_lua_debug_loc { start: (1182, 11), end: (1182, 24) }) {
return _lua_false();
}
return _lua_call((atom_equal_p.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1185, 15), end: (1185, 33) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1186, 11), end: (1186, 28) })).as_bool(_lua_debug_loc { start: (1186, 11), end: (1186, 28) }) {
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1187, 15), end: (1187, 32) }), _lua_debug_loc { start: (1187, 11), end: (1187, 32) })).as_bool(_lua_debug_loc { start: (1187, 11), end: (1187, 32) }) {
return _lua_false();
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (construction_head.read().unwrap().clone()), (construction_tail.read().unwrap().clone())], _lua_debug_loc { start: (1190, 15), end: (1190, 64) });
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1191, 11), end: (1191, 20) })).as_bool(_lua_debug_loc { start: (1191, 11), end: (1191, 20) }) {
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1192, 15), end: (1192, 24) }), _lua_debug_loc { start: (1192, 11), end: (1192, 24) })).as_bool(_lua_debug_loc { start: (1192, 11), end: (1192, 24) }) {
return _lua_false();
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (data_name.read().unwrap().clone()), (data_list.read().unwrap().clone())], _lua_debug_loc { start: (1195, 15), end: (1195, 48) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1197, 11), end: (1197, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
*equal_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let jsbool_equal_p_inner = jsbool_equal_p_inner.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{not_eq, _lua_call((jsbool_equal_p_inner.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1200, 11), end: (1200, 37) }), _lua_false(), _lua_debug_loc { start: (1200, 11), end: (1200, 46) }};

_lua_nil()
}})); _lua_tmp.clone() };
*simple_print.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
let null_p = null_p.clone();
let construction_p = construction_p.clone();
let tostring = tostring.clone();
let simple_print = simple_print.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let data_p = data_p.clone();
let new_construction = new_construction.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let atom_p = atom_p.clone();
let un_atom = un_atom.clone();
let comment_p = comment_p.clone();
let comment_comment = comment_comment.clone();
let comment_x = comment_x.clone();
let delay_evaluate_p = delay_evaluate_p.clone();
let env2val = env2val.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
let delay_evaluate_x = delay_evaluate_x.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_builtin_func_f = delay_builtin_func_f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let delay_builtin_func_xs = delay_builtin_func_xs.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let delay_builtin_form_env = delay_builtin_form_env.clone();
let delay_builtin_form_f = delay_builtin_form_f.clone();
let delay_builtin_form_xs = delay_builtin_form_xs.clone();
let delay_apply_p = delay_apply_p.clone();
let delay_apply_f = delay_apply_f.clone();
let delay_apply_xs = delay_apply_xs.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1203, 8), end: (1203, 22) }); _lua_tmp.clone() };
let temp = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
let prefix = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1206, 7), end: (1206, 16) })).as_bool(_lua_debug_loc { start: (1206, 7), end: (1206, 16) }) {
return _lua_str("()");
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1208, 11), end: (1208, 28) })).as_bool(_lua_debug_loc { start: (1208, 11), end: (1208, 28) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_str("("); _lua_tmp.clone() };
*prefix.write().unwrap() = { let _lua_tmp = _lua_str(""); _lua_tmp.clone() };
while (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1211, 14), end: (1211, 31) })).as_bool(_lua_debug_loc { start: (1211, 8), end: (1221, 11) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (1212, 19), end: (1212, 33) }), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(prefix.read().unwrap().clone())], _lua_debug_loc { start: (1212, 37), end: (1212, 53) }), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1214, 20), end: (1214, 40) })], _lua_debug_loc { start: (1213, 16), end: (1215, 17) })], _lua_debug_loc { start: (1212, 57), end: (1216, 13) }), _lua_debug_loc { start: (1212, 37), end: (1216, 13) }}, _lua_debug_loc { start: (1212, 19), end: (1216, 13) }}; _lua_tmp.clone() };
*prefix.write().unwrap() = { let _lua_tmp = _lua_str(" "); _lua_tmp.clone() };
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1219, 16), end: (1219, 36) })], _lua_debug_loc { start: (1218, 16), end: (1220, 13) }); _lua_tmp.clone() };
}
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1222, 11), end: (1222, 20) })).as_bool(_lua_debug_loc { start: (1222, 11), end: (1222, 20) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (1223, 19), end: (1223, 33) }), _lua_str(")"), _lua_debug_loc { start: (1223, 19), end: (1223, 40) }}; _lua_tmp.clone() };
} else {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (1225, 19), end: (1225, 33) }), _lua_op!{concat, _lua_str(" . "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1226, 16), end: (1226, 31) })], _lua_debug_loc { start: (1225, 46), end: (1227, 13) }), _lua_str(")"), _lua_debug_loc { start: (1225, 46), end: (1227, 20) }}, _lua_debug_loc { start: (1225, 37), end: (1227, 20) }}, _lua_debug_loc { start: (1225, 19), end: (1227, 20) }}; _lua_tmp.clone() };
}
return (temp.read().unwrap().clone());
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1230, 11), end: (1230, 20) })).as_bool(_lua_debug_loc { start: (1230, 11), end: (1230, 20) }) {
return _lua_op!{concat, _lua_str("#"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((data_name.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1234, 20), end: (1234, 32) }), _lua_call((data_list.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1235, 20), end: (1235, 32) })], _lua_debug_loc { start: (1233, 16), end: (1236, 17) })], _lua_debug_loc { start: (1232, 12), end: (1237, 13) })], _lua_debug_loc { start: (1231, 22), end: (1238, 9) }), _lua_debug_loc { start: (1231, 15), end: (1238, 9) }};
} else if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1239, 11), end: (1239, 20) })).as_bool(_lua_debug_loc { start: (1239, 11), end: (1239, 20) }) {
return _lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1240, 15), end: (1240, 25) });
} else if (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1241, 11), end: (1241, 23) })).as_bool(_lua_debug_loc { start: (1241, 11), end: (1241, 23) }) {
return _lua_op!{concat, _lua_str(";("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((comment_comment.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1244, 16), end: (1244, 34) })], _lua_debug_loc { start: (1243, 12), end: (1245, 13) })], _lua_debug_loc { start: (1242, 23), end: (1246, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((comment_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1248, 16), end: (1248, 28) })], _lua_debug_loc { start: (1247, 12), end: (1249, 13) })], _lua_debug_loc { start: (1246, 20), end: (1250, 9) }), _lua_str(")"), _lua_debug_loc { start: (1246, 20), end: (1250, 16) }}, _lua_debug_loc { start: (1246, 13), end: (1250, 16) }}, _lua_debug_loc { start: (1242, 23), end: (1250, 16) }}, _lua_debug_loc { start: (1242, 15), end: (1250, 16) }};
} else if (_lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1251, 11), end: (1251, 30) })).as_bool(_lua_debug_loc { start: (1251, 11), end: (1251, 30) }) {
return _lua_op!{concat, _lua_str("$("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![_lua_call((delay_evaluate_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1255, 20), end: (1255, 41) })], _lua_debug_loc { start: (1254, 16), end: (1256, 17) })], _lua_debug_loc { start: (1253, 12), end: (1257, 13) })], _lua_debug_loc { start: (1252, 23), end: (1258, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((delay_evaluate_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1260, 16), end: (1260, 35) })], _lua_debug_loc { start: (1259, 12), end: (1261, 13) })], _lua_debug_loc { start: (1258, 20), end: (1262, 9) }), _lua_str(")"), _lua_debug_loc { start: (1258, 20), end: (1262, 16) }}, _lua_debug_loc { start: (1258, 13), end: (1262, 16) }}, _lua_debug_loc { start: (1252, 23), end: (1262, 16) }}, _lua_debug_loc { start: (1252, 15), end: (1262, 16) }};
} else if (_lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1263, 11), end: (1263, 34) })).as_bool(_lua_debug_loc { start: (1263, 11), end: (1263, 34) }) {
return _lua_op!{concat, _lua_str("%("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((delay_builtin_func_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1266, 16), end: (1266, 39) })], _lua_debug_loc { start: (1265, 12), end: (1267, 13) })], _lua_debug_loc { start: (1264, 23), end: (1268, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_builtin_func_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1271, 20), end: (1271, 44) })], _lua_debug_loc { start: (1270, 16), end: (1272, 17) })], _lua_debug_loc { start: (1269, 12), end: (1273, 13) })], _lua_debug_loc { start: (1268, 20), end: (1274, 9) }), _lua_str(")"), _lua_debug_loc { start: (1268, 20), end: (1274, 16) }}, _lua_debug_loc { start: (1268, 13), end: (1274, 16) }}, _lua_debug_loc { start: (1264, 23), end: (1274, 16) }}, _lua_debug_loc { start: (1264, 15), end: (1274, 16) }};
} else if (_lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1275, 11), end: (1275, 34) })).as_bool(_lua_debug_loc { start: (1275, 11), end: (1275, 34) }) {
return _lua_op!{concat, _lua_str("@("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1279, 20), end: (1279, 45) })], _lua_debug_loc { start: (1278, 16), end: (1280, 17) })], _lua_debug_loc { start: (1277, 12), end: (1281, 13) })], _lua_debug_loc { start: (1276, 23), end: (1282, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1284, 16), end: (1284, 39) })], _lua_debug_loc { start: (1283, 12), end: (1285, 13) })], _lua_debug_loc { start: (1282, 20), end: (1286, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1289, 20), end: (1289, 44) })], _lua_debug_loc { start: (1288, 16), end: (1290, 17) })], _lua_debug_loc { start: (1287, 12), end: (1291, 13) })], _lua_debug_loc { start: (1286, 20), end: (1292, 9) }), _lua_str(")"), _lua_debug_loc { start: (1286, 20), end: (1292, 16) }}, _lua_debug_loc { start: (1286, 13), end: (1292, 16) }}, _lua_debug_loc { start: (1282, 20), end: (1292, 16) }}, _lua_debug_loc { start: (1282, 13), end: (1292, 16) }}, _lua_debug_loc { start: (1276, 23), end: (1292, 16) }}, _lua_debug_loc { start: (1276, 15), end: (1292, 16) }};
} else if (_lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1293, 11), end: (1293, 27) })).as_bool(_lua_debug_loc { start: (1293, 11), end: (1293, 27) }) {
return _lua_op!{concat, _lua_str("^("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((delay_apply_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1296, 16), end: (1296, 32) })], _lua_debug_loc { start: (1295, 12), end: (1297, 13) })], _lua_debug_loc { start: (1294, 23), end: (1298, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_apply_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1301, 20), end: (1301, 37) })], _lua_debug_loc { start: (1300, 16), end: (1302, 17) })], _lua_debug_loc { start: (1299, 12), end: (1303, 13) })], _lua_debug_loc { start: (1298, 20), end: (1304, 9) }), _lua_str(")"), _lua_debug_loc { start: (1298, 20), end: (1304, 16) }}, _lua_debug_loc { start: (1298, 13), end: (1304, 16) }}, _lua_debug_loc { start: (1294, 23), end: (1304, 16) }}, _lua_debug_loc { start: (1294, 15), end: (1304, 16) }};
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1306, 11), end: (1306, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
let run_trampoline = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*run_trampoline.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((x.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1309, 14), end: (1309, 17) })));
while (_lua_lookup((i.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (1310, 10), end: (1310, 13) })).as_bool(_lua_debug_loc { start: (1310, 4), end: (1312, 7) }) {
*i.write().unwrap() = { let _lua_tmp = _lua_call(_lua_lookup((i.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1311, 12), end: (1311, 18) }), vec![], _lua_debug_loc { start: (1311, 12), end: (1311, 18) }); _lua_tmp.clone() };
}
return _lua_lookup((i.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1313, 11), end: (1313, 14) });

_lua_nil()
}})); _lua_tmp.clone() };
*atom_t.write().unwrap() = { let _lua_tmp = _lua_num!(0); _lua_tmp.clone() };
*construction_t.write().unwrap() = { let _lua_tmp = _lua_num!(1); _lua_tmp.clone() };
*null_t.write().unwrap() = { let _lua_tmp = _lua_num!(2); _lua_tmp.clone() };
*data_t.write().unwrap() = { let _lua_tmp = _lua_num!(3); _lua_tmp.clone() };
*just_t.write().unwrap() = { let _lua_tmp = _lua_num!(4); _lua_tmp.clone() };
*delay_evaluate_t.write().unwrap() = { let _lua_tmp = _lua_num!(5); _lua_tmp.clone() };
*delay_builtin_func_t.write().unwrap() = { let _lua_tmp = _lua_num!(6); _lua_tmp.clone() };
*delay_builtin_form_t.write().unwrap() = { let _lua_tmp = _lua_num!(7); _lua_tmp.clone() };
*delay_apply_t.write().unwrap() = { let _lua_tmp = _lua_num!(8); _lua_tmp.clone() };
*comment_t.write().unwrap() = { let _lua_tmp = _lua_num!(10); _lua_tmp.clone() };
*hole_t.write().unwrap() = { let _lua_tmp = _lua_num!(9); _lua_tmp.clone() };
let new_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*new_atom.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let atom_t = atom_t.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(atom_t.read().unwrap().clone()), (x.read().unwrap().clone())]);

_lua_nil()
}})); _lua_tmp.clone() };
*null_v.write().unwrap() = { let _lua_tmp = _lua_vec(vec![(null_t.read().unwrap().clone())]); _lua_tmp.clone() };
let force_uncomment_all_rec = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*force_uncomment_all_rec.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_uncomment_all = force_uncomment_all.clone();
let force_all_rec = force_all_rec.clone();
let comment_p = comment_p.clone();
let lang_copy_do = lang_copy_do.clone();
let force_uncomment_all_rec = force_uncomment_all_rec.clone();
let data_p = data_p.clone();
let construction_p = construction_p.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_uncomment_all.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (1331, 14), end: (1331, 38) })));
let conslike = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*conslike.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all_rec = force_all_rec.clone();
let comment_p = comment_p.clone();
let lang_copy_do = lang_copy_do.clone();
let force_uncomment_all_rec = force_uncomment_all_rec.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_set((xx.read().unwrap().clone()),_lua_num!(2),_lua_call((force_all_rec.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1333, 30), end: (1333, 34) })], _lua_debug_loc { start: (1333, 16), end: (1333, 36) }), _lua_debug_loc { start: (1333, 8), end: (1333, 36) });
_lua_set((xx.read().unwrap().clone()),_lua_num!(3),_lua_call((force_all_rec.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1334, 30), end: (1334, 34) })], _lua_debug_loc { start: (1334, 16), end: (1334, 36) }), _lua_debug_loc { start: (1334, 8), end: (1334, 36) });
if (_lua_op!{or, _lua_call((comment_p.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1335, 21), end: (1335, 25) })], _lua_debug_loc { start: (1335, 11), end: (1335, 27) }), _lua_call((comment_p.read().unwrap().clone()), vec![_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1335, 41), end: (1335, 45) })], _lua_debug_loc { start: (1335, 31), end: (1335, 47) }), _lua_debug_loc { start: (1335, 11), end: (1335, 47) }}).as_bool(_lua_debug_loc { start: (1335, 11), end: (1335, 47) }) {
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((lang_copy_do.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1336, 24), end: (1336, 40) })));
let a = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((xx.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (1337, 22), end: (1337, 26) })));
let d = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((xx.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (1338, 22), end: (1338, 26) })));
let a1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_uncomment_all_rec.read().unwrap().clone()), vec![(a.read().unwrap().clone())], _lua_debug_loc { start: (1339, 23), end: (1339, 49) })));
let d1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_uncomment_all_rec.read().unwrap().clone()), vec![(d.read().unwrap().clone())], _lua_debug_loc { start: (1340, 23), end: (1340, 49) })));
_lua_set((ret.read().unwrap().clone()),_lua_num!(2),(a1.read().unwrap().clone()), _lua_debug_loc { start: (1341, 12), end: (1341, 23) });
_lua_set((ret.read().unwrap().clone()),_lua_num!(3),(d1.read().unwrap().clone()), _lua_debug_loc { start: (1342, 12), end: (1342, 23) });
return (ret.read().unwrap().clone());
} else {
return (xx.read().unwrap().clone());
}

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1348, 7), end: (1348, 16) })).as_bool(_lua_debug_loc { start: (1348, 7), end: (1348, 16) }) {
return _lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1349, 15), end: (1349, 26) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1350, 11), end: (1350, 28) })).as_bool(_lua_debug_loc { start: (1350, 11), end: (1350, 28) }) {
return _lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1351, 15), end: (1351, 26) });
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*unlazy_all_rec.write().unwrap() = { let _lua_tmp = (force_uncomment_all_rec.read().unwrap().clone()); _lua_tmp.clone() };
*system_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("太始初核")], _lua_debug_loc { start: (1356, 14), end: (1356, 30) }); _lua_tmp.clone() };
*name_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("符名")], _lua_debug_loc { start: (1357, 12), end: (1357, 26) }); _lua_tmp.clone() };
*function_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("化滅")], _lua_debug_loc { start: (1358, 16), end: (1358, 30) }); _lua_tmp.clone() };
*form_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("式形")], _lua_debug_loc { start: (1359, 12), end: (1359, 26) }); _lua_tmp.clone() };
let equal_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("等同")], _lua_debug_loc { start: (1360, 19), end: (1360, 33) })));
let evaluate_sym = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("解算")], _lua_debug_loc { start: (1361, 21), end: (1361, 35) })));
let theThing_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("特定其物")], _lua_debug_loc { start: (1362, 22), end: (1362, 38) })));
let something_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("省略一物")], _lua_debug_loc { start: (1363, 23), end: (1363, 39) })));
*mapping_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("映表")], _lua_debug_loc { start: (1364, 15), end: (1364, 29) }); _lua_tmp.clone() };
let if_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("如若")], _lua_debug_loc { start: (1365, 16), end: (1365, 30) })));
let typeAnnotation_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("一類何物")], _lua_debug_loc { start: (1366, 28), end: (1366, 44) })));
let isOrNot_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("是非")], _lua_debug_loc { start: (1367, 21), end: (1367, 35) })));
let sub_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("其子")], _lua_debug_loc { start: (1368, 17), end: (1368, 31) })));
let true_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("爻陽")], _lua_debug_loc { start: (1369, 18), end: (1369, 32) })));
let false_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("爻陰")], _lua_debug_loc { start: (1370, 19), end: (1370, 33) })));
let quote_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("引用")], _lua_debug_loc { start: (1371, 19), end: (1371, 33) })));
let apply_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("應用")], _lua_debug_loc { start: (1372, 19), end: (1372, 33) })));
let null_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("間空")], _lua_debug_loc { start: (1373, 18), end: (1373, 32) })));
let construction_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("連頸")], _lua_debug_loc { start: (1374, 26), end: (1374, 40) })));
let data_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("構物")], _lua_debug_loc { start: (1375, 18), end: (1375, 32) })));
*error_atom.write().unwrap() = { let _lua_tmp = _lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("謬誤")], _lua_debug_loc { start: (1376, 13), end: (1376, 27) }); _lua_tmp.clone() };
let atom_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("詞素")], _lua_debug_loc { start: (1377, 18), end: (1377, 32) })));
let list_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("列序")], _lua_debug_loc { start: (1378, 18), end: (1378, 32) })));
let head_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("首始")], _lua_debug_loc { start: (1379, 18), end: (1379, 32) })));
let tail_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("尾末")], _lua_debug_loc { start: (1380, 18), end: (1380, 32) })));
let thing_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("之物")], _lua_debug_loc { start: (1381, 19), end: (1381, 33) })));
let theWorldStopped_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("宇宙亡矣")], _lua_debug_loc { start: (1382, 29), end: (1382, 45) })));
let effect_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("效應")], _lua_debug_loc { start: (1383, 20), end: (1383, 34) })));
let comment_atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("註疏")], _lua_debug_loc { start: (1384, 21), end: (1384, 35) })));
*the_world_stopped_v.write().unwrap() = { let _lua_tmp = _lua_call((new_error.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(theWorldStopped_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1387, 4), end: (1387, 50) })], _lua_debug_loc { start: (1385, 22), end: (1388, 1) }); _lua_tmp.clone() };
let systemName_make = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*systemName_make.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_data = new_data.clone();
let name_atom = name_atom.clone();
let new_construction = new_construction.clone();
let system_atom = system_atom.clone();
let null_v = null_v.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_data.read().unwrap().clone()), vec![(name_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (1394, 12), end: (1394, 39) })], _lua_debug_loc { start: (1392, 8), end: (1395, 9) })], _lua_debug_loc { start: (1390, 11), end: (1396, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let make_builtin_f_new_sym_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_builtin_f_new_sym_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let theThing_atom = theThing_atom.clone();
move |mut _lua_arg_tmp, _| {
let x_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone()), (x_sym.read().unwrap().clone())], _lua_debug_loc { start: (1402, 12), end: (1402, 58) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (1400, 8), end: (1404, 9) })], _lua_debug_loc { start: (1399, 11), end: (1405, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let make_builtin_f_get_sym_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_builtin_f_get_sym_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
move |mut _lua_arg_tmp, _| {
let t_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(t_sym.read().unwrap().clone())], _lua_debug_loc { start: (1413, 16), end: (1413, 31) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1411, 12), end: (1415, 13) }), (x_sym.read().unwrap().clone())], _lua_debug_loc { start: (1409, 8), end: (1417, 9) })], _lua_debug_loc { start: (1408, 11), end: (1418, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let make_builtin_f_p_sym_f = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_builtin_f_p_sym_f.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let something_atom = something_atom.clone();
move |mut _lua_arg_tmp, _| {
let t_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(isOrNot_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (t_sym.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1427, 16), end: (1427, 68) })], _lua_debug_loc { start: (1425, 12), end: (1428, 13) })], _lua_debug_loc { start: (1422, 8), end: (1429, 9) })], _lua_debug_loc { start: (1421, 11), end: (1430, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let new_data_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_builtin_f_new_sym_f.read().unwrap().clone()), vec![(data_atom.read().unwrap().clone())], _lua_debug_loc { start: (1432, 45), end: (1432, 80) })));
*data_name_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_get_sym_f.read().unwrap().clone()), vec![(data_atom.read().unwrap().clone()), (name_atom.read().unwrap().clone())], _lua_debug_loc { start: (1433, 40), end: (1433, 86) }); _lua_tmp.clone() };
*data_list_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_get_sym_f.read().unwrap().clone()), vec![(data_atom.read().unwrap().clone()), (list_atom.read().unwrap().clone())], _lua_debug_loc { start: (1434, 40), end: (1434, 86) }); _lua_tmp.clone() };
*data_p_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_p_sym_f.read().unwrap().clone()), vec![(data_atom.read().unwrap().clone())], _lua_debug_loc { start: (1435, 37), end: (1435, 70) }); _lua_tmp.clone() };
let new_construction_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_builtin_f_new_sym_f.read().unwrap().clone()), vec![(construction_atom.read().unwrap().clone())], _lua_debug_loc { start: (1436, 53), end: (1436, 96) })));
*construction_p_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_p_sym_f.read().unwrap().clone()), vec![(construction_atom.read().unwrap().clone())], _lua_debug_loc { start: (1437, 45), end: (1437, 86) }); _lua_tmp.clone() };
*construction_head_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_get_sym_f.read().unwrap().clone()), vec![(construction_atom.read().unwrap().clone()), (head_atom.read().unwrap().clone())], _lua_debug_loc { start: (1438, 48), end: (1438, 102) }); _lua_tmp.clone() };
*construction_tail_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_get_sym_f.read().unwrap().clone()), vec![(construction_atom.read().unwrap().clone()), (tail_atom.read().unwrap().clone())], _lua_debug_loc { start: (1439, 48), end: (1439, 102) }); _lua_tmp.clone() };
*atom_p_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_p_sym_f.read().unwrap().clone()), vec![(atom_atom.read().unwrap().clone())], _lua_debug_loc { start: (1440, 37), end: (1440, 70) }); _lua_tmp.clone() };
*null_p_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((make_builtin_f_p_sym_f.read().unwrap().clone()), vec![(null_atom.read().unwrap().clone())], _lua_debug_loc { start: (1441, 37), end: (1441, 70) }); _lua_tmp.clone() };
*equal_p_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(isOrNot_atom.read().unwrap().clone()), (equal_atom.read().unwrap().clone())], _lua_debug_loc { start: (1446, 8), end: (1446, 42) })], _lua_debug_loc { start: (1443, 4), end: (1447, 5) })], _lua_debug_loc { start: (1442, 38), end: (1448, 1) }); _lua_tmp.clone() };
*apply_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1454, 12), end: (1454, 59) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1452, 8), end: (1456, 9) }), (apply_atom.read().unwrap().clone())], _lua_debug_loc { start: (1450, 4), end: (1458, 5) })], _lua_debug_loc { start: (1449, 36), end: (1459, 1) }); _lua_tmp.clone() };
*evaluate_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), (evaluate_sym.read().unwrap().clone())], _lua_debug_loc { start: (1461, 4), end: (1461, 62) })], _lua_debug_loc { start: (1460, 39), end: (1462, 1) }); _lua_tmp.clone() };
let list_chooseOne_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_builtin_f_get_sym_f.read().unwrap().clone()), vec![(list_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (thing_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (1465, 4), end: (1465, 61) })], _lua_debug_loc { start: (1463, 51), end: (1466, 1) })));
*if_function_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), (if_atom.read().unwrap().clone())], _lua_debug_loc { start: (1468, 4), end: (1468, 57) })], _lua_debug_loc { start: (1467, 33), end: (1469, 1) }); _lua_tmp.clone() };
*quote_form_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (form_atom.read().unwrap().clone()), (quote_atom.read().unwrap().clone())], _lua_debug_loc { start: (1471, 4), end: (1471, 56) })], _lua_debug_loc { start: (1470, 32), end: (1472, 1) }); _lua_tmp.clone() };
*lambda_form_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (1478, 12), end: (1478, 66) })], _lua_debug_loc { start: (1476, 8), end: (1479, 9) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (1474, 4), end: (1481, 5) })], _lua_debug_loc { start: (1473, 33), end: (1482, 1) }); _lua_tmp.clone() };
*function_builtin_use_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (1486, 8), end: (1486, 44) })], _lua_debug_loc { start: (1484, 4), end: (1487, 5) })], _lua_debug_loc { start: (1483, 34), end: (1488, 1) }); _lua_tmp.clone() };
*form_builtin_use_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), (form_atom.read().unwrap().clone())], _lua_debug_loc { start: (1492, 8), end: (1492, 40) })], _lua_debug_loc { start: (1490, 4), end: (1493, 5) })], _lua_debug_loc { start: (1489, 30), end: (1494, 1) }); _lua_tmp.clone() };
*form_use_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), (form_atom.read().unwrap().clone())], _lua_debug_loc { start: (1496, 4), end: (1496, 34) })], _lua_debug_loc { start: (1495, 22), end: (1497, 1) }); _lua_tmp.clone() };
let comment_function_builtin_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), (comment_atom.read().unwrap().clone())], _lua_debug_loc { start: (1499, 4), end: (1499, 62) })], _lua_debug_loc { start: (1498, 44), end: (1500, 1) })));
*comment_form_builtin_systemName.write().unwrap() = { let _lua_tmp = _lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (form_atom.read().unwrap().clone()), (comment_atom.read().unwrap().clone())], _lua_debug_loc { start: (1502, 4), end: (1502, 58) })], _lua_debug_loc { start: (1501, 34), end: (1503, 1) }); _lua_tmp.clone() };
let false_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_data.read().unwrap().clone()), vec![(false_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1506, 4), end: (1506, 14) })], _lua_debug_loc { start: (1504, 16), end: (1507, 1) })));
let true_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_data.read().unwrap().clone()), vec![(true_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1510, 4), end: (1510, 14) })], _lua_debug_loc { start: (1508, 15), end: (1511, 1) })));
let list_to_jsArray = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*list_to_jsArray.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let construction_p = construction_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
move |mut _lua_arg_tmp, _| {
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k_done = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k_tail = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
while (_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1514, 10), end: (1514, 28) })).as_bool(_lua_debug_loc { start: (1514, 4), end: (1520, 7) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1517, 12), end: (1517, 33) })], _lua_debug_loc { start: (1515, 8), end: (1518, 9) });
*xs.write().unwrap() = { let _lua_tmp = _lua_call((construction_tail.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1519, 13), end: (1519, 34) }); _lua_tmp.clone() };
}
if (_lua_call((null_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1521, 7), end: (1521, 17) })).as_bool(_lua_debug_loc { start: (1521, 7), end: (1521, 17) }) {
return _lua_call((k_done.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (1522, 15), end: (1522, 26) });
}
return _lua_call((k_tail.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), (xs.read().unwrap().clone())], _lua_debug_loc { start: (1524, 11), end: (1524, 26) });

_lua_nil()
}})); _lua_tmp.clone() };
let maybe_list_to_jsArray = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*maybe_list_to_jsArray.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
move |mut _lua_arg_tmp, _| {
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((list_to_jsArray.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return (x.read().unwrap().clone());

_lua_nil()
}})), _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let _1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_false();

_lua_nil()
}}))], _lua_debug_loc { start: (1527, 11), end: (1531, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let un_just_comment_all = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*un_just_comment_all.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let just_p = just_p.clone();
let comment_p = comment_p.clone();
let un_just_all = un_just_all.clone();
let un_comment_all = un_comment_all.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_op!{or, _lua_call((just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1534, 10), end: (1534, 19) }), _lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1534, 23), end: (1534, 35) }), _lua_debug_loc { start: (1534, 10), end: (1534, 35) }}).as_bool(_lua_debug_loc { start: (1534, 4), end: (1538, 7) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![_lua_call((un_comment_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1536, 12), end: (1536, 29) })], _lua_debug_loc { start: (1535, 12), end: (1537, 9) }); _lua_tmp.clone() };
}
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
let delay2delay_evaluate = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*delay2delay_evaluate.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_p = delay_evaluate_p.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let error = error.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_apply_p = delay_apply_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1542, 7), end: (1542, 26) })).as_bool(_lua_debug_loc { start: (1542, 7), end: (1542, 26) }) {
return (x.read().unwrap().clone());
} else if (_lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1544, 11), end: (1544, 34) })).as_bool(_lua_debug_loc { start: (1544, 11), end: (1544, 34) }) {
_lua_call((error.read().unwrap().clone()), vec![_lua_str("WIP")], _lua_debug_loc { start: (1545, 8), end: (1545, 20) });
} else if (_lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1546, 11), end: (1546, 34) })).as_bool(_lua_debug_loc { start: (1546, 11), end: (1546, 34) }) {
_lua_call((error.read().unwrap().clone()), vec![_lua_str("WIP")], _lua_debug_loc { start: (1547, 8), end: (1547, 20) });
} else if (_lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1548, 11), end: (1548, 27) })).as_bool(_lua_debug_loc { start: (1548, 11), end: (1548, 27) }) {
_lua_call((error.read().unwrap().clone()), vec![_lua_str("WIP")], _lua_debug_loc { start: (1549, 8), end: (1549, 20) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1551, 11), end: (1551, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
let delay_env = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*delay_env.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_env = delay_evaluate_env.clone();
let delay2delay_evaluate = delay2delay_evaluate.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((delay_evaluate_env.read().unwrap().clone()), vec![_lua_call((delay2delay_evaluate.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1555, 8), end: (1555, 31) })], _lua_debug_loc { start: (1554, 11), end: (1556, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let delay_x = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*delay_x.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let delay_evaluate_x = delay_evaluate_x.clone();
let delay2delay_evaluate = delay2delay_evaluate.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((delay_evaluate_x.read().unwrap().clone()), vec![_lua_call((delay2delay_evaluate.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1560, 8), end: (1560, 31) })], _lua_debug_loc { start: (1559, 11), end: (1561, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let force_uncomment1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*force_uncomment1.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
let force1 = force1.clone();
move |mut _lua_arg_tmp, _| {
let raw = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((comment_p.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (1564, 7), end: (1564, 21) })).as_bool(_lua_debug_loc { start: (1564, 7), end: (1564, 21) }) {
return _lua_call((comment_x.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (1565, 15), end: (1565, 29) });
} else {
return _lua_call((force1.read().unwrap().clone()), vec![(raw.read().unwrap().clone())], _lua_debug_loc { start: (1567, 15), end: (1567, 26) });
}

_lua_nil()
}})); _lua_tmp.clone() };
let enviroment_null_v = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_enviroment_null_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1570, 26), end: (1570, 50) })));
let enviroment_set = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*enviroment_set.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let make_enviroment_null_v = make_enviroment_null_v.clone();
let run_trampoline = run_trampoline.clone();
let enviroment_set_helper = enviroment_set_helper.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let result = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((make_enviroment_null_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1572, 19), end: (1572, 43) })));
return _lua_call((run_trampoline.read().unwrap().clone()), vec![_lua_call((enviroment_set_helper.read().unwrap().clone()), vec![(env.read().unwrap().clone()), _lua_vec(vec![(key.read().unwrap().clone())]), (val.read().unwrap().clone()), (result.read().unwrap().clone()), (result.read().unwrap().clone())], _lua_debug_loc { start: (1574, 8), end: (1574, 62) })], _lua_debug_loc { start: (1573, 11), end: (1575, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
*env_null_v.write().unwrap() = { let _lua_tmp = _lua_vec(vec![]); _lua_tmp.clone() };
let val2env = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*val2env.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force_all = force_all.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let mapping_atom = mapping_atom.clone();
let data_list = data_list.clone();
let construction_p = construction_p.clone();
let null_p = null_p.clone();
let construction_tail = construction_tail.clone();
let construction_head = construction_head.clone();
let equal_p = equal_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1579, 8), end: (1579, 20) }); _lua_tmp.clone() };
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1580, 11), end: (1580, 20) }), _lua_debug_loc { start: (1580, 7), end: (1580, 20) })).as_bool(_lua_debug_loc { start: (1580, 7), end: (1580, 20) }) {
return _lua_false();
}
let s = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((data_name.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1584, 8), end: (1584, 20) })], _lua_debug_loc { start: (1583, 14), end: (1585, 5) })));
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(s.read().unwrap().clone())], _lua_debug_loc { start: (1586, 11), end: (1586, 20) }), _lua_debug_loc { start: (1586, 7), end: (1586, 20) })).as_bool(_lua_debug_loc { start: (1586, 7), end: (1586, 20) }) {
return _lua_false();
}
if (_lua_not(_lua_call((atom_equal_p.read().unwrap().clone()), vec![(s.read().unwrap().clone()), (mapping_atom.read().unwrap().clone())], _lua_debug_loc { start: (1589, 11), end: (1589, 40) }), _lua_debug_loc { start: (1589, 7), end: (1589, 40) })).as_bool(_lua_debug_loc { start: (1589, 7), end: (1589, 40) }) {
return _lua_false();
}
*s.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![_lua_call((data_list.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1593, 8), end: (1593, 20) })], _lua_debug_loc { start: (1592, 8), end: (1594, 5) }); _lua_tmp.clone() };
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(s.read().unwrap().clone())], _lua_debug_loc { start: (1595, 11), end: (1595, 28) }), _lua_debug_loc { start: (1595, 7), end: (1595, 28) })).as_bool(_lua_debug_loc { start: (1595, 7), end: (1595, 28) }) {
return _lua_false();
}
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(s.read().unwrap().clone())], _lua_debug_loc { start: (1600, 12), end: (1600, 32) })], _lua_debug_loc { start: (1599, 8), end: (1601, 9) })], _lua_debug_loc { start: (1598, 11), end: (1602, 5) }), _lua_debug_loc { start: (1598, 7), end: (1602, 5) })).as_bool(_lua_debug_loc { start: (1598, 7), end: (1602, 5) }) {
return _lua_false();
}
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(s.read().unwrap().clone())], _lua_debug_loc { start: (1607, 8), end: (1607, 28) })], _lua_debug_loc { start: (1606, 15), end: (1608, 5) })));
while (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1609, 14), end: (1609, 24) }), _lua_debug_loc { start: (1609, 10), end: (1609, 24) })).as_bool(_lua_debug_loc { start: (1609, 4), end: (1652, 7) }) {
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1610, 15), end: (1610, 33) }), _lua_debug_loc { start: (1610, 11), end: (1610, 33) })).as_bool(_lua_debug_loc { start: (1610, 11), end: (1610, 33) }) {
return _lua_false();
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1614, 12), end: (1614, 33) })], _lua_debug_loc { start: (1613, 18), end: (1615, 9) })));
*xs.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1617, 12), end: (1617, 33) })], _lua_debug_loc { start: (1616, 13), end: (1618, 9) }); _lua_tmp.clone() };
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1619, 15), end: (1619, 32) }), _lua_debug_loc { start: (1619, 11), end: (1619, 32) })).as_bool(_lua_debug_loc { start: (1619, 11), end: (1619, 32) }) {
return _lua_false();
}
let k = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1622, 18), end: (1622, 38) })));
*x.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1624, 12), end: (1624, 32) })], _lua_debug_loc { start: (1623, 12), end: (1625, 9) }); _lua_tmp.clone() };
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1626, 15), end: (1626, 32) }), _lua_debug_loc { start: (1626, 11), end: (1626, 32) })).as_bool(_lua_debug_loc { start: (1626, 11), end: (1626, 32) }) {
return _lua_false();
}
let v = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1629, 18), end: (1629, 38) })));
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1632, 16), end: (1632, 36) })], _lua_debug_loc { start: (1631, 12), end: (1633, 13) })], _lua_debug_loc { start: (1630, 15), end: (1634, 9) }), _lua_debug_loc { start: (1630, 11), end: (1634, 9) })).as_bool(_lua_debug_loc { start: (1630, 11), end: (1634, 9) }) {
return _lua_false();
}
let not_breaked = std::sync::Arc::new(std::sync::RwLock::new(_lua_true()));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(0)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((ret.read().unwrap().clone()), _lua_debug_loc { start: (1640, 22), end: (1640, 26) }), _lua_debug_loc { start: (1640, 18), end: (1640, 26) }}).as_bool(_lua_debug_loc { start: (1640, 12), end: (1647, 15) }) {
if (_lua_call((equal_p.read().unwrap().clone()), vec![_lua_lookup((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (1641, 32), end: (1641, 37) }}, _lua_num!(1), _lua_debug_loc { start: (1641, 31), end: (1641, 42) }}, _lua_debug_loc { start: (1641, 27), end: (1641, 42) }), (k.read().unwrap().clone())], _lua_debug_loc { start: (1641, 19), end: (1641, 47) })).as_bool(_lua_debug_loc { start: (1641, 19), end: (1641, 47) }) {
_lua_set((ret.read().unwrap().clone()),_lua_op!{add, _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1642, 25), end: (1642, 30) }}, _lua_num!(1), _lua_debug_loc { start: (1642, 24), end: (1642, 35) }},(v.read().unwrap().clone()), _lua_debug_loc { start: (1642, 20), end: (1642, 40) });
*not_breaked.write().unwrap() = { let _lua_tmp = _lua_false(); _lua_tmp.clone() };
break;
}
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(2), _lua_debug_loc { start: (1646, 20), end: (1646, 25) }}; _lua_tmp.clone() };
}
}
if ((not_breaked.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (1649, 11), end: (1649, 22) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ret.read().unwrap().clone()), (k.read().unwrap().clone()), (v.read().unwrap().clone())], _lua_debug_loc { start: (1650, 12), end: (1650, 38) });
}
}
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
let make_builtin_p_func = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_builtin_p_func.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let true_v = true_v.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp, _| {
let p_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let p_jsfunc = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(p_sym.read().unwrap().clone()), _lua_num!(1), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let p_sym = p_sym.clone();
let p_jsfunc = p_jsfunc.clone();
let true_v = true_v.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1660, 16), end: (1660, 25) }); _lua_tmp.clone() };
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1661, 15), end: (1661, 30) })).as_bool(_lua_debug_loc { start: (1661, 15), end: (1661, 30) }) {
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(p_sym.read().unwrap().clone()), _lua_vec(vec![(x.read().unwrap().clone())])], _lua_debug_loc { start: (1662, 23), end: (1662, 53) });
}
if (_lua_call((p_jsfunc.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1664, 15), end: (1664, 26) })).as_bool(_lua_debug_loc { start: (1664, 15), end: (1664, 26) }) {
return (true_v.read().unwrap().clone());
}
return (false_v.read().unwrap().clone());

_lua_nil()
}}))]);

_lua_nil()
}})); _lua_tmp.clone() };
let make_builtin_get_func = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_builtin_get_func.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
move |mut _lua_arg_tmp, _| {
let f_sym = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let p_jsfunc = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f_jsfunc = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_vec(vec![(f_sym.read().unwrap().clone()), _lua_num!(1), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let f_sym = f_sym.clone();
let p_jsfunc = p_jsfunc.clone();
let f_jsfunc = f_jsfunc.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1676, 16), end: (1676, 25) }); _lua_tmp.clone() };
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1677, 15), end: (1677, 30) })).as_bool(_lua_debug_loc { start: (1677, 15), end: (1677, 30) }) {
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(f_sym.read().unwrap().clone()), _lua_vec(vec![(x.read().unwrap().clone())])], _lua_debug_loc { start: (1678, 23), end: (1678, 53) });
}
if (_lua_call((p_jsfunc.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1680, 15), end: (1680, 26) })).as_bool(_lua_debug_loc { start: (1680, 15), end: (1680, 26) }) {
return _lua_call((f_jsfunc.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1681, 23), end: (1681, 34) });
}
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1683, 19), end: (1683, 28) });

_lua_nil()
}}))]);

_lua_nil()
}})); _lua_tmp.clone() };
*real_builtin_func_apply_s.write().unwrap() = { let _lua_tmp = _lua_vec(vec![_lua_call((make_builtin_p_func.read().unwrap().clone()), vec![(data_p_function_builtin_systemName.read().unwrap().clone()), (data_p.read().unwrap().clone())], _lua_debug_loc { start: (1688, 4), end: (1688, 67) }), _lua_vec(vec![(new_data_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), (new_data.read().unwrap().clone())]), _lua_call((make_builtin_get_func.read().unwrap().clone()), vec![(data_name_function_builtin_systemName.read().unwrap().clone()), (data_p.read().unwrap().clone()), (data_name.read().unwrap().clone())], _lua_debug_loc { start: (1690, 4), end: (1690, 83) }), _lua_call((make_builtin_get_func.read().unwrap().clone()), vec![(data_list_function_builtin_systemName.read().unwrap().clone()), (data_p.read().unwrap().clone()), (data_list.read().unwrap().clone())], _lua_debug_loc { start: (1691, 4), end: (1691, 83) }), _lua_call((make_builtin_p_func.read().unwrap().clone()), vec![(null_p_function_builtin_systemName.read().unwrap().clone()), (null_p.read().unwrap().clone())], _lua_debug_loc { start: (1692, 4), end: (1692, 67) }), _lua_vec(vec![(new_construction_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), (new_construction.read().unwrap().clone())]), _lua_call((make_builtin_p_func.read().unwrap().clone()), vec![(construction_p_function_builtin_systemName.read().unwrap().clone()), (construction_p.read().unwrap().clone())], _lua_debug_loc { start: (1694, 4), end: (1694, 83) }), _lua_call((make_builtin_get_func.read().unwrap().clone()), vec![(construction_head_function_builtin_systemName.read().unwrap().clone()), (construction_p.read().unwrap().clone()), (construction_head.read().unwrap().clone())], _lua_debug_loc { start: (1695, 4), end: (1695, 107) }), _lua_call((make_builtin_get_func.read().unwrap().clone()), vec![(construction_tail_function_builtin_systemName.read().unwrap().clone()), (construction_p.read().unwrap().clone()), (construction_tail.read().unwrap().clone())], _lua_debug_loc { start: (1696, 4), end: (1696, 107) }), _lua_vec(vec![(equal_p_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), _lua_lambda(Box::new({let true_v = true_v.clone();
let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let equal_p_function_builtin_systemName = equal_p_function_builtin_systemName.clone();
let if_function_builtin_systemName = if_function_builtin_systemName.clone();
let false_v = false_v.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
let null_p = null_p.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1701, 15), end: (1701, 21) }}).as_bool(_lua_debug_loc { start: (1701, 15), end: (1701, 21) }) {
return (true_v.read().unwrap().clone());
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1704, 16), end: (1704, 25) }); _lua_tmp.clone() };
*y.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1705, 16), end: (1705, 25) }); _lua_tmp.clone() };
if (_lua_op!{or, _lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1706, 15), end: (1706, 30) }), _lua_call((delay_just_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1706, 34), end: (1706, 49) }), _lua_debug_loc { start: (1706, 15), end: (1706, 49) }}).as_bool(_lua_debug_loc { start: (1706, 15), end: (1706, 49) }) {
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(equal_p_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())])], _lua_debug_loc { start: (1707, 23), end: (1707, 86) });
}
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1709, 15), end: (1709, 21) }}).as_bool(_lua_debug_loc { start: (1709, 15), end: (1709, 21) }) {
return (true_v.read().unwrap().clone());
}
let H_if = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*H_if.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let builtin_func_apply = builtin_func_apply.clone();
let if_function_builtin_systemName = if_function_builtin_systemName.clone();
move |mut _lua_arg_tmp, _| {
let b = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(if_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![(b.read().unwrap().clone()), (xx.read().unwrap().clone()), (yy.read().unwrap().clone())])], _lua_debug_loc { start: (1713, 23), end: (1713, 86) });

_lua_nil()
}})); _lua_tmp.clone() };
let H_and = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*H_and.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let H_if = H_if.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((H_if.read().unwrap().clone()), vec![(xx.read().unwrap().clone()), (yy.read().unwrap().clone()), (false_v.read().unwrap().clone())], _lua_debug_loc { start: (1716, 23), end: (1716, 44) });

_lua_nil()
}})); _lua_tmp.clone() };
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_not(_lua_call((delay_just_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1719, 20), end: (1719, 35) }), _lua_debug_loc { start: (1719, 16), end: (1719, 35) })], _lua_debug_loc { start: (1718, 12), end: (1720, 13) });
let end_2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*end_2.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let H_and = H_and.clone();
let builtin_func_apply = builtin_func_apply.clone();
let equal_p_function_builtin_systemName = equal_p_function_builtin_systemName.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((H_and.read().unwrap().clone()), vec![_lua_call((builtin_func_apply.read().unwrap().clone()), vec![(equal_p_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![_lua_call((f1.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1726, 28), end: (1726, 34) }), _lua_call((f1.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1727, 28), end: (1727, 34) })])], _lua_debug_loc { start: (1723, 20), end: (1729, 21) }), _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(equal_p_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![_lua_call((f2.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1733, 28), end: (1733, 34) }), _lua_call((f2.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1734, 28), end: (1734, 34) })])], _lua_debug_loc { start: (1730, 20), end: (1736, 21) })], _lua_debug_loc { start: (1722, 23), end: (1737, 17) });

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1739, 15), end: (1739, 24) })).as_bool(_lua_debug_loc { start: (1739, 15), end: (1739, 24) }) {
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1740, 23), end: (1740, 32) }), _lua_debug_loc { start: (1740, 19), end: (1740, 32) })).as_bool(_lua_debug_loc { start: (1740, 19), end: (1740, 32) }) {
return (false_v.read().unwrap().clone());
}
return (true_v.read().unwrap().clone());
} else if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1744, 19), end: (1744, 28) })).as_bool(_lua_debug_loc { start: (1744, 19), end: (1744, 28) }) {
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1745, 23), end: (1745, 32) }), _lua_debug_loc { start: (1745, 19), end: (1745, 32) })).as_bool(_lua_debug_loc { start: (1745, 19), end: (1745, 32) }) {
return (false_v.read().unwrap().clone());
}
if (_lua_call((atom_equal_p.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1748, 19), end: (1748, 37) })).as_bool(_lua_debug_loc { start: (1748, 19), end: (1748, 37) }) {
return (true_v.read().unwrap().clone());
} else {
return (false_v.read().unwrap().clone());
}
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1753, 19), end: (1753, 28) })).as_bool(_lua_debug_loc { start: (1753, 19), end: (1753, 28) }) {
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1754, 23), end: (1754, 32) }), _lua_debug_loc { start: (1754, 19), end: (1754, 32) })).as_bool(_lua_debug_loc { start: (1754, 19), end: (1754, 32) }) {
return (false_v.read().unwrap().clone());
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (data_name.read().unwrap().clone()), (data_list.read().unwrap().clone())], _lua_debug_loc { start: (1757, 23), end: (1757, 56) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1758, 19), end: (1758, 36) })).as_bool(_lua_debug_loc { start: (1758, 19), end: (1758, 36) }) {
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1759, 23), end: (1759, 40) }), _lua_debug_loc { start: (1759, 19), end: (1759, 40) })).as_bool(_lua_debug_loc { start: (1759, 19), end: (1759, 40) }) {
return (false_v.read().unwrap().clone());
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (construction_head.read().unwrap().clone()), (construction_tail.read().unwrap().clone())], _lua_debug_loc { start: (1762, 23), end: (1762, 72) });
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1764, 19), end: (1764, 31) });

_lua_nil()
}}))]), _lua_vec(vec![(apply_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), _lua_lambda(Box::new({let force_all = force_all.clone();
let construction_p = construction_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let apply = apply.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jslist = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let iter = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1772, 25), end: (1772, 38) })));
while (_lua_call((construction_p.read().unwrap().clone()), vec![(iter.read().unwrap().clone())], _lua_debug_loc { start: (1773, 18), end: (1773, 38) })).as_bool(_lua_debug_loc { start: (1773, 12), end: (1781, 15) }) {
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(jslist.read().unwrap().clone()), _lua_call((construction_head.read().unwrap().clone()), vec![(iter.read().unwrap().clone())], _lua_debug_loc { start: (1776, 20), end: (1776, 43) })], _lua_debug_loc { start: (1774, 16), end: (1777, 17) });
*iter.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(iter.read().unwrap().clone())], _lua_debug_loc { start: (1779, 20), end: (1779, 43) })], _lua_debug_loc { start: (1778, 23), end: (1780, 17) }); _lua_tmp.clone() };
}
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(iter.read().unwrap().clone())], _lua_debug_loc { start: (1782, 19), end: (1782, 31) }), _lua_debug_loc { start: (1782, 15), end: (1782, 31) })).as_bool(_lua_debug_loc { start: (1782, 15), end: (1782, 31) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1783, 23), end: (1783, 32) });
}
return _lua_call((apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (jslist.read().unwrap().clone())], _lua_debug_loc { start: (1785, 19), end: (1785, 35) });

_lua_nil()
}}))]), _lua_vec(vec![(evaluate_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), _lua_lambda(Box::new({let val2env = val2env.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let maybeenv = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val2env.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (1792, 29), end: (1792, 41) })));
if (_lua_op!{eq, (maybeenv.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (1793, 15), end: (1793, 32) }}).as_bool(_lua_debug_loc { start: (1793, 15), end: (1793, 32) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1794, 23), end: (1794, 32) });
}
return _lua_call((evaluate.read().unwrap().clone()), vec![(maybeenv.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (1796, 19), end: (1796, 40) });

_lua_nil()
}}))]), _lua_call((make_builtin_p_func.read().unwrap().clone()), vec![(atom_p_function_builtin_systemName.read().unwrap().clone()), (atom_p.read().unwrap().clone())], _lua_debug_loc { start: (1799, 4), end: (1799, 67) }), _lua_vec(vec![(list_chooseOne_function_builtin_systemName.read().unwrap().clone()), _lua_num!(1), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let list_chooseOne_function_builtin_systemName = list_chooseOne_function_builtin_systemName.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp, _| {
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*xs.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1804, 17), end: (1804, 27) }); _lua_tmp.clone() };
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1805, 15), end: (1805, 31) })).as_bool(_lua_debug_loc { start: (1805, 15), end: (1805, 31) }) {
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(list_chooseOne_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![(xs.read().unwrap().clone())])], _lua_debug_loc { start: (1806, 23), end: (1806, 91) });
}
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1808, 19), end: (1808, 37) }), _lua_debug_loc { start: (1808, 15), end: (1808, 37) })).as_bool(_lua_debug_loc { start: (1808, 15), end: (1808, 37) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1809, 23), end: (1809, 32) });
}
return _lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (1811, 19), end: (1811, 40) });

_lua_nil()
}}))]), _lua_vec(vec![(if_function_builtin_systemName.read().unwrap().clone()), _lua_num!(3), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let if_function_builtin_systemName = if_function_builtin_systemName.clone();
let data_p = data_p.clone();
let force_all = force_all.clone();
let data_name = data_name.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let true_atom = true_atom.clone();
let false_atom = false_atom.clone();
move |mut _lua_arg_tmp, _| {
let b = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*b.write().unwrap() = { let _lua_tmp = _lua_call((force1.read().unwrap().clone()), vec![(b.read().unwrap().clone())], _lua_debug_loc { start: (1818, 16), end: (1818, 25) }); _lua_tmp.clone() };
if (_lua_call((delay_just_p.read().unwrap().clone()), vec![(b.read().unwrap().clone())], _lua_debug_loc { start: (1819, 15), end: (1819, 30) })).as_bool(_lua_debug_loc { start: (1819, 15), end: (1819, 30) }) {
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(if_function_builtin_systemName.read().unwrap().clone()), _lua_vec(vec![(b.read().unwrap().clone()), (x.read().unwrap().clone()), (y.read().unwrap().clone())])], _lua_debug_loc { start: (1820, 23), end: (1820, 84) });
}
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(b.read().unwrap().clone())], _lua_debug_loc { start: (1822, 19), end: (1822, 28) }), _lua_debug_loc { start: (1822, 15), end: (1822, 28) })).as_bool(_lua_debug_loc { start: (1822, 15), end: (1822, 28) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1823, 23), end: (1823, 32) });
}
let nam = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((data_name.read().unwrap().clone()), vec![(b.read().unwrap().clone())], _lua_debug_loc { start: (1826, 16), end: (1826, 28) })], _lua_debug_loc { start: (1825, 24), end: (1827, 13) })));
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(nam.read().unwrap().clone())], _lua_debug_loc { start: (1828, 19), end: (1828, 30) }), _lua_debug_loc { start: (1828, 15), end: (1828, 30) })).as_bool(_lua_debug_loc { start: (1828, 15), end: (1828, 30) }) {
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1829, 23), end: (1829, 32) });
}
if (_lua_call((atom_equal_p.read().unwrap().clone()), vec![(nam.read().unwrap().clone()), (true_atom.read().unwrap().clone())], _lua_debug_loc { start: (1831, 15), end: (1831, 43) })).as_bool(_lua_debug_loc { start: (1831, 15), end: (1831, 43) }) {
return (x.read().unwrap().clone());
}
if (_lua_call((atom_equal_p.read().unwrap().clone()), vec![(nam.read().unwrap().clone()), (false_atom.read().unwrap().clone())], _lua_debug_loc { start: (1834, 15), end: (1834, 44) })).as_bool(_lua_debug_loc { start: (1834, 15), end: (1834, 44) }) {
return (y.read().unwrap().clone());
}
return _lua_call((error_v.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1837, 19), end: (1837, 28) });

_lua_nil()
}}))]), _lua_vec(vec![(comment_function_builtin_systemName.read().unwrap().clone()), _lua_num!(2), (new_comment.read().unwrap().clone())])]); _lua_tmp.clone() };
let jsbool_no_force_isomorphism_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*jsbool_no_force_isomorphism_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
let jsbool_no_force_isomorphism_p = jsbool_no_force_isomorphism_p.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
let null_p = null_p.clone();
let null_v = null_v.clone();
let atom_p = atom_p.clone();
let atom_equal_p = atom_equal_p.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let delay_p = delay_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1843, 7), end: (1843, 13) }}).as_bool(_lua_debug_loc { start: (1843, 7), end: (1843, 13) }) {
return _lua_true();
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1846, 8), end: (1846, 22) }); _lua_tmp.clone() };
*y.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1847, 8), end: (1847, 22) }); _lua_tmp.clone() };
if (_lua_op!{eq, (x.read().unwrap().clone()), (y.read().unwrap().clone()), _lua_debug_loc { start: (1848, 7), end: (1848, 13) }}).as_bool(_lua_debug_loc { start: (1848, 7), end: (1848, 13) }) {
return _lua_true();
}
let end_2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*end_2.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let jsbool_no_force_isomorphism_p = jsbool_no_force_isomorphism_p.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{and, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_call((f1.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1853, 12), end: (1853, 18) }), _lua_call((f1.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1854, 12), end: (1854, 18) })], _lua_debug_loc { start: (1852, 11), end: (1855, 9) }), _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_call((f2.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (1856, 12), end: (1856, 18) }), _lua_call((f2.read().unwrap().clone()), vec![(yy.read().unwrap().clone())], _lua_debug_loc { start: (1857, 12), end: (1857, 18) })], _lua_debug_loc { start: (1855, 14), end: (1858, 9) }), _lua_debug_loc { start: (1852, 11), end: (1858, 9) }}).as_bool(_lua_debug_loc { start: (1852, 11), end: (1858, 9) }) {
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(xx.read().unwrap().clone()), (yy.read().unwrap().clone())], _lua_debug_loc { start: (1859, 12), end: (1859, 44) });
return _lua_true();
} else {
return _lua_false();
}

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1865, 7), end: (1865, 16) })).as_bool(_lua_debug_loc { start: (1865, 7), end: (1865, 16) }) {
if (_lua_not(_lua_call((null_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1866, 15), end: (1866, 24) }), _lua_debug_loc { start: (1866, 11), end: (1866, 24) })).as_bool(_lua_debug_loc { start: (1866, 11), end: (1866, 24) }) {
return _lua_false();
}
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (1869, 8), end: (1869, 43) });
_lua_call((lang_assert_equal_set_do.read().unwrap().clone()), vec![(y.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (1870, 8), end: (1870, 43) });
return _lua_true();
} else if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1872, 11), end: (1872, 20) })).as_bool(_lua_debug_loc { start: (1872, 11), end: (1872, 20) }) {
if (_lua_not(_lua_call((atom_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1873, 15), end: (1873, 24) }), _lua_debug_loc { start: (1873, 11), end: (1873, 24) })).as_bool(_lua_debug_loc { start: (1873, 11), end: (1873, 24) }) {
return _lua_false();
}
return _lua_call((atom_equal_p.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (1876, 15), end: (1876, 33) });
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1877, 11), end: (1877, 28) })).as_bool(_lua_debug_loc { start: (1877, 11), end: (1877, 28) }) {
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1878, 15), end: (1878, 32) }), _lua_debug_loc { start: (1878, 11), end: (1878, 32) })).as_bool(_lua_debug_loc { start: (1878, 11), end: (1878, 32) }) {
return _lua_false();
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (construction_head.read().unwrap().clone()), (construction_tail.read().unwrap().clone())], _lua_debug_loc { start: (1881, 15), end: (1881, 64) });
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1882, 11), end: (1882, 20) })).as_bool(_lua_debug_loc { start: (1882, 11), end: (1882, 20) }) {
if (_lua_not(_lua_call((data_p.read().unwrap().clone()), vec![(y.read().unwrap().clone())], _lua_debug_loc { start: (1883, 15), end: (1883, 24) }), _lua_debug_loc { start: (1883, 11), end: (1883, 24) })).as_bool(_lua_debug_loc { start: (1883, 11), end: (1883, 24) }) {
return _lua_false();
}
return _lua_call((end_2.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone()), (data_name.read().unwrap().clone()), (data_list.read().unwrap().clone())], _lua_debug_loc { start: (1886, 15), end: (1886, 48) });
} else if (_lua_call((delay_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1887, 11), end: (1887, 21) })).as_bool(_lua_debug_loc { start: (1887, 11), end: (1887, 21) }) {
return _lua_false();
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1890, 11), end: (1890, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
let complex_parse = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*complex_parse.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let string = string.clone();
let error = error.clone();
let tostring = tostring.clone();
let new_atom = new_atom.clone();
let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
let new_construction = new_construction.clone();
let null_v = null_v.clone();
let construction_p = construction_p.clone();
let new_data = new_data.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let sub_atom = sub_atom.clone();
let jsArray_to_list = jsArray_to_list.clone();
let form_atom = form_atom.clone();
let system_atom = system_atom.clone();
let theThing_atom = theThing_atom.clone();
let atom_p = atom_p.clone();
let systemName_make = systemName_make.clone();
let null_p = null_p.clone();
let val2env = val2env.clone();
let evaluate = evaluate.clone();
let list_to_jsArray = list_to_jsArray.clone();
let builtin_func_apply = builtin_func_apply.clone();
let builtin_form_apply = builtin_form_apply.clone();
let apply = apply.clone();
let new_comment = new_comment.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state_const = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let state = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let eof = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let get = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let put = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let parse_error = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let a_space_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let space = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let atom = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readlist = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let data = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readeval = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readfuncapply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readformbuiltin = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readapply = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readcomment = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let a_atom_p = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let val = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let un_maybe = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let not_eof = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let assert_get = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readsysname_no_pack_inner_must = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let may_xfx_xf = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readsysname_no_pack = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let readsysname = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*eof.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp, _| {
return _lua_op!{eq, _lua_len((state_const.read().unwrap().clone()), _lua_debug_loc { start: (1895, 15), end: (1895, 27) }), (state.read().unwrap().clone()), _lua_debug_loc { start: (1895, 15), end: (1895, 36) }};

_lua_nil()
}})); _lua_tmp.clone() };
*get.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let eof = eof.clone();
let string = string.clone();
let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp, _| {
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_not(_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1899, 16), end: (1899, 21) }), _lua_debug_loc { start: (1899, 12), end: (1899, 21) })], _lua_debug_loc { start: (1898, 8), end: (1900, 9) });
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_call(_lua_lookup((string.read().unwrap().clone()),_lua_str("sub"), _lua_debug_loc { start: (1901, 20), end: (1901, 65) }), vec![(state_const.read().unwrap().clone()), _lua_op!{add, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1901, 44), end: (1901, 53) }}, _lua_op!{add, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1901, 55), end: (1901, 64) }}], _lua_debug_loc { start: (1901, 20), end: (1901, 65) })));
*state.write().unwrap() = { let _lua_tmp = _lua_op!{add, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1902, 16), end: (1902, 25) }}; _lua_tmp.clone() };
return (ret.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*put.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let string = string.clone();
let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp, _| {
let chr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((LANG_ASSERT.read().unwrap().clone()), vec![_lua_op!{eq, _lua_call(_lua_lookup((string.read().unwrap().clone()),_lua_str("sub"), _lua_debug_loc { start: (1907, 12), end: (1907, 49) }), vec![(state_const.read().unwrap().clone()), (state.read().unwrap().clone()), (state.read().unwrap().clone())], _lua_debug_loc { start: (1907, 12), end: (1907, 49) }), (chr.read().unwrap().clone()), _lua_debug_loc { start: (1907, 12), end: (1907, 56) }}], _lua_debug_loc { start: (1906, 8), end: (1908, 9) });
*state.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (1909, 16), end: (1909, 25) }}; _lua_tmp.clone() };

_lua_nil()
}})); _lua_tmp.clone() };
*parse_error.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (1912, 11), end: (1912, 19) }}).as_bool(_lua_debug_loc { start: (1912, 11), end: (1912, 19) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_str(""); _lua_tmp.clone() };
}
_lua_call((error.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("TheLanguage parse ERROR!"), _lua_call((tostring.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1916, 42), end: (1916, 53) }), _lua_debug_loc { start: (1916, 12), end: (1916, 53) }}], _lua_debug_loc { start: (1915, 8), end: (1917, 9) });

_lua_nil()
}})); _lua_tmp.clone() };
*a_space_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let chr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_op!{or, _lua_op!{or, _lua_op!{eq, (chr.read().unwrap().clone()), _lua_str(" "), _lua_debug_loc { start: (1920, 15), end: (1920, 70) }}, _lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("\n"), _lua_debug_loc { start: (1920, 29), end: (1920, 40) }}, _lua_debug_loc { start: (1920, 15), end: (1920, 70) }}, _lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("\t"), _lua_debug_loc { start: (1920, 44), end: (1920, 55) }}, _lua_debug_loc { start: (1920, 15), end: (1920, 70) }}, _lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("\r"), _lua_debug_loc { start: (1920, 59), end: (1920, 70) }}, _lua_debug_loc { start: (1920, 15), end: (1920, 70) }};

_lua_nil()
}})); _lua_tmp.clone() };
*space.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let a_space_p = a_space_p.clone();
let put = put.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1923, 11), end: (1923, 16) })).as_bool(_lua_debug_loc { start: (1923, 11), end: (1923, 16) }) {
return _lua_false();
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1926, 18), end: (1926, 23) })));
if (_lua_not(_lua_call((a_space_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1927, 15), end: (1927, 27) }), _lua_debug_loc { start: (1927, 11), end: (1927, 27) })).as_bool(_lua_debug_loc { start: (1927, 11), end: (1927, 27) }) {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1928, 12), end: (1928, 18) });
return _lua_false();
}
while (_lua_op!{and, _lua_call((a_space_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1931, 14), end: (1931, 26) }), _lua_not(_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1931, 35), end: (1931, 40) }), _lua_debug_loc { start: (1931, 31), end: (1931, 40) }), _lua_debug_loc { start: (1931, 14), end: (1931, 40) }}).as_bool(_lua_debug_loc { start: (1931, 8), end: (1933, 11) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1932, 16), end: (1932, 21) }); _lua_tmp.clone() };
}
if (_lua_not(_lua_call((a_space_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1934, 15), end: (1934, 27) }), _lua_debug_loc { start: (1934, 11), end: (1934, 27) })).as_bool(_lua_debug_loc { start: (1934, 11), end: (1934, 27) }) {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1935, 12), end: (1935, 18) });
}
return _lua_true();

_lua_nil()
}})); _lua_tmp.clone() };
*atom.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let a_atom_p = a_atom_p.clone();
let put = put.clone();
let tostring = tostring.clone();
let new_atom = new_atom.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1940, 11), end: (1940, 16) })).as_bool(_lua_debug_loc { start: (1940, 11), end: (1940, 16) }) {
return _lua_false();
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1943, 18), end: (1943, 23) })));
let ret = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
if (_lua_not(_lua_call((a_atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1945, 15), end: (1945, 26) }), _lua_debug_loc { start: (1945, 11), end: (1945, 26) })).as_bool(_lua_debug_loc { start: (1945, 11), end: (1945, 26) }) {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1946, 12), end: (1946, 18) });
return _lua_false();
}
while (_lua_op!{and, _lua_call((a_atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1949, 14), end: (1949, 25) }), _lua_not(_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1949, 34), end: (1949, 39) }), _lua_debug_loc { start: (1949, 30), end: (1949, 39) }), _lua_debug_loc { start: (1949, 14), end: (1949, 39) }}).as_bool(_lua_debug_loc { start: (1949, 8), end: (1952, 11) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (1950, 18), end: (1950, 31) }), _lua_call((tostring.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1950, 35), end: (1950, 46) }), _lua_debug_loc { start: (1950, 18), end: (1950, 46) }}; _lua_tmp.clone() };
*x.write().unwrap() = { let _lua_tmp = _lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1951, 16), end: (1951, 21) }); _lua_tmp.clone() };
}
if (_lua_call((a_atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1953, 11), end: (1953, 22) })).as_bool(_lua_debug_loc { start: (1953, 11), end: (1953, 22) }) {
*ret.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (1954, 18), end: (1954, 31) }), _lua_call((tostring.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1954, 35), end: (1954, 46) }), _lua_debug_loc { start: (1954, 18), end: (1954, 46) }}; _lua_tmp.clone() };
} else {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1956, 12), end: (1956, 18) });
}
return _lua_call((new_atom.read().unwrap().clone()), vec![(ret.read().unwrap().clone())], _lua_debug_loc { start: (1958, 15), end: (1958, 28) });

_lua_nil()
}})); _lua_tmp.clone() };
*readlist.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
let new_construction = new_construction.clone();
let space = space.clone();
let parse_error = parse_error.clone();
let null_v = null_v.clone();
let val = val.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1961, 11), end: (1961, 16) })).as_bool(_lua_debug_loc { start: (1961, 11), end: (1961, 16) }) {
return _lua_false();
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1964, 18), end: (1964, 23) })));
if (_lua_op!{not_eq, (x.read().unwrap().clone()), _lua_str("("), _lua_debug_loc { start: (1965, 11), end: (1965, 19) }}).as_bool(_lua_debug_loc { start: (1965, 11), end: (1965, 19) }) {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (1966, 12), end: (1966, 18) });
return _lua_false();
}
let ret_last = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_hole_do.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1969, 25), end: (1969, 38) })));
let ret = std::sync::Arc::new(std::sync::RwLock::new((ret_last.read().unwrap().clone())));
let last_add_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*last_add_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
let ret_last = ret_last.clone();
let new_construction = new_construction.clone();
move |mut _lua_arg_tmp, _| {
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret_last2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_hole_do.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1972, 30), end: (1972, 43) })));
_lua_call((hole_set_do.read().unwrap().clone()), vec![(ret_last.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(val.read().unwrap().clone()), (ret_last2.read().unwrap().clone())], _lua_debug_loc { start: (1975, 16), end: (1975, 48) })], _lua_debug_loc { start: (1973, 12), end: (1976, 13) });
*ret_last.write().unwrap() = { let _lua_tmp = (ret_last2.read().unwrap().clone()); _lua_tmp.clone() };

_lua_nil()
}})); _lua_tmp.clone() };
while (_lua_true()).as_bool(_lua_debug_loc { start: (1979, 8), end: (2006, 11) }) {
_lua_call((space.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1980, 12), end: (1980, 19) });
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1981, 15), end: (1981, 20) })).as_bool(_lua_debug_loc { start: (1981, 15), end: (1981, 20) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1982, 23), end: (1982, 36) });
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1984, 16), end: (1984, 21) }); _lua_tmp.clone() };
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_str(")"), _lua_debug_loc { start: (1985, 15), end: (1985, 23) }}).as_bool(_lua_debug_loc { start: (1985, 15), end: (1985, 23) }) {
_lua_call((hole_set_do.read().unwrap().clone()), vec![(ret_last.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (1986, 16), end: (1986, 45) });
return (ret.read().unwrap().clone());
}
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_str("."), _lua_debug_loc { start: (1989, 15), end: (1989, 23) }}).as_bool(_lua_debug_loc { start: (1989, 15), end: (1989, 23) }) {
_lua_call((space.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1990, 16), end: (1990, 23) });
let e = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1991, 26), end: (1991, 31) })));
_lua_call((hole_set_do.read().unwrap().clone()), vec![(ret_last.read().unwrap().clone()), (e.read().unwrap().clone())], _lua_debug_loc { start: (1992, 16), end: (1992, 40) });
_lua_call((space.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1993, 16), end: (1993, 23) });
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1994, 19), end: (1994, 24) })).as_bool(_lua_debug_loc { start: (1994, 19), end: (1994, 24) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1995, 27), end: (1995, 40) });
}
*x.write().unwrap() = { let _lua_tmp = _lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1997, 20), end: (1997, 25) }); _lua_tmp.clone() };
if (_lua_op!{not_eq, (x.read().unwrap().clone()), _lua_str(")"), _lua_debug_loc { start: (1998, 19), end: (1998, 27) }}).as_bool(_lua_debug_loc { start: (1998, 19), end: (1998, 27) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (1999, 27), end: (1999, 40) });
}
return (ret.read().unwrap().clone());
}
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2003, 12), end: (2003, 18) });
let e = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2004, 22), end: (2004, 27) })));
_lua_call((last_add_do.read().unwrap().clone()), vec![(e.read().unwrap().clone())], _lua_debug_loc { start: (2005, 12), end: (2005, 26) });
}

_lua_nil()
}})); _lua_tmp.clone() };
*data.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let new_data = new_data.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2009, 11), end: (2009, 16) })).as_bool(_lua_debug_loc { start: (2009, 11), end: (2009, 16) }) {
return _lua_false();
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2012, 18), end: (2012, 23) })));
if (_lua_op!{not_eq, (x.read().unwrap().clone()), _lua_str("#"), _lua_debug_loc { start: (2013, 11), end: (2013, 19) }}).as_bool(_lua_debug_loc { start: (2013, 11), end: (2013, 19) }) {
_lua_call((put.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2014, 12), end: (2014, 18) });
return _lua_false();
}
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readlist.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2017, 19), end: (2017, 29) })));
if (_lua_op!{eq, (xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2018, 11), end: (2018, 22) }}).as_bool(_lua_debug_loc { start: (2018, 11), end: (2018, 22) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2019, 19), end: (2019, 32) });
}
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2021, 15), end: (2021, 33) }), _lua_debug_loc { start: (2021, 11), end: (2021, 33) })).as_bool(_lua_debug_loc { start: (2021, 11), end: (2021, 33) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2022, 19), end: (2022, 32) });
}
return _lua_call((new_data.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2025, 12), end: (2025, 33) }), _lua_call((construction_tail.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2026, 12), end: (2026, 33) })], _lua_debug_loc { start: (2024, 15), end: (2027, 9) });

_lua_nil()
}})); _lua_tmp.clone() };
*a_atom_p.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let a_space_p = a_space_p.clone();
move |mut _lua_arg_tmp, _| {
let chr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((a_space_p.read().unwrap().clone()), vec![(chr.read().unwrap().clone())], _lua_debug_loc { start: (2030, 11), end: (2030, 25) })).as_bool(_lua_debug_loc { start: (2030, 11), end: (2030, 25) }) {
return _lua_false();
}
for (_lua_tmp_k, _lua_tmp_v) in _lua_vec(vec![_lua_str("("), _lua_str(")"), _lua_str("!"), _lua_str("#"), _lua_str("."), _lua_str("$"), _lua_str("%"), _lua_str("^"), _lua_str("@"), _lua_str("~"), _lua_str("/"), _lua_str("-"), _lua_str(">"), _lua_str("_"), _lua_str(":"), _lua_str("?"), _lua_str("["), _lua_str("]"), _lua_str("&"), _lua_str(";")]).as_table(_lua_debug_loc { start: (2033, 30), end: (2033, 130) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let v=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
if (_lua_op!{eq, (v.read().unwrap().clone()), (chr.read().unwrap().clone()), _lua_debug_loc { start: (2034, 15), end: (2034, 23) }}).as_bool(_lua_debug_loc { start: (2034, 15), end: (2034, 23) }) {
return _lua_false();
}
}
return _lua_true();

_lua_nil()
}})); _lua_tmp.clone() };
*val.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let space = space.clone();
let readlist = readlist.clone();
let readsysname = readsysname.clone();
let data = data.clone();
let readeval = readeval.clone();
let readfuncapply = readfuncapply.clone();
let readformbuiltin = readformbuiltin.clone();
let readapply = readapply.clone();
let readcomment = readcomment.clone();
let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
_lua_call((space.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2041, 8), end: (2041, 15) });
let fs = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![(readlist.read().unwrap().clone()), (readsysname.read().unwrap().clone()), (data.read().unwrap().clone()), (readeval.read().unwrap().clone()), (readfuncapply.read().unwrap().clone()), (readformbuiltin.read().unwrap().clone()), (readapply.read().unwrap().clone()), (readcomment.read().unwrap().clone())])));
for (_lua_tmp_k, _lua_tmp_v) in (fs.read().unwrap().clone()).as_table(_lua_debug_loc { start: (2043, 30), end: (2043, 32) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let f=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((f.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2044, 22), end: (2044, 25) })));
if (_lua_op!{not_eq, (x.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2045, 15), end: (2045, 25) }}).as_bool(_lua_debug_loc { start: (2045, 15), end: (2045, 25) }) {
return (x.read().unwrap().clone());
}
}
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2049, 15), end: (2049, 28) });

_lua_nil()
}})); _lua_tmp.clone() };
*un_maybe.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let vl = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (vl.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2052, 11), end: (2052, 22) }}).as_bool(_lua_debug_loc { start: (2052, 11), end: (2052, 22) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2053, 19), end: (2053, 32) });
}
return (vl.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
*not_eof.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
move |mut _lua_arg_tmp, _| {
return _lua_not(_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2058, 19), end: (2058, 24) }), _lua_debug_loc { start: (2058, 15), end: (2058, 24) });

_lua_nil()
}})); _lua_tmp.clone() };
*assert_get.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_maybe = un_maybe.clone();
let not_eof = not_eof.clone();
let get = get.clone();
move |mut _lua_arg_tmp, _| {
let c = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((un_maybe.read().unwrap().clone()), vec![_lua_call((not_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2062, 12), end: (2062, 21) })], _lua_debug_loc { start: (2061, 8), end: (2063, 9) });
_lua_call((un_maybe.read().unwrap().clone()), vec![_lua_op!{eq, _lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2065, 12), end: (2065, 17) }), (c.read().unwrap().clone()), _lua_debug_loc { start: (2065, 12), end: (2065, 22) }}], _lua_debug_loc { start: (2064, 8), end: (2066, 9) });

_lua_nil()
}})); _lua_tmp.clone() };
*readsysname_no_pack_inner_must.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let assert_get = assert_get.clone();
let readsysname_no_pack_inner_must = readsysname_no_pack_inner_must.clone();
let readlist = readlist.clone();
let atom = atom.clone();
let data = data.clone();
let readeval = readeval.clone();
let readfuncapply = readfuncapply.clone();
let readformbuiltin = readformbuiltin.clone();
let readapply = readapply.clone();
let readcomment = readcomment.clone();
let readsysname_no_pack = readsysname_no_pack.clone();
let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let strict = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (strict.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (2069, 11), end: (2069, 24) }}).as_bool(_lua_debug_loc { start: (2069, 11), end: (2069, 24) }) {
*strict.write().unwrap() = { let _lua_tmp = _lua_false(); _lua_tmp.clone() };
}
let readsysname_no_pack_bracket = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*readsysname_no_pack_bracket.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let assert_get = assert_get.clone();
let readsysname_no_pack_inner_must = readsysname_no_pack_inner_must.clone();
move |mut _lua_arg_tmp, _| {
_lua_call((assert_get.read().unwrap().clone()), vec![_lua_str("[")], _lua_debug_loc { start: (2073, 12), end: (2073, 27) });
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2074, 22), end: (2074, 54) })));
_lua_call((assert_get.read().unwrap().clone()), vec![_lua_str("]")], _lua_debug_loc { start: (2075, 12), end: (2075, 27) });
return (x.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
let fs = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
if ((strict.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (2079, 11), end: (2079, 17) }) {
*fs.write().unwrap() = { let _lua_tmp = _lua_vec(vec![(readlist.read().unwrap().clone()), (atom.read().unwrap().clone()), (readsysname_no_pack_bracket.read().unwrap().clone()), (data.read().unwrap().clone()), (readeval.read().unwrap().clone()), (readfuncapply.read().unwrap().clone()), (readformbuiltin.read().unwrap().clone()), (readapply.read().unwrap().clone()), (readcomment.read().unwrap().clone())]); _lua_tmp.clone() };
} else {
*fs.write().unwrap() = { let _lua_tmp = _lua_vec(vec![(readlist.read().unwrap().clone()), (readsysname_no_pack.read().unwrap().clone()), (data.read().unwrap().clone()), (readeval.read().unwrap().clone()), (readfuncapply.read().unwrap().clone()), (readformbuiltin.read().unwrap().clone()), (readapply.read().unwrap().clone()), (readcomment.read().unwrap().clone())]); _lua_tmp.clone() };
}
for (_lua_tmp_k, _lua_tmp_v) in (fs.read().unwrap().clone()).as_table(_lua_debug_loc { start: (2084, 30), end: (2084, 32) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let f=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((f.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2085, 22), end: (2085, 25) })));
if (_lua_op!{not_eq, (x.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2086, 15), end: (2086, 25) }}).as_bool(_lua_debug_loc { start: (2086, 15), end: (2086, 25) }) {
return (x.read().unwrap().clone());
}
}
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2090, 15), end: (2090, 28) });

_lua_nil()
}})); _lua_tmp.clone() };
*may_xfx_xf.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let readsysname_no_pack_inner_must = readsysname_no_pack_inner_must.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let new_construction = new_construction.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let put = put.clone();
let sub_atom = sub_atom.clone();
let jsArray_to_list = jsArray_to_list.clone();
move |mut _lua_arg_tmp, _| {
let vl = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2093, 11), end: (2093, 16) })).as_bool(_lua_debug_loc { start: (2093, 11), end: (2093, 16) }) {
return (vl.read().unwrap().clone());
}
let head = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2096, 21), end: (2096, 26) })));
if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("."), _lua_debug_loc { start: (2097, 11), end: (2097, 22) }}).as_bool(_lua_debug_loc { start: (2097, 11), end: (2097, 22) }) {
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2098, 22), end: (2098, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(vl.read().unwrap().clone())], _lua_debug_loc { start: (2103, 20), end: (2103, 32) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2101, 16), end: (2105, 17) }), (y.read().unwrap().clone())], _lua_debug_loc { start: (2099, 19), end: (2107, 13) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str(":"), _lua_debug_loc { start: (2108, 15), end: (2108, 26) }}).as_bool(_lua_debug_loc { start: (2108, 15), end: (2108, 26) }) {
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2109, 22), end: (2109, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (y.read().unwrap().clone()), (vl.read().unwrap().clone())], _lua_debug_loc { start: (2110, 19), end: (2110, 55) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("~"), _lua_debug_loc { start: (2111, 15), end: (2111, 26) }}).as_bool(_lua_debug_loc { start: (2111, 15), end: (2111, 26) }) {
return _lua_call((new_list.read().unwrap().clone()), vec![(isOrNot_atom.read().unwrap().clone()), (vl.read().unwrap().clone())], _lua_debug_loc { start: (2112, 19), end: (2112, 45) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("@"), _lua_debug_loc { start: (2113, 15), end: (2113, 26) }}).as_bool(_lua_debug_loc { start: (2113, 15), end: (2113, 26) }) {
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2114, 22), end: (2114, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(vl.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2119, 20), end: (2119, 56) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2117, 16), end: (2121, 17) }), (y.read().unwrap().clone())], _lua_debug_loc { start: (2115, 19), end: (2123, 13) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("?"), _lua_debug_loc { start: (2124, 15), end: (2124, 26) }}).as_bool(_lua_debug_loc { start: (2124, 15), end: (2124, 26) }) {
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(isOrNot_atom.read().unwrap().clone()), (vl.read().unwrap().clone())], _lua_debug_loc { start: (2128, 16), end: (2128, 42) })], _lua_debug_loc { start: (2125, 19), end: (2129, 13) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("/"), _lua_debug_loc { start: (2130, 15), end: (2130, 26) }}).as_bool(_lua_debug_loc { start: (2130, 15), end: (2130, 26) }) {
let ys = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![(vl.read().unwrap().clone())])));
while (_lua_true()).as_bool(_lua_debug_loc { start: (2132, 12), end: (2143, 15) }) {
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![_lua_true()], _lua_debug_loc { start: (2133, 26), end: (2133, 62) })));
_lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(ys.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (2134, 16), end: (2134, 38) });
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2135, 19), end: (2135, 24) })).as_bool(_lua_debug_loc { start: (2135, 19), end: (2135, 24) }) {
break;
}
let c0 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2138, 27), end: (2138, 32) })));
if (_lua_op!{not_eq, (c0.read().unwrap().clone()), _lua_str("/"), _lua_debug_loc { start: (2139, 19), end: (2139, 28) }}).as_bool(_lua_debug_loc { start: (2139, 19), end: (2139, 28) }) {
_lua_call((put.read().unwrap().clone()), vec![(c0.read().unwrap().clone())], _lua_debug_loc { start: (2140, 20), end: (2140, 27) });
break;
}
}
return _lua_call((new_list.read().unwrap().clone()), vec![(sub_atom.read().unwrap().clone()), _lua_call((jsArray_to_list.read().unwrap().clone()), vec![(ys.read().unwrap().clone())], _lua_debug_loc { start: (2146, 16), end: (2146, 35) })], _lua_debug_loc { start: (2144, 19), end: (2147, 13) });
} else {
_lua_call((put.read().unwrap().clone()), vec![(head.read().unwrap().clone())], _lua_debug_loc { start: (2149, 12), end: (2149, 21) });
return (vl.read().unwrap().clone());
}

_lua_nil()
}})); _lua_tmp.clone() };
*readsysname_no_pack.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let un_maybe = un_maybe.clone();
let not_eof = not_eof.clone();
let readsysname_no_pack_inner_must = readsysname_no_pack_inner_must.clone();
let new_list = new_list.clone();
let form_atom = form_atom.clone();
let system_atom = system_atom.clone();
let put = put.clone();
let assert_get = assert_get.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let theThing_atom = theThing_atom.clone();
let may_xfx_xf = may_xfx_xf.clone();
let atom = atom.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2154, 11), end: (2154, 16) })).as_bool(_lua_debug_loc { start: (2154, 11), end: (2154, 16) }) {
return _lua_false();
}
let head = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2157, 21), end: (2157, 26) })));
if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("&"), _lua_debug_loc { start: (2158, 11), end: (2158, 22) }}).as_bool(_lua_debug_loc { start: (2158, 11), end: (2158, 22) }) {
_lua_call((un_maybe.read().unwrap().clone()), vec![_lua_call((not_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2160, 16), end: (2160, 25) })], _lua_debug_loc { start: (2159, 12), end: (2161, 13) });
let c0 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2162, 23), end: (2162, 28) })));
if (_lua_op!{eq, (c0.read().unwrap().clone()), _lua_str("+"), _lua_debug_loc { start: (2163, 15), end: (2163, 24) }}).as_bool(_lua_debug_loc { start: (2163, 15), end: (2163, 24) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2164, 26), end: (2164, 58) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2167, 20), end: (2167, 44) })], _lua_debug_loc { start: (2165, 23), end: (2168, 17) });
} else {
_lua_call((put.read().unwrap().clone()), vec![(c0.read().unwrap().clone())], _lua_debug_loc { start: (2170, 16), end: (2170, 23) });
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2172, 22), end: (2172, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2173, 19), end: (2173, 41) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str(":"), _lua_debug_loc { start: (2174, 15), end: (2174, 26) }}).as_bool(_lua_debug_loc { start: (2174, 15), end: (2174, 26) }) {
_lua_call((un_maybe.read().unwrap().clone()), vec![_lua_call((not_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2176, 16), end: (2176, 25) })], _lua_debug_loc { start: (2175, 12), end: (2177, 13) });
let c0 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2178, 23), end: (2178, 28) })));
if (_lua_op!{eq, (c0.read().unwrap().clone()), _lua_str("&"), _lua_debug_loc { start: (2179, 15), end: (2179, 24) }}).as_bool(_lua_debug_loc { start: (2179, 15), end: (2179, 24) }) {
_lua_call((assert_get.read().unwrap().clone()), vec![_lua_str(">")], _lua_debug_loc { start: (2180, 16), end: (2180, 31) });
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2181, 26), end: (2181, 58) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(form_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2186, 24), end: (2186, 66) })], _lua_debug_loc { start: (2184, 20), end: (2187, 21) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2182, 23), end: (2189, 17) });
} else if (_lua_op!{eq, (c0.read().unwrap().clone()), _lua_str(">"), _lua_debug_loc { start: (2190, 19), end: (2190, 28) }}).as_bool(_lua_debug_loc { start: (2190, 19), end: (2190, 28) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2191, 26), end: (2191, 58) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), (something_atom.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2194, 20), end: (2194, 62) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2192, 23), end: (2196, 17) });
} else {
_lua_call((put.read().unwrap().clone()), vec![(c0.read().unwrap().clone())], _lua_debug_loc { start: (2198, 16), end: (2198, 23) });
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2200, 22), end: (2200, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (x.read().unwrap().clone()), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2201, 19), end: (2201, 66) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("+"), _lua_debug_loc { start: (2202, 15), end: (2202, 26) }}).as_bool(_lua_debug_loc { start: (2202, 15), end: (2202, 26) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2203, 22), end: (2203, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(system_atom.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2204, 19), end: (2204, 43) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("["), _lua_debug_loc { start: (2205, 15), end: (2205, 26) }}).as_bool(_lua_debug_loc { start: (2205, 15), end: (2205, 26) }) {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2206, 22), end: (2206, 54) })));
_lua_call((assert_get.read().unwrap().clone()), vec![_lua_str("]")], _lua_debug_loc { start: (2207, 12), end: (2207, 27) });
return _lua_call((may_xfx_xf.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2208, 19), end: (2208, 32) });
} else if (_lua_op!{eq, (head.read().unwrap().clone()), _lua_str("_"), _lua_debug_loc { start: (2209, 15), end: (2209, 26) }}).as_bool(_lua_debug_loc { start: (2209, 15), end: (2209, 26) }) {
_lua_call((assert_get.read().unwrap().clone()), vec![_lua_str(":")], _lua_debug_loc { start: (2210, 12), end: (2210, 27) });
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack_inner_must.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2211, 22), end: (2211, 54) })));
return _lua_call((new_list.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), (x.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2212, 19), end: (2212, 67) });
} else {
_lua_call((put.read().unwrap().clone()), vec![(head.read().unwrap().clone())], _lua_debug_loc { start: (2214, 12), end: (2214, 21) });
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((atom.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2215, 22), end: (2215, 28) })));
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2216, 15), end: (2216, 25) }}).as_bool(_lua_debug_loc { start: (2216, 15), end: (2216, 25) }) {
return _lua_false();
}
return _lua_call((may_xfx_xf.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2219, 19), end: (2219, 32) });
}

_lua_nil()
}})); _lua_tmp.clone() };
*readsysname.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let readsysname_no_pack = readsysname_no_pack.clone();
let atom_p = atom_p.clone();
let systemName_make = systemName_make.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readsysname_no_pack.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2223, 18), end: (2223, 39) })));
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2224, 11), end: (2224, 21) }}).as_bool(_lua_debug_loc { start: (2224, 11), end: (2224, 21) }) {
return _lua_false();
}
if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2227, 11), end: (2227, 20) })).as_bool(_lua_debug_loc { start: (2227, 11), end: (2227, 20) }) {
return (x.read().unwrap().clone());
}
return _lua_call((systemName_make.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2230, 15), end: (2230, 33) });

_lua_nil()
}})); _lua_tmp.clone() };
*state_const.write().unwrap() = { let _lua_tmp = (x.read().unwrap().clone()); _lua_tmp.clone() };
*state.write().unwrap() = { let _lua_tmp = _lua_num!(0); _lua_tmp.clone() };
let make_read_two = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_read_two.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp, _| {
let prefix = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let prefix = prefix.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let k = k.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2236, 15), end: (2236, 20) })).as_bool(_lua_debug_loc { start: (2236, 15), end: (2236, 20) }) {
return _lua_false();
}
let c = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2239, 22), end: (2239, 27) })));
if (_lua_op!{not_eq, (c.read().unwrap().clone()), (prefix.read().unwrap().clone()), _lua_debug_loc { start: (2240, 15), end: (2240, 26) }}).as_bool(_lua_debug_loc { start: (2240, 15), end: (2240, 26) }) {
_lua_call((put.read().unwrap().clone()), vec![(c.read().unwrap().clone())], _lua_debug_loc { start: (2241, 16), end: (2241, 22) });
return _lua_false();
}
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readlist.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2244, 23), end: (2244, 33) })));
if (_lua_op!{eq, (xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2245, 15), end: (2245, 26) }}).as_bool(_lua_debug_loc { start: (2245, 15), end: (2245, 26) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2246, 23), end: (2246, 36) });
}
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2248, 19), end: (2248, 37) }), _lua_debug_loc { start: (2248, 15), end: (2248, 37) })).as_bool(_lua_debug_loc { start: (2248, 15), end: (2248, 37) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2249, 23), end: (2249, 36) });
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_tail.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2251, 22), end: (2251, 43) })));
if (_lua_not(_lua_op!{and, _lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2252, 20), end: (2252, 37) }), _lua_call((null_p.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2253, 16), end: (2253, 36) })], _lua_debug_loc { start: (2252, 42), end: (2254, 13) }), _lua_debug_loc { start: (2252, 20), end: (2254, 13) }}, _lua_debug_loc { start: (2252, 15), end: (2254, 14) })).as_bool(_lua_debug_loc { start: (2252, 15), end: (2254, 14) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2255, 23), end: (2255, 36) });
}
return _lua_call((k.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2258, 16), end: (2258, 37) }), _lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2259, 16), end: (2259, 36) })], _lua_debug_loc { start: (2257, 19), end: (2260, 13) });

_lua_nil()
}}));

_lua_nil()
}})); _lua_tmp.clone() };
let make_read_three = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_read_three.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp, _| {
let prefix = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let prefix = prefix.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let k = k.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp, _| {
if (_lua_call((eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2265, 15), end: (2265, 20) })).as_bool(_lua_debug_loc { start: (2265, 15), end: (2265, 20) }) {
return _lua_false();
}
let c = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2268, 22), end: (2268, 27) })));
if (_lua_op!{not_eq, (c.read().unwrap().clone()), (prefix.read().unwrap().clone()), _lua_debug_loc { start: (2269, 15), end: (2269, 26) }}).as_bool(_lua_debug_loc { start: (2269, 15), end: (2269, 26) }) {
_lua_call((put.read().unwrap().clone()), vec![(c.read().unwrap().clone())], _lua_debug_loc { start: (2270, 16), end: (2270, 22) });
return _lua_false();
}
let xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((readlist.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2273, 23), end: (2273, 33) })));
if (_lua_op!{eq, (xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2274, 15), end: (2274, 26) }}).as_bool(_lua_debug_loc { start: (2274, 15), end: (2274, 26) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2275, 23), end: (2275, 36) });
}
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2277, 19), end: (2277, 37) }), _lua_debug_loc { start: (2277, 15), end: (2277, 37) })).as_bool(_lua_debug_loc { start: (2277, 15), end: (2277, 37) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2278, 23), end: (2278, 36) });
}
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_tail.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2280, 22), end: (2280, 43) })));
if (_lua_not(_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2281, 19), end: (2281, 36) }), _lua_debug_loc { start: (2281, 15), end: (2281, 36) })).as_bool(_lua_debug_loc { start: (2281, 15), end: (2281, 36) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2282, 23), end: (2282, 36) });
}
let x_d = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2284, 24), end: (2284, 44) })));
if (_lua_not(_lua_op!{and, _lua_call((construction_p.read().unwrap().clone()), vec![(x_d.read().unwrap().clone())], _lua_debug_loc { start: (2285, 20), end: (2285, 39) }), _lua_call((null_p.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(x_d.read().unwrap().clone())], _lua_debug_loc { start: (2286, 16), end: (2286, 38) })], _lua_debug_loc { start: (2285, 44), end: (2287, 13) }), _lua_debug_loc { start: (2285, 20), end: (2287, 13) }}, _lua_debug_loc { start: (2285, 15), end: (2287, 14) })).as_bool(_lua_debug_loc { start: (2285, 15), end: (2287, 14) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2288, 23), end: (2288, 36) });
}
return _lua_call((k.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(xs.read().unwrap().clone())], _lua_debug_loc { start: (2291, 16), end: (2291, 37) }), _lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2292, 16), end: (2292, 36) }), _lua_call((construction_head.read().unwrap().clone()), vec![(x_d.read().unwrap().clone())], _lua_debug_loc { start: (2293, 16), end: (2293, 38) })], _lua_debug_loc { start: (2290, 19), end: (2294, 13) });

_lua_nil()
}}));

_lua_nil()
}})); _lua_tmp.clone() };
*readeval.write().unwrap() = { let _lua_tmp = _lua_call((make_read_two.read().unwrap().clone()), vec![_lua_str("$"), _lua_lambda(Box::new({let val2env = val2env.clone();
let parse_error = parse_error.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp, _| {
let ev = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let env = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val2env.read().unwrap().clone()), vec![(ev.read().unwrap().clone())], _lua_debug_loc { start: (2300, 24), end: (2300, 35) })));
if (_lua_op!{eq, (env.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2301, 15), end: (2301, 27) }}).as_bool(_lua_debug_loc { start: (2301, 15), end: (2301, 27) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2302, 23), end: (2302, 36) });
}
return _lua_call((evaluate.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (val.read().unwrap().clone())], _lua_debug_loc { start: (2304, 19), end: (2304, 37) });

_lua_nil()
}}))], _lua_debug_loc { start: (2297, 15), end: (2306, 5) }); _lua_tmp.clone() };
*readfuncapply.write().unwrap() = { let _lua_tmp = _lua_call((make_read_two.read().unwrap().clone()), vec![_lua_str("%"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let builtin_func_apply = builtin_func_apply.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((list_to_jsArray.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return (v.read().unwrap().clone());

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let _1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2313, 40), end: (2313, 53) });

_lua_nil()
}}))], _lua_debug_loc { start: (2310, 25), end: (2314, 13) })));
return _lua_call((builtin_func_apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (jsxs.read().unwrap().clone())], _lua_debug_loc { start: (2315, 19), end: (2315, 46) });

_lua_nil()
}}))], _lua_debug_loc { start: (2307, 20), end: (2317, 5) }); _lua_tmp.clone() };
*readformbuiltin.write().unwrap() = { let _lua_tmp = _lua_call((make_read_three.read().unwrap().clone()), vec![_lua_str("@"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let val2env = val2env.clone();
let builtin_form_apply = builtin_form_apply.clone();
move |mut _lua_arg_tmp, _| {
let e = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((list_to_jsArray.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return (v.read().unwrap().clone());

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let _1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2324, 40), end: (2324, 53) });

_lua_nil()
}}))], _lua_debug_loc { start: (2321, 25), end: (2325, 13) })));
let env = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val2env.read().unwrap().clone()), vec![(e.read().unwrap().clone())], _lua_debug_loc { start: (2326, 24), end: (2326, 34) })));
if (_lua_op!{eq, (env.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2327, 15), end: (2327, 27) }}).as_bool(_lua_debug_loc { start: (2327, 15), end: (2327, 27) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2328, 23), end: (2328, 36) });
}
return _lua_call((builtin_form_apply.read().unwrap().clone()), vec![(env.read().unwrap().clone()), (f.read().unwrap().clone()), (jsxs.read().unwrap().clone())], _lua_debug_loc { start: (2330, 19), end: (2330, 51) });

_lua_nil()
}}))], _lua_debug_loc { start: (2318, 22), end: (2332, 5) }); _lua_tmp.clone() };
*readapply.write().unwrap() = { let _lua_tmp = _lua_call((make_read_two.read().unwrap().clone()), vec![_lua_str("^"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let apply = apply.clone();
move |mut _lua_arg_tmp, _| {
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((list_to_jsArray.read().unwrap().clone()), vec![(xs.read().unwrap().clone()), _lua_lambda(Box::new({move |mut _lua_arg_tmp, _| {
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return (v.read().unwrap().clone());

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let _1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2339, 40), end: (2339, 53) });

_lua_nil()
}}))], _lua_debug_loc { start: (2336, 25), end: (2340, 13) })));
return _lua_call((apply.read().unwrap().clone()), vec![(f.read().unwrap().clone()), (jsxs.read().unwrap().clone())], _lua_debug_loc { start: (2341, 19), end: (2341, 33) });

_lua_nil()
}}))], _lua_debug_loc { start: (2333, 16), end: (2343, 5) }); _lua_tmp.clone() };
*readcomment.write().unwrap() = { let _lua_tmp = _lua_call((make_read_two.read().unwrap().clone()), vec![_lua_str(";"), _lua_lambda(Box::new({let new_comment = new_comment.clone();
move |mut _lua_arg_tmp, _| {
let comment = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_comment.read().unwrap().clone()), vec![(comment.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2346, 36), end: (2346, 59) });

_lua_nil()
}}))], _lua_debug_loc { start: (2344, 18), end: (2347, 5) }); _lua_tmp.clone() };
return _lua_call((val.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2348, 11), end: (2348, 16) });

_lua_nil()
}})); _lua_tmp.clone() };
let complex_print = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*complex_print.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let atom_p = atom_p.clone();
let un_atom = un_atom.clone();
let tostring = tostring.clone();
let maybe_list_to_jsArray = maybe_list_to_jsArray.clone();
let jsbool_no_force_isomorphism_p = jsbool_no_force_isomorphism_p.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let construction_head = construction_head.clone();
let theThing_atom = theThing_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let form_atom = form_atom.clone();
let system_atom = system_atom.clone();
let sub_atom = sub_atom.clone();
let simple_print = simple_print.clone();
let systemName_make = systemName_make.clone();
let complex_parse = complex_parse.clone();
let null_p = null_p.clone();
let complex_print = complex_print.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let name_atom = name_atom.clone();
let new_construction = new_construction.clone();
let comment_p = comment_p.clone();
let comment_comment = comment_comment.clone();
let comment_x = comment_x.clone();
let delay_evaluate_p = delay_evaluate_p.clone();
let env2val = env2val.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
let delay_evaluate_x = delay_evaluate_x.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_builtin_func_f = delay_builtin_func_f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let delay_builtin_func_xs = delay_builtin_func_xs.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let delay_builtin_form_env = delay_builtin_form_env.clone();
let delay_builtin_form_f = delay_builtin_form_f.clone();
let delay_builtin_form_xs = delay_builtin_form_xs.clone();
let delay_apply_p = delay_apply_p.clone();
let delay_apply_f = delay_apply_f.clone();
let delay_apply_xs = delay_apply_xs.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let print_sys_name = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*print_sys_name.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let atom_p = atom_p.clone();
let un_atom = un_atom.clone();
let tostring = tostring.clone();
let maybe_list_to_jsArray = maybe_list_to_jsArray.clone();
let jsbool_no_force_isomorphism_p = jsbool_no_force_isomorphism_p.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let print_sys_name = print_sys_name.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let construction_head = construction_head.clone();
let theThing_atom = theThing_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let form_atom = form_atom.clone();
let system_atom = system_atom.clone();
let sub_atom = sub_atom.clone();
let simple_print = simple_print.clone();
let systemName_make = systemName_make.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let is_inner_bool = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2352, 11), end: (2352, 20) })).as_bool(_lua_debug_loc { start: (2352, 11), end: (2352, 20) }) {
return _lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2353, 19), end: (2353, 29) });
}
let inner_bracket = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*inner_bracket.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let is_inner_bool = is_inner_bool.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp, _| {
let vl = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if ((is_inner_bool.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (2356, 15), end: (2356, 28) }) {
return _lua_op!{concat, _lua_str("["), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(vl.read().unwrap().clone())], _lua_debug_loc { start: (2357, 30), end: (2357, 42) }), _lua_str("]"), _lua_debug_loc { start: (2357, 30), end: (2357, 49) }}, _lua_debug_loc { start: (2357, 23), end: (2357, 49) }};
} else {
return (vl.read().unwrap().clone());
}

_lua_nil()
}})); _lua_tmp.clone() };
let maybe_xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2362, 25), end: (2362, 49) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2363, 11), end: (2363, 115) }}, _lua_op!{eq, _lua_len((maybe_xs.read().unwrap().clone()), _lua_debug_loc { start: (2363, 33), end: (2363, 42) }), _lua_num!(3), _lua_debug_loc { start: (2363, 33), end: (2363, 47) }}, _lua_debug_loc { start: (2363, 11), end: (2363, 115) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2363, 82), end: (2363, 92) }), (typeAnnotation_atom.read().unwrap().clone())], _lua_debug_loc { start: (2363, 52), end: (2363, 115) }), _lua_debug_loc { start: (2363, 11), end: (2363, 115) }}).as_bool(_lua_debug_loc { start: (2363, 11), end: (2363, 115) }) {
let maybe_lst_2 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2364, 54), end: (2364, 64) })], _lua_debug_loc { start: (2364, 32), end: (2364, 66) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_lst_2.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2365, 15), end: (2365, 122) }}, _lua_op!{eq, _lua_len((maybe_lst_2.read().unwrap().clone()), _lua_debug_loc { start: (2365, 40), end: (2365, 52) }), _lua_num!(3), _lua_debug_loc { start: (2365, 40), end: (2365, 57) }}, _lua_debug_loc { start: (2365, 15), end: (2365, 122) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2365, 92), end: (2365, 105) }), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (2365, 62), end: (2365, 122) }), _lua_debug_loc { start: (2365, 15), end: (2365, 122) }}).as_bool(_lua_debug_loc { start: (2365, 15), end: (2365, 122) }) {
let var_2_1 = std::sync::Arc::new(std::sync::RwLock::new(_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2366, 32), end: (2366, 45) })));
let maybe_lst_3 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![(var_2_1.read().unwrap().clone())], _lua_debug_loc { start: (2367, 36), end: (2367, 66) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_lst_3.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2368, 19), end: (2368, 127) }}, _lua_op!{eq, _lua_len((maybe_lst_3.read().unwrap().clone()), _lua_debug_loc { start: (2368, 44), end: (2368, 56) }), _lua_num!(1), _lua_debug_loc { start: (2368, 44), end: (2368, 61) }}, _lua_debug_loc { start: (2368, 19), end: (2368, 127) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2368, 96), end: (2368, 109) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2368, 66), end: (2368, 127) }), _lua_debug_loc { start: (2368, 19), end: (2368, 127) }}).as_bool(_lua_debug_loc { start: (2368, 19), end: (2368, 127) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_3.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2371, 43), end: (2371, 56) }), _lua_true()], _lua_debug_loc { start: (2371, 28), end: (2371, 64) })], _lua_debug_loc { start: (2370, 24), end: (2372, 25) }), _lua_op!{concat, _lua_str("."), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2373, 43), end: (2373, 53) }), _lua_true()], _lua_debug_loc { start: (2373, 28), end: (2373, 61) })], _lua_debug_loc { start: (2372, 36), end: (2374, 25) }), _lua_debug_loc { start: (2372, 29), end: (2374, 25) }}, _lua_debug_loc { start: (2370, 24), end: (2374, 25) }}], _lua_debug_loc { start: (2369, 27), end: (2375, 21) });
} else if (_lua_op!{and, _lua_op!{and, _lua_call((construction_p.read().unwrap().clone()), vec![(var_2_1.read().unwrap().clone())], _lua_debug_loc { start: (2376, 23), end: (2376, 46) }), _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(var_2_1.read().unwrap().clone())], _lua_debug_loc { start: (2377, 20), end: (2377, 46) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2376, 51), end: (2379, 17) }), _lua_debug_loc { start: (2376, 23), end: (2379, 83) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2379, 52), end: (2379, 65) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2379, 22), end: (2379, 83) }), _lua_debug_loc { start: (2376, 23), end: (2379, 83) }}).as_bool(_lua_debug_loc { start: (2376, 23), end: (2379, 83) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(var_2_1.read().unwrap().clone())], _lua_debug_loc { start: (2383, 32), end: (2383, 58) }), _lua_true()], _lua_debug_loc { start: (2382, 28), end: (2385, 29) })], _lua_debug_loc { start: (2381, 24), end: (2386, 25) }), _lua_op!{concat, _lua_str("@"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2387, 43), end: (2387, 53) }), _lua_true()], _lua_debug_loc { start: (2387, 28), end: (2387, 61) })], _lua_debug_loc { start: (2386, 36), end: (2388, 25) }), _lua_debug_loc { start: (2386, 29), end: (2388, 25) }}, _lua_debug_loc { start: (2381, 24), end: (2388, 25) }}], _lua_debug_loc { start: (2380, 27), end: (2389, 21) });
} else if (_lua_op!{and, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![(var_2_1.read().unwrap().clone()), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2390, 23), end: (2390, 77) }), _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2390, 112), end: (2390, 122) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2390, 82), end: (2390, 139) }), _lua_debug_loc { start: (2390, 23), end: (2390, 139) }}).as_bool(_lua_debug_loc { start: (2390, 23), end: (2390, 139) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str(":>"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2393, 43), end: (2393, 56) }), _lua_true()], _lua_debug_loc { start: (2393, 28), end: (2393, 64) })], _lua_debug_loc { start: (2392, 32), end: (2394, 25) }), _lua_debug_loc { start: (2392, 24), end: (2394, 25) }}], _lua_debug_loc { start: (2391, 27), end: (2395, 21) });
}
}
let maybe_lst_44 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2398, 55), end: (2398, 65) })], _lua_debug_loc { start: (2398, 33), end: (2398, 67) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2399, 45), end: (2399, 55) }), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (2399, 15), end: (2399, 72) }), _lua_op!{not_eq, (maybe_lst_44.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2399, 77), end: (2399, 98) }}, _lua_debug_loc { start: (2399, 15), end: (2399, 186) }}, _lua_op!{eq, _lua_len((maybe_lst_44.read().unwrap().clone()), _lua_debug_loc { start: (2399, 103), end: (2399, 116) }), _lua_num!(2), _lua_debug_loc { start: (2399, 103), end: (2399, 121) }}, _lua_debug_loc { start: (2399, 15), end: (2399, 186) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_44.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2399, 156), end: (2399, 170) }), (isOrNot_atom.read().unwrap().clone())], _lua_debug_loc { start: (2399, 126), end: (2399, 186) }), _lua_debug_loc { start: (2399, 15), end: (2399, 186) }}).as_bool(_lua_debug_loc { start: (2399, 15), end: (2399, 186) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_44.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2402, 39), end: (2402, 53) }), _lua_true()], _lua_debug_loc { start: (2402, 24), end: (2402, 61) })], _lua_debug_loc { start: (2401, 20), end: (2403, 21) }), _lua_str("?"), _lua_debug_loc { start: (2401, 20), end: (2403, 28) }}], _lua_debug_loc { start: (2400, 23), end: (2404, 17) });
}
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_lst_2.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2406, 15), end: (2406, 180) }}, _lua_op!{eq, _lua_len((maybe_lst_2.read().unwrap().clone()), _lua_debug_loc { start: (2406, 40), end: (2406, 52) }), _lua_num!(2), _lua_debug_loc { start: (2406, 40), end: (2406, 57) }}, _lua_debug_loc { start: (2406, 15), end: (2406, 180) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2406, 92), end: (2406, 102) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2406, 62), end: (2406, 119) }), _lua_debug_loc { start: (2406, 15), end: (2406, 180) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2406, 154), end: (2406, 167) }), (form_atom.read().unwrap().clone())], _lua_debug_loc { start: (2406, 124), end: (2406, 180) }), _lua_debug_loc { start: (2406, 15), end: (2406, 180) }}).as_bool(_lua_debug_loc { start: (2406, 15), end: (2406, 180) }) {
let maybe_lst_88 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_2.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2407, 59), end: (2407, 72) })], _lua_debug_loc { start: (2407, 37), end: (2407, 74) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_lst_88.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2408, 19), end: (2408, 196) }}, _lua_op!{eq, _lua_len((maybe_lst_88.read().unwrap().clone()), _lua_debug_loc { start: (2408, 45), end: (2408, 58) }), _lua_num!(3), _lua_debug_loc { start: (2408, 45), end: (2408, 63) }}, _lua_debug_loc { start: (2408, 19), end: (2408, 196) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_88.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2408, 98), end: (2408, 112) }), (function_atom.read().unwrap().clone())], _lua_debug_loc { start: (2408, 68), end: (2408, 129) }), _lua_debug_loc { start: (2408, 19), end: (2408, 196) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_88.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2408, 164), end: (2408, 178) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2408, 134), end: (2408, 196) }), _lua_debug_loc { start: (2408, 19), end: (2408, 196) }}).as_bool(_lua_debug_loc { start: (2408, 19), end: (2408, 196) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str(":&>"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_88.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2411, 43), end: (2411, 57) }), _lua_true()], _lua_debug_loc { start: (2411, 28), end: (2411, 65) })], _lua_debug_loc { start: (2410, 33), end: (2412, 25) }), _lua_debug_loc { start: (2410, 24), end: (2412, 25) }}], _lua_debug_loc { start: (2409, 27), end: (2413, 21) });
}
}
let hd = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2417, 45), end: (2417, 55) }), (something_atom.read().unwrap().clone())], _lua_debug_loc { start: (2417, 15), end: (2417, 73) })).as_bool(_lua_debug_loc { start: (2417, 15), end: (2417, 73) }) {
*hd.write().unwrap() = { let _lua_tmp = _lua_str("_"); _lua_tmp.clone() };
} else if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2419, 49), end: (2419, 59) }), (theThing_atom.read().unwrap().clone())], _lua_debug_loc { start: (2419, 19), end: (2419, 76) })).as_bool(_lua_debug_loc { start: (2419, 19), end: (2419, 76) }) {
*hd.write().unwrap() = { let _lua_tmp = _lua_str(""); _lua_tmp.clone() };
} else {
*hd.write().unwrap() = { let _lua_tmp = _lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(3), _lua_debug_loc { start: (2422, 36), end: (2422, 46) }), _lua_true()], _lua_debug_loc { start: (2422, 21), end: (2422, 54) }); _lua_tmp.clone() };
}
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(hd.read().unwrap().clone())], _lua_debug_loc { start: (2425, 16), end: (2425, 28) }), _lua_op!{concat, _lua_str(":"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2426, 35), end: (2426, 45) }), _lua_true()], _lua_debug_loc { start: (2426, 20), end: (2426, 53) })], _lua_debug_loc { start: (2425, 39), end: (2427, 17) }), _lua_debug_loc { start: (2425, 32), end: (2427, 17) }}, _lua_debug_loc { start: (2425, 16), end: (2427, 17) }}], _lua_debug_loc { start: (2424, 19), end: (2428, 13) });
} else if (_lua_op!{and, _lua_op!{not_eq, (maybe_xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2429, 15), end: (2429, 51) }}, _lua_op!{eq, _lua_len((maybe_xs.read().unwrap().clone()), _lua_debug_loc { start: (2429, 37), end: (2429, 46) }), _lua_num!(2), _lua_debug_loc { start: (2429, 37), end: (2429, 51) }}, _lua_debug_loc { start: (2429, 15), end: (2429, 51) }}).as_bool(_lua_debug_loc { start: (2429, 15), end: (2429, 51) }) {
if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2430, 45), end: (2430, 55) }), (form_atom.read().unwrap().clone())], _lua_debug_loc { start: (2430, 15), end: (2430, 68) })).as_bool(_lua_debug_loc { start: (2430, 15), end: (2430, 68) }) {
let maybe_lst_288 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2431, 60), end: (2431, 70) })], _lua_debug_loc { start: (2431, 38), end: (2431, 72) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_lst_288.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2432, 19), end: (2432, 130) }}, _lua_op!{eq, _lua_len((maybe_lst_288.read().unwrap().clone()), _lua_debug_loc { start: (2432, 46), end: (2432, 60) }), _lua_num!(2), _lua_debug_loc { start: (2432, 46), end: (2432, 65) }}, _lua_debug_loc { start: (2432, 19), end: (2432, 130) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_288.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2432, 100), end: (2432, 115) }), (system_atom.read().unwrap().clone())], _lua_debug_loc { start: (2432, 70), end: (2432, 130) }), _lua_debug_loc { start: (2432, 19), end: (2432, 130) }}).as_bool(_lua_debug_loc { start: (2432, 19), end: (2432, 130) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("&+"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_288.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2435, 43), end: (2435, 58) }), _lua_true()], _lua_debug_loc { start: (2435, 28), end: (2435, 66) })], _lua_debug_loc { start: (2434, 32), end: (2436, 25) }), _lua_debug_loc { start: (2434, 24), end: (2436, 25) }}], _lua_debug_loc { start: (2433, 27), end: (2437, 21) });
}
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("&"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2441, 39), end: (2441, 49) }), _lua_true()], _lua_debug_loc { start: (2441, 24), end: (2441, 57) })], _lua_debug_loc { start: (2440, 27), end: (2442, 21) }), _lua_debug_loc { start: (2440, 20), end: (2442, 21) }}], _lua_debug_loc { start: (2439, 23), end: (2443, 17) });
} else if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2444, 49), end: (2444, 59) }), (isOrNot_atom.read().unwrap().clone())], _lua_debug_loc { start: (2444, 19), end: (2444, 75) })).as_bool(_lua_debug_loc { start: (2444, 19), end: (2444, 75) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2447, 39), end: (2447, 49) }), _lua_true()], _lua_debug_loc { start: (2447, 24), end: (2447, 57) })], _lua_debug_loc { start: (2446, 20), end: (2448, 21) }), _lua_str("~"), _lua_debug_loc { start: (2446, 20), end: (2448, 28) }}], _lua_debug_loc { start: (2445, 23), end: (2449, 17) });
} else if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2450, 49), end: (2450, 59) }), (system_atom.read().unwrap().clone())], _lua_debug_loc { start: (2450, 19), end: (2450, 74) })).as_bool(_lua_debug_loc { start: (2450, 19), end: (2450, 74) }) {
return _lua_call((inner_bracket.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("+"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2453, 39), end: (2453, 49) }), _lua_true()], _lua_debug_loc { start: (2453, 24), end: (2453, 57) })], _lua_debug_loc { start: (2452, 27), end: (2454, 21) }), _lua_debug_loc { start: (2452, 20), end: (2454, 21) }}], _lua_debug_loc { start: (2451, 23), end: (2455, 17) });
} else if (_lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2456, 49), end: (2456, 59) }), (sub_atom.read().unwrap().clone())], _lua_debug_loc { start: (2456, 19), end: (2456, 71) })).as_bool(_lua_debug_loc { start: (2456, 19), end: (2456, 71) }) {
let maybe_lst_8934 = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2457, 61), end: (2457, 71) })], _lua_debug_loc { start: (2457, 39), end: (2457, 73) })));
if (_lua_op!{and, _lua_op!{not_eq, (maybe_lst_8934.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2458, 19), end: (2458, 66) }}, _lua_op!{greater, _lua_len((maybe_lst_8934.read().unwrap().clone()), _lua_debug_loc { start: (2458, 47), end: (2458, 62) }), _lua_num!(1), _lua_debug_loc { start: (2458, 47), end: (2458, 66) }}, _lua_debug_loc { start: (2458, 19), end: (2458, 66) }}).as_bool(_lua_debug_loc { start: (2458, 19), end: (2458, 66) }) {
let tmp = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_8934.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2459, 47), end: (2459, 63) }), _lua_true()], _lua_debug_loc { start: (2459, 32), end: (2459, 71) })));
{
let i = std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(1)));
while (_lua_op!{less, (i.read().unwrap().clone()), _lua_len((maybe_lst_8934.read().unwrap().clone()), _lua_debug_loc { start: (2462, 34), end: (2462, 49) }), _lua_debug_loc { start: (2462, 30), end: (2462, 49) }}).as_bool(_lua_debug_loc { start: (2462, 24), end: (2467, 27) }) {
*tmp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(tmp.read().unwrap().clone())], _lua_debug_loc { start: (2463, 34), end: (2463, 47) }), _lua_op!{concat, _lua_str("/"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_lst_8934.read().unwrap().clone()),_lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (2464, 62), end: (2464, 67) }}, _lua_debug_loc { start: (2464, 47), end: (2464, 67) }), _lua_true()], _lua_debug_loc { start: (2464, 32), end: (2464, 75) })], _lua_debug_loc { start: (2463, 58), end: (2465, 29) }), _lua_debug_loc { start: (2463, 51), end: (2465, 29) }}, _lua_debug_loc { start: (2463, 34), end: (2465, 29) }}; _lua_tmp.clone() };
*i.write().unwrap() = { let _lua_tmp = _lua_op!{add, (i.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (2466, 32), end: (2466, 37) }}; _lua_tmp.clone() };
}
}
return _lua_call((inner_bracket.read().unwrap().clone()), vec![(tmp.read().unwrap().clone())], _lua_debug_loc { start: (2469, 27), end: (2469, 45) });
}
}
}
if ((is_inner_bool.read().unwrap().clone())).as_bool(_lua_debug_loc { start: (2473, 11), end: (2473, 24) }) {
return _lua_call((simple_print.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2474, 19), end: (2474, 34) });
} else {
return _lua_call((simple_print.read().unwrap().clone()), vec![_lua_call((systemName_make.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2477, 16), end: (2477, 34) })], _lua_debug_loc { start: (2476, 19), end: (2478, 13) });
}

_lua_nil()
}})); _lua_tmp.clone() };
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((complex_parse.read().unwrap().clone()), vec![_lua_call((simple_print.read().unwrap().clone()), vec![(val.read().unwrap().clone())], _lua_debug_loc { start: (2482, 8), end: (2482, 25) })], _lua_debug_loc { start: (2481, 14), end: (2483, 5) })));
let temp = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
let prefix = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2486, 7), end: (2486, 16) })).as_bool(_lua_debug_loc { start: (2486, 7), end: (2486, 16) }) {
return _lua_str("()");
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2488, 11), end: (2488, 28) })).as_bool(_lua_debug_loc { start: (2488, 11), end: (2488, 28) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_str("("); _lua_tmp.clone() };
*prefix.write().unwrap() = { let _lua_tmp = _lua_str(""); _lua_tmp.clone() };
while (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2491, 14), end: (2491, 31) })).as_bool(_lua_debug_loc { start: (2491, 8), end: (2499, 11) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (2492, 19), end: (2492, 33) }), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(prefix.read().unwrap().clone())], _lua_debug_loc { start: (2492, 37), end: (2492, 53) }), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((construction_head.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2494, 20), end: (2494, 40) })], _lua_debug_loc { start: (2493, 16), end: (2495, 17) })], _lua_debug_loc { start: (2492, 57), end: (2496, 13) }), _lua_debug_loc { start: (2492, 37), end: (2496, 13) }}, _lua_debug_loc { start: (2492, 19), end: (2496, 13) }}; _lua_tmp.clone() };
*prefix.write().unwrap() = { let _lua_tmp = _lua_str(" "); _lua_tmp.clone() };
*x.write().unwrap() = { let _lua_tmp = _lua_call((construction_tail.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2498, 16), end: (2498, 36) }); _lua_tmp.clone() };
}
if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2500, 11), end: (2500, 20) })).as_bool(_lua_debug_loc { start: (2500, 11), end: (2500, 20) }) {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (2501, 19), end: (2501, 33) }), _lua_str(")"), _lua_debug_loc { start: (2501, 19), end: (2501, 40) }}; _lua_tmp.clone() };
} else {
*temp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(temp.read().unwrap().clone())], _lua_debug_loc { start: (2503, 19), end: (2503, 33) }), _lua_op!{concat, _lua_str(" . "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2504, 16), end: (2504, 32) })], _lua_debug_loc { start: (2503, 46), end: (2505, 13) }), _lua_str(")"), _lua_debug_loc { start: (2503, 46), end: (2505, 20) }}, _lua_debug_loc { start: (2503, 37), end: (2505, 20) }}, _lua_debug_loc { start: (2503, 19), end: (2505, 20) }}; _lua_tmp.clone() };
}
return (temp.read().unwrap().clone());
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2508, 11), end: (2508, 20) })).as_bool(_lua_debug_loc { start: (2508, 11), end: (2508, 20) }) {
let name = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((data_name.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2509, 21), end: (2509, 33) })));
let list = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((data_list.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2510, 21), end: (2510, 33) })));
let maybe_xs = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((maybe_list_to_jsArray.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2511, 25), end: (2511, 52) })));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, (maybe_xs.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2512, 11), end: (2512, 158) }}, _lua_op!{eq, _lua_len((maybe_xs.read().unwrap().clone()), _lua_debug_loc { start: (2512, 33), end: (2512, 42) }), _lua_num!(2), _lua_debug_loc { start: (2512, 33), end: (2512, 47) }}, _lua_debug_loc { start: (2512, 11), end: (2512, 158) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![(name.read().unwrap().clone()), (name_atom.read().unwrap().clone())], _lua_debug_loc { start: (2512, 52), end: (2512, 98) }), _lua_debug_loc { start: (2512, 11), end: (2512, 158) }}, _lua_call((jsbool_no_force_isomorphism_p.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2512, 133), end: (2512, 143) }), (system_atom.read().unwrap().clone())], _lua_debug_loc { start: (2512, 103), end: (2512, 158) }), _lua_debug_loc { start: (2512, 11), end: (2512, 158) }}).as_bool(_lua_debug_loc { start: (2512, 11), end: (2512, 158) }) {
return _lua_call((print_sys_name.read().unwrap().clone()), vec![_lua_lookup((maybe_xs.read().unwrap().clone()),_lua_num!(2), _lua_debug_loc { start: (2513, 34), end: (2513, 44) }), _lua_false()], _lua_debug_loc { start: (2513, 19), end: (2513, 53) });
}
return _lua_op!{concat, _lua_str("#"), _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(name.read().unwrap().clone()), (list.read().unwrap().clone())], _lua_debug_loc { start: (2517, 16), end: (2517, 44) })], _lua_debug_loc { start: (2516, 12), end: (2518, 13) })], _lua_debug_loc { start: (2515, 22), end: (2519, 9) }), _lua_debug_loc { start: (2515, 15), end: (2519, 9) }};
} else if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2520, 11), end: (2520, 20) })).as_bool(_lua_debug_loc { start: (2520, 11), end: (2520, 20) }) {
return _lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2521, 15), end: (2521, 25) });
} else if (_lua_call((comment_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2522, 11), end: (2522, 23) })).as_bool(_lua_debug_loc { start: (2522, 11), end: (2522, 23) }) {
return _lua_op!{concat, _lua_str(";("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((comment_comment.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2525, 16), end: (2525, 34) })], _lua_debug_loc { start: (2524, 12), end: (2526, 13) })], _lua_debug_loc { start: (2523, 23), end: (2527, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((comment_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2529, 16), end: (2529, 28) })], _lua_debug_loc { start: (2528, 12), end: (2530, 13) })], _lua_debug_loc { start: (2527, 20), end: (2531, 9) }), _lua_str(")"), _lua_debug_loc { start: (2527, 20), end: (2531, 16) }}, _lua_debug_loc { start: (2527, 13), end: (2531, 16) }}, _lua_debug_loc { start: (2523, 23), end: (2531, 16) }}, _lua_debug_loc { start: (2523, 15), end: (2531, 16) }};
} else if (_lua_call((delay_evaluate_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2532, 11), end: (2532, 30) })).as_bool(_lua_debug_loc { start: (2532, 11), end: (2532, 30) }) {
return _lua_op!{concat, _lua_str("$("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![_lua_call((delay_evaluate_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2536, 20), end: (2536, 41) })], _lua_debug_loc { start: (2535, 16), end: (2537, 17) })], _lua_debug_loc { start: (2534, 12), end: (2538, 13) })], _lua_debug_loc { start: (2533, 23), end: (2539, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((delay_evaluate_x.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2541, 16), end: (2541, 35) })], _lua_debug_loc { start: (2540, 12), end: (2542, 13) })], _lua_debug_loc { start: (2539, 20), end: (2543, 9) }), _lua_str(")"), _lua_debug_loc { start: (2539, 20), end: (2543, 16) }}, _lua_debug_loc { start: (2539, 13), end: (2543, 16) }}, _lua_debug_loc { start: (2533, 23), end: (2543, 16) }}, _lua_debug_loc { start: (2533, 15), end: (2543, 16) }};
} else if (_lua_call((delay_builtin_func_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2544, 11), end: (2544, 34) })).as_bool(_lua_debug_loc { start: (2544, 11), end: (2544, 34) }) {
return _lua_op!{concat, _lua_str("%("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((delay_builtin_func_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2547, 16), end: (2547, 39) })], _lua_debug_loc { start: (2546, 12), end: (2548, 13) })], _lua_debug_loc { start: (2545, 23), end: (2549, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_builtin_func_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2552, 20), end: (2552, 44) })], _lua_debug_loc { start: (2551, 16), end: (2553, 17) })], _lua_debug_loc { start: (2550, 12), end: (2554, 13) })], _lua_debug_loc { start: (2549, 20), end: (2555, 9) }), _lua_str(")"), _lua_debug_loc { start: (2549, 20), end: (2555, 16) }}, _lua_debug_loc { start: (2549, 13), end: (2555, 16) }}, _lua_debug_loc { start: (2545, 23), end: (2555, 16) }}, _lua_debug_loc { start: (2545, 15), end: (2555, 16) }};
} else if (_lua_call((delay_builtin_form_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2556, 11), end: (2556, 34) })).as_bool(_lua_debug_loc { start: (2556, 11), end: (2556, 34) }) {
return _lua_op!{concat, _lua_str("@("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((env2val.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_env.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2560, 20), end: (2560, 45) })], _lua_debug_loc { start: (2559, 16), end: (2561, 17) })], _lua_debug_loc { start: (2558, 12), end: (2562, 13) })], _lua_debug_loc { start: (2557, 23), end: (2563, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2565, 16), end: (2565, 39) })], _lua_debug_loc { start: (2564, 12), end: (2566, 13) })], _lua_debug_loc { start: (2563, 20), end: (2567, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_builtin_form_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2570, 20), end: (2570, 44) })], _lua_debug_loc { start: (2569, 16), end: (2571, 17) })], _lua_debug_loc { start: (2568, 12), end: (2572, 13) })], _lua_debug_loc { start: (2567, 20), end: (2573, 9) }), _lua_str(")"), _lua_debug_loc { start: (2567, 20), end: (2573, 16) }}, _lua_debug_loc { start: (2567, 13), end: (2573, 16) }}, _lua_debug_loc { start: (2563, 20), end: (2573, 16) }}, _lua_debug_loc { start: (2563, 13), end: (2573, 16) }}, _lua_debug_loc { start: (2557, 23), end: (2573, 16) }}, _lua_debug_loc { start: (2557, 15), end: (2573, 16) }};
} else if (_lua_call((delay_apply_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2574, 11), end: (2574, 27) })).as_bool(_lua_debug_loc { start: (2574, 11), end: (2574, 27) }) {
return _lua_op!{concat, _lua_str("^("), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((delay_apply_f.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2577, 16), end: (2577, 32) })], _lua_debug_loc { start: (2576, 12), end: (2578, 13) })], _lua_debug_loc { start: (2575, 23), end: (2579, 9) }), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((complex_print.read().unwrap().clone()), vec![_lua_call((jsArray_to_list.read().unwrap().clone()), vec![_lua_call((delay_apply_xs.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2582, 20), end: (2582, 37) })], _lua_debug_loc { start: (2581, 16), end: (2583, 17) })], _lua_debug_loc { start: (2580, 12), end: (2584, 13) })], _lua_debug_loc { start: (2579, 20), end: (2585, 9) }), _lua_str(")"), _lua_debug_loc { start: (2579, 20), end: (2585, 16) }}, _lua_debug_loc { start: (2579, 13), end: (2585, 16) }}, _lua_debug_loc { start: (2575, 23), end: (2585, 16) }}, _lua_debug_loc { start: (2575, 15), end: (2585, 16) }};
}
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2587, 11), end: (2587, 23) });

_lua_nil()
}})); _lua_tmp.clone() };
let machinetext_parse = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*machinetext_parse.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
let tostring = tostring.clone();
let string = string.clone();
let table = table.clone();
let __TS__ArrayUnshift = __TS__ArrayUnshift.clone();
let new_atom = new_atom.clone();
let new_construction = new_construction.clone();
let new_data = new_data.clone();
let val2env = val2env.clone();
let evaluate = evaluate.clone();
let null_v = null_v.clone();
move |mut _lua_arg_tmp, _| {
let rawstr = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let is_eof = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
let is_not_eof = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*is_eof.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let state = state.clone();
move |mut _lua_arg_tmp, _| {
return _lua_op!{eq, (state.read().unwrap().clone()), _lua_num!(0), _lua_debug_loc { start: (2592, 15), end: (2592, 25) }};

_lua_nil()
}})); _lua_tmp.clone() };
*is_not_eof.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let is_eof = is_eof.clone();
move |mut _lua_arg_tmp, _| {
return _lua_not(_lua_call((is_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2595, 19), end: (2595, 27) }), _lua_debug_loc { start: (2595, 15), end: (2595, 27) });

_lua_nil()
}})); _lua_tmp.clone() };
*state.write().unwrap() = { let _lua_tmp = _lua_len((rawstr.read().unwrap().clone()), _lua_debug_loc { start: (2597, 12), end: (2597, 19) }); _lua_tmp.clone() };
let parse_error = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*parse_error.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (x.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (2599, 11), end: (2599, 19) }}).as_bool(_lua_debug_loc { start: (2599, 11), end: (2599, 19) }) {
*x.write().unwrap() = { let _lua_tmp = _lua_str(""); _lua_tmp.clone() };
}
_lua_call((error.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("MT parse ERROR "), _lua_call((tostring.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2603, 33), end: (2603, 44) }), _lua_debug_loc { start: (2603, 12), end: (2603, 44) }}], _lua_debug_loc { start: (2602, 8), end: (2604, 9) });

_lua_nil()
}})); _lua_tmp.clone() };
let parse_assert = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*parse_assert.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not((x.read().unwrap().clone()), _lua_debug_loc { start: (2607, 11), end: (2607, 16) })).as_bool(_lua_debug_loc { start: (2607, 11), end: (2607, 16) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2608, 19), end: (2608, 32) });
}

_lua_nil()
}})); _lua_tmp.clone() };
let get_do = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*get_do.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let parse_assert = parse_assert.clone();
let is_not_eof = is_not_eof.clone();
let state = state.clone();
let string = string.clone();
let rawstr = rawstr.clone();
move |mut _lua_arg_tmp, _| {
_lua_call((parse_assert.read().unwrap().clone()), vec![_lua_call((is_not_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2613, 12), end: (2613, 24) })], _lua_debug_loc { start: (2612, 8), end: (2614, 9) });
*state.write().unwrap() = { let _lua_tmp = _lua_op!{sub, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (2615, 16), end: (2615, 25) }}; _lua_tmp.clone() };
return _lua_call(_lua_lookup((string.read().unwrap().clone()),_lua_str("sub"), _lua_debug_loc { start: (2616, 15), end: (2616, 55) }), vec![(rawstr.read().unwrap().clone()), _lua_op!{add, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (2616, 34), end: (2616, 43) }}, _lua_op!{add, (state.read().unwrap().clone()), _lua_num!(1), _lua_debug_loc { start: (2616, 45), end: (2616, 54) }}], _lua_debug_loc { start: (2616, 15), end: (2616, 55) });

_lua_nil()
}})); _lua_tmp.clone() };
let stack = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
let conslike = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*conslike.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let table = table.clone();
let stack = stack.clone();
let parse_error = parse_error.clone();
let __TS__ArrayUnshift = __TS__ArrayUnshift.clone();
move |mut _lua_arg_tmp, _| {
let c = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call(_lua_lookup((table.read().unwrap().clone()),_lua_str("remove"), _lua_debug_loc { start: (2620, 18), end: (2620, 37) }), vec![(stack.read().unwrap().clone())], _lua_debug_loc { start: (2620, 18), end: (2620, 37) })));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call(_lua_lookup((table.read().unwrap().clone()),_lua_str("remove"), _lua_debug_loc { start: (2621, 18), end: (2621, 37) }), vec![(stack.read().unwrap().clone())], _lua_debug_loc { start: (2621, 18), end: (2621, 37) })));
if (_lua_op!{or, _lua_op!{eq, (x.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (2622, 11), end: (2622, 31) }}, _lua_op!{eq, (y.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (2622, 23), end: (2622, 31) }}, _lua_debug_loc { start: (2622, 11), end: (2622, 31) }}).as_bool(_lua_debug_loc { start: (2622, 11), end: (2622, 31) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2623, 19), end: (2623, 32) });
} else {
return _lua_call((__TS__ArrayUnshift.read().unwrap().clone()), vec![(stack.read().unwrap().clone()), _lua_call((c.read().unwrap().clone()), vec![(x.read().unwrap().clone()), (y.read().unwrap().clone())], _lua_debug_loc { start: (2627, 16), end: (2627, 23) })], _lua_debug_loc { start: (2625, 19), end: (2628, 13) });
}

_lua_nil()
}})); _lua_tmp.clone() };
while (_lua_call((is_not_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2631, 10), end: (2631, 22) })).as_bool(_lua_debug_loc { start: (2631, 4), end: (2666, 7) }) {
let chr = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get_do.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2632, 20), end: (2632, 28) })));
if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("^"), _lua_debug_loc { start: (2633, 11), end: (2633, 21) }}).as_bool(_lua_debug_loc { start: (2633, 11), end: (2633, 21) }) {
let tmp = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
while (_lua_true()).as_bool(_lua_debug_loc { start: (2635, 12), end: (2641, 15) }) {
let chr = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((get_do.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2636, 28), end: (2636, 36) })));
if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("^"), _lua_debug_loc { start: (2637, 19), end: (2637, 29) }}).as_bool(_lua_debug_loc { start: (2637, 19), end: (2637, 29) }) {
break;
}
*tmp.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(chr.read().unwrap().clone())], _lua_debug_loc { start: (2640, 22), end: (2640, 35) }), _lua_call((tostring.read().unwrap().clone()), vec![(tmp.read().unwrap().clone())], _lua_debug_loc { start: (2640, 39), end: (2640, 52) }), _lua_debug_loc { start: (2640, 22), end: (2640, 52) }}; _lua_tmp.clone() };
}
_lua_call((__TS__ArrayUnshift.read().unwrap().clone()), vec![(stack.read().unwrap().clone()), _lua_call((new_atom.read().unwrap().clone()), vec![(tmp.read().unwrap().clone())], _lua_debug_loc { start: (2644, 16), end: (2644, 29) })], _lua_debug_loc { start: (2642, 12), end: (2645, 13) });
} else if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("."), _lua_debug_loc { start: (2646, 15), end: (2646, 25) }}).as_bool(_lua_debug_loc { start: (2646, 15), end: (2646, 25) }) {
_lua_call((conslike.read().unwrap().clone()), vec![(new_construction.read().unwrap().clone())], _lua_debug_loc { start: (2647, 12), end: (2647, 38) });
} else if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("#"), _lua_debug_loc { start: (2648, 15), end: (2648, 25) }}).as_bool(_lua_debug_loc { start: (2648, 15), end: (2648, 25) }) {
_lua_call((conslike.read().unwrap().clone()), vec![(new_data.read().unwrap().clone())], _lua_debug_loc { start: (2649, 12), end: (2649, 30) });
} else if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("$"), _lua_debug_loc { start: (2650, 15), end: (2650, 25) }}).as_bool(_lua_debug_loc { start: (2650, 15), end: (2650, 25) }) {
_lua_call((conslike.read().unwrap().clone()), vec![_lua_lambda(Box::new({let val2env = val2env.clone();
let parse_error = parse_error.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp, _| {
let env = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let r_env = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((val2env.read().unwrap().clone()), vec![(env.read().unwrap().clone())], _lua_debug_loc { start: (2653, 34), end: (2653, 46) })));
if (_lua_op!{eq, (r_env.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2654, 23), end: (2654, 37) }}).as_bool(_lua_debug_loc { start: (2654, 23), end: (2654, 37) }) {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2655, 31), end: (2655, 44) });
} else {
return _lua_call((evaluate.read().unwrap().clone()), vec![(r_env.read().unwrap().clone()), (val.read().unwrap().clone())], _lua_debug_loc { start: (2657, 31), end: (2657, 51) });
}

_lua_nil()
}}))], _lua_debug_loc { start: (2651, 12), end: (2660, 13) });
} else if (_lua_op!{eq, (chr.read().unwrap().clone()), _lua_str("_"), _lua_debug_loc { start: (2661, 15), end: (2661, 25) }}).as_bool(_lua_debug_loc { start: (2661, 15), end: (2661, 25) }) {
_lua_call((__TS__ArrayUnshift.read().unwrap().clone()), vec![(stack.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2662, 12), end: (2662, 45) });
} else {
return _lua_call((parse_error.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2664, 19), end: (2664, 32) });
}
}
_lua_call((parse_assert.read().unwrap().clone()), vec![_lua_call((is_eof.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2668, 8), end: (2668, 16) })], _lua_debug_loc { start: (2667, 4), end: (2669, 5) });
_lua_call((parse_assert.read().unwrap().clone()), vec![_lua_op!{eq, _lua_len((stack.read().unwrap().clone()), _lua_debug_loc { start: (2670, 17), end: (2670, 23) }), _lua_num!(1), _lua_debug_loc { start: (2670, 17), end: (2670, 28) }}], _lua_debug_loc { start: (2670, 4), end: (2670, 29) });
return _lua_lookup((stack.read().unwrap().clone()),_lua_num!(1), _lua_debug_loc { start: (2671, 11), end: (2671, 18) });

_lua_nil()
}})); _lua_tmp.clone() };
let machinetext_print = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*machinetext_print.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
let tostring = tostring.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let atom_p = atom_p.clone();
let un_atom = un_atom.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let delay_p = delay_p.clone();
let delay2delay_evaluate = delay2delay_evaluate.clone();
let env2val = env2val.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
let delay_evaluate_x = delay_evaluate_x.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let stack = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![(x.read().unwrap().clone())])));
let result = std::sync::Arc::new(std::sync::RwLock::new(_lua_str("")));
while (_lua_op!{not_eq, _lua_len((stack.read().unwrap().clone()), _lua_debug_loc { start: (2676, 10), end: (2676, 16) }), _lua_num!(0), _lua_debug_loc { start: (2676, 10), end: (2676, 21) }}).as_bool(_lua_debug_loc { start: (2676, 4), end: (2715, 7) }) {
let new_stack = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
for (_lua_tmp_k, _lua_tmp_v) in (stack.read().unwrap().clone()).as_table(_lua_debug_loc { start: (2678, 30), end: (2678, 35) }).read().unwrap().ipairs() {
let ____=std::sync::Arc::new(std::sync::RwLock::new(_lua_num!(_lua_tmp_k+1)));
let x=std::sync::Arc::new(std::sync::RwLock::new(_lua_tmp_v.clone()));
*x.write().unwrap() = { let _lua_tmp = _lua_call((un_just_all.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2679, 16), end: (2679, 30) }); _lua_tmp.clone() };
let conslike = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*conslike.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let result = result.clone();
let tostring = tostring.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let new_stack = new_stack.clone();
move |mut _lua_arg_tmp, _| {
let xx = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let g1 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let g2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*result.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(result.read().unwrap().clone())], _lua_debug_loc { start: (2681, 25), end: (2681, 41) }), _lua_call((tostring.read().unwrap().clone()), vec![(s.read().unwrap().clone())], _lua_debug_loc { start: (2681, 45), end: (2681, 56) }), _lua_debug_loc { start: (2681, 25), end: (2681, 56) }}; _lua_tmp.clone() };
return _lua_call((__TS__ArrayPush.read().unwrap().clone()), vec![(new_stack.read().unwrap().clone()), _lua_call((g1.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (2684, 20), end: (2684, 26) }), _lua_call((g2.read().unwrap().clone()), vec![(xx.read().unwrap().clone())], _lua_debug_loc { start: (2685, 20), end: (2685, 26) })], _lua_debug_loc { start: (2682, 23), end: (2686, 17) });

_lua_nil()
}})); _lua_tmp.clone() };
if (_lua_call((atom_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2688, 15), end: (2688, 24) })).as_bool(_lua_debug_loc { start: (2688, 15), end: (2688, 24) }) {
*result.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(result.read().unwrap().clone())], _lua_debug_loc { start: (2689, 25), end: (2689, 41) }), _lua_call((tostring.read().unwrap().clone()), vec![_lua_op!{concat, _lua_str("^"), _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![_lua_call((un_atom.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2691, 24), end: (2691, 34) })], _lua_debug_loc { start: (2690, 28), end: (2692, 21) }), _lua_str("^"), _lua_debug_loc { start: (2690, 28), end: (2692, 28) }}, _lua_debug_loc { start: (2690, 21), end: (2692, 28) }}], _lua_debug_loc { start: (2689, 45), end: (2693, 17) }), _lua_debug_loc { start: (2689, 25), end: (2693, 17) }}; _lua_tmp.clone() };
} else if (_lua_call((construction_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2694, 19), end: (2694, 36) })).as_bool(_lua_debug_loc { start: (2694, 19), end: (2694, 36) }) {
_lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone()), _lua_str("."), (construction_head.read().unwrap().clone()), (construction_tail.read().unwrap().clone())], _lua_debug_loc { start: (2695, 16), end: (2695, 70) });
} else if (_lua_call((null_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2696, 19), end: (2696, 28) })).as_bool(_lua_debug_loc { start: (2696, 19), end: (2696, 28) }) {
*result.write().unwrap() = { let _lua_tmp = _lua_op!{concat, _lua_call((tostring.read().unwrap().clone()), vec![(result.read().unwrap().clone())], _lua_debug_loc { start: (2697, 25), end: (2697, 41) }), _lua_call((tostring.read().unwrap().clone()), vec![_lua_str("_")], _lua_debug_loc { start: (2697, 45), end: (2697, 60) }), _lua_debug_loc { start: (2697, 25), end: (2697, 60) }}; _lua_tmp.clone() };
} else if (_lua_call((data_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2698, 19), end: (2698, 28) })).as_bool(_lua_debug_loc { start: (2698, 19), end: (2698, 28) }) {
_lua_call((conslike.read().unwrap().clone()), vec![(x.read().unwrap().clone()), _lua_str("#"), (data_name.read().unwrap().clone()), (data_list.read().unwrap().clone())], _lua_debug_loc { start: (2699, 16), end: (2699, 54) });
} else if (_lua_call((delay_p.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2700, 19), end: (2700, 29) })).as_bool(_lua_debug_loc { start: (2700, 19), end: (2700, 29) }) {
let y = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((delay2delay_evaluate.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2701, 26), end: (2701, 49) })));
_lua_call((conslike.read().unwrap().clone()), vec![(y.read().unwrap().clone()), _lua_str("$"), _lua_lambda(Box::new({let env2val = env2val.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
move |mut _lua_arg_tmp, _| {
let vl = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((env2val.read().unwrap().clone()), vec![_lua_call((delay_evaluate_env.read().unwrap().clone()), vec![(vl.read().unwrap().clone())], _lua_debug_loc { start: (2706, 24), end: (2706, 46) })], _lua_debug_loc { start: (2705, 41), end: (2707, 21) });

_lua_nil()
}})), (delay_evaluate_x.read().unwrap().clone())], _lua_debug_loc { start: (2702, 16), end: (2709, 17) });
} else {
return _lua_call((LANG_ERROR.read().unwrap().clone()), vec![], _lua_debug_loc { start: (2711, 23), end: (2711, 35) });
}
}
*stack.write().unwrap() = { let _lua_tmp = (new_stack.read().unwrap().clone()); _lua_tmp.clone() };
}
return (result.read().unwrap().clone());

_lua_nil()
}})); _lua_tmp.clone() };
let return_effect_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(sub_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(effect_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(typeAnnotation_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(thing_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(something_atom.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2729, 28), end: (2729, 68) })], _lua_debug_loc { start: (2727, 24), end: (2730, 25) })], _lua_debug_loc { start: (2725, 20), end: (2731, 21) }), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2724, 16), end: (2733, 17) })], _lua_debug_loc { start: (2722, 12), end: (2734, 13) }), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2721, 8), end: (2736, 9) })], _lua_debug_loc { start: (2719, 4), end: (2737, 5) })], _lua_debug_loc { start: (2718, 33), end: (2738, 1) })));
let bind_effect_systemName = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((systemName_make.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(sub_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![_lua_call((new_construction.read().unwrap().clone()), vec![(effect_atom.read().unwrap().clone()), _lua_call((new_construction.read().unwrap().clone()), vec![(construction_atom.read().unwrap().clone()), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2745, 16), end: (2745, 59) })], _lua_debug_loc { start: (2743, 12), end: (2746, 13) }), (null_v.read().unwrap().clone())], _lua_debug_loc { start: (2742, 8), end: (2748, 9) })], _lua_debug_loc { start: (2740, 4), end: (2749, 5) })], _lua_debug_loc { start: (2739, 31), end: (2750, 1) })));
let new_effect_bind = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*new_effect_bind.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_data = new_data.clone();
let bind_effect_systemName = bind_effect_systemName.clone();
let new_list = new_list.clone();
move |mut _lua_arg_tmp, _| {
let monad = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let func = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_data.read().unwrap().clone()), vec![(bind_effect_systemName.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![(monad.read().unwrap().clone()), (func.read().unwrap().clone())], _lua_debug_loc { start: (2754, 8), end: (2754, 29) })], _lua_debug_loc { start: (2752, 11), end: (2755, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let new_effect_return = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*new_effect_return.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let new_data = new_data.clone();
let return_effect_systemName = return_effect_systemName.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((new_data.read().unwrap().clone()), vec![(return_effect_systemName.read().unwrap().clone()), (x.read().unwrap().clone())], _lua_debug_loc { start: (2758, 11), end: (2758, 48) });

_lua_nil()
}})); _lua_tmp.clone() };
let run_monad_helper = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*run_monad_helper.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
let force_all = force_all.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let data_list = data_list.clone();
let equal_p = equal_p.clone();
let return_effect_systemName = return_effect_systemName.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let trampoline_delay = trampoline_delay.clone();
let run_monad_helper = run_monad_helper.clone();
let apply = apply.clone();
let bind_effect_systemName = bind_effect_systemName.clone();
let new_atom = new_atom.clone();
let new_data = new_data.clone();
let function_atom = function_atom.clone();
let new_list = new_list.clone();
let make_quote = make_quote.clone();
move |mut _lua_arg_tmp, _| {
let return_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let next = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, (next.read().unwrap().clone()), _lua_nil(), _lua_debug_loc { start: (2761, 7), end: (2761, 18) }}).as_bool(_lua_debug_loc { start: (2761, 7), end: (2761, 18) }) {
*next.write().unwrap() = { let _lua_tmp = _lua_false(); _lua_tmp.clone() };
}
let make_bind = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*make_bind.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let error = error.clone();
move |mut _lua_arg_tmp, _| {
let x = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call((error.read().unwrap().clone()), vec![_lua_str("WIP")], _lua_debug_loc { start: (2765, 8), end: (2765, 20) });

_lua_nil()
}})); _lua_tmp.clone() };
*code.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(code.read().unwrap().clone())], _lua_debug_loc { start: (2767, 11), end: (2767, 26) }); _lua_tmp.clone() };
if (_lua_call((data_p.read().unwrap().clone()), vec![(code.read().unwrap().clone())], _lua_debug_loc { start: (2768, 7), end: (2768, 19) })).as_bool(_lua_debug_loc { start: (2768, 7), end: (2768, 19) }) {
let name = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((data_name.read().unwrap().clone()), vec![(code.read().unwrap().clone())], _lua_debug_loc { start: (2769, 21), end: (2769, 36) })));
let list = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((data_list.read().unwrap().clone()), vec![(code.read().unwrap().clone())], _lua_debug_loc { start: (2770, 21), end: (2770, 36) })));
if (_lua_call((equal_p.read().unwrap().clone()), vec![(name.read().unwrap().clone()), (return_effect_systemName.read().unwrap().clone())], _lua_debug_loc { start: (2771, 11), end: (2771, 50) })).as_bool(_lua_debug_loc { start: (2771, 11), end: (2771, 50) }) {
*list.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2772, 19), end: (2772, 34) }); _lua_tmp.clone() };
if (_lua_call((construction_p.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2773, 15), end: (2773, 35) })).as_bool(_lua_debug_loc { start: (2773, 15), end: (2773, 35) }) {
let list_a = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2774, 31), end: (2774, 54) })));
let list_d = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2776, 20), end: (2776, 43) })], _lua_debug_loc { start: (2775, 31), end: (2777, 17) })));
if (_lua_call((null_p.read().unwrap().clone()), vec![(list_d.read().unwrap().clone())], _lua_debug_loc { start: (2778, 19), end: (2778, 33) })).as_bool(_lua_debug_loc { start: (2778, 19), end: (2778, 33) }) {
if (_lua_op!{eq, (next.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2779, 23), end: (2779, 36) }}).as_bool(_lua_debug_loc { start: (2779, 23), end: (2779, 36) }) {
let upval_v = std::sync::Arc::new(std::sync::RwLock::new((list_a.read().unwrap().clone())));
let upval_st = std::sync::Arc::new(std::sync::RwLock::new((state.read().unwrap().clone())));
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*r.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let return_handler = return_handler.clone();
let upval_v = upval_v.clone();
let upval_st = upval_st.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((return_handler.read().unwrap().clone()), vec![(upval_v.read().unwrap().clone()), (upval_st.read().unwrap().clone())], _lua_debug_loc { start: (2782, 50), end: (2782, 83) });

_lua_nil()
}})); _lua_tmp.clone() };
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![(r.read().unwrap().clone())], _lua_debug_loc { start: (2783, 31), end: (2783, 50) });
} else {
let upval_rt = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_rt.write().unwrap() = { let _lua_tmp = (return_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_op.write().unwrap() = { let _lua_tmp = (op_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_v = std::sync::Arc::new(std::sync::RwLock::new((list_a.read().unwrap().clone())));
let upval_st = std::sync::Arc::new(std::sync::RwLock::new((state.read().unwrap().clone())));
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*r.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let upval_rt = upval_rt.clone();
let upval_op = upval_op.clone();
let apply = apply.clone();
let next = next.clone();
let upval_v = upval_v.clone();
let upval_st = upval_st.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((run_monad_helper.read().unwrap().clone()), vec![(upval_rt.read().unwrap().clone()), (upval_op.read().unwrap().clone()), _lua_call((apply.read().unwrap().clone()), vec![(next.read().unwrap().clone()), (upval_v.read().unwrap().clone())], _lua_debug_loc { start: (2794, 28), end: (2794, 48) }), (upval_st.read().unwrap().clone())], _lua_debug_loc { start: (2791, 50), end: (2796, 25) });

_lua_nil()
}})); _lua_tmp.clone() };
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![(r.read().unwrap().clone())], _lua_debug_loc { start: (2797, 31), end: (2797, 50) });
}
}
}
} else if (_lua_call((equal_p.read().unwrap().clone()), vec![(name.read().unwrap().clone()), (bind_effect_systemName.read().unwrap().clone())], _lua_debug_loc { start: (2801, 15), end: (2801, 52) })).as_bool(_lua_debug_loc { start: (2801, 15), end: (2801, 52) }) {
*list.write().unwrap() = { let _lua_tmp = _lua_call((force_all.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2802, 19), end: (2802, 34) }); _lua_tmp.clone() };
if (_lua_call((construction_p.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2803, 15), end: (2803, 35) })).as_bool(_lua_debug_loc { start: (2803, 15), end: (2803, 35) }) {
let list_a = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2804, 31), end: (2804, 54) })));
let list_d = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(list.read().unwrap().clone())], _lua_debug_loc { start: (2806, 20), end: (2806, 43) })], _lua_debug_loc { start: (2805, 31), end: (2807, 17) })));
if (_lua_call((construction_p.read().unwrap().clone()), vec![(list_d.read().unwrap().clone())], _lua_debug_loc { start: (2808, 19), end: (2808, 41) })).as_bool(_lua_debug_loc { start: (2808, 19), end: (2808, 41) }) {
let list_d_a = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((construction_head.read().unwrap().clone()), vec![(list_d.read().unwrap().clone())], _lua_debug_loc { start: (2809, 37), end: (2809, 62) })));
let list_d_d = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((force_all.read().unwrap().clone()), vec![_lua_call((construction_tail.read().unwrap().clone()), vec![(list_d.read().unwrap().clone())], _lua_debug_loc { start: (2811, 24), end: (2811, 49) })], _lua_debug_loc { start: (2810, 37), end: (2812, 21) })));
if (_lua_call((null_p.read().unwrap().clone()), vec![(list_d_d.read().unwrap().clone())], _lua_debug_loc { start: (2813, 23), end: (2813, 39) })).as_bool(_lua_debug_loc { start: (2813, 23), end: (2813, 39) }) {
if (_lua_op!{eq, (next.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2814, 27), end: (2814, 40) }}).as_bool(_lua_debug_loc { start: (2814, 27), end: (2814, 40) }) {
let upval_rt = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_rt.write().unwrap() = { let _lua_tmp = (return_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_op.write().unwrap() = { let _lua_tmp = (op_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_a = std::sync::Arc::new(std::sync::RwLock::new((list_a.read().unwrap().clone())));
let upval_b = std::sync::Arc::new(std::sync::RwLock::new((list_d_a.read().unwrap().clone())));
let upval_st = std::sync::Arc::new(std::sync::RwLock::new((state.read().unwrap().clone())));
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*r.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let upval_rt = upval_rt.clone();
let upval_op = upval_op.clone();
let upval_a = upval_a.clone();
let upval_st = upval_st.clone();
let upval_b = upval_b.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((run_monad_helper.read().unwrap().clone()), vec![(upval_rt.read().unwrap().clone()), (upval_op.read().unwrap().clone()), (upval_a.read().unwrap().clone()), (upval_st.read().unwrap().clone()), (upval_b.read().unwrap().clone())], _lua_debug_loc { start: (2822, 54), end: (2822, 118) });

_lua_nil()
}})); _lua_tmp.clone() };
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![(r.read().unwrap().clone())], _lua_debug_loc { start: (2823, 35), end: (2823, 54) });
} else {
let upval_rt = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_rt.write().unwrap() = { let _lua_tmp = (return_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*upval_op.write().unwrap() = { let _lua_tmp = (op_handler.read().unwrap().clone()); _lua_tmp.clone() };
let upval_a = std::sync::Arc::new(std::sync::RwLock::new((list_a.read().unwrap().clone())));
let upval_b = std::sync::Arc::new(std::sync::RwLock::new((list_d_a.read().unwrap().clone())));
let upval_st = std::sync::Arc::new(std::sync::RwLock::new((state.read().unwrap().clone())));
let upval_nt = std::sync::Arc::new(std::sync::RwLock::new((next.read().unwrap().clone())));
let x = std::sync::Arc::new(std::sync::RwLock::new(_lua_call((new_atom.read().unwrap().clone()), vec![_lua_str("序甲")], _lua_debug_loc { start: (2833, 38), end: (2833, 52) })));
let r = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*r.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let upval_rt = upval_rt.clone();
let upval_op = upval_op.clone();
let upval_a = upval_a.clone();
let upval_st = upval_st.clone();
let new_data = new_data.clone();
let function_atom = function_atom.clone();
let new_list = new_list.clone();
let x = x.clone();
let make_bind = make_bind.clone();
let make_quote = make_quote.clone();
let upval_b = upval_b.clone();
let upval_nt = upval_nt.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((run_monad_helper.read().unwrap().clone()), vec![(upval_rt.read().unwrap().clone()), (upval_op.read().unwrap().clone()), (upval_a.read().unwrap().clone()), (upval_st.read().unwrap().clone()), _lua_call((new_data.read().unwrap().clone()), vec![(function_atom.read().unwrap().clone()), _lua_call((new_list.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![(x.read().unwrap().clone())], _lua_debug_loc { start: (2842, 40), end: (2842, 51) }), _lua_call((make_bind.read().unwrap().clone()), vec![_lua_call((new_list.read().unwrap().clone()), vec![_lua_call((make_quote.read().unwrap().clone()), vec![(upval_b.read().unwrap().clone())], _lua_debug_loc { start: (2845, 48), end: (2845, 67) }), (x.read().unwrap().clone())], _lua_debug_loc { start: (2844, 44), end: (2847, 45) }), _lua_call((make_quote.read().unwrap().clone()), vec![(upval_nt.read().unwrap().clone())], _lua_debug_loc { start: (2848, 44), end: (2848, 64) })], _lua_debug_loc { start: (2843, 40), end: (2849, 41) })], _lua_debug_loc { start: (2841, 36), end: (2850, 37) })], _lua_debug_loc { start: (2839, 32), end: (2851, 33) })], _lua_debug_loc { start: (2834, 54), end: (2852, 29) });

_lua_nil()
}})); _lua_tmp.clone() };
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![(r.read().unwrap().clone())], _lua_debug_loc { start: (2853, 35), end: (2853, 54) });
}
}
}
}
}
}
if (_lua_op!{eq, (next.read().unwrap().clone()), _lua_false(), _lua_debug_loc { start: (2860, 7), end: (2860, 20) }}).as_bool(_lua_debug_loc { start: (2860, 7), end: (2860, 20) }) {
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![_lua_lambda(Box::new({let op_handler = op_handler.clone();
let code = code.clone();
let state = state.clone();
let return_handler = return_handler.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((op_handler.read().unwrap().clone()), vec![(code.read().unwrap().clone()), (state.read().unwrap().clone()), (return_handler.read().unwrap().clone())], _lua_debug_loc { start: (2862, 30), end: (2862, 69) });

_lua_nil()
}}))], _lua_debug_loc { start: (2861, 15), end: (2863, 9) });
} else {
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![_lua_lambda(Box::new({let op_handler = op_handler.clone();
let code = code.clone();
let state = state.clone();
let trampoline_delay = trampoline_delay.clone();
let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let apply = apply.clone();
let next = next.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((op_handler.read().unwrap().clone()), vec![(code.read().unwrap().clone()), (state.read().unwrap().clone()), _lua_lambda(Box::new({let trampoline_delay = trampoline_delay.clone();
let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let op_handler = op_handler.clone();
let apply = apply.clone();
let next = next.clone();
move |mut _lua_arg_tmp, _| {
let val2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state2 = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((trampoline_delay.read().unwrap().clone()), vec![_lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let op_handler = op_handler.clone();
let apply = apply.clone();
let next = next.clone();
let val2 = val2.clone();
let state2 = state2.clone();
move |mut _lua_arg_tmp, _| {
return _lua_call((run_monad_helper.read().unwrap().clone()), vec![(return_handler.read().unwrap().clone()), (op_handler.read().unwrap().clone()), _lua_call((apply.read().unwrap().clone()), vec![(next.read().unwrap().clone()), _lua_vec(vec![(val2.read().unwrap().clone())])], _lua_debug_loc { start: (2873, 24), end: (2873, 43) }), (state2.read().unwrap().clone())], _lua_debug_loc { start: (2870, 38), end: (2875, 21) });

_lua_nil()
}}))], _lua_debug_loc { start: (2869, 46), end: (2876, 17) });

_lua_nil()
}}))], _lua_debug_loc { start: (2866, 30), end: (2877, 13) });

_lua_nil()
}}))], _lua_debug_loc { start: (2865, 15), end: (2878, 9) });
}

_lua_nil()
}})); _lua_tmp.clone() };
let run_monad_trampoline = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*run_monad_trampoline.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
move |mut _lua_arg_tmp, _| {
let return_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((run_monad_helper.read().unwrap().clone()), vec![(return_handler.read().unwrap().clone()), (op_handler.read().unwrap().clone()), (code.read().unwrap().clone()), (state.read().unwrap().clone())], _lua_debug_loc { start: (2882, 11), end: (2882, 68) });

_lua_nil()
}})); _lua_tmp.clone() };
let run_monad_stackoverflow = std::sync::Arc::new(std::sync::RwLock::new(_lua_nil()));
*run_monad_stackoverflow.write().unwrap() = { let _lua_tmp = _lua_lambda(Box::new({let run_trampoline = run_trampoline.clone();
let run_monad_helper = run_monad_helper.clone();
let trampoline_return = trampoline_return.clone();
move |mut _lua_arg_tmp, _| {
let return_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((run_trampoline.read().unwrap().clone()), vec![_lua_call((run_monad_helper.read().unwrap().clone()), vec![_lua_lambda(Box::new({let trampoline_return = trampoline_return.clone();
let return_handler = return_handler.clone();
move |mut _lua_arg_tmp, _| {
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((trampoline_return.read().unwrap().clone()), vec![_lua_call((return_handler.read().unwrap().clone()), vec![(v.read().unwrap().clone()), (s.read().unwrap().clone())], _lua_debug_loc { start: (2888, 16), end: (2888, 36) })], _lua_debug_loc { start: (2887, 35), end: (2889, 13) });

_lua_nil()
}})), _lua_lambda(Box::new({let trampoline_return = trampoline_return.clone();
let op_handler = op_handler.clone();
let run_trampoline = run_trampoline.clone();
move |mut _lua_arg_tmp, _| {
let op = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let st = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rs = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((trampoline_return.read().unwrap().clone()), vec![_lua_call((op_handler.read().unwrap().clone()), vec![(op.read().unwrap().clone()), (st.read().unwrap().clone()), _lua_lambda(Box::new({let run_trampoline = run_trampoline.clone();
let rs = rs.clone();
move |mut _lua_arg_tmp, _| {
let v = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::sync::RwLock::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call((run_trampoline.read().unwrap().clone()), vec![_lua_call((rs.read().unwrap().clone()), vec![(v.read().unwrap().clone()), (s.read().unwrap().clone())], _lua_debug_loc { start: (2895, 24), end: (2895, 32) })], _lua_debug_loc { start: (2894, 42), end: (2896, 21) });

_lua_nil()
}}))], _lua_debug_loc { start: (2891, 16), end: (2897, 17) })], _lua_debug_loc { start: (2890, 41), end: (2898, 13) });

_lua_nil()
}})), (code.read().unwrap().clone()), (state.read().unwrap().clone())], _lua_debug_loc { start: (2886, 8), end: (2901, 9) })], _lua_debug_loc { start: (2885, 11), end: (2902, 5) });

_lua_nil()
}})); _lua_tmp.clone() };
let ____exports = std::sync::Arc::new(std::sync::RwLock::new(_lua_vec(vec![])));
_lua_set((____exports.read().unwrap().clone()),_lua_str("trampoline_return"),(trampoline_return.read().unwrap().clone()), _lua_debug_loc { start: (2906, 0), end: (2906, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("trampoline_delay"),(trampoline_delay.read().unwrap().clone()), _lua_debug_loc { start: (2907, 0), end: (2907, 47) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("run_trampoline"),(run_trampoline.read().unwrap().clone()), _lua_debug_loc { start: (2908, 0), end: (2908, 43) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_comment"),(new_comment.read().unwrap().clone()), _lua_debug_loc { start: (2909, 0), end: (2909, 37) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("comment_p"),(comment_p.read().unwrap().clone()), _lua_debug_loc { start: (2910, 0), end: (2910, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("comment_comment"),(comment_comment.read().unwrap().clone()), _lua_debug_loc { start: (2911, 0), end: (2911, 45) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("comment_x"),(comment_x.read().unwrap().clone()), _lua_debug_loc { start: (2912, 0), end: (2912, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("un_comment_all"),(un_comment_all.read().unwrap().clone()), _lua_debug_loc { start: (2913, 0), end: (2913, 43) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_atom"),(new_atom.read().unwrap().clone()), _lua_debug_loc { start: (2914, 0), end: (2914, 31) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("atom_p"),(atom_p.read().unwrap().clone()), _lua_debug_loc { start: (2915, 0), end: (2915, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("un_atom"),(un_atom.read().unwrap().clone()), _lua_debug_loc { start: (2916, 0), end: (2916, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("atom_equal_p"),(atom_equal_p.read().unwrap().clone()), _lua_debug_loc { start: (2917, 0), end: (2917, 39) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_construction"),(new_construction.read().unwrap().clone()), _lua_debug_loc { start: (2918, 0), end: (2918, 47) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("construction_p"),(construction_p.read().unwrap().clone()), _lua_debug_loc { start: (2919, 0), end: (2919, 43) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("construction_head"),(construction_head.read().unwrap().clone()), _lua_debug_loc { start: (2920, 0), end: (2920, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("construction_tail"),(construction_tail.read().unwrap().clone()), _lua_debug_loc { start: (2921, 0), end: (2921, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("null_v"),(null_v.read().unwrap().clone()), _lua_debug_loc { start: (2922, 0), end: (2922, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("null_p"),(null_p.read().unwrap().clone()), _lua_debug_loc { start: (2923, 0), end: (2923, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_data"),(new_data.read().unwrap().clone()), _lua_debug_loc { start: (2924, 0), end: (2924, 31) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("data_p"),(data_p.read().unwrap().clone()), _lua_debug_loc { start: (2925, 0), end: (2925, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("data_name"),(data_name.read().unwrap().clone()), _lua_debug_loc { start: (2926, 0), end: (2926, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("data_list"),(data_list.read().unwrap().clone()), _lua_debug_loc { start: (2927, 0), end: (2927, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("just_p"),(just_p.read().unwrap().clone()), _lua_debug_loc { start: (2928, 0), end: (2928, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("evaluate"),(evaluate.read().unwrap().clone()), _lua_debug_loc { start: (2929, 0), end: (2929, 31) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("apply"),(apply.read().unwrap().clone()), _lua_debug_loc { start: (2930, 0), end: (2930, 25) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force_all_rec"),(force_all_rec.read().unwrap().clone()), _lua_debug_loc { start: (2931, 0), end: (2931, 41) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force_uncomment_all_rec"),(force_uncomment_all_rec.read().unwrap().clone()), _lua_debug_loc { start: (2932, 0), end: (2932, 61) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("unlazy_all_rec"),(unlazy_all_rec.read().unwrap().clone()), _lua_debug_loc { start: (2933, 0), end: (2933, 43) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("jsArray_to_list"),(jsArray_to_list.read().unwrap().clone()), _lua_debug_loc { start: (2934, 0), end: (2934, 45) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("maybe_list_to_jsArray"),(maybe_list_to_jsArray.read().unwrap().clone()), _lua_debug_loc { start: (2935, 0), end: (2935, 57) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_list"),(new_list.read().unwrap().clone()), _lua_debug_loc { start: (2936, 0), end: (2936, 31) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("un_just_all"),(un_just_all.read().unwrap().clone()), _lua_debug_loc { start: (2937, 0), end: (2937, 37) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("un_just_comment_all"),(un_just_comment_all.read().unwrap().clone()), _lua_debug_loc { start: (2938, 0), end: (2938, 53) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("delay_p"),(delay_p.read().unwrap().clone()), _lua_debug_loc { start: (2939, 0), end: (2939, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("delay_just_p"),(delay_just_p.read().unwrap().clone()), _lua_debug_loc { start: (2940, 0), end: (2940, 39) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("lazy_p"),(lazy_p.read().unwrap().clone()), _lua_debug_loc { start: (2941, 0), end: (2941, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("delay_env"),(delay_env.read().unwrap().clone()), _lua_debug_loc { start: (2942, 0), end: (2942, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("delay_x"),(delay_x.read().unwrap().clone()), _lua_debug_loc { start: (2943, 0), end: (2943, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force_all"),(force_all.read().unwrap().clone()), _lua_debug_loc { start: (2944, 0), end: (2944, 33) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force1"),(force1.read().unwrap().clone()), _lua_debug_loc { start: (2945, 0), end: (2945, 27) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force_uncomment1"),(force_uncomment1.read().unwrap().clone()), _lua_debug_loc { start: (2946, 0), end: (2946, 47) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("force_uncomment_all"),(force_uncomment_all.read().unwrap().clone()), _lua_debug_loc { start: (2947, 0), end: (2947, 53) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("unlazy1"),(unlazy1.read().unwrap().clone()), _lua_debug_loc { start: (2948, 0), end: (2948, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("env_null_v"),(env_null_v.read().unwrap().clone()), _lua_debug_loc { start: (2949, 0), end: (2949, 35) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("env_set"),(env_set.read().unwrap().clone()), _lua_debug_loc { start: (2950, 0), end: (2950, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("env_get"),(env_get.read().unwrap().clone()), _lua_debug_loc { start: (2951, 0), end: (2951, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("env2val"),(env2val.read().unwrap().clone()), _lua_debug_loc { start: (2952, 0), end: (2952, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("env_foreach"),(env_foreach.read().unwrap().clone()), _lua_debug_loc { start: (2953, 0), end: (2953, 37) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("val2env"),(val2env.read().unwrap().clone()), _lua_debug_loc { start: (2954, 0), end: (2954, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("equal_p"),(equal_p.read().unwrap().clone()), _lua_debug_loc { start: (2955, 0), end: (2955, 29) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("simple_print"),(simple_print.read().unwrap().clone()), _lua_debug_loc { start: (2956, 0), end: (2956, 39) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("complex_parse"),(complex_parse.read().unwrap().clone()), _lua_debug_loc { start: (2957, 0), end: (2957, 41) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("complex_print"),(complex_print.read().unwrap().clone()), _lua_debug_loc { start: (2958, 0), end: (2958, 41) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("machinetext_parse"),(machinetext_parse.read().unwrap().clone()), _lua_debug_loc { start: (2959, 0), end: (2959, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("machinetext_print"),(machinetext_print.read().unwrap().clone()), _lua_debug_loc { start: (2960, 0), end: (2960, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("return_effect_systemName"),(return_effect_systemName.read().unwrap().clone()), _lua_debug_loc { start: (2961, 0), end: (2961, 63) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("bind_effect_systemName"),(bind_effect_systemName.read().unwrap().clone()), _lua_debug_loc { start: (2962, 0), end: (2962, 59) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_effect_bind"),(new_effect_bind.read().unwrap().clone()), _lua_debug_loc { start: (2963, 0), end: (2963, 45) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("new_effect_return"),(new_effect_return.read().unwrap().clone()), _lua_debug_loc { start: (2964, 0), end: (2964, 49) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("run_monad_trampoline"),(run_monad_trampoline.read().unwrap().clone()), _lua_debug_loc { start: (2965, 0), end: (2965, 55) });
_lua_set((____exports.read().unwrap().clone()),_lua_str("run_monad_stackoverflow"),(run_monad_stackoverflow.read().unwrap().clone()), _lua_debug_loc { start: (2966, 0), end: (2966, 61) });
return (____exports.read().unwrap().clone());
    _lua_nil()
}
