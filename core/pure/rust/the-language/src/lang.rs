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

pub type _lua_gc_t<X> = std::sync::Arc<X>;
pub fn _lua_gc_t__new<X>(x: X) -> _lua_gc_t<X> {
    std::sync::Arc::new(x)
}
pub type _lua_data = _lua_gc_t<_lua_data_unpack>;
pub fn _lua_data__pack(data: _lua_data_unpack) -> _lua_data {
    _lua_gc_t__new(data)
}
pub struct _lua_data_unpack_function (Box<Fn(Vec<_lua_data>) -> _lua_data>);
impl std::hash::Hash for _lua_data_unpack_function {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        let sel: *const (Fn(Vec<_lua_data>) -> _lua_data) = &*self.0;
        sel.hash(state);
    }
}
impl PartialEq for _lua_data_unpack_function {
    fn eq(&self, other: &Self) -> bool {
        let sel: *const (Fn(Vec<_lua_data>) -> _lua_data) = &*self.0;
        let other: *const (Fn(Vec<_lua_data>) -> _lua_data) = &*other.0;
        sel == other
    }
}
impl Eq for _lua_data_unpack_function {}
impl std::fmt::Debug for _lua_data_unpack_function {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let sel: *const (Fn(Vec<_lua_data>) -> _lua_data) = &*self.0;
        write!(f, "_lua_data_unpack_function({:p})", sel)
    }
}
#[derive(Debug)]
pub struct _lua_data_unpack_table (std::sync::Mutex<std::collections::HashMap<_lua_data,_lua_data>>);
impl std::hash::Hash for _lua_data_unpack_table {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        let sel: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*self.0.lock().unwrap();
        sel.hash(state);
    }
}
impl PartialEq for _lua_data_unpack_table {
    fn eq(&self, other: &Self) -> bool {
        let sel: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*self.0.lock().unwrap();
        let other: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*other.0.lock().unwrap();
        sel == other
    }
}
impl Eq for _lua_data_unpack_table {}
#[derive(Debug)]
pub struct _lua_data_unpack_number (f64);
impl std::hash::Hash for _lua_data_unpack_number {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.0.to_bits().hash(state);
    }
}
impl PartialEq for _lua_data_unpack_number {
    fn eq(&self, other: &Self) -> bool {
        self.0 == other.0 // 此处可能和Lua实现不同。
    }
}
impl Eq for _lua_data_unpack_number {}
#[derive(Hash,PartialEq,Eq,Debug)]
pub enum _lua_data_unpack {
    Number(_lua_data_unpack_number),
    String(String),
    Table(_lua_data_unpack_table),
    Function(_lua_data_unpack_function),
    True,
    False,
    Nil,
}
impl std::fmt::Display for _lua_data_unpack {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            _lua_data_unpack::Number(_lua_data_unpack_number(x)) => write!(f, "{}", x),
            _lua_data_unpack::String(x) => write!(f, "{}", x),
            _lua_data_unpack::Table(x) => {
                let p: *const (std::collections::HashMap<_lua_data,_lua_data>) = &*x.0.lock().unwrap();
                write!(f, "table: {:p}", p)},
            _lua_data_unpack::Function(x) => {
                let p: *const (Fn(Vec<_lua_data>) -> _lua_data) = &*x.0;
                write!(f, "function: {:p}", p)},
            _lua_data_unpack::True => write!(f, "true"),
            _lua_data_unpack::False => write!(f, "false"),
            _lua_data_unpack::Nil => write!(f, "nil"),
        }
    }
}
impl _lua_data_unpack {
    pub fn as_bool(&self) -> bool {
        match self {
            _lua_data_unpack::False | _lua_data_unpack::Nil => false,
            _ => true,
        }
    }
    pub fn as_f64(&self) -> f64 {
        if let _lua_data_unpack::Number(x) = self {
            x.0
        } else {
            panic!("isn't number")
        }
    }
    pub fn lua_tonumber(&self) -> _lua_data {
        if let _lua_data_unpack::String(x) = self {
            if let Ok(r) = x.parse::<f64>() { _lua_num(r) } else { _lua_nil() }
        } else if let _lua_data_unpack::Number(x) = self {
            _lua_data__pack(_lua_data_unpack::Number(_lua_data_unpack_number(x.0)))
        } else {
            _lua_nil()
        }
    }
    pub fn as_string(&self) -> String {
        if let _lua_data_unpack::String(x) = self {
            x.clone()
        } else {
            panic!("isn't string")
        }
    }
    pub fn from_bool(x: bool) -> Self {
        if x { _lua_data_unpack::True } else { _lua_data_unpack::False }
    }
}
pub fn _lua_str<'a>(x: &'a str) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::String(String::from(x)))
}
#[macro_export]
macro_rules! _lua_num {
    ($x:expr) => (_lua_num($x as f64))
}
pub fn _lua_num(x: f64) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Number(_lua_data_unpack_number(x)))
}
pub fn _lua_table(xs: Vec<(_lua_data, _lua_data)>) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Table(_lua_data_unpack_table(std::sync::Mutex::new(xs.iter().cloned().collect()))))
}
pub fn _lua_len(xs: _lua_data) -> _lua_data {
    if let _lua_data_unpack::Table(t) = &*xs {
        _lua_num!(t.0.lock().unwrap().len()) // FIX ME 此处与Lua不同
    } else {
        panic!("attempt to get length of a value that isn't a table")
    }
}
pub fn _lua_lookup(map: _lua_data, key: _lua_data) -> _lua_data {
    if let _lua_data_unpack::Table(t) = &*map {
        if let Some(x) = t.0.lock().unwrap().get(&key) {
            x.clone()
        } else {
            _lua_data__pack(_lua_data_unpack::Nil)
        }
    } else {
        panic!("attempt to index a value that isn't a table")
    }
}
pub fn _lua_set(map: _lua_data, key: _lua_data, val: _lua_data) {
    if let _lua_data_unpack::Table(t) = &*map {
        t.0.lock().unwrap().insert(key,val);
    } else {
        panic!("attempt to index a value that isn't a table");
    }
}
pub fn _lua_vec(xs: Vec<_lua_data>) -> _lua_data {
    let mut result = std::collections::HashMap::new();
    for i in 1..=xs.len() {
        result.insert(_lua_num(i as f64), xs[i-1].clone());
    }
    _lua_data__pack(_lua_data_unpack::Table(_lua_data_unpack_table(std::sync::Mutex::new(result))))
}
pub fn _lua_lambda(f: Box<Fn(Vec<_lua_data>) -> _lua_data>) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Function(_lua_data_unpack_function(f)))
}
pub fn _lua_call(f: _lua_data, args: Vec<_lua_data>) -> _lua_data {
    if let _lua_data_unpack::Function(v) = &*f {
        v.0(args)
    } else {
        panic!("attempt to call a value that isn't a function")
    }
}
pub fn _lua_not(x: _lua_data) -> _lua_data {
    _lua_bool(!x.as_bool())
}
pub fn _lua_bool(x: bool) -> _lua_data {
    _lua_data__pack(_lua_data_unpack::from_bool(x))
}
#[macro_export]
macro_rules! _lua_op {
    (or, $x: expr, $y: expr) => (if $x.as_bool() { $x } else { $y });
    (and, $x: expr, $y: expr) => (if !$x.as_bool() { $x } else { $y });
    (add, $x: expr, $y: expr) => (_lua_num($x.as_f64() + $y.as_f64()));
    (sub, $x: expr, $y: expr) => (_lua_num($x.as_f64() - $y.as_f64()));
    (mul, $x: expr, $y: expr) => (_lua_num($x.as_f64() * $y.as_f64()));
    (div, $x: expr, $y: expr) => (_lua_num($x.as_f64() / $y.as_f64()));
    (rem, $x: expr, $y: expr) => (panic!("not implemented: rem"));
    (exp, $x: expr, $y: expr) => (panic!("not implemented: exp"));
    (eq, $x: expr, $y: expr) => (_lua_bool($x == $y));
    (not_eq, $x: expr, $y: expr) => (_lua_bool($x != $y));
    (less_eq, $x: expr, $y: expr) => (_lua_bool($x.as_f64() <= $y.as_f64()));
    (greater_eq, $x: expr, $y: expr) => (_lua_bool($x.as_f64() >= $y.as_f64()));
    (less, $x: expr, $y: expr) => (_lua_bool($x.as_f64() < $y.as_f64()));
    (greater, $x: expr, $y: expr) => (_lua_bool($x.as_f64() > $y.as_f64()));
    (concat, $x: expr, $y: expr) => (_lua_data__pack(_lua_data_unpack::String($x.as_string() + &$y.as_string())));
}
pub fn _lua_nil() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::Nil)
}
pub fn _lua_true() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::True)
}
pub fn _lua_false() -> _lua_data {
    _lua_data__pack(_lua_data_unpack::False)
}
pub fn _lua_neg(x: _lua_data) -> _lua_data {
    _lua_num(-x.as_f64())
}
pub fn lang() -> _lua_data {
    // https://www.lua.org/manual/5.3/manual.html#pdf-print
    let print = std::sync::Arc::new(std::cell::RefCell::new(_lua_lambda(Box::new(|xs| {
        println!("{}", xs.iter().fold(String::from(""), |acc, x| if acc == "" { format!("{}", x) } else { acc + "\t" + &format!("{}", x) }));
        _lua_nil()
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-tostring
    let tostring = std::sync::Arc::new(std::cell::RefCell::new(_lua_lambda(Box::new(|mut xs| {
        let x = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        _lua_data__pack(_lua_data_unpack::String(format!("{}", x)))
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-tonumber
    // base未实现
    let tonumber = std::sync::Arc::new(std::cell::RefCell::new(_lua_lambda(Box::new(|mut xs| {
        let arg: _lua_data = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        arg.lua_tonumber()
    }))));
    // https://www.lua.org/manual/5.3/manual.html#pdf-error
    // level未实现
    let error = std::sync::Arc::new(std::cell::RefCell::new(_lua_lambda(Box::new(|mut xs| {
        let message: _lua_data = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
        panic!(message.as_string())
    }))));
    let table = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![
        // https://www.lua.org/manual/5.3/manual.html#pdf-table.insert
        (_lua_str("insert"), _lua_lambda(Box::new(|mut xs| {
            if xs.len() <= 2 {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let value = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                _lua_set(list.clone(), _lua_op!(add, _lua_len(list.clone()), _lua_num!(1)), value.clone());
            } else {
                let list = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let pos = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64() as usize;
                let value = if xs.is_empty() { _lua_nil() } else { xs.remove(0) };
                let len = _lua_len(list.clone()).as_f64() as usize;
                for i in (pos..=len).rev() {
                    _lua_set(list.clone(), _lua_op!(add, _lua_num!(i), _lua_num!(1)), _lua_lookup(list.clone(), _lua_num!(i)));
                }
                _lua_set(list.clone(), _lua_num!(pos), value);
            }
            _lua_nil()
        }))),
    ])));
    let string = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![
        // https://www.lua.org/manual/5.3/manual.html#pdf-string.sub
        // 只支持正整数
        (_lua_str("sub"), _lua_lambda(Box::new(|mut xs| {
            let s: String = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_string().clone();
            let i = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64() as usize;
            let j = (if xs.is_empty() { _lua_nil() } else { xs.remove(0) }).as_f64() as usize;
            _lua_str(&s[i-1..j])
        }))),
    ])));
let __TS__ArrayPush = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*__TS__ArrayPush.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let arr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let items = std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_vararg.clone()));
let _lua_tmp_t={ let _lua_tmp = items.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let item=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
_lua_set({ let _lua_tmp = arr.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_len({ let _lua_tmp = arr.borrow(); _lua_tmp.clone() }), _lua_num!(1)},{ let _lua_tmp = item.borrow(); _lua_tmp.clone() });
}
return _lua_len({ let _lua_tmp = arr.borrow(); _lua_tmp.clone() });

_lua_nil()
}}));
let __TS__ArrayUnshift = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*__TS__ArrayUnshift.borrow_mut() = _lua_lambda(Box::new({let table = table.clone();
move |mut _lua_arg_tmp| {
let arr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let items = std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_vararg.clone()));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = items.borrow(); _lua_tmp.clone() }), _lua_num!(1)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}).as_bool() {
_lua_call(_lua_lookup({ let _lua_tmp = table.borrow(); _lua_tmp.clone() },_lua_str("insert")), vec![{ let _lua_tmp = arr.borrow(); _lua_tmp.clone() }, _lua_num!(1), _lua_lookup({ let _lua_tmp = items.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_len({ let _lua_tmp = arr.borrow(); _lua_tmp.clone() });

_lua_nil()
}}));
let LANG_ERROR = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let LANG_ASSERT = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let recordstring_null_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let recordstring_shadow_copy = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let trampoline_return = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let trampoline_delay = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let atom_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let null_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let just_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_evaluate_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_func_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_form_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_apply_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let comment_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let hole_t = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_comment = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let comment_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let comment_comment = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let comment_x = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let un_comment_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let atom_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let un_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let atom_equal_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_construction = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_head = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_tail = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let null_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let null_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_data = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_name = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_list = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let just_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let un_just = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let evaluate = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_evaluate_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_evaluate_env = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_evaluate_x = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let builtin_form_apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_form_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_form_env = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_form_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_form_xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let builtin_func_apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_func_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_func_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_builtin_func_xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_apply_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_apply_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_apply_xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let force_all_rec = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let unlazy_all_rec = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_hole_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let hole_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let lang_assert_equal_set_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let hole_set_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let lang_copy_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let system_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let name_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let function_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let form_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let mapping_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let error_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let the_world_stopped_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_name_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_list_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data_p_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_p_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_head_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let construction_tail_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let atom_p_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let null_p_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let equal_p_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let apply_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let evaluate_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let if_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let quote_form_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let lambda_form_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let function_builtin_use_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let form_builtin_use_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let form_use_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let comment_form_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_error = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let jsArray_to_list = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_list = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let un_just_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let delay_just_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let lazy_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let force_all_inner = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let force1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let force_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let force_uncomment_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let unlazy1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let unlazy_list_1_keepcomment = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let name_unlazy1_p3 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let make_enviroment_null_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_null_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_helper_print0 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_helper_print_step = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_helper_node_expand = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_helper_tree_shadow_copy = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let enviroment_set_helper = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let env_null_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let env_set = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let env_get = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let must_env_get = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let env2val = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let env_foreach = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let real_evaluate = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let real_builtin_func_apply_s = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let real_apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let real_builtin_func_apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let real_builtin_form_apply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let make_quote = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let new_lambda = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let jsbool_equal_p_inner = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let equal_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let simple_print = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*LANG_ERROR.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
move |mut _lua_arg_tmp| {
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("TheLanguage PANIC")]);

