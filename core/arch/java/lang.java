import org.luaj.vm2.LuaString;
import org.luaj.vm2.LuaValue;

public class lang extends org.luaj.vm2.lib.VarArgFunction
{
  LuaValue u0;
  static final LuaValue k0 = LuaString.valueOf("__TS__ArrayPush");
  static final LuaValue k1 = LuaValue.valueOf(0);
  static final LuaValue k2 = LuaValue.valueOf(1);
  static final LuaValue k3 = LuaValue.valueOf(2);
  static final LuaValue k4 = LuaValue.valueOf(3);
  static final LuaValue k5 = LuaValue.valueOf(4);
  static final LuaValue k6 = LuaValue.valueOf(5);
  static final LuaValue k7 = LuaValue.valueOf(6);
  static final LuaValue k8 = LuaValue.valueOf(7);
  static final LuaValue k9 = LuaValue.valueOf(8);
  static final LuaValue k10 = LuaValue.valueOf(9);
  static final LuaValue k11 = LuaString.valueOf("new_symbol");
  static final LuaValue k12 = LuaString.valueOf("symbol_p");
  static final LuaValue k13 = LuaString.valueOf("un_symbol");
  static final LuaValue k14 = LuaString.valueOf("new_construction");
  
  public lang() {}
  
  public final org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs args)
  {
    ;
    args = args.subargs(1);lang.__TS__ArrayPush local__TS__ArrayPush = new lang.__TS__ArrayPush();this.u0.set(k0, (LuaValue)exports);
    LuaValue[] simple_print;
    LuaValue[] jsbool_equal_p; LuaValue[] new_lambda; LuaValue[] real_builtin_form_apply; LuaValue[] real_builtin_func_apply; LuaValue[] real_apply; LuaValue[] real_builtin_func_apply_s; LuaValue[] name_p; LuaValue[] real_evaluate; LuaValue[] env_null_v; LuaValue[] force1; LuaValue[] force_all; LuaValue[] form_use_systemName; LuaValue[] form_builtin_use_systemName; LuaValue[] function_builtin_use_systemName; LuaValue[] lambda_form_builtin_systemName; LuaValue[] quote_form_builtin_systemName; LuaValue[] if_function_builtin_systemName; LuaValue[] evaluate_function_builtin_systemName; LuaValue[] apply_function_builtin_systemName; LuaValue[] equal_p_function_builtin_systemName; LuaValue[] null_p_function_builtin_systemName; LuaValue[] symbol_p_function_builtin_systemName; LuaValue[] construction_tail_function_builtin_systemName; LuaValue[] construction_head_function_builtin_systemName; LuaValue[] construction_p_function_builtin_systemName; LuaValue[] error_p_function_builtin_systemName; LuaValue[] error_list_function_builtin_systemName; LuaValue[] error_name_function_builtin_systemName; LuaValue[] data_p_function_builtin_systemName; LuaValue[] data_list_function_builtin_systemName; LuaValue[] data_name_function_builtin_systemName; LuaValue[] the_world_stopped_v; LuaValue[] mapping_symbol; LuaValue[] form_symbol; LuaValue[] function_symbol; LuaValue[] system_symbol; LuaValue[] force_all_rec; LuaValue[] null_v; LuaValue[] delay_apply_t; LuaValue[] delay_builtin_form_t; LuaValue[] delay_builtin_func_t; LuaValue[] delay_evaluate_t; LuaValue[] just_t; LuaValue[] error_t; LuaValue[] data_t; LuaValue[] null_t; LuaValue[] construction_t; Object exports = LuaValue.tableOf(0, 0); LuaValue 
      tmp680_679 = ((new_lambda = newupe())[0] =  = (real_builtin_form_apply = newupe())[0] =  = (real_builtin_func_apply = newupe())[0] =  = (real_apply = newupe())[0] =  = (real_builtin_func_apply_s = newupe())[0] =  = (name_p = newupe())[0] =  = (real_evaluate = newupe())[0] =  = env_foreach = env2val = must_env_get = env_get = env_set = (env_null_v = newupe())[0] =  = (force1 = newupe())[0] =  = (force_all = newupe())[0] =  = any_delay_just_p = un_just_all = new_list = jsArray_to_list = symbol_equal_p = (form_use_systemName = newupe())[0] =  = (form_builtin_use_systemName = newupe())[0] =  = (function_builtin_use_systemName = newupe())[0] =  = (lambda_form_builtin_systemName = newupe())[0] =  = (quote_form_builtin_systemName = newupe())[0] =  = (if_function_builtin_systemName = newupe())[0] =  = (evaluate_function_builtin_systemName = newupe())[0] =  = (apply_function_builtin_systemName = newupe())[0] =  = (equal_p_function_builtin_systemName = newupe())[0] =  = (null_p_function_builtin_systemName = newupe())[0] =  = (symbol_p_function_builtin_systemName = newupe())[0] =  = (construction_tail_function_builtin_systemName = newupe())[0] =  = (construction_head_function_builtin_systemName = newupe())[0] =  = (construction_p_function_builtin_systemName = newupe())[0] =  = (error_p_function_builtin_systemName = newupe())[0] =  = (error_list_function_builtin_systemName = newupe())[0] =  = (error_name_function_builtin_systemName = newupe())[0] =  = (data_p_function_builtin_systemName = newupe())[0] =  = (data_list_function_builtin_systemName = newupe())[0] =  = (data_name_function_builtin_systemName = newupe())[0] =  = (the_world_stopped_v = newupe())[0] =  = (mapping_symbol = newupe())[0] =  = (form_symbol = newupe())[0] =  = (function_symbol = newupe())[0] =  = (system_symbol = newupe())[0] =  = (force_all_rec = newupe())[0] =  = delay_apply_xs = delay_apply_f = delay_apply_p = apply = delay_builtin_func_xs = delay_builtin_func_f = delay_builtin_func_p = builtin_func_apply = delay_builtin_form_xs = delay_builtin_form_f = delay_builtin_form_env = delay_builtin_form_p = builtin_form_apply = delay_evaluate_x = delay_evaluate_env = delay_evaluate_p = evaluate = un_just = just_p = lang_set_do = error_list = error_name = error_p = new_error = data_list = data_name = data_p = new_data = null_p = (null_v = newupe())[0] =  = construction_tail = construction_head = construction_p = new_construction = un_symbol = symbol_p = (delay_apply_t = newupe())[0] =  = (delay_builtin_form_t = newupe())[0] =  = (delay_builtin_func_t = newupe())[0] =  = (delay_evaluate_t = newupe())[0] =  = (just_t = newupe())[0] =  = (error_t = newupe())[0] =  = (data_t = newupe())[0] =  = (null_t = newupe())[0] =  = (construction_t = newupe())[0] =  = ASSERT = ERROR = LuaValue.NIL);(jsbool_equal_p = newupe())[0] = tmp680_679;(simple_print = newupe())[0] = tmp680_679;
    

    (localObject1 = new lang.1()).u0 = this.u0;LuaValue ERROR = (LuaValue)localObject1;
    



    (localObject1 = new lang.2()).u0 = ERROR;LuaValue ASSERT = (LuaValue)localObject1;
    

    Object localObject1 = new lang.3();LuaValue symbol_p = (LuaValue)localObject1;
    

    localObject1 = new lang.4();LuaValue un_symbol = (LuaValue)localObject1;
    

    (localObject1 = new lang.5()).u0 = construction_t;LuaValue new_construction = (LuaValue)localObject1;
    

    (localObject1 = new lang.6()).u0 = construction_t;LuaValue construction_p = (LuaValue)localObject1;
    

    localObject1 = new lang.7();LuaValue construction_head = (LuaValue)localObject1;
    

    localObject1 = new lang.8();LuaValue construction_tail = (LuaValue)localObject1;
    

    (localObject1 = new lang.9()).u0 = null_t;LuaValue null_p = (LuaValue)localObject1;
    

    (localObject1 = new lang.10()).u0 = data_t;LuaValue new_data = (LuaValue)localObject1;
    

    (localObject1 = new lang.11()).u0 = data_t;LuaValue data_p = (LuaValue)localObject1;
    

    localObject1 = new lang.12();LuaValue data_name = (LuaValue)localObject1;
    

    localObject1 = new lang.13();LuaValue data_list = (LuaValue)localObject1;
    

    (localObject1 = new lang.14()).u0 = error_t;LuaValue new_error = (LuaValue)localObject1;
    

    (localObject1 = new lang.15()).u0 = error_t;LuaValue error_p = (LuaValue)localObject1;
    

    localObject1 = new lang.16();LuaValue error_name = (LuaValue)localObject1;
    

    localObject1 = new lang.17();LuaValue error_list = (LuaValue)localObject1;
    







    (localObject1 = new lang.18()).u0 = just_t;LuaValue lang_set_do = (LuaValue)localObject1;
    

    (localObject1 = new lang.19()).u0 = just_t;LuaValue just_p = (LuaValue)localObject1;
    

    localObject1 = new lang.20();LuaValue un_just = (LuaValue)localObject1;
    

    (localObject1 = new lang.21()).u0 = delay_evaluate_t;LuaValue evaluate = (LuaValue)localObject1;
    

    (localObject1 = new lang.22()).u0 = delay_evaluate_t;LuaValue delay_evaluate_p = (LuaValue)localObject1;
    

    localObject1 = new lang.23();LuaValue delay_evaluate_env = (LuaValue)localObject1;
    

    localObject1 = new lang.24();LuaValue delay_evaluate_x = (LuaValue)localObject1;
    

    (localObject1 = new lang.25()).u0 = delay_builtin_form_t;LuaValue builtin_form_apply = (LuaValue)localObject1;
    

    (localObject1 = new lang.26()).u0 = delay_builtin_form_t;LuaValue delay_builtin_form_p = (LuaValue)localObject1;
    

    localObject1 = new lang.27();LuaValue delay_builtin_form_env = (LuaValue)localObject1;
    

    localObject1 = new lang.28();LuaValue delay_builtin_form_f = (LuaValue)localObject1;
    

    localObject1 = new lang.29();LuaValue delay_builtin_form_xs = (LuaValue)localObject1;
    

    (localObject1 = new lang.30()).u0 = delay_builtin_func_t;LuaValue builtin_func_apply = (LuaValue)localObject1;
    

    (localObject1 = new lang.31()).u0 = delay_builtin_func_t;LuaValue delay_builtin_func_p = (LuaValue)localObject1;
    

    localObject1 = new lang.32();LuaValue delay_builtin_func_f = (LuaValue)localObject1;
    

    localObject1 = new lang.33();LuaValue delay_builtin_func_xs = (LuaValue)localObject1;
    

    (localObject1 = new lang.34()).u0 = delay_apply_t;LuaValue apply = (LuaValue)localObject1;
    

    (localObject1 = new lang.35()).u0 = delay_apply_t;LuaValue delay_apply_p = (LuaValue)localObject1;
    

    localObject1 = new lang.36();LuaValue delay_apply_f = (LuaValue)localObject1;
    

    localObject1 = new lang.37();LuaValue delay_apply_xs = (LuaValue)localObject1; void 
    





















      tmp1306_1304 = (localObject1 = new lang.38());tmp1306_1304.u0 = force_all; void tmp1312_1306 = tmp1306_1304;tmp1312_1306.u1 = data_p; void tmp1318_1312 = tmp1312_1306;tmp1318_1312.u2 = force_all_rec; void tmp1324_1318 = tmp1318_1312;tmp1324_1318.u3 = error_p;tmp1324_1318.u4 = construction_p;force_all_rec[0] = localObject1; void 
    









      tmp1353_1351 = (localObject1 = new lang.39());tmp1353_1351.u0 = un_symbol;tmp1353_1351.u1 = lang_set_do;LuaValue symbol_equal_p = (LuaValue)localObject1; void 
    









      tmp1378_1376 = (localObject1 = new lang.40());tmp1378_1376.u0 = null_v;tmp1378_1376.u1 = new_construction;LuaValue jsArray_to_list = (LuaValue)localObject1;
    


    (localObject1 = new lang.41()).u0 = jsArray_to_list;LuaValue new_list = (LuaValue)localObject1; void 
    














      tmp1422_1420 = (localObject1 = new lang.42());tmp1422_1420.u0 = just_p; void tmp1428_1422 = tmp1422_1420;tmp1428_1422.u1 = this.u0; void tmp1436_1428 = tmp1428_1422;tmp1436_1428.u2 = un_just;tmp1436_1428.u3 = lang_set_do;LuaValue un_just_all = (LuaValue)localObject1; void 
    

      tmp1461_1459 = (localObject1 = new lang.43());tmp1461_1459.u0 = just_p; void tmp1467_1461 = tmp1461_1459;tmp1467_1461.u1 = delay_evaluate_p; void tmp1473_1467 = tmp1467_1461;tmp1473_1467.u2 = delay_builtin_form_p; void tmp1479_1473 = tmp1473_1467;tmp1479_1473.u3 = delay_builtin_func_p;tmp1479_1473.u4 = delay_apply_p;LuaValue any_delay_just_p = (LuaValue)localObject1; void 
    





























































































































      tmp1504_1502 = (localObject1 = new lang.44());tmp1504_1502.u0 = lang_set_do; void tmp1510_1504 = tmp1504_1502;tmp1510_1504.u1 = the_world_stopped_v; void tmp1516_1510 = tmp1510_1504;tmp1516_1510.u2 = any_delay_just_p; void tmp1522_1516 = tmp1516_1510;tmp1522_1516.u3 = force_all; void tmp1528_1522 = tmp1522_1516;tmp1528_1522.u4 = this.u0; void tmp1536_1528 = tmp1528_1522;tmp1536_1528.u5 = simple_print; void tmp1542_1536 = tmp1536_1528;tmp1542_1536.u6 = delay_evaluate_p; void tmp1548_1542 = tmp1542_1536;tmp1548_1542.u7 = delay_builtin_func_p; void tmp1554_1548 = tmp1548_1542;tmp1554_1548.u8 = delay_builtin_func_f; void tmp1560_1554 = tmp1554_1548;tmp1560_1554.u9 = delay_builtin_func_xs; void tmp1566_1560 = tmp1560_1554;tmp1566_1560.u10 = data_name_function_builtin_systemName; void tmp1572_1566 = tmp1566_1560;tmp1572_1566.u11 = data_list_function_builtin_systemName; void tmp1578_1572 = tmp1572_1566;tmp1578_1572.u12 = data_p_function_builtin_systemName; void tmp1584_1578 = tmp1578_1572;tmp1584_1578.u13 = error_name_function_builtin_systemName; void tmp1590_1584 = tmp1584_1578;tmp1590_1584.u14 = error_list_function_builtin_systemName; void tmp1596_1590 = tmp1590_1584;tmp1596_1590.u15 = error_p_function_builtin_systemName; void tmp1602_1596 = tmp1596_1590;tmp1602_1596.u16 = construction_p_function_builtin_systemName; void tmp1608_1602 = tmp1602_1596;tmp1608_1602.u17 = construction_head_function_builtin_systemName; void tmp1614_1608 = tmp1608_1602;tmp1614_1608.u18 = construction_tail_function_builtin_systemName; void tmp1620_1614 = tmp1614_1608;tmp1620_1614.u19 = symbol_p_function_builtin_systemName; void tmp1626_1620 = tmp1620_1614;tmp1626_1620.u20 = null_p_function_builtin_systemName; void tmp1632_1626 = tmp1626_1620;tmp1632_1626.u21 = jsbool_equal_p; void tmp1638_1632 = tmp1632_1626;tmp1638_1632.u22 = ASSERT; void tmp1644_1638 = tmp1638_1632;tmp1644_1638.u23 = builtin_func_apply; void tmp1650_1644 = tmp1644_1638;tmp1650_1644.u24 = ERROR; void tmp1655_1650 = tmp1650_1644;tmp1655_1650.u25 = equal_p_function_builtin_systemName; void tmp1661_1655 = tmp1655_1650;tmp1661_1655.u26 = apply_function_builtin_systemName; void tmp1667_1661 = tmp1661_1655;tmp1667_1661.u27 = evaluate_function_builtin_systemName; void tmp1673_1667 = tmp1667_1661;tmp1673_1667.u28 = if_function_builtin_systemName; void tmp1679_1673 = tmp1673_1667;tmp1679_1673.u29 = delay_builtin_form_p; void tmp1685_1679 = tmp1679_1673;tmp1685_1679.u30 = delay_apply_p;tmp1685_1679.u31 = force1;force_all[0] = localObject1; void 
    

















      tmp1714_1712 = (localObject1 = new lang.45());tmp1714_1712.u0 = un_just_all; void tmp1720_1714 = tmp1714_1712;tmp1720_1714.u1 = ASSERT; void tmp1726_1720 = tmp1720_1714;tmp1726_1720.u2 = just_p; void tmp1732_1726 = tmp1726_1720;tmp1732_1726.u3 = delay_evaluate_p; void tmp1738_1732 = tmp1732_1726;tmp1738_1732.u4 = real_evaluate; void tmp1744_1738 = tmp1738_1732;tmp1744_1738.u5 = delay_evaluate_env; void tmp1750_1744 = tmp1744_1738;tmp1750_1744.u6 = delay_evaluate_x; void tmp1756_1750 = tmp1750_1744;tmp1756_1750.u7 = delay_builtin_form_p; void tmp1762_1756 = tmp1756_1750;tmp1762_1756.u8 = real_builtin_form_apply; void tmp1768_1762 = tmp1762_1756;tmp1768_1762.u9 = delay_builtin_form_env; void tmp1774_1768 = tmp1768_1762;tmp1774_1768.u10 = delay_builtin_form_f; void tmp1780_1774 = tmp1774_1768;tmp1780_1774.u11 = delay_builtin_form_xs; void tmp1786_1780 = tmp1780_1774;tmp1786_1780.u12 = delay_builtin_func_p; void tmp1792_1786 = tmp1786_1780;tmp1792_1786.u13 = real_builtin_func_apply; void tmp1798_1792 = tmp1792_1786;tmp1798_1792.u14 = delay_builtin_func_f; void tmp1804_1798 = tmp1798_1792;tmp1804_1798.u15 = delay_builtin_func_xs; void tmp1810_1804 = tmp1804_1798;tmp1810_1804.u16 = delay_apply_p; void tmp1816_1810 = tmp1810_1804;tmp1816_1810.u17 = real_apply; void tmp1822_1816 = tmp1816_1810;tmp1822_1816.u18 = delay_apply_f; void tmp1828_1822 = tmp1822_1816;tmp1828_1822.u19 = delay_apply_xs;tmp1828_1822.u20 = lang_set_do;force1[0] = localObject1;
    


























    (localObject1 = new lang.46()).u0 = jsbool_equal_p;LuaValue env_set = (LuaValue)localObject1;
    










    (localObject1 = new lang.47()).u0 = jsbool_equal_p;LuaValue env_get = (LuaValue)localObject1; void 
    










      tmp1895_1893 = (localObject1 = new lang.48());tmp1895_1893.u0 = jsbool_equal_p;tmp1895_1893.u1 = ERROR;LuaValue must_env_get = (LuaValue)localObject1; void 
    









      tmp1919_1917 = (localObject1 = new lang.49());tmp1919_1917.u0 = null_v; void tmp1925_1919 = tmp1919_1917;tmp1925_1919.u1 = new_construction; void tmp1931_1925 = tmp1925_1919;tmp1931_1925.u2 = new_list; void tmp1937_1931 = tmp1931_1925;tmp1937_1931.u3 = new_data;tmp1937_1931.u4 = mapping_symbol;LuaValue env2val = (LuaValue)localObject1;
    







    localObject1 = new lang.50();LuaValue env_foreach = (LuaValue)localObject1; void 
    












































































































      tmp1975_1973 = (localObject1 = new lang.51());tmp1975_1973.u0 = force1; void tmp1981_1975 = tmp1975_1973;tmp1981_1975.u1 = any_delay_just_p; void tmp1987_1981 = tmp1981_1975;tmp1987_1981.u2 = evaluate; void tmp1993_1987 = tmp1987_1981;tmp1993_1987.u3 = new_error; void tmp1999_1993 = tmp1993_1987;tmp1999_1993.u4 = system_symbol; void tmp2005_1999 = tmp1999_1993;tmp2005_1999.u5 = new_list; void tmp2011_2005 = tmp2005_1999;tmp2011_2005.u6 = function_builtin_use_systemName; void tmp2017_2011 = tmp2011_2005;tmp2017_2011.u7 = evaluate_function_builtin_systemName; void tmp2023_2017 = tmp2017_2011;tmp2023_2017.u8 = env2val; void tmp2029_2023 = tmp2023_2017;tmp2029_2023.u9 = construction_p; void tmp2035_2029 = tmp2029_2023;tmp2035_2029.u10 = null_p; void tmp2041_2035 = tmp2035_2029;tmp2041_2035.u11 = this.u0; void tmp2049_2041 = tmp2041_2035;tmp2049_2041.u12 = construction_head; void tmp2055_2049 = tmp2049_2041;tmp2055_2049.u13 = construction_tail; void tmp2061_2055 = tmp2055_2049;tmp2061_2055.u14 = jsbool_equal_p; void tmp2067_2061 = tmp2061_2055;tmp2067_2061.u15 = form_builtin_use_systemName; void tmp2073_2067 = tmp2067_2061;tmp2073_2067.u16 = builtin_form_apply; void tmp2079_2073 = tmp2073_2067;tmp2079_2073.u17 = form_use_systemName; void tmp2085_2079 = tmp2079_2073;tmp2085_2079.u18 = force_all; void tmp2091_2085 = tmp2085_2079;tmp2091_2085.u19 = data_p; void tmp2097_2091 = tmp2091_2085;tmp2097_2091.u20 = data_name; void tmp2103_2097 = tmp2097_2091;tmp2103_2097.u21 = symbol_p; void tmp2109_2103 = tmp2103_2097;tmp2109_2103.u22 = symbol_equal_p; void tmp2115_2109 = tmp2109_2103;tmp2115_2109.u23 = form_symbol; void tmp2121_2115 = tmp2115_2109;tmp2121_2115.u24 = data_list; void tmp2127_2121 = tmp2121_2115;tmp2127_2121.u25 = apply; void tmp2133_2127 = tmp2127_2121;tmp2133_2127.u26 = builtin_func_apply; void tmp2139_2133 = tmp2133_2127;tmp2139_2133.u27 = name_p; void tmp2145_2139 = tmp2139_2133;tmp2145_2139.u28 = env_get; void tmp2151_2145 = tmp2145_2139;tmp2151_2145.u29 = error_p;tmp2151_2145.u30 = ERROR;real_evaluate[0] = localObject1; void 
    

      tmp2179_2177 = (localObject1 = new lang.52());tmp2179_2177.u0 = symbol_p;tmp2179_2177.u1 = data_p;name_p[0] = localObject1; void 
    

























































      tmp2208_2206 = (localObject1 = new lang.53());tmp2208_2206.u0 = new_error; void tmp2214_2208 = tmp2208_2206;tmp2214_2208.u1 = system_symbol; void tmp2220_2214 = tmp2214_2208;tmp2220_2214.u2 = new_list; void tmp2226_2220 = tmp2220_2214;tmp2226_2220.u3 = function_builtin_use_systemName; void tmp2232_2226 = tmp2226_2220;tmp2232_2226.u4 = apply_function_builtin_systemName; void tmp2238_2232 = tmp2232_2226;tmp2238_2232.u5 = jsArray_to_list; void tmp2244_2238 = tmp2238_2232;tmp2244_2238.u6 = force1; void tmp2250_2244 = tmp2244_2238;tmp2250_2244.u7 = any_delay_just_p; void tmp2256_2250 = tmp2250_2244;tmp2256_2250.u8 = apply; void tmp2262_2256 = tmp2256_2250;tmp2262_2256.u9 = data_p; void tmp2268_2262 = tmp2262_2256;tmp2268_2262.u10 = force_all; void tmp2274_2268 = tmp2268_2262;tmp2274_2268.u11 = data_name; void tmp2280_2274 = tmp2274_2268;tmp2280_2274.u12 = symbol_p; void tmp2286_2280 = tmp2280_2274;tmp2286_2280.u13 = symbol_equal_p; void tmp2292_2286 = tmp2286_2280;tmp2292_2286.u14 = function_symbol; void tmp2298_2292 = tmp2292_2286;tmp2298_2292.u15 = data_list; void tmp2304_2298 = tmp2298_2292;tmp2304_2298.u16 = construction_p; void tmp2310_2304 = tmp2304_2298;tmp2310_2304.u17 = force_all_rec; void tmp2316_2310 = tmp2310_2304;tmp2316_2310.u18 = construction_head; void tmp2322_2316 = tmp2316_2310;tmp2322_2316.u19 = construction_tail; void tmp2328_2322 = tmp2322_2316;tmp2328_2322.u20 = null_p; void tmp2334_2328 = tmp2328_2322;tmp2334_2328.u21 = env_null_v; void tmp2340_2334 = tmp2334_2328;tmp2340_2334.u22 = name_p; void tmp2346_2340 = tmp2340_2334;tmp2346_2340.u23 = null_v; void tmp2352_2346 = tmp2346_2340;tmp2352_2346.u24 = new_construction; void tmp2358_2352 = tmp2352_2346;tmp2358_2352.u25 = env_set;tmp2358_2352.u26 = evaluate;real_apply[0] = localObject1; void 
    























      tmp2387_2385 = (localObject1 = new lang.54());tmp2387_2385.u0 = new_error; void tmp2393_2387 = tmp2387_2385;tmp2393_2387.u1 = system_symbol; void tmp2399_2393 = tmp2393_2387;tmp2399_2393.u2 = new_list; void tmp2405_2399 = tmp2399_2393;tmp2405_2399.u3 = function_builtin_use_systemName; void tmp2411_2405 = tmp2405_2399;tmp2411_2405.u4 = jsArray_to_list; void tmp2417_2411 = tmp2411_2405;tmp2417_2411.u5 = real_builtin_func_apply_s; void tmp2423_2417 = tmp2417_2411;tmp2423_2417.u6 = jsbool_equal_p;tmp2423_2417.u7 = ERROR;real_builtin_func_apply[0] = localObject1; void 
    













      tmp2451_2449 = (localObject1 = new lang.55());tmp2451_2449.u0 = new_error; void tmp2457_2451 = tmp2451_2449;tmp2457_2451.u1 = system_symbol; void tmp2463_2457 = tmp2457_2451;tmp2463_2457.u2 = new_list; void tmp2469_2463 = tmp2463_2457;tmp2469_2463.u3 = form_builtin_use_systemName; void tmp2475_2469 = tmp2469_2463;tmp2475_2469.u4 = env2val; void tmp2481_2475 = tmp2475_2469;tmp2481_2475.u5 = jsArray_to_list; void tmp2487_2481 = tmp2481_2475;tmp2487_2481.u6 = jsbool_equal_p; void tmp2493_2487 = tmp2487_2481;tmp2493_2487.u7 = quote_form_builtin_systemName; void tmp2499_2493 = tmp2493_2487;tmp2499_2493.u8 = lambda_form_builtin_systemName;tmp2499_2493.u9 = new_lambda;real_builtin_form_apply[0] = localObject1; void 
    

































































      tmp2528_2526 = (localObject1 = new lang.56());tmp2528_2526.u0 = new_error; void tmp2534_2528 = tmp2528_2526;tmp2534_2528.u1 = system_symbol; void tmp2540_2534 = tmp2534_2528;tmp2540_2534.u2 = new_list; void tmp2546_2540 = tmp2540_2534;tmp2546_2540.u3 = form_builtin_use_systemName; void tmp2552_2546 = tmp2546_2540;tmp2552_2546.u4 = env2val; void tmp2558_2552 = tmp2552_2546;tmp2558_2552.u5 = lambda_form_builtin_systemName; void tmp2564_2558 = tmp2558_2552;tmp2564_2558.u6 = jsArray_to_list; void tmp2570_2564 = tmp2564_2558;tmp2570_2564.u7 = quote_form_builtin_systemName; void tmp2576_2570 = tmp2570_2564;tmp2576_2570.u8 = force_all_rec; void tmp2582_2576 = tmp2576_2570;tmp2582_2576.u9 = null_p; void tmp2588_2582 = tmp2582_2576;tmp2588_2582.u10 = name_p; void tmp2594_2588 = tmp2588_2582;tmp2594_2588.u11 = this.u0; void tmp2602_2594 = tmp2594_2588;tmp2602_2594.u12 = null_v; void tmp2608_2602 = tmp2602_2594;tmp2608_2602.u13 = construction_p; void tmp2614_2608 = tmp2608_2602;tmp2614_2608.u14 = construction_head; void tmp2620_2614 = tmp2614_2608;tmp2620_2614.u15 = construction_tail; void tmp2626_2620 = tmp2620_2614;tmp2626_2620.u16 = env_foreach; void tmp2632_2626 = tmp2626_2620;tmp2632_2626.u17 = jsbool_equal_p; void tmp2638_2632 = tmp2632_2626;tmp2638_2632.u18 = new_construction; void tmp2644_2638 = tmp2638_2632;tmp2644_2638.u19 = must_env_get; void tmp2650_2644 = tmp2644_2638;tmp2650_2644.u20 = new_data;tmp2650_2644.u21 = function_symbol;new_lambda[0] = localObject1; void 
    














































      tmp2679_2677 = (localObject1 = new lang.57());tmp2679_2677.u0 = force_all; void tmp2685_2679 = tmp2679_2677;tmp2685_2679.u1 = jsbool_equal_p; void tmp2691_2685 = tmp2685_2679;tmp2691_2685.u2 = lang_set_do; void tmp2697_2691 = tmp2691_2685;tmp2697_2691.u3 = null_p; void tmp2703_2697 = tmp2697_2691;tmp2703_2697.u4 = null_v; void tmp2709_2703 = tmp2703_2697;tmp2709_2703.u5 = symbol_p; void tmp2715_2709 = tmp2709_2703;tmp2715_2709.u6 = symbol_equal_p; void tmp2721_2715 = tmp2715_2709;tmp2721_2715.u7 = construction_p; void tmp2727_2721 = tmp2721_2715;tmp2727_2721.u8 = construction_head; void tmp2733_2727 = tmp2727_2721;tmp2733_2727.u9 = construction_tail; void tmp2739_2733 = tmp2733_2727;tmp2739_2733.u10 = error_p; void tmp2745_2739 = tmp2739_2733;tmp2745_2739.u11 = error_name; void tmp2751_2745 = tmp2745_2739;tmp2751_2745.u12 = error_list; void tmp2757_2751 = tmp2751_2745;tmp2757_2751.u13 = data_p; void tmp2763_2757 = tmp2757_2751;tmp2763_2757.u14 = data_name; void tmp2769_2763 = tmp2763_2757;tmp2769_2763.u15 = data_list;tmp2769_2763.u16 = ERROR;jsbool_equal_p[0] = localObject1; void 
    



































      tmp2797_2795 = (localObject1 = new lang.58());tmp2797_2795.u0 = un_just_all; void tmp2803_2797 = tmp2797_2795;tmp2803_2797.u1 = null_p; void tmp2809_2803 = tmp2803_2797;tmp2809_2803.u2 = construction_p; void tmp2815_2809 = tmp2809_2803;tmp2815_2809.u3 = simple_print; void tmp2821_2815 = tmp2815_2809;tmp2821_2815.u4 = construction_head; void tmp2827_2821 = tmp2821_2815;tmp2827_2821.u5 = construction_tail; void tmp2833_2827 = tmp2827_2821;tmp2833_2827.u6 = data_p; void tmp2839_2833 = tmp2833_2827;tmp2839_2833.u7 = new_construction; void tmp2845_2839 = tmp2839_2833;tmp2845_2839.u8 = data_name; void tmp2851_2845 = tmp2845_2839;tmp2851_2845.u9 = data_list; void tmp2857_2851 = tmp2851_2845;tmp2857_2851.u10 = error_p; void tmp2863_2857 = tmp2857_2851;tmp2863_2857.u11 = error_name; void tmp2869_2863 = tmp2863_2857;tmp2869_2863.u12 = error_list; void tmp2875_2869 = tmp2869_2863;tmp2875_2869.u13 = symbol_p; void tmp2881_2875 = tmp2875_2869;tmp2881_2875.u14 = un_symbol; void tmp2887_2881 = tmp2881_2875;tmp2887_2881.u15 = delay_evaluate_p; void tmp2893_2887 = tmp2887_2881;tmp2893_2887.u16 = env2val; void tmp2899_2893 = tmp2893_2887;tmp2899_2893.u17 = delay_evaluate_env; void tmp2905_2899 = tmp2899_2893;tmp2905_2899.u18 = delay_evaluate_x; void tmp2911_2905 = tmp2905_2899;tmp2911_2905.u19 = delay_builtin_func_p; void tmp2917_2911 = tmp2911_2905;tmp2917_2911.u20 = delay_builtin_func_f; void tmp2923_2917 = tmp2917_2911;tmp2923_2917.u21 = jsArray_to_list; void tmp2929_2923 = tmp2923_2917;tmp2929_2923.u22 = delay_builtin_func_xs; void tmp2935_2929 = tmp2929_2923;tmp2935_2929.u23 = delay_builtin_form_p; void tmp2941_2935 = tmp2935_2929;tmp2941_2935.u24 = delay_builtin_form_env; void tmp2947_2941 = tmp2941_2935;tmp2947_2941.u25 = delay_builtin_form_f; void tmp2953_2947 = tmp2947_2941;tmp2953_2947.u26 = delay_builtin_form_xs; void tmp2959_2953 = tmp2953_2947;tmp2959_2953.u27 = delay_apply_p; void tmp2965_2959 = tmp2959_2953;tmp2965_2959.u28 = delay_apply_f; void tmp2971_2965 = tmp2965_2959;tmp2971_2965.u29 = delay_apply_xs;tmp2971_2965.u30 = ERROR;simple_print[0] = localObject1;
    LuaValue symbol_t = k1;
    construction_t[0] = k2;
    null_t[0] = k3;
    data_t[0] = k4;
    error_t[0] = k5;
    just_t[0] = k6;
    delay_evaluate_t[0] = k7;
    delay_builtin_func_t[0] = k8;
    delay_builtin_form_t[0] = k9;
    delay_apply_t[0] = k10;
    LuaValue new_symbol = LuaValue.NIL;
    

    (localObject2 = new lang.59()).u0 = symbol_t;new_symbol = (LuaValue)localObject2;
    ((LuaValue)exports).set(k11, new_symbol);
    ((LuaValue)exports).set(k12, symbol_p);
    ((LuaValue)exports).set(k13, un_symbol);
    ((LuaValue)exports).set(k14, new_construction);
    ((LuaValue)exports).set(k15, construction_p);
    ((LuaValue)exports).set(k16, construction_head);
    ((LuaValue)exports).set(k17, construction_tail);
    Object localObject2 = LuaValue.tableOf(1, 0);LuaValue localLuaValue1 = null_t[0]; Object tmp3177_3175 = localObject2;tmp3177_3175.rawset(1, localLuaValue1);tmp3177_3175;null_v[0] = localObject2;
    ((LuaValue)exports).set(k18, null_v[0]);
    ((LuaValue)exports).set(k19, null_p);
    ((LuaValue)exports).set(k20, new_data);
    ((LuaValue)exports).set(k21, data_p);
    ((LuaValue)exports).set(k22, data_name);
    ((LuaValue)exports).set(k23, data_list);
    ((LuaValue)exports).set(k24, new_error);
    ((LuaValue)exports).set(k25, error_p);
    ((LuaValue)exports).set(k26, error_name);
    ((LuaValue)exports).set(k27, error_list);
    ((LuaValue)exports).set(k28, evaluate);
    ((LuaValue)exports).set(k29, apply);
    ((LuaValue)exports).set(k30, force_all_rec[0]);
    localObject2 = new_symbol;localLuaValue1 = k31;localObject2 = ((LuaValue)localObject2).call(localLuaValue1);system_symbol[0] = localObject2;
    localObject2 = new_symbol;localLuaValue1 = k32;LuaValue name_symbol = name_symbol.call(localLuaValue1);
    localLuaValue1 = new_symbol;LuaValue localLuaValue2 = k33;localLuaValue1 = localLuaValue1.call(localLuaValue2);function_symbol[0] = localLuaValue1;
    localLuaValue1 = new_symbol;localLuaValue2 = k34;localLuaValue1 = localLuaValue1.call(localLuaValue2);form_symbol[0] = localLuaValue1;
    localLuaValue1 = new_symbol;localLuaValue2 = k35;LuaValue equal_symbol = equal_symbol.call(localLuaValue2);
    localLuaValue2 = new_symbol;LuaValue localLuaValue3 = k36;LuaValue evaluate_sym = evaluate_sym.call(localLuaValue3);
    localLuaValue3 = new_symbol;LuaValue localLuaValue4 = k37;LuaValue theThing_symbol = theThing_symbol.call(localLuaValue4);
    localLuaValue4 = new_symbol;LuaValue localLuaValue5 = k38;LuaValue something_symbol = something_symbol.call(localLuaValue5);
    localLuaValue5 = new_symbol;LuaValue localLuaValue6 = k39;localLuaValue5 = localLuaValue5.call(localLuaValue6);mapping_symbol[0] = localLuaValue5;
    localLuaValue5 = new_symbol;localLuaValue6 = k40;LuaValue if_symbol = if_symbol.call(localLuaValue6);
    localLuaValue6 = new_symbol;LuaValue localLuaValue7 = k41;LuaValue typeAnnotation_symbol = typeAnnotation_symbol.call(localLuaValue7);
    localLuaValue7 = new_symbol;LuaValue localLuaValue8 = k42;LuaValue isOrNot_symbol = isOrNot_symbol.call(localLuaValue8);
    localLuaValue8 = new_symbol;LuaValue localLuaValue9 = k43;LuaValue sub_symbol = sub_symbol.call(localLuaValue9);
    localLuaValue9 = new_symbol;LuaValue localLuaValue10 = k44;LuaValue true_symbol = true_symbol.call(localLuaValue10);
    localLuaValue10 = new_symbol;LuaValue localLuaValue11 = k45;LuaValue false_symbol = false_symbol.call(localLuaValue11);
    localLuaValue11 = new_symbol;LuaValue localLuaValue12 = k46;LuaValue quote_symbol = quote_symbol.call(localLuaValue12);
    localLuaValue12 = new_symbol;LuaValue localLuaValue13 = k47;LuaValue apply_symbol = apply_symbol.call(localLuaValue13);
    localLuaValue13 = new_symbol;LuaValue localLuaValue14 = k48;LuaValue null_symbol = null_symbol.call(localLuaValue14);
    localLuaValue14 = new_symbol;LuaValue localLuaValue15 = k49;LuaValue construction_symbol = construction_symbol.call(localLuaValue15);
    localLuaValue15 = new_symbol;LuaValue localLuaValue16 = k50;LuaValue data_symbol = data_symbol.call(localLuaValue16);
    localLuaValue16 = new_symbol;LuaValue localLuaValue17 = k51;LuaValue error_symbol = error_symbol.call(localLuaValue17);
    localLuaValue17 = new_symbol;LuaValue localLuaValue18 = k52;LuaValue symbol_symbol = symbol_symbol.call(localLuaValue18);
    localLuaValue18 = new_symbol;LuaValue localLuaValue19 = k53;LuaValue list_symbol = list_symbol.call(localLuaValue19);
    localLuaValue19 = new_symbol;LuaValue localLuaValue20 = k54;LuaValue head_symbol = head_symbol.call(localLuaValue20);
    localLuaValue20 = new_symbol;LuaValue localLuaValue21 = k55;LuaValue tail_symbol = tail_symbol.call(localLuaValue21);
    localLuaValue21 = new_symbol;LuaValue localLuaValue22 = k56;LuaValue thing_symbol = thing_symbol.call(localLuaValue22);
    localLuaValue22 = new_symbol;LuaValue localLuaValue23 = k57;LuaValue theWorldStopped_symbol = theWorldStopped_symbol.call(localLuaValue23);
    localLuaValue23 = new_symbol;LuaValue localLuaValue24 = k58;LuaValue effect_symbol = effect_symbol.call(localLuaValue24);
    localLuaValue24 = new_symbol;LuaValue localLuaValue25 = k59;LuaValue sequentialWordFormation_symbol = sequentialWordFormation_symbol.call(localLuaValue25);
    localLuaValue25 = new_symbol;LuaValue localLuaValue26 = k60;LuaValue inputOutput_symbol = inputOutput_symbol.call(localLuaValue26);
    ((LuaValue)exports).set(k61, system_symbol[0]);
    ((LuaValue)exports).set(k62, name_symbol);
    ((LuaValue)exports).set(k63, function_symbol[0]);
    ((LuaValue)exports).set(k64, form_symbol[0]);
    ((LuaValue)exports).set(k65, equal_symbol);
    ((LuaValue)exports).set(k66, evaluate_sym);
    ((LuaValue)exports).set(k67, theThing_symbol);
    ((LuaValue)exports).set(k68, something_symbol);
    ((LuaValue)exports).set(k69, mapping_symbol[0]);
    ((LuaValue)exports).set(k70, if_symbol);
    ((LuaValue)exports).set(k71, typeAnnotation_symbol);
    ((LuaValue)exports).set(k72, isOrNot_symbol);
    ((LuaValue)exports).set(k73, sub_symbol);
    ((LuaValue)exports).set(k74, true_symbol);
    ((LuaValue)exports).set(k75, false_symbol);
    ((LuaValue)exports).set(k76, quote_symbol);
    ((LuaValue)exports).set(k77, apply_symbol);
    ((LuaValue)exports).set(k78, null_symbol);
    ((LuaValue)exports).set(k79, construction_symbol);
    ((LuaValue)exports).set(k80, data_symbol);
    ((LuaValue)exports).set(k81, error_symbol);
    ((LuaValue)exports).set(k82, symbol_symbol);
    ((LuaValue)exports).set(k83, list_symbol);
    ((LuaValue)exports).set(k84, head_symbol);
    ((LuaValue)exports).set(k85, tail_symbol);
    ((LuaValue)exports).set(k86, thing_symbol);
    ((LuaValue)exports).set(k87, theWorldStopped_symbol);
    ((LuaValue)exports).set(k88, effect_symbol);
    ((LuaValue)exports).set(k89, sequentialWordFormation_symbol);
    ((LuaValue)exports).set(k90, inputOutput_symbol);
    localLuaValue26 = new_error;Object localObject3 = system_symbol[0];Object localObject4 = new_list;Object localObject5 = theWorldStopped_symbol;Object localObject6 = something_symbol;org.luaj.vm2.Varargs v = ((LuaValue)localObject4).invoke((LuaValue)localObject5, (org.luaj.vm2.Varargs)localObject6);localLuaValue26 = localLuaValue26.invoke(LuaValue.varargsOf(new LuaValue[] { localObject3 }, v)).arg1();the_world_stopped_v[0] = localLuaValue26;
    LuaValue systemName_make = LuaValue.NIL; void 
    

      tmp4244_4242 = (localObject3 = new lang.60());tmp4244_4242.u0 = new_data; void tmp4250_4244 = tmp4244_4242;tmp4250_4244.u1 = name_symbol; void tmp4256_4250 = tmp4250_4244;tmp4256_4250.u2 = new_list;tmp4256_4250.u3 = system_symbol;systemName_make = make_builtin_f_new_sym_f;
    LuaValue make_builtin_f_new_sym_f = LuaValue.NIL; void 
    

      tmp4286_4284 = (localObject4 = new lang.61());tmp4286_4284.u0 = systemName_make; void tmp4292_4286 = tmp4286_4284;tmp4292_4286.u1 = new_list; void tmp4298_4292 = tmp4292_4286;tmp4298_4292.u2 = typeAnnotation_symbol; void tmp4304_4298 = tmp4298_4292;tmp4304_4298.u3 = function_symbol; void tmp4310_4304 = tmp4304_4298;tmp4310_4304.u4 = something_symbol;tmp4310_4304.u5 = theThing_symbol;make_builtin_f_new_sym_f = make_builtin_f_get_sym_f;
    LuaValue make_builtin_f_get_sym_f = LuaValue.NIL; void 
    

      tmp4340_4338 = (localObject5 = new lang.62());tmp4340_4338.u0 = systemName_make; void tmp4346_4340 = tmp4340_4338;tmp4346_4340.u1 = new_list; void tmp4352_4346 = tmp4346_4340;tmp4352_4346.u2 = typeAnnotation_symbol; void tmp4358_4352 = tmp4352_4346;tmp4358_4352.u3 = function_symbol;tmp4358_4352.u4 = something_symbol;make_builtin_f_get_sym_f = (LuaValue)make_builtin_f_p_sym_f;
    Object make_builtin_f_p_sym_f = LuaValue.NIL; void 
    

      tmp4388_4386 = (localObject6 = new lang.63());tmp4388_4386.u0 = systemName_make; void tmp4394_4388 = tmp4388_4386;tmp4394_4388.u1 = new_list; void tmp4400_4394 = tmp4394_4388;tmp4400_4394.u2 = typeAnnotation_symbol; void tmp4406_4400 = tmp4400_4394;tmp4406_4400.u3 = function_symbol; void tmp4412_4406 = tmp4406_4400;tmp4412_4406.u4 = isOrNot_symbol;tmp4412_4406.u5 = something_symbol;make_builtin_f_p_sym_f = localObject6;
    localObject6 = make_builtin_f_new_sym_f;Object localObject7 = data_symbol;LuaValue new_data_function_builtin_systemName = new_data_function_builtin_systemName.call((LuaValue)localObject7);
    localObject7 = make_builtin_f_get_sym_f;Object localObject8 = data_symbol;Object localObject9 = name_symbol;localObject7 = ((LuaValue)localObject7).call((LuaValue)localObject8, (LuaValue)localObject9);data_name_function_builtin_systemName[0] = localObject7;
    localObject7 = make_builtin_f_get_sym_f;localObject8 = data_symbol;localObject9 = list_symbol;localObject7 = ((LuaValue)localObject7).call((LuaValue)localObject8, (LuaValue)localObject9);data_list_function_builtin_systemName[0] = localObject7;
    localObject7 = make_builtin_f_p_sym_f;localObject8 = data_symbol;localObject7 = ((LuaValue)localObject7).call((LuaValue)localObject8);data_p_function_builtin_systemName[0] = localObject7;
    localObject7 = make_builtin_f_new_sym_f;localObject8 = error_symbol;LuaValue new_error_function_builtin_systemName = new_error_function_builtin_systemName.call((LuaValue)localObject8);
    localObject8 = make_builtin_f_get_sym_f;localObject9 = error_symbol;LuaValue localLuaValue27 = name_symbol;localObject8 = ((LuaValue)localObject8).call((LuaValue)localObject9, localLuaValue27);error_name_function_builtin_systemName[0] = localObject8;
    localObject8 = make_builtin_f_get_sym_f;localObject9 = error_symbol;localLuaValue27 = list_symbol;localObject8 = ((LuaValue)localObject8).call((LuaValue)localObject9, localLuaValue27);error_list_function_builtin_systemName[0] = localObject8;
    localObject8 = make_builtin_f_p_sym_f;localObject9 = error_symbol;localObject8 = ((LuaValue)localObject8).call((LuaValue)localObject9);error_p_function_builtin_systemName[0] = localObject8;
    localObject8 = make_builtin_f_new_sym_f;localObject9 = construction_symbol;LuaValue new_construction_function_builtin_systemName = new_construction_function_builtin_systemName.call((LuaValue)localObject9);
    localObject9 = make_builtin_f_p_sym_f;localLuaValue27 = construction_symbol;localObject9 = ((LuaValue)localObject9).call(localLuaValue27);construction_p_function_builtin_systemName[0] = localObject9;
    localObject9 = make_builtin_f_get_sym_f;localLuaValue27 = construction_symbol;LuaValue localLuaValue28 = head_symbol;localObject9 = ((LuaValue)localObject9).call(localLuaValue27, localLuaValue28);construction_head_function_builtin_systemName[0] = localObject9;
    localObject9 = make_builtin_f_get_sym_f;localLuaValue27 = construction_symbol;localLuaValue28 = tail_symbol;localObject9 = ((LuaValue)localObject9).call(localLuaValue27, localLuaValue28);construction_tail_function_builtin_systemName[0] = localObject9;
    localObject9 = make_builtin_f_p_sym_f;localLuaValue27 = symbol_symbol;localObject9 = ((LuaValue)localObject9).call(localLuaValue27);symbol_p_function_builtin_systemName[0] = localObject9;
    localObject9 = make_builtin_f_p_sym_f;localLuaValue27 = null_symbol;localObject9 = ((LuaValue)localObject9).call(localLuaValue27);null_p_function_builtin_systemName[0] = localObject9;
    localObject9 = systemName_make;localLuaValue27 = new_list;localLuaValue28 = typeAnnotation_symbol;LuaValue localLuaValue29 = function_symbol[0];Object localObject10 = new_list;Object localObject11 = isOrNot_symbol;Object localObject12 = equal_symbol;v = ((LuaValue)localObject10).invoke((LuaValue)localObject11, (org.luaj.vm2.Varargs)localObject12);v = localLuaValue27.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue28, localLuaValue29 }, v));localObject9 = ((LuaValue)localObject9).invoke(v.subargs(1)).arg1();equal_p_function_builtin_systemName[0] = localObject9;
    localObject9 = systemName_make;localLuaValue27 = new_list;localLuaValue28 = typeAnnotation_symbol;localLuaValue29 = new_list;localObject10 = function_symbol[0];localObject11 = new_construction;localObject12 = function_symbol[0];Object localObject13 = something_symbol;localObject11 = ((LuaValue)localObject11).call((LuaValue)localObject12, (LuaValue)localObject13);localObject12 = something_symbol;localLuaValue29 = localLuaValue29.call((LuaValue)localObject10, (LuaValue)localObject11, (LuaValue)localObject12);localObject10 = apply_symbol;v = localLuaValue27.invoke(localLuaValue28, localLuaValue29, (org.luaj.vm2.Varargs)localObject10);localObject9 = ((LuaValue)localObject9).invoke(v.subargs(1)).arg1();apply_function_builtin_systemName[0] = localObject9;
    localObject9 = systemName_make;localLuaValue27 = new_list;localLuaValue28 = typeAnnotation_symbol;localLuaValue29 = function_symbol[0];localObject10 = evaluate_sym;v = localLuaValue27.invoke(localLuaValue28, localLuaValue29, (org.luaj.vm2.Varargs)localObject10);localObject9 = ((LuaValue)localObject9).invoke(v.subargs(1)).arg1();evaluate_function_builtin_systemName[0] = localObject9;
    localObject9 = make_builtin_f_get_sym_f;localLuaValue27 = list_symbol;localLuaValue28 = new_list;localLuaValue29 = typeAnnotation_symbol;localObject10 = thing_symbol;localObject11 = something_symbol;v = localLuaValue28.invoke(localLuaValue29, (LuaValue)localObject10, (org.luaj.vm2.Varargs)localObject11);LuaValue list_chooseOne_function_builtin_systemName = list_chooseOne_function_builtin_systemName.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue27 }, v)).arg1();
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = typeAnnotation_symbol;localObject10 = function_symbol[0];localObject11 = if_symbol;v = localLuaValue28.invoke(localLuaValue29, (LuaValue)localObject10, (org.luaj.vm2.Varargs)localObject11);localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();if_function_builtin_systemName[0] = localLuaValue27;
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = typeAnnotation_symbol;localObject10 = form_symbol[0];localObject11 = quote_symbol;v = localLuaValue28.invoke(localLuaValue29, (LuaValue)localObject10, (org.luaj.vm2.Varargs)localObject11);localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();quote_form_builtin_systemName[0] = localLuaValue27;
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = typeAnnotation_symbol;localObject10 = new_list;localObject11 = form_symbol[0];localObject12 = new_list;localObject13 = function_symbol[0];LuaValue s139 = something_symbol;Object localObject14 = function_symbol[0];v = ((LuaValue)localObject12).invoke((LuaValue)localObject13, s139, (org.luaj.vm2.Varargs)localObject14);localObject10 = ((LuaValue)localObject10).invoke(LuaValue.varargsOf(new LuaValue[] { localObject11 }, v)).arg1();localObject11 = theThing_symbol;v = localLuaValue28.invoke(localLuaValue29, (LuaValue)localObject10, (org.luaj.vm2.Varargs)localObject11);localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();lambda_form_builtin_systemName[0] = localLuaValue27;
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = form_symbol[0];localObject10 = new_list;localObject11 = system_symbol[0];localObject12 = function_symbol[0];v = ((LuaValue)localObject10).invoke((LuaValue)localObject11, (org.luaj.vm2.Varargs)localObject12);v = localLuaValue28.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue29 }, v));localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();function_builtin_use_systemName[0] = localLuaValue27;
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = form_symbol[0];localObject10 = new_list;localObject11 = system_symbol[0];localObject12 = form_symbol[0];v = ((LuaValue)localObject10).invoke((LuaValue)localObject11, (org.luaj.vm2.Varargs)localObject12);v = localLuaValue28.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue29 }, v));localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();form_builtin_use_systemName[0] = localLuaValue27;
    localLuaValue27 = systemName_make;localLuaValue28 = new_list;localLuaValue29 = form_symbol[0];localObject10 = form_symbol[0];v = localLuaValue28.invoke(localLuaValue29, (org.luaj.vm2.Varargs)localObject10);localLuaValue27 = localLuaValue27.invoke(v.subargs(1)).arg1();form_use_systemName[0] = localLuaValue27;
    ((LuaValue)exports).set(k91, new_data_function_builtin_systemName);
    ((LuaValue)exports).set(k92, data_name_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k93, data_list_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k94, data_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k95, new_error_function_builtin_systemName);
    ((LuaValue)exports).set(k96, error_name_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k97, error_list_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k98, error_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k99, new_construction_function_builtin_systemName);
    ((LuaValue)exports).set(k100, construction_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k101, construction_head_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k102, construction_tail_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k103, symbol_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k104, null_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k105, equal_p_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k106, apply_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k107, evaluate_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k108, list_chooseOne_function_builtin_systemName);
    ((LuaValue)exports).set(k109, if_function_builtin_systemName[0]);
    ((LuaValue)exports).set(k110, quote_form_builtin_systemName[0]);
    ((LuaValue)exports).set(k111, lambda_form_builtin_systemName[0]);
    ((LuaValue)exports).set(k112, function_builtin_use_systemName[0]);
    ((LuaValue)exports).set(k113, form_builtin_use_systemName[0]);
    ((LuaValue)exports).set(k114, form_use_systemName[0]);
    localLuaValue27 = new_data;localLuaValue28 = false_symbol;localLuaValue29 = new_list;v = localLuaValue29.invoke();LuaValue false_v = false_v.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue28 }, v)).arg1();
    localLuaValue28 = new_data;localLuaValue29 = true_symbol;localObject10 = new_list;v = ((LuaValue)localObject10).invoke();LuaValue true_v = true_v.invoke(LuaValue.varargsOf(new LuaValue[] { localLuaValue29 }, v)).arg1();
    LuaValue list_to_jsArray = LuaValue.NIL; void 
    









      tmp5927_5925 = (localObject10 = new lang.64());tmp5927_5925.u0 = construction_p; void tmp5933_5927 = tmp5927_5925;tmp5933_5927.u1 = this.u0; void tmp5941_5933 = tmp5933_5927;tmp5941_5933.u2 = construction_head; void tmp5947_5941 = tmp5941_5933;tmp5947_5941.u3 = construction_tail;tmp5947_5941.u4 = null_p;list_to_jsArray = (LuaValue)maybe_list_to_jsArray;
    Object maybe_list_to_jsArray = LuaValue.NIL;
    





    (localObject11 = new lang.65()).u0 = list_to_jsArray;maybe_list_to_jsArray = localObject11;
    ((LuaValue)exports).set(k115, jsArray_to_list);
    ((LuaValue)exports).set(k116, (LuaValue)maybe_list_to_jsArray);
    ((LuaValue)exports).set(k117, new_list);
    ((LuaValue)exports).set(k118, any_delay_just_p);
    ((LuaValue)exports).set(k119, force_all[0]);
    ((LuaValue)exports).set(k120, force1[0]);
    localObject11 = LuaValue.tableOf(0, 0);env_null_v[0] = localObject11;
    Object val2env = LuaValue.NIL; void 
    
























































      tmp6074_6072 = (localObject12 = new lang.66());tmp6074_6072.u0 = force_all; void tmp6080_6074 = tmp6074_6072;tmp6080_6074.u1 = data_p; void tmp6086_6080 = tmp6080_6074;tmp6086_6080.u2 = data_name; void tmp6092_6086 = tmp6086_6080;tmp6092_6086.u3 = symbol_p; void tmp6098_6092 = tmp6092_6086;tmp6098_6092.u4 = symbol_equal_p; void tmp6104_6098 = tmp6098_6092;tmp6104_6098.u5 = mapping_symbol; void tmp6110_6104 = tmp6104_6098;tmp6110_6104.u6 = data_list; void tmp6116_6110 = tmp6110_6104;tmp6116_6110.u7 = construction_p; void tmp6122_6116 = tmp6116_6110;tmp6122_6116.u8 = null_p; void tmp6128_6122 = tmp6122_6116;tmp6128_6122.u9 = construction_tail; void tmp6134_6128 = tmp6128_6122;tmp6134_6128.u10 = construction_head; void tmp6140_6134 = tmp6134_6128;tmp6140_6134.u11 = jsbool_equal_p;tmp6140_6134.u12 = this.u0;val2env = localObject12;
    ((LuaValue)exports).set(k121, env_null_v[0]);
    ((LuaValue)exports).set(k122, env_set);
    ((LuaValue)exports).set(k123, env_get);
    ((LuaValue)exports).set(k124, env2val);
    ((LuaValue)exports).set(k125, env_foreach);
    ((LuaValue)exports).set(k126, (LuaValue)val2env);
    LuaValue make_builtin_p_func = LuaValue.NIL; void 
    










      tmp6228_6226 = (localObject13 = new lang.67());tmp6228_6226.u0 = force1; void tmp6234_6228 = tmp6228_6226;tmp6234_6228.u1 = any_delay_just_p; void tmp6240_6234 = tmp6234_6228;tmp6240_6234.u2 = builtin_func_apply; void tmp6246_6240 = tmp6240_6234;tmp6246_6240.u3 = true_v;tmp6246_6240.u4 = false_v;make_builtin_p_func = make_builtin_get_func;
    LuaValue make_builtin_get_func = LuaValue.NIL; void 
    










      tmp6276_6274 = (s139 = new lang.68());tmp6276_6274.u0 = force1; void tmp6282_6276 = tmp6276_6274;tmp6282_6276.u1 = any_delay_just_p;tmp6282_6276.u2 = builtin_func_apply;make_builtin_get_func = s139;
    s139 = LuaValue.tableOf(18, 0);localObject14 = make_builtin_p_func;Object localObject15 = data_p_function_builtin_systemName[0];Object localObject16 = data_p;localObject14 = ((LuaValue)localObject14).call((LuaValue)localObject15, (LuaValue)localObject16);localObject15 = LuaValue.tableOf(3, 0);localObject16 = new_data_function_builtin_systemName;LuaValue s143 = k3;LuaValue s144 = new_data; Object tmp6352_6350 = localObject15;tmp6352_6350.rawset(1, (LuaValue)localObject16); Object tmp6359_6352 = tmp6352_6350;tmp6359_6352.rawset(2, s143); Object tmp6366_6359 = tmp6359_6352;tmp6366_6359.rawset(3, s144);tmp6366_6359;localObject16 = make_builtin_get_func;s143 = data_name_function_builtin_systemName[0];s144 = data_p;LuaValue s145 = data_name;localObject16 = ((LuaValue)localObject16).call(s143, s144, s145);s143 = make_builtin_get_func;s144 = data_list_function_builtin_systemName[0];s145 = data_p;LuaValue s146 = data_list;s143 = s143.call(s144, s145, s146);s144 = make_builtin_p_func;s145 = error_p_function_builtin_systemName[0];s146 = error_p;s144 = s144.call(s145, s146);s145 = LuaValue.tableOf(3, 0);s146 = new_error_function_builtin_systemName;LuaValue s147 = k3;LuaValue s148 = new_error; LuaValue tmp6483_6481 = s145;tmp6483_6481.rawset(1, s146); LuaValue tmp6490_6483 = tmp6483_6481;tmp6490_6483.rawset(2, s147); LuaValue tmp6497_6490 = tmp6490_6483;tmp6497_6490.rawset(3, s148);tmp6497_6490;s146 = make_builtin_get_func;s147 = error_name_function_builtin_systemName[0];s148 = error_p;LuaValue s149 = error_name;s146 = s146.call(s147, s148, s149);s147 = make_builtin_get_func;s148 = error_list_function_builtin_systemName[0];s149 = error_p;LuaValue s150 = error_list;s147 = s147.call(s148, s149, s150);s148 = make_builtin_p_func;s149 = null_p_function_builtin_systemName[0];s150 = null_p;s148 = s148.call(s149, s150);s149 = LuaValue.tableOf(3, 0);s150 = new_construction_function_builtin_systemName;LuaValue s151 = k3;LuaValue s152 = new_construction; LuaValue tmp6614_6612 = s149;tmp6614_6612.rawset(1, s150); LuaValue tmp6621_6614 = tmp6614_6612;tmp6621_6614.rawset(2, s151); LuaValue tmp6628_6621 = tmp6621_6614;tmp6628_6621.rawset(3, s152);tmp6628_6621;s150 = make_builtin_p_func;s151 = construction_p_function_builtin_systemName[0];s152 = construction_p;s150 = s150.call(s151, s152);s151 = make_builtin_get_func;s152 = construction_head_function_builtin_systemName[0];LuaValue s153 = construction_p;LuaValue s154 = construction_head;s151 = s151.call(s152, s153, s154);s152 = make_builtin_get_func;s153 = construction_tail_function_builtin_systemName[0];s154 = construction_p;LuaValue s155 = construction_tail;s152 = s152.call(s153, s154, s155);s153 = LuaValue.tableOf(3, 0);s154 = equal_p_function_builtin_systemName[0];s155 = k3; void 
    


















































      tmp6751_6749 = (s156 = new lang.69());tmp6751_6749.u0 = true_v; void tmp6757_6751 = tmp6751_6749;tmp6757_6751.u1 = force1; void tmp6763_6757 = tmp6757_6751;tmp6763_6757.u2 = any_delay_just_p; void tmp6769_6763 = tmp6763_6757;tmp6769_6763.u3 = builtin_func_apply; void tmp6775_6769 = tmp6769_6763;tmp6775_6769.u4 = equal_p_function_builtin_systemName; void tmp6781_6775 = tmp6775_6769;tmp6781_6775.u5 = if_function_builtin_systemName; void tmp6787_6781 = tmp6781_6775;tmp6787_6781.u6 = false_v; void tmp6793_6787 = tmp6787_6781;tmp6793_6787.u7 = ASSERT; void tmp6799_6793 = tmp6793_6787;tmp6799_6793.u8 = null_p; void tmp6805_6799 = tmp6799_6793;tmp6805_6799.u9 = symbol_p; void tmp6811_6805 = tmp6805_6799;tmp6811_6805.u10 = symbol_equal_p; void tmp6817_6811 = tmp6811_6805;tmp6817_6811.u11 = data_p; void tmp6823_6817 = tmp6817_6811;tmp6823_6817.u12 = data_name; void tmp6829_6823 = tmp6823_6817;tmp6829_6823.u13 = data_list; void tmp6835_6829 = tmp6829_6823;tmp6835_6829.u14 = construction_p; void tmp6841_6835 = tmp6835_6829;tmp6841_6835.u15 = construction_head; void tmp6847_6841 = tmp6841_6835;tmp6847_6841.u16 = construction_tail; void tmp6853_6847 = tmp6847_6841;tmp6853_6847.u17 = error_p; void tmp6859_6853 = tmp6853_6847;tmp6859_6853.u18 = error_name; void tmp6865_6859 = tmp6859_6853;tmp6865_6859.u19 = error_list;tmp6865_6859.u20 = ERROR; LuaValue tmp6877_6875 = s153;tmp6877_6875.rawset(1, s154); LuaValue tmp6884_6877 = tmp6877_6875;tmp6884_6877.rawset(2, s155); LuaValue tmp6891_6884 = tmp6884_6877;tmp6891_6884.rawset(3, s156);tmp6891_6884;s154 = LuaValue.tableOf(3, 0);s155 = apply_function_builtin_systemName[0];LuaValue s156 = k3; void 
    









      tmp6927_6925 = (s157 = new lang.70());tmp6927_6925.u0 = force_all; void tmp6933_6927 = tmp6927_6925;tmp6933_6927.u1 = construction_p; void tmp6939_6933 = tmp6933_6927;tmp6939_6933.u2 = this.u0; void tmp6947_6939 = tmp6939_6933;tmp6947_6939.u3 = construction_head; void tmp6953_6947 = tmp6947_6939;tmp6953_6947.u4 = construction_tail; void tmp6959_6953 = tmp6953_6947;tmp6959_6953.u5 = null_p;tmp6959_6953.u6 = apply; LuaValue tmp6972_6970 = s154;tmp6972_6970.rawset(1, s155); LuaValue tmp6979_6972 = tmp6972_6970;tmp6979_6972.rawset(2, s156); LuaValue tmp6986_6979 = tmp6979_6972;tmp6986_6979.rawset(3, s157);tmp6986_6979;s155 = LuaValue.tableOf(3, 0);s156 = evaluate_function_builtin_systemName[0];LuaValue s157 = k3; void 
    




      tmp7022_7020 = (s158 = new lang.71());tmp7022_7020.u0 = ((LuaValue)val2env);tmp7022_7020.u1 = evaluate; LuaValue tmp7035_7033 = s155;tmp7035_7033.rawset(1, s156); LuaValue tmp7042_7035 = tmp7035_7033;tmp7042_7035.rawset(2, s157); LuaValue tmp7049_7042 = tmp7042_7035;tmp7049_7042.rawset(3, s158);tmp7049_7042;s156 = make_builtin_p_func;s157 = symbol_p_function_builtin_systemName[0];LuaValue s158 = symbol_p;s156 = s156.call(s157, s158);s157 = LuaValue.tableOf(3, 0);s158 = list_chooseOne_function_builtin_systemName;LuaValue s159 = k2; void 
    







      tmp7108_7106 = (s160 = new lang.72());tmp7108_7106.u0 = force1; void tmp7114_7108 = tmp7108_7106;tmp7114_7108.u1 = any_delay_just_p; void tmp7120_7114 = tmp7114_7108;tmp7120_7114.u2 = builtin_func_apply; void tmp7126_7120 = tmp7120_7114;tmp7126_7120.u3 = list_chooseOne_function_builtin_systemName; void tmp7132_7126 = tmp7126_7120;tmp7132_7126.u4 = construction_p;tmp7132_7126.u5 = construction_head; LuaValue tmp7145_7143 = s157;tmp7145_7143.rawset(1, s158); LuaValue tmp7152_7145 = tmp7145_7143;tmp7152_7145.rawset(2, s159); LuaValue tmp7159_7152 = tmp7152_7145;tmp7159_7152.rawset(3, s160);tmp7159_7152;s158 = LuaValue.tableOf(3, 0);s159 = if_function_builtin_systemName[0];LuaValue s160 = k4; void 
    

















      tmp7195_7193 = (s161 = new lang.73());tmp7195_7193.u0 = force1; void tmp7201_7195 = tmp7195_7193;tmp7201_7195.u1 = any_delay_just_p; void tmp7207_7201 = tmp7201_7195;tmp7207_7201.u2 = builtin_func_apply; void tmp7213_7207 = tmp7207_7201;tmp7213_7207.u3 = if_function_builtin_systemName; void tmp7219_7213 = tmp7213_7207;tmp7219_7213.u4 = data_p; void tmp7225_7219 = tmp7219_7213;tmp7225_7219.u5 = force_all; void tmp7231_7225 = tmp7225_7219;tmp7231_7225.u6 = data_name; void tmp7237_7231 = tmp7231_7225;tmp7237_7231.u7 = symbol_p; void tmp7243_7237 = tmp7237_7231;tmp7243_7237.u8 = symbol_equal_p; void tmp7249_7243 = tmp7243_7237;tmp7249_7243.u9 = true_symbol;tmp7249_7243.u10 = false_symbol; LuaValue tmp7262_7260 = s158;tmp7262_7260.rawset(1, s159); LuaValue tmp7269_7262 = tmp7262_7260;tmp7269_7262.rawset(2, s160); LuaValue tmp7276_7269 = tmp7269_7262;tmp7276_7269.rawset(3, s161);tmp7276_7269; LuaValue tmp7286_7284 = s139;tmp7286_7284.rawset(1, (LuaValue)localObject14); LuaValue tmp7293_7286 = tmp7286_7284;tmp7293_7286.rawset(2, (LuaValue)localObject15); LuaValue tmp7300_7293 = tmp7293_7286;tmp7300_7293.rawset(3, (LuaValue)localObject16); LuaValue tmp7307_7300 = tmp7300_7293;tmp7307_7300.rawset(4, s143); LuaValue tmp7314_7307 = tmp7307_7300;tmp7314_7307.rawset(5, s144); LuaValue tmp7321_7314 = tmp7314_7307;tmp7321_7314.rawset(6, s145); LuaValue tmp7329_7321 = tmp7321_7314;tmp7329_7321.rawset(7, s146); LuaValue tmp7337_7329 = tmp7329_7321;tmp7337_7329.rawset(8, s147); LuaValue tmp7345_7337 = tmp7337_7329;tmp7345_7337.rawset(9, s148); LuaValue tmp7353_7345 = tmp7345_7337;tmp7353_7345.rawset(10, s149); LuaValue tmp7361_7353 = tmp7353_7345;tmp7361_7353.rawset(11, s150); LuaValue tmp7369_7361 = tmp7361_7353;tmp7369_7361.rawset(12, s151); LuaValue tmp7377_7369 = tmp7369_7361;tmp7377_7369.rawset(13, s152); LuaValue tmp7385_7377 = tmp7377_7369;tmp7385_7377.rawset(14, s153); LuaValue tmp7393_7385 = tmp7385_7377;tmp7393_7385.rawset(15, s154); LuaValue tmp7401_7393 = tmp7393_7385;tmp7401_7393.rawset(16, s155); LuaValue tmp7409_7401 = tmp7401_7393;tmp7409_7401.rawset(17, s156); LuaValue tmp7417_7409 = tmp7409_7401;tmp7417_7409.rawset(18, s157); LuaValue tmp7425_7417 = tmp7417_7409;tmp7425_7417.rawset(19, s158);tmp7425_7417;real_builtin_func_apply_s[0] = s139;
    LuaValue[] jsbool_no_force_equal_p; ((LuaValue)exports).set(k127, jsbool_equal_p[0]);
    (jsbool_no_force_equal_p = newupe())[0] = LuaValue.NIL; void 
    






















































      tmp7476_7474 = (localObject14 = new lang.74());tmp7476_7474.u0 = un_just_all; void tmp7482_7476 = tmp7476_7474;tmp7482_7476.u1 = jsbool_no_force_equal_p; void tmp7488_7482 = tmp7482_7476;tmp7488_7482.u2 = lang_set_do; void tmp7494_7488 = tmp7488_7482;tmp7494_7488.u3 = null_p; void tmp7500_7494 = tmp7494_7488;tmp7500_7494.u4 = null_v; void tmp7506_7500 = tmp7500_7494;tmp7506_7500.u5 = symbol_p; void tmp7512_7506 = tmp7506_7500;tmp7512_7506.u6 = symbol_equal_p; void tmp7518_7512 = tmp7512_7506;tmp7518_7512.u7 = construction_p; void tmp7524_7518 = tmp7518_7512;tmp7524_7518.u8 = construction_head; void tmp7530_7524 = tmp7524_7518;tmp7530_7524.u9 = construction_tail; void tmp7536_7530 = tmp7530_7524;tmp7536_7530.u10 = error_p; void tmp7542_7536 = tmp7536_7530;tmp7542_7536.u11 = error_name; void tmp7548_7542 = tmp7542_7536;tmp7548_7542.u12 = error_list; void tmp7554_7548 = tmp7548_7542;tmp7554_7548.u13 = data_p; void tmp7560_7554 = tmp7554_7548;tmp7560_7554.u14 = data_name; void tmp7566_7560 = tmp7560_7554;tmp7566_7560.u15 = data_list; void tmp7572_7566 = tmp7566_7560;tmp7572_7566.u16 = delay_evaluate_p; void tmp7578_7572 = tmp7572_7566;tmp7578_7572.u17 = delay_builtin_func_p; void tmp7584_7578 = tmp7578_7572;tmp7584_7578.u18 = delay_builtin_form_p; void tmp7590_7584 = tmp7584_7578;tmp7590_7584.u19 = delay_apply_p;tmp7590_7584.u20 = ERROR;jsbool_no_force_equal_p[0] = localObject14;
    Object simple_print_force_all_rec = LuaValue.NIL; void 
    

      tmp7623_7621 = (localObject15 = new lang.75());tmp7623_7621.u0 = simple_print;tmp7623_7621.u1 = force_all_rec;simple_print_force_all_rec = localObject15;
    ((LuaValue)exports).set(k128, simple_print[0]);
    ((LuaValue)exports).set(k129, (LuaValue)simple_print_force_all_rec);
    Object simple_parse = LuaValue.NIL; void 
    






























































































































































































































































































      tmp7673_7671 = (localObject16 = new lang.76());tmp7673_7671.u0 = ASSERT; void tmp7679_7673 = tmp7673_7671;tmp7679_7673.u1 = this.u0; void tmp7687_7679 = tmp7679_7673;tmp7687_7679.u2 = new_symbol; void tmp7693_7687 = tmp7687_7679;tmp7693_7687.u3 = construction_p; void tmp7699_7693 = tmp7693_7687;tmp7699_7693.u4 = ERROR; void tmp7704_7699 = tmp7699_7693;tmp7704_7699.u5 = construction_tail; void tmp7710_7704 = tmp7704_7699;tmp7710_7704.u6 = new_construction; void tmp7716_7710 = tmp7710_7704;tmp7716_7710.u7 = null_v; void tmp7722_7716 = tmp7716_7710;tmp7722_7716.u8 = new_data; void tmp7728_7722 = tmp7722_7716;tmp7728_7722.u9 = construction_head; void tmp7734_7728 = tmp7728_7722;tmp7734_7728.u10 = new_error; void tmp7740_7734 = tmp7734_7728;tmp7740_7734.u11 = null_p; void tmp7746_7740 = tmp7740_7734;tmp7746_7740.u12 = ((LuaValue)val2env); void tmp7752_7746 = tmp7746_7740;tmp7752_7746.u13 = evaluate; void tmp7758_7752 = tmp7752_7746;tmp7758_7752.u14 = list_to_jsArray; void tmp7764_7758 = tmp7758_7752;tmp7764_7758.u15 = builtin_func_apply; void tmp7770_7764 = tmp7764_7758;tmp7770_7764.u16 = builtin_form_apply;tmp7770_7764.u17 = apply;simple_parse = localObject16;
    ((LuaValue)exports).set(k130, (LuaValue)simple_parse);
    LuaValue complex_parse = LuaValue.NIL; void 
    









































































































































































































































































































































































































































      tmp7809_7807 = (s143 = new lang.77());tmp7809_7807.u0 = ASSERT; void tmp7815_7809 = tmp7809_7807;tmp7815_7809.u1 = this.u0; void tmp7823_7815 = tmp7815_7809;tmp7823_7815.u2 = new_symbol; void tmp7829_7823 = tmp7823_7815;tmp7829_7823.u3 = construction_p; void tmp7835_7829 = tmp7829_7823;tmp7835_7829.u4 = ERROR; void tmp7840_7835 = tmp7835_7829;tmp7840_7835.u5 = construction_tail; void tmp7846_7840 = tmp7840_7835;tmp7846_7840.u6 = new_construction; void tmp7852_7846 = tmp7846_7840;tmp7852_7846.u7 = null_v; void tmp7858_7852 = tmp7852_7846;tmp7858_7852.u8 = new_data; void tmp7864_7858 = tmp7858_7852;tmp7864_7858.u9 = construction_head; void tmp7870_7864 = tmp7864_7858;tmp7870_7864.u10 = new_error; void tmp7876_7870 = tmp7870_7864;tmp7876_7870.u11 = new_list; void tmp7882_7876 = tmp7876_7870;tmp7882_7876.u12 = typeAnnotation_symbol; void tmp7888_7882 = tmp7882_7876;tmp7888_7882.u13 = function_symbol; void tmp7894_7888 = tmp7888_7882;tmp7894_7888.u14 = something_symbol; void tmp7900_7894 = tmp7894_7888;tmp7900_7894.u15 = isOrNot_symbol; void tmp7906_7900 = tmp7900_7894;tmp7906_7900.u16 = sub_symbol; void tmp7912_7906 = tmp7906_7900;tmp7912_7906.u17 = jsArray_to_list; void tmp7918_7912 = tmp7912_7906;tmp7918_7912.u18 = form_symbol; void tmp7924_7918 = tmp7918_7912;tmp7924_7918.u19 = system_symbol; void tmp7930_7924 = tmp7924_7918;tmp7930_7924.u20 = theThing_symbol; void tmp7936_7930 = tmp7930_7924;tmp7936_7930.u21 = symbol_p; void tmp7942_7936 = tmp7936_7930;tmp7942_7936.u22 = systemName_make; void tmp7948_7942 = tmp7942_7936;tmp7948_7942.u23 = null_p; void tmp7954_7948 = tmp7948_7942;tmp7954_7948.u24 = ((LuaValue)val2env); void tmp7960_7954 = tmp7954_7948;tmp7960_7954.u25 = evaluate; void tmp7966_7960 = tmp7960_7954;tmp7966_7960.u26 = list_to_jsArray; void tmp7972_7966 = tmp7966_7960;tmp7972_7966.u27 = builtin_func_apply; void tmp7978_7972 = tmp7972_7966;tmp7978_7972.u28 = builtin_form_apply;tmp7978_7972.u29 = apply;complex_parse = s143;
    LuaValue[] complex_print; ((LuaValue)exports).set(k131, complex_parse);
    (complex_print = newupe())[0] = LuaValue.NIL; void 
    


















































































































      tmp8025_8023 = (s144 = new lang.78());tmp8025_8023.u0 = symbol_p; void tmp8031_8025 = tmp8025_8023;tmp8031_8025.u1 = un_symbol; void tmp8037_8031 = tmp8031_8025;tmp8037_8031.u2 = ERROR; void tmp8042_8037 = tmp8037_8031;tmp8042_8037.u3 = ((LuaValue)maybe_list_to_jsArray); void tmp8048_8042 = tmp8042_8037;tmp8048_8042.u4 = jsbool_no_force_equal_p; void tmp8054_8048 = tmp8048_8042;tmp8054_8048.u5 = typeAnnotation_symbol; void tmp8060_8054 = tmp8054_8048;tmp8060_8054.u6 = function_symbol; void tmp8066_8060 = tmp8060_8054;tmp8066_8060.u7 = something_symbol; void tmp8072_8066 = tmp8066_8060;tmp8072_8066.u8 = construction_p; void tmp8078_8072 = tmp8072_8066;tmp8078_8072.u9 = construction_tail; void tmp8084_8078 = tmp8078_8072;tmp8084_8078.u10 = construction_head; void tmp8090_8084 = tmp8084_8078;tmp8090_8084.u11 = theThing_symbol; void tmp8096_8090 = tmp8090_8084;tmp8096_8090.u12 = isOrNot_symbol; void tmp8102_8096 = tmp8096_8090;tmp8102_8096.u13 = form_symbol; void tmp8108_8102 = tmp8102_8096;tmp8108_8102.u14 = system_symbol; void tmp8114_8108 = tmp8108_8102;tmp8114_8108.u15 = sub_symbol; void tmp8120_8114 = tmp8114_8108;tmp8120_8114.u16 = simple_print; void tmp8126_8120 = tmp8120_8114;tmp8126_8120.u17 = systemName_make; void tmp8132_8126 = tmp8126_8120;tmp8132_8126.u18 = ((LuaValue)simple_parse); void tmp8138_8132 = tmp8132_8126;tmp8138_8132.u19 = null_p; void tmp8144_8138 = tmp8138_8132;tmp8144_8138.u20 = complex_print; void tmp8150_8144 = tmp8144_8138;tmp8150_8144.u21 = data_p; void tmp8156_8150 = tmp8150_8144;tmp8156_8150.u22 = data_name; void tmp8162_8156 = tmp8156_8150;tmp8162_8156.u23 = data_list; void tmp8168_8162 = tmp8162_8156;tmp8168_8162.u24 = name_symbol; void tmp8174_8168 = tmp8168_8162;tmp8174_8168.u25 = new_construction; void tmp8180_8174 = tmp8174_8168;tmp8180_8174.u26 = error_p; void tmp8186_8180 = tmp8180_8174;tmp8186_8180.u27 = error_name; void tmp8192_8186 = tmp8186_8180;tmp8192_8186.u28 = error_list; void tmp8198_8192 = tmp8192_8186;tmp8198_8192.u29 = delay_evaluate_p; void tmp8204_8198 = tmp8198_8192;tmp8204_8198.u30 = env2val; void tmp8210_8204 = tmp8204_8198;tmp8210_8204.u31 = delay_evaluate_env; void tmp8216_8210 = tmp8210_8204;tmp8216_8210.u32 = delay_evaluate_x; void tmp8222_8216 = tmp8216_8210;tmp8222_8216.u33 = delay_builtin_func_p; void tmp8228_8222 = tmp8222_8216;tmp8228_8222.u34 = delay_builtin_func_f; void tmp8234_8228 = tmp8228_8222;tmp8234_8228.u35 = jsArray_to_list; void tmp8240_8234 = tmp8234_8228;tmp8240_8234.u36 = delay_builtin_func_xs; void tmp8246_8240 = tmp8240_8234;tmp8246_8240.u37 = delay_builtin_form_p; void tmp8252_8246 = tmp8246_8240;tmp8252_8246.u38 = delay_builtin_form_env; void tmp8258_8252 = tmp8252_8246;tmp8258_8252.u39 = delay_builtin_form_f; void tmp8264_8258 = tmp8258_8252;tmp8264_8258.u40 = delay_builtin_form_xs; void tmp8270_8264 = tmp8264_8258;tmp8270_8264.u41 = delay_apply_p; void tmp8276_8270 = tmp8270_8264;tmp8276_8270.u42 = delay_apply_f;tmp8276_8270.u43 = delay_apply_xs;complex_print[0] = s144;
    ((LuaValue)exports).set(k132, complex_print[0]);
    return exports;
  }
  
  static final LuaValue k15 = LuaString.valueOf("construction_p");
  static final LuaValue k16 = LuaString.valueOf("construction_head");
  static final LuaValue k17 = LuaString.valueOf("construction_tail");
  static final LuaValue k18 = LuaString.valueOf("null_v");
  static final LuaValue k19 = LuaString.valueOf("null_p");
  static final LuaValue k20 = LuaString.valueOf("new_data");
  static final LuaValue k21 = LuaString.valueOf("data_p");
  static final LuaValue k22 = LuaString.valueOf("data_name");
  static final LuaValue k23 = LuaString.valueOf("data_list");
  static final LuaValue k24 = LuaString.valueOf("new_error");
  static final LuaValue k25 = LuaString.valueOf("error_p");
  static final LuaValue k26 = LuaString.valueOf("error_name");
  static final LuaValue k27 = LuaString.valueOf("error_list");
  static final LuaValue k28 = LuaString.valueOf("evaluate");
  static final LuaValue k29 = LuaString.valueOf("apply");
  static final LuaValue k30 = LuaString.valueOf("force_all_rec");
  static final LuaValue k31 = LuaString.valueOf("太始初核");
  static final LuaValue k32 = LuaString.valueOf("符名");
  static final LuaValue k33 = LuaString.valueOf("化滅");
  static final LuaValue k34 = LuaString.valueOf("式形");
  static final LuaValue k35 = LuaString.valueOf("等同");
  static final LuaValue k36 = LuaString.valueOf("解算");
  static final LuaValue k37 = LuaString.valueOf("特定其物");
  static final LuaValue k38 = LuaString.valueOf("省略一物");
  static final LuaValue k39 = LuaString.valueOf("映表");
  static final LuaValue k40 = LuaString.valueOf("若");
  static final LuaValue k41 = LuaString.valueOf("一類何物");
  static final LuaValue k42 = LuaString.valueOf("是非");
  static final LuaValue k43 = LuaString.valueOf("其子");
  static final LuaValue k44 = LuaString.valueOf("陽");
  static final LuaValue k45 = LuaString.valueOf("陰");
  static final LuaValue k46 = LuaString.valueOf("引用");
  static final LuaValue k47 = LuaString.valueOf("應用");
  static final LuaValue k48 = LuaString.valueOf("空");
  static final LuaValue k49 = LuaString.valueOf("連");
  static final LuaValue k50 = LuaString.valueOf("構");
  static final LuaValue k51 = LuaString.valueOf("誤");
  static final LuaValue k52 = LuaString.valueOf("詞素");
  static final LuaValue k53 = LuaString.valueOf("列");
  static final LuaValue k54 = LuaString.valueOf("首");
  static final LuaValue k55 = LuaString.valueOf("尾");
  static final LuaValue k56 = LuaString.valueOf("物");
  static final LuaValue k57 = LuaString.valueOf("宇宙亡矣");
  static final LuaValue k58 = LuaString.valueOf("效應");
  static final LuaValue k59 = LuaString.valueOf("為符名連");
  static final LuaValue k60 = LuaString.valueOf("出入改滅");
  static final LuaValue k61 = LuaString.valueOf("system_symbol");
  static final LuaValue k62 = LuaString.valueOf("name_symbol");
  static final LuaValue k63 = LuaString.valueOf("function_symbol");
  static final LuaValue k64 = LuaString.valueOf("form_symbol");
  static final LuaValue k65 = LuaString.valueOf("equal_symbol");
  static final LuaValue k66 = LuaString.valueOf("evaluate_sym");
  static final LuaValue k67 = LuaString.valueOf("theThing_symbol");
  static final LuaValue k68 = LuaString.valueOf("something_symbol");
  static final LuaValue k69 = LuaString.valueOf("mapping_symbol");
  static final LuaValue k70 = LuaString.valueOf("if_symbol");
  static final LuaValue k71 = LuaString.valueOf("typeAnnotation_symbol");
  static final LuaValue k72 = LuaString.valueOf("isOrNot_symbol");
  static final LuaValue k73 = LuaString.valueOf("sub_symbol");
  static final LuaValue k74 = LuaString.valueOf("true_symbol");
  static final LuaValue k75 = LuaString.valueOf("false_symbol");
  static final LuaValue k76 = LuaString.valueOf("quote_symbol");
  static final LuaValue k77 = LuaString.valueOf("apply_symbol");
  static final LuaValue k78 = LuaString.valueOf("null_symbol");
  static final LuaValue k79 = LuaString.valueOf("construction_symbol");
  static final LuaValue k80 = LuaString.valueOf("data_symbol");
  static final LuaValue k81 = LuaString.valueOf("error_symbol");
  static final LuaValue k82 = LuaString.valueOf("symbol_symbol");
  static final LuaValue k83 = LuaString.valueOf("list_symbol");
  static final LuaValue k84 = LuaString.valueOf("head_symbol");
  static final LuaValue k85 = LuaString.valueOf("tail_symbol");
  static final LuaValue k86 = LuaString.valueOf("thing_symbol");
  static final LuaValue k87 = LuaString.valueOf("theWorldStopped_symbol");
  static final LuaValue k88 = LuaString.valueOf("effect_symbol");
  static final LuaValue k89 = LuaString.valueOf("sequentialWordFormation_symbol");
  static final LuaValue k90 = LuaString.valueOf("inputOutput_symbol");
  static final LuaValue k91 = LuaString.valueOf("new_data_function_builtin_systemName");
  static final LuaValue k92 = LuaString.valueOf("data_name_function_builtin_systemName");
  static final LuaValue k93 = LuaString.valueOf("data_list_function_builtin_systemName");
  static final LuaValue k94 = LuaString.valueOf("data_p_function_builtin_systemName");
  static final LuaValue k95 = LuaString.valueOf("new_error_function_builtin_systemName");
  static final LuaValue k96 = LuaString.valueOf("error_name_function_builtin_systemName");
  static final LuaValue k97 = LuaString.valueOf("error_list_function_builtin_systemName");
  static final LuaValue k98 = LuaString.valueOf("error_p_function_builtin_systemName");
  static final LuaValue k99 = LuaString.valueOf("new_construction_function_builtin_systemName");
  static final LuaValue k100 = LuaString.valueOf("construction_p_function_builtin_systemName");
  static final LuaValue k101 = LuaString.valueOf("construction_head_function_builtin_systemName");
  static final LuaValue k102 = LuaString.valueOf("construction_tail_function_builtin_systemName");
  static final LuaValue k103 = LuaString.valueOf("symbol_p_function_builtin_systemName");
  static final LuaValue k104 = LuaString.valueOf("null_p_function_builtin_systemName");
  static final LuaValue k105 = LuaString.valueOf("equal_p_function_builtin_systemName");
  static final LuaValue k106 = LuaString.valueOf("apply_function_builtin_systemName");
  static final LuaValue k107 = LuaString.valueOf("evaluate_function_builtin_systemName");
  static final LuaValue k108 = LuaString.valueOf("list_chooseOne_function_builtin_systemName");
  static final LuaValue k109 = LuaString.valueOf("if_function_builtin_systemName");
  static final LuaValue k110 = LuaString.valueOf("quote_form_builtin_systemName");
  static final LuaValue k111 = LuaString.valueOf("lambda_form_builtin_systemName");
  static final LuaValue k112 = LuaString.valueOf("function_builtin_use_systemName");
  static final LuaValue k113 = LuaString.valueOf("form_builtin_use_systemName");
  static final LuaValue k114 = LuaString.valueOf("form_use_systemName");
  static final LuaValue k115 = LuaString.valueOf("jsArray_to_list");
  static final LuaValue k116 = LuaString.valueOf("maybe_list_to_jsArray");
  static final LuaValue k117 = LuaString.valueOf("new_list");
  static final LuaValue k118 = LuaString.valueOf("delay_p");
  static final LuaValue k119 = LuaString.valueOf("force_all");
  static final LuaValue k120 = LuaString.valueOf("force1");
  static final LuaValue k121 = LuaString.valueOf("env_null_v");
  static final LuaValue k122 = LuaString.valueOf("env_set");
  static final LuaValue k123 = LuaString.valueOf("env_get");
  static final LuaValue k124 = LuaString.valueOf("env2val");
  static final LuaValue k125 = LuaString.valueOf("env_foreach");
  static final LuaValue k126 = LuaString.valueOf("val2env");
  static final LuaValue k127 = LuaString.valueOf("equal_p");
  static final LuaValue k128 = LuaString.valueOf("simple_print");
  static final LuaValue k129 = LuaString.valueOf("simple_print_force_all_rec");
  static final LuaValue k130 = LuaString.valueOf("simple_parse");
  static final LuaValue k131 = LuaString.valueOf("complex_parse");
  static final LuaValue k132 = LuaString.valueOf("complex_print");
  public final void initupvalue1(LuaValue env)
  {
    this.u0 = env;
  }
}
