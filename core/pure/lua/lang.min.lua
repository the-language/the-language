local function u(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local q,I,y,K,we,pe,Ke,Ge,oe,L,ne,he,fe,de,b,re,N,je,Z,Te,v,le,se,h,a,o,i,p,r,E,w,_,A,H,g,C,U,J,it,S,G,ie,ae,Oe,V,ke,be,ve,T,W,me,ce,Y,Q,Ee,ze,F,X,n,O,P,st,z,d,j,Qe,rt,Me,We,Ye,Ce,Fe,Ue,He,Se,Re,Le,De,ee,_e,xe,te,Be,ht,B,ye,nt,dt,M,x,e,R,qe,l,s,k,Ne,Pe,ge,Ve,lt,D,Ae,ot,c,Ie,at,Ze,tt,ue,Xe,m,f,et,Je
function q()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return q()
end
end
function re(e,t)
return{
de,
e,
t,
}
end
function N(e)
return e[0+1]==de
end
function je(e)
return e[1+1]
end
function Z(e)
return e[2+1]
end
function Te(e)
while N(e)do
e=Z(e)
end
return e
end
function v(e)
return e[0+1]==K
end
function le(e)
return e[1+1]
end
function se(e)
return y()[le(e)]
end
function h(t,e)
return{
we,
t,
e,
}
end
function a(e)
return e[0+1]==we
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==pe
end
function E(e,t)
return{
Ke,
e,
t,
}
end
function w(e)
return e[0+1]==Ke
end
function _(e)
return e[1+1]
end
function A(e)
return e[2+1]
end
function H(t,e)
return{
Ge,
t,
e,
}
end
function g(e)
return e[0+1]==Ge
end
function C(e)
return e[1+1]
end
function U(e)
return e[2+1]
end
function J(e)
return e[0+1]==oe
end
function it(e)
return e[1+1]
end
function S(e,t)
return{
L,
e,
t,
}
end
function G(e)
return e[0+1]==L
end
function ie(e)
return e[1+1]
end
function ae(e)
return e[2+1]
end
function Oe(t,e,a)
return{
he,
t,
e,
a,
}
end
function V(e)
return e[0+1]==he
end
function ke(e)
return e[1+1]
end
function be(e)
return e[2+1]
end
function ve(e)
return e[3+1]
end
function T(t,e)
return{
ne,
t,
e,
}
end
function W(e)
return e[0+1]==ne
end
function me(e)
return e[1+1]
end
function ce(e)
return e[2+1]
end
function Y(e,t)
return{
fe,
e,
t,
}
end
function Q(e)
return e[0+1]==fe
end
function Ee(e)
return e[1+1]
end
function ze(e)
return e[2+1]
end
function F(e)
local e=s(e)
local function t(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
return e
end
if w(e)then
return t(e)
elseif g(e)then
return t(e)
elseif a(e)then
return t(e)
elseif N(e)then
return t(e)
end
return e
end
function X()
return{b}
end
function n(e)
return e[0+1]==b
end
function O(e,t)
if e==t then
return
end
e[0+1]=oe
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function P(e,t)
I(n(e))
I(not n(t))
local e=e
local t=t
e[0+1]=t[0+1]
e[1+1]=t[1+1]
e[2+1]=t[2+1]
e[3+1]=t[3+1]
end
function st(t)
local e=X()
P(e,t)
return e
end
function M(t,e)
if t==e then
return true
end
if le(t)==le(e)then
O(t,e)
return true
else
return false
end
end
function x(a)
local t=p
do
local e=#a-1
while e>=0 do
t=h(a[e+1],t)
e=e-1
end
end
return t
end
function e(...)
local e=({...})
return x(e)
end
function R(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
u(t,e)
e=it(e)
end
for a=1,#t do
local t=t[a]
O(t,e)
end
return e
end
function qe(e)
return G(e)or V(e)or W(e)or Q(e)
end
function l(e)
return J(e)or qe(e)
end
function s(o,i,t,a)
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
local e,d,n
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
function n(t)
d(t)
if l(t)then
u(a,e)
return s(t,i,{
false,
false,
},a)
end
return t
end
local h={}
e=o
local function o()
t[1+1]=true
return n(rt)
end
local function c()
local e={}
for t in pairs(h)do
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
e=k(e)
t=t+1
end
end
while l(e)do
local r=f(e)
if i[r]==true then
return o()
end
if h[r]==true then
t[0+1]=true
if G(e)then
return o()
elseif W(e)then
local a=me(e)
local e=ce(e)
local h={
Me,
We,
Ye,
Ce,
Fe,
Ue,
He,
Se,
Re,
Le,
De,
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
local e=s(e[0+1],c(),t)
if t[1+1]then
return n(T(a,{e}))
else
return q()
end
end
if m(a,ee)then
return o()
elseif m(a,_e)then
return o()
elseif m(a,xe)then
return o()
elseif m(a,te)then
I(#e==3)
I(t[1+1]==false)
local a=s(e[0+1],c(),t)
if t[1+1]then
return n(T(te,{
a,
e[1+1],
e[2+1],
}))
else
return q()
end
end
return q()
elseif V(e)then
return o()
elseif Q(e)then
return o()
end
return q()
end
h[r]=true
u(a,e)
e=k(e)
end
return d(e)
end
function k(a)
local e=R(a)
local t
I(not J(e))
if G(e)then
t=ot(ie(e),ae(e),a)
elseif V(e)then
t=tt(ke(e),be(e),ve(e),a)
elseif W(e)then
t=Ze(me(e),ce(e),a)
elseif Q(e)then
t=at(Ee(e),ze(e),a)
else
t=e
end
t=R(t)
O(e,t)
return t
end
function Ne(e)
while l(e)or N(e)do
e=s(Te(e))
end
return e
end
function ge(a,o,i)
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
function Ve(t,a,o)
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
function lt(t,a)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function D(o)
local a=p
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(Qe,e(a))
end
function Ae(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ot(h,t,d)
local n=k(t)
if l(n)then
return d
end
local t
t=function()return H(z,e(B,e(xe,e(D(h),n))))end
if a(n)then
local e={}
local n=n
while not r(n)do
if l(n)then
return d
elseif a(n)then
u(e,o(n))
n=k(i(n))
else
return t()
end
end
if m(e[0+1],ye)then
if#e==1 then
return t()
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
return Oe(h,o,a)
elseif m(e[0+1],nt)then
if#e==1 then
return t()
end
local s=s(S(h,e[1+1]))
if not w(s)then
return t()
end
local n=k(_(s))
if l(n)then
return d
end
if not v(n)then
return t()
end
if not M(n,j)then
return t()
end
local n=k(A(s))
if l(n)then
return d
end
if not a(n)then
return t()
end
local o=o(n)
local a=k(i(n))
if l(a)then
return d
end
if not r(a)then
return t()
end
local a={D(h)}
do
local t=2
while t<#e do
u(a,e[t+1])
t=t+1
end
end
return Y(o,a)
elseif m(e[0+1],B)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
u(a,S(h,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=S(h,e[0+1])
local a={}
do
local t=1
while t<#e do
u(a,S(h,e[t+1]))
t=t+1
end
end
return Y(o,a)
end
elseif r(n)then
return n
elseif c(n)then
return Ve(h,n,t())
elseif g(n)then
return t()
end
return q()
end
function c(e)
return v(e)or w(e)
end
function at(n,u,m)
local t
t=function()return H(z,e(B,e(_e,e(n,x(u)))))end
n=k(n)
if l(n)then
return m
end
if not w(n)then
return t()
end
local e=s(_(n))
if not(v(e)and M(e,d))then
return t()
end
local n=s(A(n))
if not a(n)then
return t()
end
local e=F(o(n))
local n=s(i(n))
if not(a(n)and r(s(i(n))))then
return t()
end
local d=o(n)
local s=Pe
local n=0
while not r(e)do
if c(e)then
local t=p
do
local e=#u-1
while e>=n do
t=h(u[e+1],t)
e=e-1
end
end
s=ge(s,e,t)
n=#u
e=p
elseif a(e)then
if n<#u then
local t=u[n+1]
n=n+1
s=ge(s,o(e),t)
e=i(e)
else
return t()
end
else
return t()
end
end
if#u~=n then
return t()
end
return S(s,d)
end
function Ze(i,t,o)
local a
a=function()return H(z,e(B,e(i,x(t))))end
for e=1,#Ie do
local e=Ie[e]
if m(i,e[0+1])then
if#t~=e[1+1]then
return a()
end
if e[1+1]==1 then
return e[2+1](t[0+1],a,o)
elseif e[1+1]==2 then
return e[2+1](t[0+1],t[1+1],a,o)
elseif e[1+1]==3 then
return e[2+1](t[0+1],t[1+1],t[2+1],a,o)
end
return q()
end
end
return a()
end
function tt(i,o,t,a)
local a
a=function()return H(z,e(ye,e(D(i),o,x(t))))end
if m(o,Be)then
if#t~=1 then
return a()
end
return t[0+1]
elseif m(o,ht)then
if#t~=2 then
return a()
end
return Xe(i,t[0+1],t[1+1],a)
elseif m(o,dt)then
if#t~=2 then
return a()
end
return re(t[0+1],S(i,t[1+1]))
end
return a()
end
function ue(t)
return e(ye,Be,t)
end
function Xe(f,s,y,w)
s=F(s)
local n={}
local l=false
local t=s
while not r(t)do
if c(t)then
u(n,t)
l=true
t=p
elseif a(t)then
u(n,o(t))
t=i(t)
else
return w()
end
end
local i=l and x(n)or s
local t={}
Ae(f,function(a,e)
do
local e=0
while e<#n do
if m(n[e+1],a)then
return
end
e=e+1
end
end
u(t,a)
end)
local o=i
do
local e=#t-1
while e>=0 do
o=h(t[e+1],o)
e=e-1
end
end
local a=i
do
local e=#t-1
while e>=0 do
a=h(ue(lt(f,t[e+1])),a)
e=e-1
end
end
return E(d,e(s,h(ue(E(d,e(o,y))),a)))
end
function m(e,t)
if e==t then
return true
end
e=s(e)
t=s(t)
if e==t then
return true
end
local function n(t,e,a,o)
if m(a(t),a(e))and m(o(t),o(e))then
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
O(e,p)
O(t,p)
return true
elseif v(e)then
if not v(t)then
return false
end
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,C,U)
elseif w(e)then
if not w(t)then
return false
end
return n(e,t,_,A)
end
return q()
end
function f(e)
e=R(e)
local t=""
local n=""
if r(e)then
return"()"
elseif a(e)then
t="("
n=""
while a(e)do
t=tostring(t)..tostring(n)..tostring(f(o(e)))
n=" "
e=R(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif w(e)then
return"#"..tostring(f(h(_(e),A(e))))
elseif g(e)then
return"!"..tostring(f(h(C(e),U(e))))
elseif v(e)then
return se(e)
elseif N(e)then
return";("..tostring(f(je(e))).." "..tostring(f(Z(e)))..")"
elseif G(e)then
return"$("..tostring(f(D(ie(e)))).." "..tostring(f(ae(e)))..")"
elseif W(e)then
return"%("..tostring(f(me(e))).." "..tostring(f(x(ce(e))))..")"
elseif V(e)then
return"@("..tostring(f(D(ke(e)))).." "..tostring(f(be(e))).." "..tostring(f(x(ve(e))))..")"
elseif Q(e)then
return"^("..tostring(f(Ee(e))).." "..tostring(f(x(ze(e))))..")"
end
return q()
end
function et()
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
function Je()
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
local e=et()
c=function()return e end
return e
end
y=function()
local e=Je()
y=function()return e end
return e
end
K=0
we=1
pe=2
Ke=3
Ge=4
oe=5
L=6
ne=7
he=8
fe=9
de=11
b=10
t.new_comment=re
t.comment_p=N
t.comment_comment=je
t.comment_x=Z
t.un_comment_all=Te
local function it(e)
return y()[e]~=nil
end
local function Ze(e)
return{
K,
e,
}
end
local function Je(e)
return c()[e]~=nil
end
local function n(e)
return Ze(c()[e])
end
t.can_new_symbol_p=Je
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=v
t.un_symbol=se
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={pe}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=E
t.data_p=w
t.data_name=_
t.data_list=A
t.New_Error=New_Error
t.new_error=H
t.error_p=g
t.error_name=C
t.error_list=U
t.just_p=J
t.evaluate=S
t.apply=Y
local function c(e)
local o=Ne(e)
local function i(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
if N(e[1+1])or N(e[2+1])then
local t=st(e)
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
if w(o)then
return i(o)
elseif g(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=F
t.force_uncomment_all_rec=c
z=n("太始初核")
local pe=n("符名")
d=n("化滅")
j=n("式形")
local yt=n("等同")
local vt=n("解算")
local K=n("特定其物")
local y=n("省略一物")
Qe=n("映表")
local pt=n("如若")
local c=n("一類何物")
local oe=n("是非")
local we=n("其子")
local ot=n("爻陽")
local tt=n("爻陰")
local wt=n("引用")
local ft=n("應用")
local lt=n("間空")
local fe=n("連頸")
local de=n("構物")
local he=n("謬誤")
local st=n("詞素")
local Ge=n("列序")
local mt=n("首始")
local ut=n("尾末")
local at=n("之物")
local b=n("宇宙亡矣")
local Xe=n("效應")
local et=n("註疏")
rt=H(z,e(b,y))
local function b(e)
return E(pe,h(z,h(e,p)))
end
local function Ke(t)
return b(e(c,e(d,y,t),K))
end
local function L(t,a)
return b(e(c,e(d,e(t),y),a))
end
local function ne(t)
return b(e(c,d,e(oe,e(c,t,y))))
end
local ct=Ke(de)
Me=L(de,pe)
We=L(de,Ge)
Ye=ne(de)
local rt=Ke(he)
Ce=L(he,pe)
Fe=L(he,Ge)
Ue=ne(he)
local Ke=Ke(fe)
He=ne(fe)
Se=L(fe,mt)
Re=L(fe,ut)
Le=ne(st)
De=ne(lt)
ee=b(e(c,d,e(oe,yt)))
_e=b(e(c,e(d,h(d,y),y),ft))
xe=b(e(c,d,vt))
local Ge=L(Ge,e(c,at,y))
te=b(e(c,d,pt))
Be=b(e(c,j,wt))
ht=b(e(c,e(j,e(d,y,d)),K))
B=b(e(j,e(z,d)))
ye=b(e(j,e(z,j)))
nt=b(e(j,j))
local Be=b(e(c,d,et))
dt=b(e(c,j,et))
local B=E(tt,e())
local ne=E(ot,e())
local function ye(e,s,n)
local t={}
while a(e)do
u(t,o(e))
e=i(e)
end
if r(e)then
return s(t)
end
return n(t,e)
end
local function L(e)
return ye(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=L
t.new_list=e
local function he(e)
while J(e)or N(e)do
e=R(Te(e))
end
return e
end
t.un_just=R
t.un_just_comment_all=he
t.delay_p=qe
t.delay_just_p=l
local function Te(e)
if G(e)then
return e
elseif V(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return q()
end
local function J(e)
return ie(Te(e))
end
local function he(e)
return ae(Te(e))
end
t.delay_env=J
t.delay_x=he
local function he(e)
return s(e)
end
local function J(e)
if N(e)then
return Z(e)
else
return k(e)
end
end
t.force_all=he
t.force1=k
t.force_uncomment1=J
t.force_uncomment_all=Ne
Pe={}
local function de(n)
n=s(n)
if not w(n)then
return false
end
local e=s(_(n))
if not v(e)then
return false
end
if not M(e,Qe)then
return false
end
e=s(A(n))
if not a(e)then
return false
end
if not r(s(i(e)))then
return false
end
local n={}
local h=s(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=s(o(h))
h=s(i(h))
if not a(e)then
return false
end
local t=o(e)
e=s(i(e))
if not a(e)then
return false
end
local o=o(e)
if not r(s(i(e)))then
return false
end
local a=true
do
local e=0
while e<#n do
if m(n[(e+0)+1],t)then
n[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
u(n,t)
u(n,o)
end
end
return n
end
t.env_null_v=Pe
t.env_set=ge
t.env_get=Ve
t.env2val=D
t.env_foreach=Ae
t.val2env=de
local function he(t,a)
return{
t,
1,
function(e)
e=k(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return ne
end
return B
end,
}
end
local function J(t,a,i)
return{
t,
1,
function(e,o)
e=k(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return i(e)
end
return o()
end,
}
end
Ie={
he(Ye,w),
{
ct,
2,
E,
},
J(Me,w,_),
J(We,w,A),
he(Ue,g),
{
rt,
2,
H,
},
J(Ce,g,C),
J(Fe,g,U),
he(De,r),
{
Ke,
2,
h,
},
he(He,a),
J(Se,a,o),
J(Re,a,i),
{
ee,
2,
function(e,t,n)
if e==t then
return ne
end
e=k(e)
t=k(t)
if l(e)or l(t)then
return T(ee,{
e,
t,
})
end
if e==t then
return ne
end
local function n(a,t,e)
return T(te,{
a,
t,
e,
})
end
local function s(t,e)
return n(t,e,B)
end
I(not l(e))
local function n(o,e,t,a)
return s(T(ee,{
t(o),
t(e),
}),T(ee,{
a(o),
a(e),
}))
end
if r(e)then
if not r(e)then
return B
end
return ne
elseif v(e)then
if not v(t)then
return B
end
if M(e,t)then
return ne
else
return B
end
elseif w(e)then
if not w(t)then
return B
end
return n(e,t,_,A)
elseif a(e)then
if not a(t)then
return B
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return B
end
return n(e,t,C,U)
end
return q()
end,
},
{
_e,
2,
function(h,e,n)
local t={}
local e=s(e)
while a(e)do
u(t,o(e))
e=s(i(e))
end
if not r(e)then
return n()
end
return Y(h,t)
end,
},
{
xe,
2,
function(e,a,t)
local e=de(e)
if e==false then
return t()
end
return S(e,a)
end,
},
he(Le,v),
{
Ge,
1,
function(e,t)
e=k(e)
if l(e)then
return T(Ge,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
te,
3,
function(e,a,o,t)
e=k(e)
if l(e)then
return T(te,{
e,
a,
o,
})
end
if not w(e)then
return t()
end
local e=s(_(e))
if not v(e)then
return t()
end
if M(e,ot)then
return a
end
if M(e,tt)then
return o
end
return t()
end,
},
{
Be,
2,
re,
},
}
t.equal_p=m
local function l(e,t)
if e==t then
return true
end
e=R(e)
t=R(t)
if e==t then
return true
end
local function n(t,e,a,o)
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
O(e,p)
O(t,p)
return true
elseif v(e)then
if not v(t)then
return false
end
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,C,U)
elseif w(e)then
if not w(t)then
return false
end
return n(e,t,_,A)
elseif G(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return q()
end
local function k(e)
return f(F(e))
end
t.simple_print=f
t.simple_print_force_all_rec=k
local function ee(ee)
local C,g,m,l,f,s,A,_,Q,k,R,D,V,N,F,B,L,W,M,O,U,q,w,J,G,Z
function m()
return#C==g
end
function l()
I(not m())
local e=string.sub(C,g+1,g+1)
g=g+1
return e
end
function f(e)
I(string.sub(C,(g-1)+1,(g-1)+1)==e)
g=g-1
end
function s(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function _()
if m()then
return false
end
local e=l()
if not A(e)then
f(e)
return false
end
while A(e)and not m()do
e=l()
end
if not A(e)then
f(e)
end
return true
end
function Q()
if m()then
return false
end
local e=l()
local t=""
if not W(e)then
f(e)
return false
end
while W(e)and not m()do
t=tostring(t)..tostring(e)
e=l()
end
if W(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Je(t)then
return n(t)
else
return s("Not Symbol"..tostring(t))
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
local t=X()
local a=t
local function o(a)
local e=X()
P(t,h(a,e))
t=e
end
while true do
_()
if m()then
return s()
end
e=l()
if e==")"then
P(t,p)
return a
end
if e=="."then
_()
local o=M()
P(t,o)
_()
if m()then
return s()
end
e=l()
if e~=")"then
return s()
end
return a
end
f(e)
local e=M()
o(e)
end
end
function R()
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
return s()
end
if not a(e)then
return s()
end
return E(o(e),i(e))
end
function D()
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
return s()
end
if not a(e)then
return s()
end
return H(o(e),i(e))
end
function W(t)
if A(t)then
return false
end
local e={
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
for a=1,#e do
local e=e[a]
if e==t then
return false
end
end
return true
end
function M()
_()
local e={
k,
Z,
R,
D,
V,
N,
F,
B,
L,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return s()
end
function O(e)
if e==false then
return s()
end
return e
end
function U()
return not m()
end
function q(e)
O(U())
O(l()==e)
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
Q,
a,
R,
D,
V,
N,
F,
B,
L,
}
else
e={
k,
G,
R,
D,
V,
N,
F,
B,
L,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return s()
end
function J(t)
if m()then
return t
end
local a=l()
if a=="."then
local a=w()
return e(c,e(d,e(t),y),a)
elseif a==":"then
local a=w()
return e(c,a,t)
elseif a=="~"then
return e(oe,t)
elseif a=="@"then
local a=w()
return e(c,e(d,h(t,y),y),a)
elseif a=="?"then
return e(c,d,e(oe,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
u(t,e)
if m()then
break
end
local e=l()
if e~="/"then
f(e)
break
end
end
return e(we,x(t))
else
f(a)
return t
end
end
function G()
if m()then
return false
end
local t=l()
if t=="&"then
O(U())
local t=l()
if t=="+"then
local t=w()
return e(j,e(z,t))
else
f(t)
end
local t=w()
return e(j,t)
elseif t==":"then
O(U())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(c,e(j,e(d,y,t)),K)
elseif t==">"then
local t=w()
return e(c,e(d,y,t),K)
else
f(t)
end
local t=w()
return e(c,t,K)
elseif t=="+"then
local t=w()
return e(z,t)
elseif t=="["then
local e=w()
q("]")
return J(e)
elseif t=="_"then
q(":")
local t=w()
return e(c,t,y)
else
f(t)
local e=Q()
if e==false then
return false
end
return J(e)
end
end
function Z()
local e=G()
if e==false then
return false
end
if v(e)then
return e
end
return b(e)
end
C=ee
g=0
local function n(t,n)
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
return s()
end
if not a(e)then
return s()
end
local t=i(e)
if not(a(t)and r(i(t)))then
return s()
end
return n(o(e),o(t))
end
end
local function d(t,h)
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
return s()
end
if not a(e)then
return s()
end
local t=i(e)
if not a(t)then
return s()
end
local n=i(t)
if not(a(n)and r(i(n)))then
return s()
end
return h(o(e),o(t),o(n))
end
end
V=n("$",function(e,t)
local e=de(e)
if e==false then
return s()
end
return S(e,t)
end)
N=n("%",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return s()end)
return T(t,e)
end)
F=d("@",function(e,t,a)
local a=ye(a,function(e)return e end,function(e,e)return s()end)
local e=de(e)
if e==false then
return s()
end
return Oe(e,t,a)
end)
B=n("^",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return s()end)
return Y(t,e)
end)
L=n(";",function(t,e)return re(t,e)end)
return M()
end
t.complex_parse=ee
local function k(m)
local function n(r,u)
if v(r)then
return se(r)
end
local function s(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(r)
if e~=false and#e==3 and l(e[0+1],c)then
local t=L(e[1+1])
if t~=false and#t==3 and l(t[0+1],d)then
local h=t[1+1]
local r=L(h)
if r~=false and#r==1 and l(t[2+1],y)then
return s(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),y)and l(t[2+1],y)then
return s(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,y)and l(e[2+1],K)then
return s(":>"..tostring(n(t[2+1],true)))
end
end
local a=L(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],oe)then
return s(tostring(n(a[1+1],true)).."?")
end
if t~=false and#t==2 and l(e[2+1],K)and l(t[0+1],j)then
local e=L(t[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],y)then
return s(":&>"..tostring(n(e[2+1],true)))
end
end
local t=l(e[2+1],y)and"_"or l(e[2+1],K)and""or n(e[2+1],true)
return s(tostring(t)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],j)then
local t=L(e[1+1])
if t~=false and#t==2 and l(t[0+1],z)then
return s("&+"..tostring(n(t[1+1],true)))
end
return s("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],oe)then
return s(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],z)then
return s("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],we)then
local e=L(e[1+1])
if e~=false and#e>1 then
local a=n(e[0+1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(n(e[t+1],true))
t=t+1
end
end
return s(a)
end
end
end
if u then
return f(r)
else
return f(b(r))
end
end
local e=ee(f(m))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(k(o(e)))
d=" "
e=i(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(k(e))..")"
end
return s
elseif w(e)then
local t=_(e)
local a=A(e)
local e=L(a)
if e~=false and#e==2 and l(t,pe)and l(e[0+1],z)then
return n(e[1+1],false)
end
return"#"..tostring(k(h(t,a)))
elseif g(e)then
return"!"..tostring(k(h(C(e),U(e))))
elseif v(e)then
return se(e)
elseif N(e)then
return";("..tostring(k(je(e))).." "..tostring(k(Z(e)))..")"
elseif G(e)then
return"$("..tostring(k(D(ie(e)))).." "..tostring(k(ae(e)))..")"
elseif W(e)then
return"%("..tostring(k(me(e))).." "..tostring(k(x(ce(e))))..")"
elseif V(e)then
return"@("..tostring(k(D(ke(e)))).." "..tostring(k(be(e))).." "..tostring(k(x(ve(e))))..")"
elseif Q(e)then
return"^("..tostring(k(Ee(e))).." "..tostring(k(x(ze(e))))..")"
end
return q()
end
t.complex_print=k
local function f(s)
local l=X()
local a={function(e)return P(l,e)end}
local t=0
local function i()
error("MT parse ERROR")
end
local function r(e)
if not e then
return i()
end
end
local function d()
r(#s>t)
local e=string.sub(s,t+1,t+1)
t=t+1
return e
end
local n={}
while#a~=0 do
local t={}
for e=1,#a do
local o=a[e]
local e=d()
local a
a=function(i)
local e=X()
local a=X()
u(t,function(t)return P(e,t)end)
u(t,function(e)return P(a,e)end)
o(i(e,a))
end
if e=="^"then
local e=""
while true do
local t=d()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if it(e)then
o(Ze(e))
else
return i()
end
elseif e=="."then
a(h)
elseif e=="#"then
a(E)
elseif e=="!"then
a(H)
elseif e=="$"then
local e=false
local a=false
u(t,function(t)
e=t
end)
u(t,function(e)
a=e
end)
u(n,function()
if e==false or a==false then
return q()
else
local e=de(e)
if e==false then
return i()
else
o(S(e,a))
end
end
end)
elseif e=="_"then
o(p)
else
return i()
end
end
a=t
end
r(t==#s)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return l
end
local function l(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=R(e)
local t
t=function(e,t,a,o)
n=tostring(n)..tostring(t)
u(h,a(e))
u(h,o(e))
end
if v(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(le(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif w(e)then
t(e,"#",_,A)
elseif g(e)then
t(e,"!",C,U)
elseif qe(e)then
local e=Te(e)
t(e,"$",(function(e)return D(ie(e))end),ae)
else
return q()
end
end
s=h
end
return n
end
t.machinetext_parse=f
t.machinetext_print=l
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
local function q(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=g
t.trampoline_delay=l
t.run_trampoline=q
local k=b(h(we,h(h(Xe,h(h(c,h(at,h(y,p))),p)),p)))
local v=b(h(we,h(h(Xe,h(fe,p)),p)))
local function j(t,a)
return E(v,e(t,a))
end
local function x(e)
return E(k,e)
end
local function y(p,f,u,c,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=s(u)
if w(u)then
local w=_(u)
local t=A(u)
if m(w,k)then
t=s(t)
if a(t)then
local e=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local t=e
local a=c
local e
e=function()return p(t,a)end
return l(e)
else
local a
a=p
local t
t=f
local o=e
local i=c
local e
e=function()return y(a,t,Y(h,o),i)end
return l(e)
end
end
end
elseif m(w,v)then
t=s(t)
if a(t)then
local u=o(t)
local t=s(i(t))
if a(t)then
local a=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local e
e=p
local o
o=f
local n=u
local i=a
local a=c
local t
t=function()return y(e,o,n,a,i)end
return l(t)
else
local o
o=p
local t
t=f
local u=u
local s=a
local r=c
local h=h
local a=n("序甲")
local i
i=function()return y(o,t,u,r,E(d,e(e(a),b(e(ue(s),a),ue(h)))))end
return l(i)
end
end
end
end
end
end
if h==false then
return l(function()return f(u,c,p)end)
else
return l(function()return f(u,c,function(e,t)return l(function()return y(p,f,Y(h,{e}),t)end)end)end)
end
end
local function n(a,e,t,o)
return y(a,e,t,o)
end
local function s(n,i,o,a)
return q(y((function(t,e)return g(n(t,e))end),(function(a,t,e)return g(i(a,t,function(a,t)return q(e(a,t))end))end),o,a))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=k
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=x
t.run_monad_trampoline=n
t.run_monad_stackoverflow=s
return t