_lua_nil()
}}));
*LANG_ASSERT.borrow_mut() = _lua_lambda(Box::new({let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not({ let _lua_tmp = x.borrow(); _lua_tmp.clone() })).as_bool() {
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}

_lua_nil()
}}));
*recordstring_null_p.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
for (_lua_tmp_k, _) in { let _lua_tmp: std::collections::HashMap<_lua_data,_lua_data> = if let _lua_data_unpack::Table(t) = &*({ let _lua_tmp = x.borrow(); _lua_tmp.clone() }) { t.0.lock().unwrap().clone() } else { panic!("not table") }; _lua_tmp }.iter() {
let k=std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_k.clone()));
return _lua_false();
}
return _lua_true();

_lua_nil()
}}));
*recordstring_shadow_copy.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let result = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
for (_lua_tmp_k, _) in { let _lua_tmp: std::collections::HashMap<_lua_data,_lua_data> = if let _lua_data_unpack::Table(t) = &*({ let _lua_tmp = x.borrow(); _lua_tmp.clone() }) { t.0.lock().unwrap().clone() } else { panic!("not table") }; _lua_tmp }.iter() {
let k=std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_k.clone()));
_lua_set({ let _lua_tmp = result.borrow(); _lua_tmp.clone() },{ let _lua_tmp = k.borrow(); _lua_tmp.clone() },_lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },{ let _lua_tmp = k.borrow(); _lua_tmp.clone() }));
}
return { let _lua_tmp = result.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*trampoline_return.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let x = x.clone();
move |mut _lua_arg_tmp| {
return _lua_table(vec![(_lua_num!(1), _lua_false()), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));

_lua_nil()
}}));
*trampoline_delay.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lambda(Box::new({let x = x.clone();
move |mut _lua_arg_tmp| {
return _lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), _lua_call({ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, vec![]))]);

_lua_nil()
}}));

_lua_nil()
}}));
*new_comment.borrow_mut() = _lua_lambda(Box::new({let comment_t = comment_t.clone();
move |mut _lua_arg_tmp| {
let comment = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = comment_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = comment.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*comment_p.borrow_mut() = _lua_lambda(Box::new({let comment_t = comment_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = comment_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*comment_comment.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*comment_x.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*un_comment_all.borrow_mut() = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*atom_p.borrow_mut() = _lua_lambda(Box::new({let atom_t = atom_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = atom_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*un_atom.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*atom_equal_p.borrow_mut() = _lua_lambda(Box::new({let un_atom = un_atom.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_true();
}
if (_lua_op!{eq, _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }])}).as_bool() {
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
return _lua_true();
} else {
return _lua_false();
}

_lua_nil()
}}));
*new_construction.borrow_mut() = _lua_lambda(Box::new({let construction_t = construction_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = construction_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*construction_p.borrow_mut() = _lua_lambda(Box::new({let construction_t = construction_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = construction_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*construction_head.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*construction_tail.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*null_p.borrow_mut() = _lua_lambda(Box::new({let null_t = null_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = null_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*new_data.borrow_mut() = _lua_lambda(Box::new({let data_t = data_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = data_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*data_p.borrow_mut() = _lua_lambda(Box::new({let data_t = data_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = data_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*data_name.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*data_list.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*just_p.borrow_mut() = _lua_lambda(Box::new({let just_t = just_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = just_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*un_just.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*evaluate.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_t = delay_evaluate_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = delay_evaluate_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*delay_evaluate_p.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_t = delay_evaluate_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = delay_evaluate_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*delay_evaluate_env.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*delay_evaluate_x.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*builtin_form_apply.borrow_mut() = _lua_lambda(Box::new({let delay_builtin_form_t = delay_builtin_form_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let z = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = delay_builtin_form_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() }), (_lua_num!(4), { let _lua_tmp = z.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*delay_builtin_form_p.borrow_mut() = _lua_lambda(Box::new({let delay_builtin_form_t = delay_builtin_form_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = delay_builtin_form_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*delay_builtin_form_env.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*delay_builtin_form_f.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*delay_builtin_form_xs.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(4));

_lua_nil()
}}));
*builtin_func_apply.borrow_mut() = _lua_lambda(Box::new({let delay_builtin_func_t = delay_builtin_func_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = delay_builtin_func_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*delay_builtin_func_p.borrow_mut() = _lua_lambda(Box::new({let delay_builtin_func_t = delay_builtin_func_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = delay_builtin_func_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*delay_builtin_func_f.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*delay_builtin_func_xs.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*apply.borrow_mut() = _lua_lambda(Box::new({let delay_apply_t = delay_apply_t.clone();
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = delay_apply_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = f.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = xs.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*delay_apply_p.borrow_mut() = _lua_lambda(Box::new({let delay_apply_t = delay_apply_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = delay_apply_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*delay_apply_f.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*delay_apply_xs.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3));

_lua_nil()
}}));
*force_all_rec.borrow_mut() = _lua_lambda(Box::new({let force_all = force_all.clone();
let force_all_rec = force_all_rec.clone();
let data_p = data_p.clone();
let construction_p = construction_p.clone();
let comment_p = comment_p.clone();
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }])));
let conslike = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*conslike.borrow_mut() = _lua_lambda(Box::new({let force_all_rec = force_all_rec.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_set({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2),_lua_call({ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2))]));
_lua_set({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3),_lua_call({ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3))]));
return { let _lua_tmp = xx.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*new_hole_do.borrow_mut() = _lua_lambda(Box::new({let hole_t = hole_t.clone();
move |mut _lua_arg_tmp| {
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = hole_t.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*hole_p.borrow_mut() = _lua_lambda(Box::new({let hole_t = hole_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{eq, _lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = hole_t.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*lang_assert_equal_set_do.borrow_mut() = _lua_lambda(Box::new({let null_v = null_v.clone();
let just_t = just_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_nil();
}
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }}).as_bool() {
*x.borrow_mut() = { let _lua_tmp = y.borrow(); _lua_tmp.clone() };
*y.borrow_mut() = { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() };
}
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1),{ let _lua_tmp = just_t.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2),{ let _lua_tmp = y.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3),_lua_false());
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(4),_lua_false());

_lua_nil()
}}));
*hole_set_do.borrow_mut() = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let hole_p = hole_p.clone();
move |mut _lua_arg_tmp| {
let rawx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rawy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = hole_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = rawx.borrow(); _lua_tmp.clone() }])]);
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_not(_lua_call({ let _lua_tmp = hole_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = rawy.borrow(); _lua_tmp.clone() }]))]);
let x = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = rawx.borrow(); _lua_tmp.clone() }));
let y = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = rawy.borrow(); _lua_tmp.clone() }));
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_lookup({ let _lua_tmp = y.borrow(); _lua_tmp.clone() },_lua_num!(1)));
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2),_lua_lookup({ let _lua_tmp = y.borrow(); _lua_tmp.clone() },_lua_num!(2)));
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(3),_lua_lookup({ let _lua_tmp = y.borrow(); _lua_tmp.clone() },_lua_num!(3)));
_lua_set({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(4),_lua_lookup({ let _lua_tmp = y.borrow(); _lua_tmp.clone() },_lua_num!(4)));

_lua_nil()
}}));
*lang_copy_do.borrow_mut() = _lua_lambda(Box::new({let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_hole_do.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = hole_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*new_error.borrow_mut() = _lua_lambda(Box::new({let new_data = new_data.clone();
let error_atom = error_atom.clone();
let new_construction = new_construction.clone();
let null_v = null_v.clone();
move |mut _lua_arg_tmp| {
let name = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let list = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = error_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])])]);

_lua_nil()
}}));
*jsArray_to_list.borrow_mut() = _lua_lambda(Box::new({let null_v = null_v.clone();
let new_construction = new_construction.clone();
move |mut _lua_arg_tmp| {
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*new_list.borrow_mut() = _lua_lambda(Box::new({let jsArray_to_list = jsArray_to_list.clone();
move |mut _lua_arg_tmp| {
let mut _lua_tmp_vararg = _lua_vec(_lua_arg_tmp);
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_vararg.clone()));
return _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*un_just_all.borrow_mut() = _lua_lambda(Box::new({let just_p = just_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let un_just = un_just.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not(_lua_call({ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]))).as_bool() {
return { let _lua_tmp = raw.borrow(); _lua_tmp.clone() };
}
let x = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
while (_lua_call({ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
let _lua_tmp_t={ let _lua_tmp = xs.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let v=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*delay_p.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_p = delay_evaluate_p.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_apply_p = delay_apply_p.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_op!{or, _lua_op!{or, _lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])};

_lua_nil()
}}));
*delay_just_p.borrow_mut() = _lua_lambda(Box::new({let just_p = just_p.clone();
let delay_p = delay_p.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_call({ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])};

_lua_nil()
}}));
*lazy_p.borrow_mut() = _lua_lambda(Box::new({let delay_just_p = delay_just_p.clone();
let comment_p = comment_p.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])};

_lua_nil()
}}));
*force_all_inner.borrow_mut() = _lua_lambda(Box::new({let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
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
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let parents_history = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ref_novalue_replace = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = parents_history.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*parents_history.borrow_mut() = _lua_table(vec![]);
}
if (_lua_op!{eq, { let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*ref_novalue_replace.borrow_mut() = _lua_table(vec![(_lua_num!(1), _lua_false()), (_lua_num!(2), _lua_false())]);
}
if (_lua_op!{eq, { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*xs.borrow_mut() = _lua_table(vec![]);
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let do_rewrite = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let do_rewrite_force_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*do_rewrite.borrow_mut() = _lua_lambda(Box::new({let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
let x = x.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp| {
let newval = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = newval.borrow(); _lua_tmp.clone() }]);
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), { let _lua_tmp = newval.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return { let _lua_tmp = newval.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*do_rewrite_force_all.borrow_mut() = _lua_lambda(Box::new({let do_rewrite = do_rewrite.clone();
let delay_just_p = delay_just_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let xs = xs.clone();
let x = x.clone();
let force_all_inner = force_all_inner.clone();
let parents_history = parents_history.clone();
move |mut _lua_arg_tmp| {
let newval = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = do_rewrite.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = newval.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = newval.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return _lua_call({ let _lua_tmp = force_all_inner.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = newval.borrow(); _lua_tmp.clone() }, { let _lua_tmp = parents_history.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), _lua_false()), (_lua_num!(2), _lua_false())]), { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = newval.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
let history = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
*x.borrow_mut() = { let _lua_tmp = raw.borrow(); _lua_tmp.clone() };
let replace_this_with_stopped = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*replace_this_with_stopped.borrow_mut() = _lua_lambda(Box::new({let ref_novalue_replace = ref_novalue_replace.clone();
let do_rewrite_force_all = do_rewrite_force_all.clone();
let the_world_stopped_v = the_world_stopped_v.clone();
move |mut _lua_arg_tmp| {
_lua_set({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(2),_lua_true());
return _lua_call({ let _lua_tmp = do_rewrite_force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = the_world_stopped_v.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
let make_history = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_history.borrow_mut() = _lua_lambda(Box::new({let history = history.clone();
let parents_history = parents_history.clone();
move |mut _lua_arg_tmp| {
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
for (_lua_tmp_k, _) in { let _lua_tmp: std::collections::HashMap<_lua_data,_lua_data> = if let _lua_data_unpack::Table(t) = &*({ let _lua_tmp = history.borrow(); _lua_tmp.clone() }) { t.0.lock().unwrap().clone() } else { panic!("not table") }; _lua_tmp }.iter() {
let x_id=std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_k.clone()));
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },{ let _lua_tmp = x_id.borrow(); _lua_tmp.clone() },_lua_true());
}
for (_lua_tmp_k, _) in { let _lua_tmp: std::collections::HashMap<_lua_data,_lua_data> = if let _lua_data_unpack::Table(t) = &*({ let _lua_tmp = parents_history.borrow(); _lua_tmp.clone() }) { t.0.lock().unwrap().clone() } else { panic!("not table") }; _lua_tmp }.iter() {
let x_id=std::sync::Arc::new(std::cell::RefCell::new(_lua_tmp_k.clone()));
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },{ let _lua_tmp = x_id.borrow(); _lua_tmp.clone() },_lua_true());
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{and, _lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(32)}}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
while (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
let x_id = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, _lua_lookup({ let _lua_tmp = parents_history.borrow(); _lua_tmp.clone() },{ let _lua_tmp = x_id.borrow(); _lua_tmp.clone() }), _lua_true()}).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_op!{eq, _lua_lookup({ let _lua_tmp = history.borrow(); _lua_tmp.clone() },{ let _lua_tmp = x_id.borrow(); _lua_tmp.clone() }), _lua_true()}).as_bool() {
_lua_set({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_true());
if (_lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
let f = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = delay_builtin_func_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = delay_builtin_func_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
let elim_s = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), { let _lua_tmp = data_name_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = data_list_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = data_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(4), { let _lua_tmp = construction_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(5), { let _lua_tmp = construction_head_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(6), { let _lua_tmp = construction_tail_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(7), { let _lua_tmp = atom_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(8), { let _lua_tmp = null_p_function_builtin_systemName.borrow(); _lua_tmp.clone() })])));
let is_elim = std::sync::Arc::new(std::cell::RefCell::new(_lua_false()));
let _lua_tmp_t={ let _lua_tmp = elim_s.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let elim_s_v=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = elim_s_v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = f.borrow(); _lua_tmp.clone() }])).as_bool() {
*is_elim.borrow_mut() = _lua_true();
break;
}
}
if ({ let _lua_tmp = is_elim.borrow(); _lua_tmp.clone() }).as_bool() {
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}]);
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_lookup({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_false()}]);
let inner = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all_inner.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_call({ let _lua_tmp = make_history.borrow(); _lua_tmp.clone() }, vec![]), { let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() }])));
if (_lua_lookup({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(2))).as_bool() {
return _lua_call({ let _lua_tmp = do_rewrite_force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = inner.borrow(); _lua_tmp.clone() })])])]);
} else {
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}
}
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = equal_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = apply_function_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = evaluate_function_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = if_function_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(3)}]);
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_lookup({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_false()}]);
let tf = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all_inner.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_call({ let _lua_tmp = make_history.borrow(); _lua_tmp.clone() }, vec![]), { let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() }])));
if (_lua_lookup({ let _lua_tmp = ref_novalue_replace.borrow(); _lua_tmp.clone() },_lua_num!(2))).as_bool() {
return _lua_call({ let _lua_tmp = do_rewrite_force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = if_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = tf.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2))), (_lua_num!(3), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(3)))])])]);
} else {
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
} else if (_lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = replace_this_with_stopped.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}
_lua_set({ let _lua_tmp = history.borrow(); _lua_tmp.clone() },{ let _lua_tmp = x_id.borrow(); _lua_tmp.clone() },_lua_true());
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = do_rewrite.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*force1.borrow_mut() = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
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
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }])));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_not(_lua_call({ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))]);
if (_lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = real_evaluate.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_evaluate_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = real_builtin_form_apply.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_builtin_form_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_builtin_form_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = real_builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_func_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_builtin_func_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = real_apply.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_apply_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_apply_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
} else {
*ret.borrow_mut() = { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
*ret.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*force_all.borrow_mut() = _lua_lambda(Box::new({let force_all_inner = force_all_inner.clone();
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = force_all_inner.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*force_uncomment_all.borrow_mut() = _lua_lambda(Box::new({let delay_just_p = delay_just_p.clone();
let comment_p = comment_p.clone();
let force_all = force_all.clone();
let un_comment_all = un_comment_all.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_op!{or, _lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = un_comment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*unlazy1.borrow_mut() = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
let force1 = force1.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
while (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*unlazy_list_1_keepcomment.borrow_mut() = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
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
move |mut _lua_arg_tmp| {
let list = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let not_list_k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let delay_just_k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let comments = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])));
let not_forced = std::sync::Arc::new(std::cell::RefCell::new(_lua_true()));
while (_lua_true()).as_bool() {
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = k.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = comments.borrow(); _lua_tmp.clone() }, { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = comments.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = comment_comment.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])]);
*i.borrow_mut() = _lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])]);
*i.borrow_mut() = _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }])).as_bool() {
if ({ let _lua_tmp = not_forced.borrow(); _lua_tmp.clone() }).as_bool() {
*not_forced.borrow_mut() = _lua_false();
*i.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = i.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = delay_just_k.borrow(); _lua_tmp.clone() }, vec![]);
}
} else {
return _lua_call({ let _lua_tmp = not_list_k.borrow(); _lua_tmp.clone() }, vec![]);
}
}

