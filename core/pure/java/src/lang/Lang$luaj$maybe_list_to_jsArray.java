package lang;
public class Lang$luaj$maybe_list_to_jsArray extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$maybe_list_to_jsArray() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.LuaValue)new Lang$luaj$maybe_list_to_jsArray$0(), (org.luaj.vm2.Varargs)new Lang$luaj$maybe_list_to_jsArray$1()));
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
