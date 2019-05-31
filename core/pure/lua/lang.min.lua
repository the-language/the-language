local function t(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local q,I,D,Ae,Te,M,X,Oe,Ge,Be,ie,se,fe,ke,ce,he,A,de,J,be,g,c,le,s,a,i,n,b,r,E,w,T,O,S,j,L,F,K,mt,N,Q,ee,ae,De,B,we,pe,ye,k,P,re,ne,U,G,qe,Ee,Y,V,o,l,W,Ze,z,d,x,Qe,Xe,We,Ce,Me,Ye,Fe,Re,He,Ie,Ne,Se,Le,te,ze,_e,oe,Ue,lt,Z,xe,rt,dt,C,_,e,R,je,y,ue,f,v,h,Pe,Ke,ge,Je,ct,H,Ve,ut,ht,p,st,ot,at,et,me,tt,u,m,ve,it,nt
function q()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return q()
end
end
function he(e,t)
return{
ke,
e,
t,
}
end
function A(e)
return e[1]==ke
end
function de(e)
return e[2]
end
function J(e)
return e[3]
end
function be(e)
while A(e)do
e=J(e)
end
return e
end
function g(e)
return e[1]==Ae
end
function c(e)
return e[2]
end
function le(e)
return D()[c(e)]
end
function s(t,e)
return{
Te,
t,
e,
}
end
function a(e)
return e[1]==Te
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==M
end
function E(e,t)
return{
X,
e,
t,
}
end
function w(e)
return e[1]==X
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function S(t,e)
return{
Oe,
t,
e,
}
end
function j(e)
return e[1]==Oe
end
function L(e)
return e[2]
end
function F(e)
return e[3]
end
function K(e)
return e[1]==Ge
end
function mt(e)
return e[2]
end
function N(e,t)
return{
Be,
e,
t,
}
end
function Q(e)
return e[1]==Be
end
function ee(e)
return e[2]
end
function ae(e)
return e[3]
end
function De(a,t,e)
return{
se,
a,
t,
e,
}
end
function B(e)
return e[1]==se
end
function we(e)
return e[2]
end
function pe(e)
return e[3]
end
function ye(e)
return e[4]
end
function k(t,e)
return{
ie,
t,
e,
}
end
function P(e)
return e[1]==ie
end
function re(e)
return e[2]
end
function ne(e)
return e[3]
end
function U(t,e)
return{
fe,
t,
e,
}
end
function G(e)
return e[1]==fe
end
function qe(e)
return e[2]
end
function Ee(e)
return e[3]
end
function Y(e)
local e=h(e)
local function t(e)
e[2]=Y(e[2])
e[3]=Y(e[3])
return e
end
if w(e)then
return t(e)
elseif j(e)then
return t(e)
elseif a(e)then
return t(e)
elseif A(e)then
return t(e)
end
return e
end
function V()
return{ce}
end
function o(e)
return e[1]==ce
end
function l(e,t)
if e==t then
return
end
e[1]=Ge
e[2]=t
e[3]=false
e[4]=false
end
function W(e,t)
I(o(e))
I(not o(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function Ze(t)
local e=V()
W(e,t)
return e
end
function C(e,t)
if e==t then
return true
end
if c(e)==c(t)then
l(e,t)
return true
else
return false
end
end
function _(a)
local t=b
do
local e=#a-1
while e>=0 do
t=s(a[e+1],t)
e=e-1
end
end
return t
end
function e(...)
local e=({...})
return _(e)
end
function R(e)
if not K(e)then
return e
end
local e=e
local a={}
while K(e)do
t(a,e)
e=mt(e)
end
for a,t in ipairs(a)do
l(t,e)
end
return e
end
function je(e)
return Q(e)or B(e)or P(e)or G(e)
end
function y(e)
return K(e)or je(e)
end
function ue(e)
if Q(e)then
return e
elseif B(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return q()
end
function f(i,n,a,o)
if n==nil then
n={}
end
if a==nil then
a={
false,
false,
}
end
if o==nil then
o={}
end
local e,d,s
function d(t)
l(e,t)
do
local e=0
while e<#o do
l(o[e+1],t)
e=e+1
end
end
return t
end
function s(a)
d(a)
if y(a)then
t(o,e)
return f(a,n,{
false,
false,
},o)
end
return a
end
local h={}
e=i
local function i()
a[2]=true
return s(Xe)
end
local function l()
local e={}
for t in pairs(h)do
e[t]=true
end
for t in pairs(n)do
e[t]=true
end
return e
end
do
local a=0
while y(e)and a<32 do
t(o,e)
e=v(e)
a=a+1
end
end
while y(e)do
local r=m(e)
if n[r]==true then
return i()
end
if h[r]==true then
a[1]=true
if Q(e)then
return i()
elseif P(e)then
local t=re(e)
local e=ne(e)
local n={
We,
Ce,
Me,
Ye,
Fe,
Re,
He,
Ie,
Ne,
Se,
Le,
}
local o=false
for a,e in ipairs(n)do
if u(e,t)then
o=true
break
end
end
if o then
I(#e==1)
I(a[2]==false)
local e=f(e[1],l(),a)
if a[2]then
return s(k(t,{e}))
else
return q()
end
end
if u(t,te)then
return i()
elseif u(t,ze)then
return i()
elseif u(t,_e)then
return i()
elseif u(t,oe)then
I(#e==3)
I(a[2]==false)
local t=f(e[1],l(),a)
if a[2]then
return s(k(oe,{
t,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif B(e)then
return i()
elseif G(e)then
return i()
end
return q()
end
h[r]=true
t(o,e)
e=v(e)
end
return d(e)
end
function v(a)
local e=R(a)
local t
I(not K(e))
if Q(e)then
t=ht(ee(e),ae(e),a)
elseif B(e)then
t=et(we(e),pe(e),ye(e),a)
elseif P(e)then
t=at(re(e),ne(e),a)
elseif G(e)then
t=ot(qe(e),Ee(e),a)
else
t=e
end
t=R(t)
l(e,t)
return t
end
function h(e)
return f(e)
end
function Pe(e)
while y(e)or A(e)do
e=h(be(e))
end
return e
end
function ge(a,o,i)
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
function Je(t,o,a)
do
local e=0
while e<#t do
if u(t[(e+0)+1],o)then
return t[(e+1)+1]
end
e=e+2
end
end
return a
end
function ct(t,a)
do
local e=0
while e<#t do
if u(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function H(o)
local a=b
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(Qe,e(a))
end
function Ve(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ut(e,d,u,l)
local s={}
local o={}
local e=R(e)
local h=true
while true do
if r(e)then
return l(o,s)
elseif A(e)then
t(o,de(e))
e=J(e)
elseif a(e)then
t(s,i(e))
e=n(e)
elseif y(e)then
if h then
h=false
e=v(e)
else
return u()
end
else
return d()
end
end
end
function ht(d,o,l)
local s=v(o)
if y(s)then
return l
end
local function o()return S(z,e(Z,e(_e,e(H(d),s))))end
if a(s)then
return ut(s,o,function()return l end,function(s,e)
if#s~=0 then
error("WIP")
end
if u(e[1],xe)then
if#e==1 then
return o()
end
local i=e[2]
local o={}
do
local a=2
while a<#e do
t(o,e[a+1])
a=a+1
end
end
return De(d,i,o)
elseif u(e[1],rt)then
if#e==1 then
return o()
end
local h=h(N(d,e[2]))
if not w(h)then
return o()
end
local s=v(T(h))
if y(s)then
return l
end
if not g(s)then
return o()
end
if not C(s,x)then
return o()
end
local s=v(O(h))
if y(s)then
return l
end
if not a(s)then
return o()
end
local i=i(s)
local a=v(n(s))
if y(a)then
return l
end
if not r(a)then
return o()
end
local o={H(d)}
do
local a=2
while a<#e do
t(o,e[a+1])
a=a+1
end
end
return U(i,o)
elseif u(e[1],Z)then
if#e==1 then
return o()
end
local i=e[2]
local o={}
do
local a=2
while a<#e do
t(o,N(d,e[a+1]))
a=a+1
end
end
return k(i,o)
else
local i=N(d,e[1])
local o={}
do
local a=1
while a<#e do
t(o,N(d,e[a+1]))
a=a+1
end
end
return U(i,o)
end
end)
elseif r(s)then
return s
elseif p(s)then
return Je(d,s,o())
elseif j(s)then
return o()
end
return q()
end
function p(e)
return g(e)or w(e)
end
function ot(l,o,u)
local function t()return S(z,e(Z,e(ze,e(l,_(o)))))end
l=v(l)
if y(l)then
return u
end
if not w(l)then
return t()
end
local e=h(T(l))
if not(g(e)and C(e,d))then
return t()
end
local d=h(O(l))
if not a(d)then
return t()
end
local e=Y(i(d))
local d=h(n(d))
if not(a(d)and r(h(n(d))))then
return t()
end
local l=i(d)
local d=Ke
local h=0
while not r(e)do
if p(e)then
local t=b
do
local e=#o-1
while e>=h do
t=s(o[e+1],t)
e=e-1
end
end
d=ge(d,e,t)
h=#o
e=b
elseif a(e)then
if h<#o then
local t=o[h+1]
h=h+1
d=ge(d,i(e),t)
e=n(e)
else
return t()
end
else
return t()
end
end
if#o~=h then
return t()
end
return N(d,l)
end
function at(i,t,o)
local function a()return S(z,e(Z,e(i,_(t))))end
for n,e in ipairs(st)do
if u(i,e[1])then
if#t~=e[2]then
return a()
end
if e[2]==1 then
return e[3](t[1],a,o)
elseif e[2]==2 then
return e[3](t[1],t[2],a,o)
elseif e[2]==3 then
return e[3](t[1],t[2],t[3],a,o)
end
return q()
end
end
return a()
end
function et(i,o,t,a)
local function a()return S(z,e(xe,e(H(i),o,_(t))))end
if u(o,Ue)then
if#t~=1 then
return a()
end
return t[1]
elseif u(o,lt)then
if#t~=2 then
return a()
end
return tt(i,t[1],t[2],a)
elseif u(o,dt)then
if#t~=2 then
return a()
end
return he(t[1],N(i,t[2]))
end
return a()
end
function me(t)
return e(xe,Ue,t)
end
function tt(c,l,w,f)
l=Y(l)
local h={}
local m=false
local o=l
while not r(o)do
if p(o)then
t(h,o)
m=true
o=b
elseif a(o)then
t(h,i(o))
o=n(o)
else
return f()
end
end
local o
if m then
o=_(h)
else
o=l
end
local a={}
Ve(c,function(o,e)
do
local e=0
while e<#h do
if u(h[e+1],o)then
return
end
e=e+1
end
end
t(a,o)
end)
local t=o
do
local e=#a-1
while e>=0 do
t=s(a[e+1],t)
e=e-1
end
end
local o=o
do
local e=#a-1
while e>=0 do
o=s(me(ct(c,a[e+1])),o)
e=e-1
end
end
return E(d,e(l,s(me(E(d,e(t,w))),o)))
end
function u(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function o(t,e,a,o)
if u(a(t),a(e))and u(o(t),o(e))then
l(t,e)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
l(t,b)
l(e,b)
return true
elseif g(t)then
if not g(e)then
return false
end
return C(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif j(t)then
if not j(e)then
return false
end
return o(t,e,L,F)
elseif w(t)then
if not w(e)then
return false
end
return o(t,e,T,O)
end
return q()
end
function m(e)
e=R(e)
local t=""
local o=""
if r(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(m(i(e)))
o=" "
e=R(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif w(e)then
return"#"..tostring(m(s(T(e),O(e))))
elseif j(e)then
return"!"..tostring(m(s(L(e),F(e))))
elseif g(e)then
return le(e)
elseif A(e)then
return";("..tostring(m(de(e))).." "..tostring(m(J(e)))..")"
elseif Q(e)then
return"$("..tostring(m(H(ee(e)))).." "..tostring(m(ae(e)))..")"
elseif P(e)then
return"%("..tostring(m(re(e))).." "..tostring(m(_(ne(e))))..")"
elseif B(e)then
return"@("..tostring(m(H(we(e)))).." "..tostring(m(pe(e))).." "..tostring(m(_(ye(e))))..")"
elseif G(e)then
return"^("..tostring(m(qe(e))).." "..tostring(m(_(Ee(e))))..")"
end
return q()
end
function ve(e,t,s)
e=R(e)
local function o(e,a,i,o)
t(a)
s(i(e))
return s(o(e))
end
if g(e)then
t("^")
t(c(e))
return t("^")
elseif a(e)then
return o(e,".",i,n)
elseif r(e)then
return t("_")
elseif w(e)then
return o(e,"#",T,O)
elseif j(e)then
return o(e,"!",L,F)
elseif je(e)then
local e=ue(e)
return o(e,"$",(function(e)return H(ee(e))end),ae)
else
return q()
end
end
function it()
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
function nt()
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
local function l()
local e=it()
function l()return e end
return e
end
function D()
local e=nt()
function D()return e end
return e
end
Ae=0
Te=1
M=2
X=3
Oe=4
Ge=5
Be=6
ie=7
se=8
fe=9
ke=11
ce=10
local function nt(e)
return D()[e]~=nil
end
local function Be(e)
return{
Ae,
e,
}
end
local function Ge(e)
return l()[e]~=nil
end
local function o(e)
return Be(l()[e])
end
b={M}
local function Te(e)
local t=Pe(e)
local function o(e)
e[2]=Y(e[2])
e[3]=Y(e[3])
if A(e[2])or A(e[3])then
local t=Ze(e)
local a=e[2]
local o=e[3]
local e=Te(a)
local a=Te(o)
t[2]=e
t[3]=a
return t
else
return e
end
end
if w(t)then
return o(t)
elseif j(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=o("太始初核")
local fe=o("符名")
d=o("化滅")
x=o("式形")
local yt=o("等同")
local pt=o("解算")
local M=o("特定其物")
local f=o("省略一物")
Qe=o("映表")
local wt=o("如若")
local l=o("一類何物")
local X=o("是非")
local ke=o("其子")
local at=o("爻陽")
local ot=o("爻陰")
local mt=o("引用")
local ct=o("應用")
local ht=o("間空")
local ie=o("連頸")
local ce=o("構物")
local se=o("謬誤")
local ut=o("詞素")
local Oe=o("列序")
local it=o("首始")
local ft=o("尾末")
local tt=o("之物")
local c=o("宇宙亡矣")
local Ze=o("效應")
local et=o("註疏")
Xe=S(z,e(c,f))
local function p(e)
return E(fe,s(z,s(e,b)))
end
local function Ae(t)
return p(e(l,e(d,f,t),M))
end
local function c(t,a)
return p(e(l,e(d,e(t),f),a))
end
local function D(t)
return p(e(l,d,e(X,e(l,t,f))))
end
local vt=Ae(ce)
We=c(ce,fe)
Ce=c(ce,Oe)
Me=D(ce)
local gt=Ae(se)
Ye=c(se,fe)
Fe=c(se,Oe)
Re=D(se)
local bt=Ae(ie)
He=D(ie)
Ie=c(ie,it)
Ne=c(ie,ft)
Se=D(ut)
Le=D(ht)
te=p(e(l,d,e(X,yt)))
ze=p(e(l,e(d,s(d,f),f),ct))
_e=p(e(l,d,pt))
local Ae=c(Oe,e(l,tt,f))
oe=p(e(l,d,wt))
Ue=p(e(l,x,mt))
lt=p(e(l,e(x,e(d,f,d)),M))
Z=p(e(x,e(z,d)))
xe=p(e(x,e(z,x)))
rt=p(e(x,x))
local it=p(e(l,d,et))
dt=p(e(l,x,et))
local c=E(ot,e())
local se=E(at,e())
local function xe(e,h,s)
local o={}
while a(e)do
t(o,i(e))
e=n(e)
end
if r(e)then
return h(o)
end
return s(o,e)
end
local function D(e)
return xe(e,function(e)return e end,function(e,e)return false end)
end
local function et(e)
while K(e)or A(e)do
e=R(be(e))
end
return e
end
local function Xe(e)
return ee(ue(e))
end
local function Ue(e)
return ae(ue(e))
end
local function Oe(e)
if A(e)then
return J(e)
else
return v(e)
end
end
Ke={}
local function ce(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not g(e)then
return false
end
if not C(e,Qe)then
return false
end
e=h(O(o))
if not a(e)then
return false
end
if not r(h(n(e)))then
return false
end
local o={}
local s=h(i(e))
while not r(s)do
if not a(s)then
return false
end
local e=h(i(s))
s=h(n(s))
if not a(e)then
return false
end
local s=i(e)
e=h(n(e))
if not a(e)then
return false
end
local a=i(e)
if not r(h(n(e)))then
return false
end
local i=true
do
local e=0
while e<#o do
if u(o[(e+0)+1],s)then
o[(e+1)+1]=a
i=false
break
end
e=e+2
end
end
if i then
t(o,s)
t(o,a)
end
end
return o
end
local function ue(t,a)
return{
t,
1,
function(e)
e=v(e)
if y(e)then
return k(t,{e})
end
if a(e)then
return se
end
return c
end,
}
end
local function Z(t,a,i)
return{
t,
1,
function(e,o)
e=v(e)
if y(e)then
return k(t,{e})
end
if a(e)then
return i(e)
end
return o()
end,
}
end
st={
ue(Me,w),
{
vt,
2,
E,
},
Z(We,w,T),
Z(Ce,w,O),
ue(Re,j),
{
gt,
2,
S,
},
Z(Ye,j,L),
Z(Fe,j,F),
ue(Le,r),
{
bt,
2,
s,
},
ue(He,a),
Z(Ie,a,i),
Z(Ne,a,n),
{
te,
2,
function(e,t,o)
if e==t then
return se
end
e=v(e)
t=v(t)
if y(e)or y(t)then
return k(te,{
e,
t,
})
end
if e==t then
return se
end
local function o(t,a,e)
return k(oe,{
t,
a,
e,
})
end
local function s(t,e)
return o(t,e,c)
end
I(not y(e))
local function o(e,a,t,o)
return s(k(te,{
t(e),
t(a),
}),k(te,{
o(e),
o(a),
}))
end
if r(e)then
if not r(e)then
return c
end
return se
elseif g(e)then
if not g(t)then
return c
end
if C(e,t)then
return se
else
return c
end
elseif w(e)then
if not w(t)then
return c
end
return o(e,t,T,O)
elseif a(e)then
if not a(t)then
return c
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return c
end
return o(e,t,L,F)
end
return q()
end,
},
{
ze,
2,
function(s,e,d)
local o={}
local e=h(e)
while a(e)do
t(o,i(e))
e=h(n(e))
end
if not r(e)then
return d()
end
return U(s,o)
end,
},
{
_e,
2,
function(e,a,t)
local e=ce(e)
if e==false then
return t()
end
return N(e,a)
end,
},
ue(Se,g),
{
Ae,
1,
function(e,t)
e=v(e)
if y(e)then
return k(Ae,{e})
end
if not a(e)then
return t()
end
return i(e)
end,
},
{
oe,
3,
function(e,o,a,t)
e=v(e)
if y(e)then
return k(oe,{
e,
o,
a,
})
end
if not w(e)then
return t()
end
local e=h(T(e))
if not g(e)then
return t()
end
if C(e,at)then
return o
end
if C(e,ot)then
return a
end
return t()
end,
},
{
it,
2,
he,
},
}
local Z
Z=u
local function c(a,e)
if a==e then
return true
end
local a={a}
local o={e}
while#a~=0 do
if#a~=#o then
return false
end
local i={}
local n={}
local h={}
local s={}
do
local e=0
while e<#a do
if a[e+1]==o[e+1]then
else
ve(a[e+1],function(e)return t(i,e)end,function(e)return t(h,e)end)
ve(o[e+1],function(e)return t(n,e)end,function(e)return t(s,e)end)
end
e=e+1
end
end
if#i~=#n then
return false
end
do
local e=0
while e<#i do
if i[e+1]~=n[e+1]then
return false
end
e=e+1
end
end
a=h
o=s
end
return#o==0
end
local function te(ee)
local H,y,c,u,m,h,T,A,K,v,O,B,G,P,C,D,L,F,R,j,Y,q,w,J,Q,Z
function c()
return#H==y
end
function u()
I(not c())
local e=string.sub(H,y+1,y+1)
y=y+1
return e
end
function m(e)
I(string.sub(H,y,y)==e)
y=y-1
end
function h(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function T(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function A()
if c()then
return false
end
local e=u()
if not T(e)then
m(e)
return false
end
while T(e)and not c()do
e=u()
end
if not T(e)then
m(e)
end
return true
end
function K()
if c()then
return false
end
local e=u()
local t=""
if not F(e)then
m(e)
return false
end
while F(e)and not c()do
t=tostring(t)..tostring(e)
e=u()
end
if F(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if Ge(t)then
return o(t)
else
return h("Not Symbol"..tostring(t))
end
end
function v()
if c()then
return false
end
local e=u()
if e~="("then
m(e)
return false
end
local t=V()
local a=t
local function o(a)
local e=V()
W(t,s(a,e))
t=e
end
while true do
A()
if c()then
return h()
end
e=u()
if e==")"then
W(t,b)
return a
end
if e=="."then
A()
local o=R()
W(t,o)
A()
if c()then
return h()
end
e=u()
if e~=")"then
return h()
end
return a
end
m(e)
local e=R()
o(e)
end
end
function O()
if c()then
return false
end
local e=u()
if e~="#"then
m(e)
return false
end
local e=v()
if e==false then
return h()
end
if not a(e)then
return h()
end
return E(i(e),n(e))
end
function B()
if c()then
return false
end
local e=u()
if e~="!"then
m(e)
return false
end
local e=v()
if e==false then
return h()
end
if not a(e)then
return h()
end
return S(i(e),n(e))
end
function F(e)
if T(e)then
return false
end
for a,t in ipairs({
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
})do
if t==e then
return false
end
end
return true
end
function R()
A()
local e={
v,
Z,
O,
B,
G,
P,
C,
D,
L,
}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function j(e)
if e==false then
return h()
end
return e
end
function Y()
return not c()
end
function q(e)
j(Y())
j(u()==e)
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
v,
K,
a,
O,
B,
G,
P,
C,
D,
L,
}
else
e={
v,
Q,
O,
B,
G,
P,
C,
D,
L,
}
end
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function J(a)
if c()then
return a
end
local o=u()
if o=="."then
local t=w()
return e(l,e(d,e(a),f),t)
elseif o==":"then
local t=w()
return e(l,t,a)
elseif o=="~"then
return e(X,a)
elseif o=="@"then
local t=w()
return e(l,e(d,s(a,f),f),t)
elseif o=="?"then
return e(l,d,e(X,a))
elseif o=="/"then
local a={a}
while true do
local e=w(true)
t(a,e)
if c()then
break
end
local e=u()
if e~="/"then
m(e)
break
end
end
return e(ke,_(a))
else
m(o)
return a
end
end
function Q()
if c()then
return false
end
local t=u()
if t=="&"then
j(Y())
local t=u()
if t=="+"then
local t=w()
return e(x,e(z,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
j(Y())
local t=u()
if t=="&"then
q(">")
local t=w()
return e(l,e(x,e(d,f,t)),M)
elseif t==">"then
local t=w()
return e(l,e(d,f,t),M)
else
m(t)
end
local t=w()
return e(l,t,M)
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
return e(l,t,f)
else
m(t)
local e=K()
if e==false then
return false
end
return J(e)
end
end
function Z()
local e=Q()
if e==false then
return false
end
if g(e)then
return e
end
return p(e)
end
H=ee
y=0
local function e(t,o)
return function()
if c()then
return false
end
local e=u()
if e~=t then
m(e)
return false
end
local e=v()
if e==false then
return h()
end
if not a(e)then
return h()
end
local t=n(e)
if not(a(t)and r(n(t)))then
return h()
end
return o(i(e),i(t))
end
end
local function s(t,s)
return function()
if c()then
return false
end
local e=u()
if e~=t then
m(e)
return false
end
local e=v()
if e==false then
return h()
end
if not a(e)then
return h()
end
local o=n(e)
if not a(o)then
return h()
end
local t=n(o)
if not(a(t)and r(n(t)))then
return h()
end
return s(i(e),i(o),i(t))
end
end
G=e("$",function(e,t)
local e=ce(e)
if e==false then
return h()
end
return N(e,t)
end)
P=e("%",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return h()end)
return k(t,e)
end)
C=s("@",function(e,t,a)
local a=xe(a,function(e)return e end,function(e,e)return h()end)
local e=ce(e)
if e==false then
return h()
end
return De(e,t,a)
end)
D=e("^",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return h()end)
return U(t,e)
end)
L=e(";",function(t,e)return he(t,e)end)
return R()
end
local function k(y)
local function t(r,u)
if g(r)then
return le(r)
end
local function o(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and c(e[1],l)then
local s=D(e[2])
if s~=false and#s==3 and c(s[1],d)then
local h=s[2]
local r=D(h)
if r~=false and#r==1 and c(s[3],f)then
return o(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),f)and c(s[3],f)then
return o(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,f)and c(e[3],M)then
return o(":>"..tostring(t(s[3],true)))
end
end
local a=D(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],X)then
return o(tostring(t(a[2],true)).."?")
end
if s~=false and#s==2 and c(e[3],M)and c(s[1],x)then
local e=D(s[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],f)then
return o(":&>"..tostring(t(e[3],true)))
end
end
local a
if c(e[3],f)then
a="_"
elseif c(e[3],M)then
a=""
else
a=t(e[3],true)
end
return o(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],x)then
local a=D(e[2])
if a~=false and#a==2 and c(a[1],z)then
return o("&+"..tostring(t(a[2],true)))
end
return o("&"..tostring(t(e[2],true)))
elseif c(e[1],X)then
return o(tostring(t(e[2],true)).."~")
elseif c(e[1],z)then
return o("+"..tostring(t(e[2],true)))
elseif c(e[1],ke)then
local e=D(e[2])
if e~=false and#e>1 then
local i=t(e[1],true)
do
local a=1
while a<#e do
i=tostring(i).."/"..tostring(t(e[a+1],true))
a=a+1
end
end
return o(i)
end
end
end
if u then
return m(r)
else
return m(p(r))
end
end
local e=te(m(y))
local o=""
local h=""
if r(e)then
return"()"
elseif a(e)then
o="("
h=""
while a(e)do
o=tostring(o)..tostring(h)..tostring(k(i(e)))
h=" "
e=n(e)
end
if r(e)then
o=tostring(o)..")"
else
o=tostring(o).." . "..tostring(k(e))..")"
end
return o
elseif w(e)then
local o=T(e)
local a=O(e)
local e=D(a)
if e~=false and#e==2 and c(o,fe)and c(e[1],z)then
return t(e[2],false)
end
return"#"..tostring(k(s(o,a)))
elseif j(e)then
return"!"..tostring(k(s(L(e),F(e))))
elseif g(e)then
return le(e)
elseif A(e)then
return";("..tostring(k(de(e))).." "..tostring(k(J(e)))..")"
elseif Q(e)then
return"$("..tostring(k(H(ee(e)))).." "..tostring(k(ae(e)))..")"
elseif P(e)then
return"%("..tostring(k(re(e))).." "..tostring(k(_(ne(e))))..")"
elseif B(e)then
return"@("..tostring(k(H(we(e)))).." "..tostring(k(pe(e))).." "..tostring(k(_(ye(e))))..")"
elseif G(e)then
return"^("..tostring(k(qe(e))).." "..tostring(k(_(Ee(e))))..")"
end
return q()
end
local function M(d)
local l=V()
local r={function(e)return W(l,e)end}
local a=0
local function o(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function c(e)
if not e then
return o()
end
end
local function u()
c(#d>a)
local e=string.sub(d,a+1,a+1)
a=a+1
return e
end
local h={}
while#r~=0 do
local a={}
for e,i in ipairs(r)do
local e=u()
local function n(n)
local o=V()
local e=V()
t(a,function(e)return W(o,e)end)
t(a,function(t)return W(e,t)end)
i(n(o,e))
end
if e=="^"then
local e=""
while true do
local t=u()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if nt(e)then
i(Be(e))
else
return o("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
n(s)
elseif e=="#"then
n(E)
elseif e=="!"then
n(S)
elseif e=="$"then
local n=false
local e=false
t(a,function(e)
n=e
end)
t(a,function(t)
e=t
end)
t(h,function()
if n==false or e==false then
return q()
else
local t=ce(n)
if t==false then
return o()
else
i(N(t,e))
end
end
end)
elseif e=="_"then
i(b)
else
return o()
end
end
r=a
end
c(a==#d)
do
local e=#h-1
while e>=0 do
h[e+1]()
e=e-1
end
end
return l
end
local function c(o)
local a={}
local e={}
for i,o in ipairs(o)do
ve(o,function(e)return t(a,e)end,function(a)return t(e,a)end)
end
return{
a,
e,
}
end
local function P(e)
local t={e}
local e=""
while#t~=0 do
local a=c(t)
local o=a[1]
local a=a[2]
for o,a in ipairs(o)do
e=tostring(e)..tostring(a)
end
t=a
end
return e
end
local function q(e)
return function()return{
false,
e,
}end
end
local function c(e)
return function()return{
true,
e(),
}end
end
local function I(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local z=p(s(ke,s(s(Ze,s(s(l,s(tt,s(f,b))),b)),b)))
local x=p(s(ke,s(s(Ze,s(ie,b)),b)))
local function W(t,a)
return E(x,e(t,a))
end
local function C(e)
return E(z,e)
end
local function p(y,m,l,f,s)
if s==nil then
s=false
end
local function v(e,e)
error("WIP")
end
l=h(l)
if w(l)then
local w=T(l)
local t=O(l)
if u(w,z)then
t=h(t)
if a(t)then
local a=i(t)
local e=h(n(t))
if r(e)then
if s==false then
local e=a
local a=f
local function t()return y(e,a)end
return c(t)
else
local t
t=y
local e
e=m
local i=a
local o=f
local function a()return p(t,e,U(s,i),o)end
return c(a)
end
end
end
elseif u(w,x)then
t=h(t)
if a(t)then
local l=i(t)
local t=h(n(t))
if a(t)then
local a=i(t)
local t=h(n(t))
if r(t)then
if s==false then
local e
e=y
local t
t=m
local o=l
local a=a
local n=f
local function i()return p(e,t,o,n,a)end
return c(i)
else
local i
i=y
local t
t=m
local l=l
local h=a
local r=f
local n=s
local a=o("序甲")
local function o()return p(i,t,l,r,E(d,e(e(a),v(e(me(h),a),me(n)))))end
return c(o)
end
end
end
end
end
end
if s==false then
return c(function()return m(l,f,y)end)
else
return c(function()return m(l,f,function(e,t)return c(function()return p(y,m,U(s,{e}),t)end)end)end)
end
end
local function l(o,t,e,a)
return p(o,t,e,a)
end
local function d(a,n,i,o)
return I(p((function(t,e)return q(a(t,e))end),(function(a,t,e)return q(n(a,t,function(t,a)return I(e(t,a))end))end),i,o))
end
local t={}
t.new_comment=he
t.comment_p=A
t.comment_comment=de
t.comment_x=J
t.un_comment_all=be
t.can_new_symbol_p=Ge
t.new_symbol=o
t.symbol_p=g
t.un_symbol=le
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=b
t.null_p=r
t.new_data=E
t.data_p=w
t.data_name=T
t.data_list=O
t.new_error=S
t.error_p=j
t.error_name=L
t.error_list=F
t.just_p=K
t.evaluate=N
t.apply=U
t.force_all_rec=Y
t.force_uncomment_all_rec=Te
t.jsArray_to_list=_
t.maybe_list_to_jsArray=D
t.new_list=e
t.un_just_all=R
t.un_just_comment_all=et
t.delay_p=je
t.delay_just_p=y
t.delay_env=Xe
t.delay_x=Ue
t.force_all=h
t.force1=v
t.force_uncomment1=Oe
t.force_uncomment_all=Pe
t.env_null_v=Ke
t.env_set=ge
t.env_get=Je
t.env2val=H
t.env_foreach=Ve
t.val2env=ce
t.equal_p=Z
t.simple_print=m
t.complex_parse=te
t.complex_print=k
t.machinetext_parse=M
t.machinetext_print=P
t.trampoline_return=q
t.trampoline_delay=c
t.run_trampoline=I
t.return_effect_systemName=z
t.bind_effect_systemName=x
t.new_effect_bind=W
t.new_effect_return=C
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
