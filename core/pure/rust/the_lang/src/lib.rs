mod lang;
use lang::{lang, _lua_data, _lua_str, _lua_call, _lua_lookup, _lua_debug_loc};

// TODO 用std::panic::catch_unwind 及 Option

pub struct Lang (_lua_data);
pub struct LangValue (_lua_data);

const NIL_LOC: _lua_debug_loc = _lua_debug_loc { start: (0, 0), end: (0, 0) };

impl Lang {
    pub fn new() -> Self {
        Lang(lang())
    }
    pub fn complex_parse(&self, x: &String) -> LangValue {
        LangValue(_lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_parse"), NIL_LOC), vec![_lua_str(&x.clone())], NIL_LOC))
    }
    pub fn machinetext_parse(&self, x: &String) -> LangValue {
        LangValue(_lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_parse"), NIL_LOC), vec![_lua_str(&x.clone())], NIL_LOC))
    }
    pub fn complex_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_print"), NIL_LOC), vec![x.0.clone()], NIL_LOC).as_string(NIL_LOC).clone()
    }
    pub fn machinetest_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("machinetest_print"), NIL_LOC), vec![x.0.clone()], NIL_LOC).as_string(NIL_LOC).clone()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let l = Lang::new();
        assert_eq!(l.complex_print(&l.complex_parse(&String::from("()"))), String::from("()"));
    }
}