_lua_nil()
}}));
*name_unlazy1_p3.borrow_mut() = _lua_lambda(Box::new({let lazy_p = lazy_p.clone();
let unlazy1 = unlazy1.clone();
let atom_p = atom_p.clone();
let data_p = data_p.clone();
let data_name = data_name.clone();
let atom_equal_p = atom_equal_p.clone();
let name_atom = name_atom.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = lazy_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = unlazy1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
if (_lua_call({ let _lua_tmp = lazy_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_nil();
}
if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_true();
}
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
let n = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_call({ let _lua_tmp = lazy_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = n.borrow(); _lua_tmp.clone() }])).as_bool() {
*n.borrow_mut() = _lua_call({ let _lua_tmp = unlazy1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = n.borrow(); _lua_tmp.clone() }]);
}
if (_lua_call({ let _lua_tmp = lazy_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = n.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_nil();
}
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = n.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = n.borrow(); _lua_tmp.clone() }, { let _lua_tmp = name_atom.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*make_enviroment_null_v.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
return _lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), _lua_table(vec![])), (_lua_num!(3), _lua_nil())]);

_lua_nil()
}}));
*enviroment_null_p.borrow_mut() = _lua_lambda(Box::new({let recordstring_null_p = recordstring_null_p.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(1))).as_bool() {
return _lua_call({ let _lua_tmp = recordstring_null_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2))]);
}
return _lua_false();

_lua_nil()
}}));
*enviroment_helper_print0.borrow_mut() = _lua_lambda(Box::new({let force_uncomment_all = force_uncomment_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let refe = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.borrow_mut() = _lua_call({ let _lua_tmp = force_uncomment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_str("^"), _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_str(".")]);
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = refe.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
} else if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_str("_")]);
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_str("#")]);
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = refe.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
} else {
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}

_lua_nil()
}}));
*enviroment_helper_print_step.borrow_mut() = _lua_lambda(Box::new({let enviroment_helper_print0 = enviroment_helper_print0.clone();
move |mut _lua_arg_tmp| {
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rs = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let ss = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let _lua_tmp_t={ let _lua_tmp = xs.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let x=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
_lua_call({ let _lua_tmp = enviroment_helper_print0.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = rs.borrow(); _lua_tmp.clone() }, { let _lua_tmp = ss.borrow(); _lua_tmp.clone() }]);
}
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = ss.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = rs.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*enviroment_helper_node_expand.borrow_mut() = _lua_lambda(Box::new({let enviroment_helper_print_step = enviroment_helper_print_step.clone();
let LANG_ASSERT = LANG_ASSERT.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let e = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = enviroment_helper_print_step.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_num!(2))])));
let es = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = e.borrow(); _lua_tmp.clone() },_lua_num!(1))));
let ev = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = e.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let t = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{not_eq, _lua_len({ let _lua_tmp = es.borrow(); _lua_tmp.clone() }), _lua_num!(0)}]);
_lua_set({ let _lua_tmp = t.borrow(); _lua_tmp.clone() },_lua_lookup({ let _lua_tmp = es.borrow(); _lua_tmp.clone() },_lua_len({ let _lua_tmp = es.borrow(); _lua_tmp.clone() })),_lua_table(vec![(_lua_num!(1), _lua_false()), (_lua_num!(2), { let _lua_tmp = ev.borrow(); _lua_tmp.clone() }), (_lua_num!(3), _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_num!(3)))]));
let result = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), { let _lua_tmp = t.borrow(); _lua_tmp.clone() }), (_lua_num!(3), _lua_nil())])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = es.borrow(); _lua_tmp.clone() }), _lua_num!(2)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}).as_bool() {
let t = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
_lua_set({ let _lua_tmp = t.borrow(); _lua_tmp.clone() },_lua_lookup({ let _lua_tmp = es.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}),{ let _lua_tmp = result.borrow(); _lua_tmp.clone() });
*result.borrow_mut() = _lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), { let _lua_tmp = t.borrow(); _lua_tmp.clone() }), (_lua_num!(3), _lua_nil())]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return { let _lua_tmp = result.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*enviroment_helper_tree_shadow_copy.borrow_mut() = _lua_lambda(Box::new({let recordstring_shadow_copy = recordstring_shadow_copy.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), _lua_call({ let _lua_tmp = recordstring_shadow_copy.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = x.borrow(); _lua_tmp.clone() },_lua_num!(2))])), (_lua_num!(3), _lua_nil())]);

_lua_nil()
}}));
*enviroment_set_helper.borrow_mut() = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let enviroment_null_p = enviroment_null_p.clone();
let trampoline_return = trampoline_return.clone();
let enviroment_helper_tree_shadow_copy = enviroment_helper_tree_shadow_copy.clone();
let enviroment_helper_print_step = enviroment_helper_print_step.clone();
let make_enviroment_null_v = make_enviroment_null_v.clone();
let enviroment_helper_node_expand = enviroment_helper_node_expand.clone();
let trampoline_delay = trampoline_delay.clone();
let enviroment_set_helper = enviroment_set_helper.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let return_pointer = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let real_return = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, _lua_len({ let _lua_tmp = key.borrow(); _lua_tmp.clone() }), _lua_num!(0)}).as_bool() {
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{or, _lua_call({ let _lua_tmp = enviroment_null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }]), _lua_op!{and, _lua_op!{eq, _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_false()}, _lua_op!{eq, _lua_lookup(_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_num!(2)),_lua_str("length")), _lua_num!(0)}}}]);
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_false());
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(2),{ let _lua_tmp = key.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(3),{ let _lua_tmp = val.borrow(); _lua_tmp.clone() });
return _lua_call({ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = real_return.borrow(); _lua_tmp.clone() }]);
}
if (_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_num!(1))).as_bool() {
let result_tmp = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = enviroment_helper_tree_shadow_copy.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }])));
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_lookup({ let _lua_tmp = result_tmp.borrow(); _lua_tmp.clone() },_lua_num!(1)));
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(2),_lua_lookup({ let _lua_tmp = result_tmp.borrow(); _lua_tmp.clone() },_lua_num!(2)));
_lua_set({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() },_lua_num!(3),_lua_lookup({ let _lua_tmp = result_tmp.borrow(); _lua_tmp.clone() },_lua_num!(3)));
let result = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() }));
let a = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = enviroment_helper_print_step.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = key.borrow(); _lua_tmp.clone() }])));
let astr = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = a.borrow(); _lua_tmp.clone() },_lua_num!(1))));
let av = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = a.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let pointer = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = result.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = astr.borrow(); _lua_tmp.clone() })}).as_bool() {
let k = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = astr.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})));
let m = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
if (_lua_op!{not_eq, _lua_lookup(_lua_lookup({ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() },_lua_num!(2)),{ let _lua_tmp = k.borrow(); _lua_tmp.clone() }), _lua_nil()}).as_bool() {
let t = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_lookup({ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() },_lua_num!(2)),{ let _lua_tmp = k.borrow(); _lua_tmp.clone() })));
if (_lua_lookup({ let _lua_tmp = t.borrow(); _lua_tmp.clone() },_lua_num!(0))).as_bool() {
*m.borrow_mut() = _lua_call({ let _lua_tmp = enviroment_helper_tree_shadow_copy.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = t.borrow(); _lua_tmp.clone() }]);
} else {
if (_lua_op!{eq, _lua_lookup(_lua_lookup({ let _lua_tmp = t.borrow(); _lua_tmp.clone() },_lua_num!(1)),_lua_str("length")), _lua_num!(0)}).as_bool() {
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_op!{sub, _lua_len({ let _lua_tmp = astr.borrow(); _lua_tmp.clone() }), _lua_num!(1)}}]);
let p = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_enviroment_null_v.borrow(); _lua_tmp.clone() }, vec![])));
_lua_set(_lua_lookup({ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() },_lua_num!(2)),{ let _lua_tmp = k.borrow(); _lua_tmp.clone() },{ let _lua_tmp = p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_false());
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(2),{ let _lua_tmp = av.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(3),{ let _lua_tmp = val.borrow(); _lua_tmp.clone() });
return _lua_call({ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = real_return.borrow(); _lua_tmp.clone() }]);
}
*m.borrow_mut() = _lua_call({ let _lua_tmp = enviroment_helper_node_expand.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = t.borrow(); _lua_tmp.clone() }]);
}
} else {
*m.borrow_mut() = _lua_table(vec![(_lua_num!(1), _lua_true()), (_lua_num!(2), _lua_table(vec![])), (_lua_num!(3), _lua_nil())]);
}
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{not_eq, { let _lua_tmp = m.borrow(); _lua_tmp.clone() }, _lua_nil()}]);
_lua_set(_lua_lookup({ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() },_lua_num!(2)),{ let _lua_tmp = k.borrow(); _lua_tmp.clone() },{ let _lua_tmp = m.borrow(); _lua_tmp.clone() });
*pointer.borrow_mut() = { let _lua_tmp = m.borrow(); _lua_tmp.clone() };
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
if (_lua_call({ let _lua_tmp = enviroment_null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() }])).as_bool() {
let p = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() }));
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(1),_lua_false());
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(2),{ let _lua_tmp = av.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = p.borrow(); _lua_tmp.clone() },_lua_num!(3),{ let _lua_tmp = val.borrow(); _lua_tmp.clone() });
return _lua_call({ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = real_return.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let enviroment_set_helper = enviroment_set_helper.clone();
let pointer = pointer.clone();
let av = av.clone();
let val = val.clone();
let real_return = real_return.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = enviroment_set_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = pointer.borrow(); _lua_tmp.clone() }, { let _lua_tmp = av.borrow(); _lua_tmp.clone() }, { let _lua_tmp = val.borrow(); _lua_tmp.clone() }, { let _lua_tmp = pointer.borrow(); _lua_tmp.clone() }, { let _lua_tmp = real_return.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
}
} else {
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let enviroment_set_helper = enviroment_set_helper.clone();
let enviroment_helper_node_expand = enviroment_helper_node_expand.clone();
let env = env.clone();
let key = key.clone();
let val = val.clone();
let return_pointer = return_pointer.clone();
let real_return = real_return.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = enviroment_set_helper.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = enviroment_helper_node_expand.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = key.borrow(); _lua_tmp.clone() }, { let _lua_tmp = val.borrow(); _lua_tmp.clone() }, { let _lua_tmp = return_pointer.borrow(); _lua_tmp.clone() }, { let _lua_tmp = real_return.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*env_set.borrow_mut() = _lua_lambda(Box::new({let equal_p = equal_p.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), { let _lua_tmp = key.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)},{ let _lua_tmp = key.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)},{ let _lua_tmp = val.borrow(); _lua_tmp.clone() });
{
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)},_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}));
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)},_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)}));
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
} else {
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)},_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}));
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)},_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)}));
}
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() }), _lua_num!(0)}, _lua_num!(1)},{ let _lua_tmp = key.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() }), _lua_num!(1)}, _lua_num!(1)},{ let _lua_tmp = val.borrow(); _lua_tmp.clone() });
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*env_get.borrow_mut() = _lua_lambda(Box::new({let equal_p = equal_p.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let default_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), { let _lua_tmp = key.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)});
}
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
return { let _lua_tmp = default_v.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*must_env_get.borrow_mut() = _lua_lambda(Box::new({let equal_p = equal_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), { let _lua_tmp = key.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)});
}
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*env2val.borrow_mut() = _lua_lambda(Box::new({let null_v = null_v.clone();
let new_construction = new_construction.clone();
let new_list = new_list.clone();
let new_data = new_data.clone();
let mapping_atom = mapping_atom.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
*ret.borrow_mut() = _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)})]), { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = mapping_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
*env_foreach.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = env.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), _lua_lookup({ let _lua_tmp = env.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)})]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}

_lua_nil()
}}));
*real_evaluate.borrow_mut() = _lua_lambda(Box::new({let force1 = force1.clone();
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
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }])));
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
let error_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*error_v.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let evaluate_function_builtin_systemName = evaluate_function_builtin_systemName.clone();
let env2val = env2val.clone();
let env = env.clone();
let x = x.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = new_error.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_builtin_use_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = evaluate_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]);

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = unlazy_list_1_keepcomment.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({let selfvalraw = selfvalraw.clone();
move |mut _lua_arg_tmp| {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };

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
move |mut _lua_arg_tmp| {
let comments = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = comments.borrow(); _lua_tmp.clone() }), _lua_num!(0)}).as_bool() {
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("WIP")]);
}
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = form_builtin_use_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let args = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(2)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = builtin_form_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = form_use_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2))])])));
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_type = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_type.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_type.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_not(_lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_type.borrow(); _lua_tmp.clone() }, { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_list = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }])));
let f_list_cdr = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list_cdr.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list_cdr.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let args = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), _lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }]))])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(2)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = function_builtin_use_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let args = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(2)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})])]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args.borrow(); _lua_tmp.clone() }]);
} else {
let f = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1))])));
let args = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(1)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})])]);
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args.borrow(); _lua_tmp.clone() }]);
}

