local function u(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local e={}
local g,I,b,Q,C,ee,de,pe,Oe,Qe,Me,we,se,he,re,ne,S,Ee,oe,Te,p,me,ue,h,a,o,s,v,r,_,f,E,T,D,k,F,L,X,c,N,W,ie,te,De,P,_e,ke,be,A,G,fe,le,K,B,ge,ve,U,J,i,O,V,ot,x,d,j,Le,it,Ue,Ce,We,Ye,Ge,Ke,Pe,Be,Ve,Re,Fe,Z,xe,ze,ae,Ae,at,Y,ye,Xe,Ze,M,z,t,H,je,l,n,q,Se,Ie,qe,He,et,R,Ne,tt,y,Je,nt,ht,st,ce,lt,m,w,rt,dt
function g()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return g()
end
end
function ne(e,t)
return{
he,
e,
t,
}
end
function S(e)
return e[0+1]==he
end
function Ee(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function Te(e)
while S(e)do
e=oe(e)
end
return e
end
function p(e)
return e[0+1]==Q
end
function me(e)
return e[1+1]
end
function ue(e)
return b()[me(e)]
end
function h(t,e)
return{
C,
t,
e,
}
end
function a(e)
return e[0+1]==C
end
function o(e)
return e[1+1]
end
function s(e)
return e[2+1]
end
function r(e)
return e[0+1]==ee
end
function _(e,t)
return{
de,
e,
t,
}
end
function f(e)
return e[0+1]==de
end
function E(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function D(t,e)
return{
pe,
t,
e,
}
end
function k(e)
return e[0+1]==pe
end
function F(e)
return e[1+1]
end
function L(e)
return e[2+1]
end
function X(e)
return e[0+1]==Oe
end
function c(e)
return e[1+1]
end
function N(e,t)
return{
Qe,
e,
t,
}
end
function W(e)
return e[0+1]==Qe
end
function ie(e)
return e[1+1]
end
function te(e)
return e[2+1]
end
function De(t,e,a)
return{
we,
t,
e,
a,
}
end
function P(e)
return e[0+1]==we
end
function _e(e)
return e[1+1]
end
function ke(e)
return e[2+1]
end
function be(e)
return e[3+1]
end
function A(t,e)
return{
Me,
t,
e,
}
end
function G(e)
return e[0+1]==Me
end
function fe(e)
return e[1+1]
end
function le(e)
return e[2+1]
end
function K(e,t)
return{
se,
e,
t,
}
end
function B(e)
return e[0+1]==se
end
function ge(e)
return e[1+1]
end
function ve(e)
return e[2+1]
end
function U(e)
local e=n(e)
local function t(e)
e[1+1]=U(e[1+1])
e[2+1]=U(e[2+1])
return e
end
if f(e)then
return t(e)
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif S(e)then
return t(e)
end
return e
end
function J()
return{re}
end
function i(e)
return e[0+1]==re
end
function O(e,t)
if e==t then
return
end
e[0+1]=Oe
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function V(e,a)
I(i(e))
I(not i(a))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function ot(t)
local e=J()
V(e,t)
return e
end
function M(t,e)
if t==e then
return true
end
if me(t)==me(e)then
O(t,e)
return true
else
return false
end
end
function z(a)
local t=v
do
local e=#a-1
while e>=0 do
t=h(a[e+1],t)
e=e-1
end
end
return t
end
function t(...)
local e=({...})
return z(e)
end
function H(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
u(t,e)
e=c(e)
end
for a=1,#t do
local t=t[a]
O(t,e)
end
return e
end
function je(e)
return W(e)or P(e)or G(e)or B(e)
end
function l(e)
return X(e)or je(e)
end
function n(o,i,t,a)
if i==nil then
i={}
end
if t==nil then
t={
false,
false,
}
end
if a==nil then
a={}
end
local e,d,s
function d(t)
O(e,t)
do
local e=0
while e<#a do
O(a[e+1],t)
e=e+1
end
end
return t
end
function s(t)
d(t)
if l(t)then
u(a,e)
return n(t,i,{
false,
false,
},a)
end
return t
end
local r={}
e=o
local function o()
t[1+1]=true
return s(it)
end
local function c()
local e={}
for t in pairs(r)do
e[t]=true
end
for t in pairs(i)do
e[t]=true
end
return e
end
do
local t=0
while l(e)and t<32 do
u(a,e)
e=q(e)
t=t+1
end
end
while l(e)do
local h=w(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if W(e)then
return o()
elseif G(e)then
local a=fe(e)
local e=le(e)
local h={
Ue,
Ce,
We,
Ye,
Ge,
Ke,
Pe,
Be,
Ve,
Re,
Fe,
}
local i=false
for e=1,#h do
local e=h[e]
if m(e,a)then
i=true
break
end
end
if i then
I(#e==1)
I(t[1+1]==false)
local e=n(e[0+1],c(),t)
if t[1+1]then
return s(A(a,{e}))
else
return g()
end
end
if m(a,Z)then
return o()
elseif m(a,xe)then
return o()
elseif m(a,ze)then
return o()
elseif m(a,ae)then
I(#e==3)
I(t[1+1]==false)
local a=n(e[0+1],c(),t)
if t[1+1]then
return s(A(ae,{
a,
e[1+1],
e[2+1],
}))
else
return g()
end
end
return g()
elseif P(e)then
return o()
elseif B(e)then
return o()
end
return g()
end
r[h]=true
u(a,e)
e=q(e)
end
return d(e)
end
function q(a)
local e=H(a)
local t
I(not X(e))
if W(e)then
t=tt(ie(e),te(e),a)
elseif P(e)then
t=st(_e(e),ke(e),be(e),a)
elseif G(e)then
t=ht(fe(e),le(e),a)
elseif B(e)then
t=nt(ge(e),ve(e),a)
else
t=e
end
t=H(t)
O(e,t)
return t
end
function Se(e)
while l(e)or S(e)do
e=n(Te(e))
end
return e
end
function qe(a,o,i)
local t={}
do
local e=0
while e<#a do
if m(a[(e+0)+1],o)then
t[(e+0)+1]=o
t[(e+1)+1]=i
do
e=e+2
while e<#a do
t[(e+0)+1]=a[(e+0)+1]
t[(e+1)+1]=a[(e+1)+1]
e=e+2
end
end
return t
else
t[(e+0)+1]=a[(e+0)+1]
t[(e+1)+1]=a[(e+1)+1]
end
e=e+2
end
end
t[(#a+0)+1]=o
t[(#a+1)+1]=i
return t
end
function He(t,a,o)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function et(t,a)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return g()
end
function R(a)
local o=v
do
local e=0
while e<#a do
o=h(t(a[(e+0)+1],a[(e+1)+1]),o)
e=e+2
end
end
return _(Le,t(o))
end
function Ne(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function tt(d,e,c)
local h=q(e)
if l(h)then
return c
end
local i
i=function()return D(x,t(Y,t(ze,t(R(d),h))))end
if a(h)then
local e={}
local t=h
while not r(t)do
if l(t)then
return c
elseif a(t)then
u(e,o(t))
t=q(s(t))
else
return i()
end
end
if m(e[0+1],ye)then
if#e==1 then
return i()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
u(a,e[t+1])
t=t+1
end
end
return De(d,o,a)
elseif m(e[0+1],Xe)then
if#e==1 then
return i()
end
local n=n(N(d,e[1+1]))
if not f(n)then
return i()
end
local t=q(E(n))
if l(t)then
return c
end
if not p(t)then
return i()
end
if not M(t,j)then
return i()
end
local t=q(T(n))
if l(t)then
return c
end
if not a(t)then
return i()
end
local o=o(t)
local t=q(s(t))
if l(t)then
return c
end
if not r(t)then
return i()
end
local a={R(d)}
do
local t=2
while t<#e do
u(a,e[t+1])
t=t+1
end
end
return K(o,a)
elseif m(e[0+1],Y)then
if#e==1 then
return i()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
u(a,N(d,e[t+1]))
t=t+1
end
end
return A(o,a)
else
local o=N(d,e[0+1])
local a={}
do
local t=1
while t<#e do
u(a,N(d,e[t+1]))
t=t+1
end
end
return K(o,a)
end
elseif r(h)then
return h
elseif y(h)then
return He(d,h,i())
elseif k(h)then
return i()
end
return g()
end
function y(e)
return p(e)or f(e)
end
function nt(u,i,c)
local e
e=function()return D(x,t(Y,t(xe,t(u,z(i)))))end
u=q(u)
if l(u)then
return c
end
if not f(u)then
return e()
end
local t=n(E(u))
if not(p(t)and M(t,d))then
return e()
end
local d=n(T(u))
if not a(d)then
return e()
end
local t=U(o(d))
local d=n(s(d))
if not(a(d)and r(n(s(d))))then
return e()
end
local l=o(d)
local d=Ie
local n=0
while not r(t)do
if y(t)then
local a=v
do
local e=#i-1
while e>=n do
a=h(i[e+1],a)
e=e-1
end
end
d=qe(d,t,a)
n=#i
t=v
elseif a(t)then
if n<#i then
local e=i[n+1]
n=n+1
d=qe(d,o(t),e)
t=s(t)
else
return e()
end
else
return e()
end
end
if#i~=n then
return e()
end
return N(d,l)
end
function ht(n,a,i)
local o
o=function()return D(x,t(Y,t(n,z(a))))end
for e=1,#Je do
local e=Je[e]
if m(n,e[0+1])then
if#a~=e[1+1]then
return o()
end
if e[1+1]==1 then
return e[2+1](a[0+1],o,i)
elseif e[1+1]==2 then
return e[2+1](a[0+1],a[1+1],o,i)
elseif e[1+1]==3 then
return e[2+1](a[0+1],a[1+1],a[2+1],o,i)
end
return g()
end
end
return o()
end
function st(i,o,e,a)
local a
a=function()return D(x,t(ye,t(R(i),o,z(e))))end
if m(o,Ae)then
if#e~=1 then
return a()
end
return e[0+1]
elseif m(o,at)then
if#e~=2 then
return a()
end
return lt(i,e[0+1],e[1+1],a)
elseif m(o,Ze)then
if#e~=2 then
return a()
end
return ne(e[0+1],N(i,e[1+1]))
end
return a()
end
function ce(e)
return t(ye,Ae,e)
end
function lt(l,i,w,f)
i=U(i)
local n={}
local c=false
local e=i
while not r(e)do
if y(e)then
u(n,e)
c=true
e=v
elseif a(e)then
u(n,o(e))
e=s(e)
else
return f()
end
end
local a
if c then
a=z(n)
else
a=i
end
local e={}
Ne(l,function(t,a)
do
local e=0
while e<#n do
if m(n[e+1],t)then
return
end
e=e+1
end
end
u(e,t)
end)
local o=a
do
local t=#e-1
while t>=0 do
o=h(e[t+1],o)
t=t-1
end
end
local a=a
do
local t=#e-1
while t>=0 do
a=h(ce(et(l,e[t+1])),a)
t=t-1
end
end
return _(d,t(i,h(ce(_(d,t(o,w))),a)))
end
function m(e,t)
if e==t then
return true
end
e=n(e)
t=n(t)
if e==t then
return true
end
local function i(t,e,o,a)
if m(o(t),o(e))and m(a(t),a(e))then
O(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
O(e,v)
O(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,F,L)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,E,T)
end
return g()
end
function w(e)
e=H(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(w(o(e)))
i=" "
e=H(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(w(h(E(e),T(e))))
elseif k(e)then
return"!"..tostring(w(h(F(e),L(e))))
elseif p(e)then
return ue(e)
elseif S(e)then
return";("..tostring(w(Ee(e))).." "..tostring(w(oe(e)))..")"
elseif W(e)then
return"$("..tostring(w(R(ie(e)))).." "..tostring(w(te(e)))..")"
elseif G(e)then
return"%("..tostring(w(fe(e))).." "..tostring(w(z(le(e))))..")"
elseif P(e)then
return"@("..tostring(w(R(_e(e)))).." "..tostring(w(ke(e))).." "..tostring(w(z(be(e))))..")"
elseif B(e)then
return"^("..tostring(w(ge(e))).." "..tostring(w(z(ve(e))))..")"
end
return g()
end
function rt()
return{
["0"]="0",
["1"]="1",
["2"]="2",
["3"]="3",
["4"]="4",
["5"]="5",
["6"]="6",
["7"]="7",
["8"]="8",
["9"]="9",
A="A",
B="B",
C="C",
D="D",
E="E",
F="F",
G="G",
H="H",
I="I",
J="J",
K="K",
L="L",
M="M",
N="N",
O="O",
P="P",
Q="Q",
R="R",
S="S",
T="T",
U="U",
V="V",
W="W",
X="X",
Y="Y",
Z="Z",
a="a",
b="b",
c="c",
d="d",
e="e",
f="f",
g="g",
h="h",
i="i",
j="j",
k="k",
l="l",
m="m",
n="n",
o="o",
p="p",
q="q",
r="r",
s="s",
t="t",
u="u",
v="v",
w="w",
x="x",
y="y",
z="z",
["一類何物"]="㝉",
["之物"]="𫙦",
["其子"]="𦮪",
["出入改滅"]="𢒟",
["列序"]="𠜺",
["化滅"]="𠏁",
["參形"]="𠫰",
["吾自"]="𦣹",
["太始初核"]="𣝗",
["如若"]="𦱡",
["宇宙亡矣"]="𨹹",
["尾末"]="𡲵",
["序丁"]="𠆤",
["序丙"]="𠇮",
["序乙"]="㐈",
["序甲"]="𠇚",
["式形"]="佱",
["引用"]="㧈",
["應用"]="𤰆",
["效應"]="効",
["映表"]="𤅔",
["是非"]="欤",
["構物"]="𡒫",
["為符名連"]="‐",
["爻陰"]="侌",
["爻陽"]="𣆄",
["特定其物"]="亓",
["省略一物"]="畧",
["符名"]="謼",
["等同"]="弌",
["解算"]="筭",
["註疏"]="疎",
["詞素"]="𧥝",
["謬誤"]="䥘",
["連頸"]="丩",
["間空"]="𣣓",
["首始"]="𩠐",
}
end
function dt()
return{
["0"]="0",
["1"]="1",
["2"]="2",
["3"]="3",
["4"]="4",
["5"]="5",
["6"]="6",
["7"]="7",
["8"]="8",
["9"]="9",
A="A",
B="B",
C="C",
D="D",
E="E",
F="F",
G="G",
H="H",
I="I",
J="J",
K="K",
L="L",
M="M",
N="N",
O="O",
P="P",
Q="Q",
R="R",
S="S",
T="T",
U="U",
V="V",
W="W",
X="X",
Y="Y",
Z="Z",
a="a",
b="b",
c="c",
d="d",
e="e",
f="f",
g="g",
h="h",
i="i",
j="j",
k="k",
l="l",
m="m",
n="n",
o="o",
p="p",
q="q",
r="r",
s="s",
t="t",
u="u",
v="v",
w="w",
x="x",
y="y",
z="z",
["㝉"]="一類何物",
["𫙦"]="之物",
["𦮪"]="其子",
["𢒟"]="出入改滅",
["𠜺"]="列序",
["𠏁"]="化滅",
["𠫰"]="參形",
["𦣹"]="吾自",
["𣝗"]="太始初核",
["𦱡"]="如若",
["𨹹"]="宇宙亡矣",
["𡲵"]="尾末",
["𠆤"]="序丁",
["𠇮"]="序丙",
["㐈"]="序乙",
["𠇚"]="序甲",
["佱"]="式形",
["㧈"]="引用",
["𤰆"]="應用",
["効"]="效應",
["𤅔"]="映表",
["欤"]="是非",
["𡒫"]="構物",
["‐"]="為符名連",
["侌"]="爻陰",
["𣆄"]="爻陽",
["亓"]="特定其物",
["畧"]="省略一物",
["謼"]="符名",
["弌"]="等同",
["筭"]="解算",
["疎"]="註疏",
["𧥝"]="詞素",
["䥘"]="謬誤",
["丩"]="連頸",
["𣣓"]="間空",
["𩠐"]="首始",
}
end
local c
c=function()
local e=rt()
c=function()return e end
return e
end
b=function()
local e=dt()
b=function()return e end
return e
end
Q=0
C=1
ee=2
de=3
pe=4
Oe=5
Qe=6
Me=7
we=8
se=9
he=11
re=10
e.new_comment=ne
e.comment_p=S
e.comment_comment=Ee
e.comment_x=oe
e.un_comment_all=Te
local function rt(e)
return b()[e]~=nil
end
local function nt(e)
return{
Q,
e,
}
end
local function Qe(e)
return c()[e]~=nil
end
local function i(t)
return nt(c()[t])
end
e.can_new_symbol_p=Qe
e.New_Symbol=New_Symbol
e.new_symbol=i
e.symbol_p=p
e.un_symbol=ue
e.New_Construction=New_Construction
e.new_construction=h
e.construction_p=a
e.construction_head=o
e.construction_tail=s
v={ee}
e.Null_V=Null_V
e.null_v=v
e.null_p=r
e.New_Data=New_Data
e.new_data=_
e.data_p=f
e.data_name=E
e.data_list=T
e.New_Error=New_Error
e.new_error=D
e.error_p=k
e.error_name=F
e.error_list=L
e.just_p=X
e.evaluate=N
e.apply=K
local function c(t)
local t=Se(t)
local function o(e)
e[1+1]=U(e[1+1])
e[2+1]=U(e[2+1])
if S(e[1+1])or S(e[2+1])then
local t=ot(e)
local a=e[1+1]
local o=e[2+1]
local e=c(a)
local a=c(o)
t[1+1]=e
t[2+1]=a
return t
else
return e
end
end
if f(t)then
return o(t)
elseif k(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
e.force_all_rec=U
e.force_uncomment_all_rec=c
x=i("太始初核")
local pe=i("符名")
d=i("化滅")
j=i("式形")
local yt=i("等同")
local vt=i("解算")
local Q=i("特定其物")
local y=i("省略一物")
Le=i("映表")
local pt=i("如若")
local c=i("一類何物")
local ee=i("是非")
local we=i("其子")
local tt=i("爻陽")
local et=i("爻陰")
local wt=i("引用")
local ft=i("應用")
local lt=i("間空")
local de=i("連頸")
local he=i("構物")
local re=i("謬誤")
local dt=i("詞素")
local Oe=i("列序")
local mt=i("首始")
local ut=i("尾末")
local st=i("之物")
local b=i("宇宙亡矣")
local ot=i("效應")
local ht=i("註疏")
it=D(x,t(b,y))
local function b(e)
return _(pe,h(x,h(e,v)))
end
local function Me(e)
return b(t(c,t(d,y,e),Q))
end
local function C(e,a)
return b(t(c,t(d,t(e),y),a))
end
local function se(e)
return b(t(c,d,t(ee,t(c,e,y))))
end
local ct=Me(he)
Ue=C(he,pe)
Ce=C(he,Oe)
We=se(he)
local it=Me(re)
Ye=C(re,pe)
Ge=C(re,Oe)
Ke=se(re)
local Me=Me(de)
Pe=se(de)
Be=C(de,mt)
Ve=C(de,ut)
Re=se(dt)
Fe=se(lt)
Z=b(t(c,d,t(ee,yt)))
xe=b(t(c,t(d,h(d,y),y),ft))
ze=b(t(c,d,vt))
local Oe=C(Oe,t(c,st,y))
ae=b(t(c,d,pt))
Ae=b(t(c,j,wt))
at=b(t(c,t(j,t(d,y,d)),Q))
Y=b(t(j,t(x,d)))
ye=b(t(j,t(x,j)))
Xe=b(t(j,j))
local Ae=b(t(c,d,ht))
Ze=b(t(c,j,ht))
local Y=_(et,t())
local se=_(tt,t())
local function ye(e,n,i)
local t={}
while a(e)do
u(t,o(e))
e=s(e)
end
if r(e)then
return n(t)
end
return i(t,e)
end
local function C(t)
return ye(t,function(e)return e end,function(e,e)return false end)
end
e.jsArray_to_list=z
e.maybe_list_to_jsArray=C
e.new_list=t
local function he(t)
while X(t)or S(t)do
t=H(Te(t))
end
return t
end
e.un_just=H
e.un_just_comment_all=he
e.delay_p=je
e.delay_just_p=l
local function Te(e)
if W(e)then
return e
elseif P(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return g()
end
local function X(e)
return ie(Te(e))
end
local function he(t)
return te(Te(t))
end
e.delay_env=X
e.delay_x=he
local function he(e)
return n(e)
end
local function X(t)
if S(t)then
return oe(t)
else
return q(t)
end
end
e.force_all=he
e.force1=q
e.force_uncomment1=X
e.force_uncomment_all=Se
Ie={}
local function re(t)
t=n(t)
if not f(t)then
return false
end
local i=n(E(t))
if not p(i)then
return false
end
if not M(i,Le)then
return false
end
i=n(T(t))
if not a(i)then
return false
end
if not r(n(s(i)))then
return false
end
local t={}
local i=n(o(i))
while not r(i)do
if not a(i)then
return false
end
local e=n(o(i))
i=n(s(i))
if not a(e)then
return false
end
local i=o(e)
e=n(s(e))
if not a(e)then
return false
end
local a=o(e)
if not r(n(s(e)))then
return false
end
local o=true
do
local e=0
while e<#t do
if m(t[(e+0)+1],i)then
t[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
u(t,i)
u(t,a)
end
end
return t
end
e.env_null_v=Ie
e.env_set=qe
e.env_get=He
e.env2val=R
e.env_foreach=Ne
e.val2env=re
local function he(t,a)
return{
t,
1,
function(e)
e=q(e)
if l(e)then
return A(t,{e})
end
if a(e)then
return se
end
return Y
end,
}
end
local function X(t,a,i)
return{
t,
1,
function(e,o)
e=q(e)
if l(e)then
return A(t,{e})
end
if a(e)then
return i(e)
end
return o()
end,
}
end
Je={
he(We,f),
{
ct,
2,
_,
},
X(Ue,f,E),
X(Ce,f,T),
he(Ke,k),
{
it,
2,
D,
},
X(Ye,k,F),
X(Ge,k,L),
he(Fe,r),
{
Me,
2,
h,
},
he(Pe,a),
X(Be,a,o),
X(Ve,a,s),
{
Z,
2,
function(e,t,i)
if e==t then
return se
end
e=q(e)
t=q(t)
if l(e)or l(t)then
return A(Z,{
e,
t,
})
end
if e==t then
return se
end
local function i(a,t,e)
return A(ae,{
a,
t,
e,
})
end
local function n(t,e)
return i(t,e,Y)
end
I(not l(e))
local function i(a,t,e,o)
return n(A(Z,{
e(a),
e(t),
}),A(Z,{
o(a),
o(t),
}))
end
if r(e)then
if not r(e)then
return Y
end
return se
elseif p(e)then
if not p(t)then
return Y
end
if M(e,t)then
return se
else
return Y
end
elseif f(e)then
if not f(t)then
return Y
end
return i(e,t,E,T)
elseif a(e)then
if not a(t)then
return Y
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return Y
end
return i(e,t,F,L)
end
return g()
end,
},
{
xe,
2,
function(h,e,i)
local t={}
local e=n(e)
while a(e)do
u(t,o(e))
e=n(s(e))
end
if not r(e)then
return i()
end
return K(h,t)
end,
},
{
ze,
2,
function(e,a,t)
local e=re(e)
if e==false then
return t()
end
return N(e,a)
end,
},
he(Re,p),
{
Oe,
1,
function(e,t)
e=q(e)
if l(e)then
return A(Oe,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
ae,
3,
function(e,o,a,t)
e=q(e)
if l(e)then
return A(ae,{
e,
o,
a,
})
end
if not f(e)then
return t()
end
local e=n(E(e))
if not p(e)then
return t()
end
if M(e,tt)then
return o
end
if M(e,et)then
return a
end
return t()
end,
},
{
Ae,
2,
ne,
},
}
e.equal_p=m
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function i(t,e,a,o)
if l(a(t),a(e))and l(o(t),o(e))then
O(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
O(e,v)
O(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,F,L)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,E,T)
elseif W(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return g()
end
local function q(t)
return w(U(t))
end
e.simple_print=w
e.simple_print_force_all_rec=q
local function Z(te)
local M,g,m,l,f,n,O,T,X,k,H,S,P,R,U,L,C,F,Y,E,W,q,w,G,B,Z
function m()
return#M==g
end
function l()
I(not m())
local e=string.sub(M,g+1,g+1)
g=g+1
return e
end
function f(e)
I(string.sub(M,(g-1)+1,(g-1)+1)==e)
g=g-1
end
function n(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function O(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if m()then
return false
end
local e=l()
if not O(e)then
f(e)
return false
end
while O(e)and not m()do
e=l()
end
if not O(e)then
f(e)
end
return true
end
function X()
if m()then
return false
end
local e=l()
local t=""
if not F(e)then
f(e)
return false
end
while F(e)and not m()do
t=tostring(t)..tostring(e)
e=l()
end
if F(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Qe(t)then
return i(t)
else
return n("Not Symbol"..tostring(t))
end
end
function k()
if m()then
return false
end
local e=l()
if e~="("then
f(e)
return false
end
local t=J()
local a=t
local function o(a)
local e=J()
V(t,h(a,e))
t=e
end
while true do
T()
if m()then
return n()
end
e=l()
if e==")"then
V(t,v)
return a
end
if e=="."then
T()
local o=Y()
V(t,o)
T()
if m()then
return n()
end
e=l()
if e~=")"then
return n()
end
return a
end
f(e)
local e=Y()
o(e)
end
end
function H()
if m()then
return false
end
local e=l()
if e~="#"then
f(e)
return false
end
local e=k()
if e==false then
return n()
end
if not a(e)then
return n()
end
return _(o(e),s(e))
end
function S()
if m()then
return false
end
local e=l()
if e~="!"then
f(e)
return false
end
local e=k()
if e==false then
return n()
end
if not a(e)then
return n()
end
return D(o(e),s(e))
end
function F(e)
if O(e)then
return false
end
local t={
"(",
")",
"!",
"#",
".",
"$",
"%",
"^",
"@",
"~",
"/",
"-",
">",
"_",
":",
"?",
"[",
"]",
"&",
";",
}
for a=1,#t do
local t=t[a]
if t==e then
return false
end
end
return true
end
function Y()
T()
local e={
k,
Z,
H,
S,
P,
R,
U,
L,
C,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return n()
end
function E(e)
if e==false then
return n()
end
return e
end
function W()
return not m()
end
function q(e)
E(W())
E(l()==e)
end
function w(t)
if t==nil then
t=false
end
local function a()
q("[")
local e=w()
q("]")
return e
end
local e
if t then
e={
k,
X,
a,
H,
S,
P,
R,
U,
L,
C,
}
else
e={
k,
B,
H,
S,
P,
R,
U,
L,
C,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return n()
end
function G(e)
if m()then
return e
end
local a=l()
if a=="."then
local a=w()
return t(c,t(d,t(e),y),a)
elseif a==":"then
local a=w()
return t(c,a,e)
elseif a=="~"then
return t(ee,e)
elseif a=="@"then
local a=w()
return t(c,t(d,h(e,y),y),a)
elseif a=="?"then
return t(c,d,t(ee,e))
elseif a=="/"then
local e={e}
while true do
local t=w(true)
u(e,t)
if m()then
break
end
local e=l()
if e~="/"then
f(e)
break
end
end
return t(we,z(e))
else
f(a)
return e
end
end
function B()
if m()then
return false
end
local e=l()
if e=="&"then
E(W())
local e=l()
if e=="+"then
local e=w()
return t(j,t(x,e))
else
f(e)
end
local e=w()
return t(j,e)
elseif e==":"then
E(W())
local e=l()
if e=="&"then
q(">")
local e=w()
return t(c,t(j,t(d,y,e)),Q)
elseif e==">"then
local e=w()
return t(c,t(d,y,e),Q)
else
f(e)
end
local e=w()
return t(c,e,Q)
elseif e=="+"then
local e=w()
return t(x,e)
elseif e=="["then
local e=w()
q("]")
return G(e)
elseif e=="_"then
q(":")
local e=w()
return t(c,e,y)
else
f(e)
local e=X()
if e==false then
return false
end
return G(e)
end
end
function Z()
local e=B()
if e==false then
return false
end
if p(e)then
return e
end
return b(e)
end
M=te
g=0
local function t(t,i)
return function()
if m()then
return false
end
local e=l()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return n()
end
if not a(e)then
return n()
end
local t=s(e)
if not(a(t)and r(s(t)))then
return n()
end
return i(o(e),o(t))
end
end
local function h(t,h)
return function()
if m()then
return false
end
local e=l()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return n()
end
if not a(e)then
return n()
end
local i=s(e)
if not a(i)then
return n()
end
local t=s(i)
if not(a(t)and r(s(t)))then
return n()
end
return h(o(e),o(i),o(t))
end
end
P=t("$",function(e,t)
local e=re(e)
if e==false then
return n()
end
return N(e,t)
end)
R=t("%",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return n()end)
return A(t,e)
end)
U=h("@",function(o,a,e)
local t=ye(e,function(e)return e end,function(e,e)return n()end)
local e=re(o)
if e==false then
return n()
end
return De(e,a,t)
end)
L=t("^",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return n()end)
return K(t,e)
end)
C=t(";",function(e,t)return ne(e,t)end)
return Y()
end
e.complex_parse=Z
local function q(m)
local function i(h,u)
if p(h)then
return ue(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=C(h)
if e~=false and#e==3 and l(e[0+1],c)then
local n=C(e[1+1])
if n~=false and#n==3 and l(n[0+1],d)then
local h=n[1+1]
local r=C(h)
if r~=false and#r==1 and l(n[2+1],y)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(s(h),y)and l(n[2+1],y)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,y)and l(e[2+1],Q)then
return t(":>"..tostring(i(n[2+1],true)))
end
end
local a=C(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ee)then
return t(tostring(i(a[1+1],true)).."?")
end
if n~=false and#n==2 and l(e[2+1],Q)and l(n[0+1],j)then
local e=C(n[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],y)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],y)and"_"or l(e[2+1],Q)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],j)then
local a=C(e[1+1])
if a~=false and#a==2 and l(a[0+1],x)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ee)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],x)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],we)then
local e=C(e[1+1])
if e~=false and#e>1 then
local a=i(e[0+1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(i(e[t+1],true))
t=t+1
end
end
return t(a)
end
end
end
if u then
return w(h)
else
return w(b(h))
end
end
local t=Z(w(m))
local n=""
local d=""
if r(t)then
return"()"
elseif a(t)then
n="("
d=""
while a(t)do
n=tostring(n)..tostring(d)..tostring(q(o(t)))
d=" "
t=s(t)
end
if r(t)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(q(t))..")"
end
return n
elseif f(t)then
local a=E(t)
local t=T(t)
local e=C(t)
if e~=false and#e==2 and l(a,pe)and l(e[0+1],x)then
return i(e[1+1],false)
end
return"#"..tostring(q(h(a,t)))
elseif k(t)then
return"!"..tostring(q(h(F(t),L(t))))
elseif p(t)then
return ue(t)
elseif S(t)then
return";("..tostring(q(Ee(t))).." "..tostring(q(oe(t)))..")"
elseif W(t)then
return"$("..tostring(q(R(ie(t)))).." "..tostring(q(te(t)))..")"
elseif G(t)then
return"%("..tostring(q(fe(t))).." "..tostring(q(z(le(t))))..")"
elseif P(t)then
return"@("..tostring(q(R(_e(t)))).." "..tostring(q(ke(t))).." "..tostring(q(z(be(t))))..")"
elseif B(t)then
return"^("..tostring(q(ge(t))).." "..tostring(q(z(ve(t))))..")"
end
return g()
end
e.complex_print=q
local function w(s)
local d=J()
local i={function(e)return V(d,e)end}
local e=0
local function n()
error("MT parse ERROR")
end
local function c(e)
if not e then
return n()
end
end
local function l()
c(#s>e)
local t=string.sub(s,e+1,e+1)
e=e+1
return t
end
local r={}
while#i~=0 do
local t={}
for e=1,#i do
local o=i[e]
local e=l()
local a
a=function(i)
local e=J()
local a=J()
u(t,function(t)return V(e,t)end)
u(t,function(e)return V(a,e)end)
o(i(e,a))
end
if e=="^"then
local e=""
while true do
local t=l()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if rt(e)then
o(nt(e))
else
return n()
end
elseif e=="."then
a(h)
elseif e=="#"then
a(_)
elseif e=="!"then
a(D)
elseif e=="$"then
local a=false
local e=false
u(t,function(e)
a=e
end)
u(t,function(t)
e=t
end)
u(r,function()
if a==false or e==false then
return g()
else
local t=re(a)
if t==false then
return n()
else
o(N(t,e))
end
end
end)
elseif e=="_"then
o(v)
else
return n()
end
end
i=t
end
c(e==#s)
do
local e=#r-1
while e>=0 do
r[e+1]()
e=e-1
end
end
return d
end
local function l(t)
local n={t}
local t=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=H(e)
local i
i=function(e,i,a,o)
t=tostring(t)..tostring(i)
u(h,a(e))
u(h,o(e))
end
if p(e)then
t=tostring(t).."^"
t=tostring(t)..tostring(me(e))
t=tostring(t).."^"
elseif a(e)then
i(e,".",o,s)
elseif r(e)then
t=tostring(t).."_"
elseif f(e)then
i(e,"#",E,T)
elseif k(e)then
i(e,"!",F,L)
elseif je(e)then
local e=Te(e)
i(e,"$",(function(e)return R(ie(e))end),te)
else
return g()
end
end
n=h
end
return t
end
e.machinetext_parse=w
e.machinetext_print=l
local function g(e)
return function()return{
false,
e,
}end
end
local function l(e)
return function()return{
true,
e(),
}end
end
local function q(t)
local t=t()
while t[0+1]do
t=t[1+1]()
end
return t[1+1]
end
e.trampoline_return=g
e.trampoline_delay=l
e.run_trampoline=q
local k=b(h(we,h(h(ot,h(h(c,h(st,h(y,v))),v)),v)))
local v=b(h(we,h(h(ot,h(de,v)),v)))
local function b(e,a)
return _(v,t(e,a))
end
local function j(e)
return _(k,e)
end
local function y(w,c,u,p,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=n(u)
if f(u)then
local f=E(u)
local e=T(u)
if m(f,k)then
e=n(e)
if a(e)then
local t=o(e)
local e=n(s(e))
if r(e)then
if h==false then
local a=t
local t=p
local e
e=function()return w(a,t)end
return l(e)
else
local a
a=w
local e
e=c
local i=t
local o=p
local t
t=function()return y(a,e,K(h,i),o)end
return l(t)
end
end
end
elseif m(f,v)then
e=n(e)
if a(e)then
local u=o(e)
local e=n(s(e))
if a(e)then
local a=o(e)
local e=n(s(e))
if r(e)then
if h==false then
local e
e=w
local o
o=c
local n=u
local i=a
local a=p
local t
t=function()return y(e,o,n,a,i)end
return l(t)
else
local n
n=w
local o
o=c
local c=u
local r=a
local u=p
local s=h
local e=i("序甲")
local a
a=function()return y(n,o,c,u,_(d,t(t(e),b(t(ce(r),e),ce(s)))))end
return l(a)
end
end
end
end
end
end
if h==false then
return l(function()return c(u,p,w)end)
else
return l(function()return c(u,p,function(e,t)return l(function()return y(w,c,K(h,{e}),t)end)end)end)
end
end
local function a(e,t,a,o)
return y(e,t,a,o)
end
local function t(t,i,o,a)
return q(y((function(e,a)return g(t(e,a))end),(function(a,t,e)return g(i(a,t,function(a,t)return q(e(a,t))end))end),o,a))
end
e.Return_Effect_SystemName=Return_Effect_SystemName
e.return_effect_systemName=k
e.Bind_Effect_SystemName=Bind_Effect_SystemName
e.bind_effect_systemName=v
e.new_effect_bind=b
e.new_effect_return=j
e.run_monad_trampoline=a
e.run_monad_stackoverflow=t
return e