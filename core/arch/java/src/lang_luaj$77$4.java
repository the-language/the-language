public class lang_luaj$77$4 extends org.luaj.vm2.lib.OneArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf(" ");
        k1 = org.luaj.vm2.LuaString.valueOf("\n");
        k2 = org.luaj.vm2.LuaString.valueOf("\t");
        k3 = org.luaj.vm2.LuaString.valueOf("\r");
    }
    
    public lang_luaj$77$4() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaBoolean a0 = null;
        boolean b = a.eq_b(k0);
        label4: {
            label0: {
                label3: {
                    if (!b) {
                        break label3;
                    }
                    break label0;
                }
                boolean b0 = a.eq_b(k1);
                label2: {
                    if (!b0) {
                        break label2;
                    }
                    break label0;
                }
                boolean b1 = a.eq_b(k2);
                label1: {
                    if (!b1) {
                        break label1;
                    }
                    break label0;
                }
                if (a.eq_b(k3)) {
                    break label0;
                }
                a0 = org.luaj.vm2.LuaValue.FALSE;
                break label4;
            }
            a0 = org.luaj.vm2.LuaValue.TRUE;
        }
        return a0;
    }
}