_lua_nil()
}}))]);
} else if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = name_unlazy1_p3.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = r.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_op!{eq, { let _lua_tmp = r.borrow(); _lua_tmp.clone() }, _lua_true()}).as_bool() {
return _lua_call({ let _lua_tmp = env_get.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![])]);
}
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*real_apply.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
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
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*error_v.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let apply_function_builtin_systemName = apply_function_builtin_systemName.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = new_error.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_builtin_use_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = apply_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])])])])]);

_lua_nil()
}}));
*f.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_type = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }])])));
if (_lua_not(_lua_op!{and, _lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_type.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_type.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }])})).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_list = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }])])));
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let args_pat = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }])])));
let f_list_cdr = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list.borrow(); _lua_tmp.clone() }])])));
if (_lua_not(_lua_op!{and, _lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list_cdr.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list_cdr.borrow(); _lua_tmp.clone() }])])])})).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let f_code = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_list_cdr.borrow(); _lua_tmp.clone() }])));
let env = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = env_null_v.borrow(); _lua_tmp.clone() }));
let xs_i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }]))).as_bool() {
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = name_unlazy1_p3.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = r.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
return { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() };
}
if (_lua_op!{eq, { let _lua_tmp = r.borrow(); _lua_tmp.clone() }, _lua_true()}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, { let _lua_tmp = xs_i.borrow(); _lua_tmp.clone() }}).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
*env.borrow_mut() = _lua_call({ let _lua_tmp = env_set.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*xs_i.borrow_mut() = _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() });
*args_pat.borrow_mut() = { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{less, { let _lua_tmp = xs_i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() })}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = xs_i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})));
*xs_i.borrow_mut() = _lua_op!{add, { let _lua_tmp = xs_i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
*env.borrow_mut() = _lua_call({ let _lua_tmp = env_set.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*args_pat.borrow_mut() = _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
} else {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
}
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), { let _lua_tmp = xs_i.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = f_code.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*real_builtin_func_apply.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let jsArray_to_list = jsArray_to_list.clone();
let equal_p = equal_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
let real_builtin_func_apply_s = real_builtin_func_apply_s.clone();
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*error_v.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let function_builtin_use_systemName = function_builtin_use_systemName.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = new_error.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_builtin_use_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])])])]);

_lua_nil()
}}));
let _lua_tmp_t={ let _lua_tmp = real_builtin_func_apply_s.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let xx=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(1))])).as_bool() {
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2))}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_op!{eq, _lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_num!(1)}).as_bool() {
return _lua_call(_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3)), vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, _lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_num!(2)}).as_bool() {
return _lua_call(_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3)), vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), { let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, _lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_num!(3)}).as_bool() {
return _lua_call(_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3)), vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = selfvalraw.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}
}
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*real_builtin_form_apply.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
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
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let selfvalraw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*error_v.borrow_mut() = _lua_lambda(Box::new({let new_error = new_error.clone();
let system_atom = system_atom.clone();
let new_list = new_list.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let env2val = env2val.clone();
let env = env.clone();
let f = f.clone();
let jsArray_to_list = jsArray_to_list.clone();
let xs = xs.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = new_error.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_builtin_use_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = f.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])])])]);

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = quote_form_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(1)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1));
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = lambda_form_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(2)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = new_lambda.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), { let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = comment_form_builtin_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{not_eq, _lua_len({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }), _lua_num!(2)}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = new_comment.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = xs.borrow(); _lua_tmp.clone() },_lua_num!(2))])]);
}
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*make_quote.borrow_mut() = _lua_lambda(Box::new({let new_list = new_list.clone();
let form_builtin_use_systemName = form_builtin_use_systemName.clone();
let quote_form_builtin_systemName = quote_form_builtin_systemName.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_builtin_use_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = quote_form_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*new_lambda.borrow_mut() = _lua_lambda(Box::new({let unlazy_all_rec = unlazy_all_rec.clone();
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
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let args_pat = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let body = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*args_pat.borrow_mut() = _lua_call({ let _lua_tmp = unlazy_all_rec.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }]);
let args_pat_vars = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let args_pat_is_dot = std::sync::Arc::new(std::cell::RefCell::new(_lua_false()));
let args_pat_iter = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }));
while (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }]))).as_bool() {
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = name_unlazy1_p3.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }])));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{not_eq, { let _lua_tmp = r.borrow(); _lua_tmp.clone() }, _lua_nil()}]);
if ({ let _lua_tmp = r.borrow(); _lua_tmp.clone() }).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_vars.borrow(); _lua_tmp.clone() }, { let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }]);
*args_pat_is_dot.borrow_mut() = _lua_true();
*args_pat_iter.borrow_mut() = { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_vars.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }])]);
*args_pat_iter.borrow_mut() = _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_iter.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
}
let args_pat_vars_val = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
if ({ let _lua_tmp = args_pat_is_dot.borrow(); _lua_tmp.clone() }).as_bool() {
*args_pat_vars_val.borrow_mut() = _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat_vars.borrow(); _lua_tmp.clone() }]);
} else {
*args_pat_vars_val.borrow_mut() = { let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() };
}
let env_vars = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
_lua_call({ let _lua_tmp = env_foreach.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({let args_pat_vars = args_pat_vars.clone();
let equal_p = equal_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let env_vars = env_vars.clone();
move |mut _lua_arg_tmp| {
let k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = args_pat_vars.borrow(); _lua_tmp.clone() })}).as_bool() {
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = args_pat_vars.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), { let _lua_tmp = k.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_nil();
}
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env_vars.borrow(); _lua_tmp.clone() }, { let _lua_tmp = k.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
let new_args_pat = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = args_pat_vars_val.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = env_vars.borrow(); _lua_tmp.clone() }), _lua_num!(1)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}).as_bool() {
*new_args_pat.borrow_mut() = _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = env_vars.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), { let _lua_tmp = new_args_pat.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
let new_args = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = args_pat_vars_val.borrow(); _lua_tmp.clone() }));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_op!{sub, _lua_len({ let _lua_tmp = env_vars.borrow(); _lua_tmp.clone() }), _lua_num!(1)}));
while (_lua_op!{greater_eq, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}).as_bool() {
*new_args.borrow_mut() = _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = make_quote.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = must_env_get.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_lookup({ let _lua_tmp = env_vars.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)})])]), { let _lua_tmp = new_args.borrow(); _lua_tmp.clone() }]);
*i.borrow_mut() = _lua_op!{sub, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = args_pat.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = make_quote.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = new_args_pat.borrow(); _lua_tmp.clone() }, { let _lua_tmp = body.borrow(); _lua_tmp.clone() }])])]), { let _lua_tmp = new_args.borrow(); _lua_tmp.clone() }])])]);

_lua_nil()
}}));
*jsbool_equal_p_inner.borrow_mut() = _lua_lambda(Box::new({let force_all = force_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_true();
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*y.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_true();
}
let end_2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*end_2.borrow_mut() = _lua_lambda(Box::new({let jsbool_equal_p_inner = jsbool_equal_p_inner.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let r1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = jsbool_equal_p_inner.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }])])));
let r2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = jsbool_equal_p_inner.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }])])));
if (_lua_op!{and, _lua_op!{eq, { let _lua_tmp = r1.borrow(); _lua_tmp.clone() }, _lua_true()}, _lua_op!{eq, { let _lua_tmp = r2.borrow(); _lua_tmp.clone() }, _lua_true()}}).as_bool() {
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }, { let _lua_tmp = yy.borrow(); _lua_tmp.clone() }]);
return _lua_true();
} else if (_lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = r1.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{not_eq, { let _lua_tmp = r2.borrow(); _lua_tmp.clone() }, _lua_false()}}).as_bool() {
return _lua_nil();
} else {
return _lua_false();
}

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
let x2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = un_comment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = jsbool_equal_p_inner.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x2.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_true()}).as_bool() {
*ret.borrow_mut() = _lua_nil();
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }])).as_bool() {
let y2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = un_comment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }])));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = jsbool_equal_p_inner.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y2.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_true()}).as_bool() {
*ret.borrow_mut() = _lua_nil();
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
return _lua_true();
} else if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*equal_p.borrow_mut() = _lua_lambda(Box::new({let jsbool_equal_p_inner = jsbool_equal_p_inner.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{not_eq, _lua_call({ let _lua_tmp = jsbool_equal_p_inner.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]), _lua_false()};

_lua_nil()
}}));
*simple_print.borrow_mut() = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
let temp = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
let prefix = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_str("()");
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_str("(");
*prefix.borrow_mut() = _lua_str("");
while (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = prefix.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])}};
*prefix.borrow_mut() = _lua_str(" ");
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
}
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_str(")")};
} else {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_str(" . "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]), _lua_str(")")}}};
}
return { let _lua_tmp = temp.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("#"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])])};
} else if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str(";("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = comment_comment.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("$("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("%("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_func_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_func_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("@("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}}}};
} else if (_lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("^("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_apply_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_apply_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}};
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
let run_trampoline = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*run_trampoline.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, vec![])));
while (_lua_lookup({ let _lua_tmp = i.borrow(); _lua_tmp.clone() },_lua_num!(1))).as_bool() {
*i.borrow_mut() = _lua_call(_lua_lookup({ let _lua_tmp = i.borrow(); _lua_tmp.clone() },_lua_num!(2)), vec![]);
}
return _lua_lookup({ let _lua_tmp = i.borrow(); _lua_tmp.clone() },_lua_num!(2));

_lua_nil()
}}));
*atom_t.borrow_mut() = _lua_num!(0);
*construction_t.borrow_mut() = _lua_num!(1);
*null_t.borrow_mut() = _lua_num!(2);
*data_t.borrow_mut() = _lua_num!(3);
*just_t.borrow_mut() = _lua_num!(4);
*delay_evaluate_t.borrow_mut() = _lua_num!(5);
*delay_builtin_func_t.borrow_mut() = _lua_num!(6);
*delay_builtin_form_t.borrow_mut() = _lua_num!(7);
*delay_apply_t.borrow_mut() = _lua_num!(8);
*comment_t.borrow_mut() = _lua_num!(10);
*hole_t.borrow_mut() = _lua_num!(9);
let new_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*new_atom.borrow_mut() = _lua_lambda(Box::new({let atom_t = atom_t.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = atom_t.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })]);

_lua_nil()
}}));
*null_v.borrow_mut() = _lua_table(vec![(_lua_num!(1), { let _lua_tmp = null_t.borrow(); _lua_tmp.clone() })]);
let force_uncomment_all_rec = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*force_uncomment_all_rec.borrow_mut() = _lua_lambda(Box::new({let force_uncomment_all = force_uncomment_all.clone();
let force_all_rec = force_all_rec.clone();
let comment_p = comment_p.clone();
let lang_copy_do = lang_copy_do.clone();
let force_uncomment_all_rec = force_uncomment_all_rec.clone();
let data_p = data_p.clone();
let construction_p = construction_p.clone();
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_uncomment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }])));
let conslike = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*conslike.borrow_mut() = _lua_lambda(Box::new({let force_all_rec = force_all_rec.clone();
let comment_p = comment_p.clone();
let lang_copy_do = lang_copy_do.clone();
let force_uncomment_all_rec = force_uncomment_all_rec.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_set({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2),_lua_call({ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2))]));
_lua_set({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3),_lua_call({ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3))]));
if (_lua_op!{or, _lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2))]), _lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3))])}).as_bool() {
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = lang_copy_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }])));
let a = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let d = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = xx.borrow(); _lua_tmp.clone() },_lua_num!(3))));
let a1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_uncomment_all_rec.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = a.borrow(); _lua_tmp.clone() }])));
let d1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_uncomment_all_rec.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = d.borrow(); _lua_tmp.clone() }])));
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_num!(2),{ let _lua_tmp = a1.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_num!(3),{ let _lua_tmp = d1.borrow(); _lua_tmp.clone() });
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
} else {
return { let _lua_tmp = xx.borrow(); _lua_tmp.clone() };
}

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*unlazy_all_rec.borrow_mut() = { let _lua_tmp = force_uncomment_all_rec.borrow(); _lua_tmp.clone() };
*system_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("太始初核")]);
*name_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("符名")]);
*function_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("化滅")]);
*form_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("式形")]);
let equal_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("等同")])));
let evaluate_sym = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("解算")])));
let theThing_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("特定其物")])));
let something_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("省略一物")])));
*mapping_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("映表")]);
let if_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("如若")])));
let typeAnnotation_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("一類何物")])));
let isOrNot_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("是非")])));
let sub_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("其子")])));
let true_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("爻陽")])));
let false_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("爻陰")])));
let quote_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("引用")])));
let apply_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("應用")])));
let null_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("間空")])));
let construction_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("連頸")])));
let data_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("構物")])));
*error_atom.borrow_mut() = _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("謬誤")]);
let atom_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("詞素")])));
let list_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("列序")])));
let head_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("首始")])));
let tail_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("尾末")])));
let thing_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("之物")])));
let theWorldStopped_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("宇宙亡矣")])));
let effect_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("效應")])));
let comment_atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("註疏")])));
*the_world_stopped_v.borrow_mut() = _lua_call({ let _lua_tmp = new_error.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = theWorldStopped_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])]);
let systemName_make = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*systemName_make.borrow_mut() = _lua_lambda(Box::new({let new_data = new_data.clone();
let name_atom = name_atom.clone();
let new_construction = new_construction.clone();
let system_atom = system_atom.clone();
let null_v = null_v.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])])]);

_lua_nil()
}}));
let make_builtin_f_new_sym_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_builtin_f_new_sym_f.borrow_mut() = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
let theThing_atom = theThing_atom.clone();
move |mut _lua_arg_tmp| {
let x_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x_sym.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let make_builtin_f_get_sym_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_builtin_f_get_sym_f.borrow_mut() = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let something_atom = something_atom.clone();
move |mut _lua_arg_tmp| {
let t_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = t_sym.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = x_sym.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let make_builtin_f_p_sym_f = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_builtin_f_p_sym_f.borrow_mut() = _lua_lambda(Box::new({let systemName_make = systemName_make.clone();
let new_list = new_list.clone();
let typeAnnotation_atom = typeAnnotation_atom.clone();
let function_atom = function_atom.clone();
let isOrNot_atom = isOrNot_atom.clone();
let something_atom = something_atom.clone();
move |mut _lua_arg_tmp| {
let t_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = t_sym.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])])])]);

