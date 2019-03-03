__all__ = ['lang']

# Don't look below, you will not understand this Python code :) I don't.

from js2py.pyjs import *
# setting scope
var = Scope( JS_BUILTINS )
set_global_object(var)

# Code follows:
var.registers([])
@Js
def PyJs_anonymous_0_(this, arguments, var=var):
    var = Scope({u'this':this, u'arguments':arguments}, var)
    var.registers([u'Ra', u'Z', u'lb', u'Ba', u'Wa', u'la', u'cb', u'tb', u'Ja', u'ta', u'D', u'ya', u'H', u'db', u'L', u'Oa', u'da', u'P', u'T', u'X', u'l', u'qa', u'p', u'qb', u't', u'Ga', u'x', u'gb', u'Ia', u'ea', u'za', u'eb', u'wa', u'ra', u'rb', u'Ha', u'C', u'Ma', u'ba', u'bb', u'K', u'O', u'S', u'W', u'Ua', u'ja', u'jb', u'Qa', u'k', u'Ea', u'ob', u'oa', u'w', u'Na', u'ca', u'xa', u'$a', u'pb', u'Fa', u'pa', u'Ka', u'B', u'F', u'N', u'R', u'V', u'hb', u'Sa', u'ha', u'mb', u'Ca', u'Xa', u'r', u'v', u'z', u'ua', u'ub', u'aa', u'va', u'ab', u'La', u'Za', u'G', u'ia', u'ib', u'Ta', u'Ya', u'na', u'nb', u'Da', u'A', u'E', u'I', u'M', u'Q', u'fa', u'fb', u'U', u'Y', u'Aa', u'kb', u'ka', u'e', u'm', u'q', u'u', u'y', u'sb', u'sa'])
    @Js
    def PyJsHoisted_aa_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'1')
    PyJsHoisted_aa_.func_name = u'aa'
    var.put(u'aa', PyJsHoisted_aa_)
    @Js
    def PyJsHoisted_va_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'C', u'D', u'G', u'I', u'H', u'J', u'M', u'L', u'a', u'c', u'b', u'd', u'g', u'f', u'h', u'm', u'l', u'n', u'r', u'w', u'v', u'y', u'x'])
        @Js
        def PyJsHoisted_c_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return var.get(u'D').callprop(u'shift')
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        @Js
        def PyJsHoisted_b_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return PyJsStrictEq(Js(0.0),var.get(u'D').get(u'length'))
        PyJsHoisted_b_.func_name = u'b'
        var.put(u'b', PyJsHoisted_b_)
        @Js
        def PyJsHoisted_d_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            var.get(u'D').callprop(u'unshift', var.get(u'a'))
        PyJsHoisted_d_.func_name = u'd'
        var.put(u'd', PyJsHoisted_d_)
        @Js
        def PyJsHoisted_g_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            return (((PyJsStrictEq(Js(u' '),var.get(u'a')) or PyJsStrictEq(Js(u'\n'),var.get(u'a'))) or PyJsStrictEq(Js(u'\t'),var.get(u'a'))) or PyJsStrictEq(Js(u'\r'),var.get(u'a')))
        PyJsHoisted_g_.func_name = u'g'
        var.put(u'g', PyJsHoisted_g_)
        @Js
        def PyJsHoisted_f_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            PyJsTempException = JsToPyException(Js(u'TheLanguage parse ERROR!'))
            raise PyJsTempException
        PyJsHoisted_f_.func_name = u'f'
        var.put(u'f', PyJsHoisted_f_)
        @Js
        def PyJsHoisted_C_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'h', u'g'])
            @Js
            def PyJsHoisted_a_(b, this, arguments, var=var):
                var = Scope({u'this':this, u'b':b, u'arguments':arguments}, var)
                var.registers([u'c', u'b', u'e', u'd'])
                @Js
                def PyJsHoisted_c_(this, arguments, var=var):
                    var = Scope({u'this':this, u'arguments':arguments}, var)
                    var.registers([u'b'])
                    var.get(u'y')(Js(u'['))
                    var.put(u'b', var.get(u'a')())
                    var.get(u'y')(Js(u']'))
                    return var.get(u'b')
                PyJsHoisted_c_.func_name = u'c'
                var.put(u'c', PyJsHoisted_c_)
                pass
                (PyJsStrictEq(PyJsComma(Js(0.0), Js(None)),var.get(u'b')) and var.put(u'b', Js(1.0).neg()))
                var.put(u'b', (Js([var.get(u'n'), var.get(u'J'), var.get(u'c'), var.get(u'm'), var.get(u'l'), var.get(u'H'), var.get(u'I'), var.get(u'L'), var.get(u'M')]) if var.get(u'b') else Js([var.get(u'n'), var.get(u'C'), var.get(u'm'), var.get(u'l'), var.get(u'H'), var.get(u'I'), var.get(u'L'), var.get(u'M')])))
                #for JS loop
                var.put(u'd', Js(0.0))
                while (var.get(u'd')<var.get(u'b').get(u'length')):
                    try:
                        var.put(u'e', var.get(u'b').callprop(var.get(u'd')))
                        if PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')):
                            return var.get(u'e')
                    finally:
                            (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
                return var.get(u'f')()
            PyJsHoisted_a_.func_name = u'a'
            var.put(u'a', PyJsHoisted_a_)
            @Js
            def PyJsHoisted_h_(f, this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments, u'f':f}, var)
                var.registers([u'h', u'g', u'f'])
                if var.get(u'b')():
                    return var.get(u'f')
                var.put(u'g', var.get(u'c')())
                if PyJsStrictEq(Js(u'.'),var.get(u'g')):
                    var.put(u'h', var.get(u'a')())
                    return var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), var.get(u'e')(var.get(u'f')), var.get(u'u')), var.get(u'h'))
                if PyJsStrictEq(Js(u':'),var.get(u'g')):
                    return PyJsComma(var.put(u'h', var.get(u'a')()),var.get(u'e')(var.get(u't'), var.get(u'h'), var.get(u'f')))
                if PyJsStrictEq(Js(u'~'),var.get(u'g')):
                    return var.get(u'e')(var.get(u'R'), var.get(u'f'))
                if PyJsStrictEq(Js(u'@'),var.get(u'g')):
                    return PyJsComma(var.put(u'h', var.get(u'a')()),var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), Js([Js(1.0), var.get(u'f'), var.get(u'u')]), var.get(u'u')), var.get(u'h')))
                if PyJsStrictEq(Js(u'?'),var.get(u'g')):
                    return var.get(u'e')(var.get(u't'), var.get(u'q'), var.get(u'e')(var.get(u'R'), var.get(u'f')))
                if PyJsStrictEq(Js(u'/'),var.get(u'g')):
                    #for JS loop
                    var.put(u'g', Js([]))
                    while 1:
                        var.put(u'h', var.get(u'a')(Js(0.0).neg()))
                        var.get(u'g').callprop(u'push', var.get(u'h'))
                        if var.get(u'b')():
                            break
                        var.put(u'h', var.get(u'c')())
                        if PyJsStrictNeq(Js(u'/'),var.get(u'h')):
                            var.get(u'd')(var.get(u'h'))
                            break
                    
                    return var.get(u'e')(var.get(u'Qa'), var.get(u'f'), var.get(u'F')(var.get(u'g')))
                var.get(u'd')(var.get(u'g'))
                return var.get(u'f')
            PyJsHoisted_h_.func_name = u'h'
            var.put(u'h', PyJsHoisted_h_)
            pass
            pass
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'g', var.get(u'c')())
            if PyJsStrictEq(Js(u'&'),var.get(u'g')):
                var.get(u'x')(var.get(u'b')().neg())
                var.put(u'g', var.get(u'c')())
                if PyJsStrictEq(Js(u'+'),var.get(u'g')):
                    return PyJsComma(var.put(u'g', var.get(u'a')()),var.get(u'e')(var.get(u'K'), var.get(u'e')(var.get(u'E'), var.get(u'g'))))
                var.get(u'd')(var.get(u'g'))
                var.put(u'g', var.get(u'a')())
                return var.get(u'e')(var.get(u'K'), var.get(u'g'))
            if PyJsStrictEq(Js(u':'),var.get(u'g')):
                var.get(u'x')(var.get(u'b')().neg())
                var.put(u'g', var.get(u'c')())
                if PyJsStrictEq(Js(u'&'),var.get(u'g')):
                    return PyJsComma(PyJsComma(var.get(u'y')(Js(u'>')),var.put(u'g', var.get(u'a')())),var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'K'), var.get(u'e')(var.get(u'q'), var.get(u'u'), var.get(u'g'))), var.get(u'O')))
                if PyJsStrictEq(Js(u'>'),var.get(u'g')):
                    return PyJsComma(var.put(u'g', var.get(u'a')()),var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), var.get(u'u'), var.get(u'g')), var.get(u'O')))
                var.get(u'd')(var.get(u'g'))
                var.put(u'g', var.get(u'a')())
                return var.get(u'e')(var.get(u't'), var.get(u'g'), var.get(u'O'))
            if PyJsStrictEq(Js(u'+'),var.get(u'g')):
                return PyJsComma(var.put(u'g', var.get(u'a')()),var.get(u'e')(var.get(u'E'), var.get(u'g')))
            if PyJsStrictEq(Js(u'['),var.get(u'g')):
                return PyJsComma(PyJsComma(var.put(u'g', var.get(u'a')()),var.get(u'y')(Js(u']'))),var.get(u'h')(var.get(u'g')))
            if PyJsStrictEq(Js(u'_'),var.get(u'g')):
                return PyJsComma(PyJsComma(var.get(u'y')(Js(u':')),var.put(u'g', var.get(u'a')())),var.get(u'e')(var.get(u't'), var.get(u'g'), var.get(u'u')))
            var.get(u'd')(var.get(u'g'))
            var.put(u'g', var.get(u'J')())
            return (Js(1.0).neg() if PyJsStrictEq(Js(1.0).neg(),var.get(u'g')) else var.get(u'h')(var.get(u'g')))
        PyJsHoisted_C_.func_name = u'C'
        var.put(u'C', PyJsHoisted_C_)
        @Js
        def PyJsHoisted_h_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if var.get(u'g')(var.get(u'a')).neg():
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            #for JS loop
            
            while (var.get(u'g')(var.get(u'a')) and var.get(u'b')().neg()):
                var.put(u'a', var.get(u'c')())
            
            (var.get(u'g')(var.get(u'a')) or var.get(u'd')(var.get(u'a')))
            return Js(0.0).neg()
        PyJsHoisted_h_.func_name = u'h'
        var.put(u'h', PyJsHoisted_h_)
        @Js
        def PyJsHoisted_J_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'f'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            var.put(u'f', Js(u''))
            if var.get(u'v')(var.get(u'a')).neg():
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            #for JS loop
            
            while (var.get(u'v')(var.get(u'a')) and var.get(u'b')().neg()):
                PyJsComma(var.put(u'f', var.get(u'a'), u'+'),var.put(u'a', var.get(u'c')()))
            
            (var.put(u'f', var.get(u'a'), u'+') if var.get(u'v')(var.get(u'a')) else var.get(u'd')(var.get(u'a')))
            return Js([Js(0.0), var.get(u'f')])
        PyJsHoisted_J_.func_name = u'J'
        var.put(u'J', PyJsHoisted_J_)
        @Js
        def PyJsHoisted_m_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if PyJsStrictNeq(Js(u'#'),var.get(u'a')):
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            var.put(u'a', var.get(u'n')())
            return (Js([Js(3.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]) if (PyJsStrictNeq(Js(1.0).neg(),var.get(u'a')) and var.get(u'k')(var.get(u'a'))) else var.get(u'f')())
        PyJsHoisted_m_.func_name = u'm'
        var.put(u'm', PyJsHoisted_m_)
        @Js
        def PyJsHoisted_l_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if PyJsStrictNeq(Js(u'!'),var.get(u'a')):
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            var.put(u'a', var.get(u'n')())
            return (Js([Js(4.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]) if (PyJsStrictNeq(Js(1.0).neg(),var.get(u'a')) and var.get(u'k')(var.get(u'a'))) else var.get(u'f')())
        PyJsHoisted_l_.func_name = u'l'
        var.put(u'l', PyJsHoisted_l_)
        @Js
        def PyJsHoisted_n_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'ma', u'e', u'g'])
            @Js
            def PyJsHoisted_a_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a', u'b'])
                if PyJsStrictEq(var.get(u'g'),var.get(u'ma')):
                    var.put(u'g', var.get(u'a'))
                else:
                    #for JS loop
                    var.put(u'b', var.get(u'g'))
                    while 1:
                        if var.get(u'k')(var.get(u'b')).neg():
                            return var.get(u'A')()
                        if PyJsStrictEq(var.get(u'b').get(u'2'),var.get(u'ma')):
                            break
                        var.put(u'b', var.get(u'b').get(u'2'))
                    
                    if (var.get(u'k')(var.get(u'b')).neg() or PyJsStrictNeq(var.get(u'b').get(u'2'),var.get(u'ma'))):
                        return var.get(u'A')()
                    var.get(u'b').put(u'2', var.get(u'a'))
            PyJsHoisted_a_.func_name = u'a'
            var.put(u'a', PyJsHoisted_a_)
            pass
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'e', var.get(u'c')())
            if PyJsStrictNeq(Js(u'('),var.get(u'e')):
                return PyJsComma(var.get(u'd')(var.get(u'e')),Js(1.0).neg())
            #for JS loop
            var.put(u'ma', Js([Js(0.0), Js(u'!!@@READ||HOLE@@!!')]))
            var.put(u'g', var.get(u'ma'))
            while 1:
                var.get(u'h')()
                if var.get(u'b')():
                    return var.get(u'f')()
                var.put(u'e', var.get(u'c')())
                if PyJsStrictEq(Js(u')'),var.get(u'e')):
                    return PyJsComma(var.get(u'a')(var.get(u'N')),var.get(u'g'))
                if PyJsStrictEq(Js(u'.'),var.get(u'e')):
                    var.get(u'h')()
                    var.put(u'e', var.get(u'w')())
                    var.get(u'a')(var.get(u'e'))
                    var.get(u'h')()
                    if var.get(u'b')():
                        return var.get(u'f')()
                    var.put(u'e', var.get(u'c')())
                    return (var.get(u'f')() if PyJsStrictNeq(Js(u')'),var.get(u'e')) else var.get(u'g'))
                var.get(u'd')(var.get(u'e'))
                var.put(u'e', var.get(u'w')())
                var.get(u'a')(Js([Js(1.0), var.get(u'e'), var.get(u'ma')]))
            
        PyJsHoisted_n_.func_name = u'n'
        var.put(u'n', PyJsHoisted_n_)
        @Js
        def PyJsHoisted_G_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            var.put(u'a', var.get(u'C')())
            return (Js(1.0).neg() if PyJsStrictEq(Js(1.0).neg(),var.get(u'a')) else (var.get(u'a') if var.get(u'z')(var.get(u'a')) else var.get(u'B')(var.get(u'a'))))
        PyJsHoisted_G_.func_name = u'G'
        var.put(u'G', PyJsHoisted_G_)
        @Js
        def PyJsHoisted_r_(a, e, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'e':e, u'arguments':arguments}, var)
            var.registers([u'a', u'e'])
            @Js
            def PyJs_anonymous_30_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([u'h', u'g'])
                if var.get(u'b')():
                    return Js(1.0).neg()
                var.put(u'h', var.get(u'c')())
                if PyJsStrictNeq(var.get(u'h'),var.get(u'a')):
                    return PyJsComma(var.get(u'd')(var.get(u'h')),Js(1.0).neg())
                var.put(u'h', var.get(u'n')())
                if (PyJsStrictEq(Js(1.0).neg(),var.get(u'h')) or var.get(u'k')(var.get(u'h')).neg()):
                    return var.get(u'f')()
                var.put(u'g', var.get(u'h').get(u'2'))
                return (var.get(u'e')(var.get(u'h').get(u'1'), var.get(u'g').get(u'1')) if (var.get(u'k')(var.get(u'g')) and var.get(u'p')(var.get(u'g').get(u'2'))) else var.get(u'f')())
            PyJs_anonymous_30_._set_name(u'anonymous')
            return PyJs_anonymous_30_
        PyJsHoisted_r_.func_name = u'r'
        var.put(u'r', PyJsHoisted_r_)
        @Js
        def PyJsHoisted_w_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            var.get(u'h')()
            #for JS loop
            var.put(u'a', Js([var.get(u'n'), var.get(u'G'), var.get(u'm'), var.get(u'l'), var.get(u'H'), var.get(u'I'), var.get(u'L'), var.get(u'M')]))
            var.put(u'b', Js(0.0))
            while (var.get(u'b')<var.get(u'a').get(u'length')):
                try:
                    var.put(u'c', var.get(u'a').callprop(var.get(u'b')))
                    if PyJsStrictNeq(Js(1.0).neg(),var.get(u'c')):
                        return var.get(u'c')
                finally:
                        (var.put(u'b',Js(var.get(u'b').to_number())+Js(1))-Js(1))
            return var.get(u'f')()
        PyJsHoisted_w_.func_name = u'w'
        var.put(u'w', PyJsHoisted_w_)
        @Js
        def PyJsHoisted_v_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            if var.get(u'g')(var.get(u'a')):
                return Js(1.0).neg()
            #for JS loop
            var.put(u'b', Js(u'()!#.$%^@~/->_:?[]&').callprop(u'split', Js(u'')))
            var.put(u'c', Js(0.0))
            while (var.get(u'c')<var.get(u'b').get(u'length')):
                try:
                    if PyJsStrictEq(var.get(u'a'),var.get(u'b').get(var.get(u'c'))):
                        return Js(1.0).neg()
                finally:
                        (var.put(u'c',Js(var.get(u'c').to_number())+Js(1))-Js(1))
            return Js(0.0).neg()
        PyJsHoisted_v_.func_name = u'v'
        var.put(u'v', PyJsHoisted_v_)
        @Js
        def PyJsHoisted_y_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            var.get(u'x')(var.get(u'b')().neg())
            var.get(u'x')(PyJsStrictEq(var.get(u'c')(),var.get(u'a')))
        PyJsHoisted_y_.func_name = u'y'
        var.put(u'y', PyJsHoisted_y_)
        @Js
        def PyJsHoisted_x_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            return (var.get(u'f')() if PyJsStrictEq(Js(1.0).neg(),var.get(u'a')) else var.get(u'a'))
        PyJsHoisted_x_.func_name = u'x'
        var.put(u'x', PyJsHoisted_x_)
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        var.put(u'D', var.get(u'a').callprop(u'split', Js(u'')))
        @Js
        def PyJs_anonymous_31_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            var.put(u'c', var.get(u'Y')(var.get(u'a')))
            return (var.get(u'f')() if PyJsStrictEq(Js(1.0).neg(),var.get(u'c')) else Js([Js(6.0), var.get(u'c'), var.get(u'b')]))
        PyJs_anonymous_31_._set_name(u'anonymous')
        var.put(u'H', var.get(u'r')(Js(u'$'), PyJs_anonymous_31_))
        @Js
        def PyJs_anonymous_32_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_33_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_33_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_34_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_34_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'b'), PyJs_anonymous_33_, PyJs_anonymous_34_))
            return Js([Js(7.0), var.get(u'a'), var.get(u'c')])
        PyJs_anonymous_32_._set_name(u'anonymous')
        var.put(u'I', var.get(u'r')(Js(u'%'), PyJs_anonymous_32_))
        @Js
        def PyJs_anonymous_35_(a, b, c, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_36_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_36_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_37_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_37_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'c'), PyJs_anonymous_36_, PyJs_anonymous_37_))
            var.put(u'a', var.get(u'Y')(var.get(u'a')))
            return (var.get(u'f')() if PyJsStrictEq(Js(1.0).neg(),var.get(u'a')) else Js([Js(8.0), var.get(u'a'), var.get(u'b'), var.get(u'c')]))
        PyJs_anonymous_35_._set_name(u'anonymous')
        @Js
        def PyJs_anonymous_38_(a, e, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'e':e, u'arguments':arguments}, var)
            var.registers([u'a', u'e'])
            @Js
            def PyJs_anonymous_39_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([u'h', u'J', u'g'])
                if var.get(u'b')():
                    return Js(1.0).neg()
                var.put(u'g', var.get(u'c')())
                if PyJsStrictNeq(var.get(u'g'),var.get(u'a')):
                    return PyJsComma(var.get(u'd')(var.get(u'g')),Js(1.0).neg())
                var.put(u'g', var.get(u'n')())
                if (PyJsStrictEq(Js(1.0).neg(),var.get(u'g')) or var.get(u'k')(var.get(u'g')).neg()):
                    return var.get(u'f')()
                var.put(u'h', var.get(u'g').get(u'2'))
                if var.get(u'k')(var.get(u'h')).neg():
                    return var.get(u'f')()
                var.put(u'J', var.get(u'h').get(u'2'))
                return (var.get(u'e')(var.get(u'g').get(u'1'), var.get(u'h').get(u'1'), var.get(u'J').get(u'1')) if (var.get(u'k')(var.get(u'J')) and var.get(u'p')(var.get(u'J').get(u'2'))) else var.get(u'f')())
            PyJs_anonymous_39_._set_name(u'anonymous')
            return PyJs_anonymous_39_
        PyJs_anonymous_38_._set_name(u'anonymous')
        var.put(u'L', PyJs_anonymous_38_(Js(u'@'), PyJs_anonymous_35_))
        @Js
        def PyJs_anonymous_40_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_41_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_41_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_42_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_42_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'b'), PyJs_anonymous_41_, PyJs_anonymous_42_))
            return Js([Js(9.0), var.get(u'a'), var.get(u'c')])
        PyJs_anonymous_40_._set_name(u'anonymous')
        var.put(u'M', var.get(u'r')(Js(u'^'), PyJs_anonymous_40_))
        return var.get(u'w')()
    PyJsHoisted_va_.func_name = u'va'
    var.put(u'va', PyJsHoisted_va_)
    @Js
    def PyJsHoisted_Na_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd', u'f'])
        #for JS loop
        var.put(u'd', Js([]))
        var.put(u'f', Js(0.0))
        while (var.get(u'f')<var.get(u'a').get(u'length')):
            try:
                if var.get(u'v')(var.get(u'a').get((var.get(u'f')+Js(0.0))), var.get(u'b')):
                    var.get(u'd').put((var.get(u'f')+Js(0.0)), var.get(u'b'))
                    var.get(u'd').put((var.get(u'f')+Js(1.0)), var.get(u'c'))
                    #for JS loop
                    var.put(u'f', Js(2.0), u'+')
                    while (var.get(u'f')<var.get(u'a').get(u'length')):
                        try:
                            PyJsComma(var.get(u'd').put((var.get(u'f')+Js(0.0)), var.get(u'a').get((var.get(u'f')+Js(0.0)))),var.get(u'd').put((var.get(u'f')+Js(1.0)), var.get(u'a').get((var.get(u'f')+Js(1.0)))))
                        finally:
                                var.put(u'f', Js(2.0), u'+')
                    return var.get(u'd')
                var.get(u'd').put((var.get(u'f')+Js(0.0)), var.get(u'a').get((var.get(u'f')+Js(0.0))))
                var.get(u'd').put((var.get(u'f')+Js(1.0)), var.get(u'a').get((var.get(u'f')+Js(1.0))))
            finally:
                    var.put(u'f', Js(2.0), u'+')
        var.get(u'd').put((var.get(u'a').get(u'length')+Js(0.0)), var.get(u'b'))
        var.get(u'd').put((var.get(u'a').get(u'length')+Js(1.0)), var.get(u'c'))
        return var.get(u'd')
    PyJsHoisted_Na_.func_name = u'Na'
    var.put(u'Na', PyJsHoisted_Na_)
    @Js
    def PyJsHoisted_ca_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'1')
    PyJsHoisted_ca_.func_name = u'ca'
    var.put(u'ca', PyJsHoisted_ca_)
    @Js
    def PyJsHoisted_xa_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(1.0), var.get(u'a'), var.get(u'b')])
    PyJsHoisted_xa_.func_name = u'xa'
    var.put(u'xa', PyJsHoisted_xa_)
    @Js
    def PyJsHoisted_ea_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'1')
    PyJsHoisted_ea_.func_name = u'ea'
    var.put(u'ea', PyJsHoisted_ea_)
    @Js
    def PyJsHoisted_za_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), var.get(u'u'), var.get(u'a')), var.get(u'O')))
    PyJsHoisted_za_.func_name = u'za'
    var.put(u'za', PyJsHoisted_za_)
    @Js
    def PyJsHoisted_ob_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd', u'g', u'f', u'h'])
        var.put(u'c', var.get(u'y')(var.get(u'b')))
        if var.get(u'x')(var.get(u'c')):
            return Js([Js(6.0), var.get(u'a'), var.get(u'c')])
        var.put(u'd', Js([Js(4.0), var.get(u'E'), var.get(u'e')(var.get(u'ja'), var.get(u'e')(var.get(u'ra'), var.get(u'e')(var.get(u'M')(var.get(u'a')), var.get(u'c'))))]))
        if var.get(u'k')(var.get(u'c')):
            #for JS loop
            var.put(u'f', Js([]))
            var.put(u'g', var.get(u'c'))
            while var.get(u'p')(var.get(u'g')).neg():
                if var.get(u'x')(var.get(u'g')):
                    return Js([Js(6.0), var.get(u'a'), var.get(u'c')])
                if var.get(u'k')(var.get(u'g')):
                    PyJsComma(var.get(u'f').callprop(u'push', var.get(u'g').get(u'1')),var.put(u'g', var.get(u'y')(var.get(u'g').get(u'2'))))
                else:
                    return var.get(u'd')
            
            if var.get(u'v')(var.get(u'f').get(u'0'), var.get(u'X')):
                if PyJsStrictEq(Js(1.0),var.get(u'f').get(u'length')):
                    return var.get(u'd')
                var.put(u'g', var.get(u'f').get(u'1'))
                var.put(u'c', Js([]))
                #for JS loop
                var.put(u'd', Js(2.0))
                while (var.get(u'd')<var.get(u'f').get(u'length')):
                    try:
                        var.get(u'c').put((var.get(u'd')-Js(2.0)), var.get(u'f').get(var.get(u'd')))
                    finally:
                            (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
                return Js([Js(8.0), var.get(u'a'), var.get(u'g'), var.get(u'c')])
            if var.get(u'v')(var.get(u'f').get(u'0'), var.get(u'Ya')):
                if PyJsStrictEq(Js(1.0),var.get(u'f').get(u'length')):
                    return var.get(u'd')
                var.put(u'g', var.get(u'l')(Js([Js(6.0), var.get(u'a'), var.get(u'f').get(u'1')])))
                if var.get(u'w')(var.get(u'g')).neg():
                    return var.get(u'd')
                var.put(u'h', var.get(u'y')(var.get(u'g').get(u'1')))
                if var.get(u'x')(var.get(u'h')):
                    return Js([Js(6.0), var.get(u'a'), var.get(u'c')])
                if (var.get(u'z')(var.get(u'h')).neg() or var.get(u'P')(var.get(u'h'), var.get(u'K')).neg()):
                    return var.get(u'd')
                var.put(u'h', var.get(u'y')(var.get(u'g').get(u'2')))
                if var.get(u'x')(var.get(u'h')):
                    return Js([Js(6.0), var.get(u'a'), var.get(u'c')])
                if var.get(u'k')(var.get(u'h')).neg():
                    return var.get(u'd')
                var.put(u'g', var.get(u'h').get(u'1'))
                var.put(u'h', var.get(u'y')(var.get(u'h').get(u'2')))
                if var.get(u'x')(var.get(u'h')):
                    return Js([Js(6.0), var.get(u'a'), var.get(u'c')])
                if var.get(u'p')(var.get(u'h')).neg():
                    return var.get(u'd')
                var.put(u'c', Js([var.get(u'M')(var.get(u'a'))]))
                #for JS loop
                var.put(u'd', Js(2.0))
                while (var.get(u'd')<var.get(u'f').get(u'length')):
                    try:
                        var.get(u'c').put((var.get(u'd')-Js(1.0)), var.get(u'f').get(var.get(u'd')))
                    finally:
                            (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
                return Js([Js(9.0), var.get(u'g'), var.get(u'c')])
            if var.get(u'v')(var.get(u'f').get(u'0'), var.get(u'ja')):
                if PyJsStrictEq(Js(1.0),var.get(u'f').get(u'length')):
                    return var.get(u'd')
                var.put(u'g', var.get(u'f').get(u'1'))
                var.put(u'c', Js([]))
                #for JS loop
                var.put(u'd', Js(2.0))
                while (var.get(u'd')<var.get(u'f').get(u'length')):
                    try:
                        var.get(u'c').put((var.get(u'd')-Js(2.0)), Js([Js(6.0), var.get(u'a'), var.get(u'f').get(var.get(u'd'))]))
                    finally:
                            (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
                return Js([Js(7.0), var.get(u'g'), var.get(u'c')])
            var.put(u'g', Js([Js(6.0), var.get(u'a'), var.get(u'f').get(u'0')]))
            var.put(u'c', Js([]))
            #for JS loop
            var.put(u'd', Js(1.0))
            while (var.get(u'd')<var.get(u'f').get(u'length')):
                try:
                    var.get(u'c').put((var.get(u'd')-Js(1.0)), Js([Js(6.0), var.get(u'a'), var.get(u'f').get(var.get(u'd'))]))
                finally:
                        (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
            return Js([Js(9.0), var.get(u'g'), var.get(u'c')])
        return (var.get(u'c') if var.get(u'p')(var.get(u'c')) else (var.get(u'Wa')(var.get(u'a'), var.get(u'c'), var.get(u'd')) if (var.get(u'z')(var.get(u'c')) or var.get(u'w')(var.get(u'c'))) else (var.get(u'd') if var.get(u'D')(var.get(u'c')) else var.get(u'A')())))
    PyJsHoisted_ob_.func_name = u'ob'
    var.put(u'ob', PyJsHoisted_ob_)
    @Js
    def PyJsHoisted_ia_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'q'), var.get(u'e')(var.get(u'R'), var.get(u'e')(var.get(u't'), var.get(u'a'), var.get(u'u')))))
    PyJsHoisted_ia_.func_name = u'ia'
    var.put(u'ia', PyJsHoisted_ia_)
    @Js
    def PyJsHoisted_D_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return PyJsStrictEq(Js(4.0),var.get(u'a').get(u'0'))
    PyJsHoisted_D_.func_name = u'D'
    var.put(u'D', PyJsHoisted_D_)
    @Js
    def PyJsHoisted_Wa_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd'])
        #for JS loop
        var.put(u'd', Js(0.0))
        while (var.get(u'd')<var.get(u'a').get(u'length')):
            try:
                if var.get(u'v')(var.get(u'a').get((var.get(u'd')+Js(0.0))), var.get(u'b')):
                    return var.get(u'a').get((var.get(u'd')+Js(1.0)))
            finally:
                    var.put(u'd', Js(2.0), u'+')
        return var.get(u'c')
    PyJsHoisted_Wa_.func_name = u'Wa'
    var.put(u'Wa', PyJsHoisted_Wa_)
    @Js
    def PyJsHoisted_pb_(a, b, c, d, this, arguments, var=var):
        var = Scope({u'a':a, u'c':c, u'b':b, u'd':d, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd', u'g', u'f', u'h', u'J'])
        (PyJsStrictEq(PyJsComma(Js(0.0), Js(None)),var.get(u'd')) and var.put(u'd', PyJsComma(Js(0.0), Js(None))))
        var.put(u'b', var.get(u'I')(var.get(u'b')))
        #for JS loop
        var.put(u'f', Js([]))
        var.put(u'g', Js(1.0).neg())
        var.put(u'h', var.get(u'b'))
        while var.get(u'p')(var.get(u'h')).neg():
            if (var.get(u'z')(var.get(u'h')) or var.get(u'w')(var.get(u'h'))):
                PyJsComma(PyJsComma(var.get(u'f').callprop(u'push', var.get(u'h')),var.put(u'g', Js(0.0).neg())),var.put(u'h', var.get(u'N')))
            else:
                if var.get(u'k')(var.get(u'h')):
                    PyJsComma(var.get(u'f').callprop(u'push', var.get(u'h').get(u'1')),var.put(u'h', var.get(u'h').get(u'2')))
                else:
                    return (var.get(u'ya')(var.get(u'E'), var.get(u'e')(var.get(u'X'), var.get(u'e')(var.get(u'M')(var.get(u'a')), var.get(u'Ma'), var.get(u'F')(Js([var.get(u'b'), var.get(u'c')]))))) if PyJsStrictEq(PyJsComma(Js(0.0), Js(None)),var.get(u'd')) else var.get(u'd'))
        
        var.put(u'd', var.get(u'b'))
        (var.get(u'g') and var.put(u'd', var.get(u'F')(var.get(u'f'))))
        var.put(u'J', Js([]))
        @Js
        def PyJs_anonymous_11_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'b'])
            #for JS loop
            var.put(u'b', Js(0.0))
            while (var.get(u'b')<var.get(u'f').get(u'length')):
                try:
                    if var.get(u'v')(var.get(u'f').get(var.get(u'b')), var.get(u'a')):
                        return var.get('undefined')
                finally:
                        (var.put(u'b',Js(var.get(u'b').to_number())+Js(1))-Js(1))
            var.get(u'J').callprop(u'push', var.get(u'a'))
        PyJs_anonymous_11_._set_name(u'anonymous')
        var.get(u'Xa')(var.get(u'a'), PyJs_anonymous_11_)
        var.put(u'g', var.get(u'd'))
        #for JS loop
        var.put(u'h', (var.get(u'J').get(u'length')-Js(1.0)))
        while (Js(0.0)<=var.get(u'h')):
            try:
                var.put(u'g', Js([Js(1.0), var.get(u'J').get(var.get(u'h')), var.get(u'g')]))
            finally:
                    (var.put(u'h',Js(var.get(u'h').to_number())-Js(1))+Js(1))
        #for JS loop
        var.put(u'h', (var.get(u'J').get(u'length')-Js(1.0)))
        while (Js(0.0)<=var.get(u'h')):
            try:
                var.put(u'd', var.get(u'xa')(var.get(u'e')(var.get(u'X'), var.get(u'sa'), var.get(u'rb')(var.get(u'a'), var.get(u'J').get(var.get(u'h')))), var.get(u'd')))
            finally:
                    (var.put(u'h',Js(var.get(u'h').to_number())-Js(1))+Js(1))
        return Js([Js(3.0), var.get(u'q'), var.get(u'e')(var.get(u'b'), Js([Js(1.0), var.get(u'e')(var.get(u'X'), var.get(u'sa'), Js([Js(3.0), var.get(u'q'), var.get(u'e')(var.get(u'g'), var.get(u'c'))])), var.get(u'd')]))])
    PyJsHoisted_pb_.func_name = u'pb'
    var.put(u'pb', PyJsHoisted_pb_)
    @Js
    def PyJsHoisted_ya_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(4.0), var.get(u'a'), var.get(u'b')])
    PyJsHoisted_ya_.func_name = u'ya'
    var.put(u'ya', PyJsHoisted_ya_)
    @Js
    def PyJsHoisted_r_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        var.put(u'a', var.get(u'U')(var.get(u'a')))
        pass
        if var.get(u'p')(var.get(u'a')):
            return Js(u'()')
        if var.get(u'k')(var.get(u'a')):
            var.put(u'c', Js(u'('))
            #for JS loop
            var.put(u'b', Js(u''))
            while var.get(u'k')(var.get(u'a')):
                PyJsComma(PyJsComma(var.put(u'c', (var.get(u'b')+var.get(u'r')(var.get(u'a').get(u'1'))), u'+'),var.put(u'b', Js(u' '))),var.put(u'a', var.get(u'U')(var.get(u'a').get(u'2'))))
            
            return var.put(u'c', ((var.get(u'c')+Js(u')')) if var.get(u'p')(var.get(u'a')) else (var.get(u'c')+((Js(u' . ')+var.get(u'r')(var.get(u'a')))+Js(u')')))))
        def PyJs_LONG_16_(var=var):
            def PyJs_LONG_15_(var=var):
                return (((((((Js(u'@(')+var.get(u'r')(var.get(u'M')(var.get(u'a').get(u'1'))))+Js(u' '))+var.get(u'r')(var.get(u'a').get(u'2')))+Js(u' '))+var.get(u'r')(var.get(u'F')(var.get(u'a').get(u'3'))))+Js(u')')) if PyJsStrictEq(Js(8.0),var.get(u'a').get(u'0')) else (((((Js(u'^(')+var.get(u'r')(var.get(u'a').get(u'1')))+Js(u' '))+var.get(u'r')(var.get(u'F')(var.get(u'a').get(u'2'))))+Js(u')')) if PyJsStrictEq(Js(9.0),var.get(u'a').get(u'0')) else var.get(u'A')()))
            return (var.get(u'a').get(u'1') if var.get(u'z')(var.get(u'a')) else (((((Js(u'$(')+var.get(u'r')(var.get(u'M')(var.get(u'a').get(u'1'))))+Js(u' '))+var.get(u'r')(var.get(u'a').get(u'2')))+Js(u')')) if PyJsStrictEq(Js(6.0),var.get(u'a').get(u'0')) else (((((Js(u'%(')+var.get(u'r')(var.get(u'a').get(u'1')))+Js(u' '))+var.get(u'r')(var.get(u'F')(var.get(u'a').get(u'2'))))+Js(u')')) if PyJsStrictEq(Js(7.0),var.get(u'a').get(u'0')) else PyJs_LONG_15_())))
        return ((Js(u'#')+var.get(u'r')(Js([Js(1.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]))) if var.get(u'w')(var.get(u'a')) else ((Js(u'!')+var.get(u'r')(Js([Js(1.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]))) if var.get(u'D')(var.get(u'a')) else PyJs_LONG_16_()))
    PyJsHoisted_r_.func_name = u'r'
    var.put(u'r', PyJsHoisted_r_)
    @Js
    def PyJsHoisted_rb_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        #for JS loop
        var.put(u'c', Js(0.0))
        while (var.get(u'c')<var.get(u'a').get(u'length')):
            try:
                if var.get(u'v')(var.get(u'a').get((var.get(u'c')+Js(0.0))), var.get(u'b')):
                    return var.get(u'a').get((var.get(u'c')+Js(1.0)))
            finally:
                    var.put(u'c', Js(2.0), u'+')
        return var.get(u'A')()
    PyJsHoisted_rb_.func_name = u'rb'
    var.put(u'rb', PyJsHoisted_rb_)
    @Js
    def PyJsHoisted_A_(this, arguments, var=var):
        var = Scope({u'this':this, u'arguments':arguments}, var)
        var.registers([])
        PyJsTempException = JsToPyException(Js(u'TheLanguage PANIC'))
        raise PyJsTempException
    PyJsHoisted_A_.func_name = u'A'
    var.put(u'A', PyJsHoisted_A_)
    @Js
    def PyJsHoisted_C_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd'])
        @Js
        def PyJsHoisted_b_(a, c, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'c':c, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'e', u'd', u'g', u'f', u'l'])
            @Js
            def PyJsHoisted_d_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return (((Js(u'[')+var.get(u'a'))+Js(u']')) if PyJsStrictEq(Js(u'inner'),var.get(u'c')) else (var.get(u'a') if PyJsStrictEq(Js(u'top'),var.get(u'c')) else var.get(u'A')()))
            PyJsHoisted_d_.func_name = u'd'
            var.put(u'd', PyJsHoisted_d_)
            pass
            if var.get(u'z')(var.get(u'a')):
                return var.get(u'a').get(u'1')
            var.put(u'f', var.get(u'L')(var.get(u'a')))
            if ((PyJsStrictNeq(Js(1.0).neg(),var.get(u'f')) and PyJsStrictEq(Js(3.0),var.get(u'f').get(u'length'))) and var.get(u'm')(var.get(u'f').get(u'0'), var.get(u't'))):
                var.put(u'e', var.get(u'L')(var.get(u'f').get(u'1')))
                if ((PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')) and PyJsStrictEq(Js(3.0),var.get(u'e').get(u'length'))) and var.get(u'm')(var.get(u'e').get(u'0'), var.get(u'q'))):
                    var.put(u'g', var.get(u'e').get(u'1'))
                    var.put(u'l', var.get(u'L')(var.get(u'g')))
                    if ((PyJsStrictNeq(Js(1.0).neg(),var.get(u'l')) and PyJsStrictEq(Js(1.0),var.get(u'l').get(u'length'))) and var.get(u'm')(var.get(u'e').get(u'2'), var.get(u'u'))):
                        return var.get(u'd')(((var.get(u'b')(var.get(u'l').get(u'0'), Js(u'inner'))+Js(u'.'))+var.get(u'b')(var.get(u'f').get(u'2'), Js(u'inner'))))
                    if ((var.get(u'k')(var.get(u'g')) and var.get(u'm')(var.get(u'g').get(u'2'), var.get(u'u'))) and var.get(u'm')(var.get(u'e').get(u'2'), var.get(u'u'))):
                        return var.get(u'd')(((var.get(u'b')(var.get(u'g').get(u'1'), Js(u'inner'))+Js(u'@'))+var.get(u'b')(var.get(u'f').get(u'2'), Js(u'inner'))))
                    if (var.get(u'm')(var.get(u'g'), var.get(u'u')) and var.get(u'm')(var.get(u'f').get(u'2'), var.get(u'O'))):
                        return var.get(u'd')((Js(u':>')+var.get(u'b')(var.get(u'e').get(u'2'), Js(u'inner'))))
                var.put(u'g', var.get(u'L')(var.get(u'f').get(u'2')))
                if (((var.get(u'm')(var.get(u'f').get(u'1'), var.get(u'q')) and PyJsStrictNeq(Js(1.0).neg(),var.get(u'g'))) and PyJsStrictEq(Js(2.0),var.get(u'g').get(u'length'))) and var.get(u'm')(var.get(u'g').get(u'0'), var.get(u'R'))):
                    return var.get(u'd')((var.get(u'b')(var.get(u'g').get(u'1'), Js(u'inner'))+Js(u'?')))
                def PyJs_LONG_43_(var=var):
                    return ((((PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')) and PyJsStrictEq(Js(2.0),var.get(u'e').get(u'length'))) and var.get(u'm')(var.get(u'f').get(u'2'), var.get(u'O'))) and var.get(u'm')(var.get(u'e').get(u'0'), var.get(u'K'))) and PyJsComma(var.put(u'e', var.get(u'L')(var.get(u'e').get(u'1'))),(((PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')) and PyJsStrictEq(Js(3.0),var.get(u'e').get(u'length'))) and var.get(u'm')(var.get(u'e').get(u'0'), var.get(u'q'))) and var.get(u'm')(var.get(u'e').get(u'1'), var.get(u'u')))))
                if PyJs_LONG_43_():
                    return var.get(u'd')((Js(u':&>')+var.get(u'b')(var.get(u'e').get(u'2'), Js(u'inner'))))
                var.put(u'e', (Js(u'_') if var.get(u'm')(var.get(u'f').get(u'2'), var.get(u'u')) else (Js(u'') if var.get(u'm')(var.get(u'f').get(u'2'), var.get(u'O')) else var.get(u'b')(var.get(u'f').get(u'2'), Js(u'inner')))))
                return var.get(u'd')(((var.get(u'e')+Js(u':'))+var.get(u'b')(var.get(u'f').get(u'1'), Js(u'inner'))))
            if (PyJsStrictNeq(Js(1.0).neg(),var.get(u'f')) and PyJsStrictEq(Js(2.0),var.get(u'f').get(u'length'))):
                if var.get(u'm')(var.get(u'f').get(u'0'), var.get(u'K')):
                    return PyJsComma(var.put(u'e', var.get(u'L')(var.get(u'f').get(u'1'))),(var.get(u'd')((Js(u'&+')+var.get(u'b')(var.get(u'e').get(u'1'), Js(u'inner')))) if ((PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')) and PyJsStrictEq(Js(2.0),var.get(u'e').get(u'length'))) and var.get(u'm')(var.get(u'e').get(u'0'), var.get(u'E'))) else var.get(u'd')((Js(u'&')+var.get(u'b')(var.get(u'f').get(u'1'), Js(u'inner'))))))
                if var.get(u'm')(var.get(u'f').get(u'0'), var.get(u'R')):
                    return var.get(u'd')((var.get(u'b')(var.get(u'f').get(u'1'), Js(u'inner'))+Js(u'~')))
                if var.get(u'm')(var.get(u'f').get(u'0'), var.get(u'E')):
                    return var.get(u'd')((Js(u'+')+var.get(u'b')(var.get(u'f').get(u'1'), Js(u'inner'))))
            else:
                if (((PyJsStrictNeq(Js(1.0).neg(),var.get(u'f')) and PyJsStrictEq(Js(3.0),var.get(u'f').get(u'length'))) and var.get(u'm')(var.get(u'f').get(u'0'), var.get(u'Qa'))) and PyJsComma(var.put(u'e', var.get(u'L')(var.get(u'f').get(u'2'))),(PyJsStrictNeq(Js(1.0).neg(),var.get(u'e')) and PyJsStrictNeq(Js(0.0),var.get(u'e').get(u'length'))))):
                    var.put(u'g', Js(u''))
                    #for JS loop
                    var.put(u'l', Js(0.0))
                    while (var.get(u'l')<var.get(u'e').get(u'length')):
                        try:
                            var.put(u'g', (Js(u'/')+var.get(u'b')(var.get(u'e').get(var.get(u'l')), Js(u'inner'))), u'+')
                        finally:
                                (var.put(u'l',Js(var.get(u'l').to_number())+Js(1))-Js(1))
                    return var.get(u'd')((var.get(u'b')(var.get(u'f').get(u'1'), Js(u'inner'))+var.get(u'g')))
            return (var.get(u'r')(var.get(u'a')) if PyJsStrictEq(Js(u'inner'),var.get(u'c')) else (var.get(u'r')(var.get(u'B')(var.get(u'a'))) if PyJsStrictEq(Js(u'top'),var.get(u'c')) else var.get(u'A')()))
        PyJsHoisted_b_.func_name = u'b'
        var.put(u'b', PyJsHoisted_b_)
        pass
        var.put(u'a', var.get(u'$a')(var.get(u'r')(var.get(u'a'))))
        var.put(u'c', Js(u''))
        var.put(u'd', Js(u''))
        if var.get(u'p')(var.get(u'a')):
            return Js(u'()')
        if var.get(u'k')(var.get(u'a')):
            var.put(u'c', Js(u'('))
            #for JS loop
            var.put(u'd', Js(u''))
            while var.get(u'k')(var.get(u'a')):
                PyJsComma(PyJsComma(var.put(u'c', (var.get(u'd')+var.get(u'C')(var.get(u'a').get(u'1'))), u'+'),var.put(u'd', Js(u' '))),var.put(u'a', var.get(u'a').get(u'2')))
            
            return var.put(u'c', ((var.get(u'c')+Js(u')')) if var.get(u'p')(var.get(u'a')) else (var.get(u'c')+((Js(u' . ')+var.get(u'C')(var.get(u'a')))+Js(u')')))))
        def PyJs_LONG_44_(var=var):
            return PyJsComma(PyJsComma(PyJsComma(var.put(u'c', var.get(u'a').get(u'1')),var.put(u'a', var.get(u'a').get(u'2'))),var.put(u'd', var.get(u'L')(var.get(u'a')))),(var.get(u'b')(var.get(u'd').get(u'1'), Js(u'top')) if (((PyJsStrictNeq(Js(1.0).neg(),var.get(u'd')) and PyJsStrictEq(Js(2.0),var.get(u'd').get(u'length'))) and var.get(u'm')(var.get(u'c'), var.get(u'ha'))) and var.get(u'm')(var.get(u'd').get(u'0'), var.get(u'E'))) else (Js(u'#')+var.get(u'C')(Js([Js(1.0), var.get(u'c'), var.get(u'a')])))))
        def PyJs_LONG_46_(var=var):
            def PyJs_LONG_45_(var=var):
                return (((((((Js(u'@(')+var.get(u'C')(var.get(u'M')(var.get(u'a').get(u'1'))))+Js(u' '))+var.get(u'C')(var.get(u'a').get(u'2')))+Js(u' '))+var.get(u'C')(var.get(u'F')(var.get(u'a').get(u'3'))))+Js(u')')) if PyJsStrictEq(Js(8.0),var.get(u'a').get(u'0')) else (((((Js(u'^(')+var.get(u'C')(var.get(u'a').get(u'1')))+Js(u' '))+var.get(u'C')(var.get(u'F')(var.get(u'a').get(u'2'))))+Js(u')')) if PyJsStrictEq(Js(9.0),var.get(u'a').get(u'0')) else var.get(u'A')()))
            return (var.get(u'a').get(u'1') if var.get(u'z')(var.get(u'a')) else (((((Js(u'$(')+var.get(u'C')(var.get(u'M')(var.get(u'a').get(u'1'))))+Js(u' '))+var.get(u'C')(var.get(u'a').get(u'2')))+Js(u')')) if PyJsStrictEq(Js(6.0),var.get(u'a').get(u'0')) else (((((Js(u'%(')+var.get(u'C')(var.get(u'a').get(u'1')))+Js(u' '))+var.get(u'C')(var.get(u'F')(var.get(u'a').get(u'2'))))+Js(u')')) if PyJsStrictEq(Js(7.0),var.get(u'a').get(u'0')) else PyJs_LONG_45_())))
        return (PyJs_LONG_44_() if var.get(u'w')(var.get(u'a')) else ((Js(u'!')+var.get(u'C')(Js([Js(1.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]))) if var.get(u'D')(var.get(u'a')) else PyJs_LONG_46_()))
    PyJsHoisted_C_.func_name = u'C'
    var.put(u'C', PyJsHoisted_C_)
    @Js
    def PyJsHoisted_B_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return Js([Js(3.0), var.get(u'ha'), var.get(u'e')(var.get(u'E'), var.get(u'a'))])
    PyJsHoisted_B_.func_name = u'B'
    var.put(u'B', PyJsHoisted_B_)
    @Js
    def PyJsHoisted_ba_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'2')
    PyJsHoisted_ba_.func_name = u'ba'
    var.put(u'ba', PyJsHoisted_ba_)
    @Js
    def PyJsHoisted_G_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        (PyJsStrictNeq(var.get(u'a'),var.get(u'b')) and PyJsComma(PyJsComma(PyJsComma(var.get(u'a').put(u'0', Js(5.0)),var.get(u'a').put(u'1', var.get(u'b'))),var.get(u'a').put(u'2', PyJsComma(Js(0.0), Js(None)))),var.get(u'a').put(u'3', PyJsComma(Js(0.0), Js(None)))))
    PyJsHoisted_G_.func_name = u'G'
    var.put(u'G', PyJsHoisted_G_)
    @Js
    def PyJsHoisted_F_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        #for JS loop
        var.put(u'b', var.get(u'N'))
        var.put(u'c', (var.get(u'a').get(u'length')-Js(1.0)))
        while (Js(0.0)<=var.get(u'c')):
            try:
                var.put(u'b', Js([Js(1.0), var.get(u'a').get(var.get(u'c')), var.get(u'b')]))
            finally:
                    (var.put(u'c',Js(var.get(u'c').to_number())-Js(1))+Js(1))
        return var.get(u'b')
    PyJsHoisted_F_.func_name = u'F'
    var.put(u'F', PyJsHoisted_F_)
    @Js
    def PyJsHoisted_I_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        var.put(u'a', var.get(u'l')(var.get(u'a')))
        if var.get(u'w')(var.get(u'a')):
            var.put(u'b', var.get(u'a').get(u'1'))
            var.put(u'c', var.get(u'a').get(u'2'))
            var.get(u'a').put(u'1', var.get(u'I')(var.get(u'b')))
            var.get(u'a').put(u'2', var.get(u'I')(var.get(u'c')))
        else:
            def PyJs_LONG_1_(var=var):
                return (PyJsComma(PyJsComma(PyJsComma(var.put(u'b', var.get(u'a').get(u'1')),var.put(u'c', var.get(u'a').get(u'2'))),var.get(u'a').put(u'1', var.get(u'I')(var.get(u'b')))),var.get(u'a').put(u'2', var.get(u'I')(var.get(u'c')))) if var.get(u'D')(var.get(u'a')) else (var.get(u'k')(var.get(u'a')) and PyJsComma(PyJsComma(PyJsComma(var.put(u'b', var.get(u'a').get(u'1')),var.put(u'c', var.get(u'a').get(u'2'))),var.get(u'a').put(u'1', var.get(u'I')(var.get(u'b')))),var.get(u'a').put(u'2', var.get(u'I')(var.get(u'c'))))))
            PyJs_LONG_1_()
        return var.get(u'a')
    PyJsHoisted_I_.func_name = u'I'
    var.put(u'I', PyJsHoisted_I_)
    @Js
    def PyJsHoisted_H_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(7.0), var.get(u'a'), var.get(u'b')])
    PyJsHoisted_H_.func_name = u'H'
    var.put(u'H', PyJsHoisted_H_)
    @Js
    def PyJsHoisted_M_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        #for JS loop
        var.put(u'b', var.get(u'N'))
        var.put(u'c', Js(0.0))
        while (var.get(u'c')<var.get(u'a').get(u'length')):
            try:
                var.put(u'b', Js([Js(1.0), var.get(u'e')(var.get(u'a').get((var.get(u'c')+Js(0.0))), var.get(u'a').get((var.get(u'c')+Js(1.0)))), var.get(u'b')]))
            finally:
                    var.put(u'c', Js(2.0), u'+')
        return Js([Js(3.0), var.get(u'Oa'), var.get(u'e')(var.get(u'b'))])
    PyJsHoisted_M_.func_name = u'M'
    var.put(u'M', PyJsHoisted_M_)
    @Js
    def PyJsHoisted_L_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        @Js
        def PyJs_anonymous_2_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            return var.get(u'a')
        PyJs_anonymous_2_._set_name(u'anonymous')
        @Js
        def PyJs_anonymous_3_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return Js(1.0).neg()
        PyJs_anonymous_3_._set_name(u'anonymous')
        return var.get(u'S')(var.get(u'a'), PyJs_anonymous_2_, PyJs_anonymous_3_)
    PyJsHoisted_L_.func_name = u'L'
    var.put(u'L', PyJsHoisted_L_)
    @Js
    def PyJsHoisted_da_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'2')
    PyJsHoisted_da_.func_name = u'da'
    var.put(u'da', PyJsHoisted_da_)
    @Js
    def PyJsHoisted_Q_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), var.get(u'e')(var.get(u'a')), var.get(u'u')), var.get(u'b')))
    PyJsHoisted_Q_.func_name = u'Q'
    var.put(u'Q', PyJsHoisted_Q_)
    @Js
    def PyJsHoisted_fa_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'2')
    PyJsHoisted_fa_.func_name = u'fa'
    var.put(u'fa', PyJsHoisted_fa_)
    @Js
    def PyJsHoisted_S_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd'])
        #for JS loop
        var.put(u'd', Js([]))
        while var.get(u'k')(var.get(u'a')):
            PyJsComma(var.get(u'd').callprop(u'push', var.get(u'a').get(u'1')),var.put(u'a', var.get(u'a').get(u'2')))
        
        return (var.get(u'b')(var.get(u'd')) if var.get(u'p')(var.get(u'a')) else var.get(u'c')(var.get(u'd'), var.get(u'a')))
    PyJsHoisted_S_.func_name = u'S'
    var.put(u'S', PyJsHoisted_S_)
    @Js
    def PyJsHoisted_U_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        #for JS loop
        var.put(u'b', Js([]))
        while PyJsStrictEq(Js(5.0),var.get(u'a').get(u'0')):
            PyJsComma(var.get(u'b').callprop(u'push', var.get(u'a')),var.put(u'a', var.get(u'a').get(u'1')))
        
        #for JS loop
        var.put(u'c', Js(0.0))
        while (var.get(u'c')<var.get(u'b').get(u'length')):
            try:
                var.get(u'G')(var.get(u'b').get(var.get(u'c')), var.get(u'a'))
            finally:
                    (var.put(u'c',Js(var.get(u'c').to_number())+Js(1))-Js(1))
        return var.get(u'a')
    PyJsHoisted_U_.func_name = u'U'
    var.put(u'U', PyJsHoisted_U_)
    @Js
    def PyJsHoisted_T_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        if var.get(u'a').neg():
            return var.get(u'A')()
    PyJsHoisted_T_.func_name = u'T'
    var.put(u'T', PyJsHoisted_T_)
    @Js
    def PyJsHoisted_Y_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'e', u'd', u'f'])
        var.put(u'a', var.get(u'l')(var.get(u'a')))
        if var.get(u'w')(var.get(u'a')).neg():
            return Js(1.0).neg()
        var.put(u'b', var.get(u'l')(var.get(u'a').get(u'1')))
        if (var.get(u'z')(var.get(u'b')).neg() or var.get(u'P')(var.get(u'b'), var.get(u'Oa')).neg()):
            return Js(1.0).neg()
        var.put(u'b', var.get(u'l')(var.get(u'a').get(u'2')))
        if (var.get(u'k')(var.get(u'b')).neg() or var.get(u'p')(var.get(u'l')(var.get(u'b').get(u'2'))).neg()):
            return Js(1.0).neg()
        var.put(u'a', Js([]))
        #for JS loop
        var.put(u'b', var.get(u'l')(var.get(u'b').get(u'1')))
        while var.get(u'p')(var.get(u'b')).neg():
            if var.get(u'k')(var.get(u'b')).neg():
                return Js(1.0).neg()
            var.put(u'c', var.get(u'l')(var.get(u'b').get(u'1')))
            var.put(u'b', var.get(u'l')(var.get(u'b').get(u'2')))
            if var.get(u'k')(var.get(u'c')).neg():
                return Js(1.0).neg()
            var.put(u'd', var.get(u'c').get(u'1'))
            var.put(u'c', var.get(u'l')(var.get(u'c').get(u'2')))
            if var.get(u'k')(var.get(u'c')).neg():
                return Js(1.0).neg()
            var.put(u'f', var.get(u'c').get(u'1'))
            if var.get(u'p')(var.get(u'l')(var.get(u'c').get(u'2'))).neg():
                return Js(1.0).neg()
            var.put(u'c', Js(0.0).neg())
            #for JS loop
            var.put(u'e', Js(0.0))
            while (var.get(u'e')<var.get(u'a').get(u'length')):
                try:
                    if var.get(u'v')(var.get(u'a').get((var.get(u'e')+Js(0.0))), var.get(u'd')):
                        var.get(u'a').put((var.get(u'e')+Js(1.0)), var.get(u'f'))
                        var.put(u'c', Js(1.0).neg())
                        break
                finally:
                        var.put(u'e', Js(2.0), u'+')
            (var.get(u'c') and PyJsComma(var.get(u'a').callprop(u'push', var.get(u'd')),var.get(u'a').callprop(u'push', var.get(u'f'))))
        
        return var.get(u'a')
    PyJsHoisted_Y_.func_name = u'Y'
    var.put(u'Y', PyJsHoisted_Y_)
    @Js
    def PyJsHoisted_Z_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        @Js
        def PyJs_anonymous_10_(d, f, this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments, u'd':d, u'f':f}, var)
            var.registers([u'd', u'f'])
            var.put(u'd', var.get(u'y')(var.get(u'd')))
            return (var.get(u'H')(var.get(u'a'), Js([var.get(u'd')])) if var.get(u'x')(var.get(u'd')) else (var.get(u'c')(var.get(u'd')) if var.get(u'b')(var.get(u'd')) else var.get(u'f')))
        PyJs_anonymous_10_._set_name(u'anonymous')
        return Js([var.get(u'a'), Js(1.0), PyJs_anonymous_10_])
    PyJsHoisted_Z_.func_name = u'Z'
    var.put(u'Z', PyJsHoisted_Z_)
    @Js
    def PyJsHoisted_Ua_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(3.0), var.get(u'a'), var.get(u'b')])
    PyJsHoisted_Ua_.func_name = u'Ua'
    var.put(u'Ua', PyJsHoisted_Ua_)
    @Js
    def PyJsHoistedNonPyName(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'e', u'd', u'f', u'h', u'J', u'm', u'l', u'n', u'q', u'r', u'u', u't', u'w', u'v', u'B', u'z'])
        @Js
        def PyJsHoisted_c_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return var.get(u'r').callprop(u'shift')
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        @Js
        def PyJsHoisted_b_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return PyJsStrictEq(Js(0.0),var.get(u'r').get(u'length'))
        PyJsHoisted_b_.func_name = u'b'
        var.put(u'b', PyJsHoisted_b_)
        @Js
        def PyJsHoisted_e_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            return (((PyJsStrictEq(Js(u' '),var.get(u'a')) or PyJsStrictEq(Js(u'\n'),var.get(u'a'))) or PyJsStrictEq(Js(u'\t'),var.get(u'a'))) or PyJsStrictEq(Js(u'\r'),var.get(u'a')))
        PyJsHoisted_e_.func_name = u'e'
        var.put(u'e', PyJsHoisted_e_)
        @Js
        def PyJsHoisted_d_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            var.get(u'r').callprop(u'unshift', var.get(u'a'))
        PyJsHoisted_d_.func_name = u'd'
        var.put(u'd', PyJsHoisted_d_)
        @Js
        def PyJsHoisted_f_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            PyJsTempException = JsToPyException(Js(u'TheLanguage parse ERROR!'))
            raise PyJsTempException
        PyJsHoisted_f_.func_name = u'f'
        var.put(u'f', PyJsHoisted_f_)
        @Js
        def PyJsHoisted_h_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if var.get(u'e')(var.get(u'a')).neg():
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            #for JS loop
            
            while (var.get(u'e')(var.get(u'a')) and var.get(u'b')().neg()):
                var.put(u'a', var.get(u'c')())
            
            (var.get(u'e')(var.get(u'a')) or var.get(u'd')(var.get(u'a')))
            return Js(0.0).neg()
        PyJsHoisted_h_.func_name = u'h'
        var.put(u'h', PyJsHoisted_h_)
        @Js
        def PyJsHoisted_J_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'f'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            var.put(u'f', Js(u''))
            if var.get(u't')(var.get(u'a')).neg():
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            #for JS loop
            
            while (var.get(u't')(var.get(u'a')) and var.get(u'b')().neg()):
                PyJsComma(var.put(u'f', var.get(u'a'), u'+'),var.put(u'a', var.get(u'c')()))
            
            (var.put(u'f', var.get(u'a'), u'+') if var.get(u't')(var.get(u'a')) else var.get(u'd')(var.get(u'a')))
            return Js([Js(0.0), var.get(u'f')])
        PyJsHoisted_J_.func_name = u'J'
        var.put(u'J', PyJsHoisted_J_)
        @Js
        def PyJsHoisted_m_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if PyJsStrictNeq(Js(u'#'),var.get(u'a')):
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            var.put(u'a', var.get(u'n')())
            return (Js([Js(3.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]) if (PyJsStrictNeq(Js(1.0).neg(),var.get(u'a')) and var.get(u'k')(var.get(u'a'))) else var.get(u'f')())
        PyJsHoisted_m_.func_name = u'm'
        var.put(u'm', PyJsHoisted_m_)
        @Js
        def PyJsHoisted_l_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'a', var.get(u'c')())
            if PyJsStrictNeq(Js(u'!'),var.get(u'a')):
                return PyJsComma(var.get(u'd')(var.get(u'a')),Js(1.0).neg())
            var.put(u'a', var.get(u'n')())
            return (Js([Js(4.0), var.get(u'a').get(u'1'), var.get(u'a').get(u'2')]) if (PyJsStrictNeq(Js(1.0).neg(),var.get(u'a')) and var.get(u'k')(var.get(u'a'))) else var.get(u'f')())
        PyJsHoisted_l_.func_name = u'l'
        var.put(u'l', PyJsHoisted_l_)
        @Js
        def PyJsHoisted_n_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'e', u'g', u'n'])
            @Js
            def PyJsHoisted_a_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a', u'b'])
                if PyJsStrictEq(var.get(u'g'),var.get(u'n')):
                    var.put(u'g', var.get(u'a'))
                else:
                    #for JS loop
                    var.put(u'b', var.get(u'g'))
                    while 1:
                        if var.get(u'k')(var.get(u'b')).neg():
                            return var.get(u'A')()
                        if PyJsStrictEq(var.get(u'b').get(u'2'),var.get(u'n')):
                            break
                        var.put(u'b', var.get(u'b').get(u'2'))
                    
                    if (var.get(u'k')(var.get(u'b')).neg() or PyJsStrictNeq(var.get(u'b').get(u'2'),var.get(u'n'))):
                        return var.get(u'A')()
                    var.get(u'b').put(u'2', var.get(u'a'))
            PyJsHoisted_a_.func_name = u'a'
            var.put(u'a', PyJsHoisted_a_)
            pass
            if var.get(u'b')():
                return Js(1.0).neg()
            var.put(u'e', var.get(u'c')())
            if PyJsStrictNeq(Js(u'('),var.get(u'e')):
                return PyJsComma(var.get(u'd')(var.get(u'e')),Js(1.0).neg())
            #for JS loop
            var.put(u'n', Js([Js(0.0), Js(u'!!@@READ||HOLE@@!!')]))
            var.put(u'g', var.get(u'n'))
            while 1:
                var.get(u'h')()
                if var.get(u'b')():
                    return var.get(u'f')()
                var.put(u'e', var.get(u'c')())
                if PyJsStrictEq(Js(u')'),var.get(u'e')):
                    return PyJsComma(var.get(u'a')(var.get(u'N')),var.get(u'g'))
                if PyJsStrictEq(Js(u'.'),var.get(u'e')):
                    var.get(u'h')()
                    var.put(u'e', var.get(u'u')())
                    var.get(u'a')(var.get(u'e'))
                    var.get(u'h')()
                    if var.get(u'b')():
                        return var.get(u'f')()
                    var.put(u'e', var.get(u'c')())
                    return (var.get(u'f')() if PyJsStrictNeq(Js(u')'),var.get(u'e')) else var.get(u'g'))
                var.get(u'd')(var.get(u'e'))
                var.put(u'e', var.get(u'u')())
                var.get(u'a')(Js([Js(1.0), var.get(u'e'), var.get(u'n')]))
            
        PyJsHoisted_n_.func_name = u'n'
        var.put(u'n', PyJsHoisted_n_)
        @Js
        def PyJsHoisted_q_(a, e, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'e':e, u'arguments':arguments}, var)
            var.registers([u'a', u'e'])
            @Js
            def PyJs_anonymous_17_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([u'h', u'g'])
                if var.get(u'b')():
                    return Js(1.0).neg()
                var.put(u'h', var.get(u'c')())
                if PyJsStrictNeq(var.get(u'h'),var.get(u'a')):
                    return PyJsComma(var.get(u'd')(var.get(u'h')),Js(1.0).neg())
                var.put(u'h', var.get(u'n')())
                if (PyJsStrictEq(Js(1.0).neg(),var.get(u'h')) or var.get(u'k')(var.get(u'h')).neg()):
                    return var.get(u'f')()
                var.put(u'g', var.get(u'h').get(u'2'))
                return (var.get(u'e')(var.get(u'h').get(u'1'), var.get(u'g').get(u'1')) if (var.get(u'k')(var.get(u'g')) and var.get(u'p')(var.get(u'g').get(u'2'))) else var.get(u'f')())
            PyJs_anonymous_17_._set_name(u'anonymous')
            return PyJs_anonymous_17_
        PyJsHoisted_q_.func_name = u'q'
        var.put(u'q', PyJsHoisted_q_)
        @Js
        def PyJsHoisted_u_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            var.get(u'h')()
            #for JS loop
            var.put(u'a', Js([var.get(u'n'), var.get(u'J'), var.get(u'm'), var.get(u'l'), var.get(u'v'), var.get(u'w'), var.get(u'z'), var.get(u'B')]))
            var.put(u'b', Js(0.0))
            while (var.get(u'b')<var.get(u'a').get(u'length')):
                try:
                    var.put(u'c', var.get(u'a').callprop(var.get(u'b')))
                    if PyJsStrictNeq(Js(1.0).neg(),var.get(u'c')):
                        return var.get(u'c')
                finally:
                        (var.put(u'b',Js(var.get(u'b').to_number())+Js(1))-Js(1))
            return var.get(u'f')()
        PyJsHoisted_u_.func_name = u'u'
        var.put(u'u', PyJsHoisted_u_)
        @Js
        def PyJsHoisted_t_(a, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            if var.get(u'e')(var.get(u'a')):
                return Js(1.0).neg()
            #for JS loop
            var.put(u'b', Js(u'()!#.$%^@~/->_:?[]&').callprop(u'split', Js(u'')))
            var.put(u'c', Js(0.0))
            while (var.get(u'c')<var.get(u'b').get(u'length')):
                try:
                    if PyJsStrictEq(var.get(u'a'),var.get(u'b').get(var.get(u'c'))):
                        return Js(1.0).neg()
                finally:
                        (var.put(u'c',Js(var.get(u'c').to_number())+Js(1))-Js(1))
            return Js(0.0).neg()
        PyJsHoisted_t_.func_name = u't'
        var.put(u't', PyJsHoisted_t_)
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        pass
        var.put(u'r', var.get(u'a').callprop(u'split', Js(u'')))
        @Js
        def PyJs_anonymous_18_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            var.put(u'c', var.get(u'Y')(var.get(u'a')))
            return (var.get(u'f')() if PyJsStrictEq(Js(1.0).neg(),var.get(u'c')) else Js([Js(6.0), var.get(u'c'), var.get(u'b')]))
        PyJs_anonymous_18_._set_name(u'anonymous')
        var.put(u'v', var.get(u'q')(Js(u'$'), PyJs_anonymous_18_))
        @Js
        def PyJs_anonymous_19_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_20_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_20_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_21_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_21_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'b'), PyJs_anonymous_20_, PyJs_anonymous_21_))
            return Js([Js(7.0), var.get(u'a'), var.get(u'c')])
        PyJs_anonymous_19_._set_name(u'anonymous')
        var.put(u'w', var.get(u'q')(Js(u'%'), PyJs_anonymous_19_))
        @Js
        def PyJs_anonymous_22_(a, b, c, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_23_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_23_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_24_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_24_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'c'), PyJs_anonymous_23_, PyJs_anonymous_24_))
            var.put(u'a', var.get(u'Y')(var.get(u'a')))
            return (var.get(u'f')() if PyJsStrictEq(Js(1.0).neg(),var.get(u'a')) else Js([Js(8.0), var.get(u'a'), var.get(u'b'), var.get(u'c')]))
        PyJs_anonymous_22_._set_name(u'anonymous')
        @Js
        def PyJs_anonymous_25_(a, e, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'e':e, u'arguments':arguments}, var)
            var.registers([u'a', u'e'])
            @Js
            def PyJs_anonymous_26_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([u'h', u'Pa', u'g'])
                if var.get(u'b')():
                    return Js(1.0).neg()
                var.put(u'h', var.get(u'c')())
                if PyJsStrictNeq(var.get(u'h'),var.get(u'a')):
                    return PyJsComma(var.get(u'd')(var.get(u'h')),Js(1.0).neg())
                var.put(u'h', var.get(u'n')())
                if (PyJsStrictEq(Js(1.0).neg(),var.get(u'h')) or var.get(u'k')(var.get(u'h')).neg()):
                    return var.get(u'f')()
                var.put(u'g', var.get(u'h').get(u'2'))
                if var.get(u'k')(var.get(u'g')).neg():
                    return var.get(u'f')()
                var.put(u'Pa', var.get(u'g').get(u'2'))
                return (var.get(u'e')(var.get(u'h').get(u'1'), var.get(u'g').get(u'1'), var.get(u'Pa').get(u'1')) if (var.get(u'k')(var.get(u'Pa')) and var.get(u'p')(var.get(u'Pa').get(u'2'))) else var.get(u'f')())
            PyJs_anonymous_26_._set_name(u'anonymous')
            return PyJs_anonymous_26_
        PyJs_anonymous_25_._set_name(u'anonymous')
        var.put(u'z', PyJs_anonymous_25_(Js(u'@'), PyJs_anonymous_22_))
        @Js
        def PyJs_anonymous_27_(a, b, this, arguments, var=var):
            var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
            var.registers([u'a', u'c', u'b'])
            @Js
            def PyJs_anonymous_28_(a, this, arguments, var=var):
                var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
                var.registers([u'a'])
                return var.get(u'a')
            PyJs_anonymous_28_._set_name(u'anonymous')
            @Js
            def PyJs_anonymous_29_(this, arguments, var=var):
                var = Scope({u'this':this, u'arguments':arguments}, var)
                var.registers([])
                return var.get(u'f')()
            PyJs_anonymous_29_._set_name(u'anonymous')
            var.put(u'c', var.get(u'S')(var.get(u'b'), PyJs_anonymous_28_, PyJs_anonymous_29_))
            return Js([Js(9.0), var.get(u'a'), var.get(u'c')])
        PyJs_anonymous_27_._set_name(u'anonymous')
        var.put(u'B', var.get(u'q')(Js(u'^'), PyJs_anonymous_27_))
        return var.get(u'u')()
    PyJsHoistedNonPyName.func_name = u'$a'
    var.put(u'$a', PyJsHoistedNonPyName)
    @Js
    def PyJsHoisted_ka_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        @Js
        def PyJs_anonymous_9_(c, this, arguments, var=var):
            var = Scope({u'this':this, u'c':c, u'arguments':arguments}, var)
            var.registers([u'c'])
            var.put(u'c', var.get(u'y')(var.get(u'c')))
            return (var.get(u'H')(var.get(u'a'), Js([var.get(u'c')])) if var.get(u'x')(var.get(u'c')) else (var.get(u'la') if var.get(u'b')(var.get(u'c')) else var.get(u'ua')))
        PyJs_anonymous_9_._set_name(u'anonymous')
        return Js([var.get(u'a'), Js(1.0), PyJs_anonymous_9_])
    PyJsHoisted_ka_.func_name = u'ka'
    var.put(u'ka', PyJsHoisted_ka_)
    @Js
    def PyJsHoisted_e_(this, arguments, var=var):
        var = Scope({u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        #for JS loop
        var.put(u'a', Js([]))
        var.put(u'b', Js(0.0))
        while (var.get(u'b')<var.get(u'arguments').get(u'length')):
            try:
                var.get(u'a').put(var.get(u'b'), var.get(u'arguments').get(var.get(u'b')))
            finally:
                    (var.put(u'b',Js(var.get(u'b').to_number())+Js(1))-Js(1))
        return var.get(u'F')(var.get(u'a'))
    PyJsHoisted_e_.func_name = u'e'
    var.put(u'e', PyJsHoisted_e_)
    @Js
    def PyJsHoisted_P_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return (Js(0.0).neg() if PyJsStrictEq(var.get(u'a'),var.get(u'b')) else (PyJsComma(var.get(u'G')(var.get(u'a'), var.get(u'b')),Js(0.0).neg()) if PyJsStrictEq(var.get(u'a').get(u'1'),var.get(u'b').get(u'1')) else Js(1.0).neg()))
    PyJsHoisted_P_.func_name = u'P'
    var.put(u'P', PyJsHoisted_P_)
    @Js
    def PyJsHoisted_k_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return PyJsStrictEq(Js(1.0),var.get(u'a').get(u'0'))
    PyJsHoisted_k_.func_name = u'k'
    var.put(u'k', PyJsHoisted_k_)
    @Js
    def PyJsHoisted_Xa_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        #for JS loop
        var.put(u'c', Js(0.0))
        while (var.get(u'c')<var.get(u'a').get(u'length')):
            try:
                var.get(u'b')(var.get(u'a').get((var.get(u'c')+Js(0.0))), var.get(u'a').get((var.get(u'c')+Js(1.0))))
            finally:
                    var.put(u'c', Js(2.0), u'+')
    PyJsHoisted_Xa_.func_name = u'Xa'
    var.put(u'Xa', PyJsHoisted_Xa_)
    @Js
    def PyJsHoisted_m_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        @Js
        def PyJsHoisted_c_(a, b, c, e, this, arguments, var=var):
            var = Scope({u'a':a, u'c':c, u'b':b, u'e':e, u'arguments':arguments, u'this':this}, var)
            var.registers([u'a', u'c', u'b', u'e'])
            return (PyJsComma(var.get(u'G')(var.get(u'a'), var.get(u'b')),Js(0.0).neg()) if (var.get(u'm')(var.get(u'c')(var.get(u'a')), var.get(u'c')(var.get(u'b'))) and var.get(u'm')(var.get(u'e')(var.get(u'a')), var.get(u'e')(var.get(u'b')))) else Js(1.0).neg())
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        pass
        if PyJsStrictEq(var.get(u'a'),var.get(u'b')):
            return Js(0.0).neg()
        var.put(u'a', var.get(u'U')(var.get(u'a')))
        var.put(u'b', var.get(u'U')(var.get(u'b')))
        def PyJs_LONG_14_(var=var):
            def PyJs_LONG_13_(var=var):
                return (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ea'), var.get(u'fa')) if var.get(u'D')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ca'), var.get(u'da')) if var.get(u'w')(var.get(u'a')) else (Js(1.0).neg() if (((PyJsStrictEq(Js(6.0),var.get(u'a').get(u'0')) or PyJsStrictEq(Js(7.0),var.get(u'a').get(u'0'))) or PyJsStrictEq(Js(8.0),var.get(u'a').get(u'0'))) or PyJsStrictEq(Js(9.0),var.get(u'a').get(u'0'))) else var.get(u'A')())))
            return (Js(1.0).neg() if PyJsStrictNeq(var.get(u'a').get(u'0'),var.get(u'b').get(u'0')) else (PyJsComma(PyJsComma(var.get(u'G')(var.get(u'a'), var.get(u'N')),var.get(u'G')(var.get(u'b'), var.get(u'N'))),Js(0.0).neg()) if var.get(u'p')(var.get(u'a')) else (var.get(u'P')(var.get(u'a'), var.get(u'b')) if var.get(u'z')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'aa'), var.get(u'ba')) if var.get(u'k')(var.get(u'a')) else PyJs_LONG_13_()))))
        return (Js(0.0).neg() if PyJsStrictEq(var.get(u'a'),var.get(u'b')) else PyJs_LONG_14_())
    PyJsHoisted_m_.func_name = u'm'
    var.put(u'm', PyJsHoisted_m_)
    @Js
    def PyJsHoisted_l_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'Va', u'c', u'b', u'e', u'd', u'f', u'h', u'k', u'm', u'n', u'p'])
        @Js
        def PyJsHoisted_d_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a'])
            var.get(u'c').put(u'1', Js(0.0).neg())
            var.get(u'G')(var.get(u'h'), var.get(u'Aa'))
            #for JS loop
            var.put(u'a', Js(0.0))
            while (var.get(u'a')<var.get(u'k').get(u'length')):
                try:
                    var.get(u'G')(var.get(u'k').get(var.get(u'a')), var.get(u'Aa'))
                finally:
                        (var.put(u'a',Js(var.get(u'a').to_number())+Js(1))-Js(1))
            return var.get(u'Aa')
        PyJsHoisted_d_.func_name = u'd'
        var.put(u'd', PyJsHoisted_d_)
        @Js
        def PyJsHoisted_f_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([u'a', u'c'])
            PyJs_Object_4_ = Js({})
            var.put(u'a', PyJs_Object_4_)
            for PyJsTemp in var.get(u'e'):
                var.put(u'c', PyJsTemp)
                var.get(u'a').put(var.get(u'c'), Js(0.0).neg())
            for PyJsTemp in var.get(u'b'):
                var.put(u'c', PyJsTemp)
                var.get(u'a').put(var.get(u'c'), Js(0.0).neg())
            return var.get(u'a')
        PyJsHoisted_f_.func_name = u'f'
        var.put(u'f', PyJsHoisted_f_)
        pass
        pass
        PyJs_Object_5_ = Js({})
        (PyJsStrictEq(PyJsComma(Js(0.0), Js(None)),var.get(u'b')) and var.put(u'b', PyJs_Object_5_))
        (PyJsStrictEq(PyJsComma(Js(0.0), Js(None)),var.get(u'c')) and var.put(u'c', Js([Js(1.0).neg(), Js(1.0).neg()])))
        #for JS loop
        PyJs_Object_6_ = Js({})
        var.put(u'e', PyJs_Object_6_)
        var.put(u'h', var.get(u'a'))
        var.put(u'k', Js([]))
        while var.get(u'x')(var.get(u'h')):
            var.put(u'a', var.get(u'r')(var.get(u'h')))
            if PyJsStrictEq(Js(0.0).neg(),var.get(u'b').get(var.get(u'a'))):
                return var.get(u'd')()
            if PyJsStrictEq(Js(0.0).neg(),var.get(u'e').get(var.get(u'a'))):
                var.get(u'c').put(u'0', Js(0.0).neg())
                if PyJsStrictEq(Js(6.0),var.get(u'h').get(u'0')):
                    return var.get(u'd')()
                if PyJsStrictEq(Js(7.0),var.get(u'h').get(u'0')):
                    var.put(u'a', var.get(u'h').get(u'1'))
                    #for JS loop
                    var.put(u'n', var.get(u'h').get(u'2'))
                    var.put(u'Va', Js([var.get(u'Ba'), var.get(u'Ca'), var.get(u'Da'), var.get(u'Ea'), var.get(u'Fa'), var.get(u'Ga'), var.get(u'Ha'), var.get(u'Ia'), var.get(u'Ja'), var.get(u'Ka'), var.get(u'La')]))
                    var.put(u'p', Js(1.0).neg())
                    var.put(u'm', Js(0.0))
                    while (var.get(u'm')<var.get(u'Va').get(u'length')):
                        try:
                            (var.get(u'v')(var.get(u'Va').get(var.get(u'm')), var.get(u'a')) and var.put(u'p', Js(0.0).neg()))
                        finally:
                                (var.put(u'm',Js(var.get(u'm').to_number())+Js(1))-Js(1))
                    if var.get(u'p'):
                        return PyJsComma(PyJsComma(PyJsComma(var.get(u'T')(PyJsStrictEq(Js(1.0),var.get(u'n').get(u'length'))),var.get(u'T')(PyJsStrictEq(Js(1.0).neg(),var.get(u'c').get(u'1')))),var.put(u'n', var.get(u'l')(var.get(u'n').get(u'0'), var.get(u'f')(), var.get(u'c')))),(var.get(u'l')(var.get(u'H')(var.get(u'a'), Js([var.get(u'n')]))) if var.get(u'c').get(u'1') else var.get(u'A')()))
                    if ((var.get(u'v')(var.get(u'a'), var.get(u'V')) or var.get(u'v')(var.get(u'a'), var.get(u'qa'))) or var.get(u'v')(var.get(u'a'), var.get(u'ra'))):
                        return var.get(u'd')()
                    if (var.get(u'v')(var.get(u'a'), var.get(u'W')) and PyJsComma(PyJsComma(PyJsComma(var.get(u'T')(PyJsStrictEq(Js(3.0),var.get(u'n').get(u'length'))),var.get(u'T')(PyJsStrictEq(Js(1.0).neg(),var.get(u'c').get(u'1')))),var.put(u'a', var.get(u'l')(var.get(u'n').get(u'0'), var.get(u'f')(), var.get(u'c')))),var.get(u'c').get(u'1'))):
                        return var.get(u'l')(var.get(u'H')(var.get(u'W'), Js([var.get(u'a'), var.get(u'n').get(u'1'), var.get(u'n').get(u'2')])))
                else:
                    if (PyJsStrictEq(Js(8.0),var.get(u'h').get(u'0')) or PyJsStrictEq(Js(9.0),var.get(u'h').get(u'0'))):
                        return var.get(u'd')()
                return var.get(u'A')()
            var.get(u'e').put(var.get(u'a'), Js(0.0).neg())
            var.get(u'k').callprop(u'push', var.get(u'h'))
            var.put(u'h', var.get(u'y')(var.get(u'h')))
        
        #for JS loop
        var.put(u'm', Js(0.0))
        while (var.get(u'm')<var.get(u'k').get(u'length')):
            try:
                var.get(u'G')(var.get(u'k').get(var.get(u'm')), var.get(u'h'))
            finally:
                    (var.put(u'm',Js(var.get(u'm').to_number())+Js(1))-Js(1))
        return var.get(u'h')
    PyJsHoisted_l_.func_name = u'l'
    var.put(u'l', PyJsHoisted_l_)
    @Js
    def PyJsHoisted_p_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return PyJsStrictEq(Js(2.0),var.get(u'a').get(u'0'))
    PyJsHoisted_p_.func_name = u'p'
    var.put(u'p', PyJsHoisted_p_)
    @Js
    def PyJsHoisted_qb_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd', u'g', u'f', u'h'])
        @Js
        def PyJsHoisted_c_(this, arguments, var=var):
            var = Scope({u'this':this, u'arguments':arguments}, var)
            var.registers([])
            return Js([Js(4.0), var.get(u'E'), var.get(u'e')(var.get(u'ja'), var.get(u'e')(var.get(u'qa'), var.get(u'e')(var.get(u'a'), var.get(u'F')(var.get(u'b')))))])
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        pass
        var.put(u'a', var.get(u'y')(var.get(u'a')))
        if var.get(u'x')(var.get(u'a')):
            return Js([Js(9.0), var.get(u'a'), var.get(u'b')])
        if var.get(u'w')(var.get(u'a')).neg():
            return var.get(u'c')()
        var.put(u'd', var.get(u'l')(var.get(u'a').get(u'1')))
        if (var.get(u'z')(var.get(u'd')).neg() or var.get(u'P')(var.get(u'd'), var.get(u'q')).neg()):
            return var.get(u'c')()
        var.put(u'f', var.get(u'l')(var.get(u'a').get(u'2')))
        if var.get(u'k')(var.get(u'f')).neg():
            return var.get(u'c')()
        var.put(u'd', var.get(u'I')(var.get(u'f').get(u'1')))
        var.put(u'f', var.get(u'l')(var.get(u'f').get(u'2')))
        if (var.get(u'k')(var.get(u'f')).neg() or var.get(u'p')(var.get(u'l')(var.get(u'f').get(u'2'))).neg()):
            return var.get(u'c')()
        var.put(u'f', var.get(u'f').get(u'1'))
        #for JS loop
        var.put(u'g', var.get(u'Za'))
        while var.get(u'p')(var.get(u'd')).neg():
            if (var.get(u'z')(var.get(u'd')) or var.get(u'w')(var.get(u'd'))):
                PyJsComma(PyJsComma(var.put(u'g', var.get(u'Na')(var.get(u'g'), var.get(u'd'), var.get(u'F')(var.get(u'b')))),var.put(u'b', Js([]))),var.put(u'd', var.get(u'N')))
            else:
                if var.get(u'k')(var.get(u'd')):
                    if var.get(u'b').get(u'length'):
                        var.put(u'h', var.get(u'b').callprop(u'shift'))
                        var.put(u'g', var.get(u'Na')(var.get(u'g'), var.get(u'd').get(u'1'), var.get(u'h')))
                        var.put(u'd', var.get(u'd').get(u'2'))
                    else:
                        return var.get(u'c')()
                else:
                    return var.get(u'c')()
        
        return (var.get(u'c')() if PyJsStrictNeq(Js(0.0),var.get(u'b').get(u'length')) else Js([Js(6.0), var.get(u'g'), var.get(u'f')]))
    PyJsHoisted_qb_.func_name = u'qb'
    var.put(u'qb', PyJsHoisted_qb_)
    @Js
    def PyJsHoisted_w_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return PyJsStrictEq(Js(3.0),var.get(u'a').get(u'0'))
    PyJsHoisted_w_.func_name = u'w'
    var.put(u'w', PyJsHoisted_w_)
    @Js
    def PyJsHoisted_v_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        @Js
        def PyJsHoisted_c_(a, b, c, e, this, arguments, var=var):
            var = Scope({u'a':a, u'c':c, u'b':b, u'e':e, u'arguments':arguments, u'this':this}, var)
            var.registers([u'a', u'c', u'b', u'e'])
            return (PyJsComma(var.get(u'G')(var.get(u'a'), var.get(u'b')),Js(0.0).neg()) if (var.get(u'v')(var.get(u'c')(var.get(u'a')), var.get(u'c')(var.get(u'b'))) and var.get(u'v')(var.get(u'e')(var.get(u'a')), var.get(u'e')(var.get(u'b')))) else Js(1.0).neg())
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        pass
        if PyJsStrictEq(var.get(u'a'),var.get(u'b')):
            return Js(0.0).neg()
        var.put(u'a', var.get(u'l')(var.get(u'a')))
        var.put(u'b', var.get(u'l')(var.get(u'b')))
        def PyJs_LONG_12_(var=var):
            return (var.get(u'P')(var.get(u'a'), var.get(u'b')) if var.get(u'z')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'aa'), var.get(u'ba')) if var.get(u'k')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ea'), var.get(u'fa')) if var.get(u'D')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ca'), var.get(u'da')) if var.get(u'w')(var.get(u'a')) else var.get(u'A')()))))
        return (Js(0.0).neg() if PyJsStrictEq(var.get(u'a'),var.get(u'b')) else (Js(1.0).neg() if PyJsStrictNeq(var.get(u'a').get(u'0'),var.get(u'b').get(u'0')) else (PyJsComma(PyJsComma(var.get(u'G')(var.get(u'a'), var.get(u'N')),var.get(u'G')(var.get(u'b'), var.get(u'N'))),Js(0.0).neg()) if var.get(u'p')(var.get(u'a')) else PyJs_LONG_12_())))
    PyJsHoisted_v_.func_name = u'v'
    var.put(u'v', PyJsHoisted_v_)
    @Js
    def PyJsHoisted_y_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd', u'f'])
        var.put(u'a', var.get(u'U')(var.get(u'a')))
        var.get(u'T')(PyJsStrictNeq(Js(5.0),var.get(u'a').get(u'0')))
        if PyJsStrictEq(Js(6.0),var.get(u'a').get(u'0')):
            var.put(u'b', var.get(u'ob')(var.get(u'a').get(u'1'), var.get(u'a').get(u'2')))
        else:
            if PyJsStrictEq(Js(8.0),var.get(u'a').get(u'0')):
                var.put(u'b', var.get(u'a').get(u'1'))
                var.put(u'c', var.get(u'a').get(u'2'))
                var.put(u'd', var.get(u'a').get(u'3'))
                var.put(u'f', Js([Js(4.0), var.get(u'E'), var.get(u'e')(var.get(u'X'), var.get(u'e')(var.get(u'M')(var.get(u'b')), var.get(u'c'), var.get(u'F')(var.get(u'd'))))]))
                def PyJs_LONG_7_(var=var):
                    return var.put(u'b', ((var.get(u'f') if PyJsStrictNeq(Js(1.0),var.get(u'd').get(u'length')) else var.get(u'd').get(u'0')) if var.get(u'v')(var.get(u'c'), var.get(u'sa')) else ((var.get(u'f') if PyJsStrictNeq(Js(2.0),var.get(u'd').get(u'length')) else var.get(u'pb')(var.get(u'b'), var.get(u'd').get(u'0'), var.get(u'd').get(u'1'), var.get(u'f'))) if var.get(u'v')(var.get(u'c'), var.get(u'Ma')) else var.get(u'f'))))
                PyJs_LONG_7_()
            else:
                if PyJsStrictEq(Js(7.0),var.get(u'a').get(u'0')):
                    class JS_BREAK_LABEL_61(Exception): pass
                    try:
                        var.put(u'f', var.get(u'a').get(u'1'))
                        var.put(u'b', var.get(u'a').get(u'2'))
                        var.put(u'c', Js([Js(4.0), var.get(u'E'), var.get(u'e')(var.get(u'ja'), var.get(u'e')(var.get(u'f'), var.get(u'F')(var.get(u'b'))))]))
                        #for JS loop
                        var.put(u'd', Js(0.0))
                        while (var.get(u'd')<var.get(u'ta').get(u'length')):
                            try:
                                if var.get(u'v')(var.get(u'f'), var.get(u'ta').get(var.get(u'd')).get(u'0')):
                                    var.put(u'f', var.get(u'ta').get(var.get(u'd')).get(u'1'))
                                    if PyJsStrictNeq(var.get(u'b').get(u'length'),var.get(u'f')):
                                        break
                                    var.put(u'd', var.get(u'ta').get(var.get(u'd')).get(u'2'))
                                    def PyJs_LONG_8_(var=var):
                                        return var.put(u'b', (var.get(u'd')(var.get(u'b').get(u'0'), var.get(u'c')) if PyJsStrictEq(Js(1.0),var.get(u'f')) else (var.get(u'd')(var.get(u'b').get(u'0'), var.get(u'b').get(u'1'), var.get(u'c')) if PyJsStrictEq(Js(2.0),var.get(u'f')) else (var.get(u'd')(var.get(u'b').get(u'0'), var.get(u'b').get(u'1'), var.get(u'b').get(u'2'), var.get(u'c')) if PyJsStrictEq(Js(3.0),var.get(u'f')) else var.get(u'A')()))))
                                    PyJs_LONG_8_()
                                    raise JS_BREAK_LABEL_61("Breaked")
                            finally:
                                    (var.put(u'd',Js(var.get(u'd').to_number())+Js(1))-Js(1))
                        var.put(u'b', var.get(u'c'))
                    except JS_BREAK_LABEL_61:
                        pass
                else:
                    var.put(u'b', (var.get(u'qb')(var.get(u'a').get(u'1'), var.get(u'a').get(u'2')) if PyJsStrictEq(Js(9.0),var.get(u'a').get(u'0')) else var.get(u'a')))
        var.put(u'b', var.get(u'U')(var.get(u'b')))
        var.get(u'G')(var.get(u'a'), var.get(u'b'))
        return var.get(u'b')
    PyJsHoisted_y_.func_name = u'y'
    var.put(u'y', PyJsHoisted_y_)
    @Js
    def PyJsHoisted_x_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return ((((PyJsStrictEq(Js(5.0),var.get(u'a').get(u'0')) or PyJsStrictEq(Js(6.0),var.get(u'a').get(u'0'))) or PyJsStrictEq(Js(8.0),var.get(u'a').get(u'0'))) or PyJsStrictEq(Js(7.0),var.get(u'a').get(u'0'))) or PyJsStrictEq(Js(9.0),var.get(u'a').get(u'0')))
    PyJsHoisted_x_.func_name = u'x'
    var.put(u'x', PyJsHoisted_x_)
    @Js
    def PyJsHoisted_z_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return PyJsStrictEq(Js(0.0),var.get(u'a').get(u'0'))
    PyJsHoisted_z_.func_name = u'z'
    var.put(u'z', PyJsHoisted_z_)
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    pass
    var.get(u'exports').put(u'__esModule', Js(0.0).neg())
    @Js
    def PyJs_anonymous_47_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return Js([Js(0.0), var.get(u'a')])
    PyJs_anonymous_47_._set_name(u'anonymous')
    var.get(u'exports').put(u'new_symbol', PyJs_anonymous_47_)
    var.get(u'exports').put(u'symbol_p', var.get(u'z'))
    @Js
    def PyJs_anonymous_48_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'a').get(u'1')
    PyJs_anonymous_48_._set_name(u'anonymous')
    var.get(u'exports').put(u'un_symbol', PyJs_anonymous_48_)
    var.get(u'exports').put(u'new_construction', var.get(u'xa'))
    var.get(u'exports').put(u'construction_p', var.get(u'k'))
    var.get(u'exports').put(u'construction_head', var.get(u'aa'))
    var.get(u'exports').put(u'construction_tail', var.get(u'ba'))
    var.put(u'N', Js([Js(2.0)]))
    var.get(u'exports').put(u'null_v', var.get(u'N'))
    var.get(u'exports').put(u'null_p', var.get(u'p'))
    var.get(u'exports').put(u'new_data', var.get(u'Ua'))
    var.get(u'exports').put(u'data_p', var.get(u'w'))
    var.get(u'exports').put(u'data_name', var.get(u'ca'))
    var.get(u'exports').put(u'data_list', var.get(u'da'))
    var.get(u'exports').put(u'new_error', var.get(u'ya'))
    var.get(u'exports').put(u'error_p', var.get(u'D'))
    var.get(u'exports').put(u'error_name', var.get(u'ea'))
    var.get(u'exports').put(u'error_list', var.get(u'fa'))
    @Js
    def PyJs_anonymous_49_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(6.0), var.get(u'a'), var.get(u'b')])
    PyJs_anonymous_49_._set_name(u'anonymous')
    var.get(u'exports').put(u'evaluate', PyJs_anonymous_49_)
    @Js
    def PyJs_anonymous_50_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        return Js([Js(9.0), var.get(u'a'), var.get(u'b')])
    PyJs_anonymous_50_._set_name(u'anonymous')
    var.get(u'exports').put(u'apply', PyJs_anonymous_50_)
    var.get(u'exports').put(u'force_all_rec', var.get(u'I'))
    var.put(u'E', Js([Js(0.0), Js(u'\u592a\u59cb\u521d\u6838')]))
    var.get(u'exports').put(u'system_symbol', var.get(u'E'))
    var.put(u'ha', Js([Js(0.0), Js(u'\u7b26\u540d')]))
    var.get(u'exports').put(u'name_symbol', var.get(u'ha'))
    var.put(u'q', Js([Js(0.0), Js(u'\u5316\u6ec5')]))
    var.get(u'exports').put(u'function_symbol', var.get(u'q'))
    var.put(u'K', Js([Js(0.0), Js(u'\u5f0f\u5f62')]))
    var.get(u'exports').put(u'form_symbol', var.get(u'K'))
    var.put(u'ab', Js([Js(0.0), Js(u'\u7b49\u540c')]))
    var.get(u'exports').put(u'equal_symbol', var.get(u'ab'))
    var.put(u'bb', Js([Js(0.0), Js(u'\u89e3\u7b97')]))
    var.get(u'exports').put(u'evaluate_sym', var.get(u'bb'))
    var.put(u'O', Js([Js(0.0), Js(u'\u7279\u5b9a\u5176\u7269')]))
    var.get(u'exports').put(u'theThing_symbol', var.get(u'O'))
    var.put(u'u', Js([Js(0.0), Js(u'\u7701\u7565\u4e00\u7269')]))
    var.get(u'exports').put(u'something_symbol', var.get(u'u'))
    var.put(u'Oa', Js([Js(0.0), Js(u'\u6620\u8868')]))
    var.get(u'exports').put(u'mapping_symbol', var.get(u'Oa'))
    var.put(u'cb', Js([Js(0.0), Js(u'\u82e5')]))
    var.get(u'exports').put(u'if_symbol', var.get(u'cb'))
    var.put(u't', Js([Js(0.0), Js(u'\u4e00\u985e\u4f55\u7269')]))
    var.get(u'exports').put(u'typeAnnotation_symbol', var.get(u't'))
    var.put(u'R', Js([Js(0.0), Js(u'\u662f\u975e')]))
    var.get(u'exports').put(u'isOrNot_symbol', var.get(u'R'))
    var.put(u'Qa', Js([Js(0.0), Js(u'\u5176\u5b50')]))
    var.get(u'exports').put(u'sub_symbol', var.get(u'Qa'))
    var.put(u'Ra', Js([Js(0.0), Js(u'\u967d')]))
    var.get(u'exports').put(u'true_symbol', var.get(u'Ra'))
    var.put(u'Sa', Js([Js(0.0), Js(u'\u9670')]))
    var.get(u'exports').put(u'false_symbol', var.get(u'Sa'))
    var.put(u'db', Js([Js(0.0), Js(u'\u5f15\u7528')]))
    var.get(u'exports').put(u'quote_symbol', var.get(u'db'))
    var.put(u'eb', Js([Js(0.0), Js(u'\u61c9\u7528')]))
    var.get(u'exports').put(u'apply_symbol', var.get(u'eb'))
    var.put(u'fb', Js([Js(0.0), Js(u'\u7a7a')]))
    var.get(u'exports').put(u'null_symbol', var.get(u'fb'))
    var.put(u'na', Js([Js(0.0), Js(u'\u9023')]))
    var.get(u'exports').put(u'construction_symbol', var.get(u'na'))
    var.put(u'oa', Js([Js(0.0), Js(u'\u69cb')]))
    var.get(u'exports').put(u'data_symbol', var.get(u'oa'))
    var.put(u'pa', Js([Js(0.0), Js(u'\u8aa4')]))
    var.get(u'exports').put(u'error_symbol', var.get(u'pa'))
    var.put(u'gb', Js([Js(0.0), Js(u'\u8a5e\u7d20')]))
    var.get(u'exports').put(u'symbol_symbol', var.get(u'gb'))
    var.put(u'wa', Js([Js(0.0), Js(u'\u5217')]))
    var.get(u'exports').put(u'list_symbol', var.get(u'wa'))
    var.put(u'hb', Js([Js(0.0), Js(u'\u9996')]))
    var.get(u'exports').put(u'head_symbol', var.get(u'hb'))
    var.put(u'ib', Js([Js(0.0), Js(u'\u5c3e')]))
    var.get(u'exports').put(u'tail_symbol', var.get(u'ib'))
    var.put(u'jb', Js([Js(0.0), Js(u'\u7269')]))
    var.get(u'exports').put(u'thing_symbol', var.get(u'jb'))
    var.put(u'kb', Js([Js(0.0), Js(u'\u5b87\u5b99\u4ea1\u77e3')]))
    var.get(u'exports').put(u'theWorldStopped_symbol', var.get(u'kb'))
    var.get(u'exports').put(u'effect_symbol', Js([Js(0.0), Js(u'\u6548\u61c9')]))
    var.get(u'exports').put(u'sequentialWordFormation_symbol', Js([Js(0.0), Js(u'\u70ba\u7b26\u540d\u9023')]))
    var.get(u'exports').put(u'inputOutput_symbol', Js([Js(0.0), Js(u'\u51fa\u5165\u6539\u6ec5')]))
    var.put(u'Aa', Js([Js(4.0), var.get(u'E'), var.get(u'e')(var.get(u'kb'), var.get(u'u'))]))
    var.put(u'lb', var.get(u'za')(var.get(u'oa')))
    var.get(u'exports').put(u'new_data_function_builtin_systemName', var.get(u'lb'))
    var.put(u'Ba', var.get(u'Q')(var.get(u'oa'), var.get(u'ha')))
    var.get(u'exports').put(u'data_name_function_builtin_systemName', var.get(u'Ba'))
    var.put(u'Ca', var.get(u'Q')(var.get(u'oa'), var.get(u'wa')))
    var.get(u'exports').put(u'data_list_function_builtin_systemName', var.get(u'Ca'))
    var.put(u'Da', var.get(u'ia')(var.get(u'oa')))
    var.get(u'exports').put(u'data_p_function_builtin_systemName', var.get(u'Da'))
    var.put(u'mb', var.get(u'za')(var.get(u'pa')))
    var.get(u'exports').put(u'new_error_function_builtin_systemName', var.get(u'mb'))
    var.put(u'Ea', var.get(u'Q')(var.get(u'pa'), var.get(u'ha')))
    var.get(u'exports').put(u'error_name_function_builtin_systemName', var.get(u'Ea'))
    var.put(u'Fa', var.get(u'Q')(var.get(u'pa'), var.get(u'wa')))
    var.get(u'exports').put(u'error_list_function_builtin_systemName', var.get(u'Fa'))
    var.put(u'Ga', var.get(u'ia')(var.get(u'pa')))
    var.get(u'exports').put(u'error_p_function_builtin_systemName', var.get(u'Ga'))
    var.put(u'nb', var.get(u'za')(var.get(u'na')))
    var.get(u'exports').put(u'new_construction_function_builtin_systemName', var.get(u'nb'))
    var.put(u'Ha', var.get(u'ia')(var.get(u'na')))
    var.get(u'exports').put(u'construction_p_function_builtin_systemName', var.get(u'Ha'))
    var.put(u'Ia', var.get(u'Q')(var.get(u'na'), var.get(u'hb')))
    var.get(u'exports').put(u'construction_head_function_builtin_systemName', var.get(u'Ia'))
    var.put(u'Ja', var.get(u'Q')(var.get(u'na'), var.get(u'ib')))
    var.get(u'exports').put(u'construction_tail_function_builtin_systemName', var.get(u'Ja'))
    var.put(u'Ka', var.get(u'ia')(var.get(u'gb')))
    var.get(u'exports').put(u'symbol_p_function_builtin_systemName', var.get(u'Ka'))
    var.put(u'La', var.get(u'ia')(var.get(u'fb')))
    var.get(u'exports').put(u'null_p_function_builtin_systemName', var.get(u'La'))
    var.put(u'V', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'q'), var.get(u'e')(var.get(u'R'), var.get(u'ab')))))
    var.get(u'exports').put(u'equal_p_function_builtin_systemName', var.get(u'V'))
    var.put(u'qa', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'q'), Js([Js(1.0), var.get(u'q'), var.get(u'u')]), var.get(u'u')), var.get(u'eb'))))
    var.get(u'exports').put(u'apply_function_builtin_systemName', var.get(u'qa'))
    var.put(u'ra', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'q'), var.get(u'bb'))))
    var.get(u'exports').put(u'evaluate_function_builtin_systemName', var.get(u'ra'))
    var.put(u'Ta', var.get(u'Q')(var.get(u'wa'), var.get(u'e')(var.get(u't'), var.get(u'jb'), var.get(u'u'))))
    var.get(u'exports').put(u'list_chooseOne_function_builtin_systemName', var.get(u'Ta'))
    var.put(u'W', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'q'), var.get(u'cb'))))
    var.get(u'exports').put(u'if_function_builtin_systemName', var.get(u'W'))
    var.put(u'sa', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'K'), var.get(u'db'))))
    var.get(u'exports').put(u'quote_form_builtin_systemName', var.get(u'sa'))
    var.put(u'Ma', var.get(u'B')(var.get(u'e')(var.get(u't'), var.get(u'e')(var.get(u'K'), var.get(u'e')(var.get(u'q'), var.get(u'u'), var.get(u'q'))), var.get(u'O'))))
    var.get(u'exports').put(u'lambda_form_builtin_systemName', var.get(u'Ma'))
    var.put(u'ja', var.get(u'B')(var.get(u'e')(var.get(u'K'), var.get(u'e')(var.get(u'E'), var.get(u'q')))))
    var.get(u'exports').put(u'function_builtin_use_systemName', var.get(u'ja'))
    var.put(u'X', var.get(u'B')(var.get(u'e')(var.get(u'K'), var.get(u'e')(var.get(u'E'), var.get(u'K')))))
    var.get(u'exports').put(u'form_builtin_use_systemName', var.get(u'X'))
    var.put(u'Ya', var.get(u'B')(var.get(u'e')(var.get(u'K'), var.get(u'K'))))
    var.get(u'exports').put(u'form_use_systemName', var.get(u'Ya'))
    var.put(u'ua', Js([Js(3.0), var.get(u'Sa'), var.get(u'e')()]))
    var.put(u'la', Js([Js(3.0), var.get(u'Ra'), var.get(u'e')()]))
    var.get(u'exports').put(u'jsArray_to_list', var.get(u'F'))
    var.get(u'exports').put(u'maybe_list_to_jsArray', var.get(u'L'))
    var.get(u'exports').put(u'new_list', var.get(u'e'))
    var.get(u'exports').put(u'delay_p', var.get(u'x'))
    var.get(u'exports').put(u'force_all', var.get(u'l'))
    var.get(u'exports').put(u'force1', var.get(u'y'))
    var.put(u'Za', Js([]))
    var.get(u'exports').put(u'env_null_v', var.get(u'Za'))
    var.get(u'exports').put(u'env_set', var.get(u'Na'))
    var.get(u'exports').put(u'env_get', var.get(u'Wa'))
    var.get(u'exports').put(u'env2val', var.get(u'M'))
    var.get(u'exports').put(u'env_foreach', var.get(u'Xa'))
    var.get(u'exports').put(u'val2env', var.get(u'Y'))
    @Js
    def PyJs_anonymous_51_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        @Js
        def PyJsHoisted_c_(a, b, c, e, this, arguments, var=var):
            var = Scope({u'a':a, u'c':c, u'b':b, u'e':e, u'arguments':arguments, u'this':this}, var)
            var.registers([u'a', u'c', u'b', u'e'])
            var.put(u'c', var.get(u'H')(var.get(u'V'), Js([var.get(u'c')(var.get(u'a')), var.get(u'c')(var.get(u'b'))])))
            var.put(u'a', var.get(u'H')(var.get(u'V'), Js([var.get(u'e')(var.get(u'a')), var.get(u'e')(var.get(u'b'))])))
            return var.get(u'H')(var.get(u'W'), Js([var.get(u'c'), var.get(u'a'), var.get(u'ua')]))
        PyJsHoisted_c_.func_name = u'c'
        var.put(u'c', PyJsHoisted_c_)
        pass
        if PyJsStrictEq(var.get(u'a'),var.get(u'b')):
            return var.get(u'la')
        var.put(u'a', var.get(u'y')(var.get(u'a')))
        var.put(u'b', var.get(u'y')(var.get(u'b')))
        if (var.get(u'x')(var.get(u'a')) or var.get(u'x')(var.get(u'b'))):
            return var.get(u'H')(var.get(u'V'), Js([var.get(u'a'), var.get(u'b')]))
        if PyJsStrictEq(var.get(u'a'),var.get(u'b')):
            return var.get(u'la')
        if PyJsStrictNeq(var.get(u'a').get(u'0'),var.get(u'b').get(u'0')):
            return var.get(u'ua')
        var.get(u'T')(var.get(u'x')(var.get(u'a')).neg())
        def PyJs_LONG_52_(var=var):
            return ((var.get(u'la') if var.get(u'P')(var.get(u'a'), var.get(u'b')) else var.get(u'ua')) if var.get(u'z')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ca'), var.get(u'da')) if var.get(u'w')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'aa'), var.get(u'ba')) if var.get(u'k')(var.get(u'a')) else (var.get(u'c')(var.get(u'a'), var.get(u'b'), var.get(u'ea'), var.get(u'fa')) if var.get(u'D')(var.get(u'a')) else var.get(u'A')()))))
        return (var.get(u'la') if var.get(u'p')(var.get(u'a')) else PyJs_LONG_52_())
    PyJs_anonymous_51_._set_name(u'anonymous')
    @Js
    def PyJs_anonymous_53_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd'])
        var.put(u'd', Js([]))
        #for JS loop
        var.put(u'b', var.get(u'l')(var.get(u'b')))
        while var.get(u'k')(var.get(u'b')):
            PyJsComma(var.get(u'd').callprop(u'push', var.get(u'b').get(u'1')),var.put(u'b', var.get(u'l')(var.get(u'b').get(u'2'))))
        
        return (Js([Js(9.0), var.get(u'a'), var.get(u'd')]) if var.get(u'p')(var.get(u'b')) else var.get(u'c'))
    PyJs_anonymous_53_._set_name(u'anonymous')
    @Js
    def PyJs_anonymous_54_(a, b, c, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'c':c, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b'])
        var.put(u'a', var.get(u'Y')(var.get(u'a')))
        return (var.get(u'c') if PyJsStrictEq(Js(1.0).neg(),var.get(u'a')) else Js([Js(6.0), var.get(u'a'), var.get(u'b')]))
    PyJs_anonymous_54_._set_name(u'anonymous')
    @Js
    def PyJs_anonymous_55_(a, b, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'b':b, u'arguments':arguments}, var)
        var.registers([u'a', u'b'])
        var.put(u'a', var.get(u'y')(var.get(u'a')))
        return (var.get(u'H')(var.get(u'Ta'), Js([var.get(u'a')])) if var.get(u'x')(var.get(u'a')) else (var.get(u'a').get(u'1') if var.get(u'k')(var.get(u'a')) else var.get(u'b')))
    PyJs_anonymous_55_._set_name(u'anonymous')
    @Js
    def PyJs_anonymous_56_(a, b, c, d, this, arguments, var=var):
        var = Scope({u'a':a, u'c':c, u'b':b, u'd':d, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a', u'c', u'b', u'd'])
        var.put(u'a', var.get(u'y')(var.get(u'a')))
        if var.get(u'x')(var.get(u'a')):
            return var.get(u'H')(var.get(u'W'), Js([var.get(u'a'), var.get(u'b'), var.get(u'c')]))
        if var.get(u'w')(var.get(u'a')).neg():
            return var.get(u'd')
        var.put(u'a', var.get(u'l')(var.get(u'a').get(u'1')))
        return ((var.get(u'b') if var.get(u'P')(var.get(u'a'), var.get(u'Ra')) else (var.get(u'c') if var.get(u'P')(var.get(u'a'), var.get(u'Sa')) else var.get(u'd'))) if var.get(u'z')(var.get(u'a')) else var.get(u'd'))
    PyJs_anonymous_56_._set_name(u'anonymous')
    var.put(u'ta', Js([var.get(u'ka')(var.get(u'Da'), var.get(u'w')), Js([var.get(u'lb'), Js(2.0), var.get(u'Ua')]), var.get(u'Z')(var.get(u'Ba'), var.get(u'w'), var.get(u'ca')), var.get(u'Z')(var.get(u'Ca'), var.get(u'w'), var.get(u'da')), var.get(u'ka')(var.get(u'Ga'), var.get(u'D')), Js([var.get(u'mb'), Js(2.0), var.get(u'ya')]), var.get(u'Z')(var.get(u'Ea'), var.get(u'D'), var.get(u'ea')), var.get(u'Z')(var.get(u'Fa'), var.get(u'D'), var.get(u'fa')), var.get(u'ka')(var.get(u'La'), var.get(u'p')), Js([var.get(u'nb'), Js(2.0), var.get(u'xa')]), var.get(u'ka')(var.get(u'Ha'), var.get(u'k')), var.get(u'Z')(var.get(u'Ia'), var.get(u'k'), var.get(u'aa')), var.get(u'Z')(var.get(u'Ja'), var.get(u'k'), var.get(u'ba')), Js([var.get(u'V'), Js(2.0), PyJs_anonymous_51_]), Js([var.get(u'qa'), Js(2.0), PyJs_anonymous_53_]), Js([var.get(u'ra'), Js(2.0), PyJs_anonymous_54_]), var.get(u'ka')(var.get(u'Ka'), var.get(u'z')), Js([var.get(u'Ta'), Js(1.0), PyJs_anonymous_55_]), Js([var.get(u'W'), Js(3.0), PyJs_anonymous_56_])]))
    var.get(u'exports').put(u'equal_p', var.get(u'v'))
    var.get(u'exports').put(u'simple_print', var.get(u'r'))
    @Js
    def PyJs_anonymous_57_(a, this, arguments, var=var):
        var = Scope({u'a':a, u'this':this, u'arguments':arguments}, var)
        var.registers([u'a'])
        return var.get(u'r')(var.get(u'I')(var.get(u'a')))
    PyJs_anonymous_57_._set_name(u'anonymous')
    var.get(u'exports').put(u'simple_print_force_all_rec', PyJs_anonymous_57_)
    var.get(u'exports').put(u'simple_parse', var.get(u'$a'))
    var.get(u'exports').put(u'complex_parse', var.get(u'va'))
    var.get(u'exports').put(u'complex_print', var.get(u'C'))
    var.put(u'sb', var.get(u'va')(Js(u'\u6548\u61c9/[:\u7269]')))
    var.get(u'exports').put(u'return_inputOutput_systemName', var.get(u'sb'))
    var.put(u'tb', var.get(u'va')(Js(u'\u6548\u61c9/\u9023')))
    var.get(u'exports').put(u'bind_inputOutput_systemName', var.get(u'tb'))
    var.put(u'ub', var.get(u'B')(var.get(u'va')(Js(u'(\u70ba\u7b26\u540d\u9023 e c m a s c r i p t)'))))
    var.get(u'exports').put(u'ecmascript_systemName', var.get(u'ub'))
PyJs_anonymous_0_._set_name(u'anonymous')
PyJs_anonymous_0_()
pass


# Add lib to the module scope
lang = var.to_python()