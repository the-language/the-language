package lang;
public class Lang$luaj$machineasctext_parse extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    final static org.luaj.vm2.LuaValue k7;
    final static org.luaj.vm2.LuaValue k8;
    final static org.luaj.vm2.LuaValue k9;
    final static org.luaj.vm2.LuaValue k10;
    final static org.luaj.vm2.LuaValue k11;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayReverse");
        k1 = org.luaj.vm2.LuaString.valueOf("__TS__StringSplit");
        k2 = org.luaj.vm2.LuaString.valueOf("");
        k3 = org.luaj.vm2.LuaValue.valueOf(0);
        k4 = org.luaj.vm2.LuaString.valueOf("table");
        k5 = org.luaj.vm2.LuaString.valueOf("remove");
        k6 = org.luaj.vm2.LuaString.valueOf("$");
        k7 = org.luaj.vm2.LuaString.valueOf("tostring");
        k8 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayShift");
        k9 = org.luaj.vm2.LuaString.valueOf("decodeURI");
        k10 = org.luaj.vm2.LuaString.valueOf("error");
        k11 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$machineasctext_parse() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call();
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a1);
        org.luaj.vm2.LuaValue a3 = this.u1.get(k0).invoke(this.u1.get(k1).invoke(a0, (org.luaj.vm2.Varargs)k2).subargs(1)).arg1();
        while(!a3.len().eq_b(k3)) {
            if (((org.luaj.vm2.LuaValue)a2).len().eq_b(k3)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaTable a4 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k3)) {
                if (this.u1.get(k4).get(k5).call(a3).eq_b(k6)) {
                    org.luaj.vm2.LuaValue a5 = k2;
                    while(true) {
                        if (a3.len().eq_b(k3)) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a6 = this.u1.get(k4).get(k5).call(a3);
                        if (a6.eq_b(k6)) {
                            org.luaj.vm2.LuaValue a7 = this.u1.get(k8).call((org.luaj.vm2.LuaValue)a2);
                            org.luaj.vm2.LuaValue a8 = this.u3;
                            org.luaj.vm2.Varargs a9 = this.u4.invoke(this.u1.get(k9).invoke(org.luaj.vm2.LuaValue.NIL, (org.luaj.vm2.Varargs)a5).subargs(1));
                            org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
                            a10[0] = a7;
                            a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
                            break;
                        } else {
                            a5 = this.u1.get(k7).call(a5).concat(this.u1.get(k7).call(a6));
                        }
                    }
                } else {
                    this.u1.get(k10).call(k11);
                }
            }
            a2 = a4;
        }
        if (((org.luaj.vm2.LuaValue)a2).len().eq_b(k3)) {
            org.luaj.vm2.Varargs a11 = a1;
            return a11;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