_lua_nil()
}}));
let new_data_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_builtin_f_new_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_atom.borrow(); _lua_tmp.clone() }])));
*data_name_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_get_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = name_atom.borrow(); _lua_tmp.clone() }]);
*data_list_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_get_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = list_atom.borrow(); _lua_tmp.clone() }]);
*data_p_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_p_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_atom.borrow(); _lua_tmp.clone() }]);
let new_construction_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_builtin_f_new_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_atom.borrow(); _lua_tmp.clone() }])));
*construction_p_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_p_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_atom.borrow(); _lua_tmp.clone() }]);
*construction_head_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_get_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = head_atom.borrow(); _lua_tmp.clone() }]);
*construction_tail_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_get_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = tail_atom.borrow(); _lua_tmp.clone() }]);
*atom_p_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_p_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = atom_atom.borrow(); _lua_tmp.clone() }]);
*null_p_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = make_builtin_f_p_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = null_atom.borrow(); _lua_tmp.clone() }]);
*equal_p_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = equal_atom.borrow(); _lua_tmp.clone() }])])]);
*apply_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = apply_atom.borrow(); _lua_tmp.clone() }])]);
*evaluate_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = evaluate_sym.borrow(); _lua_tmp.clone() }])]);
let list_chooseOne_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_builtin_f_get_sym_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = thing_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])])));
*if_function_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = if_atom.borrow(); _lua_tmp.clone() }])]);
*quote_form_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = quote_atom.borrow(); _lua_tmp.clone() }])]);
*lambda_form_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }])]), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }])]);
*function_builtin_use_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }])])]);
*form_builtin_use_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }])])]);
*form_use_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }])]);
let comment_function_builtin_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = comment_atom.borrow(); _lua_tmp.clone() }])])));
*comment_form_builtin_systemName.borrow_mut() = _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = comment_atom.borrow(); _lua_tmp.clone() }])]);
let false_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = false_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![])])));
let true_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = true_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![])])));
let list_to_jsArray = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*list_to_jsArray.borrow_mut() = _lua_lambda(Box::new({let construction_p = construction_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
move |mut _lua_arg_tmp| {
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k_done = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k_tail = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
while (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])]);
*xs.borrow_mut() = _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);
}
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = k_done.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = k_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
let maybe_list_to_jsArray = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*maybe_list_to_jsArray.borrow_mut() = _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
move |mut _lua_arg_tmp| {
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}})), _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let _1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_false();

_lua_nil()
}}))]);

_lua_nil()
}}));
let un_just_comment_all = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*un_just_comment_all.borrow_mut() = _lua_lambda(Box::new({let just_p = just_p.clone();
let comment_p = comment_p.clone();
let un_just_all = un_just_all.clone();
let un_comment_all = un_comment_all.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
while (_lua_op!{or, _lua_call({ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = un_comment_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
}
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
let delay2delay_evaluate = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*delay2delay_evaluate.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_p = delay_evaluate_p.clone();
let delay_builtin_form_p = delay_builtin_form_p.clone();
let error = error.clone();
let delay_builtin_func_p = delay_builtin_func_p.clone();
let delay_apply_p = delay_apply_p.clone();
let LANG_ERROR = LANG_ERROR.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("WIP")]);
} else if (_lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("WIP")]);
} else if (_lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("WIP")]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
let delay_env = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*delay_env.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_env = delay_evaluate_env.clone();
let delay2delay_evaluate = delay2delay_evaluate.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = delay_evaluate_env.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay2delay_evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let delay_x = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*delay_x.borrow_mut() = _lua_lambda(Box::new({let delay_evaluate_x = delay_evaluate_x.clone();
let delay2delay_evaluate = delay2delay_evaluate.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = delay_evaluate_x.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay2delay_evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let force_uncomment1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*force_uncomment1.borrow_mut() = _lua_lambda(Box::new({let comment_p = comment_p.clone();
let comment_x = comment_x.clone();
let force1 = force1.clone();
move |mut _lua_arg_tmp| {
let raw = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = raw.borrow(); _lua_tmp.clone() }]);
}

_lua_nil()
}}));
let enviroment_null_v = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_enviroment_null_v.borrow(); _lua_tmp.clone() }, vec![])));
let enviroment_set = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*enviroment_set.borrow_mut() = _lua_lambda(Box::new({let make_enviroment_null_v = make_enviroment_null_v.clone();
let run_trampoline = run_trampoline.clone();
let enviroment_set_helper = enviroment_set_helper.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let key = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let result = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = make_enviroment_null_v.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = run_trampoline.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = enviroment_set_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = key.borrow(); _lua_tmp.clone() })]), { let _lua_tmp = val.borrow(); _lua_tmp.clone() }, { let _lua_tmp = result.borrow(); _lua_tmp.clone() }, { let _lua_tmp = result.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
*env_null_v.borrow_mut() = _lua_table(vec![]);
let val2env = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*val2env.borrow_mut() = _lua_lambda(Box::new({let force_all = force_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
let s = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])));
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
if (_lua_not(_lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }, { let _lua_tmp = mapping_atom.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
*s.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }])])]))).as_bool() {
return _lua_false();
}
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }])])));
while (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])])));
*xs.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])]);
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
let k = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
*x.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
let v = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]))).as_bool() {
return _lua_false();
}
let not_breaked = std::sync::Arc::new(std::cell::RefCell::new(_lua_true()));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(0)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() })}).as_bool() {
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(0)}, _lua_num!(1)}), { let _lua_tmp = k.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_set({ let _lua_tmp = ret.borrow(); _lua_tmp.clone() },_lua_op!{add, _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_num!(1)},{ let _lua_tmp = v.borrow(); _lua_tmp.clone() });
*not_breaked.borrow_mut() = _lua_false();
break;
}
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(2)};
}
}
if ({ let _lua_tmp = not_breaked.borrow(); _lua_tmp.clone() }).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }, { let _lua_tmp = k.borrow(); _lua_tmp.clone() }, { let _lua_tmp = v.borrow(); _lua_tmp.clone() }]);
}
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
let make_builtin_p_func = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_builtin_p_func.borrow_mut() = _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let true_v = true_v.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp| {
let p_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let p_jsfunc = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = p_sym.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(1)), (_lua_num!(3), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let p_sym = p_sym.clone();
let p_jsfunc = p_jsfunc.clone();
let true_v = true_v.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = p_sym.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })])]);
}
if (_lua_call({ let _lua_tmp = p_jsfunc.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = true_v.borrow(); _lua_tmp.clone() };
}
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };

_lua_nil()
}})))]);

_lua_nil()
}}));
let make_builtin_get_func = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_builtin_get_func.borrow_mut() = _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
move |mut _lua_arg_tmp| {
let f_sym = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let p_jsfunc = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f_jsfunc = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_table(vec![(_lua_num!(1), { let _lua_tmp = f_sym.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(1)), (_lua_num!(3), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let f_sym = f_sym.clone();
let p_jsfunc = p_jsfunc.clone();
let f_jsfunc = f_jsfunc.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f_sym.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })])]);
}
if (_lua_call({ let _lua_tmp = p_jsfunc.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = f_jsfunc.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}})))]);

_lua_nil()
}}));
*real_builtin_func_apply_s.borrow_mut() = _lua_table(vec![(_lua_num!(1), _lua_call({ let _lua_tmp = make_builtin_p_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }])), (_lua_num!(2), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = new_data_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), { let _lua_tmp = new_data.borrow(); _lua_tmp.clone() })])), (_lua_num!(3), _lua_call({ let _lua_tmp = make_builtin_get_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_name_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }])), (_lua_num!(4), _lua_call({ let _lua_tmp = make_builtin_get_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = data_list_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }])), (_lua_num!(5), _lua_call({ let _lua_tmp = make_builtin_p_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = null_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }])), (_lua_num!(6), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = new_construction_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), { let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() })])), (_lua_num!(7), _lua_call({ let _lua_tmp = make_builtin_p_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }])), (_lua_num!(8), _lua_call({ let _lua_tmp = make_builtin_get_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_head_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }])), (_lua_num!(9), _lua_call({ let _lua_tmp = make_builtin_get_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_tail_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }])), (_lua_num!(10), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = equal_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), _lua_lambda(Box::new({let true_v = true_v.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return { let _lua_tmp = true_v.borrow(); _lua_tmp.clone() };
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*y.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
if (_lua_op!{or, _lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = equal_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })])]);
}
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return { let _lua_tmp = true_v.borrow(); _lua_tmp.clone() };
}
let H_if = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*H_if.borrow_mut() = _lua_lambda(Box::new({let builtin_func_apply = builtin_func_apply.clone();
let if_function_builtin_systemName = if_function_builtin_systemName.clone();
move |mut _lua_arg_tmp| {
let b = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = if_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = b.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = xx.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = yy.borrow(); _lua_tmp.clone() })])]);

_lua_nil()
}}));
let H_and = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*H_and.borrow_mut() = _lua_lambda(Box::new({let H_if = H_if.clone();
let false_v = false_v.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = H_if.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }, { let _lua_tmp = yy.borrow(); _lua_tmp.clone() }, { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_not(_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))]);
let end_2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*end_2.borrow_mut() = _lua_lambda(Box::new({let H_and = H_and.clone();
let builtin_func_apply = builtin_func_apply.clone();
let equal_p_function_builtin_systemName = equal_p_function_builtin_systemName.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = H_and.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = equal_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), _lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }])), (_lua_num!(2), _lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }]))])]), _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = equal_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), _lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }])), (_lua_num!(2), _lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }]))])])]);

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };
}
return { let _lua_tmp = true_v.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };
}
if (_lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = true_v.borrow(); _lua_tmp.clone() };
} else {
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };
}
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return { let _lua_tmp = false_v.borrow(); _lua_tmp.clone() };
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}})))])), (_lua_num!(11), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = apply_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), _lua_lambda(Box::new({let force_all = force_all.clone();
let construction_p = construction_p.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let apply = apply.clone();
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jslist = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let iter = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])));
while (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = iter.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = jslist.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = iter.borrow(); _lua_tmp.clone() }])]);
*iter.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = iter.borrow(); _lua_tmp.clone() }])]);
}
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = iter.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = jslist.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}})))])), (_lua_num!(12), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = evaluate_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), _lua_lambda(Box::new({let val2env = val2env.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let maybeenv = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val2env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = maybeenv.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = maybeenv.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}})))])), (_lua_num!(13), _lua_call({ let _lua_tmp = make_builtin_p_func.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = atom_p_function_builtin_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }])), (_lua_num!(14), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = list_chooseOne_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(1)), (_lua_num!(3), _lua_lambda(Box::new({let force1 = force1.clone();
let delay_just_p = delay_just_p.clone();
let builtin_func_apply = builtin_func_apply.clone();
let list_chooseOne_function_builtin_systemName = list_chooseOne_function_builtin_systemName.clone();
let construction_p = construction_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp| {
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*xs.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_chooseOne_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = xs.borrow(); _lua_tmp.clone() })])]);
}
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}})))])), (_lua_num!(15), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = if_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(3)), (_lua_num!(3), _lua_lambda(Box::new({let force1 = force1.clone();
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
move |mut _lua_arg_tmp| {
let b = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let error_v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*b.borrow_mut() = _lua_call({ let _lua_tmp = force1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = b.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = b.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = if_function_builtin_systemName.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = b.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = y.borrow(); _lua_tmp.clone() })])]);
}
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = b.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
let nam = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = b.borrow(); _lua_tmp.clone() }])])));
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = nam.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = nam.borrow(); _lua_tmp.clone() }, { let _lua_tmp = true_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
if (_lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = nam.borrow(); _lua_tmp.clone() }, { let _lua_tmp = false_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = y.borrow(); _lua_tmp.clone() };
}
return _lua_call({ let _lua_tmp = error_v.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}})))])), (_lua_num!(16), _lua_table(vec![(_lua_num!(1), { let _lua_tmp = comment_function_builtin_systemName.borrow(); _lua_tmp.clone() }), (_lua_num!(2), _lua_num!(2)), (_lua_num!(3), { let _lua_tmp = new_comment.borrow(); _lua_tmp.clone() })]))]);
let jsbool_no_force_isomorphism_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*jsbool_no_force_isomorphism_p.borrow_mut() = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_true();
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
*y.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_true();
}
let end_2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*end_2.borrow_mut() = _lua_lambda(Box::new({let jsbool_no_force_isomorphism_p = jsbool_no_force_isomorphism_p.clone();
let lang_assert_equal_set_do = lang_assert_equal_set_do.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let yy = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{and, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = f1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }])]), _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = f2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = yy.borrow(); _lua_tmp.clone() }])])}).as_bool() {
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }, { let _lua_tmp = yy.borrow(); _lua_tmp.clone() }]);
return _lua_true();
} else {
return _lua_false();
}

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }]);
_lua_call({ let _lua_tmp = lang_assert_equal_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }]);
return _lua_true();
} else if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_not(_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = end_2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
let complex_parse = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*complex_parse.borrow_mut() = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state_const = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let state = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let eof = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let get = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let put = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let parse_error = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let a_space_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let space = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let atom = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readlist = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let data = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readeval = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readfuncapply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readformbuiltin = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readapply = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readcomment = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let a_atom_p = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let val = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let un_maybe = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let not_eof = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let assert_get = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readsysname_no_pack_inner_must = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let may_xfx_xf = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readsysname_no_pack = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let readsysname = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*eof.borrow_mut() = _lua_lambda(Box::new({let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp| {
return _lua_op!{eq, _lua_len({ let _lua_tmp = state_const.borrow(); _lua_tmp.clone() }), { let _lua_tmp = state.borrow(); _lua_tmp.clone() }};

_lua_nil()
}}));
*get.borrow_mut() = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let eof = eof.clone();
let string = string.clone();
let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp| {
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_not(_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![]))]);
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_call(_lua_lookup({ let _lua_tmp = string.borrow(); _lua_tmp.clone() },_lua_str("sub")), vec![{ let _lua_tmp = state_const.borrow(); _lua_tmp.clone() }, _lua_op!{add, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_op!{add, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)}])));
*state.borrow_mut() = _lua_op!{add, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*put.borrow_mut() = _lua_lambda(Box::new({let LANG_ASSERT = LANG_ASSERT.clone();
let string = string.clone();
let state_const = state_const.clone();
let state = state.clone();
move |mut _lua_arg_tmp| {
let chr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = LANG_ASSERT.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_call(_lua_lookup({ let _lua_tmp = string.borrow(); _lua_tmp.clone() },_lua_str("sub")), vec![{ let _lua_tmp = state_const.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }}]);
*state.borrow_mut() = _lua_op!{sub, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)};

_lua_nil()
}}));
*parse_error.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*x.borrow_mut() = _lua_str("");
}
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("TheLanguage parse ERROR!"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}]);

