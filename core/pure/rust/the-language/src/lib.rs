mod lang;
use lang::{lang, _lua_data, _lua_str, _lua_call, _lua_lookup};

// TODO 用std::panic::catch_unwind 及 Option

pub struct Lang (_lua_data);
pub struct LangValue (_lua_data);
impl Lang {
    pub fn new() -> Self {
        Lang(lang())
    }
    pub fn complex_parse(&self, x: &String) -> LangValue {
        LangValue(_lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_parse")), vec![_lua_str(&x.clone())]))
    }
    pub fn machinetext_parse(&self, x: &String) -> LangValue {
        LangValue(_lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_parse")), vec![_lua_str(&x.clone())]))
    }
    pub fn complex_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("complex_print")), vec![x.0.clone()]).as_string().clone()
    }
    pub fn machinetest_print(&self, x: &LangValue) -> String {
        _lua_call(_lua_lookup(self.0.clone(), _lua_str("machinetest_print")), vec![x.0.clone()]).as_string().clone()
    }
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
