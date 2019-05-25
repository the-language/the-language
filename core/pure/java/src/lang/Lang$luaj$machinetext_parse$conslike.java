package lang;
public class Lang$luaj$machinetext_parse$conslike extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    
    public Lang$luaj$machinetext_parse$conslike() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call();
        org.luaj.vm2.LuaValue a1 = this.u0.call();
        org.luaj.vm2.LuaValue a2 = this.u1;
        org.luaj.vm2.LuaValue a3 = this.u2;
        Lang$luaj$machinetext_parse$conslike$0 a4 = new Lang$luaj$machinetext_parse$conslike$0();
        a4.u0 = this.u3;
        a4.u1 = a0;
        a2.call(a3, (org.luaj.vm2.LuaValue)a4);
        org.luaj.vm2.LuaValue a5 = this.u1;
        org.luaj.vm2.LuaValue a6 = this.u2;
        Lang$luaj$machinetext_parse$conslike$1 a7 = new Lang$luaj$machinetext_parse$conslike$1();
        a7.u0 = this.u3;
        a7.u1 = a1;
        a5.call(a6, (org.luaj.vm2.LuaValue)a7);
        this.u4.invoke(a.invoke(a0, (org.luaj.vm2.Varargs)a1).subargs(1));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