_lua_nil()
}}));
*a_space_p.borrow_mut() = _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let chr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_op!{or, _lua_op!{or, _lua_op!{or, _lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str(" ")}, _lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("\n")}}, _lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("\t")}}, _lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("\r")}};

_lua_nil()
}}));
*space.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let a_space_p = a_space_p.clone();
let put = put.clone();
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_not(_lua_call({ let _lua_tmp = a_space_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
while (_lua_op!{and, _lua_call({ let _lua_tmp = a_space_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_not(_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![]))}).as_bool() {
*x.borrow_mut() = _lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_not(_lua_call({ let _lua_tmp = a_space_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return _lua_true();

_lua_nil()
}}));
*atom.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let a_atom_p = a_atom_p.clone();
let put = put.clone();
let tostring = tostring.clone();
let new_atom = new_atom.clone();
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
let ret = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
if (_lua_not(_lua_call({ let _lua_tmp = a_atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
while (_lua_op!{and, _lua_call({ let _lua_tmp = a_atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_not(_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![]))}).as_bool() {
*ret.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])};
*x.borrow_mut() = _lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_call({ let _lua_tmp = a_atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*ret.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])};
} else {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
return _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*readlist.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
let new_construction = new_construction.clone();
let space = space.clone();
let parse_error = parse_error.clone();
let null_v = null_v.clone();
let val = val.clone();
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str("(")}).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
let ret_last = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_hole_do.borrow(); _lua_tmp.clone() }, vec![])));
let ret = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = ret_last.borrow(); _lua_tmp.clone() }));
let last_add_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*last_add_do.borrow_mut() = _lua_lambda(Box::new({let new_hole_do = new_hole_do.clone();
let hole_set_do = hole_set_do.clone();
let ret_last = ret_last.clone();
let new_construction = new_construction.clone();
move |mut _lua_arg_tmp| {
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let ret_last2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_hole_do.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = hole_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret_last.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = val.borrow(); _lua_tmp.clone() }, { let _lua_tmp = ret_last2.borrow(); _lua_tmp.clone() }])]);
*ret_last.borrow_mut() = { let _lua_tmp = ret_last2.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
while (_lua_true()).as_bool() {
_lua_call({ let _lua_tmp = space.borrow(); _lua_tmp.clone() }, vec![]);
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![]);
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str(")")}).as_bool() {
_lua_call({ let _lua_tmp = hole_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret_last.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }]);
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
}
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str(".")}).as_bool() {
_lua_call({ let _lua_tmp = space.borrow(); _lua_tmp.clone() }, vec![]);
let e = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = hole_set_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ret_last.borrow(); _lua_tmp.clone() }, { let _lua_tmp = e.borrow(); _lua_tmp.clone() }]);
_lua_call({ let _lua_tmp = space.borrow(); _lua_tmp.clone() }, vec![]);
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
*x.borrow_mut() = _lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![]);
if (_lua_op!{not_eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str(")")}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return { let _lua_tmp = ret.borrow(); _lua_tmp.clone() };
}
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
let e = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = last_add_do.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = e.borrow(); _lua_tmp.clone() }]);
}

_lua_nil()
}}));
*data.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let new_data = new_data.clone();
let construction_head = construction_head.clone();
let construction_tail = construction_tail.clone();
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str("#")}).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
*a_atom_p.borrow_mut() = _lua_lambda(Box::new({let a_space_p = a_space_p.clone();
move |mut _lua_arg_tmp| {
let chr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = a_space_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = chr.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_false();
}
let _lua_tmp_t=_lua_table(vec![(_lua_num!(1), _lua_str("(")), (_lua_num!(2), _lua_str(")")), (_lua_num!(3), _lua_str("!")), (_lua_num!(4), _lua_str("#")), (_lua_num!(5), _lua_str(".")), (_lua_num!(6), _lua_str("$")), (_lua_num!(7), _lua_str("%")), (_lua_num!(8), _lua_str("^")), (_lua_num!(9), _lua_str("@")), (_lua_num!(10), _lua_str("~")), (_lua_num!(11), _lua_str("/")), (_lua_num!(12), _lua_str("-")), (_lua_num!(13), _lua_str(">")), (_lua_num!(14), _lua_str("_")), (_lua_num!(15), _lua_str(":")), (_lua_num!(16), _lua_str("?")), (_lua_num!(17), _lua_str("[")), (_lua_num!(18), _lua_str("]")), (_lua_num!(19), _lua_str("&")), (_lua_num!(20), _lua_str(";"))]);
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let v=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
if (_lua_op!{eq, { let _lua_tmp = v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }}).as_bool() {
return _lua_false();
}
}
return _lua_true();

_lua_nil()
}}));
*val.borrow_mut() = _lua_lambda(Box::new({let space = space.clone();
let readlist = readlist.clone();
let readsysname = readsysname.clone();
let data = data.clone();
let readeval = readeval.clone();
let readfuncapply = readfuncapply.clone();
let readformbuiltin = readformbuiltin.clone();
let readapply = readapply.clone();
let readcomment = readcomment.clone();
let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
_lua_call({ let _lua_tmp = space.borrow(); _lua_tmp.clone() }, vec![]);
let fs = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), { let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = readsysname.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = data.borrow(); _lua_tmp.clone() }), (_lua_num!(4), { let _lua_tmp = readeval.borrow(); _lua_tmp.clone() }), (_lua_num!(5), { let _lua_tmp = readfuncapply.borrow(); _lua_tmp.clone() }), (_lua_num!(6), { let _lua_tmp = readformbuiltin.borrow(); _lua_tmp.clone() }), (_lua_num!(7), { let _lua_tmp = readapply.borrow(); _lua_tmp.clone() }), (_lua_num!(8), { let _lua_tmp = readcomment.borrow(); _lua_tmp.clone() })])));
let _lua_tmp_t={ let _lua_tmp = fs.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let f=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
}
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*un_maybe.borrow_mut() = _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
let vl = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = vl.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return { let _lua_tmp = vl.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
*not_eof.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
move |mut _lua_arg_tmp| {
return _lua_not(_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![]));

_lua_nil()
}}));
*assert_get.borrow_mut() = _lua_lambda(Box::new({let un_maybe = un_maybe.clone();
let not_eof = not_eof.clone();
let get = get.clone();
move |mut _lua_arg_tmp| {
let c = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = un_maybe.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = not_eof.borrow(); _lua_tmp.clone() }, vec![])]);
_lua_call({ let _lua_tmp = un_maybe.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![]), { let _lua_tmp = c.borrow(); _lua_tmp.clone() }}]);

_lua_nil()
}}));
*readsysname_no_pack_inner_must.borrow_mut() = _lua_lambda(Box::new({let assert_get = assert_get.clone();
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
move |mut _lua_arg_tmp| {
let strict = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = strict.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*strict.borrow_mut() = _lua_false();
}
let readsysname_no_pack_bracket = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*readsysname_no_pack_bracket.borrow_mut() = _lua_lambda(Box::new({let assert_get = assert_get.clone();
let readsysname_no_pack_inner_must = readsysname_no_pack_inner_must.clone();
move |mut _lua_arg_tmp| {
_lua_call({ let _lua_tmp = assert_get.borrow(); _lua_tmp.clone() }, vec![_lua_str("[")]);
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = assert_get.borrow(); _lua_tmp.clone() }, vec![_lua_str("]")]);
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
let fs = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
if ({ let _lua_tmp = strict.borrow(); _lua_tmp.clone() }).as_bool() {
*fs.borrow_mut() = _lua_table(vec![(_lua_num!(1), { let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = atom.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = readsysname_no_pack_bracket.borrow(); _lua_tmp.clone() }), (_lua_num!(4), { let _lua_tmp = data.borrow(); _lua_tmp.clone() }), (_lua_num!(5), { let _lua_tmp = readeval.borrow(); _lua_tmp.clone() }), (_lua_num!(6), { let _lua_tmp = readfuncapply.borrow(); _lua_tmp.clone() }), (_lua_num!(7), { let _lua_tmp = readformbuiltin.borrow(); _lua_tmp.clone() }), (_lua_num!(8), { let _lua_tmp = readapply.borrow(); _lua_tmp.clone() }), (_lua_num!(9), { let _lua_tmp = readcomment.borrow(); _lua_tmp.clone() })]);
} else {
*fs.borrow_mut() = _lua_table(vec![(_lua_num!(1), { let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }), (_lua_num!(2), { let _lua_tmp = readsysname_no_pack.borrow(); _lua_tmp.clone() }), (_lua_num!(3), { let _lua_tmp = data.borrow(); _lua_tmp.clone() }), (_lua_num!(4), { let _lua_tmp = readeval.borrow(); _lua_tmp.clone() }), (_lua_num!(5), { let _lua_tmp = readfuncapply.borrow(); _lua_tmp.clone() }), (_lua_num!(6), { let _lua_tmp = readformbuiltin.borrow(); _lua_tmp.clone() }), (_lua_num!(7), { let _lua_tmp = readapply.borrow(); _lua_tmp.clone() }), (_lua_num!(8), { let _lua_tmp = readcomment.borrow(); _lua_tmp.clone() })]);
}
let _lua_tmp_t={ let _lua_tmp = fs.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let f=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
}
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
*may_xfx_xf.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
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
move |mut _lua_arg_tmp| {
let vl = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return { let _lua_tmp = vl.borrow(); _lua_tmp.clone() };
}
let head = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str(".")}).as_bool() {
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = vl.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str(":")}).as_bool() {
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, { let _lua_tmp = vl.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("~")}).as_bool() {
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = vl.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("@")}).as_bool() {
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = vl.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("?")}).as_bool() {
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = vl.borrow(); _lua_tmp.clone() }])]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("/")}).as_bool() {
let ys = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), { let _lua_tmp = vl.borrow(); _lua_tmp.clone() })])));
while (_lua_true()).as_bool() {
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![_lua_true()])));
_lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ys.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
break;
}
let c0 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = c0.borrow(); _lua_tmp.clone() }, _lua_str("/")}).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = c0.borrow(); _lua_tmp.clone() }]);
break;
}
}
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = sub_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ys.borrow(); _lua_tmp.clone() }])]);
} else {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = head.borrow(); _lua_tmp.clone() }]);
return { let _lua_tmp = vl.borrow(); _lua_tmp.clone() };
}

_lua_nil()
}}));
*readsysname_no_pack.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
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
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let head = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("&")}).as_bool() {
_lua_call({ let _lua_tmp = un_maybe.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = not_eof.borrow(); _lua_tmp.clone() }, vec![])]);
let c0 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = c0.borrow(); _lua_tmp.clone() }, _lua_str("+")}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
} else {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = c0.borrow(); _lua_tmp.clone() }]);
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str(":")}).as_bool() {
_lua_call({ let _lua_tmp = un_maybe.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = not_eof.borrow(); _lua_tmp.clone() }, vec![])]);
let c0 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = c0.borrow(); _lua_tmp.clone() }, _lua_str("&")}).as_bool() {
_lua_call({ let _lua_tmp = assert_get.borrow(); _lua_tmp.clone() }, vec![_lua_str(">")]);
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = c0.borrow(); _lua_tmp.clone() }, _lua_str(">")}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }]);
} else {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = c0.borrow(); _lua_tmp.clone() }]);
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("+")}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("[")}).as_bool() {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
_lua_call({ let _lua_tmp = assert_get.borrow(); _lua_tmp.clone() }, vec![_lua_str("]")]);
return _lua_call({ let _lua_tmp = may_xfx_xf.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = head.borrow(); _lua_tmp.clone() }, _lua_str("_")}).as_bool() {
_lua_call({ let _lua_tmp = assert_get.borrow(); _lua_tmp.clone() }, vec![_lua_str(":")]);
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack_inner_must.borrow(); _lua_tmp.clone() }, vec![])));
return _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]);
} else {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = head.borrow(); _lua_tmp.clone() }]);
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = atom.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_false();
}
return _lua_call({ let _lua_tmp = may_xfx_xf.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}

_lua_nil()
}}));
*readsysname.borrow_mut() = _lua_lambda(Box::new({let readsysname_no_pack = readsysname_no_pack.clone();
let atom_p = atom_p.clone();
let systemName_make = systemName_make.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readsysname_no_pack.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_false();
}
if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
}
return _lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
*state_const.borrow_mut() = { let _lua_tmp = x.borrow(); _lua_tmp.clone() };
*state.borrow_mut() = _lua_num!(0);
let make_read_two = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_read_two.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp| {
let prefix = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
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
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let c = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = c.borrow(); _lua_tmp.clone() }, { let _lua_tmp = prefix.borrow(); _lua_tmp.clone() }}).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = c.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])));
if (_lua_not(_lua_op!{and, _lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])})).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = k.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));

_lua_nil()
}}));
let make_read_three = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_read_three.borrow_mut() = _lua_lambda(Box::new({let eof = eof.clone();
let get = get.clone();
let put = put.clone();
let readlist = readlist.clone();
let parse_error = parse_error.clone();
let construction_p = construction_p.clone();
let construction_tail = construction_tail.clone();
let null_p = null_p.clone();
let construction_head = construction_head.clone();
move |mut _lua_arg_tmp| {
let prefix = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let k = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
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
move |mut _lua_arg_tmp| {
if (_lua_call({ let _lua_tmp = eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
return _lua_false();
}
let c = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{not_eq, { let _lua_tmp = c.borrow(); _lua_tmp.clone() }, { let _lua_tmp = prefix.borrow(); _lua_tmp.clone() }}).as_bool() {
_lua_call({ let _lua_tmp = put.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = c.borrow(); _lua_tmp.clone() }]);
return _lua_false();
}
let xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = readlist.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }])));
if (_lua_not(_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]))).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
let x_d = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_not(_lua_op!{and, _lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x_d.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x_d.borrow(); _lua_tmp.clone() }])])})).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = k.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x_d.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));

