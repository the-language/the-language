package lang;
public class Lang$luaj$__TS__StringSplit extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(4294967295.0);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaString.valueOf("");
        k3 = org.luaj.vm2.LuaValue.valueOf(1);
        k4 = org.luaj.vm2.LuaString.valueOf("string");
        k5 = org.luaj.vm2.LuaString.valueOf("sub");
        k6 = org.luaj.vm2.LuaString.valueOf("find");
    }
    
    public Lang$luaj$__TS__StringSplit() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        if (a1.eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a1 = k0;
        }
        if (a1.eq_b(k1)) {
            return org.luaj.vm2.LuaValue.tableOf(0, 0);
        }
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a3 = k1;
        org.luaj.vm2.LuaValue a4 = k1;
        boolean b = a0.eq_b(org.luaj.vm2.LuaValue.NIL);
        label3: {
            label0: {
                label2: {
                    label1: {
                        if (!b) {
                            break label1;
                        }
                        break label2;
                    }
                    if (!a0.eq_b(k2)) {
                        break label0;
                    }
                }
                while(a3.lt_b(a.len().sub(k3))) {
                    {
                        if (a4.lt_b(a1)) {
                            ((org.luaj.vm2.LuaValue)a2).set(a4.add(k3), this.u0.get(k4).get(k5).call(a, a3.add(k3), a3.add(k3)));
                            a4 = a4.add(k3);
                            a3 = a3.add(k3);
                            continue;
                        }
                        break;
                    }
                }
                break label3;
            }
            org.luaj.vm2.LuaValue a5 = a0.len();
            org.luaj.vm2.LuaValue a6 = this.u0.get(k4).get(k6).call(a, a0);
            if (!a6.toboolean()) {
                a6 = k1;
            }
            org.luaj.vm2.LuaValue a7 = a6.sub(k3);
            while(k1.lteq_b(a7)) {
                {
                    if (a4.lt_b(a1)) {
                        ((org.luaj.vm2.LuaValue)a2).set(a4.add(k3), this.u0.get(k4).get(k5).call(a, a3.add(k3), a7));
                        a4 = a4.add(k3);
                        a3 = a7.add(a5);
                        org.luaj.vm2.LuaValue a8 = this.u0.get(k4).get(k6);
                        org.luaj.vm2.LuaValue a9 = a3.add(k3);
                        org.luaj.vm2.LuaBoolean a10 = org.luaj.vm2.LuaValue.TRUE;
                        org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[4];
                        a11[0] = a;
                        a11[1] = a0;
                        a11[2] = a9;
                        a11[3] = a10;
                        org.luaj.vm2.LuaValue a12 = a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a11)).arg1();
                        if (!a12.toboolean()) {
                            a12 = k1;
                        }
                        a7 = a12.sub(k3);
                        continue;
                    }
                    break;
                }
            }
        }
        if (a4.lt_b(a1)) {
            ((org.luaj.vm2.LuaValue)a2).set(a4.add(k3), this.u0.get(k4).get(k5).call(a, a3.add(k3)));
        }
        return a2;
    }
}
