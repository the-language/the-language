(function(){function C(){throw"TheLanguage PANIC";}function Q(a){if(!a)return C()}function v(a){return 0===a[0]}function xa(a,b){return[1,a,b]}function l(a){return 1===a[0]}function ca(a){return a[1]}function da(a){return a[2]}function r(a){return 2===a[0]}function Ua(a,b){return[3,a,b]}function t(a){return 3===a[0]}function ea(a){return a[1]}function fa(a){return a[2]}function ya(a,b){return[4,a,b]}function A(a){return 4===a[0]}function ha(a){return a[1]}function ia(a){return a[2]}function G(a,b){a!==
b&&(a[0]=5,a[1]=b,a[2]=!1,a[3]=!1)}function H(a,b){return[7,a,b]}function J(a){a=m(a);if(t(a)){var b=a[1],c=a[2];a[1]=J(b);a[2]=J(c)}else A(a)?(b=a[1],c=a[2],a[1]=J(b),a[2]=J(c)):l(a)&&(b=a[1],c=a[2],a[1]=J(b),a[2]=J(c));return a}function D(a){return[3,ja,e(E,a)]}function za(a){return D(e(w,e(u,x,a),R))}function T(a,b){return D(e(w,e(u,e(a),x),b))}function ka(a){return D(e(w,u,e(U,e(w,a,x))))}function O(a,b){return a===b?!0:a[1]===b[1]?(G(a,b),!0):!1}function K(a){for(var b=P,c=a.length-1;0<=c;c--)b=
[1,a[c],b];return b}function V(a,b,c){for(var d=[];l(a);)d.push(a[1]),a=a[2];return r(a)?b(d):c(d,a)}function M(a){return V(a,function(a){return a},function(){return!1})}function e(){for(var a=[],b=0;b<arguments.length;b++)a[b]=arguments[b];return K(a)}function W(a){for(var b=[];5===a[0];)b.push(a),a=a[1];for(var c=0;c<b.length;c++)G(b[c],a);return a}function B(a){return 5===a[0]||6===a[0]||8===a[0]||7===a[0]||9===a[0]}function m(a,b,c){function d(){c[1]=!0;G(g,Aa);for(var a=0;a<h.length;a++)G(h[a],
Aa);return Aa}function f(){var a={},c;for(c in e)a[c]=!0;for(c in b)a[c]=!0;return a}void 0===b&&(b={});void 0===c&&(c=[!1,!1]);for(var e={},g=a,h=[];B(g);){a=y(g);if(!0===b[a])return d();if(!0===e[a]){c[0]=!0;if(6===g[0])return d();if(7===g[0]){a=g[1];for(var q=g[2],l=[Ba,Ca,Da,Ea,Fa,Ga,Ha,Ia,Ja,Ka,La],r=!1,n=0;n<l.length;n++)z(l[n],a)&&(r=!0);if(r)return Q(1===q.length),Q(!1===c[1]),q=m(q[0],f(),c),c[1]?m(H(a,[q])):C();if(z(a,X)||z(a,ra)||z(a,sa))return d();if(z(a,Y)&&(Q(3===q.length),Q(!1===c[1]),
a=m(q[0],f(),c),c[1]))return m(H(Y,[a,q[1],q[2]]))}else if(8===g[0]||9===g[0])return d();return C()}e[a]=!0;h.push(g);g=F(g)}for(n=0;n<h.length;n++)G(h[n],g);return g}function F(a){a=W(a);Q(5!==a[0]);if(6===a[0])var b=nb(a[1],a[2]);else if(8===a[0]){b=a[1];var c=a[2],d=a[3],f=[4,E,e(Z,e(N(b),c,K(d)))];b=z(c,ta)?1!==d.length?f:d[0]:z(c,Ma)?2!==d.length?f:ob(b,d[0],d[1],f):f}else if(7===a[0])a:{f=a[1];b=a[2];c=[4,E,e(la,e(f,K(b)))];for(d=0;d<ua.length;d++)if(z(f,ua[d][0])){f=ua[d][1];if(b.length!==
f)break;d=ua[d][2];b=1===f?d(b[0],c):2===f?d(b[0],b[1],c):3===f?d(b[0],b[1],b[2],c):C();break a}b=c}else b=9===a[0]?pb(a[1],a[2]):a;b=W(b);G(a,b);return b}function Na(a,b,c){for(var d=[],f=0;f<a.length;f+=2){if(z(a[f+0],b)){d[f+0]=b;d[f+1]=c;for(f+=2;f<a.length;f+=2)d[f+0]=a[f+0],d[f+1]=a[f+1];return d}d[f+0]=a[f+0];d[f+1]=a[f+1]}d[a.length+0]=b;d[a.length+1]=c;return d}function Va(a,b,c){for(var d=0;d<a.length;d+=2)if(z(a[d+0],b))return a[d+1];return c}function qb(a,b){for(var c=0;c<a.length;c+=
2)if(z(a[c+0],b))return a[c+1];return C()}function N(a){for(var b=P,c=0;c<a.length;c+=2)b=[1,e(a[c+0],a[c+1]),b];return[3,Oa,e(b)]}function Wa(a,b){for(var c=0;c<a.length;c+=2)b(a[c+0],a[c+1])}function aa(a){a=m(a);if(!t(a))return!1;var b=m(a[1]);if(!v(b)||!O(b,Oa))return!1;b=m(a[2]);if(!l(b)||!r(m(b[2])))return!1;a=[];for(b=m(b[1]);!r(b);){if(!l(b))return!1;var c=m(b[1]);b=m(b[2]);if(!l(c))return!1;var d=c[1];c=m(c[2]);if(!l(c))return!1;var f=c[1];if(!r(m(c[2])))return!1;c=!0;for(var e=0;e<a.length;e+=
2)if(z(a[e+0],d)){a[e+1]=f;c=!1;break}c&&(a.push(d),a.push(f))}return a}function nb(a,b){var c=F(b);if(B(c))return[6,a,c];var d=[4,E,e(la,e(sa,e(N(a),c)))];if(l(c)){for(var f=[],k=c;!r(k);){if(B(k))return[6,a,c];if(l(k))f.push(k[1]),k=F(k[2]);else return d}if(z(f[0],Z)){if(1===f.length)return d;k=f[1];c=[];for(d=2;d<f.length;d++)c[d-2]=f[d];return[8,a,k,c]}if(z(f[0],Xa)){if(1===f.length)return d;k=m([6,a,f[1]]);if(!t(k))return d;var g=F(k[1]);if(B(g))return[6,a,c];if(!v(g)||!O(g,L))return d;g=F(k[2]);
if(B(g))return[6,a,c];if(!l(g))return d;k=g[1];g=F(g[2]);if(B(g))return[6,a,c];if(!r(g))return d;c=[N(a)];for(d=2;d<f.length;d++)c[d-1]=f[d];return[9,k,c]}if(z(f[0],la)){if(1===f.length)return d;k=f[1];c=[];for(d=2;d<f.length;d++)c[d-2]=[6,a,f[d]];return[7,k,c]}k=[6,a,f[0]];c=[];for(d=1;d<f.length;d++)c[d-1]=[6,a,f[d]];return[9,k,c]}return r(c)?c:v(c)||t(c)?Va(a,c,d):A(c)?d:C()}function ma(a,b){return[a,1,function(c){c=F(c);return B(c)?H(a,[c]):b(c)?na:S}]}function ba(a,b,c){return[a,1,function(d,
f){d=F(d);return B(d)?H(a,[d]):b(d)?c(d):f}]}function pb(a,b){function c(){return[4,E,e(la,e(ra,e(a,K(b))))]}a=F(a);if(B(a))return[9,a,b];if(!t(a))return c();var d=m(a[1]);if(!v(d)||!O(d,u))return c();var f=m(a[2]);if(!l(f))return c();d=J(f[1]);f=m(f[2]);if(!l(f)||!r(m(f[2])))return c();f=f[1];for(var k=Ya,g=0;!r(d);)if(v(d)||t(d)){for(var h=P,q=b.length-1;q>=g;q--)h=[1,b[q],h];k=Na(k,d,h);g=b.length;d=P}else if(l(d))if(g<b.length)h=b[g],g++,k=Na(k,d[1],h),d=d[2];else return c();else return c();return b.length!==
g?c():[6,k,f]}function ob(a,b,c,d){void 0===d&&(d=!1);b=J(b);for(var f=[],k=!1,g=b;!r(g);)if(v(g)||t(g))f.push(g),k=!0,g=P;else if(l(g))f.push(g[1]),g=g[2];else return!1===d?ya(E,e(Z,e(N(a),Ma,K([b,c])))):d;d=b;k&&(d=K(f));var h=[];Wa(a,function(a){for(var b=0;b<f.length;b++)if(z(f[b],a))return;h.push(a)});k=d;for(g=h.length-1;0<=g;g--)k=[1,h[g],k];for(g=h.length-1;0<=g;g--)d=xa(e(Z,ta,qb(a,h[g])),d);return[3,u,e(b,[1,e(Z,ta,[3,u,e(k,c)]),d])]}function z(a,b){function c(a,b,c,g){return z(c(a),c(b))&&
z(g(a),g(b))?(G(a,b),!0):!1}if(a===b)return!0;a=m(a);b=m(b);if(a===b)return!0;if(r(a)){if(!r(b))return!1;G(a,P);G(b,P);return!0}return v(a)?v(b)?O(a,b):!1:l(a)?l(b)?c(a,b,ca,da):!1:A(a)?A(b)?c(a,b,ha,ia):!1:t(a)?t(b)?c(a,b,ea,fa):!1:C()}function n(a,b){function c(a,b,c,g){return n(c(a),c(b))&&n(g(a),g(b))?(G(a,b),!0):!1}if(a===b)return!0;a=W(a);b=W(b);if(a===b)return!0;if(r(a)){if(!r(b))return!1;G(a,P);G(b,P);return!0}return v(a)?v(b)?O(a,b):!1:l(a)?l(b)?c(a,b,ca,da):!1:A(a)?A(b)?c(a,b,ha,ia):!1:
t(a)?t(b)?c(a,b,ea,fa):!1:6===a[0]||7===a[0]||8===a[0]||9===a[0]?!1:C()}function y(a){a=W(a);var b;if(r(a))return"()";if(l(a)){var c="(";for(b="";l(a);)c+=b+y(a[1]),b=" ",a=W(a[2]);return c=r(a)?c+")":c+(" . "+y(a)+")")}return t(a)?"#"+y([1,a[1],a[2]]):A(a)?"!"+y([1,a[1],a[2]]):v(a)?a[1]:6===a[0]?"$("+y(N(a[1]))+" "+y(a[2])+")":7===a[0]?"%("+y(a[1])+" "+y(K(a[2]))+")":8===a[0]?"@("+y(N(a[1]))+" "+y(a[2])+" "+y(K(a[3]))+")":9===a[0]?"^("+y(a[1])+" "+y(K(a[2]))+")":C()}function Za(a){function b(){return t.length===
v}function c(){Q(!b());var a=t[v];v++;return a}function d(a){Q(t[v-1]===a);v--}function f(){throw"TheLanguage parse ERROR!";}function e(a){return" "===a||"\n"===a||"\t"===a||"\r"===a}function g(){if(b())return!1;var a=c();if(!e(a))return d(a),!1;for(;e(a)&&!b();)a=c();e(a)||d(a);return!0}function h(){if(b())return!1;var a=c(),f="";if(!w(a))return d(a),!1;for(;w(a)&&!b();)f+=a,a=c();w(a)?f+=a:d(a);return[0,f]}function q(){function a(a){if(h===q)h=a;else{for(var b=h;;){if(!l(b))return C();if(b[2]===
q)break;b=b[2]}if(!l(b)||b[2]!==q)return C();b[2]=a}}if(b())return!1;var e=c();if("("!==e)return d(e),!1;for(var q=[0,"!!@@READ||HOLE@@!!"],h=q;;){g();if(b())return f();e=c();if(")"===e)return a(P),h;if("."===e){g();e=x();a(e);g();if(b())return f();e=c();return")"!==e?f():h}d(e);e=x();a([1,e,q])}}function n(){if(b())return!1;var a=c();if("#"!==a)return d(a),!1;a=q();return!1!==a&&l(a)?[3,a[1],a[2]]:f()}function m(){if(b())return!1;var a=c();if("!"!==a)return d(a),!1;a=q();return!1!==a&&l(a)?[4,a[1],
a[2]]:f()}function u(a,e){return function(){if(b())return!1;var g=c();if(g!==a)return d(g),!1;g=q();if(!1===g||!l(g))return f();var h=g[2];return l(h)&&r(h[2])?e(g[1],h[1]):f()}}function w(a){if(e(a))return!1;for(var b="()!#.$%^@~/->_:?[]&".split(""),c=0;c<b.length;c++)if(a===b[c])return!1;return!0}function x(){g();for(var a=[q,h,n,m,y,z,D,E],b=0;b<a.length;b++){var c=a[b]();if(!1!==c)return c}return f()}var t=a,v=0,y=u("$",function(a,b){var c=aa(a);return!1===c?f():[6,c,b]}),z=u("%",function(a,b){var c=
V(b,function(a){return a},function(){return f()});return[7,a,c]}),D=function(a,e){return function(){if(b())return!1;var g=c();if(g!==a)return d(g),!1;g=q();if(!1===g||!l(g))return f();var h=g[2];if(!l(h))return f();var Pa=h[2];return l(Pa)&&r(Pa[2])?e(g[1],h[1],Pa[1]):f()}}("@",function(a,b,c){c=V(c,function(a){return a},function(){return f()});a=aa(a);return!1===a?f():[8,a,b,c]}),E=u("^",function(a,b){var c=V(b,function(a){return a},function(){return f()});return[9,a,c]});return x()}function va(a){function b(){return G.length===
H}function c(){Q(!b());var a=G[H];H++;return a}function d(a){Q(G[H-1]===a);H--}function f(){throw"TheLanguage parse ERROR!";}function k(a){return" "===a||"\n"===a||"\t"===a||"\r"===a}function g(){if(b())return!1;var a=c();if(!k(a))return d(a),!1;for(;k(a)&&!b();)a=c();k(a)||d(a);return!0}function h(){if(b())return!1;var a=c(),f="";if(!y(a))return d(a),!1;for(;y(a)&&!b();)f+=a,a=c();y(a)?f+=a:d(a);return[0,f]}function q(){function a(a){if(h===p)h=a;else{for(var b=h;;){if(!l(b))return C();if(b[2]===
p)break;b=b[2]}if(!l(b)||b[2]!==p)return C();b[2]=a}}if(b())return!1;var e=c();if("("!==e)return d(e),!1;for(var p=[0,"!!@@READ||HOLE@@!!"],h=p;;){g();if(b())return f();e=c();if(")"===e)return a(P),h;if("."===e){g();e=z();a(e);g();if(b())return f();e=c();return")"!==e?f():h}d(e);e=z();a([1,e,p])}}function n(){if(b())return!1;var a=c();if("#"!==a)return d(a),!1;a=q();return!1!==a&&l(a)?[3,a[1],a[2]]:f()}function m(){if(b())return!1;var a=c();if("!"!==a)return d(a),!1;a=q();return!1!==a&&l(a)?[4,a[1],
a[2]]:f()}function t(a,e){return function(){if(b())return!1;var g=c();if(g!==a)return d(g),!1;g=q();if(!1===g||!l(g))return f();var h=g[2];return l(h)&&r(h[2])?e(g[1],h[1]):f()}}function y(a){if(k(a))return!1;for(var b="()!#.$%^@~/->_:?[]&".split(""),c=0;c<b.length;c++)if(a===b[c])return!1;return!0}function z(){g();for(var a=[q,I,n,m,J,M,N,O],b=0;b<a.length;b++){var c=a[b]();if(!1!==c)return c}return f()}function B(a){return!1===a?f():a}function A(a){B(!b());B(c()===a)}function F(){function a(b){function c(){A("[");
var b=a();A("]");return b}void 0===b&&(b=!1);b=b?[q,h,c,n,m,J,M,N,O]:[q,F,n,m,J,M,N,O];for(var d=0;d<b.length;d++){var e=b[d]();if(!1!==e)return e}return f()}function g(f){if(b())return f;var g=c();if("."===g){var h=a();return e(w,e(u,e(f),x),h)}if(":"===g)return h=a(),e(w,h,f);if("~"===g)return e(U,f);if("@"===g)return h=a(),e(w,e(u,[1,f,x],x),h);if("?"===g)return e(w,u,e(U,f));if("/"===g){for(g=[];;){h=a(!0);g.push(h);if(b())break;h=c();if("/"!==h){d(h);break}}return e(Qa,f,K(g))}d(g);return f}
if(b())return!1;var p=c();if("&"===p){B(!b());p=c();if("+"===p)return p=a(),e(L,e(E,p));d(p);p=a();return e(L,p)}if(":"===p){B(!b());p=c();if("&"===p)return A(">"),p=a(),e(w,e(L,e(u,x,p)),R);if(">"===p)return p=a(),e(w,e(u,x,p),R);d(p);p=a();return e(w,p,R)}if("+"===p)return p=a(),e(E,p);if("["===p)return p=a(),A("]"),g(p);if("_"===p)return A(":"),p=a(),e(w,p,x);d(p);p=h();return!1===p?!1:g(p)}function I(){var a=F();return!1===a?!1:v(a)?a:D(a)}var G=a,H=0,J=t("$",function(a,b){var c=aa(a);return!1===
c?f():[6,c,b]}),M=t("%",function(a,b){var c=V(b,function(a){return a},function(){return f()});return[7,a,c]}),N=function(a,g){return function(){if(b())return!1;var e=c();if(e!==a)return d(e),!1;e=q();if(!1===e||!l(e))return f();var h=e[2];if(!l(h))return f();var k=h[2];return l(k)&&r(k[2])?g(e[1],h[1],k[1]):f()}}("@",function(a,b,c){c=V(c,function(a){return a},function(){return f()});a=aa(a);return!1===a?f():[8,a,b,c]}),O=t("^",function(a,b){var c=V(b,function(a){return a},function(){return f()});
return[9,a,c]});return z()}function I(a){function b(a,c){function d(a){return"inner"===c?"["+a+"]":"top"===c?a:C()}if(v(a))return a[1];var f=M(a);if(!1!==f&&3===f.length&&n(f[0],w)){var e=M(f[1]);if(!1!==e&&3===e.length&&n(e[0],u)){var k=e[1],m=M(k);if(!1!==m&&1===m.length&&n(e[2],x))return d(b(m[0],"inner")+"."+b(f[2],"inner"));if(l(k)&&n(k[2],x)&&n(e[2],x))return d(b(k[1],"inner")+"@"+b(f[2],"inner"));if(n(k,x)&&n(f[2],R))return d(":>"+b(e[2],"inner"))}k=M(f[2]);if(n(f[1],u)&&!1!==k&&2===k.length&&
n(k[0],U))return d(b(k[1],"inner")+"?");if(!1!==e&&2===e.length&&n(f[2],R)&&n(e[0],L)&&(e=M(e[1]),!1!==e&&3===e.length&&n(e[0],u)&&n(e[1],x)))return d(":&>"+b(e[2],"inner"));e=n(f[2],x)?"_":n(f[2],R)?"":b(f[2],"inner");return d(e+":"+b(f[1],"inner"))}if(!1!==f&&2===f.length){if(n(f[0],L))return e=M(f[1]),!1!==e&&2===e.length&&n(e[0],E)?d("&+"+b(e[1],"inner")):d("&"+b(f[1],"inner"));if(n(f[0],U))return d(b(f[1],"inner")+"~");if(n(f[0],E))return d("+"+b(f[1],"inner"))}else if(!1!==f&&3===f.length&&
n(f[0],Qa)&&(e=M(f[2]),!1!==e&&0!==e.length)){k="";for(m=0;m<e.length;m++)k+="/"+b(e[m],"inner");return d(b(f[1],"inner")+k)}return"inner"===c?y(a):"top"===c?y(D(a)):C()}a=Za(y(a));var c="",d="";if(r(a))return"()";if(l(a)){c="(";for(d="";l(a);)c+=d+I(a[1]),d=" ",a=a[2];return c=r(a)?c+")":c+(" . "+I(a)+")")}return t(a)?(c=a[1],a=a[2],d=M(a),!1!==d&&2===d.length&&n(c,ja)&&n(d[0],E)?b(d[1],"top"):"#"+I([1,c,a])):A(a)?"!"+I([1,a[1],a[2]]):v(a)?a[1]:6===a[0]?"$("+I(N(a[1]))+" "+I(a[2])+")":7===a[0]?"%("+
I(a[1])+" "+I(K(a[2]))+")":8===a[0]?"@("+I(N(a[1]))+" "+I(a[2])+" "+I(K(a[3]))+")":9===a[0]?"^("+I(a[1])+" "+I(K(a[2]))+")":C()}exports.__esModule=!0;exports.new_symbol=function(a){return[0,a]};exports.symbol_p=v;exports.un_symbol=function(a){return a[1]};exports.new_construction=xa;exports.construction_p=l;exports.construction_head=ca;exports.construction_tail=da;var P=[2];exports.null_v=P;exports.null_p=r;exports.new_data=Ua;exports.data_p=t;exports.data_name=ea;exports.data_list=fa;exports.new_error=
ya;exports.error_p=A;exports.error_name=ha;exports.error_list=ia;exports.evaluate=function(a,b){return[6,a,b]};exports.apply=function(a,b){return[9,a,b]};exports.force_all_rec=J;var E=[0,"\u592a\u59cb\u521d\u6838"];exports.system_symbol=E;var ja=[0,"\u7b26\u540d"];exports.name_symbol=ja;var u=[0,"\u5316\u6ec5"];exports.function_symbol=u;var L=[0,"\u5f0f\u5f62"];exports.form_symbol=L;var $a=[0,"\u7b49\u540c"];exports.equal_symbol=$a;var ab=[0,"\u89e3\u7b97"];exports.evaluate_sym=ab;var R=[0,"\u7279\u5b9a\u5176\u7269"];
exports.theThing_symbol=R;var x=[0,"\u7701\u7565\u4e00\u7269"];exports.something_symbol=x;var Oa=[0,"\u6620\u8868"];exports.mapping_symbol=Oa;var bb=[0,"\u82e5"];exports.if_symbol=bb;var w=[0,"\u4e00\u985e\u4f55\u7269"];exports.typeAnnotation_symbol=w;var U=[0,"\u662f\u975e"];exports.isOrNot_symbol=U;var Qa=[0,"\u5176\u5b50"];exports.sub_symbol=Qa;var Ra=[0,"\u967d"];exports.true_symbol=Ra;var Sa=[0,"\u9670"];exports.false_symbol=Sa;var cb=[0,"\u5f15\u7528"];exports.quote_symbol=cb;var db=[0,"\u61c9\u7528"];
exports.apply_symbol=db;var eb=[0,"\u7a7a"];exports.null_symbol=eb;var oa=[0,"\u9023"];exports.construction_symbol=oa;var pa=[0,"\u69cb"];exports.data_symbol=pa;var qa=[0,"\u8aa4"];exports.error_symbol=qa;var fb=[0,"\u8a5e\u7d20"];exports.symbol_symbol=fb;var wa=[0,"\u5217"];exports.list_symbol=wa;var gb=[0,"\u9996"];exports.head_symbol=gb;var hb=[0,"\u5c3e"];exports.tail_symbol=hb;var ib=[0,"\u7269"];exports.thing_symbol=ib;var jb=[0,"\u5b87\u5b99\u4ea1\u77e3"];exports.theWorldStopped_symbol=jb;
exports.effect_symbol=[0,"\u6548\u61c9"];exports.sequentialWordFormation_symbol=[0,"\u70ba\u7b26\u540d\u9023"];exports.inputOutput_symbol=[0,"\u51fa\u5165\u6539\u6ec5"];var Aa=[4,E,e(jb,x)],kb=za(pa);exports.new_data_function_builtin_systemName=kb;var Ba=T(pa,ja);exports.data_name_function_builtin_systemName=Ba;var Ca=T(pa,wa);exports.data_list_function_builtin_systemName=Ca;var Da=ka(pa);exports.data_p_function_builtin_systemName=Da;var lb=za(qa);exports.new_error_function_builtin_systemName=lb;
var Ea=T(qa,ja);exports.error_name_function_builtin_systemName=Ea;var Fa=T(qa,wa);exports.error_list_function_builtin_systemName=Fa;var Ga=ka(qa);exports.error_p_function_builtin_systemName=Ga;var mb=za(oa);exports.new_construction_function_builtin_systemName=mb;var Ha=ka(oa);exports.construction_p_function_builtin_systemName=Ha;var Ia=T(oa,gb);exports.construction_head_function_builtin_systemName=Ia;var Ja=T(oa,hb);exports.construction_tail_function_builtin_systemName=Ja;var Ka=ka(fb);exports.symbol_p_function_builtin_systemName=
Ka;var La=ka(eb);exports.null_p_function_builtin_systemName=La;var X=D(e(w,u,e(U,$a)));exports.equal_p_function_builtin_systemName=X;var ra=D(e(w,e(u,[1,u,x],x),db));exports.apply_function_builtin_systemName=ra;var sa=D(e(w,u,ab));exports.evaluate_function_builtin_systemName=sa;var Ta=T(wa,e(w,ib,x));exports.list_chooseOne_function_builtin_systemName=Ta;var Y=D(e(w,u,bb));exports.if_function_builtin_systemName=Y;var ta=D(e(w,L,cb));exports.quote_form_builtin_systemName=ta;var Ma=D(e(w,e(L,e(u,x,u)),
R));exports.lambda_form_builtin_systemName=Ma;var la=D(e(L,e(E,u)));exports.function_builtin_use_systemName=la;var Z=D(e(L,e(E,L)));exports.form_builtin_use_systemName=Z;var Xa=D(e(L,L));exports.form_use_systemName=Xa;var S=[3,Sa,e()],na=[3,Ra,e()];exports.jsArray_to_list=K;exports.maybe_list_to_jsArray=M;exports.new_list=e;exports.delay_p=B;exports.force_all=m;exports.force1=F;var Ya=[];exports.env_null_v=Ya;exports.env_set=Na;exports.env_get=Va;exports.env2val=N;exports.env_foreach=Wa;exports.val2env=
aa;var ua=[ma(Da,t),[kb,2,Ua],ba(Ba,t,ea),ba(Ca,t,fa),ma(Ga,A),[lb,2,ya],ba(Ea,A,ha),ba(Fa,A,ia),ma(La,r),[mb,2,xa],ma(Ha,l),ba(Ia,l,ca),ba(Ja,l,da),[X,2,function(a,b){function c(a,b,c,e){c=H(X,[c(a),c(b)]);a=H(X,[e(a),e(b)]);return H(Y,[c,a,S])}if(a===b)return na;a=F(a);b=F(b);if(B(a)||B(b))return H(X,[a,b]);if(a===b)return na;Q(!B(a));return r(a)?r(a)?na:S:v(a)?v(b)?O(a,b)?na:S:S:t(a)?t(b)?c(a,b,ea,fa):S:l(a)?l(b)?c(a,b,ca,da):S:A(a)?A(b)?c(a,b,ha,ia):S:C()}],[ra,2,function(a,b,c){var d=[];for(b=
m(b);l(b);)d.push(b[1]),b=m(b[2]);return r(b)?[9,a,d]:c}],[sa,2,function(a,b,c){a=aa(a);return!1===a?c:[6,a,b]}],ma(Ka,v),[Ta,1,function(a,b){a=F(a);return B(a)?H(Ta,[a]):l(a)?a[1]:b}],[Y,3,function(a,b,c,d){a=F(a);if(B(a))return H(Y,[a,b,c]);if(!t(a))return d;a=m(a[1]);return v(a)?O(a,Ra)?b:O(a,Sa)?c:d:d}]];exports.equal_p=z;exports.simple_print=y;exports.simple_print_force_all_rec=function(a){return y(J(a))};exports.simple_parse=Za;exports.complex_parse=va;exports.complex_print=I;var rb=va("\u6548\u61c9/[:\u7269]");
exports.return_inputOutput_systemName=rb;var sb=va("\u6548\u61c9/\u9023");exports.bind_inputOutput_systemName=sb;var tb=D(va("(\u70ba\u7b26\u540d\u9023 e c m a s c r i p t)"));exports.ecmascript_systemName=tb})();