_lua_nil()
}}));
*readeval.borrow_mut() = _lua_call({ let _lua_tmp = make_read_two.borrow(); _lua_tmp.clone() }, vec![_lua_str("$"), _lua_lambda(Box::new({let val2env = val2env.clone();
let parse_error = parse_error.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp| {
let ev = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let env = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val2env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = ev.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = val.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
*readfuncapply.borrow_mut() = _lua_call({ let _lua_tmp = make_read_two.borrow(); _lua_tmp.clone() }, vec![_lua_str("%"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let builtin_func_apply = builtin_func_apply.clone();
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return { let _lua_tmp = v.borrow(); _lua_tmp.clone() };

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
let _1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}))])));
return _lua_call({ let _lua_tmp = builtin_func_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = jsxs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
*readformbuiltin.borrow_mut() = _lua_call({ let _lua_tmp = make_read_three.borrow(); _lua_tmp.clone() }, vec![_lua_str("@"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let val2env = val2env.clone();
let builtin_form_apply = builtin_form_apply.clone();
move |mut _lua_arg_tmp| {
let e = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return { let _lua_tmp = v.borrow(); _lua_tmp.clone() };

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
let _1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}))])));
let env = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val2env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = e.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = env.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
return _lua_call({ let _lua_tmp = builtin_form_apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = jsxs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
*readapply.borrow_mut() = _lua_call({ let _lua_tmp = make_read_two.borrow(); _lua_tmp.clone() }, vec![_lua_str("^"), _lua_lambda(Box::new({let list_to_jsArray = list_to_jsArray.clone();
let parse_error = parse_error.clone();
let apply = apply.clone();
move |mut _lua_arg_tmp| {
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let xs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let jsxs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xs.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({move |mut _lua_arg_tmp| {
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return { let _lua_tmp = v.borrow(); _lua_tmp.clone() };

_lua_nil()
}})), _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
let _1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let _2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}))])));
return _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = f.borrow(); _lua_tmp.clone() }, { let _lua_tmp = jsxs.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
*readcomment.borrow_mut() = _lua_call({ let _lua_tmp = make_read_two.borrow(); _lua_tmp.clone() }, vec![_lua_str(";"), _lua_lambda(Box::new({let new_comment = new_comment.clone();
move |mut _lua_arg_tmp| {
let comment = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_comment.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = comment.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
return _lua_call({ let _lua_tmp = val.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
let complex_print = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*complex_print.borrow_mut() = _lua_lambda(Box::new({let atom_p = atom_p.clone();
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
move |mut _lua_arg_tmp| {
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let print_sys_name = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*print_sys_name.borrow_mut() = _lua_lambda(Box::new({let atom_p = atom_p.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let is_inner_bool = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
let inner_bracket = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*inner_bracket.borrow_mut() = _lua_lambda(Box::new({let is_inner_bool = is_inner_bool.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp| {
let vl = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if ({ let _lua_tmp = is_inner_bool.borrow(); _lua_tmp.clone() }).as_bool() {
return _lua_op!{concat, _lua_str("["), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = vl.borrow(); _lua_tmp.clone() }]), _lua_str("]")}};
} else {
return { let _lua_tmp = vl.borrow(); _lua_tmp.clone() };
}

_lua_nil()
}}));
let maybe_xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }), _lua_num!(3)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
let maybe_lst_2 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2))])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() }), _lua_num!(3)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
let var_2_1 = std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(2))));
let maybe_lst_3 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = var_2_1.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_3.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_3.borrow(); _lua_tmp.clone() }), _lua_num!(1)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_3.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_true()])]), _lua_op!{concat, _lua_str("."), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), _lua_true()])])}}]);
} else if (_lua_op!{and, _lua_op!{and, _lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = var_2_1.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = var_2_1.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = var_2_1.borrow(); _lua_tmp.clone() }]), _lua_true()])]), _lua_op!{concat, _lua_str("@"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), _lua_true()])])}}]);
} else if (_lua_op!{and, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = var_2_1.borrow(); _lua_tmp.clone() }, { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str(":>"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(3)), _lua_true()])])}]);
}
}
let maybe_lst_44 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3))])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }]), _lua_op!{not_eq, { let _lua_tmp = maybe_lst_44.borrow(); _lua_tmp.clone() }, _lua_false()}}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_44.borrow(); _lua_tmp.clone() }), _lua_num!(2)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_44.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_44.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])]), _lua_str("?")}]);
}
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() }), _lua_num!(2)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
let maybe_lst_88 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_2.borrow(); _lua_tmp.clone() },_lua_num!(2))])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_88.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_88.borrow(); _lua_tmp.clone() }), _lua_num!(3)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_88.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_88.borrow(); _lua_tmp.clone() },_lua_num!(2)), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str(":&>"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_88.borrow(); _lua_tmp.clone() },_lua_num!(3)), _lua_true()])])}]);
}
}
let hd = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
*hd.borrow_mut() = _lua_str("_");
} else if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), { let _lua_tmp = theThing_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
*hd.borrow_mut() = _lua_str("");
} else {
*hd.borrow_mut() = _lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(3)), _lua_true()]);
}
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = hd.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_str(":"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])])}}]);
} else if (_lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }), _lua_num!(2)}}).as_bool() {
if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = form_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
let maybe_lst_288 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2))])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_288.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_lst_288.borrow(); _lua_tmp.clone() }), _lua_num!(2)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_288.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("&+"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_288.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])])}]);
}
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("&"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])])}]);
} else if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = isOrNot_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])]), _lua_str("~")}]);
} else if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("+"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_true()])])}]);
} else if (_lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = sub_atom.borrow(); _lua_tmp.clone() }])).as_bool() {
let maybe_lst_8934 = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2))])));
if (_lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_lst_8934.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{greater, _lua_len({ let _lua_tmp = maybe_lst_8934.borrow(); _lua_tmp.clone() }), _lua_num!(1)}}).as_bool() {
let tmp = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_8934.borrow(); _lua_tmp.clone() },_lua_num!(1)), _lua_true()])));
{
let i = std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(1)));
while (_lua_op!{less, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_len({ let _lua_tmp = maybe_lst_8934.borrow(); _lua_tmp.clone() })}).as_bool() {
*tmp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = tmp.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_str("/"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_lst_8934.borrow(); _lua_tmp.clone() },_lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)}), _lua_true()])])}};
*i.borrow_mut() = _lua_op!{add, { let _lua_tmp = i.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
}
}
return _lua_call({ let _lua_tmp = inner_bracket.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = tmp.borrow(); _lua_tmp.clone() }]);
}
}
}
if ({ let _lua_tmp = is_inner_bool.borrow(); _lua_tmp.clone() }).as_bool() {
return _lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]);
}

_lua_nil()
}}));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = complex_parse.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = val.borrow(); _lua_tmp.clone() }])])));
let temp = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
let prefix = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_str("()");
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_str("(");
*prefix.borrow_mut() = _lua_str("");
while (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = prefix.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])}};
*prefix.borrow_mut() = _lua_str(" ");
*x.borrow_mut() = _lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
}
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_str(")")};
} else {
*temp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = temp.borrow(); _lua_tmp.clone() }]), _lua_op!{concat, _lua_str(" . "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]), _lua_str(")")}}};
}
return { let _lua_tmp = temp.borrow(); _lua_tmp.clone() };
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
let name = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
let list = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
let maybe_xs = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{and, _lua_op!{and, _lua_op!{and, _lua_op!{not_eq, { let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }, _lua_false()}, _lua_op!{eq, _lua_len({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() }), _lua_num!(2)}}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = name_atom.borrow(); _lua_tmp.clone() }])}, _lua_call({ let _lua_tmp = jsbool_no_force_isomorphism_p.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(1)), { let _lua_tmp = system_atom.borrow(); _lua_tmp.clone() }])}).as_bool() {
return _lua_call({ let _lua_tmp = print_sys_name.borrow(); _lua_tmp.clone() }, vec![_lua_lookup({ let _lua_tmp = maybe_xs.borrow(); _lua_tmp.clone() },_lua_num!(2)), _lua_false()]);
}
return _lua_op!{concat, _lua_str("#"), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = list.borrow(); _lua_tmp.clone() }])])])};
} else if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str(";("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = comment_comment.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_evaluate_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("$("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_x.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_builtin_func_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("%("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_func_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_func_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}};
} else if (_lua_call({ let _lua_tmp = delay_builtin_form_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("@("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_builtin_form_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}}}};
} else if (_lua_call({ let _lua_tmp = delay_apply_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
return _lua_op!{concat, _lua_str("^("), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_apply_f.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])]), _lua_op!{concat, _lua_str(" "), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_apply_xs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])])])]), _lua_str(")")}}}};
}
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);

_lua_nil()
}}));
let machinetext_parse = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*machinetext_parse.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
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
move |mut _lua_arg_tmp| {
let rawstr = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let is_eof = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
let is_not_eof = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*is_eof.borrow_mut() = _lua_lambda(Box::new({let state = state.clone();
move |mut _lua_arg_tmp| {
return _lua_op!{eq, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(0)};

_lua_nil()
}}));
*is_not_eof.borrow_mut() = _lua_lambda(Box::new({let is_eof = is_eof.clone();
move |mut _lua_arg_tmp| {
return _lua_not(_lua_call({ let _lua_tmp = is_eof.borrow(); _lua_tmp.clone() }, vec![]));

_lua_nil()
}}));
*state.borrow_mut() = _lua_len({ let _lua_tmp = rawstr.borrow(); _lua_tmp.clone() });
let parse_error = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*parse_error.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
let tostring = tostring.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*x.borrow_mut() = _lua_str("");
}
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("MT parse ERROR "), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])}]);

_lua_nil()
}}));
let parse_assert = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*parse_assert.borrow_mut() = _lua_lambda(Box::new({let parse_error = parse_error.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_not({ let _lua_tmp = x.borrow(); _lua_tmp.clone() })).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}

_lua_nil()
}}));
let get_do = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*get_do.borrow_mut() = _lua_lambda(Box::new({let parse_assert = parse_assert.clone();
let is_not_eof = is_not_eof.clone();
let state = state.clone();
let string = string.clone();
let rawstr = rawstr.clone();
move |mut _lua_arg_tmp| {
_lua_call({ let _lua_tmp = parse_assert.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = is_not_eof.borrow(); _lua_tmp.clone() }, vec![])]);
*state.borrow_mut() = _lua_op!{sub, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)};
return _lua_call(_lua_lookup({ let _lua_tmp = string.borrow(); _lua_tmp.clone() },_lua_str("sub")), vec![{ let _lua_tmp = rawstr.borrow(); _lua_tmp.clone() }, _lua_op!{add, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)}, _lua_op!{add, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_num!(1)}]);

_lua_nil()
}}));
let stack = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let conslike = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*conslike.borrow_mut() = _lua_lambda(Box::new({let table = table.clone();
let stack = stack.clone();
let parse_error = parse_error.clone();
let __TS__ArrayUnshift = __TS__ArrayUnshift.clone();
move |mut _lua_arg_tmp| {
let c = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call(_lua_lookup({ let _lua_tmp = table.borrow(); _lua_tmp.clone() },_lua_str("remove")), vec![{ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }])));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call(_lua_lookup({ let _lua_tmp = table.borrow(); _lua_tmp.clone() },_lua_str("remove")), vec![{ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{or, _lua_op!{eq, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_nil()}, _lua_op!{eq, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }, _lua_nil()}}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
} else {
return _lua_call({ let _lua_tmp = __TS__ArrayUnshift.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = c.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, { let _lua_tmp = y.borrow(); _lua_tmp.clone() }])]);
}

_lua_nil()
}}));
while (_lua_call({ let _lua_tmp = is_not_eof.borrow(); _lua_tmp.clone() }, vec![])).as_bool() {
let chr = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get_do.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("^")}).as_bool() {
let tmp = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
while (_lua_true()).as_bool() {
let chr = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = get_do.borrow(); _lua_tmp.clone() }, vec![])));
if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("^")}).as_bool() {
break;
}
*tmp.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = chr.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = tmp.borrow(); _lua_tmp.clone() }])};
}
_lua_call({ let _lua_tmp = __TS__ArrayUnshift.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = tmp.borrow(); _lua_tmp.clone() }])]);
} else if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str(".")}).as_bool() {
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("#")}).as_bool() {
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }]);
} else if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("$")}).as_bool() {
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let val2env = val2env.clone();
let parse_error = parse_error.clone();
let evaluate = evaluate.clone();
move |mut _lua_arg_tmp| {
let env = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let val = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let r_env = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = val2env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = env.borrow(); _lua_tmp.clone() }])));
if (_lua_op!{eq, { let _lua_tmp = r_env.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
} else {
return _lua_call({ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = r_env.borrow(); _lua_tmp.clone() }, { let _lua_tmp = val.borrow(); _lua_tmp.clone() }]);
}

_lua_nil()
}}))]);
} else if (_lua_op!{eq, { let _lua_tmp = chr.borrow(); _lua_tmp.clone() }, _lua_str("_")}).as_bool() {
_lua_call({ let _lua_tmp = __TS__ArrayUnshift.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = parse_error.borrow(); _lua_tmp.clone() }, vec![]);
}
}
_lua_call({ let _lua_tmp = parse_assert.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = is_eof.borrow(); _lua_tmp.clone() }, vec![])]);
_lua_call({ let _lua_tmp = parse_assert.borrow(); _lua_tmp.clone() }, vec![_lua_op!{eq, _lua_len({ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }), _lua_num!(1)}]);
return _lua_lookup({ let _lua_tmp = stack.borrow(); _lua_tmp.clone() },_lua_num!(1));

_lua_nil()
}}));
let machinetext_print = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*machinetext_print.borrow_mut() = _lua_lambda(Box::new({let un_just_all = un_just_all.clone();
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
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let stack = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![(_lua_num!(1), { let _lua_tmp = x.borrow(); _lua_tmp.clone() })])));
let result = std::sync::Arc::new(std::cell::RefCell::new(_lua_str("")));
while (_lua_op!{not_eq, _lua_len({ let _lua_tmp = stack.borrow(); _lua_tmp.clone() }), _lua_num!(0)}).as_bool() {
let new_stack = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
let _lua_tmp_t={ let _lua_tmp = stack.borrow(); _lua_tmp.clone() };
for _lua_tmp_k in 1..=(_lua_len(_lua_tmp_t.clone()).as_f64() as usize) {
let ____=std::sync::Arc::new(std::cell::RefCell::new(_lua_num!(_lua_tmp_k)));
let x=std::sync::Arc::new(std::cell::RefCell::new(_lua_lookup(_lua_tmp_t.clone(),____.borrow().clone())));
*x.borrow_mut() = _lua_call({ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);
let conslike = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*conslike.borrow_mut() = _lua_lambda(Box::new({let result = result.clone();
let tostring = tostring.clone();
let __TS__ArrayPush = __TS__ArrayPush.clone();
let new_stack = new_stack.clone();
move |mut _lua_arg_tmp| {
let xx = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let g1 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let g2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
*result.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = result.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = s.borrow(); _lua_tmp.clone() }])};
return _lua_call({ let _lua_tmp = __TS__ArrayPush.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = new_stack.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = g1.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = g2.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = xx.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
if (_lua_call({ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*result.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = result.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_op!{concat, _lua_str("^"), _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])]), _lua_str("^")}}])};
} else if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str("."), { let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, { let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
*result.borrow_mut() = _lua_op!{concat, _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = result.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = tostring.borrow(); _lua_tmp.clone() }, vec![_lua_str("_")])};
} else if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }, _lua_str("#"), { let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }]);
} else if (_lua_call({ let _lua_tmp = delay_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])).as_bool() {
let y = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = delay2delay_evaluate.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }])));
_lua_call({ let _lua_tmp = conslike.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = y.borrow(); _lua_tmp.clone() }, _lua_str("$"), _lua_lambda(Box::new({let env2val = env2val.clone();
let delay_evaluate_env = delay_evaluate_env.clone();
move |mut _lua_arg_tmp| {
let vl = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = delay_evaluate_env.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = vl.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}})), { let _lua_tmp = delay_evaluate_x.borrow(); _lua_tmp.clone() }]);
} else {
return _lua_call({ let _lua_tmp = LANG_ERROR.borrow(); _lua_tmp.clone() }, vec![]);
}
}
*stack.borrow_mut() = { let _lua_tmp = new_stack.borrow(); _lua_tmp.clone() };
}
return { let _lua_tmp = result.borrow(); _lua_tmp.clone() };

