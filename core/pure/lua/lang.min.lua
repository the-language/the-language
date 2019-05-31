local function t(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local q,N,U,Ke,Qe,X,oe,Te,Ae,ie,ne,se,ye,fe,Oe,le,A,de,J,ze,g,c,ue,s,a,i,n,v,r,E,w,T,O,H,x,C,M,Q,mt,I,P,Z,ee,Ge,G,je,xe,ge,k,B,re,he,W,K,be,ve,F,V,o,l,Y,ct,_,d,j,Fe,ut,Xe,Je,Ue,Ve,Ye,Pe,We,Ce,Me,Se,Ie,ae,pe,_e,te,Ne,nt,D,we,lt,dt,L,z,e,R,qe,y,ce,m,b,h,He,De,Ee,Re,st,S,Be,ht,rt,p,Le,ot,it,at,me,tt,u,f,ke,et,Ze
function q()
error("TheLanguage PANIC")
end
function N(e)
if not e then
return q()
end
end
function le(e,t)
return{
fe,
e,
t,
}
end
function A(e)
return e[1]==fe
end
function de(e)
return e[2]
end
function J(e)
return e[3]
end
function ze(e)
while A(e)do
e=J(e)
end
return e
end
function g(e)
return e[1]==Ke
end
function c(e)
return e[2]
end
function ue(e)
return U()[c(e)]
end
function s(e,t)
return{
Qe,
e,
t,
}
end
function a(e)
return e[1]==Qe
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
function E(e,t)
return{
oe,
e,
t,
}
end
function w(e)
return e[1]==oe
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function H(t,e)
return{
Te,
t,
e,
}
end
function x(e)
return e[1]==Te
end
function C(e)
return e[2]
end
function M(e)
return e[3]
end
function Q(e)
return e[1]==Ae
end
function mt(e)
return e[2]
end
function I(e,t)
return{
ie,
e,
t,
}
end
function P(e)
return e[1]==ie
end
function Z(e)
return e[2]
end
function ee(e)
return e[3]
end
function Ge(t,a,e)
return{
se,
t,
a,
e,
}
end
function G(e)
return e[1]==se
end
function je(e)
return e[2]
end
function xe(e)
return e[3]
end
function ge(e)
return e[4]
end
function k(t,e)
return{
ne,
t,
e,
}
end
function B(e)
return e[1]==ne
end
function re(e)
return e[2]
end
function he(e)
return e[3]
end
function W(t,e)
return{
ye,
t,
e,
}
end
function K(e)
return e[1]==ye
end
function be(e)
return e[2]
end
function ve(e)
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
function V()
return{Oe}
end
function o(e)
return e[1]==Oe
end
function l(e,t)
if e==t then
return
end
e[1]=Ae
e[2]=t
e[3]=false
e[4]=false
end
function Y(e,t)
N(o(e))
N(not o(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function ct(t)
local e=V()
Y(e,t)
return e
end
function L(t,e)
if t==e then
return true
end
if c(t)==c(e)then
l(t,e)
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
l(t,e)
end
return e
end
function qe(e)
return P(e)or G(e)or B(e)or K(e)
end
function y(e)
return Q(e)or qe(e)
end
function ce(e)
if P(e)then
return e
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return q()
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
local e,h,s
function h(t)
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
h(a)
if y(a)then
t(o,e)
return m(a,n,{
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
return s(ut)
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
e=b(e)
a=a+1
end
end
while y(e)do
local h=f(e)
if n[h]==true then
return i()
end
if r[h]==true then
a[1]=true
if P(e)then
return i()
elseif B(e)then
local t=re(e)
local e=he(e)
local o={
Xe,
Je,
Ue,
Ve,
Ye,
Pe,
We,
Ce,
Me,
Se,
Ie,
}
local n=false
for e=1,#o do
local e=o[e]
if u(e,t)then
n=true
break
end
end
if n then
N(#e==1)
N(a[2]==false)
local e=m(e[1],d(),a)
if a[2]then
return s(k(t,{e}))
else
return q()
end
end
if u(t,ae)then
return i()
elseif u(t,pe)then
return i()
elseif u(t,_e)then
return i()
elseif u(t,te)then
N(#e==3)
N(a[2]==false)
local t=m(e[1],d(),a)
if a[2]then
return s(k(te,{
t,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif G(e)then
return i()
elseif K(e)then
return i()
end
return q()
end
r[h]=true
t(o,e)
e=b(e)
end
return h(e)
end
function b(a)
local e=R(a)
local t
N(not Q(e))
if P(e)then
t=rt(Z(e),ee(e),a)
elseif G(e)then
t=at(je(e),xe(e),ge(e),a)
elseif B(e)then
t=it(re(e),he(e),a)
elseif K(e)then
t=ot(be(e),ve(e),a)
else
t=e
end
t=R(t)
l(e,t)
return t
end
function h(e)
return m(e)
end
function He(e)
while y(e)or A(e)do
e=h(ze(e))
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
function Re(t,a,o)
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
function st(t,a)
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
function S(a)
local o=v
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return E(Fe,e(o))
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
function ht(e,d,l,u)
local h={}
local s={}
local e=R(e)
local o=true
while true do
if r(e)then
return u(s,h)
elseif A(e)then
t(s,de(e))
e=J(e)
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
function rt(d,o,l)
local s=b(o)
if y(s)then
return l
end
local function o()return H(_,e(D,e(_e,e(S(d),s))))end
if a(s)then
return ht(s,o,function()return l end,function(s,e)
if#s~=0 then
error("WIP")
end
if u(e[1],we)then
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
return Ge(d,i,o)
elseif u(e[1],lt)then
if#e==1 then
return o()
end
local s=h(I(d,e[2]))
if not w(s)then
return o()
end
local h=b(T(s))
if y(h)then
return l
end
if not g(h)then
return o()
end
if not L(h,j)then
return o()
end
local s=b(O(s))
if y(s)then
return l
end
if not a(s)then
return o()
end
local i=i(s)
local a=b(n(s))
if y(a)then
return l
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
return W(i,o)
elseif u(e[1],D)then
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
return k(i,o)
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
return W(i,o)
end
end)
elseif r(s)then
return s
elseif p(s)then
return Re(d,s,o())
elseif x(s)then
return o()
end
return q()
end
function p(e)
return g(e)or w(e)
end
function ot(l,t,u)
local function o()return H(_,e(D,e(pe,e(l,z(t)))))end
l=b(l)
if y(l)then
return u
end
if not w(l)then
return o()
end
local e=h(T(l))
if not(g(e)and L(e,d))then
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
local d=De
local h=0
while not r(e)do
if p(e)then
local a=v
do
local e=#t-1
while e>=h do
a=s(t[e+1],a)
e=e-1
end
end
d=Ee(d,e,a)
h=#t
e=v
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
function it(i,t,o)
local function a()return H(_,e(D,e(i,z(t))))end
for e=1,#Le do
local e=Le[e]
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
function at(i,o,t,a)
local function a()return H(_,e(we,e(S(i),o,z(t))))end
if u(o,Ne)then
if#t~=1 then
return a()
end
return t[1]
elseif u(o,nt)then
if#t~=2 then
return a()
end
return tt(i,t[1],t[2],a)
elseif u(o,dt)then
if#t~=2 then
return a()
end
return le(t[1],I(i,t[2]))
end
return a()
end
function me(t)
return e(we,Ne,t)
end
function tt(m,h,w,f)
h=F(h)
local l={}
local c=false
local o=h
while not r(o)do
if p(o)then
t(l,o)
c=true
o=v
elseif a(o)then
t(l,i(o))
o=n(o)
else
return f()
end
end
local o
if c then
o=z(l)
else
o=h
end
local a={}
Be(m,function(o,e)
do
local e=0
while e<#l do
if u(l[e+1],o)then
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
t=s(me(st(m,a[e+1])),t)
e=e-1
end
end
return E(d,e(h,s(me(E(d,e(i,w))),t)))
end
function u(e,t)
if e==t then
return true
end
e=h(e)
t=h(t)
if e==t then
return true
end
local function o(e,t,o,a)
if u(o(e),o(t))and u(a(e),a(t))then
l(e,t)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
l(e,v)
l(t,v)
return true
elseif g(e)then
if not g(t)then
return false
end
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif x(e)then
if not x(t)then
return false
end
return o(e,t,C,M)
elseif w(e)then
if not w(t)then
return false
end
return o(e,t,T,O)
end
return q()
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
elseif x(e)then
return"!"..tostring(f(s(C(e),M(e))))
elseif g(e)then
return ue(e)
elseif A(e)then
return";("..tostring(f(de(e))).." "..tostring(f(J(e)))..")"
elseif P(e)then
return"$("..tostring(f(S(Z(e)))).." "..tostring(f(ee(e)))..")"
elseif B(e)then
return"%("..tostring(f(re(e))).." "..tostring(f(z(he(e))))..")"
elseif G(e)then
return"@("..tostring(f(S(je(e)))).." "..tostring(f(xe(e))).." "..tostring(f(z(ge(e))))..")"
elseif K(e)then
return"^("..tostring(f(be(e))).." "..tostring(f(z(ve(e))))..")"
end
return q()
end
function ke(e,t,s)
e=R(e)
local function o(e,i,o,a)
t(i)
s(o(e))
return s(a(e))
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
elseif x(e)then
return o(e,"!",C,M)
elseif qe(e)then
local e=ce(e)
return o(e,"$",(function(e)return S(Z(e))end),ee)
else
return q()
end
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
local function l()
local e=et()
function l()return e end
return e
end
function U()
local e=Ze()
function U()return e end
return e
end
Ke=0
Qe=1
X=2
oe=3
Te=4
Ae=5
ie=6
ne=7
se=8
ye=9
fe=11
Oe=10
local function mt(e)
return U()[e]~=nil
end
local function Qe(e)
return{
Ke,
e,
}
end
local function Ke(e)
return l()[e]~=nil
end
local function o(e)
return Qe(l()[e])
end
v={X}
local function Oe(e)
local t=He(e)
local function o(e)
e[2]=F(e[2])
e[3]=F(e[3])
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
elseif x(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
_=o("太始初核")
local ye=o("符名")
d=o("化滅")
j=o("式形")
local bt=o("等同")
local vt=o("解算")
local U=o("特定其物")
local m=o("省略一物")
Fe=o("映表")
local ft=o("如若")
local l=o("一類何物")
local X=o("是非")
local fe=o("其子")
local Ze=o("爻陽")
local et=o("爻陰")
local wt=o("引用")
local pt=o("應用")
local yt=o("間空")
local se=o("連頸")
local ie=o("構物")
local ne=o("謬誤")
local ct=o("詞素")
local Ae=o("列序")
local gt=o("首始")
local rt=o("尾末")
local at=o("之物")
local c=o("宇宙亡矣")
local ot=o("效應")
local tt=o("註疏")
ut=H(_,e(c,m))
local function p(e)
return E(ye,s(_,s(e,v)))
end
local function Te(t)
return p(e(l,e(d,m,t),U))
end
local function c(a,t)
return p(e(l,e(d,e(a),m),t))
end
local function oe(t)
return p(e(l,d,e(X,e(l,t,m))))
end
local st=Te(ie)
Xe=c(ie,ye)
Je=c(ie,Ae)
Ue=oe(ie)
local ht=Te(ne)
Ve=c(ne,ye)
Ye=c(ne,Ae)
Pe=oe(ne)
local it=Te(se)
We=oe(se)
Ce=c(se,gt)
Me=c(se,rt)
Se=oe(ct)
Ie=oe(yt)
ae=p(e(l,d,e(X,bt)))
pe=p(e(l,e(d,s(d,m),m),pt))
_e=p(e(l,d,vt))
local Te=c(Ae,e(l,at,m))
te=p(e(l,d,ft))
Ne=p(e(l,j,wt))
nt=p(e(l,e(j,e(d,m,d)),U))
D=p(e(j,e(_,d)))
we=p(e(j,e(_,j)))
lt=p(e(j,j))
local Ae=p(e(l,d,tt))
dt=p(e(l,j,tt))
local c=E(et,e())
local ne=E(Ze,e())
local function we(e,h,s)
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
return we(e,function(e)return e end,function(e,e)return false end)
end
local function Ne(e)
while Q(e)or A(e)do
e=R(ze(e))
end
return e
end
local function tt(e)
return Z(ce(e))
end
local function rt(e)
return ee(ce(e))
end
local function nt(e)
if A(e)then
return J(e)
else
return b(e)
end
end
De={}
local function ie(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not g(e)then
return false
end
if not L(e,Fe)then
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
local function ce(t,a)
return{
t,
1,
function(e)
e=b(e)
if y(e)then
return k(t,{e})
end
if a(e)then
return ne
end
return c
end,
}
end
local function oe(t,o,i)
return{
t,
1,
function(e,a)
e=b(e)
if y(e)then
return k(t,{e})
end
if o(e)then
return i(e)
end
return a()
end,
}
end
Le={
ce(Ue,w),
{
st,
2,
E,
},
oe(Xe,w,T),
oe(Je,w,O),
ce(Pe,x),
{
ht,
2,
H,
},
oe(Ve,x,C),
oe(Ye,x,M),
ce(Ie,r),
{
it,
2,
s,
},
ce(We,a),
oe(Ce,a,i),
oe(Me,a,n),
{
ae,
2,
function(e,t,o)
if e==t then
return ne
end
e=b(e)
t=b(t)
if y(e)or y(t)then
return k(ae,{
e,
t,
})
end
if e==t then
return ne
end
local function o(e,t,a)
return k(te,{
e,
t,
a,
})
end
local function s(e,t)
return o(e,t,c)
end
N(not y(e))
local function o(o,a,t,e)
return s(k(ae,{
t(o),
t(a),
}),k(ae,{
e(o),
e(a),
}))
end
if r(e)then
if not r(e)then
return c
end
return ne
elseif g(e)then
if not g(t)then
return c
end
if L(e,t)then
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
elseif x(e)then
if not x(t)then
return c
end
return o(e,t,C,M)
end
return q()
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
return W(s,o)
end,
},
{
_e,
2,
function(e,t,a)
local e=ie(e)
if e==false then
return a()
end
return I(e,t)
end,
},
ce(Se,g),
{
Te,
1,
function(e,t)
e=b(e)
if y(e)then
return k(Te,{e})
end
if not a(e)then
return t()
end
return i(e)
end,
},
{
te,
3,
function(e,o,a,t)
e=b(e)
if y(e)then
return k(te,{
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
if L(e,Ze)then
return o
end
if L(e,et)then
return a
end
return t()
end,
},
{
Ae,
2,
le,
},
}
local ae
ae=u
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
ke(a[e+1],function(e)return t(i,e)end,function(e)return t(s,e)end)
ke(o[e+1],function(e)return t(n,e)end,function(e)return t(h,e)end)
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
local function te(ee)
local S,y,c,u,f,h,x,T,J,b,D,R,G,P,B,F,L,O,C,A,M,q,w,Q,K,Z
function c()
return#S==y
end
function u()
N(not c())
local e=string.sub(S,y+1,y+1)
y=y+1
return e
end
function f(e)
N(string.sub(S,y,y)==e)
y=y-1
end
function h(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function x(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=u()
if not x(e)then
f(e)
return false
end
while x(e)and not c()do
e=u()
end
if not x(e)then
f(e)
end
return true
end
function J()
if c()then
return false
end
local e=u()
local t=""
if not O(e)then
f(e)
return false
end
while O(e)and not c()do
t=tostring(t)..tostring(e)
e=u()
end
if O(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Ke(t)then
return o(t)
else
return h("Not Symbol"..tostring(t))
end
end
function b()
if c()then
return false
end
local e=u()
if e~="("then
f(e)
return false
end
local t=V()
local a=t
local function i(a)
local e=V()
Y(t,s(a,e))
t=e
end
while true do
T()
if c()then
return h()
end
e=u()
if e==")"then
Y(t,v)
return a
end
if e=="."then
T()
local o=C()
Y(t,o)
T()
if c()then
return h()
end
e=u()
if e~=")"then
return h()
end
return a
end
f(e)
local e=C()
i(e)
end
end
function D()
if c()then
return false
end
local e=u()
if e~="#"then
f(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
return E(i(e),n(e))
end
function R()
if c()then
return false
end
local e=u()
if e~="!"then
f(e)
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
if x(e)then
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
T()
local e={
b,
Z,
D,
R,
G,
P,
B,
F,
L,
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
function A(e)
if e==false then
return h()
end
return e
end
function M()
return not c()
end
function q(e)
A(M())
A(u()==e)
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
J,
a,
D,
R,
G,
P,
B,
F,
L,
}
else
e={
b,
K,
D,
R,
G,
P,
B,
F,
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
return h()
end
function Q(a)
if c()then
return a
end
local o=u()
if o=="."then
local t=w()
return e(l,e(d,e(a),m),t)
elseif o==":"then
local t=w()
return e(l,t,a)
elseif o=="~"then
return e(X,a)
elseif o=="@"then
local t=w()
return e(l,e(d,s(a,m),m),t)
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
f(e)
break
end
end
return e(fe,z(a))
else
f(o)
return a
end
end
function K()
if c()then
return false
end
local t=u()
if t=="&"then
A(M())
local t=u()
if t=="+"then
local t=w()
return e(j,e(_,t))
else
f(t)
end
local t=w()
return e(j,t)
elseif t==":"then
A(M())
local t=u()
if t=="&"then
q(">")
local t=w()
return e(l,e(j,e(d,m,t)),U)
elseif t==">"then
local t=w()
return e(l,e(d,m,t),U)
else
f(t)
end
local t=w()
return e(l,t,U)
elseif t=="+"then
local t=w()
return e(_,t)
elseif t=="["then
local e=w()
q("]")
return Q(e)
elseif t=="_"then
q(":")
local t=w()
return e(l,t,m)
else
f(t)
local e=J()
if e==false then
return false
end
return Q(e)
end
end
function Z()
local e=K()
if e==false then
return false
end
if g(e)then
return e
end
return p(e)
end
S=ee
y=0
local function e(t,o)
return function()
if c()then
return false
end
local e=u()
if e~=t then
f(e)
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
local e=u()
if e~=t then
f(e)
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
if not a(t)then
return h()
end
local o=n(t)
if not(a(o)and r(n(o)))then
return h()
end
return s(i(e),i(t),i(o))
end
end
G=e("$",function(e,t)
local e=ie(e)
if e==false then
return h()
end
return I(e,t)
end)
P=e("%",function(t,e)
local e=we(e,function(e)return e end,function(e,e)return h()end)
return k(t,e)
end)
B=s("@",function(o,a,e)
local t=we(e,function(e)return e end,function(e,e)return h()end)
local e=ie(o)
if e==false then
return h()
end
return Ge(e,a,t)
end)
F=e("^",function(e,t)
local t=we(t,function(e)return e end,function(e,e)return h()end)
return W(e,t)
end)
L=e(";",function(t,e)return le(t,e)end)
return C()
end
local function k(y)
local function t(r,u)
if g(r)then
return ue(r)
end
local function s(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and c(e[1],l)then
local o=D(e[2])
if o~=false and#o==3 and c(o[1],d)then
local h=o[2]
local r=D(h)
if r~=false and#r==1 and c(o[3],m)then
return s(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),m)and c(o[3],m)then
return s(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,m)and c(e[3],U)then
return s(":>"..tostring(t(o[3],true)))
end
end
local a=D(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],X)then
return s(tostring(t(a[2],true)).."?")
end
if o~=false and#o==2 and c(e[3],U)and c(o[1],j)then
local e=D(o[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],m)then
return s(":&>"..tostring(t(e[3],true)))
end
end
local a=c(e[3],m)and"_"or c(e[3],U)and""or t(e[3],true)
return s(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],j)then
local a=D(e[2])
if a~=false and#a==2 and c(a[1],_)then
return s("&+"..tostring(t(a[2],true)))
end
return s("&"..tostring(t(e[2],true)))
elseif c(e[1],X)then
return s(tostring(t(e[2],true)).."~")
elseif c(e[1],_)then
return s("+"..tostring(t(e[2],true)))
elseif c(e[1],fe)then
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
if u then
return f(r)
else
return f(p(r))
end
end
local e=te(f(y))
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
local a=T(e)
local o=O(e)
local e=D(o)
if e~=false and#e==2 and c(a,ye)and c(e[1],_)then
return t(e[2],false)
end
return"#"..tostring(k(s(a,o)))
elseif x(e)then
return"!"..tostring(k(s(C(e),M(e))))
elseif g(e)then
return ue(e)
elseif A(e)then
return";("..tostring(k(de(e))).." "..tostring(k(J(e)))..")"
elseif P(e)then
return"$("..tostring(k(S(Z(e)))).." "..tostring(k(ee(e)))..")"
elseif B(e)then
return"%("..tostring(k(re(e))).." "..tostring(k(z(he(e))))..")"
elseif G(e)then
return"@("..tostring(k(S(je(e)))).." "..tostring(k(xe(e))).." "..tostring(k(z(ge(e))))..")"
elseif K(e)then
return"^("..tostring(k(be(e))).." "..tostring(k(z(ve(e))))..")"
end
return q()
end
local function P(r)
local u=V()
local n={function(e)return Y(u,e)end}
local a=0
local function o(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function l(e)
if not e then
return o()
end
end
local function d()
l(#r>a)
local e=string.sub(r,a+1,a+1)
a=a+1
return e
end
local h={}
while#n~=0 do
local a={}
for e=1,#n do
local i=n[e]
local e=d()
local function n(n)
local e=V()
local o=V()
t(a,function(t)return Y(e,t)end)
t(a,function(e)return Y(o,e)end)
i(n(e,o))
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
i(Qe(e))
else
return o("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
n(s)
elseif e=="#"then
n(E)
elseif e=="!"then
n(H)
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
return q()
else
local e=ie(e)
if e==false then
return o()
else
i(I(e,n))
end
end
end)
elseif e=="_"then
i(v)
else
return o()
end
end
n=a
end
l(a==#r)
do
local e=#h-1
while e>=0 do
h[e+1]()
e=e-1
end
end
return u
end
local function c(o)
local e={}
local a={}
for i=1,#o do
local o=o[i]
ke(o,function(a)return t(e,a)end,function(e)return t(a,e)end)
end
return{
e,
a,
}
end
local function U(e)
local t={e}
local e=""
while#t~=0 do
local a=c(t)
local o=a[1]
local i=a[2]
for a=1,#o do
local t=o[a]
e=tostring(e)..tostring(t)
end
t=i
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
local function _(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local j=p(s(fe,s(s(ot,s(s(l,s(at,s(m,v))),v)),v)))
local N=p(s(fe,s(s(ot,s(se,v)),v)))
local function Y(a,t)
return E(N,e(a,t))
end
local function L(e)
return E(j,e)
end
local function p(y,f,l,m,s)
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
if u(w,j)then
t=h(t)
if a(t)then
local a=i(t)
local e=h(n(t))
if r(e)then
if s==false then
local a=a
local t=m
local function e()return y(a,t)end
return c(e)
else
local t
t=y
local e
e=f
local o=a
local a=m
local function i()return p(t,e,W(s,o),a)end
return c(i)
end
end
end
elseif u(w,N)then
t=h(t)
if a(t)then
local l=i(t)
local t=h(n(t))
if a(t)then
local i=i(t)
local t=h(n(t))
if r(t)then
if s==false then
local t
t=y
local e
e=f
local n=l
local i=i
local o=m
local function a()return p(t,e,n,o,i)end
return c(a)
else
local a
a=y
local t
t=f
local n=l
local i=i
local h=m
local r=s
local o=o("序甲")
local function s()return p(a,t,n,h,E(d,e(e(o),v(e(me(i),o),me(r)))))end
return c(s)
end
end
end
end
end
end
if s==false then
return c(function()return f(l,m,y)end)
else
return c(function()return f(l,m,function(t,e)return c(function()return p(y,f,W(s,{t}),e)end)end)end)
end
end
local function l(o,t,e,a)
return p(o,t,e,a)
end
local function d(i,o,t,a)
return _(p((function(e,t)return q(i(e,t))end),(function(a,t,e)return q(o(a,t,function(t,a)return _(e(t,a))end))end),t,a))
end
local t={}
t.new_comment=le
t.comment_p=A
t.comment_comment=de
t.comment_x=J
t.un_comment_all=ze
t.can_new_symbol_p=Ke
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=g
t.un_symbol=ue
t.New_Construction=New_Construction
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.Null_V=Null_V
t.null_v=v
t.null_p=r
t.New_Data=New_Data
t.new_data=E
t.data_p=w
t.data_name=T
t.data_list=O
t.New_Error=New_Error
t.new_error=H
t.error_p=x
t.error_name=C
t.error_list=M
t.just_p=Q
t.evaluate=I
t.apply=W
t.force_all_rec=F
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=z
t.maybe_list_to_jsArray=D
t.new_list=e
t.un_just_all=R
t.un_just_comment_all=Ne
t.delay_p=qe
t.delay_just_p=y
t.delay_env=tt
t.delay_x=rt
t.force_all=h
t.force1=b
t.force_uncomment1=nt
t.force_uncomment_all=He
t.env_null_v=De
t.env_set=Ee
t.env_get=Re
t.env2val=S
t.env_foreach=Be
t.val2env=ie
t.equal_p=ae
t.simple_print=f
t.complex_parse=te
t.complex_print=k
t.machinetext_parse=P
t.machinetext_print=U
t.trampoline_return=q
t.trampoline_delay=c
t.run_trampoline=_
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=j
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=N
t.new_effect_bind=Y
t.new_effect_return=L
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
