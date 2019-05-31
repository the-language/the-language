local function t(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local q,I,F,Fe,Ke,X,ae,Oe,Ae,ne,ie,se,fe,ye,we,ue,A,le,K,xe,v,f,ce,s,a,i,n,g,r,_,w,T,O,H,j,M,W,G,mt,N,B,oe,Z,Ye,V,qe,je,ze,k,P,de,he,L,J,Te,_e,U,Q,o,u,Y,ct,E,d,x,Xe,et,Se,Ne,He,Re,De,Le,Ge,Pe,Ve,We,Me,te,Ee,ke,ee,Ue,ht,C,re,st,ot,c,z,e,D,ve,y,be,p,b,h,Je,Ie,pe,Qe,nt,S,Ce,it,at,R,Be,ut,lt,dt,me,rt,l,m,ge,tt,Ze
function q()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return q()
end
end
function ue(e,t)
return{
ye,
e,
t,
}
end
function A(e)
return e[1]==ye
end
function le(e)
return e[2]
end
function K(e)
return e[3]
end
function xe(e)
while A(e)do
e=K(e)
end
return e
end
function v(e)
return e[1]==Fe
end
function f(e)
return e[2]
end
function ce(e)
return F()[f(e)]
end
function s(e,t)
return{
Ke,
e,
t,
}
end
function a(e)
return e[1]==Ke
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==X
end
function _(t,e)
return{
ae,
t,
e,
}
end
function w(e)
return e[1]==ae
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function H(e,t)
return{
Oe,
e,
t,
}
end
function j(e)
return e[1]==Oe
end
function M(e)
return e[2]
end
function W(e)
return e[3]
end
function G(e)
return e[1]==Ae
end
function mt(e)
return e[2]
end
function N(e,t)
return{
ne,
e,
t,
}
end
function B(e)
return e[1]==ne
end
function oe(e)
return e[2]
end
function Z(e)
return e[3]
end
function Ye(e,t,a)
return{
se,
e,
t,
a,
}
end
function V(e)
return e[1]==se
end
function qe(e)
return e[2]
end
function je(e)
return e[3]
end
function ze(e)
return e[4]
end
function k(e,t)
return{
ie,
e,
t,
}
end
function P(e)
return e[1]==ie
end
function de(e)
return e[2]
end
function he(e)
return e[3]
end
function L(e,t)
return{
fe,
e,
t,
}
end
function J(e)
return e[1]==fe
end
function Te(e)
return e[2]
end
function _e(e)
return e[3]
end
function U(e)
local e=h(e)
local function t(e)
e[2]=U(e[2])
e[3]=U(e[3])
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
function Q()
return{we}
end
function o(e)
return e[1]==we
end
function u(e,t)
if e==t then
return
end
e[1]=Ae
e[2]=t
e[3]=false
e[4]=false
end
function Y(e,t)
I(o(e))
I(not o(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function ct(t)
local e=Q()
Y(e,t)
return e
end
function c(e,t)
if e==t then
return true
end
if f(e)==f(t)then
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
function D(e)
if not G(e)then
return e
end
local e=e
local a={}
while G(e)do
t(a,e)
e=mt(e)
end
for t=1,#a do
local t=a[t]
u(t,e)
end
return e
end
function ve(e)
return B(e)or V(e)or P(e)or J(e)
end
function y(e)
return G(e)or ve(e)
end
function be(e)
if B(e)then
return e
elseif V(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif J(e)then
error("WIP")
end
return q()
end
function p(i,n,a,o)
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
return p(a,n,{
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
return s(et)
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
e=b(e)
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
if B(e)then
return i()
elseif P(e)then
local t=de(e)
local e=he(e)
local o={
Se,
Ne,
He,
Re,
De,
Le,
Ge,
Pe,
Ve,
We,
Me,
}
local n=false
for e=1,#o do
local e=o[e]
if l(e,t)then
n=true
break
end
end
if n then
I(#e==1)
I(a[2]==false)
local e=p(e[1],d(),a)
if a[2]then
return s(k(t,{e}))
else
return q()
end
end
if l(t,te)then
return i()
elseif l(t,Ee)then
return i()
elseif l(t,ke)then
return i()
elseif l(t,ee)then
I(#e==3)
I(a[2]==false)
local t=p(e[1],d(),a)
if a[2]then
return s(k(ee,{
t,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif V(e)then
return i()
elseif J(e)then
return i()
end
return q()
end
h[r]=true
t(o,e)
e=b(e)
end
return r(e)
end
function b(a)
local e=D(a)
local t
I(not G(e))
if B(e)then
t=at(oe(e),Z(e),a)
elseif V(e)then
t=dt(qe(e),je(e),ze(e),a)
elseif P(e)then
t=lt(de(e),he(e),a)
elseif J(e)then
t=ut(Te(e),_e(e),a)
else
t=e
end
t=D(t)
u(e,t)
return t
end
function h(e)
return p(e)
end
function Je(e)
while y(e)or A(e)do
e=h(xe(e))
end
return e
end
function pe(a,o,i)
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
function Qe(t,o,a)
do
local e=0
while e<#t do
if l(t[(e+0)+1],o)then
return t[(e+1)+1]
end
e=e+2
end
end
return a
end
function nt(t,a)
do
local e=0
while e<#t do
if l(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function S(o)
local a=g
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(Xe,e(a))
end
function Ce(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function it(e,d,l,u)
local h={}
local s={}
local e=D(e)
local o=true
while true do
if r(e)then
return u(s,h)
elseif A(e)then
t(s,le(e))
e=K(e)
elseif a(e)then
t(h,i(e))
e=n(e)
elseif y(e)then
if o then
o=false
e=b(e)
else
return l()
end
else
return d()
end
end
end
function at(d,o,u)
local s=b(o)
if y(s)then
return u
end
local function o()return H(E,e(C,e(ke,e(S(d),s))))end
if a(s)then
return it(s,o,function()return u end,function(s,e)
if#s~=0 then
error("WIP")
end
if l(e[1],re)then
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
return Ye(d,i,o)
elseif l(e[1],st)then
if#e==1 then
return o()
end
local s=h(N(d,e[2]))
if not w(s)then
return o()
end
local h=b(T(s))
if y(h)then
return u
end
if not v(h)then
return o()
end
if not c(h,x)then
return o()
end
local s=b(O(s))
if y(s)then
return u
end
if not a(s)then
return o()
end
local i=i(s)
local a=b(n(s))
if y(a)then
return u
end
if not r(a)then
return o()
end
local o={S(d)}
do
local a=2
while a<#e do
t(o,e[a+1])
a=a+1
end
end
return L(i,o)
elseif l(e[1],C)then
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
return L(i,o)
end
end)
elseif r(s)then
return s
elseif R(s)then
return Qe(d,s,o())
elseif j(s)then
return o()
end
return q()
end
function R(e)
return v(e)or w(e)
end
function ut(t,o,u)
local function l()return H(E,e(C,e(Ee,e(t,z(o)))))end
t=b(t)
if y(t)then
return u
end
if not w(t)then
return l()
end
local e=h(T(t))
if not(v(e)and c(e,d))then
return l()
end
local t=h(O(t))
if not a(t)then
return l()
end
local e=U(i(t))
local t=h(n(t))
if not(a(t)and r(h(n(t))))then
return l()
end
local d=i(t)
local h=Ie
local t=0
while not r(e)do
if R(e)then
local a=g
do
local e=#o-1
while e>=t do
a=s(o[e+1],a)
e=e-1
end
end
h=pe(h,e,a)
t=#o
e=g
elseif a(e)then
if t<#o then
local a=o[t+1]
t=t+1
h=pe(h,i(e),a)
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
return N(h,d)
end
function lt(i,t,o)
local function a()return H(E,e(C,e(i,z(t))))end
for e=1,#Be do
local e=Be[e]
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
return q()
end
end
return a()
end
function dt(i,o,t,a)
local function a()return H(E,e(re,e(S(i),o,z(t))))end
if l(o,Ue)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,ht)then
if#t~=2 then
return a()
end
return rt(i,t[1],t[2],a)
elseif l(o,ot)then
if#t~=2 then
return a()
end
return ue(t[1],N(i,t[2]))
end
return a()
end
function me(t)
return e(re,Ue,t)
end
function rt(c,h,f,w)
h=U(h)
local u={}
local m=false
local o=h
while not r(o)do
if R(o)then
t(u,o)
m=true
o=g
elseif a(o)then
t(u,i(o))
o=n(o)
else
return w()
end
end
local o
if m then
o=z(u)
else
o=h
end
local a={}
Ce(c,function(o,e)
do
local e=0
while e<#u do
if l(u[e+1],o)then
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
t=s(me(nt(c,a[e+1])),t)
e=e-1
end
end
return _(d,e(h,s(me(_(d,e(i,f))),t)))
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
local function o(e,t,o,a)
if l(o(e),o(t))and l(a(e),a(t))then
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
elseif v(e)then
if not v(t)then
return false
end
return c(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return false
end
return o(e,t,M,W)
elseif w(e)then
if not w(t)then
return false
end
return o(e,t,T,O)
end
return q()
end
function m(e)
e=D(e)
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
e=D(n(e))
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
return"!"..tostring(m(s(M(e),W(e))))
elseif v(e)then
return ce(e)
elseif A(e)then
return";("..tostring(m(le(e))).." "..tostring(m(K(e)))..")"
elseif B(e)then
return"$("..tostring(m(S(oe(e)))).." "..tostring(m(Z(e)))..")"
elseif P(e)then
return"%("..tostring(m(de(e))).." "..tostring(m(z(he(e))))..")"
elseif V(e)then
return"@("..tostring(m(S(qe(e)))).." "..tostring(m(je(e))).." "..tostring(m(z(ze(e))))..")"
elseif J(e)then
return"^("..tostring(m(Te(e))).." "..tostring(m(z(_e(e))))..")"
end
return q()
end
function ge(e,t,s)
e=D(e)
local function o(e,i,o,a)
t(i)
s(o(e))
return s(a(e))
end
if v(e)then
t("^")
t(f(e))
return t("^")
elseif a(e)then
return o(e,".",i,n)
elseif r(e)then
return t("_")
elseif w(e)then
return o(e,"#",T,O)
elseif j(e)then
return o(e,"!",M,W)
elseif ve(e)then
local e=be(e)
return o(e,"$",(function(e)return S(oe(e))end),Z)
else
return q()
end
end
function tt()
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
function Ze()
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
local e=tt()
function u()return e end
return e
end
function F()
local e=Ze()
function F()return e end
return e
end
Fe=0
Ke=1
X=2
ae=3
Oe=4
Ae=5
ne=6
ie=7
se=8
fe=9
ye=11
we=10
local function mt(e)
return F()[e]~=nil
end
local function Ke(e)
return{
Fe,
e,
}
end
local function Fe(e)
return u()[e]~=nil
end
local function o(e)
return Ke(u()[e])
end
g={X}
local function Oe(e)
local t=Je(e)
local function o(e)
e[2]=U(e[2])
e[3]=U(e[3])
if A(e[2])or A(e[3])then
local t=ct(e)
local a=e[2]
local o=e[3]
local e=Oe(a)
local a=Oe(o)
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
E=o("太始初核")
local we=o("符名")
d=o("化滅")
x=o("式形")
local bt=o("等同")
local vt=o("解算")
local F=o("特定其物")
local f=o("省略一物")
Xe=o("映表")
local ft=o("如若")
local u=o("一類何物")
local X=o("是非")
local ye=o("其子")
local it=o("爻陽")
local nt=o("爻陰")
local yt=o("引用")
local wt=o("應用")
local pt=o("間空")
local se=o("連頸")
local ie=o("構物")
local ne=o("謬誤")
local ct=o("詞素")
local Ae=o("列序")
local rt=o("首始")
local ut=o("尾末")
local at=o("之物")
local p=o("宇宙亡矣")
local Ze=o("效應")
local tt=o("註疏")
et=H(E,e(p,f))
local function p(e)
return _(we,s(E,s(e,g)))
end
local function fe(t)
return p(e(u,e(d,f,t),F))
end
local function R(t,a)
return p(e(u,e(d,e(t),f),a))
end
local function ae(t)
return p(e(u,d,e(X,e(u,t,f))))
end
local lt=fe(ie)
Se=R(ie,we)
Ne=R(ie,Ae)
He=ae(ie)
local dt=fe(ne)
Re=R(ne,we)
De=R(ne,Ae)
Le=ae(ne)
local et=fe(se)
Ge=ae(se)
Pe=R(se,rt)
Ve=R(se,ut)
We=ae(ct)
Me=ae(pt)
te=p(e(u,d,e(X,bt)))
Ee=p(e(u,e(d,s(d,f),f),wt))
ke=p(e(u,d,vt))
local Ae=R(Ae,e(u,at,f))
ee=p(e(u,d,ft))
Ue=p(e(u,x,yt))
ht=p(e(u,e(x,e(d,f,d)),F))
C=p(e(x,e(E,d)))
re=p(e(x,e(E,x)))
st=p(e(x,x))
local Ue=p(e(u,d,tt))
ot=p(e(u,x,tt))
local C=_(nt,e())
local re=_(it,e())
local function fe(e,h,s)
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
local function R(e)
return fe(e,function(e)return e end,function(e,e)return false end)
end
local function ot(e)
while G(e)or A(e)do
e=D(xe(e))
end
return e
end
local function tt(e)
return oe(be(e))
end
local function st(e)
return Z(be(e))
end
local function be(e)
if A(e)then
return K(e)
else
return b(e)
end
end
Ie={}
local function ie(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not v(e)then
return false
end
if not c(e,Xe)then
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
if l(o[(e+0)+1],s)then
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
local function ne(t,a)
return{
t,
1,
function(e)
e=b(e)
if y(e)then
return k(t,{e})
end
if a(e)then
return re
end
return C
end,
}
end
local function ae(t,i,o)
return{
t,
1,
function(e,a)
e=b(e)
if y(e)then
return k(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
Be={
ne(He,w),
{
lt,
2,
_,
},
ae(Se,w,T),
ae(Ne,w,O),
ne(Le,j),
{
dt,
2,
H,
},
ae(Re,j,M),
ae(De,j,W),
ne(Me,r),
{
et,
2,
s,
},
ne(Ge,a),
ae(Pe,a,i),
ae(Ve,a,n),
{
te,
2,
function(e,t,o)
if e==t then
return re
end
e=b(e)
t=b(t)
if y(e)or y(t)then
return k(te,{
e,
t,
})
end
if e==t then
return re
end
local function o(e,t,a)
return k(ee,{
e,
t,
a,
})
end
local function s(e,t)
return o(e,t,C)
end
I(not y(e))
local function o(o,t,a,e)
return s(k(te,{
a(o),
a(t),
}),k(te,{
e(o),
e(t),
}))
end
if r(e)then
if not r(e)then
return C
end
return re
elseif v(e)then
if not v(t)then
return C
end
if c(e,t)then
return re
else
return C
end
elseif w(e)then
if not w(t)then
return C
end
return o(e,t,T,O)
elseif a(e)then
if not a(t)then
return C
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return C
end
return o(e,t,M,W)
end
return q()
end,
},
{
Ee,
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
local e=ie(e)
if e==false then
return t()
end
return N(e,a)
end,
},
ne(We,v),
{
Ae,
1,
function(e,t)
e=b(e)
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
ee,
3,
function(e,a,o,t)
e=b(e)
if y(e)then
return k(ee,{
e,
a,
o,
})
end
if not w(e)then
return t()
end
local e=h(T(e))
if not v(e)then
return t()
end
if c(e,it)then
return a
end
if c(e,nt)then
return o
end
return t()
end,
},
{
Ue,
2,
ue,
},
}
local te
te=l
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
ge(a[e+1],function(e)return t(i,e)end,function(e)return t(h,e)end)
ge(o[e+1],function(e)return t(n,e)end,function(e)return t(s,e)end)
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
local function ee(ee)
local D,y,c,l,m,h,T,A,G,b,S,B,P,R,M,V,W,O,C,j,U,q,w,J,K,Z
function c()
return#D==y
end
function l()
I(not c())
local e=string.sub(D,y+1,y+1)
y=y+1
return e
end
function m(e)
I(string.sub(D,y,y)==e)
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
m(e)
return false
end
while T(e)and not c()do
e=l()
end
if not T(e)then
m(e)
end
return true
end
function G()
if c()then
return false
end
local e=l()
local t=""
if not O(e)then
m(e)
return false
end
while O(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if O(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if Fe(t)then
return o(t)
else
return h("Not Symbol"..tostring(t))
end
end
function b()
if c()then
return false
end
local e=l()
if e~="("then
m(e)
return false
end
local t=Q()
local a=t
local function i(a)
local e=Q()
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
local o=C()
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
m(e)
local e=C()
i(e)
end
end
function S()
if c()then
return false
end
local e=l()
if e~="#"then
m(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
return _(i(e),n(e))
end
function B()
if c()then
return false
end
local e=l()
if e~="!"then
m(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
return H(i(e),n(e))
end
function O(e)
if T(e)then
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
function C()
A()
local e={
b,
Z,
S,
B,
P,
R,
M,
V,
W,
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
function U()
return not c()
end
function q(e)
j(U())
j(l()==e)
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
b,
G,
a,
S,
B,
P,
R,
M,
V,
W,
}
else
e={
b,
K,
S,
B,
P,
R,
M,
V,
W,
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
function J(a)
if c()then
return a
end
local o=l()
if o=="."then
local t=w()
return e(u,e(d,e(a),f),t)
elseif o==":"then
local t=w()
return e(u,t,a)
elseif o=="~"then
return e(X,a)
elseif o=="@"then
local t=w()
return e(u,e(d,s(a,f),f),t)
elseif o=="?"then
return e(u,d,e(X,a))
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
m(e)
break
end
end
return e(ye,z(a))
else
m(o)
return a
end
end
function K()
if c()then
return false
end
local t=l()
if t=="&"then
j(U())
local t=l()
if t=="+"then
local t=w()
return e(x,e(E,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
j(U())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(u,e(x,e(d,f,t)),F)
elseif t==">"then
local t=w()
return e(u,e(d,f,t),F)
else
m(t)
end
local t=w()
return e(u,t,F)
elseif t=="+"then
local t=w()
return e(E,t)
elseif t=="["then
local e=w()
q("]")
return J(e)
elseif t=="_"then
q(":")
local t=w()
return e(u,t,f)
else
m(t)
local e=G()
if e==false then
return false
end
return J(e)
end
end
function Z()
local e=K()
if e==false then
return false
end
if v(e)then
return e
end
return p(e)
end
D=ee
y=0
local function t(t,o)
return function()
if c()then
return false
end
local e=l()
if e~=t then
m(e)
return false
end
local e=b()
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
local e=l()
if e~=t then
m(e)
return false
end
local e=b()
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
P=t("$",function(e,t)
local e=ie(e)
if e==false then
return h()
end
return N(e,t)
end)
R=t("%",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return h()end)
return k(t,e)
end)
M=s("@",function(o,a,e)
local t=fe(e,function(e)return e end,function(e,e)return h()end)
local e=ie(o)
if e==false then
return h()
end
return Ye(e,a,t)
end)
V=t("^",function(e,t)
local t=fe(t,function(e)return e end,function(e,e)return h()end)
return L(e,t)
end)
W=t(";",function(e,t)return ue(e,t)end)
return C()
end
local function k(y)
local function t(r,l)
if v(r)then
return ce(r)
end
local function o(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=R(r)
if e~=false and#e==3 and c(e[1],u)then
local s=R(e[2])
if s~=false and#s==3 and c(s[1],d)then
local h=s[2]
local r=R(h)
if r~=false and#r==1 and c(s[3],f)then
return o(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),f)and c(s[3],f)then
return o(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,f)and c(e[3],F)then
return o(":>"..tostring(t(s[3],true)))
end
end
local a=R(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],X)then
return o(tostring(t(a[2],true)).."?")
end
if s~=false and#s==2 and c(e[3],F)and c(s[1],x)then
local e=R(s[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],f)then
return o(":&>"..tostring(t(e[3],true)))
end
end
local a
if c(e[3],f)then
a="_"
elseif c(e[3],F)then
a=""
else
a=t(e[3],true)
end
return o(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],x)then
local a=R(e[2])
if a~=false and#a==2 and c(a[1],E)then
return o("&+"..tostring(t(a[2],true)))
end
return o("&"..tostring(t(e[2],true)))
elseif c(e[1],X)then
return o(tostring(t(e[2],true)).."~")
elseif c(e[1],E)then
return o("+"..tostring(t(e[2],true)))
elseif c(e[1],ye)then
local e=R(e[2])
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
if l then
return m(r)
else
return m(p(r))
end
end
local e=ee(m(y))
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
local e=R(a)
if e~=false and#e==2 and c(o,we)and c(e[1],E)then
return t(e[2],false)
end
return"#"..tostring(k(s(o,a)))
elseif j(e)then
return"!"..tostring(k(s(M(e),W(e))))
elseif v(e)then
return ce(e)
elseif A(e)then
return";("..tostring(k(le(e))).." "..tostring(k(K(e)))..")"
elseif B(e)then
return"$("..tostring(k(S(oe(e)))).." "..tostring(k(Z(e)))..")"
elseif P(e)then
return"%("..tostring(k(de(e))).." "..tostring(k(z(he(e))))..")"
elseif V(e)then
return"@("..tostring(k(S(qe(e)))).." "..tostring(k(je(e))).." "..tostring(k(z(ze(e))))..")"
elseif J(e)then
return"^("..tostring(k(Te(e))).." "..tostring(k(z(_e(e))))..")"
end
return q()
end
local function C(r)
local u=Q()
local o={function(e)return Y(u,e)end}
local e=0
local function i(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function l(e)
if not e then
return i()
end
end
local function d()
l(#r>e)
local t=string.sub(r,e+1,e+1)
e=e+1
return t
end
local n={}
while#o~=0 do
local a={}
for e=1,#o do
local o=o[e]
local e=d()
local function h(n)
local e=Q()
local i=Q()
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
if mt(e)then
o(Ke(e))
else
return i("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
h(s)
elseif e=="#"then
h(_)
elseif e=="!"then
h(H)
elseif e=="$"then
local s=false
local e=false
t(a,function(e)
s=e
end)
t(a,function(t)
e=t
end)
t(n,function()
if s==false or e==false then
return q()
else
local t=ie(s)
if t==false then
return i()
else
o(N(t,e))
end
end
end)
elseif e=="_"then
o(g)
else
return i()
end
end
o=a
end
l(e==#r)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return u
end
local function c(o)
local a={}
local e={}
for i=1,#o do
local o=o[i]
ge(o,function(e)return t(a,e)end,function(a)return t(e,a)end)
end
return{
a,
e,
}
end
local function F(e)
local e={e}
local t=""
while#e~=0 do
local a=c(e)
local o=a[1]
local i=a[2]
for a=1,#o do
local e=o[a]
t=tostring(t)..tostring(e)
end
e=i
end
return t
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
local x=p(s(ye,s(s(Ze,s(s(u,s(at,s(f,g))),g)),g)))
local E=p(s(ye,s(s(Ze,s(se,g)),g)))
local function P(a,t)
return _(E,e(a,t))
end
local function Y(e)
return _(x,e)
end
local function f(y,p,u,m,s)
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
local a=e
local e=m
local function t()return y(a,e)end
return c(t)
else
local a
a=y
local t
t=p
local i=e
local o=m
local function e()return f(a,t,L(s,i),o)end
return c(e)
end
end
end
elseif l(w,E)then
t=h(t)
if a(t)then
local l=i(t)
local t=h(n(t))
if a(t)then
local i=i(t)
local t=h(n(t))
if r(t)then
if s==false then
local e
e=y
local t
t=p
local n=l
local i=i
local a=m
local function o()return f(e,t,n,a,i)end
return c(o)
else
local a
a=y
local t
t=p
local r=l
local h=i
local n=m
local i=s
local o=o("序甲")
local function s()return f(a,t,r,n,_(d,e(e(o),v(e(me(h),o),me(i)))))end
return c(s)
end
end
end
end
end
end
if s==false then
return c(function()return p(u,m,y)end)
else
return c(function()return p(u,m,function(t,e)return c(function()return f(y,p,L(s,{t}),e)end)end)end)
end
end
local function d(e,a,t,o)
return f(e,a,t,o)
end
local function l(a,n,o,i)
return I(f((function(t,e)return q(a(t,e))end),(function(e,t,a)return q(n(e,t,function(e,t)return I(a(e,t))end))end),o,i))
end
local t={}
t.new_comment=ue
t.comment_p=A
t.comment_comment=le
t.comment_x=K
t.un_comment_all=xe
t.can_new_symbol_p=Fe
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=v
t.un_symbol=ce
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
t.new_error=H
t.error_p=j
t.error_name=M
t.error_list=W
t.just_p=G
t.evaluate=N
t.apply=L
t.force_all_rec=U
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=z
t.maybe_list_to_jsArray=R
t.new_list=e
t.un_just_all=D
t.un_just_comment_all=ot
t.delay_p=ve
t.delay_just_p=y
t.delay_env=tt
t.delay_x=st
t.force_all=h
t.force1=b
t.force_uncomment1=be
t.force_uncomment_all=Je
t.env_null_v=Ie
t.env_set=pe
t.env_get=Qe
t.env2val=S
t.env_foreach=Ce
t.val2env=ie
t.equal_p=te
t.simple_print=m
t.complex_parse=ee
t.complex_print=k
t.machinetext_parse=C
t.machinetext_print=F
t.trampoline_return=q
t.trampoline_delay=c
t.run_trampoline=I
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=x
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=E
t.new_effect_bind=P
t.new_effect_return=Y
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
