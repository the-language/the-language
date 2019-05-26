local function t(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local k,N,M,me,X,oe,Ae,Ke,Oe,Qe,ze,Te,fe,de,ne,he,A,se,G,Ee,b,c,ie,s,a,i,n,g,r,_,w,T,O,S,j,W,U,Q,mt,I,V,Z,te,Je,K,_e,ye,pe,q,B,le,ue,L,P,ve,je,F,J,o,u,Y,ct,E,d,x,Ge,ot,Ue,De,Ne,Ie,Se,He,Re,Ye,Pe,Be,Ve,ae,ge,ke,ee,Ce,Ze,D,qe,et,tt,C,z,e,R,xe,y,re,m,v,h,Le,Xe,we,We,at,H,Fe,lt,ut,p,Me,dt,st,nt,ce,rt,l,f,be,ht,it
function k()
error("TheLanguage PANIC")
end
function N(e)
if not e then
return k()
end
end
function he(e,t)
return{
de,
e,
t,
}
end
function A(e)
return e[1]==de
end
function se(e)
return e[2]
end
function G(e)
return e[3]
end
function Ee(e)
while A(e)do
e=G(e)
end
return e
end
function b(e)
return e[1]==me
end
function c(e)
return e[2]
end
function ie(e)
return M()[c(e)]
end
function s(e,t)
return{
X,
e,
t,
}
end
function a(e)
return e[1]==X
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==oe
end
function _(t,e)
return{
Ae,
t,
e,
}
end
function w(e)
return e[1]==Ae
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function S(e,t)
return{
Ke,
e,
t,
}
end
function j(e)
return e[1]==Ke
end
function W(e)
return e[2]
end
function U(e)
return e[3]
end
function Q(e)
return e[1]==Oe
end
function mt(e)
return e[2]
end
function I(e,t)
return{
Qe,
e,
t,
}
end
function V(e)
return e[1]==Qe
end
function Z(e)
return e[2]
end
function te(e)
return e[3]
end
function Je(e,t,a)
return{
Te,
e,
t,
a,
}
end
function K(e)
return e[1]==Te
end
function _e(e)
return e[2]
end
function ye(e)
return e[3]
end
function pe(e)
return e[4]
end
function q(e,t)
return{
ze,
e,
t,
}
end
function B(e)
return e[1]==ze
end
function le(e)
return e[2]
end
function ue(e)
return e[3]
end
function L(t,e)
return{
fe,
t,
e,
}
end
function P(e)
return e[1]==fe
end
function ve(e)
return e[2]
end
function je(e)
return e[3]
end
function F(e)
local e=h(e)
local function t(e)
e[2]=F(e[2])
e[3]=F(e[3])
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
function J()
return{ne}
end
function o(e)
return e[1]==ne
end
function u(e,t)
if e==t then
return
end
e[1]=Oe
e[2]=t
e[3]=false
e[4]=false
end
function Y(t,e)
N(o(t))
N(not o(e))
local t=t
local e=e
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ct(t)
local e=J()
Y(e,t)
return e
end
function C(e,t)
if e==t then
return true
end
if c(e)==c(t)then
u(e,t)
return true
else
return false
end
end
function z(a)
local t=g
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
return z(e)
end
function R(e)
if not Q(e)then
return e
end
local e=e
local a={}
while Q(e)do
t(a,e)
e=mt(e)
end
for t=1,#a do
local t=a[t]
u(t,e)
end
return e
end
function xe(e)
return V(e)or K(e)or B(e)or P(e)
end
function y(e)
return Q(e)or xe(e)
end
function re(e)
if V(e)then
return e
elseif K(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif P(e)then
error("WIP")
end
return k()
end
function m(i,n,a,o)
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
local e,r,s
function r(t)
u(e,t)
do
local e=0
while e<#o do
u(o[e+1],t)
e=e+1
end
end
return t
end
function s(a)
r(a)
if y(a)then
t(o,e)
return m(a,n,{
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
return s(ot)
end
local function d()
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
local r=f(e)
if n[r]==true then
return i()
end
if h[r]==true then
a[1]=true
if V(e)then
return i()
elseif B(e)then
local t=le(e)
local e=ue(e)
local n={
Ue,
De,
Ne,
Ie,
Se,
He,
Re,
Ye,
Pe,
Be,
Ve,
}
local o=false
for e=1,#n do
local e=n[e]
if l(e,t)then
o=true
break
end
end
if o then
N(#e==1)
N(a[2]==false)
local e=m(e[1],d(),a)
if a[2]then
return s(q(t,{e}))
else
return k()
end
end
if l(t,ae)then
return i()
elseif l(t,ge)then
return i()
elseif l(t,ke)then
return i()
elseif l(t,ee)then
N(#e==3)
N(a[2]==false)
local t=m(e[1],d(),a)
if a[2]then
return s(q(ee,{
t,
e[2],
e[3],
}))
else
return k()
end
end
return k()
elseif K(e)then
return i()
elseif P(e)then
return i()
end
return k()
end
h[r]=true
t(o,e)
e=v(e)
end
return r(e)
end
function v(a)
local e=R(a)
local t
N(not Q(e))
if V(e)then
t=ut(Z(e),te(e),a)
elseif K(e)then
t=nt(_e(e),ye(e),pe(e),a)
elseif B(e)then
t=st(le(e),ue(e),a)
elseif P(e)then
t=dt(ve(e),je(e),a)
else
t=e
end
t=R(t)
u(e,t)
return t
end
function h(e)
return m(e)
end
function Le(e)
while y(e)or A(e)do
e=h(Ee(e))
end
return e
end
function we(a,o,i)
local t={}
do
local e=0
while e<#a do
if l(a[(e+0)+1],o)then
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
function We(t,a,o)
do
local e=0
while e<#t do
if l(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function at(t,a)
do
local e=0
while e<#t do
if l(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function H(o)
local a=g
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(Ge,e(a))
end
function Fe(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function lt(e,u,l,d)
local o={}
local s={}
local e=R(e)
local h=true
while true do
if r(e)then
return d(s,o)
elseif A(e)then
t(s,se(e))
e=G(e)
elseif a(e)then
t(o,i(e))
e=n(e)
elseif y(e)then
if h then
h=false
e=v(e)
else
return l()
end
else
return u()
end
end
end
function ut(d,o,u)
local s=v(o)
if y(s)then
return u
end
local function o()return S(E,e(D,e(ke,e(H(d),s))))end
if a(s)then
return lt(s,o,function()return u end,function(s,e)
if#s~=0 then
error("WIP")
end
if l(e[1],qe)then
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
return Je(d,i,o)
elseif l(e[1],et)then
if#e==1 then
return o()
end
local s=h(I(d,e[2]))
if not w(s)then
return o()
end
local h=v(T(s))
if y(h)then
return u
end
if not b(h)then
return o()
end
if not C(h,x)then
return o()
end
local s=v(O(s))
if y(s)then
return u
end
if not a(s)then
return o()
end
local i=i(s)
local a=v(n(s))
if y(a)then
return u
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
return L(i,o)
elseif l(e[1],D)then
if#e==1 then
return o()
end
local i=e[2]
local o={}
do
local a=2
while a<#e do
t(o,I(d,e[a+1]))
a=a+1
end
end
return q(i,o)
else
local i=I(d,e[1])
local o={}
do
local a=1
while a<#e do
t(o,I(d,e[a+1]))
a=a+1
end
end
return L(i,o)
end
end)
elseif r(s)then
return s
elseif p(s)then
return We(d,s,o())
elseif j(s)then
return o()
end
return k()
end
function p(e)
return b(e)or w(e)
end
function dt(t,o,u)
local function l()return S(E,e(D,e(ge,e(t,z(o)))))end
t=v(t)
if y(t)then
return u
end
if not w(t)then
return l()
end
local e=h(T(t))
if not(b(e)and C(e,d))then
return l()
end
local t=h(O(t))
if not a(t)then
return l()
end
local e=F(i(t))
local t=h(n(t))
if not(a(t)and r(h(n(t))))then
return l()
end
local d=i(t)
local h=Xe
local t=0
while not r(e)do
if p(e)then
local a=g
do
local e=#o-1
while e>=t do
a=s(o[e+1],a)
e=e-1
end
end
h=we(h,e,a)
t=#o
e=g
elseif a(e)then
if t<#o then
local a=o[t+1]
t=t+1
h=we(h,i(e),a)
e=n(e)
else
return l()
end
else
return l()
end
end
if#o~=t then
return l()
end
return I(h,d)
end
function st(i,t,o)
local function a()return S(E,e(D,e(i,z(t))))end
for e=1,#Me do
local e=Me[e]
if l(i,e[1])then
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
return k()
end
end
return a()
end
function nt(i,o,t,a)
local function a()return S(E,e(qe,e(H(i),o,z(t))))end
if l(o,Ce)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,Ze)then
if#t~=2 then
return a()
end
return rt(i,t[1],t[2],a)
elseif l(o,tt)then
if#t~=2 then
return a()
end
return he(t[1],I(i,t[2]))
end
return a()
end
function ce(t)
return e(qe,Ce,t)
end
function rt(m,u,f,w)
u=F(u)
local h={}
local c=false
local o=u
while not r(o)do
if p(o)then
t(h,o)
c=true
o=g
elseif a(o)then
t(h,i(o))
o=n(o)
else
return w()
end
end
local o
if c then
o=z(h)
else
o=u
end
local a={}
Fe(m,function(o,e)
do
local e=0
while e<#h do
if l(h[e+1],o)then
return
end
e=e+1
end
end
t(a,o)
end)
local i=o
do
local e=#a-1
while e>=0 do
i=s(a[e+1],i)
e=e-1
end
end
local t=o
do
local e=#a-1
while e>=0 do
t=s(ce(at(m,a[e+1])),t)
e=e-1
end
end
return _(d,e(u,s(ce(_(d,e(i,f))),t)))
end
function l(e,t)
if e==t then
return true
end
e=h(e)
t=h(t)
if e==t then
return true
end
local function o(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
u(e,t)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
u(e,g)
u(t,g)
return true
elseif b(e)then
if not b(t)then
return false
end
return C(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return false
end
return o(e,t,W,U)
elseif w(e)then
if not w(t)then
return false
end
return o(e,t,T,O)
end
return k()
end
function f(e)
e=R(e)
local t=""
local o=""
if r(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(f(i(e)))
o=" "
e=R(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif w(e)then
return"#"..tostring(f(s(T(e),O(e))))
elseif j(e)then
return"!"..tostring(f(s(W(e),U(e))))
elseif b(e)then
return ie(e)
elseif A(e)then
return";("..tostring(f(se(e))).." "..tostring(f(G(e)))..")"
elseif V(e)then
return"$("..tostring(f(H(Z(e)))).." "..tostring(f(te(e)))..")"
elseif B(e)then
return"%("..tostring(f(le(e))).." "..tostring(f(z(ue(e))))..")"
elseif K(e)then
return"@("..tostring(f(H(_e(e)))).." "..tostring(f(ye(e))).." "..tostring(f(z(pe(e))))..")"
elseif P(e)then
return"^("..tostring(f(ve(e))).." "..tostring(f(z(je(e))))..")"
end
return k()
end
function be(e)
local o={}
local h={}
for s=1,#e do
local e=e[s]
e=R(e)
local function s(e,a,i,n)
t(o,a)
t(h,i(e))
t(h,n(e))
end
if b(e)then
t(o,"^")
t(o,c(e))
t(o,"^")
elseif a(e)then
s(e,".",i,n)
elseif r(e)then
t(o,"_")
elseif w(e)then
s(e,"#",T,O)
elseif j(e)then
s(e,"!",W,U)
elseif xe(e)then
local e=re(e)
s(e,"$",(function(e)return H(Z(e))end),te)
else
return k()
end
end
return{
o,
h,
}
end
function ht()
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
local function u()
local e=ht()
function u()return e end
return e
end
function M()
local e=it()
function M()return e end
return e
end
me=0
X=1
oe=2
Ae=3
Ke=4
Oe=5
Qe=6
ze=7
Te=8
fe=9
de=11
ne=10
local function ut(e)
return M()[e]~=nil
end
local function it(e)
return{
me,
e,
}
end
local function Qe(e)
return u()[e]~=nil
end
local function o(e)
return it(u()[e])
end
g={oe}
local function Oe(e)
local t=Le(e)
local function o(e)
e[2]=F(e[2])
e[3]=F(e[3])
if A(e[2])or A(e[3])then
local t=ct(e)
local a=e[2]
local e=e[3]
local a=Oe(a)
local e=Oe(e)
t[2]=a
t[3]=e
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
E=o("太始初核")
local fe=o("符名")
d=o("化滅")
x=o("式形")
local lt=o("等同")
local dt=o("解算")
local M=o("特定其物")
local m=o("省略一物")
Ge=o("映表")
local rt=o("如若")
local u=o("一類何物")
local oe=o("是非")
local ze=o("其子")
local at=o("爻陽")
local Ke=o("爻陰")
local ct=o("引用")
local ft=o("應用")
local wt=o("間空")
local de=o("連頸")
local ne=o("構物")
local me=o("謬誤")
local pt=o("詞素")
local Te=o("列序")
local vt=o("首始")
local yt=o("尾末")
local st=o("之物")
local c=o("宇宙亡矣")
local nt=o("效應")
local ht=o("註疏")
ot=S(E,e(c,m))
local function p(e)
return _(fe,s(E,s(e,g)))
end
local function Ae(t)
return p(e(u,e(d,m,t),M))
end
local function c(a,t)
return p(e(u,e(d,e(a),m),t))
end
local function X(t)
return p(e(u,d,e(oe,e(u,t,m))))
end
local mt=Ae(ne)
Ue=c(ne,fe)
De=c(ne,Te)
Ne=X(ne)
local ot=Ae(me)
Ie=c(me,fe)
Se=c(me,Te)
He=X(me)
local Ae=Ae(de)
Re=X(de)
Ye=c(de,vt)
Pe=c(de,yt)
Be=X(pt)
Ve=X(wt)
ae=p(e(u,d,e(oe,lt)))
ge=p(e(u,e(d,s(d,m),m),ft))
ke=p(e(u,d,dt))
local Te=c(Te,e(u,st,m))
ee=p(e(u,d,rt))
Ce=p(e(u,x,ct))
Ze=p(e(u,e(x,e(d,m,d)),M))
D=p(e(x,e(E,d)))
qe=p(e(x,e(E,x)))
et=p(e(x,x))
local Ce=p(e(u,d,ht))
tt=p(e(u,x,ht))
local c=_(Ke,e())
local ne=_(at,e())
local function qe(e,s,h)
local o={}
while a(e)do
t(o,i(e))
e=n(e)
end
if r(e)then
return s(o)
end
return h(o,e)
end
local function D(e)
return qe(e,function(e)return e end,function(e,e)return false end)
end
local function Ze(e)
while Q(e)or A(e)do
e=R(Ee(e))
end
return e
end
local function tt(e)
return Z(re(e))
end
local function ht(e)
return te(re(e))
end
local function et(e)
if A(e)then
return G(e)
else
return v(e)
end
end
Xe={}
local function re(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not b(e)then
return false
end
if not C(e,Ge)then
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
local i=i(e)
if not r(h(n(e)))then
return false
end
local a=true
do
local e=0
while e<#o do
if l(o[(e+0)+1],s)then
o[(e+1)+1]=i
a=false
break
end
e=e+2
end
end
if a then
t(o,s)
t(o,i)
end
end
return o
end
local function me(t,a)
return{
t,
1,
function(e)
e=v(e)
if y(e)then
return q(t,{e})
end
if a(e)then
return ne
end
return c
end,
}
end
local function X(t,o,i)
return{
t,
1,
function(e,a)
e=v(e)
if y(e)then
return q(t,{e})
end
if o(e)then
return i(e)
end
return a()
end,
}
end
Me={
me(Ne,w),
{
mt,
2,
_,
},
X(Ue,w,T),
X(De,w,O),
me(He,j),
{
ot,
2,
S,
},
X(Ie,j,W),
X(Se,j,U),
me(Ve,r),
{
Ae,
2,
s,
},
me(Re,a),
X(Ye,a,i),
X(Pe,a,n),
{
ae,
2,
function(e,t,o)
if e==t then
return ne
end
e=v(e)
t=v(t)
if y(e)or y(t)then
return q(ae,{
e,
t,
})
end
if e==t then
return ne
end
local function o(t,e,a)
return q(ee,{
t,
e,
a,
})
end
local function s(t,e)
return o(t,e,c)
end
N(not y(e))
local function o(t,a,e,o)
return s(q(ae,{
e(t),
e(a),
}),q(ae,{
o(t),
o(a),
}))
end
if r(e)then
if not r(e)then
return c
end
return ne
elseif b(e)then
if not b(t)then
return c
end
if C(e,t)then
return ne
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
return o(e,t,W,U)
end
return k()
end,
},
{
ge,
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
return L(s,o)
end,
},
{
ke,
2,
function(e,a,t)
local e=re(e)
if e==false then
return t()
end
return I(e,a)
end,
},
me(Be,b),
{
Te,
1,
function(e,t)
e=v(e)
if y(e)then
return q(Te,{e})
end
if not a(e)then
return t()
end
return i(e)
end,
},
{
ee,
3,
function(e,a,o,t)
e=v(e)
if y(e)then
return q(ee,{
e,
a,
o,
})
end
if not w(e)then
return t()
end
local e=h(T(e))
if not b(e)then
return t()
end
if C(e,at)then
return a
end
if C(e,Ke)then
return o
end
return t()
end,
},
{
Ce,
2,
he,
},
}
local X
X=l
local function c(e,t)
local a={e}
local o={t}
while#a~=0 do
local t,s=unpack(be(a))
local i,n=unpack(be(o))
if#t~=#i then
return false
end
do
local e=0
while e<#t do
if t[e+1]~=i[e+1]then
return false
end
e=e+1
end
end
a=s
o=n
end
return#o==0
end
local function ee(Z)
local V,y,c,l,f,h,T,A,K,v,F,C,W,P,B,D,H,U,O,j,R,k,w,G,Q,X
function c()
return#V==y
end
function l()
N(not c())
local e=string.sub(V,y+1,y+1)
y=y+1
return e
end
function f(e)
N(string.sub(V,y,y)==e)
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
local e=l()
if not T(e)then
f(e)
return false
end
while T(e)and not c()do
e=l()
end
if not T(e)then
f(e)
end
return true
end
function K()
if c()then
return false
end
local e=l()
local t=""
if not U(e)then
f(e)
return false
end
while U(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if U(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Qe(t)then
return o(t)
else
return h("Not Symbol"..tostring(t))
end
end
function v()
if c()then
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
Y(t,s(a,e))
t=e
end
while true do
A()
if c()then
return h()
end
e=l()
if e==")"then
Y(t,g)
return a
end
if e=="."then
A()
local o=O()
Y(t,o)
A()
if c()then
return h()
end
e=l()
if e~=")"then
return h()
end
return a
end
f(e)
local e=O()
o(e)
end
end
function F()
if c()then
return false
end
local e=l()
if e~="#"then
f(e)
return false
end
local e=v()
if e==false then
return h()
end
if not a(e)then
return h()
end
return _(i(e),n(e))
end
function C()
if c()then
return false
end
local e=l()
if e~="!"then
f(e)
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
function U(t)
if T(t)then
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
function O()
A()
local e={
v,
X,
F,
C,
W,
P,
B,
D,
H,
}
for t=1,#e do
local e=e[t]
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
function R()
return not c()
end
function k(e)
j(R())
j(l()==e)
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
v,
K,
a,
F,
C,
W,
P,
B,
D,
H,
}
else
e={
v,
Q,
F,
C,
W,
P,
B,
D,
H,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return h()
end
function G(a)
if c()then
return a
end
local o=l()
if o=="."then
local t=w()
return e(u,e(d,e(a),m),t)
elseif o==":"then
local t=w()
return e(u,t,a)
elseif o=="~"then
return e(oe,a)
elseif o=="@"then
local t=w()
return e(u,e(d,s(a,m),m),t)
elseif o=="?"then
return e(u,d,e(oe,a))
elseif o=="/"then
local a={a}
while true do
local e=w(true)
t(a,e)
if c()then
break
end
local e=l()
if e~="/"then
f(e)
break
end
end
return e(ze,z(a))
else
f(o)
return a
end
end
function Q()
if c()then
return false
end
local t=l()
if t=="&"then
j(R())
local t=l()
if t=="+"then
local t=w()
return e(x,e(E,t))
else
f(t)
end
local t=w()
return e(x,t)
elseif t==":"then
j(R())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(x,e(d,m,t)),M)
elseif t==">"then
local t=w()
return e(u,e(d,m,t),M)
else
f(t)
end
local t=w()
return e(u,t,M)
elseif t=="+"then
local t=w()
return e(E,t)
elseif t=="["then
local e=w()
k("]")
return G(e)
elseif t=="_"then
k(":")
local t=w()
return e(u,t,m)
else
f(t)
local e=K()
if e==false then
return false
end
return G(e)
end
end
function X()
local e=Q()
if e==false then
return false
end
if b(e)then
return e
end
return p(e)
end
V=Z
y=0
local function t(t,o)
return function()
if c()then
return false
end
local e=l()
if e~=t then
f(e)
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
local function d(t,s)
return function()
if c()then
return false
end
local e=l()
if e~=t then
f(e)
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
W=t("$",function(e,t)
local e=re(e)
if e==false then
return h()
end
return I(e,t)
end)
P=t("%",function(t,e)
local e=qe(e,function(e)return e end,function(e,e)return h()end)
return q(t,e)
end)
B=d("@",function(o,a,e)
local t=qe(e,function(e)return e end,function(e,e)return h()end)
local e=re(o)
if e==false then
return h()
end
return Je(e,a,t)
end)
D=t("^",function(t,e)
local e=qe(e,function(e)return e end,function(e,e)return h()end)
return L(t,e)
end)
H=t(";",function(t,e)return he(t,e)end)
return O()
end
local function q(y)
local function t(h,l)
if b(h)then
return ie(h)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(h)
if e~=false and#e==3 and c(e[1],u)then
local o=D(e[2])
if o~=false and#o==3 and c(o[1],d)then
local h=o[2]
local r=D(h)
if r~=false and#r==1 and c(o[3],m)then
return s(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),m)and c(o[3],m)then
return s(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,m)and c(e[3],M)then
return s(":>"..tostring(t(o[3],true)))
end
end
local a=D(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],oe)then
return s(tostring(t(a[2],true)).."?")
end
if o~=false and#o==2 and c(e[3],M)and c(o[1],x)then
local e=D(o[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],m)then
return s(":&>"..tostring(t(e[3],true)))
end
end
local a=c(e[3],m)and"_"or c(e[3],M)and""or t(e[3],true)
return s(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],x)then
local a=D(e[2])
if a~=false and#a==2 and c(a[1],E)then
return s("&+"..tostring(t(a[2],true)))
end
return s("&"..tostring(t(e[2],true)))
elseif c(e[1],oe)then
return s(tostring(t(e[2],true)).."~")
elseif c(e[1],E)then
return s("+"..tostring(t(e[2],true)))
elseif c(e[1],ze)then
local e=D(e[2])
if e~=false and#e>1 then
local o=t(e[1],true)
do
local a=1
while a<#e do
o=tostring(o).."/"..tostring(t(e[a+1],true))
a=a+1
end
end
return s(o)
end
end
end
if l then
return f(h)
else
return f(p(h))
end
end
local e=ee(f(y))
local o=""
local h=""
if r(e)then
return"()"
elseif a(e)then
o="("
h=""
while a(e)do
o=tostring(o)..tostring(h)..tostring(q(i(e)))
h=" "
e=n(e)
end
if r(e)then
o=tostring(o)..")"
else
o=tostring(o).." . "..tostring(q(e))..")"
end
return o
elseif w(e)then
local o=T(e)
local a=O(e)
local e=D(a)
if e~=false and#e==2 and c(o,fe)and c(e[1],E)then
return t(e[2],false)
end
return"#"..tostring(q(s(o,a)))
elseif j(e)then
return"!"..tostring(q(s(W(e),U(e))))
elseif b(e)then
return ie(e)
elseif A(e)then
return";("..tostring(q(se(e))).." "..tostring(q(G(e)))..")"
elseif V(e)then
return"$("..tostring(q(H(Z(e)))).." "..tostring(q(te(e)))..")"
elseif B(e)then
return"%("..tostring(q(le(e))).." "..tostring(q(z(ue(e))))..")"
elseif K(e)then
return"@("..tostring(q(H(_e(e)))).." "..tostring(q(ye(e))).." "..tostring(q(z(pe(e))))..")"
elseif P(e)then
return"^("..tostring(q(ve(e))).." "..tostring(q(z(je(e))))..")"
end
return k()
end
local function C(h)
local u=J()
local n={function(e)return Y(u,e)end}
local a=0
local function i()
error("MT parse ERROR")
end
local function l(e)
if not e then
return i()
end
end
local function d()
l(#h>a)
local e=string.sub(h,a+1,a+1)
a=a+1
return e
end
local r={}
while#n~=0 do
local a={}
for e=1,#n do
local o=n[e]
local e=d()
local function n(n)
local e=J()
local i=J()
t(a,function(t)return Y(e,t)end)
t(a,function(e)return Y(i,e)end)
o(n(e,i))
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
if ut(e)then
o(it(e))
else
return i()
end
elseif e=="."then
n(s)
elseif e=="#"then
n(_)
elseif e=="!"then
n(S)
elseif e=="$"then
local e=false
local n=false
t(a,function(t)
e=t
end)
t(a,function(e)
n=e
end)
t(r,function()
if e==false or n==false then
return k()
else
local e=re(e)
if e==false then
return i()
else
o(I(e,n))
end
end
end)
elseif e=="_"then
o(g)
else
return i()
end
end
n=a
end
l(a==#h)
do
local e=#r-1
while e>=0 do
r[e+1]()
e=e-1
end
end
return u
end
local function M(e)
local e={e}
local t=""
while#e~=0 do
local a,i=unpack(be(e))
for o=1,#a do
local e=a[o]
t=tostring(t)..tostring(e)
end
e=i
end
return t
end
local function N(e)
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
local function E(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local x=p(s(ze,s(s(nt,s(s(u,s(st,s(m,g))),g)),g)))
local k=p(s(ze,s(s(nt,s(de,g)),g)))
local function P(t,a)
return _(k,e(t,a))
end
local function Y(e)
return _(x,e)
end
local function p(m,f,u,y,s)
if s==nil then
s=false
end
local function v(e,e)
error("WIP")
end
u=h(u)
if w(u)then
local w=T(u)
local t=O(u)
if l(w,x)then
t=h(t)
if a(t)then
local e=i(t)
local t=h(n(t))
if r(t)then
if s==false then
local t=e
local a=y
local function e()return m(t,a)end
return c(e)
else
local t
t=m
local a
a=f
local i=e
local o=y
local function e()return p(t,a,L(s,i),o)end
return c(e)
end
end
end
elseif l(w,k)then
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
e=m
local t
t=f
local n=l
local o=a
local i=y
local function a()return p(e,t,n,i,o)end
return c(a)
else
local n
n=m
local i
i=f
local r=l
local h=a
local a=y
local s=s
local t=o("序甲")
local function o()return p(n,i,r,a,_(d,e(e(t),v(e(ce(h),t),ce(s)))))end
return c(o)
end
end
end
end
end
end
if s==false then
return c(function()return f(u,y,m)end)
else
return c(function()return f(u,y,function(e,t)return c(function()return p(m,f,L(s,{e}),t)end)end)end)
end
end
local function d(t,e,a,o)
return p(t,e,a,o)
end
local function l(a,i,n,o)
return E(p((function(t,e)return N(a(t,e))end),(function(e,t,a)return N(i(e,t,function(e,t)return E(a(e,t))end))end),n,o))
end
local t={}
t.new_comment=he
t.comment_p=A
t.comment_comment=se
t.comment_x=G
t.un_comment_all=Ee
t.can_new_symbol_p=Qe
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=b
t.un_symbol=ie
t.New_Construction=New_Construction
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.Null_V=Null_V
t.null_v=g
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=w
t.data_name=T
t.data_list=O
t.New_Error=New_Error
t.new_error=S
t.error_p=j
t.error_name=W
t.error_list=U
t.just_p=Q
t.evaluate=I
t.apply=L
t.force_all_rec=F
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=z
t.maybe_list_to_jsArray=D
t.new_list=e
t.un_just_all=R
t.un_just_comment_all=Ze
t.delay_p=xe
t.delay_just_p=y
t.delay_env=tt
t.delay_x=ht
t.force_all=h
t.force1=v
t.force_uncomment1=et
t.force_uncomment_all=Le
t.env_null_v=Xe
t.env_set=we
t.env_get=We
t.env2val=H
t.env_foreach=Fe
t.val2env=re
t.equal_p=X
t.simple_print=f
t.complex_parse=ee
t.complex_print=q
t.machinetext_parse=C
t.machinetext_print=M
t.trampoline_return=N
t.trampoline_delay=c
t.run_trampoline=E
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=x
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=k
t.new_effect_bind=P
t.new_effect_return=Y
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
