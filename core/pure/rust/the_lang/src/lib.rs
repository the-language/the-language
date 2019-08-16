mod lang;
use lang::{lang, _lua_data, _lua_str, _lua_call, _lua_lookup, _lua_debug_loc};

// TODO 用std::panic::catch_unwind 及 Option
#[derive(Hash,PartialEq,Eq,Debug)]
pub struct Lang (_lua_data);
#[derive(Hash,PartialEq,Eq,Debug)]
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
    pub fn machinetext_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("machinetext_print"), NIL_LOC), vec![x.0.clone()], NIL_LOC).as_string(NIL_LOC).clone()
    }
    pub fn simple_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("simple_print"), NIL_LOC), vec![x.0.clone()], NIL_LOC).as_string(NIL_LOC).clone()
    }

    pub fn force_all_rec(&self, x: &LangValue) -> LangValue {
        LangValue(_lua_call(_lua_lookup(self.0.clone(), _lua_str("force_all_rec"), NIL_LOC), vec![x.0.clone()], NIL_LOC))
    }
}
