function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,H,w,fe,ye,we,me,K,D,v,Q,se,te,Ue,Ve,de,N,_e,X,ze,p,he,ie,h,a,o,s,y,r,_,m,z,E,S,b,M,U,J,st,O,P,Z,ee,Ge,Y,je,xe,ve,T,V,le,ue,B,W,be,pe,F,G,i,A,C,ht,j,d,x,Qe,it,Ke,Be,Fe,Me,De,We,Pe,Ye,Le,Ce,Te,ae,ke,qe,oe,Ae,Oe,re,ce,rt,dt,L,q,e,R,ge,l,n,g,Re,Se,Ee,Ie,nt,I,Ne,at,c,He,tt,Je,Ze,ne,et,u,f,Xe,ot
function k()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return k()
end
end
function de(e,t)
return{
Ue,
e,
t,
}
end
function N(e)
return e[0+1]==Ue
end
function _e(e)
return e[1+1]
end
function X(e)
return e[2+1]
end
function ze(e)
while N(e)do
e=X(e)
end
return e
end
function p(e)
return e[0+1]==fe
end
function he(e)
return e[1+1]
end
function ie(e)
return w()[he(e)]
end
function h(t,e)
return{
ye,
t,
e,
}
end
function a(e)
return e[0+1]==ye
end
function o(e)
return e[1+1]
end
function s(e)
return e[2+1]
end
function r(e)
return e[0+1]==we
end
function _(e,t)
return{
me,
e,
t,
}
end
function m(e)
return e[0+1]==me
end
function z(e)
return e[1+1]
end
function E(e)
return e[2+1]
end
function S(t,e)
return{
K,
t,
e,
}
end
function b(e)
return e[0+1]==K
end
function M(e)
return e[1+1]
end
function U(e)
return e[2+1]
end
function J(e)
return e[0+1]==D
end
function st(e)
return e[1+1]
end
function O(e,t)
return{
v,
e,
t,
}
end
function P(e)
return e[0+1]==v
end
function Z(e)
return e[1+1]
end
function ee(e)
return e[2+1]
end
function Ge(t,e,a)
return{
se,
t,
e,
a,
}
end
function Y(e)
return e[0+1]==se
end
function je(e)
return e[1+1]
end
function xe(e)
return e[2+1]
end
function ve(e)
return e[3+1]
end
function T(t,e)
return{
Q,
t,
e,
}
end
function V(e)
return e[0+1]==Q
end
function le(e)
return e[1+1]
end
function ue(e)
return e[2+1]
end
function B(e,t)
return{
te,
e,
t,
}
end
function W(e)
return e[0+1]==te
end
function be(e)
return e[1+1]
end
function pe(e)
return e[2+1]
end
function F(e)
local e=n(e)
local function t(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
return e
end
if m(e)then
return t(e)
elseif b(e)then
return t(e)
elseif a(e)then
return t(e)
elseif N(e)then
return t(e)
end
return e
end
function G()
return{Ve}
end
function i(e)
return e[0+1]==Ve
end
function A(e,t)
if e==t then
return
end
e[0+1]=D
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function C(e,a)
H(i(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function ht(t)
local e=G()
C(e,t)
return e
end
function L(e,t)
if e==t then
return true
end
if he(e)==he(t)then
A(e,t)
return true
else
return false
end
end
function q(a)
local t=y
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
return q(e)
end
function R(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
__TS__ArrayPush(t,e)
e=st(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function ge(e)
return P(e)or Y(e)or V(e)or W(e)
end
function l(e)
return J(e)or ge(e)
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
A(e,t)
do
local e=0
while e<#a do
A(a[e+1],t)
e=e+1
end
end
return t
end
function s(t)
d(t)
if l(t)then
__TS__ArrayPush(a,e)
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
__TS__ArrayPush(a,e)
e=g(e)
t=t+1
end
end
while l(e)do
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if P(e)then
return o()
elseif V(e)then
local a=le(e)
local e=ue(e)
local i={
Ke,
Be,
Fe,
Me,
De,
We,
Pe,
Ye,
Le,
Ce,
Te,
}
local h=false
for e=1,#i do
local e=i[e]
if u(e,a)then
h=true
break
end
end
if h then
H(#e==1)
H(t[1+1]==false)
local e=n(e[0+1],c(),t)
if t[1+1]then
return s(T(a,{e}))
else
return k()
end
end
if u(a,ae)then
return o()
elseif u(a,ke)then
return o()
elseif u(a,qe)then
return o()
elseif u(a,oe)then
H(#e==3)
H(t[1+1]==false)
local a=n(e[0+1],c(),t)
if t[1+1]then
return s(T(oe,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif Y(e)then
return o()
elseif W(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return d(e)
end
function g(a)
local e=R(a)
local t
H(not J(e))
if P(e)then
t=at(Z(e),ee(e),a)
elseif Y(e)then
t=Ze(je(e),xe(e),ve(e),a)
elseif V(e)then
t=Je(le(e),ue(e),a)
elseif W(e)then
t=tt(be(e),pe(e),a)
else
t=e
end
t=R(t)
A(e,t)
return t
end
function Re(e)
while l(e)or N(e)do
e=n(ze(e))
end
return e
end
function Ee(a,o,i)
local t={}
do
local e=0
while e<#a do
if u(a[(e+0)+1],o)then
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
function Ie(t,a,o)
do
local e=0
while e<#t do
if u(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function nt(t,a)
do
local e=0
while e<#t do
if u(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function I(a)
local o=y
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Qe,e(o))
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
function at(h,t,d)
local i=g(t)
if l(i)then
return d
end
local t
t=function()return S(j,e(re,e(qe,e(I(h),i))))end
if a(i)then
local e={}
local i=i
while not r(i)do
if l(i)then
return d
elseif a(i)then
__TS__ArrayPush(e,o(i))
i=g(s(i))
else
return t()
end
end
if u(e[0+1],ce)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return Ge(h,o,a)
elseif u(e[0+1],rt)then
if#e==1 then
return t()
end
local n=n(O(h,e[1+1]))
if not m(n)then
return t()
end
local i=g(z(n))
if l(i)then
return d
end
if not p(i)then
return t()
end
if not L(i,x)then
return t()
end
local i=g(E(n))
if l(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=g(s(i))
if l(a)then
return d
end
if not r(a)then
return t()
end
local a={I(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return B(o,a)
elseif u(e[0+1],re)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,O(h,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=O(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,O(h,e[t+1]))
t=t+1
end
end
return B(o,a)
end
elseif r(i)then
return i
elseif c(i)then
return Ie(h,i,t())
elseif b(i)then
return t()
end
return k()
end
function c(e)
return p(e)or m(e)
end
function tt(t,i,f)
local function u()
return S(j,e(re,e(ke,e(t,q(i)))))
end
t=g(t)
if l(t)then
return f
end
if not m(t)then
return u()
end
local e=n(z(t))
if not(p(e)and L(e,d))then
return u()
end
local t=n(E(t))
if not a(t)then
return u()
end
local e=F(o(t))
local t=n(s(t))
if not(a(t)and r(n(s(t))))then
return u()
end
local d=o(t)
local n=Se
local t=0
while not r(e)do
if c(e)then
local a=y
do
local e=#i-1
while e>=t do
a=h(i[e+1],a)
e=e-1
end
end
n=Ee(n,e,a)
t=#i
e=y
elseif a(e)then
if t<#i then
local a=i[t+1]
t=t+1
n=Ee(n,o(e),a)
e=s(e)
else
return u()
end
else
return u()
end
end
if#i~=t then
return u()
end
return O(n,d)
end
function Je(i,t,o)
local a
a=function()return S(j,e(re,e(i,q(t))))end
for e=1,#He do
local e=He[e]
if u(i,e[0+1])then
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
return k()
end
end
return a()
end
function Ze(i,o,t,a)
local a
a=function()return S(j,e(ce,e(I(i),o,q(t))))end
if u(o,Ae)then
if#t~=1 then
return a()
end
return t[0+1]
elseif u(o,Oe)then
if#t~=2 then
return a()
end
return et(i,t[0+1],t[1+1],a)
elseif u(o,dt)then
if#t~=2 then
return a()
end
return de(t[0+1],O(i,t[1+1]))
end
return a()
end
function ne(t)
return e(ce,Ae,t)
end
function et(l,i,f,t)
if t==nil then
t=false
end
local function w()
if t==false then
return S(j,e(ce,e(I(l),Oe,q({
i,
f,
}))))
else
return t()
end
end
i=F(i)
local n={}
local m=false
local t=i
while not r(t)do
if c(t)then
__TS__ArrayPush(n,t)
m=true
t=y
elseif a(t)then
__TS__ArrayPush(n,o(t))
t=s(t)
else
return w()
end
end
local a=i
if m then
a=q(n)
end
local t={}
Ne(l,function(a,e)
do
local e=0
while e<#n do
if u(n[e+1],a)then
return
end
e=e+1
end
end
__TS__ArrayPush(t,a)
end)
local o=a
do
local e=#t-1
while e>=0 do
o=h(t[e+1],o)
e=e-1
end
end
local a=a
do
local e=#t-1
while e>=0 do
a=h(ne(nt(l,t[e+1])),a)
e=e-1
end
end
return _(d,e(i,h(ne(_(d,e(o,f))),a)))
end
function u(t,e)
if t==e then
return true
end
t=n(t)
e=n(e)
if t==e then
return true
end
local function i(e,t,a,o)
if u(a(e),a(t))and u(o(e),o(t))then
A(e,t)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
A(t,y)
A(e,y)
return true
elseif p(t)then
if not p(e)then
return false
end
return L(t,e)
elseif a(t)then
if not a(e)then
return false
end
return i(t,e,o,s)
elseif b(t)then
if not b(e)then
return false
end
return i(t,e,M,U)
elseif m(t)then
if not m(e)then
return false
end
return i(t,e,z,E)
end
return k()
end
function f(e)
e=R(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(f(o(e)))
i=" "
e=R(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(f(h(z(e),E(e))))
elseif b(e)then
return"!"..tostring(f(h(M(e),U(e))))
elseif p(e)then
return ie(e)
elseif N(e)then
return";("..tostring(f(_e(e))).." "..tostring(f(X(e)))..")"
elseif P(e)then
return"$("..tostring(f(I(Z(e)))).." "..tostring(f(ee(e)))..")"
elseif V(e)then
return"%("..tostring(f(le(e))).." "..tostring(f(q(ue(e))))..")"
elseif Y(e)then
return"@("..tostring(f(I(je(e)))).." "..tostring(f(xe(e))).." "..tostring(f(q(ve(e))))..")"
elseif W(e)then
return"^("..tostring(f(be(e))).." "..tostring(f(q(pe(e))))..")"
end
return k()
end
function Xe()
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
function ot()
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
local e=Xe()
c=function()return e end
return e
end
w=function()
local e=ot()
w=function()return e end
return e
end
fe=0
ye=1
we=2
me=3
K=4
D=5
v=6
Q=7
se=8
te=9
Ue=11
Ve=10
t.new_comment=de
t.comment_p=N
t.comment_comment=_e
t.comment_x=X
t.un_comment_all=ze
local function st(e)
return w()[e]~=nil
end
local function ot(e)
return{
fe,
e,
}
end
local function at(e)
return c()[e]~=nil
end
local function i(e)
return ot(c()[e])
end
t.can_new_symbol_p=at
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=p
t.un_symbol=ie
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=s
y={we}
t.Null_V=Null_V
t.null_v=y
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=m
t.data_name=z
t.data_list=E
t.New_Error=New_Error
t.new_error=S
t.error_p=b
t.error_name=M
t.error_list=U
t.just_p=J
t.evaluate=O
t.apply=B
local function c(e)
local o=Re(e)
local function i(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
if N(e[1+1])or N(e[2+1])then
local t=ht(e)
local a=e[1+1]
local e=e[2+1]
local a=c(a)
local e=c(e)
t[1+1]=a
t[2+1]=e
return t
else
return e
end
end
if m(o)then
return i(o)
elseif b(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=F
t.force_uncomment_all_rec=c
j=i("太始初核")
local we=i("符名")
d=i("化滅")
x=i("式形")
local mt=i("等同")
local wt=i("解算")
local Q=i("特定其物")
local w=i("省略一物")
Qe=i("映表")
local pt=i("如若")
local c=i("一類何物")
local te=i("是非")
local ye=i("其子")
local Je=i("爻陽")
local Xe=i("爻陰")
local yt=i("引用")
local vt=i("應用")
local ct=i("間空")
local se=i("連頸")
local me=i("構物")
local fe=i("謬誤")
local ft=i("詞素")
local Ve=i("列序")
local ut=i("首始")
local nt=i("尾末")
local Ze=i("之物")
local v=i("宇宙亡矣")
local et=i("效應")
local tt=i("註疏")
it=S(j,e(v,w))
local function v(e)
return _(we,h(j,h(e,y)))
end
local function Ue(t)
return v(e(c,e(d,w,t),Q))
end
local function D(t,a)
return v(e(c,e(d,e(t),w),a))
end
local function K(t)
return v(e(c,d,e(te,e(c,t,w))))
end
local ht=Ue(me)
Ke=D(me,we)
Be=D(me,Ve)
Fe=K(me)
local it=Ue(fe)
Me=D(fe,we)
De=D(fe,Ve)
We=K(fe)
local lt=Ue(se)
Pe=K(se)
Ye=D(se,ut)
Le=D(se,nt)
Ce=K(ft)
Te=K(ct)
ae=v(e(c,d,e(te,mt)))
ke=v(e(c,e(d,h(d,w),w),vt))
qe=v(e(c,d,wt))
local Ue=D(Ve,e(c,Ze,w))
oe=v(e(c,d,pt))
Ae=v(e(c,x,yt))
Oe=v(e(c,e(x,e(d,w,d)),Q))
re=v(e(x,e(j,d)))
ce=v(e(x,e(j,x)))
rt=v(e(x,x))
local Ae=v(e(c,d,tt))
dt=v(e(c,x,tt))
local K=_(Xe,e())
local me=_(Je,e())
local function fe(e,i,n)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(e)
end
if r(e)then
return i(t)
end
return n(t,e)
end
local function D(e)
return fe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=q
t.maybe_list_to_jsArray=D
t.new_list=e
local function re(e)
while J(e)or N(e)do
e=R(ze(e))
end
return e
end
t.un_just=R
t.un_just_comment_all=re
t.delay_p=ge
t.delay_just_p=l
local function ze(e)
if P(e)then
return e
elseif Y(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif W(e)then
error("WIP")
end
return k()
end
local function re(e)
return Z(ze(e))
end
local function J(e)
return ee(ze(e))
end
t.delay_env=re
t.delay_x=J
local function J(e)
return n(e)
end
local function re(e)
if N(e)then
return X(e)
else
return g(e)
end
end
t.force_all=J
t.force1=g
t.force_uncomment1=re
t.force_uncomment_all=Re
Se={}
local function ce(i)
i=n(i)
if not m(i)then
return false
end
local e=n(z(i))
if not p(e)then
return false
end
if not L(e,Qe)then
return false
end
e=n(E(i))
if not a(e)then
return false
end
if not r(n(s(e)))then
return false
end
local i={}
local h=n(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=n(o(h))
h=n(s(h))
if not a(e)then
return false
end
local h=o(e)
e=n(s(e))
if not a(e)then
return false
end
local a=o(e)
if not r(n(s(e)))then
return false
end
local t=true
do
local e=0
while e<#i do
if u(i[(e+0)+1],h)then
i[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
__TS__ArrayPush(i,h)
__TS__ArrayPush(i,a)
end
end
return i
end
t.env_null_v=Se
t.env_set=Ee
t.env_get=Ie
t.env2val=I
t.env_foreach=Ne
t.val2env=ce
local function re(t,a)
return{
t,
1,
function(e)
e=g(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return me
end
return K
end,
}
end
local function J(t,i,o)
return{
t,
1,
function(e,a)
e=g(e)
if l(e)then
return T(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
He={
re(Fe,m),
{
ht,
2,
_,
},
J(Ke,m,z),
J(Be,m,E),
re(We,b),
{
it,
2,
S,
},
J(Me,b,M),
J(De,b,U),
re(Te,r),
{
lt,
2,
h,
},
re(Pe,a),
J(Ye,a,o),
J(Le,a,s),
{
ae,
2,
function(e,t,i)
if e==t then
return me
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return T(ae,{
e,
t,
})
end
if e==t then
return me
end
local function i(e,t,a)
return T(oe,{
e,
t,
a,
})
end
local function n(t,e)
return i(t,e,K)
end
H(not l(e))
local function i(a,o,t,e)
return n(T(ae,{
t(a),
t(o),
}),T(ae,{
e(a),
e(o),
}))
end
if r(e)then
if not r(e)then
return K
end
return me
elseif p(e)then
if not p(t)then
return K
end
if L(e,t)then
return me
else
return K
end
elseif m(e)then
if not m(t)then
return K
end
return i(e,t,z,E)
elseif a(e)then
if not a(t)then
return K
end
return i(e,t,o,s)
elseif b(e)then
if not b(t)then
return K
end
return i(e,t,M,U)
end
return k()
end,
},
{
ke,
2,
function(h,e,i)
local t={}
local e=n(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(s(e))
end
if not r(e)then
return i()
end
return B(h,t)
end,
},
{
qe,
2,
function(e,a,t)
local e=ce(e)
if e==false then
return t()
end
return O(e,a)
end,
},
re(Ce,p),
{
Ue,
1,
function(e,t)
e=g(e)
if l(e)then
return T(Ue,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
oe,
3,
function(e,o,a,t)
e=g(e)
if l(e)then
return T(oe,{
e,
o,
a,
})
end
if not m(e)then
return t()
end
local e=n(z(e))
if not p(e)then
return t()
end
if L(e,Je)then
return o
end
if L(e,Xe)then
return a
end
return t()
end,
},
{
Ae,
2,
de,
},
}
t.equal_p=u
local function l(e,t)
if e==t then
return true
end
e=R(e)
t=R(t)
if e==t then
return true
end
local function i(t,e,o,a)
if l(o(t),o(e))and l(a(t),a(e))then
A(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
A(e,y)
A(t,y)
return true
elseif p(e)then
if not p(t)then
return false
end
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif b(e)then
if not b(t)then
return false
end
return i(e,t,M,U)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,z,E)
elseif P(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif W(e)then
error("WIP")
end
return k()
end
local function g(e)
return f(F(e))
end
t.simple_print=f
t.simple_print_force_all_rec=g
local function ae(Z)
local N,b,u,l,m,n,z,E,J,g,D,P,Y,U,L,M,F,I,R,A,W,k,f,V,K,X
function u()
return#N==b
end
function l()
H(not u())
local e=string.sub(N,b+1,b+1)
b=b+1
return e
end
function m(e)
H(string.sub(N,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function n(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function z(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function E()
if u()then
return false
end
local e=l()
if not z(e)then
m(e)
return false
end
while z(e)and not u()do
e=l()
end
if not z(e)then
m(e)
end
return true
end
function J()
if u()then
return false
end
local e=l()
local t=""
if not I(e)then
m(e)
return false
end
while I(e)and not u()do
t=tostring(t)..tostring(e)
e=l()
end
if I(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if at(t)then
return i(t)
else
return n("Not Symbol"..tostring(t))
end
end
function g()
if u()then
return false
end
local e=l()
if e~="("then
m(e)
return false
end
local t=G()
local a=t
local function o(a)
local e=G()
C(t,h(a,e))
t=e
end
while true do
E()
if u()then
return n()
end
e=l()
if e==")"then
C(t,y)
return a
end
if e=="."then
E()
local o=R()
C(t,o)
E()
if u()then
return n()
end
e=l()
if e~=")"then
return n()
end
return a
end
m(e)
local e=R()
o(e)
end
end
function D()
if u()then
return false
end
local e=l()
if e~="#"then
m(e)
return false
end
local e=g()
if e==false then
return n()
end
if not a(e)then
return n()
end
return _(o(e),s(e))
end
function P()
if u()then
return false
end
local e=l()
if e~="!"then
m(e)
return false
end
local e=g()
if e==false then
return n()
end
if not a(e)then
return n()
end
return S(o(e),s(e))
end
function I(e)
if z(e)then
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
function R()
E()
local e={
g,
X,
D,
P,
Y,
U,
L,
M,
F,
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
function A(e)
if e==false then
return n()
end
return e
end
function W()
return not u()
end
function k(e)
A(W())
A(l()==e)
end
function f(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=f()
k("]")
return e
end
local e
if t then
e={
g,
J,
a,
D,
P,
Y,
U,
L,
M,
F,
}
else
e={
g,
K,
D,
P,
Y,
U,
L,
M,
F,
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
function V(t)
if u()then
return t
end
local a=l()
if a=="."then
local a=f()
return e(c,e(d,e(t),w),a)
elseif a==":"then
local a=f()
return e(c,a,t)
elseif a=="~"then
return e(te,t)
elseif a=="@"then
local a=f()
return e(c,e(d,h(t,w),w),a)
elseif a=="?"then
return e(c,d,e(te,t))
elseif a=="/"then
local t={t}
while true do
local e=f(true)
__TS__ArrayPush(t,e)
if u()then
break
end
local e=l()
if e~="/"then
m(e)
break
end
end
return e(ye,q(t))
else
m(a)
return t
end
end
function K()
if u()then
return false
end
local t=l()
if t=="&"then
A(W())
local t=l()
if t=="+"then
local t=f()
return e(x,e(j,t))
else
m(t)
end
local t=f()
return e(x,t)
elseif t==":"then
A(W())
local t=l()
if t=="&"then
k(">")
local t=f()
return e(c,e(x,e(d,w,t)),Q)
elseif t==">"then
local t=f()
return e(c,e(d,w,t),Q)
else
m(t)
end
local t=f()
return e(c,t,Q)
elseif t=="+"then
local t=f()
return e(j,t)
elseif t=="["then
local e=f()
k("]")
return V(e)
elseif t=="_"then
k(":")
local t=f()
return e(c,t,w)
else
m(t)
local e=J()
if e==false then
return false
end
return V(e)
end
end
function X()
local e=K()
if e==false then
return false
end
if p(e)then
return e
end
return v(e)
end
N=Z
b=0
local function e(t,i)
return function()
if u()then
return false
end
local e=l()
if e~=t then
m(e)
return false
end
local e=g()
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
if u()then
return false
end
local e=l()
if e~=t then
m(e)
return false
end
local e=g()
if e==false then
return n()
end
if not a(e)then
return n()
end
local t=s(e)
if not a(t)then
return n()
end
local i=s(t)
if not(a(i)and r(s(i)))then
return n()
end
return h(o(e),o(t),o(i))
end
end
Y=e("$",function(e,t)
local e=ce(e)
if e==false then
return n()
end
return O(e,t)
end)
U=e("%",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return n()end)
return T(t,e)
end)
L=h("@",function(a,o,e)
local t=fe(e,function(e)return e end,function(e,e)return n()end)
local e=ce(a)
if e==false then
return n()
end
return Ge(e,o,t)
end)
M=e("^",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return n()end)
return B(t,e)
end)
F=e(";",function(t,e)return de(t,e)end)
return R()
end
t.complex_parse=ae
local function g(y)
local function i(h,u)
if p(h)then
return ie(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(h)
if e~=false and#e==3 and l(e[0+1],c)then
local n=D(e[1+1])
if n~=false and#n==3 and l(n[0+1],d)then
local h=n[1+1]
local r=D(h)
if r~=false and#r==1 and l(n[2+1],w)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(s(h),w)and l(n[2+1],w)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,w)and l(e[2+1],Q)then
return t(":>"..tostring(i(n[2+1],true)))
end
end
local a=D(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],te)then
return t(tostring(i(a[1+1],true)).."?")
end
if n~=false and#n==2 and l(e[2+1],Q)and l(n[0+1],x)then
local e=D(n[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],w)and"_"or l(e[2+1],Q)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=D(e[1+1])
if a~=false and#a==2 and l(a[0+1],j)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],te)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ye)then
local e=D(e[1+1])
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
return f(h)
else
return f(v(h))
end
end
local e=ae(f(y))
local n=""
local d=""
if r(e)then
return"()"
elseif a(e)then
n="("
d=""
while a(e)do
n=tostring(n)..tostring(d)..tostring(g(o(e)))
d=" "
e=s(e)
end
if r(e)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(g(e))..")"
end
return n
elseif m(e)then
local a=z(e)
local t=E(e)
local e=D(t)
if e~=false and#e==2 and l(a,we)and l(e[0+1],j)then
return i(e[1+1],false)
end
return"#"..tostring(g(h(a,t)))
elseif b(e)then
return"!"..tostring(g(h(M(e),U(e))))
elseif p(e)then
return ie(e)
elseif N(e)then
return";("..tostring(g(_e(e))).." "..tostring(g(X(e)))..")"
elseif P(e)then
return"$("..tostring(g(I(Z(e)))).." "..tostring(g(ee(e)))..")"
elseif V(e)then
return"%("..tostring(g(le(e))).." "..tostring(g(q(ue(e))))..")"
elseif Y(e)then
return"@("..tostring(g(I(je(e)))).." "..tostring(g(xe(e))).." "..tostring(g(q(ve(e))))..")"
elseif W(e)then
return"^("..tostring(g(be(e))).." "..tostring(g(q(pe(e))))..")"
end
return k()
end
t.complex_print=g
local function f(n)
local s=G()
local a={function(e)return C(s,e)end}
local e=0
local function o()
error("MT parse ERROR")
end
local function d(e)
if not e then
return o()
end
end
local function r()
d(#n>e)
local t=string.sub(n,e+1,e+1)
e=e+1
return t
end
while#a~=0 do
local t={}
for e=1,#a do
local i=a[e]
local e=r()
local a
a=function(o)
local e=G()
local a=G()
__TS__ArrayPush(t,function(t)return C(e,t)end)
__TS__ArrayPush(t,function(e)return C(a,e)end)
i(o(e,a))
end
if e=="^"then
local e=""
while true do
local t=r()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if st(e)then
i(ot(e))
else
return o()
end
elseif e=="."then
a(h)
elseif e=="#"then
a(_)
elseif e=="!"then
a(S)
elseif e=="$"then
local a=G()
local e=false
__TS__ArrayPush(t,function(t)
e=ce(t)
end)
__TS__ArrayPush(t,function(t)
if e==false then
return o()
else
return C(a,O(e,t))
end
end)
i(a)
elseif e=="_"then
i(y)
else
return o()
end
end
a=t
end
d(e==#n)
return s
end
local function l(e)
local n={e}
local i=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=R(e)
local t
t=function(e,t,a,o)
i=tostring(i)..tostring(t)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,o(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(he(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,s)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",z,E)
elseif b(e)then
t(e,"!",M,U)
elseif ge(e)then
local e=ze(e)
t(e,"$",(function(e)return I(Z(e))end),ee)
else
return k()
end
end
n=h
end
return i
end
t.machinetext_parse=f
t.machinetext_print=l
local function b(e)
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
local function g(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=b
t.trampoline_delay=l
t.run_trampoline=g
local k=v(h(ye,h(h(et,h(h(c,h(Ze,h(w,y))),y)),y)))
local v=v(h(ye,h(h(et,h(se,y)),y)))
local function j(a,t)
return _(v,e(a,t))
end
local function q(e)
return _(k,e)
end
local function p(w,y,c,f,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
c=n(c)
if m(c)then
local m=z(c)
local t=E(c)
if u(m,k)then
t=n(t)
if a(t)then
local o=o(t)
local e=n(s(t))
if r(e)then
if h==false then
local t=o
local a=f
local e
e=function()return w(t,a)end
return l(e)
else
local a
a=w
local t
t=y
local i=o
local o=f
local e
e=function()return p(a,t,B(h,i),o)end
return l(e)
end
end
end
elseif u(m,v)then
t=n(t)
if a(t)then
local u=o(t)
local t=n(s(t))
if a(t)then
local a=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local e
e=w
local t
t=y
local n=u
local o=a
local i=f
local a
a=function()return p(e,t,n,i,o)end
return l(a)
else
local t
t=w
local o
o=y
local s=u
local n=a
local r=f
local h=h
local a=i("序甲")
local i
i=function()return p(t,o,s,r,_(d,e(e(a),b(e(ne(n),a),ne(h)))))end
return l(i)
end
end
end
end
end
end
if h==false then
return l(function()return y(c,f,w)end)
else
return l(function()return y(c,f,function(t,e)return l(function()return p(w,y,B(h,{t}),e)end)end)end)
end
end
local function i(e,o,t,a)
return p(e,o,t,a)
end
local function e(a,i,o,e)
return g(p((function(e,t)return b(a(e,t))end),(function(e,a,t)return b(i(e,a,function(a,e)return g(t(a,e))end))end),o,e))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=k
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=i
t.run_monad_stackoverflow=e
return t