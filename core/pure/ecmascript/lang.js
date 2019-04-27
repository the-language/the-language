function h(){throw"TheLanguage PANIC";}function q(a){a in aa||h();return[0,aa[a]]}exports.new_symbol=q;function v(a){return 0===a[0]}exports.symbol_p=v;function ba(a){return ca[a[1]]}exports.un_symbol=ba;function ea(a,b){return[1,a,b]}exports.new_construction=ea;function w(a){return 1===a[0]}exports.construction_p=w;function fa(a){return a[1]}exports.construction_head=fa;function ha(a){return a[2]}exports.construction_tail=ha;var x=[2];exports.null_v=x;function y(a){return 2===a[0]}
exports.null_p=y;function ja(a,b){return[3,a,b]}exports.new_data=ja;function z(a){return 3===a[0]}exports.data_p=z;function ka(a){return a[1]}exports.data_name=ka;function la(a){return a[2]}exports.data_list=la;function ma(a,b){return[4,a,b]}exports.new_error=ma;function A(a){return 4===a[0]}exports.error_p=A;function na(a){return a[1]}exports.error_name=na;function oa(a){return a[2]}exports.error_list=oa;function B(a,b){a!==b&&(a[0]=5,a[1]=b,a[2]=!1,a[3]=!1)}
exports.evaluate=function(a,b){return[6,a,b]};function C(a,b){return[7,a,b]}exports.apply=function(a,b){return[9,a,b]};function D(a){a=E(a);if(z(a)){var b=a[1],c=a[2];a[1]=D(b);a[2]=D(c)}else A(a)?(b=a[1],c=a[2],a[1]=D(b),a[2]=D(c)):w(a)&&(b=a[1],c=a[2],a[1]=D(b),a[2]=D(c));return a}exports.force_all_rec=D;
var aa={"\u4e00\u985e\u4f55\u7269":"\uff1a","\u4e4b\u7269":"\u7269","\u5176\u5b50":"\u5206","\u51fa\u5165\u6539\u6ec5":"\u8b8a","\u5217\u5e8f":"\u5217","\u5316\u6ec5":"\u5316","\u53c3\u5f62":"\u53c3","\u543e\u81ea":"\u81ea","\u592a\u59cb\u521d\u6838":"\u6838","\u5982\u82e5":"\u82e5","\u5b87\u5b99\u4ea1\u77e3":"\u6b62","\u5c3e\u672b":"\u5c3e","\u5e8f\u4e01":"\u4e01","\u5e8f\u4e19":"\u4e19","\u5e8f\u4e59":"\u4e59","\u5e8f\u7532":"\u7532","\u5f0f\u5f62":"\u5f62","\u5f15\u7528":"\u5f15","\u61c9\u7528":"\u7528",
"\u6548\u61c9":"\u6548","\u6620\u8868":"\u8868","\u662f\u975e":"\u6b24","\u69cb\u7269":"\u69cb","\u70ba\u7b26\u540d\u9023":"\u2010","\u7279\u5b9a\u5176\u7269":"\u7368","\u7701\u7565\u4e00\u7269":"\u67d0","\u7b26\u540d":"\u7b26","\u7b49\u540c":"\u7b49","\u89e3\u7b97":"\u7b97","\u8a5e\u7d20":"\u6587","\u8b2c\u8aa4":"\u8b2c","\u9023\u9838":"\u9023","\u9593\u7a7a":"\u7a7a","\u9670":"\u9670","\u967d":"\u967d","\u9996\u59cb":"\u9996",0:"0",1:"1",2:"2",3:"3",4:"4",5:"5",6:"6",7:"7",8:"8",9:"9",A:"A",B:"B",
C:"C",D:"D",E:"E",F:"F",G:"G",H:"H",I:"I",J:"J",K:"K",L:"L",M:"M",N:"N",O:"O",P:"P",Q:"Q",R:"R",S:"S",T:"T",U:"U",V:"V",W:"W",X:"X",Y:"Y",Z:"Z",a:"a",b:"b",c:"c",d:"d",e:"e",f:"f",g:"g",h:"h",i:"i",j:"j",k:"k",l:"l",m:"m",n:"n",o:"o",p:"p",q:"q",r:"r",s:"s",t:"t",u:"u",v:"v",w:"w",x:"x",y:"y",z:"z"},ca={"\uff1a":"\u4e00\u985e\u4f55\u7269","\u7269":"\u4e4b\u7269","\u5206":"\u5176\u5b50","\u8b8a":"\u51fa\u5165\u6539\u6ec5","\u5217":"\u5217\u5e8f","\u5316":"\u5316\u6ec5","\u53c3":"\u53c3\u5f62","\u81ea":"\u543e\u81ea",
"\u6838":"\u592a\u59cb\u521d\u6838","\u82e5":"\u5982\u82e5","\u6b62":"\u5b87\u5b99\u4ea1\u77e3","\u5c3e":"\u5c3e\u672b","\u4e01":"\u5e8f\u4e01","\u4e19":"\u5e8f\u4e19","\u4e59":"\u5e8f\u4e59","\u7532":"\u5e8f\u7532","\u5f62":"\u5f0f\u5f62","\u5f15":"\u5f15\u7528","\u7528":"\u61c9\u7528","\u6548":"\u6548\u61c9","\u8868":"\u6620\u8868","\u6b24":"\u662f\u975e","\u69cb":"\u69cb\u7269","\u2010":"\u70ba\u7b26\u540d\u9023","\u7368":"\u7279\u5b9a\u5176\u7269","\u67d0":"\u7701\u7565\u4e00\u7269","\u7b26":"\u7b26\u540d",
"\u7b49":"\u7b49\u540c","\u7b97":"\u89e3\u7b97","\u6587":"\u8a5e\u7d20","\u8b2c":"\u8b2c\u8aa4","\u9023":"\u9023\u9838","\u7a7a":"\u9593\u7a7a","\u9670":"\u9670","\u967d":"\u967d","\u9996":"\u9996\u59cb",0:"0",1:"1",2:"2",3:"3",4:"4",5:"5",6:"6",7:"7",8:"8",9:"9",A:"A",B:"B",C:"C",D:"D",E:"E",F:"F",G:"G",H:"H",I:"I",J:"J",K:"K",L:"L",M:"M",N:"N",O:"O",P:"P",Q:"Q",R:"R",S:"S",T:"T",U:"U",V:"V",W:"W",X:"X",Y:"Y",Z:"Z",a:"a",b:"b",c:"c",d:"d",e:"e",f:"f",g:"g",h:"h",i:"i",j:"j",k:"k",l:"l",m:"m",n:"n",
o:"o",p:"p",q:"q",r:"r",s:"s",t:"t",u:"u",v:"v",w:"w",x:"x",y:"y",z:"z"},F=q("\u592a\u59cb\u521d\u6838"),pa=q("\u7b26\u540d"),G=q("\u5316\u6ec5"),H=q("\u5f0f\u5f62"),qa=q("\u7b49\u540c"),ra=q("\u89e3\u7b97"),K=q("\u7279\u5b9a\u5176\u7269"),L=q("\u7701\u7565\u4e00\u7269"),sa=q("\u6620\u8868"),ta=q("\u5982\u82e5"),M=q("\u4e00\u985e\u4f55\u7269"),ua=q("\u662f\u975e"),va=q("\u5176\u5b50"),xa=q("\u967d"),ya=q("\u9670"),za=q("\u5f15\u7528"),Aa=q("\u61c9\u7528"),Ba=q("\u9593\u7a7a"),Ca=q("\u9023\u9838"),
Da=q("\u69cb\u7269"),Ea=q("\u8b2c\u8aa4"),Fa=q("\u8a5e\u7d20"),Ga=q("\u5217\u5e8f"),Ha=q("\u9996\u59cb"),Ia=q("\u5c3e\u672b"),Ja=q("\u4e4b\u7269"),Ka=q("\u5b87\u5b99\u4ea1\u77e3"),La=[4,F,N(Ka,L)];function P(a){return[3,pa,N(F,a)]}function Ma(a){return P(N(M,N(G,L,a),K))}function Na(a,b){return P(N(M,N(G,N(a),L),b))}function Oa(a){return P(N(M,G,N(ua,N(M,a,L))))}
var Va=Ma(Da),Wa=Na(Da,pa),Xa=Na(Da,Ga),Ya=Oa(Da),Za=Ma(Ea),$a=Na(Ea,pa),ab=Na(Ea,Ga),bb=Oa(Ea),cb=Ma(Ca),db=Oa(Ca),eb=Na(Ca,Ha),fb=Na(Ca,Ia),gb=Oa(Fa),hb=Oa(Ba),ib=P(N(M,G,N(ua,qa))),jb=P(N(M,N(G,[1,G,L],L),Aa)),kb=P(N(M,G,ra)),lb=Na(Ga,N(M,Ja,L)),mb=P(N(M,G,ta)),nb=P(N(M,H,za)),ob=P(N(M,N(H,N(G,L,G)),K)),rb=P(N(H,N(F,G))),sb=P(N(H,N(F,H))),tb=P(N(H,H)),ub=[3,ya,N()],vb=[3,xa,N()];function wb(a,b){return a===b?!0:ba(a)===ba(b)?(B(a,b),!0):!1}
function Q(a){for(var b=x,c=a.length-1;0<=c;c--)b=[1,a[c],b];return b}exports.jsArray_to_list=Q;function xb(a,b,c){for(var d=[];w(a);)d.push(a[1]),a=a[2];return y(a)?b(d):c(d,a)}function R(a){return xb(a,function(b){return b},function(){return!1})}exports.maybe_list_to_jsArray=R;function N(){for(var a=[],b=0;b<arguments.length;b++)a[b]=arguments[b];return Q(a)}exports.new_list=N;function yb(a){for(var b=[];5===a[0];)b.push(a),a=a[1];for(var c=0;c<b.length;c++)B(b[c],a);return a}
function S(a){return 5===a[0]||6===a[0]||8===a[0]||7===a[0]||9===a[0]}exports.delay_p=S;
function E(a,b,c,d){function e(I){B(r,I);for(var O=0;O<d.length;O++)B(d[O],I);return I}function k(){c[1]=!0;return l(La)}function l(I){e(I);return S(I)?(d.push(r),E(I,b,[!1,!1],d)):I}function m(){var I={},O;for(O in n)I[O]=!0;for(O in b)I[O]=!0;return I}void 0===b&&(b={});void 0===c&&(c=[!1,!1]);void 0===d&&(d=[]);var n={},r=a;for(a=0;S(r)&&512>a;a++)d.push(r),r=T(r);for(;S(r);){a=U(r);if(!0===b[a])return k();if(!0===n[a]){c[0]=!0;if(6===r[0])return k();if(7===r[0]){a=r[1];for(var J=r[2],X=!1,da=
0,ia=[Wa,Xa,Ya,$a,ab,bb,db,eb,fb,gb,hb];da<ia.length;da++)if(V(ia[da],a)){X=!0;break}if(X)return 1===J.length||h(),!1===c[1]||h(),J=E(J[0],m(),c),c[1]?l(C(a,[J])):h();if(V(a,ib)||V(a,jb)||V(a,kb))return k();if(V(a,mb)&&(3===J.length||h(),!1===c[1]||h(),a=E(J[0],m(),c),c[1]))return l(C(mb,[a,J[1],J[2]]))}else if(8===r[0]||9===r[0])return k();return h()}n[a]=!0}return e(r)}exports.force_all=E;
function T(a){var b=yb(a);5!==b[0]||h();if(6===b[0])a=zb(b[1],b[2],a);else if(8===b[0]){a=b[1];var c=b[2],d=b[3],e=[4,F,N(sb,N(W(a),c,Q(d)))];a=V(c,nb)?1!==d.length?e:d[0]:V(c,ob)?2!==d.length?e:Ab(a,d[0],d[1],e):e}else if(7===b[0])a:{e=b[1];a=b[2];c=[4,F,N(rb,N(e,Q(a)))];for(d=0;d<Bb.length;d++)if(V(e,Bb[d][0])){e=Bb[d][1];if(a.length!==e)break;d=Bb[d][2];a=1===e?d(a[0],c):2===e?d(a[0],a[1],c):3===e?d(a[0],a[1],a[2],c):h();break a}a=c}else a=9===b[0]?Cb(b[1],b[2],a):b;a=yb(a);B(b,a);return a}
exports.force1=T;var Db=[];exports.env_null_v=Db;function Eb(a,b,c){for(var d=[],e=0;e<a.length;e+=2){if(V(a[e+0],b)){d[e+0]=b;d[e+1]=c;for(e+=2;e<a.length;e+=2)d[e+0]=a[e+0],d[e+1]=a[e+1];return d}d[e+0]=a[e+0];d[e+1]=a[e+1]}d[a.length+0]=b;d[a.length+1]=c;return d}exports.env_set=Eb;function Fb(a,b,c){for(var d=0;d<a.length;d+=2)if(V(a[d+0],b))return a[d+1];return c}exports.env_get=Fb;function Gb(a,b){for(var c=0;c<a.length;c+=2)if(V(a[c+0],b))return a[c+1];return h()}
function W(a){for(var b=x,c=0;c<a.length;c+=2)b=[1,N(a[c+0],a[c+1]),b];return[3,sa,N(b)]}exports.env2val=W;function Hb(a,b){for(var c=0;c<a.length;c+=2)b(a[c+0],a[c+1])}exports.env_foreach=Hb;
function Ib(a){a=E(a);if(!z(a))return!1;var b=E(a[1]);if(!v(b)||!wb(b,sa))return!1;b=E(a[2]);if(!w(b)||!y(E(b[2])))return!1;a=[];for(b=E(b[1]);!y(b);){if(!w(b))return!1;var c=E(b[1]);b=E(b[2]);if(!w(c))return!1;var d=c[1];c=E(c[2]);if(!w(c))return!1;var e=c[1];if(!y(E(c[2])))return!1;c=!0;for(var k=0;k<a.length;k+=2)if(V(a[k+0],d)){a[k+1]=e;c=!1;break}c&&(a.push(d),a.push(e))}return a}exports.val2env=Ib;
function zb(a,b,c){var d=T(b);if(S(d))return c;var e=[4,F,N(rb,N(kb,N(W(a),d)))];if(w(d)){for(b=[];!y(d);){if(S(d))return c;if(w(d))b.push(d[1]),d=T(d[2]);else return e}if(V(b[0],sb)){if(1===b.length)return e;d=b[1];c=[];for(e=2;e<b.length;e++)c.push(b[e]);return[8,a,d,c]}if(V(b[0],tb)){if(1===b.length)return e;d=E([6,a,b[1]]);if(!z(d))return e;var k=T(d[1]);if(S(k))return c;if(!v(k)||!wb(k,H))return e;k=T(d[2]);if(S(k))return c;if(!w(k))return e;d=k[1];k=T(k[2]);if(S(k))return c;if(!y(k))return e;
c=[W(a)];for(e=2;e<b.length;e++)c.push(b[e]);return[9,d,c]}if(V(b[0],rb)){if(1===b.length)return e;d=b[1];c=[];for(e=2;e<b.length;e++)c.push([6,a,b[e]]);return[7,d,c]}d=[6,a,b[0]];c=[];for(e=1;e<b.length;e++)c.push([6,a,b[e]]);return[9,d,c]}return y(d)?d:v(d)||z(d)?Fb(a,d,e):A(d)?e:h()}function Jb(a,b){return[a,1,function(c){c=T(c);return S(c)?C(a,[c]):b(c)?vb:ub}]}function Kb(a,b,c){return[a,1,function(d,e){d=T(d);return S(d)?C(a,[d]):b(d)?c(d):e}]}
var Bb=[Jb(Ya,z),[Va,2,ja],Kb(Wa,z,ka),Kb(Xa,z,la),Jb(bb,A),[Za,2,ma],Kb($a,A,na),Kb(ab,A,oa),Jb(hb,y),[cb,2,ea],Jb(db,w),Kb(eb,w,fa),Kb(fb,w,ha),[ib,2,function(a,b){function c(d,e,k,l){k=C(ib,[k(d),k(e)]);d=C(ib,[l(d),l(e)]);return C(mb,[k,d,ub])}if(a===b)return vb;a=T(a);b=T(b);if(S(a)||S(b))return C(ib,[a,b]);if(a===b)return vb;!S(a)||h();return y(a)?y(a)?vb:ub:v(a)?v(b)?wb(a,b)?vb:ub:ub:z(a)?z(b)?c(a,b,ka,la):ub:w(a)?w(b)?c(a,b,fa,ha):ub:A(a)?A(b)?c(a,b,na,oa):ub:h()}],[jb,2,function(a,b,c){var d=
[];for(b=E(b);w(b);)d.push(b[1]),b=E(b[2]);return y(b)?[9,a,d]:c}],[kb,2,function(a,b,c){a=Ib(a);return!1===a?c:[6,a,b]}],Jb(gb,v),[lb,1,function(a,b){a=T(a);return S(a)?C(lb,[a]):w(a)?a[1]:b}],[mb,3,function(a,b,c,d){a=T(a);if(S(a))return C(mb,[a,b,c]);if(!z(a))return d;a=E(a[1]);return v(a)?wb(a,xa)?b:wb(a,ya)?c:d:d}]];
function Cb(a,b,c){function d(){return[4,F,N(rb,N(jb,N(a,Q(b))))]}a=T(a);if(S(a))return c;if(!z(a))return d();c=E(a[1]);if(!v(c)||!wb(c,G))return d();var e=E(a[2]);if(!w(e))return d();c=D(e[1]);e=E(e[2]);if(!w(e)||!y(E(e[2])))return d();e=e[1];for(var k=Db,l=0;!y(c);)if(v(c)||z(c)){for(var m=x,n=b.length-1;n>=l;n--)m=[1,b[n],m];k=Eb(k,c,m);l=b.length;c=x}else if(w(c))if(l<b.length)m=b[l],l++,k=Eb(k,c[1],m),c=c[2];else return d();else return d();return b.length!==l?d():[6,k,e]}
function Ab(a,b,c,d){void 0===d&&(d=!1);b=D(b);for(var e=[],k=!1,l=b;!y(l);)if(v(l)||z(l))e.push(l),k=!0,l=x;else if(w(l))e.push(l[1]),l=l[2];else return!1===d?ma(F,N(sb,N(W(a),ob,Q([b,c])))):d;d=b;k&&(d=Q(e));var m=[];Hb(a,function(n){for(var r=0;r<e.length;r++)if(V(e[r],n))return;m.push(n)});k=d;for(l=m.length-1;0<=l;l--)k=[1,m[l],k];for(l=m.length-1;0<=l;l--)d=ea(N(sb,nb,Gb(a,m[l])),d);return ja(G,N(b,ea(N(sb,nb,[3,G,N(k,c)]),d)))}
function V(a,b){function c(d,e,k,l){return V(k(d),k(e))&&V(l(d),l(e))?(B(d,e),!0):!1}if(a===b)return!0;a=E(a);b=E(b);if(a===b)return!0;if(y(a)){if(!y(b))return!1;B(a,x);B(b,x);return!0}return v(a)?v(b)?wb(a,b):!1:w(a)?w(b)?c(a,b,fa,ha):!1:A(a)?A(b)?c(a,b,na,oa):!1:z(a)?z(b)?c(a,b,ka,la):!1:h()}exports.equal_p=V;
function Y(a,b){function c(d,e,k,l){return Y(k(d),k(e))&&Y(l(d),l(e))?(B(d,e),!0):!1}if(a===b)return!0;a=yb(a);b=yb(b);if(a===b)return!0;if(y(a)){if(!y(b))return!1;B(a,x);B(b,x);return!0}return v(a)?v(b)?wb(a,b):!1:w(a)?w(b)?c(a,b,fa,ha):!1:A(a)?A(b)?c(a,b,na,oa):!1:z(a)?z(b)?c(a,b,ka,la):!1:6===a[0]||7===a[0]||8===a[0]||9===a[0]?!1:h()}
function U(a){a=yb(a);var b;if(y(a))return"()";if(w(a)){var c="(";for(b="";w(a);)c+=b+U(a[1]),b=" ",a=yb(a[2]);return c=y(a)?c+")":c+(" . "+U(a)+")")}return z(a)?"#"+U([1,a[1],a[2]]):A(a)?"!"+U([1,a[1],a[2]]):v(a)?ba(a):6===a[0]?"$("+U(W(a[1]))+" "+U(a[2])+")":7===a[0]?"%("+U(a[1])+" "+U(Q(a[2]))+")":8===a[0]?"@("+U(W(a[1]))+" "+U(a[2])+" "+U(Q(a[3]))+")":9===a[0]?"^("+U(a[1])+" "+U(Q(a[2]))+")":h()}exports.simple_print=U;exports.simple_print_force_all_rec=function(a){return U(D(a))};
function Lb(a){function b(){return Pa.length===wa}function c(){!b()||h();var f=Pa[wa];wa++;return f}function d(f){Pa[wa-1]===f||h();wa--}function e(f){void 0===f&&(f="");throw"TheLanguage parse ERROR!"+f;}function k(f){return" "===f||"\n"===f||"\t"===f||"\r"===f}function l(){if(b())return!1;var f=c();if(!k(f))return d(f),!1;for(;k(f)&&!b();)f=c();k(f)||d(f);return!0}function m(){if(b())return!1;var f=c(),p="";if(!da(f))return d(f),!1;for(;da(f)&&!b();)p+=f,f=c();da(f)?p+=f:d(f);p in aa||e("Not Symbol"+
p);return q(p)}function n(){function f(t){if(null===g)g=t;else{for(var u=g;;){if(!w(u))return h();if(null===u[2])break;u=u[2]}if(!w(u)||null!==u[2])return h();u[2]=t}}if(b())return!1;var p=c();if("("!==p)return d(p),!1;for(var g=null;;){l();if(b())return e();p=c();if(")"===p)return f(x),g;if("."===p){l();p=ia();f(p);l();if(b())return e();p=c();return")"!==p?e():g}d(p);p=ia();f([1,p,null])}}function r(){if(b())return!1;var f=c();if("#"!==f)return d(f),!1;f=n();return!1!==f&&w(f)?[3,f[1],f[2]]:e()}
function J(){if(b())return!1;var f=c();if("!"!==f)return d(f),!1;f=n();return!1!==f&&w(f)?[4,f[1],f[2]]:e()}function X(f,p){return function(){if(b())return!1;var g=c();if(g!==f)return d(g),!1;g=n();if(!1===g||!w(g))return e();var t=g[2];return w(t)&&y(t[2])?p(g[1],t[1]):e()}}function da(f){if(k(f))return!1;for(var p="()!#.$%^@~/->_:?[]&".split(""),g=0;g<p.length;g++)if(f===p[g])return!1;return!0}function ia(){l();for(var f=[n,Mb,r,J,Qa,Ra,Sa,Ta],p=0;p<f.length;p++){var g=f[p]();if(!1!==g)return g}return e()}
function I(f){return!1===f?e():f}function O(f){I(!b());I(c()===f)}function pb(){function f(t){function u(){O("[");var Nb=f();O("]");return Nb}void 0===t&&(t=!1);t=t?[n,m,u,r,J,Qa,Ra,Sa,Ta]:[n,pb,r,J,Qa,Ra,Sa,Ta];for(var Ua=0;Ua<t.length;Ua++){var qb=t[Ua]();if(!1!==qb)return qb}return e()}function p(t){if(b())return t;var u=c();if("."===u)return u=f(),N(M,N(G,N(t),L),u);if(":"===u)return u=f(),N(M,u,t);if("~"===u)return N(ua,t);if("@"===u)return u=f(),N(M,N(G,[1,t,L],L),u);if("?"===u)return N(M,G,
N(ua,t));if("/"===u){for(t=[t];;){u=f(!0);t.push(u);if(b())break;u=c();if("/"!==u){d(u);break}}return N(va,Q(t))}d(u);return t}if(b())return!1;var g=c();if("&"===g){I(!b());g=c();if("+"===g)return g=f(),N(H,N(F,g));d(g);g=f();return N(H,g)}if(":"===g){I(!b());g=c();if("&"===g)return O(">"),g=f(),N(M,N(H,N(G,L,g)),K);if(">"===g)return g=f(),N(M,N(G,L,g),K);d(g);g=f();return N(M,g,K)}if("+"===g)return g=f(),N(F,g);if("["===g)return g=f(),O("]"),p(g);if("_"===g)return O(":"),g=f(),N(M,g,L);d(g);g=m();
return!1===g?!1:p(g)}function Mb(){var f=pb();return!1===f?!1:v(f)?f:P(f)}var Pa=a,wa=0,Qa=X("$",function(f,p){var g=Ib(f);return!1===g?e():[6,g,p]}),Ra=X("%",function(f,p){var g=xb(p,function(t){return t},function(){return e()});return[7,f,g]}),Sa=function(f,p){return function(){if(b())return!1;var g=c();if(g!==f)return d(g),!1;g=n();if(!1===g||!w(g))return e();var t=g[2];if(!w(t))return e();var u=t[2];return w(u)&&y(u[2])?p(g[1],t[1],u[1]):e()}}("@",function(f,p,g){g=xb(g,function(t){return t},
function(){return e()});f=Ib(f);return!1===f?e():[8,f,p,g]}),Ta=X("^",function(f,p){var g=xb(p,function(t){return t},function(){return e()});return[9,f,g]});return ia()}exports.complex_parse=Lb;
function Z(a){function b(e,k){function l(X){return"inner"===k?"["+X+"]":"top"===k?X:h()}if(v(e))return ba(e);var m=R(e);if(!1!==m&&3===m.length&&Y(m[0],M)){var n=R(m[1]);if(!1!==n&&3===n.length&&Y(n[0],G)){var r=n[1],J=R(r);if(!1!==J&&1===J.length&&Y(n[2],L))return l(b(J[0],"inner")+"."+b(m[2],"inner"));if(w(r)&&Y(r[2],L)&&Y(n[2],L))return l(b(r[1],"inner")+"@"+b(m[2],"inner"));if(Y(r,L)&&Y(m[2],K))return l(":>"+b(n[2],"inner"))}r=R(m[2]);if(Y(m[1],G)&&!1!==r&&2===r.length&&Y(r[0],ua))return l(b(r[1],
"inner")+"?");if(!1!==n&&2===n.length&&Y(m[2],K)&&Y(n[0],H)&&(n=R(n[1]),!1!==n&&3===n.length&&Y(n[0],G)&&Y(n[1],L)))return l(":&>"+b(n[2],"inner"));n=Y(m[2],L)?"_":Y(m[2],K)?"":b(m[2],"inner");return l(n+":"+b(m[1],"inner"))}if(!1!==m&&2===m.length){if(Y(m[0],H))return n=R(m[1]),!1!==n&&2===n.length&&Y(n[0],F)?l("&+"+b(n[1],"inner")):l("&"+b(m[1],"inner"));if(Y(m[0],ua))return l(b(m[1],"inner")+"~");if(Y(m[0],F))return l("+"+b(m[1],"inner"));if(Y(m[0],va)&&(m=R(m[1]),!1!==m&&1<m.length)){n=b(m[0],
"inner");for(r=1;r<m.length;r++)n+="/"+b(m[r],"inner");return l(n)}}return"inner"===k?U(e):"top"===k?U(P(e)):h()}a=Lb(U(a));var c="",d="";if(y(a))return"()";if(w(a)){c="(";for(d="";w(a);)c+=d+Z(a[1]),d=" ",a=a[2];return c=y(a)?c+")":c+(" . "+Z(a)+")")}return z(a)?(c=a[1],a=a[2],d=R(a),!1!==d&&2===d.length&&Y(c,pa)&&Y(d[0],F)?b(d[1],"top"):"#"+Z([1,c,a])):A(a)?"!"+Z([1,a[1],a[2]]):v(a)?ba(a):6===a[0]?"$("+Z(W(a[1]))+" "+Z(a[2])+")":7===a[0]?"%("+Z(a[1])+" "+Z(Q(a[2]))+")":8===a[0]?"@("+Z(W(a[1]))+
" "+Z(a[2])+" "+Z(Q(a[3]))+")":9===a[0]?"^("+Z(a[1])+" "+Z(Q(a[2]))+")":h()}exports.complex_print=Z;
