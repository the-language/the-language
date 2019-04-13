package lang;
public class lang_luaj$66 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public lang_luaj$66() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0[0].call(a);
        if (!this.u1.call(a0).toboolean()) {
            org.luaj.vm2.LuaValue a1 = org.luaj.vm2.LuaValue.FALSE;
            return a1;
        }
        org.luaj.vm2.LuaValue a2 = this.u0[0].invoke(this.u2.invoke((org.luaj.vm2.Varargs)a0).subargs(1)).arg1();
        if (!this.u3.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a3 = org.luaj.vm2.LuaValue.FALSE;
            return a3;
        }
        if (!this.u4.call(a2, this.u5[0]).toboolean()) {
            org.luaj.vm2.LuaValue a4 = org.luaj.vm2.LuaValue.FALSE;
            return a4;
        }
        org.luaj.vm2.LuaValue a5 = this.u0[0].invoke(this.u6.invoke((org.luaj.vm2.Varargs)a0).subargs(1)).arg1();
        if (!this.u7.call(a5).toboolean()) {
            org.luaj.vm2.LuaValue a6 = org.luaj.vm2.LuaValue.FALSE;
            return a6;
        }
        if (!this.u8.invoke(this.u0[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).subargs(1)).arg1().toboolean()) {
            org.luaj.vm2.LuaValue a7 = org.luaj.vm2.LuaValue.FALSE;
            return a7;
        }
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a9 = this.u0[0].invoke(this.u10.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).arg1();
        while(!this.u8.call(a9).toboolean()) {
            if (!this.u7.call(a9).toboolean()) {
                org.luaj.vm2.LuaValue a10 = org.luaj.vm2.LuaValue.FALSE;
                return a10;
            }
            org.luaj.vm2.LuaValue a11 = this.u0[0].invoke(this.u10.invoke((org.luaj.vm2.Varargs)a9).subargs(1)).arg1();
            a9 = this.u0[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a9).subargs(1)).arg1();
            if (!this.u7.call(a11).toboolean()) {
                org.luaj.vm2.LuaValue a12 = org.luaj.vm2.LuaValue.FALSE;
                return a12;
            }
            org.luaj.vm2.LuaValue a13 = this.u10.call(a11);
            org.luaj.vm2.LuaValue a14 = this.u0[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a11).subargs(1)).arg1();
            if (!this.u7.call(a14).toboolean()) {
                org.luaj.vm2.LuaValue a15 = org.luaj.vm2.LuaValue.FALSE;
                return a15;
            }
            org.luaj.vm2.LuaValue a16 = this.u10.call(a14);
            if (!this.u8.invoke(this.u0[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a14).subargs(1)).subargs(1)).arg1().toboolean()) {
                org.luaj.vm2.LuaValue a17 = org.luaj.vm2.LuaValue.FALSE;
                return a17;
            }
            org.luaj.vm2.LuaBoolean a18 = org.luaj.vm2.LuaValue.TRUE;
            org.luaj.vm2.LuaValue a19 = k0;
            while(true) {
                if (a19.lt_b(((org.luaj.vm2.LuaValue)a8).len())) {
                    if (!this.u11[0].call(((org.luaj.vm2.LuaValue)a8).get(a19.add(k0).add(k1)), a13).toboolean()) {
                        a19 = a19.add(k2);
                        continue;
                    }
                    ((org.luaj.vm2.LuaValue)a8).set(a19.add(k1).add(k1), a16);
                    a18 = org.luaj.vm2.LuaValue.FALSE;
                }
                if (!((org.luaj.vm2.LuaValue)a18).toboolean()) {
                    break;
                }
                this.u12.call((org.luaj.vm2.LuaValue)a8, a13);
                this.u12.call((org.luaj.vm2.LuaValue)a8, a16);
                break;
            }
        }
        org.luaj.vm2.LuaValue a20 = a8;
        return a20;
    }
}
