function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,H,v,me,se,Y,L,je,V,ae,be,Qe,Ae,Oe,ze,Te,C,ye,fe,y,ue,de,h,a,o,n,p,r,_,m,z,T,N,g,U,M,J,s,O,P,te,ee,Ge,F,Ee,_e,qe,E,W,he,ce,B,K,ke,xe,D,X,u,A,G,Je,j,d,x,Ue,Ze,Ce,Fe,Me,Le,De,Ie,Ne,Se,He,Ke,Re,Z,ge,re,oe,We,Pe,ie,ne,et,ot,R,q,e,S,pe,l,i,b,Ye,we,ve,Ve,st,I,Be,ht,f,le,rt,nt,it,Q,tt,c,w,Xe,at
function k()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return k()
end
end
function Te(t,e)
return{
Oe,
t,
e,
}
end
function C(e)
return e[0+1]==Oe
end
function ye(e)
return e[2+1]
end
function fe(e)
while C(e)do
e=ye(e)
end
return e
end
function y(e)
return e[0+1]==me
end
function ue(e)
return e[1+1]
end
function de(e)
return v()[ue(e)]
end
function h(t,e)
return{
se,
t,
e,
}
end
function a(e)
return e[0+1]==se
end
function o(e)
return e[1+1]
end
function n(e)
return e[2+1]
end
function r(e)
return e[0+1]==Y
end
function _(t,e)
return{
L,
t,
e,
}
end
function m(e)
return e[0+1]==L
end
function z(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function N(e,t)
return{
je,
e,
t,
}
end
function g(e)
return e[0+1]==je
end
function U(e)
return e[1+1]
end
function M(e)
return e[2+1]
end
function J(e)
return e[0+1]==V
end
function s(e)
return e[1+1]
end
function O(e,t)
return{
ae,
e,
t,
}
end
function P(e)
return e[0+1]==ae
end
function te(e)
return e[1+1]
end
function ee(e)
return e[2+1]
end
function Ge(a,t,e)
return{
Qe,
a,
t,
e,
}
end
function F(e)
return e[0+1]==Qe
end
function Ee(e)
return e[1+1]
end
function _e(e)
return e[2+1]
end
function qe(e)
return e[3+1]
end
function E(e,t)
return{
be,
e,
t,
}
end
function W(e)
return e[0+1]==be
end
function he(e)
return e[1+1]
end
function ce(e)
return e[2+1]
end
function B(e,t)
return{
Ae,
e,
t,
}
end
function K(e)
return e[0+1]==Ae
end
function ke(e)
return e[1+1]
end
function xe(e)
return e[2+1]
end
function D(e)
local e=i(e)
local function t(e)
e[1+1]=D(e[1+1])
e[2+1]=D(e[2+1])
return e
end
if m(e)then
return t(e)
elseif g(e)then
return t(e)
elseif a(e)then
return t(e)
elseif C(e)then
return t(e)
end
return e
end
function X()
return{ze}
end
function u(e)
return e[0+1]==ze
end
function A(e,t)
if e==t then
return
end
e[0+1]=V
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function G(e,a)
H(u(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function Je(t)
local e=X()
G(e,t)
return e
end
function R(e,t)
if e==t then
return true
end
if ue(e)==ue(t)then
A(e,t)
return true
else
return false
end
end
function q(a)
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
return q(e)
end
function S(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
__TS__ArrayPush(t,e)
e=s(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function pe(e)
return P(e)or F(e)or W(e)or K(e)
end
function l(e)
return J(e)or pe(e)
end
function i(o,n,t,a)
if n==nil then
n={}
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
local e,h,s
function h(t)
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
h(t)
if l(t)then
__TS__ArrayPush(a,e)
return i(t,n,{
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
return s(Ze)
end
local function d()
local e={}
for t in pairs(r)do
e[t]=true
end
for t in pairs(n)do
e[t]=true
end
return e
end
do
local t=0
while l(e)and t<32 do
__TS__ArrayPush(a,e)
e=b(e)
t=t+1
end
end
while l(e)do
local h=w(e)
if n[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if P(e)then
return o()
elseif W(e)then
local a=he(e)
local e=ce(e)
local n={
Ce,
Fe,
Me,
Le,
De,
Ie,
Ne,
Se,
He,
Ke,
Re,
}
local h=false
for e=1,#n do
local e=n[e]
if c(e,a)then
h=true
break
end
end
if h then
H(#e==1)
H(t[1+1]==false)
local e=i(e[0+1],d(),t)
if t[1+1]then
return s(E(a,{e}))
else
return k()
end
end
if c(a,Z)then
return o()
elseif c(a,ge)then
return o()
elseif c(a,re)then
return o()
elseif c(a,oe)then
H(#e==3)
H(t[1+1]==false)
local a=i(e[0+1],d(),t)
if t[1+1]then
return s(E(oe,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif F(e)then
return o()
elseif K(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=b(e)
end
return h(e)
end
function b(a)
local e=S(a)
local t
H(not J(e))
if P(e)then
t=ht(te(e),ee(e),a)
elseif F(e)then
t=it(Ee(e),_e(e),qe(e),a)
elseif W(e)then
t=nt(he(e),ce(e),a)
elseif K(e)then
t=rt(ke(e),xe(e),a)
else
t=e
end
t=S(t)
A(e,t)
return t
end
function Ye(e)
while l(e)or C(e)do
e=i(fe(e))
end
return e
end
function ve(a,o,i)
local t={}
do
local e=0
while e<#a do
if c(a[(e+0)+1],o)then
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
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function st(t,a)
do
local e=0
while e<#t do
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function I(a)
local o=p
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Ue,e(o))
end
function Be(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ht(h,t,d)
local s=b(t)
if l(s)then
return d
end
local t=N(j,e(ie,e(re,e(I(h),s))))
if a(s)then
local e={}
local s=s
while not r(s)do
if l(s)then
return d
elseif a(s)then
__TS__ArrayPush(e,o(s))
s=b(n(s))
else
return t
end
end
if c(e[0+1],ne)then
if#e==1 then
return t
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
elseif c(e[0+1],et)then
if#e==1 then
return t
end
local i=i(O(h,e[1+1]))
if not m(i)then
return t
end
local s=b(z(i))
if l(s)then
return d
end
if not y(s)then
return t
end
if not R(s,x)then
return t
end
local i=b(T(i))
if l(i)then
return d
end
if not a(i)then
return t
end
local o=o(i)
local a=b(n(i))
if l(a)then
return d
end
if not r(a)then
return t
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
elseif c(e[0+1],ie)then
if#e==1 then
return t
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
return E(o,a)
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
elseif r(s)then
return s
elseif f(s)then
return Ve(h,s,t)
elseif g(s)then
return t
end
return k()
end
function f(e)
return y(e)or m(e)
end
function rt(t,s,c)
local function u()
return N(j,e(ie,e(ge,e(t,q(s)))))
end
t=b(t)
if l(t)then
return c
end
if not m(t)then
return u()
end
local e=i(z(t))
if not(y(e)and R(e,d))then
return u()
end
local t=i(T(t))
if not a(t)then
return u()
end
local e=D(o(t))
local t=i(n(t))
if not(a(t)and r(i(n(t))))then
return u()
end
local d=o(t)
local i=we
local t=0
while not r(e)do
if f(e)then
local a=p
do
local e=#s-1
while e>=t do
a=h(s[e+1],a)
e=e-1
end
end
i=ve(i,e,a)
t=#s
e=p
elseif a(e)then
if t<#s then
local a=s[t+1]
t=t+1
i=ve(i,o(e),a)
e=n(e)
else
return u()
end
else
return u()
end
end
if#s~=t then
return u()
end
return O(i,d)
end
function nt(o,t,a)
local a=N(j,e(ie,e(o,q(t))))
do
local e=0
while e<#le do
if c(o,le[e+1][0+1])then
local o=le[e+1][1+1]
if#t~=o then
return a
end
local e=le[e+1][2+1]
if o==1 then
return e(t[0+1],a)
elseif o==2 then
return e(t[0+1],t[1+1],a)
elseif o==3 then
return e(t[0+1],t[1+1],t[2+1],a)
end
return k()
end
e=e+1
end
end
return a
end
function it(o,a,t,i)
local e=N(j,e(ne,e(I(o),a,q(t))))
if c(a,We)then
if#t~=1 then
return e
end
return t[0+1]
elseif c(a,Pe)then
if#t~=2 then
return e
end
return tt(o,t[0+1],t[1+1],e)
elseif c(a,ot)then
if#t~=2 then
return e
end
return Te(t[0+1],O(o,t[1+1]))
end
return e
end
function Q(t)
return e(ne,We,t)
end
function tt(l,i,u,t)
if t==nil then
t=false
end
local function w()
if t==false then
return N(j,e(ne,e(I(l),Pe,q({
i,
u,
}))))
else
return t
end
end
i=D(i)
local s={}
local m=false
local t=i
while not r(t)do
if f(t)then
__TS__ArrayPush(s,t)
m=true
t=p
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=n(t)
else
return w()
end
end
local o=i
if m then
o=q(s)
end
local t={}
Be(l,function(a,e)
do
local e=0
while e<#s do
if c(s[e+1],a)then
return
end
e=e+1
end
end
__TS__ArrayPush(t,a)
end)
local a=o
do
local e=#t-1
while e>=0 do
a=h(t[e+1],a)
e=e-1
end
end
local o=o
do
local e=#t-1
while e>=0 do
o=h(Q(st(l,t[e+1])),o)
e=e-1
end
end
return _(d,e(i,h(Q(_(d,e(a,u))),o)))
end
function c(e,t)
if e==t then
return true
end
e=i(e)
t=i(t)
if e==t then
return true
end
local function i(t,e,o,a)
if c(o(t),o(e))and c(a(t),a(e))then
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
A(e,p)
A(t,p)
return true
elseif y(e)then
if not y(t)then
return false
end
return R(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,M)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,z,T)
end
return k()
end
function w(e)
e=S(e)
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
e=S(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(z(e),T(e))))
elseif g(e)then
return"!"..tostring(w(h(U(e),M(e))))
elseif y(e)then
return de(e)
elseif P(e)then
return"$("..tostring(w(I(te(e)))).." "..tostring(w(ee(e)))..")"
elseif W(e)then
return"%("..tostring(w(he(e))).." "..tostring(w(q(ce(e))))..")"
elseif F(e)then
return"@("..tostring(w(I(Ee(e)))).." "..tostring(w(_e(e))).." "..tostring(w(q(qe(e))))..")"
elseif K(e)then
return"^("..tostring(w(ke(e))).." "..tostring(w(q(xe(e))))..")"
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
function at()
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
local u
u=function()
local e=Xe()
u=function()return e end
return e
end
v=function()
local e=at()
v=function()return e end
return e
end
me=0
se=1
Y=2
L=3
je=4
V=5
ae=6
be=7
Qe=8
Ae=9
Oe=11
ze=10
local function s(e)
return e[1+1]
end
t.new_comment=Te
t.comment_p=C
t.comment_comment=s
t.comment_x=ye
t.un_comment_all=fe
local function yt(e)
return v()[e]~=nil
end
local function it(e)
return{
me,
e,
}
end
local function nt(e)
return u()[e]~=nil
end
local function s(e)
return it(u()[e])
end
t.can_new_symbol_p=nt
t.New_Symbol=New_Symbol
t.new_symbol=s
t.symbol_p=y
t.un_symbol=de
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=n
p={Y}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=m
t.data_name=z
t.data_list=T
t.New_Error=New_Error
t.new_error=N
t.error_p=g
t.error_name=U
t.error_list=M
t.just_p=J
t.evaluate=O
t.apply=B
local function u(e)
local o=Ye(e)
local function i(e)
e[1+1]=D(e[1+1])
e[2+1]=D(e[2+1])
if C(e[1+1])or C(e[2+1])then
local t=Je(e)
local a=e[1+1]
local e=e[2+1]
local a=u(a)
local e=u(e)
t[1+1]=a
t[2+1]=e
return t
else
return e
end
end
if m(o)then
return i(o)
elseif g(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=D
t.force_uncomment_all_rec=u
j=s("太始初核")
local ze=s("符名")
d=s("化滅")
x=s("式形")
local ht=s("等同")
local rt=s("解算")
local V=s("特定其物")
local f=s("省略一物")
Ue=s("映表")
local st=s("如若")
local u=s("一類何物")
local ae=s("是非")
local je=s("其子")
local tt=s("爻陽")
local Qe=s("爻陰")
local dt=s("引用")
local ct=s("應用")
local mt=s("間空")
local se=s("連頸")
local be=s("構物")
local me=s("謬誤")
local ut=s("詞素")
local Ae=s("列序")
local ft=s("首始")
local wt=s("尾末")
local Je=s("之物")
local v=s("宇宙亡矣")
local Xe=s("效應")
local at=s("註疏")
Ze=N(j,e(v,f))
local function v(e)
return _(ze,h(j,h(e,p)))
end
local function Oe(t)
return v(e(u,e(d,f,t),V))
end
local function L(t,a)
return v(e(u,e(d,e(t),f),a))
end
local function Y(t)
return v(e(u,d,e(ae,e(u,t,f))))
end
local lt=Oe(be)
Ce=L(be,ze)
Fe=L(be,Ae)
Me=Y(be)
local Ze=Oe(me)
Le=L(me,ze)
De=L(me,Ae)
Ie=Y(me)
local Oe=Oe(se)
Ne=Y(se)
Se=L(se,ft)
He=L(se,wt)
Ke=Y(ut)
Re=Y(mt)
Z=v(e(u,d,e(ae,ht)))
ge=v(e(u,e(d,h(d,f),f),ct))
re=v(e(u,d,rt))
local Ae=L(Ae,e(u,Je,f))
oe=v(e(u,d,st))
We=v(e(u,x,dt))
Pe=v(e(u,e(x,e(d,f,d)),V))
ie=v(e(x,e(j,d)))
ne=v(e(x,e(j,x)))
et=v(e(x,x))
local We=v(e(u,d,at))
ot=v(e(u,x,at))
local Y=_(Qe,e())
local ne=_(tt,e())
local function me(e,i,s)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(e)
end
if r(e)then
return i(t)
end
return s(t,e)
end
local function L(e)
return me(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=q
t.maybe_list_to_jsArray=L
t.new_list=e
local function be(e)
while J(e)or C(e)do
e=S(fe(e))
end
return e
end
t.un_just=S
t.un_just_comment_all=be
t.delay_p=pe
t.delay_just_p=l
local function be(e)
if P(e)then
return e
elseif F(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return k()
end
local function fe(e)
return te(be(e))
end
local function J(e)
return ee(be(e))
end
t.delay_env=fe
t.delay_x=J
local function J(e)
return i(e)
end
local function fe(e)
if C(e)then
return ye(e)
else
return b(e)
end
end
t.force_all=J
t.force1=b
t.force_uncomment1=fe
t.force_uncomment_all=Ye
we={}
local function fe(s)
s=i(s)
if not m(s)then
return false
end
local e=i(z(s))
if not y(e)then
return false
end
if not R(e,Ue)then
return false
end
e=i(T(s))
if not a(e)then
return false
end
if not r(i(n(e)))then
return false
end
local s={}
local h=i(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=i(o(h))
h=i(n(h))
if not a(e)then
return false
end
local t=o(e)
e=i(n(e))
if not a(e)then
return false
end
local a=o(e)
if not r(i(n(e)))then
return false
end
local o=true
do
local e=0
while e<#s do
if c(s[(e+0)+1],t)then
s[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
__TS__ArrayPush(s,t)
__TS__ArrayPush(s,a)
end
end
return s
end
t.env_null_v=we
t.env_set=ve
t.env_get=Ve
t.env2val=I
t.env_foreach=Be
t.val2env=fe
local function J(t,a)
return{
t,
1,
function(e,o)
e=b(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return ne
end
return Y
end,
}
end
local function C(t,o,i)
return{
t,
1,
function(e,a)
e=b(e)
if l(e)then
return E(t,{e})
end
if o(e)then
return i(e)
end
return a
end,
}
end
le={
J(Me,m),
{
lt,
2,
_,
},
C(Ce,m,z),
C(Fe,m,T),
J(Ie,g),
{
Ze,
2,
N,
},
C(Le,g,U),
C(De,g,M),
J(Re,r),
{
Oe,
2,
h,
},
J(Ne,a),
C(Se,a,o),
C(He,a,n),
{
Z,
2,
function(e,t,i)
if e==t then
return ne
end
e=b(e)
t=b(t)
if l(e)or l(t)then
return E(Z,{
e,
t,
})
end
if e==t then
return ne
end
local function i(a,t,e)
return E(oe,{
a,
t,
e,
})
end
local function s(t,e)
return i(t,e,Y)
end
H(not l(e))
local function i(o,e,t,a)
return s(E(Z,{
t(o),
t(e),
}),E(Z,{
a(o),
a(e),
}))
end
if r(e)then
if not r(e)then
return Y
end
return ne
elseif y(e)then
if not y(t)then
return Y
end
if R(e,t)then
return ne
else
return Y
end
elseif m(e)then
if not m(t)then
return Y
end
return i(e,t,z,T)
elseif a(e)then
if not a(t)then
return Y
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return Y
end
return i(e,t,U,M)
end
return k()
end,
},
{
ge,
2,
function(s,e,h)
local t={}
local e=i(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=i(n(e))
end
if not r(e)then
return h
end
return B(s,t)
end,
},
{
re,
2,
function(e,a,t)
local e=fe(e)
if e==false then
return t
end
return O(e,a)
end,
},
J(Ke,y),
{
Ae,
1,
function(e,t)
e=b(e)
if l(e)then
return E(Ae,{e})
end
if not a(e)then
return t
end
return o(e)
end,
},
{
oe,
3,
function(e,a,o,t)
e=b(e)
if l(e)then
return E(oe,{
e,
a,
o,
})
end
if not m(e)then
return t
end
local e=i(z(e))
if not y(e)then
return t
end
if R(e,tt)then
return a
end
if R(e,Qe)then
return o
end
return t
end,
},
{
We,
2,
Te,
},
}
t.equal_p=c
local function l(e,t)
if e==t then
return true
end
e=S(e)
t=S(t)
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
A(e,p)
A(t,p)
return true
elseif y(e)then
if not y(t)then
return false
end
return R(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,M)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,z,T)
elseif P(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif F(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return k()
end
local function b(e)
return w(D(e))
end
t.simple_print=w
t.simple_print_force_all_rec=b
local function J(J)
local C,b,c,l,m,i,A,T,K,g,F,M,U,R,S,I,D,W,z,L,k,w,P,Y,Q
function c()
return#C==b
end
function l()
H(not c())
local e=string.sub(C,b+1,b+1)
b=b+1
return e
end
function m(e)
H(string.sub(C,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function i(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=l()
if not A(e)then
m(e)
return false
end
while A(e)and not c()do
e=l()
end
if not A(e)then
m(e)
end
return true
end
function K()
if c()then
return false
end
local e=l()
local t=""
if not D(e)then
m(e)
return false
end
while D(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if D(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if nt(t)then
return s(t)
else
return i("Not Symbol"..tostring(t))
end
end
function g()
if c()then
return false
end
local e=l()
if e~="("then
m(e)
return false
end
local t=X()
local a=t
local function o(a)
local e=X()
G(t,h(a,e))
t=e
end
while true do
T()
if c()then
return i()
end
e=l()
if e==")"then
G(t,p)
return a
end
if e=="."then
T()
local o=W()
G(t,o)
T()
if c()then
return i()
end
e=l()
if e~=")"then
return i()
end
return a
end
m(e)
local e=W()
o(e)
end
end
function F()
if c()then
return false
end
local e=l()
if e~="#"then
m(e)
return false
end
local e=g()
if e==false then
return i()
end
if not a(e)then
return i()
end
return _(o(e),n(e))
end
function M()
if c()then
return false
end
local e=l()
if e~="!"then
m(e)
return false
end
local e=g()
if e==false then
return i()
end
if not a(e)then
return i()
end
return N(o(e),n(e))
end
function D(e)
if A(e)then
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
}
for a=1,#t do
local t=t[a]
if t==e then
return false
end
end
return true
end
function W()
T()
local e={
g,
Q,
F,
M,
U,
R,
S,
I,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return i()
end
function z(e)
if e==false then
return i()
end
return e
end
function L()
return not c()
end
function k(e)
z(L())
z(l()==e)
end
function w(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=w()
k("]")
return e
end
local e
if t then
e={
g,
K,
a,
F,
M,
U,
R,
S,
I,
}
else
e={
g,
Y,
F,
M,
U,
R,
S,
I,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return i()
end
function P(t)
if c()then
return t
end
local a=l()
if a=="."then
local a=w()
return e(u,e(d,e(t),f),a)
elseif a==":"then
local a=w()
return e(u,a,t)
elseif a=="~"then
return e(ae,t)
elseif a=="@"then
local a=w()
return e(u,e(d,h(t,f),f),a)
elseif a=="?"then
return e(u,d,e(ae,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
__TS__ArrayPush(t,e)
if c()then
break
end
local e=l()
if e~="/"then
m(e)
break
end
end
return e(je,q(t))
else
m(a)
return t
end
end
function Y()
if c()then
return false
end
local t=l()
if t=="&"then
z(L())
local t=l()
if t=="+"then
local t=w()
return e(x,e(j,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
z(L())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(x,e(d,f,t)),V)
elseif t==">"then
local t=w()
return e(u,e(d,f,t),V)
else
m(t)
end
local t=w()
return e(u,t,V)
elseif t=="+"then
local t=w()
return e(j,t)
elseif t=="["then
local e=w()
k("]")
return P(e)
elseif t=="_"then
k(":")
local t=w()
return e(u,t,f)
else
m(t)
local e=K()
if e==false then
return false
end
return P(e)
end
end
function Q()
local e=Y()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
C=J
b=0
local function s(t,s)
return function()
if c()then
return false
end
local e=l()
if e~=t then
m(e)
return false
end
local e=g()
if e==false then
return i()
end
if not a(e)then
return i()
end
local t=n(e)
if not(a(t)and r(n(t)))then
return i()
end
return s(o(e),o(t))
end
end
local function h(t,h)
return function()
if c()then
return false
end
local e=l()
if e~=t then
m(e)
return false
end
local e=g()
if e==false then
return i()
end
if not a(e)then
return i()
end
local t=n(e)
if not a(t)then
return i()
end
local s=n(t)
if not(a(s)and r(n(s)))then
return i()
end
return h(o(e),o(t),o(s))
end
end
U=s("$",function(e,t)
local e=fe(e)
if e==false then
return i()
end
return O(e,t)
end)
R=s("%",function(t,e)
local e=me(e,function(e)return e end,function(e,e)return i()end)
return E(t,e)
end)
S=h("@",function(o,t,e)
local a=me(e,function(e)return e end,function(e,e)return i()end)
local e=fe(o)
if e==false then
return i()
end
return Ge(e,t,a)
end)
I=s("^",function(t,e)
local e=me(e,function(e)return e end,function(e,e)return i()end)
return B(t,e)
end)
return W()
end
t.complex_parse=J
local function b(p)
local function i(r,c)
if y(r)then
return de(r)
end
local function t(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(r)
if e~=false and#e==3 and l(e[0+1],u)then
local s=L(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=L(h)
if r~=false and#r==1 and l(s[2+1],f)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(n(h),f)and l(s[2+1],f)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,f)and l(e[2+1],V)then
return t(":>"..tostring(i(s[2+1],true)))
end
end
local a=L(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ae)then
return t(tostring(i(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],V)and l(s[0+1],x)then
local e=L(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],f)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],f)and"_"or l(e[2+1],V)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=L(e[1+1])
if a~=false and#a==2 and l(a[0+1],j)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ae)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],je)then
local e=L(e[1+1])
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
if c then
return w(r)
else
return w(v(r))
end
end
local e=J(w(p))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(b(o(e)))
d=" "
e=n(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(b(e))..")"
end
return s
elseif m(e)then
local t=z(e)
local a=T(e)
local e=L(a)
if e~=false and#e==2 and l(t,ze)and l(e[0+1],j)then
return i(e[1+1],false)
end
return"#"..tostring(b(h(t,a)))
elseif g(e)then
return"!"..tostring(b(h(U(e),M(e))))
elseif y(e)then
return de(e)
elseif P(e)then
return"$("..tostring(b(I(te(e)))).." "..tostring(b(ee(e)))..")"
elseif W(e)then
return"%("..tostring(b(he(e))).." "..tostring(b(q(ce(e))))..")"
elseif F(e)then
return"@("..tostring(b(I(Ee(e)))).." "..tostring(b(_e(e))).." "..tostring(b(q(qe(e))))..")"
elseif K(e)then
return"^("..tostring(b(ke(e))).." "..tostring(b(q(xe(e))))..")"
end
return k()
end
t.complex_print=b
local function w(s)
local r=X()
local o={r}
local a=0
local function n()
error("MT parse ERROR")
end
local function l(e)
if not e then
return n()
end
end
local function d()
l(#s>a)
local e=string.sub(s,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=d()
local a
a=function(a)
local e=X()
local t=X()
__TS__ArrayPush(i,e)
__TS__ArrayPush(i,t)
G(o,a(e,t))
end
if t=="^"then
local e=""
while true do
local t=d()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if yt(e)then
G(o,it(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(_)
elseif t=="!"then
a(N)
elseif t=="$"then
a(function(t,a)return O(we,e(ie,re,Q(t),Q(a)))end)
elseif t=="_"then
G(o,p)
else
return n()
end
end
o=i
end
l(a==#s)
return r
end
local function l(e)
local s={e}
local i=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=S(e)
local t
t=function(e,o,a,t)
i=tostring(i)..tostring(o)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,t(e))
end
if y(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ue(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",z,T)
elseif g(e)then
t(e,"!",U,M)
elseif pe(e)then
local e=be(e)
t(e,"$",(function(e)return I(te(e))end),ee)
else
return k()
end
end
s=h
end
return i
end
t.machinetext_parse=w
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
local function k(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=g
t.trampoline_delay=l
t.run_trampoline=k
local b=v(h(je,h(h(Xe,h(h(u,h(Je,h(f,p))),p)),p)))
local v=v(h(je,h(h(Xe,h(se,p)),p)))
local function q(t,a)
return _(v,e(t,a))
end
local function j(e)
return _(b,e)
end
local function w(f,p,u,y,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
u=i(u)
if m(u)then
local m=z(u)
local t=T(u)
if c(m,b)then
t=i(t)
if a(t)then
local e=o(t)
local t=i(n(t))
if r(t)then
if h==false then
local a=e
local t=y
local e
e=function()return f(a,t)end
return l(e)
else
local t
t=f
local a
a=p
local i=e
local o=y
local e
e=function()return w(t,a,B(h,i),o)end
return l(e)
end
end
end
elseif c(m,v)then
t=i(t)
if a(t)then
local u=o(t)
local t=i(n(t))
if a(t)then
local a=o(t)
local t=i(n(t))
if r(t)then
if h==false then
local e
e=f
local t
t=p
local n=u
local i=a
local o=y
local a
a=function()return w(e,t,n,o,i)end
return l(a)
else
local i
i=f
local t
t=p
local c=u
local u=a
local r=y
local n=h
local a=s("序甲")
local o
o=function()return w(i,t,c,r,_(d,e(e(a),g(e(Q(u),a),Q(n)))))end
return l(o)
end
end
end
end
end
end
if h==false then
return l(function()return p(u,y,f)end)
else
return l(function()return p(u,y,function(e,t)return l(function()return w(f,p,B(h,{e}),t)end)end)end)
end
end
local function a(t,e,a,o)
return w(t,e,a,o)
end
local function s(a,i,n,o)
return k(w((function(t,e)return g(a(t,e))end),(function(e,a,t)return g(i(e,a,function(e,a)return k(t(e,a))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=a
t.run_monad_stackoverflow=s
return t