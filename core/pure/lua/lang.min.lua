local function t(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local k,N,p,_e,ze,U,ee,Te,Ae,ne,Oe,Ge,xe,me,Ke,de,A,he,P,be,v,c,se,s,a,i,n,b,r,z,w,T,O,S,x,W,Y,K,ot,I,B,ae,te,Je,G,ke,ve,ge,q,V,le,ue,C,Q,we,ye,F,J,o,u,M,at,E,d,j,Qe,et,Be,Pe,Fe,De,Re,Ue,Me,Ce,He,Le,Se,oe,pe,fe,Z,Ie,tt,X,ie,Ze,Xe,L,_,e,D,qe,y,ce,f,g,h,Ve,Ne,Ee,We,it,H,Ye,rt,nt,R,ut,dt,lt,st,re,ht,l,m,je
function k()
error("TheLanguage PANIC")
end
function N(e)
if not e then
return k()
end
end
function de(e,t)
return{
me,
e,
t,
}
end
function A(e)
return e[1]==me
end
function he(e)
return e[2]
end
function P(e)
return e[3]
end
function be(e)
while A(e)do
e=P(e)
end
return e
end
function v(e)
return e[1]==_e
end
function c(e)
return e[2]
end
function se(e)
return p()[c(e)]
end
function s(t,e)
return{
ze,
t,
e,
}
end
function a(e)
return e[1]==ze
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==U
end
function z(e,t)
return{
ee,
e,
t,
}
end
function w(e)
return e[1]==ee
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function S(t,e)
return{
Te,
t,
e,
}
end
function x(e)
return e[1]==Te
end
function W(e)
return e[2]
end
function Y(e)
return e[3]
end
function K(e)
return e[1]==Ae
end
function ot(e)
return e[2]
end
function I(e,t)
return{
ne,
e,
t,
}
end
function B(e)
return e[1]==ne
end
function ae(e)
return e[2]
end
function te(e)
return e[3]
end
function Je(a,t,e)
return{
Ge,
a,
t,
e,
}
end
function G(e)
return e[1]==Ge
end
function ke(e)
return e[2]
end
function ve(e)
return e[3]
end
function ge(e)
return e[4]
end
function q(t,e)
return{
Oe,
t,
e,
}
end
function V(e)
return e[1]==Oe
end
function le(e)
return e[2]
end
function ue(e)
return e[3]
end
function C(t,e)
return{
xe,
t,
e,
}
end
function Q(e)
return e[1]==xe
end
function we(e)
return e[2]
end
function ye(e)
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
elseif x(e)then
return t(e)
elseif a(e)then
return t(e)
elseif A(e)then
return t(e)
end
return e
end
function J()
return{Ke}
end
function o(e)
return e[1]==Ke
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
function M(e,t)
N(o(e))
N(not o(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function at(t)
local e=J()
M(e,t)
return e
end
function L(t,e)
if t==e then
return true
end
if c(t)==c(e)then
u(t,e)
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
function D(e)
if not K(e)then
return e
end
local e=e
local a={}
while K(e)do
t(a,e)
e=ot(e)
end
for a,t in ipairs(a)do
u(t,e)
end
return e
end
function qe(e)
return B(e)or G(e)or V(e)or Q(e)
end
function y(e)
return K(e)or qe(e)
end
function ce(e)
if B(e)then
return e
elseif G(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return k()
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
local e,h,s
function h(t)
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
h(a)
if y(a)then
t(o,e)
return f(a,n,{
false,
false,
},o)
end
return a
end
local r={}
e=i
local function i()
a[2]=true
return s(et)
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
local a=0
while y(e)and a<32 do
t(o,e)
e=g(e)
a=a+1
end
end
while y(e)do
local h=m(e)
if n[h]==true then
return i()
end
if r[h]==true then
a[1]=true
if B(e)then
return i()
elseif V(e)then
local t=le(e)
local e=ue(e)
local n={
Be,
Pe,
Fe,
De,
Re,
Ue,
Me,
Ce,
He,
Le,
Se,
}
local o=false
for a,e in ipairs(n)do
if l(e,t)then
o=true
break
end
end
if o then
N(#e==1)
N(a[2]==false)
local e=f(e[1],d(),a)
if a[2]then
return s(q(t,{e}))
else
return k()
end
end
if l(t,oe)then
return i()
elseif l(t,pe)then
return i()
elseif l(t,fe)then
return i()
elseif l(t,Z)then
N(#e==3)
N(a[2]==false)
local t=f(e[1],d(),a)
if a[2]then
return s(q(Z,{
t,
e[2],
e[3],
}))
else
return k()
end
end
return k()
elseif G(e)then
return i()
elseif Q(e)then
return i()
end
return k()
end
r[h]=true
t(o,e)
e=g(e)
end
return h(e)
end
function g(a)
local e=D(a)
local t
N(not K(e))
if B(e)then
t=nt(ae(e),te(e),a)
elseif G(e)then
t=st(ke(e),ve(e),ge(e),a)
elseif V(e)then
t=lt(le(e),ue(e),a)
elseif Q(e)then
t=dt(we(e),ye(e),a)
else
t=e
end
t=D(t)
u(e,t)
return t
end
function h(e)
return f(e)
end
function Ve(e)
while y(e)or A(e)do
e=h(be(e))
end
return e
end
function Ee(a,o,i)
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
function We(t,o,a)
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
function it(t,a)
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
local a=b
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return z(Qe,e(a))
end
function Ye(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function rt(e,d,u,l)
local o={}
local s={}
local e=D(e)
local h=true
while true do
if r(e)then
return l(s,o)
elseif A(e)then
t(s,he(e))
e=P(e)
elseif a(e)then
t(o,i(e))
e=n(e)
elseif y(e)then
if h then
h=false
e=g(e)
else
return u()
end
else
return d()
end
end
end
function nt(d,o,u)
local s=g(o)
if y(s)then
return u
end
local function o()return S(E,e(X,e(fe,e(H(d),s))))end
if a(s)then
return rt(s,o,function()return u end,function(s,e)
if#s~=0 then
error("WIP")
end
if l(e[1],ie)then
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
elseif l(e[1],Ze)then
if#e==1 then
return o()
end
local h=h(I(d,e[2]))
if not w(h)then
return o()
end
local s=g(T(h))
if y(s)then
return u
end
if not v(s)then
return o()
end
if not L(s,j)then
return o()
end
local s=g(O(h))
if y(s)then
return u
end
if not a(s)then
return o()
end
local i=i(s)
local a=g(n(s))
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
return C(i,o)
elseif l(e[1],X)then
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
return C(i,o)
end
end)
elseif r(s)then
return s
elseif R(s)then
return We(d,s,o())
elseif x(s)then
return o()
end
return k()
end
function R(e)
return v(e)or w(e)
end
function dt(l,t,u)
local function o()return S(E,e(X,e(pe,e(l,_(t)))))end
l=g(l)
if y(l)then
return u
end
if not w(l)then
return o()
end
local e=h(T(l))
if not(v(e)and L(e,d))then
return o()
end
local d=h(O(l))
if not a(d)then
return o()
end
local e=F(i(d))
local d=h(n(d))
if not(a(d)and r(h(n(d))))then
return o()
end
local l=i(d)
local d=Ne
local h=0
while not r(e)do
if R(e)then
local a=b
do
local e=#t-1
while e>=h do
a=s(t[e+1],a)
e=e-1
end
end
d=Ee(d,e,a)
h=#t
e=b
elseif a(e)then
if h<#t then
local t=t[h+1]
h=h+1
d=Ee(d,i(e),t)
e=n(e)
else
return o()
end
else
return o()
end
end
if#t~=h then
return o()
end
return I(d,l)
end
function lt(i,t,o)
local function a()return S(E,e(X,e(i,_(t))))end
for n,e in ipairs(ut)do
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
function st(i,o,t,a)
local function a()return S(E,e(ie,e(H(i),o,_(t))))end
if l(o,Ie)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,tt)then
if#t~=2 then
return a()
end
return ht(i,t[1],t[2],a)
elseif l(o,Xe)then
if#t~=2 then
return a()
end
return de(t[1],I(i,t[2]))
end
return a()
end
function re(t)
return e(ie,Ie,t)
end
function ht(m,u,w,f)
u=F(u)
local h={}
local c=false
local o=u
while not r(o)do
if R(o)then
t(h,o)
c=true
o=b
elseif a(o)then
t(h,i(o))
o=n(o)
else
return f()
end
end
local o
if c then
o=_(h)
else
o=u
end
local a={}
Ye(m,function(o,e)
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
o=s(re(it(m,a[e+1])),o)
e=e-1
end
end
return z(d,e(u,s(re(z(d,e(t,w))),o)))
end
function l(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function o(t,e,o,a)
if l(o(t),o(e))and l(a(t),a(e))then
u(t,e)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
u(t,b)
u(e,b)
return true
elseif v(t)then
if not v(e)then
return false
end
return L(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif x(t)then
if not x(e)then
return false
end
return o(t,e,W,Y)
elseif w(t)then
if not w(e)then
return false
end
return o(t,e,T,O)
end
return k()
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
elseif x(e)then
return"!"..tostring(m(s(W(e),Y(e))))
elseif v(e)then
return se(e)
elseif A(e)then
return";("..tostring(m(he(e))).." "..tostring(m(P(e)))..")"
elseif B(e)then
return"$("..tostring(m(H(ae(e)))).." "..tostring(m(te(e)))..")"
elseif V(e)then
return"%("..tostring(m(le(e))).." "..tostring(m(_(ue(e))))..")"
elseif G(e)then
return"@("..tostring(m(H(ke(e)))).." "..tostring(m(ve(e))).." "..tostring(m(_(ge(e))))..")"
elseif Q(e)then
return"^("..tostring(m(we(e))).." "..tostring(m(_(ye(e))))..")"
end
return k()
end
function je(e,t,s)
e=D(e)
local function o(e,a,i,o)
t(a)
s(i(e))
return s(o(e))
end
if v(e)then
t("^")
t(c(e))
return t("^")
elseif a(e)then
return o(e,".",i,n)
elseif r(e)then
return t("_")
elseif w(e)then
return o(e,"#",T,O)
elseif x(e)then
return o(e,"!",W,Y)
elseif qe(e)then
local e=ce(e)
return o(e,"$",(function(e)return H(ae(e))end),te)
else
return k()
end
end
local function o()
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
local function c()
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
local e=o()
function u()return e end
return e
end
function p()
local e=c()
function p()return e end
return e
end
_e=0
ze=1
U=2
ee=3
Te=4
Ae=5
ne=6
Oe=7
Ge=8
xe=9
me=11
Ke=10
local function rt(e)
return p()[e]~=nil
end
local function nt(e)
return{
_e,
e,
}
end
local function it(e)
return u()[e]~=nil
end
local function o(e)
return nt(u()[e])
end
b={U}
local function Ae(e)
local t=Ve(e)
local function o(e)
e[2]=F(e[2])
e[3]=F(e[3])
if A(e[2])or A(e[3])then
local t=at(e)
local a=e[2]
local o=e[3]
local e=Ae(a)
local a=Ae(o)
t[2]=e
t[3]=a
return t
else
return e
end
end
if w(t)then
return o(t)
elseif x(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
E=o("太始初核")
local _e=o("符名")
d=o("化滅")
j=o("式形")
local ft=o("等同")
local yt=o("解算")
local U=o("特定其物")
local f=o("省略一物")
Qe=o("映表")
local wt=o("如若")
local u=o("一類何物")
local ee=o("是非")
local ze=o("其子")
local st=o("爻陽")
local ot=o("爻陰")
local pt=o("引用")
local mt=o("應用")
local dt=o("間空")
local ne=o("連頸")
local me=o("構物")
local xe=o("謬誤")
local ct=o("詞素")
local Oe=o("列序")
local ht=o("首始")
local lt=o("尾末")
local at=o("之物")
local c=o("宇宙亡矣")
local Ke=o("效應")
local Ge=o("註疏")
et=S(E,e(c,f))
local function p(e)
return z(_e,s(E,s(e,b)))
end
local function Te(t)
return p(e(u,e(d,f,t),U))
end
local function c(t,a)
return p(e(u,e(d,e(t),f),a))
end
local function R(t)
return p(e(u,d,e(ee,e(u,t,f))))
end
local et=Te(me)
Be=c(me,_e)
Pe=c(me,Oe)
Fe=R(me)
local vt=Te(xe)
De=c(xe,_e)
Re=c(xe,Oe)
Ue=R(xe)
local bt=Te(ne)
Me=R(ne)
Ce=c(ne,ht)
He=c(ne,lt)
Le=R(ct)
Se=R(dt)
oe=p(e(u,d,e(ee,ft)))
pe=p(e(u,e(d,s(d,f),f),mt))
fe=p(e(u,d,yt))
local Te=c(Oe,e(u,at,f))
Z=p(e(u,d,wt))
Ie=p(e(u,j,pt))
tt=p(e(u,e(j,e(d,f,d)),U))
X=p(e(j,e(E,d)))
ie=p(e(j,e(E,j)))
Ze=p(e(j,j))
local Ze=p(e(u,d,Ge))
Xe=p(e(u,j,Ge))
local c=z(ot,e())
local ie=z(st,e())
local function xe(e,s,h)
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
local function R(e)
return xe(e,function(e)return e end,function(e,e)return false end)
end
local function Xe(e)
while K(e)or A(e)do
e=D(be(e))
end
return e
end
local function Ge(e)
return ae(ce(e))
end
local function Ie(e)
return te(ce(e))
end
local function Oe(e)
if A(e)then
return P(e)
else
return g(e)
end
end
Ne={}
local function me(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not v(e)then
return false
end
if not L(e,Qe)then
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
local function ce(t,a)
return{
t,
1,
function(e)
e=g(e)
if y(e)then
return q(t,{e})
end
if a(e)then
return ie
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
e=g(e)
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
ut={
ce(Fe,w),
{
et,
2,
z,
},
X(Be,w,T),
X(Pe,w,O),
ce(Ue,x),
{
vt,
2,
S,
},
X(De,x,W),
X(Re,x,Y),
ce(Se,r),
{
bt,
2,
s,
},
ce(Me,a),
X(Ce,a,i),
X(He,a,n),
{
oe,
2,
function(e,t,o)
if e==t then
return ie
end
e=g(e)
t=g(t)
if y(e)or y(t)then
return q(oe,{
e,
t,
})
end
if e==t then
return ie
end
local function o(a,t,e)
return q(Z,{
a,
t,
e,
})
end
local function s(e,t)
return o(e,t,c)
end
N(not y(e))
local function o(o,a,e,t)
return s(q(oe,{
e(o),
e(a),
}),q(oe,{
t(o),
t(a),
}))
end
if r(e)then
if not r(e)then
return c
end
return ie
elseif v(e)then
if not v(t)then
return c
end
if L(e,t)then
return ie
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
elseif x(e)then
if not x(t)then
return c
end
return o(e,t,W,Y)
end
return k()
end,
},
{
pe,
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
return C(s,o)
end,
},
{
fe,
2,
function(e,t,a)
local e=me(e)
if e==false then
return a()
end
return I(e,t)
end,
},
ce(Le,v),
{
Te,
1,
function(e,t)
e=g(e)
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
Z,
3,
function(e,a,o,t)
e=g(e)
if y(e)then
return q(Z,{
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
if L(e,st)then
return a
end
if L(e,ot)then
return o
end
return t()
end,
},
{
Ze,
2,
de,
},
}
local X
X=l
local function c(e,o)
if e==o then
return true
end
local a={e}
local o={o}
while#a~=0 do
if#a~=#o then
return false
end
local i={}
local n={}
local s={}
local h={}
do
local e=0
while e<#a do
if a[e+1]==o[e+1]then
else
je(a[e+1],function(e)return t(i,e)end,function(e)return t(s,e)end)
je(o[e+1],function(e)return t(n,e)end,function(e)return t(h,e)end)
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
a=s
o=h
end
return#o==0
end
local function Z(Z)
local P,y,c,l,m,h,T,x,K,g,B,V,Y,O,W,R,L,F,H,A,D,k,w,G,Q,X
function c()
return#P==y
end
function l()
N(not c())
local e=string.sub(P,y+1,y+1)
y=y+1
return e
end
function m(e)
N(string.sub(P,y,y)==e)
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
function x()
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
function K()
if c()then
return false
end
local e=l()
local t=""
if not F(e)then
m(e)
return false
end
while F(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if F(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if it(t)then
return o(t)
else
return h("Not Symbol"..tostring(t))
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
local t=J()
local a=t
local function i(a)
local e=J()
M(t,s(a,e))
t=e
end
while true do
x()
if c()then
return h()
end
e=l()
if e==")"then
M(t,b)
return a
end
if e=="."then
x()
local o=H()
M(t,o)
x()
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
local e=H()
i(e)
end
end
function B()
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
return h()
end
if not a(e)then
return h()
end
return z(i(e),n(e))
end
function V()
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
function H()
x()
local e={
g,
X,
B,
V,
Y,
O,
W,
R,
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
function A(e)
if e==false then
return h()
end
return e
end
function D()
return not c()
end
function k(e)
A(D())
A(l()==e)
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
B,
V,
Y,
O,
W,
R,
L,
}
else
e={
g,
Q,
B,
V,
Y,
O,
W,
R,
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
function G(a)
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
return e(ee,a)
elseif o=="@"then
local t=w()
return e(u,e(d,s(a,f),f),t)
elseif o=="?"then
return e(u,d,e(ee,a))
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
return e(ze,_(a))
else
m(o)
return a
end
end
function Q()
if c()then
return false
end
local t=l()
if t=="&"then
A(D())
local t=l()
if t=="+"then
local t=w()
return e(j,e(E,t))
else
m(t)
end
local t=w()
return e(j,t)
elseif t==":"then
A(D())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(j,e(d,f,t)),U)
elseif t==">"then
local t=w()
return e(u,e(d,f,t),U)
else
m(t)
end
local t=w()
return e(u,t,U)
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
return e(u,t,f)
else
m(t)
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
if v(e)then
return e
end
return p(e)
end
P=Z
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
local e=g()
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
m(e)
return false
end
local e=g()
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
Y=t("$",function(e,t)
local e=me(e)
if e==false then
return h()
end
return I(e,t)
end)
O=t("%",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return h()end)
return q(t,e)
end)
W=d("@",function(o,a,e)
local t=xe(e,function(e)return e end,function(e,e)return h()end)
local e=me(o)
if e==false then
return h()
end
return Je(e,a,t)
end)
R=t("^",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return h()end)
return C(t,e)
end)
L=t(";",function(e,t)return de(e,t)end)
return H()
end
local function q(y)
local function t(h,l)
if v(h)then
return se(h)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=R(h)
if e~=false and#e==3 and c(e[1],u)then
local o=R(e[2])
if o~=false and#o==3 and c(o[1],d)then
local h=o[2]
local r=R(h)
if r~=false and#r==1 and c(o[3],f)then
return s(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),f)and c(o[3],f)then
return s(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,f)and c(e[3],U)then
return s(":>"..tostring(t(o[3],true)))
end
end
local a=R(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],ee)then
return s(tostring(t(a[2],true)).."?")
end
if o~=false and#o==2 and c(e[3],U)and c(o[1],j)then
local e=R(o[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],f)then
return s(":&>"..tostring(t(e[3],true)))
end
end
local a
if c(e[3],f)then
a="_"
elseif c(e[3],U)then
a=""
else
a=t(e[3],true)
end
return s(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],j)then
local a=R(e[2])
if a~=false and#a==2 and c(a[1],E)then
return s("&+"..tostring(t(a[2],true)))
end
return s("&"..tostring(t(e[2],true)))
elseif c(e[1],ee)then
return s(tostring(t(e[2],true)).."~")
elseif c(e[1],E)then
return s("+"..tostring(t(e[2],true)))
elseif c(e[1],ze)then
local e=R(e[2])
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
return m(h)
else
return m(p(h))
end
end
local e=Z(m(y))
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
local a=T(e)
local o=O(e)
local e=R(o)
if e~=false and#e==2 and c(a,_e)and c(e[1],E)then
return t(e[2],false)
end
return"#"..tostring(q(s(a,o)))
elseif x(e)then
return"!"..tostring(q(s(W(e),Y(e))))
elseif v(e)then
return se(e)
elseif A(e)then
return";("..tostring(q(he(e))).." "..tostring(q(P(e)))..")"
elseif B(e)then
return"$("..tostring(q(H(ae(e)))).." "..tostring(q(te(e)))..")"
elseif V(e)then
return"%("..tostring(q(le(e))).." "..tostring(q(_(ue(e))))..")"
elseif G(e)then
return"@("..tostring(q(H(ke(e)))).." "..tostring(q(ve(e))).." "..tostring(q(_(ge(e))))..")"
elseif Q(e)then
return"^("..tostring(q(we(e))).." "..tostring(q(_(ye(e))))..")"
end
return k()
end
local function V(r)
local l=J()
local n={function(e)return M(l,e)end}
local e=0
local function i(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function d(e)
if not e then
return i()
end
end
local function u()
d(#r>e)
local t=string.sub(r,e+1,e+1)
e=e+1
return t
end
local h={}
while#n~=0 do
local a={}
for e,o in ipairs(n)do
local e=u()
local function n(n)
local i=J()
local e=J()
t(a,function(e)return M(i,e)end)
t(a,function(t)return M(e,t)end)
o(n(i,e))
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
if rt(e)then
o(nt(e))
else
return i("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
n(s)
elseif e=="#"then
n(z)
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
t(h,function()
if e==false or n==false then
return k()
else
local e=me(e)
if e==false then
return i()
else
o(I(e,n))
end
end
end)
elseif e=="_"then
o(b)
else
return i()
end
end
n=a
end
d(e==#r)
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
local e={}
local a={}
for i,o in ipairs(o)do
je(o,function(a)return t(e,a)end,function(e)return t(a,e)end)
end
return{
e,
a,
}
end
local function L(e)
local t={e}
local e=""
while#t~=0 do
local a=c(t)
local o=a[1]
local i=a[2]
for o,a in ipairs(o)do
e=tostring(e)..tostring(a)
end
t=i
end
return e
end
local function k(e)
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
local j=p(s(ze,s(s(Ke,s(s(u,s(at,s(f,b))),b)),b)))
local N=p(s(ze,s(s(Ke,s(ne,b)),b)))
local function U(a,t)
return z(N,e(a,t))
end
local function M(e)
return z(j,e)
end
local function p(m,y,u,f,s)
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
if l(w,j)then
t=h(t)
if a(t)then
local a=i(t)
local e=h(n(t))
if r(e)then
if s==false then
local a=a
local e=f
local function t()return m(a,e)end
return c(t)
else
local t
t=m
local e
e=y
local a=a
local i=f
local function o()return p(t,e,C(s,a),i)end
return c(o)
end
end
end
elseif l(w,N)then
t=h(t)
if a(t)then
local l=i(t)
local t=h(n(t))
if a(t)then
local a=i(t)
local t=h(n(t))
if r(t)then
if s==false then
local t
t=m
local e
e=y
local o=l
local a=a
local i=f
local function n()return p(t,e,o,i,a)end
return c(n)
else
local i
i=m
local t
t=y
local l=l
local r=a
local h=f
local n=s
local a=o("序甲")
local function o()return p(i,t,l,h,z(d,e(e(a),v(e(re(r),a),re(n)))))end
return c(o)
end
end
end
end
end
end
if s==false then
return c(function()return y(u,f,m)end)
else
return c(function()return y(u,f,function(e,t)return c(function()return p(m,y,C(s,{e}),t)end)end)end)
end
end
local function d(e,t,o,a)
return p(e,t,o,a)
end
local function l(n,i,a,o)
return E(p((function(t,e)return k(n(t,e))end),(function(e,a,t)return k(i(e,a,function(e,a)return E(t(e,a))end))end),a,o))
end
local t={}
t.new_comment=de
t.comment_p=A
t.comment_comment=he
t.comment_x=P
t.un_comment_all=be
t.can_new_symbol_p=it
t.new_symbol=o
t.symbol_p=v
t.un_symbol=se
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=b
t.null_p=r
t.new_data=z
t.data_p=w
t.data_name=T
t.data_list=O
t.new_error=S
t.error_p=x
t.error_name=W
t.error_list=Y
t.just_p=K
t.evaluate=I
t.apply=C
t.force_all_rec=F
t.force_uncomment_all_rec=Ae
t.jsArray_to_list=_
t.maybe_list_to_jsArray=R
t.new_list=e
t.un_just_all=D
t.un_just_comment_all=Xe
t.delay_p=qe
t.delay_just_p=y
t.delay_env=Ge
t.delay_x=Ie
t.force_all=h
t.force1=g
t.force_uncomment1=Oe
t.force_uncomment_all=Ve
t.env_null_v=Ne
t.env_set=Ee
t.env_get=We
t.env2val=H
t.env_foreach=Ye
t.val2env=me
t.equal_p=X
t.simple_print=m
t.complex_parse=Z
t.complex_print=q
t.machinetext_parse=V
t.machinetext_print=L
t.trampoline_return=k
t.trampoline_delay=c
t.run_trampoline=E
t.return_effect_systemName=j
t.bind_effect_systemName=N
t.new_effect_bind=U
t.new_effect_return=M
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
