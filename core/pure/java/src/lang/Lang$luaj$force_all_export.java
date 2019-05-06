package lang;
public class Lang$luaj$force_all_export extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$force_all_export() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0[0], (org.luaj.vm2.Varargs)a0);
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = Lang$luaj$force_all_export.newupl(a);
    }
}