_lua_nil()
}}));
let return_effect_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = sub_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = effect_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = typeAnnotation_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = thing_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = something_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])])]), { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])]), { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])])])));
let bind_effect_systemName = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = systemName_make.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = sub_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = effect_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = construction_atom.borrow(); _lua_tmp.clone() }, { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])]), { let _lua_tmp = null_v.borrow(); _lua_tmp.clone() }])])])));
let new_effect_bind = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*new_effect_bind.borrow_mut() = _lua_lambda(Box::new({let new_data = new_data.clone();
let bind_effect_systemName = bind_effect_systemName.clone();
let new_list = new_list.clone();
move |mut _lua_arg_tmp| {
let monad = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let func = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = bind_effect_systemName.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = monad.borrow(); _lua_tmp.clone() }, { let _lua_tmp = func.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let new_effect_return = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*new_effect_return.borrow_mut() = _lua_lambda(Box::new({let new_data = new_data.clone();
let return_effect_systemName = return_effect_systemName.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = return_effect_systemName.borrow(); _lua_tmp.clone() }, { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
let run_monad_helper = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*run_monad_helper.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
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
move |mut _lua_arg_tmp| {
let return_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let next = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
if (_lua_op!{eq, { let _lua_tmp = next.borrow(); _lua_tmp.clone() }, _lua_nil()}).as_bool() {
*next.borrow_mut() = _lua_false();
}
let make_bind = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*make_bind.borrow_mut() = _lua_lambda(Box::new({let error = error.clone();
move |mut _lua_arg_tmp| {
let x = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let f = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
_lua_call({ let _lua_tmp = error.borrow(); _lua_tmp.clone() }, vec![_lua_str("WIP")]);

_lua_nil()
}}));
*code.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }])).as_bool() {
let name = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }])));
let list = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }])));
if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = return_effect_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
*list.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])).as_bool() {
let list_a = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])));
let list_d = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_d.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{eq, { let _lua_tmp = next.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
let upval_v = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_a.borrow(); _lua_tmp.clone() }));
let upval_st = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = state.borrow(); _lua_tmp.clone() }));
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*r.borrow_mut() = _lua_lambda(Box::new({let return_handler = return_handler.clone();
let upval_v = upval_v.clone();
let upval_st = upval_st.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_st.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = r.borrow(); _lua_tmp.clone() }]);
} else {
let upval_rt = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_rt.borrow_mut() = { let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_op.borrow_mut() = { let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() };
let upval_v = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_a.borrow(); _lua_tmp.clone() }));
let upval_st = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = state.borrow(); _lua_tmp.clone() }));
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*r.borrow_mut() = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let upval_rt = upval_rt.clone();
let upval_op = upval_op.clone();
let apply = apply.clone();
let next = next.clone();
let upval_v = upval_v.clone();
let upval_st = upval_st.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_rt.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_op.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = next.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_v.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = upval_st.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = r.borrow(); _lua_tmp.clone() }]);
}
}
}
} else if (_lua_call({ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = name.borrow(); _lua_tmp.clone() }, { let _lua_tmp = bind_effect_systemName.borrow(); _lua_tmp.clone() }])).as_bool() {
*list.borrow_mut() = _lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }]);
if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])).as_bool() {
let list_a = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])));
let list_d = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_d.borrow(); _lua_tmp.clone() }])).as_bool() {
let list_d_a = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_d.borrow(); _lua_tmp.clone() }])));
let list_d_d = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_d.borrow(); _lua_tmp.clone() }])])));
if (_lua_call({ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = list_d_d.borrow(); _lua_tmp.clone() }])).as_bool() {
if (_lua_op!{eq, { let _lua_tmp = next.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
let upval_rt = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_rt.borrow_mut() = { let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_op.borrow_mut() = { let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() };
let upval_a = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_a.borrow(); _lua_tmp.clone() }));
let upval_b = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_d_a.borrow(); _lua_tmp.clone() }));
let upval_st = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = state.borrow(); _lua_tmp.clone() }));
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*r.borrow_mut() = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let upval_rt = upval_rt.clone();
let upval_op = upval_op.clone();
let upval_a = upval_a.clone();
let upval_st = upval_st.clone();
let upval_b = upval_b.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_rt.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_op.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_a.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_st.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_b.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = r.borrow(); _lua_tmp.clone() }]);
} else {
let upval_rt = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_rt.borrow_mut() = { let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() };
let upval_op = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*upval_op.borrow_mut() = { let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() };
let upval_a = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_a.borrow(); _lua_tmp.clone() }));
let upval_b = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = list_d_a.borrow(); _lua_tmp.clone() }));
let upval_st = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = state.borrow(); _lua_tmp.clone() }));
let upval_nt = std::sync::Arc::new(std::cell::RefCell::new({ let _lua_tmp = next.borrow(); _lua_tmp.clone() }));
let x = std::sync::Arc::new(std::cell::RefCell::new(_lua_call({ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() }, vec![_lua_str("序甲")])));
let r = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*r.borrow_mut() = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
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
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_rt.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_op.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_a.borrow(); _lua_tmp.clone() }, { let _lua_tmp = upval_st.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = function_atom.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = make_bind.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = make_quote.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_b.borrow(); _lua_tmp.clone() }]), { let _lua_tmp = x.borrow(); _lua_tmp.clone() }]), _lua_call({ let _lua_tmp = make_quote.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = upval_nt.borrow(); _lua_tmp.clone() }])])])])]);

_lua_nil()
}}));
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = r.borrow(); _lua_tmp.clone() }]);
}
}
}
}
}
}
if (_lua_op!{eq, { let _lua_tmp = next.borrow(); _lua_tmp.clone() }, _lua_false()}).as_bool() {
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let op_handler = op_handler.clone();
let code = code.clone();
let state = state.clone();
let return_handler = return_handler.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, { let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);
} else {
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let op_handler = op_handler.clone();
let code = code.clone();
let state = state.clone();
let trampoline_delay = trampoline_delay.clone();
let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let apply = apply.clone();
let next = next.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = code.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({let trampoline_delay = trampoline_delay.clone();
let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let op_handler = op_handler.clone();
let apply = apply.clone();
let next = next.clone();
move |mut _lua_arg_tmp| {
let val2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state2 = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
let return_handler = return_handler.clone();
let op_handler = op_handler.clone();
let apply = apply.clone();
let next = next.clone();
let val2 = val2.clone();
let state2 = state2.clone();
move |mut _lua_arg_tmp| {
return _lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() }, { let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() }, _lua_call({ let _lua_tmp = apply.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = next.borrow(); _lua_tmp.clone() }, _lua_table(vec![(_lua_num!(1), { let _lua_tmp = val2.borrow(); _lua_tmp.clone() })])]), { let _lua_tmp = state2.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}))]);

_lua_nil()
}}))]);

_lua_nil()
}}))]);
}

_lua_nil()
}}));
let run_monad_trampoline = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*run_monad_trampoline.borrow_mut() = _lua_lambda(Box::new({let run_monad_helper = run_monad_helper.clone();
move |mut _lua_arg_tmp| {
let return_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() }, { let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() }, { let _lua_tmp = code.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }]);

_lua_nil()
}}));
let run_monad_stackoverflow = std::sync::Arc::new(std::cell::RefCell::new(_lua_nil()));
*run_monad_stackoverflow.borrow_mut() = _lua_lambda(Box::new({let run_trampoline = run_trampoline.clone();
let run_monad_helper = run_monad_helper.clone();
let trampoline_return = trampoline_return.clone();
move |mut _lua_arg_tmp| {
let return_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let op_handler = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let code = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let state = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = run_trampoline.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = run_monad_helper.borrow(); _lua_tmp.clone() }, vec![_lua_lambda(Box::new({let trampoline_return = trampoline_return.clone();
let return_handler = return_handler.clone();
move |mut _lua_arg_tmp| {
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = return_handler.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = s.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}})), _lua_lambda(Box::new({let trampoline_return = trampoline_return.clone();
let op_handler = op_handler.clone();
let run_trampoline = run_trampoline.clone();
move |mut _lua_arg_tmp| {
let op = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let st = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let rs = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = op_handler.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = op.borrow(); _lua_tmp.clone() }, { let _lua_tmp = st.borrow(); _lua_tmp.clone() }, _lua_lambda(Box::new({let run_trampoline = run_trampoline.clone();
let rs = rs.clone();
move |mut _lua_arg_tmp| {
let v = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
let s = std::sync::Arc::new(std::cell::RefCell::new(if _lua_arg_tmp.is_empty() { _lua_nil() } else { _lua_arg_tmp.remove(0) }));
return _lua_call({ let _lua_tmp = run_trampoline.borrow(); _lua_tmp.clone() }, vec![_lua_call({ let _lua_tmp = rs.borrow(); _lua_tmp.clone() }, vec![{ let _lua_tmp = v.borrow(); _lua_tmp.clone() }, { let _lua_tmp = s.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}))])]);

_lua_nil()
}})), { let _lua_tmp = code.borrow(); _lua_tmp.clone() }, { let _lua_tmp = state.borrow(); _lua_tmp.clone() }])]);

_lua_nil()
}}));
let ____exports = std::sync::Arc::new(std::cell::RefCell::new(_lua_table(vec![])));
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("trampoline_return"),{ let _lua_tmp = trampoline_return.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("trampoline_delay"),{ let _lua_tmp = trampoline_delay.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("run_trampoline"),{ let _lua_tmp = run_trampoline.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_comment"),{ let _lua_tmp = new_comment.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("comment_p"),{ let _lua_tmp = comment_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("comment_comment"),{ let _lua_tmp = comment_comment.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("comment_x"),{ let _lua_tmp = comment_x.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("un_comment_all"),{ let _lua_tmp = un_comment_all.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_atom"),{ let _lua_tmp = new_atom.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("atom_p"),{ let _lua_tmp = atom_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("un_atom"),{ let _lua_tmp = un_atom.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("atom_equal_p"),{ let _lua_tmp = atom_equal_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_construction"),{ let _lua_tmp = new_construction.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("construction_p"),{ let _lua_tmp = construction_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("construction_head"),{ let _lua_tmp = construction_head.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("construction_tail"),{ let _lua_tmp = construction_tail.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("null_v"),{ let _lua_tmp = null_v.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("null_p"),{ let _lua_tmp = null_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_data"),{ let _lua_tmp = new_data.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("data_p"),{ let _lua_tmp = data_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("data_name"),{ let _lua_tmp = data_name.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("data_list"),{ let _lua_tmp = data_list.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("just_p"),{ let _lua_tmp = just_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("evaluate"),{ let _lua_tmp = evaluate.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("apply"),{ let _lua_tmp = apply.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force_all_rec"),{ let _lua_tmp = force_all_rec.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force_uncomment_all_rec"),{ let _lua_tmp = force_uncomment_all_rec.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("unlazy_all_rec"),{ let _lua_tmp = unlazy_all_rec.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("jsArray_to_list"),{ let _lua_tmp = jsArray_to_list.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("maybe_list_to_jsArray"),{ let _lua_tmp = maybe_list_to_jsArray.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_list"),{ let _lua_tmp = new_list.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("un_just_all"),{ let _lua_tmp = un_just_all.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("un_just_comment_all"),{ let _lua_tmp = un_just_comment_all.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("delay_p"),{ let _lua_tmp = delay_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("delay_just_p"),{ let _lua_tmp = delay_just_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("lazy_p"),{ let _lua_tmp = lazy_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("delay_env"),{ let _lua_tmp = delay_env.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("delay_x"),{ let _lua_tmp = delay_x.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force_all"),{ let _lua_tmp = force_all.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force1"),{ let _lua_tmp = force1.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force_uncomment1"),{ let _lua_tmp = force_uncomment1.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("force_uncomment_all"),{ let _lua_tmp = force_uncomment_all.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("unlazy1"),{ let _lua_tmp = unlazy1.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("env_null_v"),{ let _lua_tmp = env_null_v.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("env_set"),{ let _lua_tmp = env_set.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("env_get"),{ let _lua_tmp = env_get.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("env2val"),{ let _lua_tmp = env2val.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("env_foreach"),{ let _lua_tmp = env_foreach.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("val2env"),{ let _lua_tmp = val2env.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("equal_p"),{ let _lua_tmp = equal_p.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("simple_print"),{ let _lua_tmp = simple_print.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("complex_parse"),{ let _lua_tmp = complex_parse.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("complex_print"),{ let _lua_tmp = complex_print.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("machinetext_parse"),{ let _lua_tmp = machinetext_parse.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("machinetext_print"),{ let _lua_tmp = machinetext_print.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("return_effect_systemName"),{ let _lua_tmp = return_effect_systemName.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("bind_effect_systemName"),{ let _lua_tmp = bind_effect_systemName.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_effect_bind"),{ let _lua_tmp = new_effect_bind.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("new_effect_return"),{ let _lua_tmp = new_effect_return.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("run_monad_trampoline"),{ let _lua_tmp = run_monad_trampoline.borrow(); _lua_tmp.clone() });
_lua_set({ let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() },_lua_str("run_monad_stackoverflow"),{ let _lua_tmp = run_monad_stackoverflow.borrow(); _lua_tmp.clone() });
return { let _lua_tmp = ____exports.borrow(); _lua_tmp.clone() };
    _lua_nil()
}
