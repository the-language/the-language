package lang;
public class Lang$luaj$63 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    
    public Lang$luaj$63() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        while(!(!this.u0.call(a).toboolean() && !this.u1.call(a).toboolean())) {
            a = this.u2[0].invoke(this.u3.invoke((org.luaj.vm2.Varargs)a).subargs(1)).arg1();
        }
        return a;
    }
}
