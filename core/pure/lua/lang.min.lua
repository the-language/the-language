local function t(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local q,N,R,We,X,Z,re,se,he,ye,Te,ge,Fe,Oe,Ae,le,A,ue,V,be,g,p,me,s,a,i,n,v,r,E,w,T,O,H,j,F,W,P,ct,I,B,oe,te,Ce,G,qe,ve,pe,k,J,ie,ne,M,Q,ke,we,L,K,o,u,C,mt,z,d,x,Be,at,Me,Pe,Ye,Se,Ie,Ne,He,De,Le,Re,Ue,ae,_e,ze,ee,Ve,nt,Y,fe,ot,it,c,_,e,D,Ee,y,de,f,b,h,Xe,Ke,je,Qe,st,S,Je,dt,ut,U,Ge,lt,rt,ht,ce,tt,l,m,xe,Ze,et
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
Oe,
e,
t,
}
end
function A(e)
return e[1]==Oe
end
function ue(e)
return e[2]
end
function V(e)
return e[3]
end
function be(e)
while A(e)do
e=V(e)
end
return e
end
function g(e)
return e[1]==We
end
function p(e)
return e[2]
end
function me(e)
return R()[p(e)]
end
function s(t,e)
return{
X,
t,
e,
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
return e[1]==Z
end
function E(t,e)
return{
re,
t,
e,
}
end
function w(e)
return e[1]==re
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function H(t,e)
return{
se,
t,
e,
}
end
function j(e)
return e[1]==se
end
function F(e)
return e[2]
end
function W(e)
return e[3]
end
function P(e)
return e[1]==he
end
function ct(e)
return e[2]
end
function I(e,t)
return{
ye,
e,
t,
}
end
function B(e)
return e[1]==ye
end
function oe(e)
return e[2]
end
function te(e)
return e[3]
end
function Ce(a,e,t)
return{
ge,
a,
e,
t,
}
end
function G(e)
return e[1]==ge
end
function qe(e)
return e[2]
end
function ve(e)
return e[3]
end
function pe(e)
return e[4]
end
function k(e,t)
return{
Te,
e,
t,
}
end
function J(e)
return e[1]==Te
end
function ie(e)
return e[2]
end
function ne(e)
return e[3]
end
function M(t,e)
return{
Fe,
t,
e,
}
end
function Q(e)
return e[1]==Fe
end
function ke(e)
return e[2]
end
function we(e)
return e[3]
end
function L(e)
local e=h(e)
local function t(e)
e[2]=L(e[2])
e[3]=L(e[3])
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
function K()
return{Ae}
end
function o(e)
return e[1]==Ae
end
function u(e,t)
if e==t then
return
end
e[1]=he
e[2]=t
e[3]=false
e[4]=false
end
function C(e,t)
N(o(e))
N(not o(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function mt(t)
local e=K()
C(e,t)
return e
end
function c(e,t)
if e==t then
return true
end
if p(e)==p(t)then
u(e,t)
return true
else
return false
end
end
function _(a)
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
return _(e)
end
function D(e)
if not P(e)then
return e
end
local e=e
local a={}
while P(e)do
t(a,e)
e=ct(e)
end
for t=1,#a do
local t=a[t]
u(t,e)
end
return e
end
function Ee(e)
return B(e)or G(e)or J(e)or Q(e)
end
function y(e)
return P(e)or Ee(e)
end
function de(e)
if B(e)then
return e
elseif G(e)then
error("WIP")
elseif J(e)then
error("WIP")
elseif Q(e)then
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
return f(a,n,{
false,
false,
},o)
end
return a
end
local d={}
e=i
local function i()
a[2]=true
return s(at)
end
local function u()
local e={}
for t in pairs(d)do
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
local h=m(e)
if n[h]==true then
return i()
end
if d[h]==true then
a[1]=true
if B(e)then
return i()
elseif J(e)then
local t=ie(e)
local e=ne(e)
local o={
Me,
Pe,
Ye,
Se,
Ie,
Ne,
He,
De,
Le,
Re,
Ue,
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
N(#e==1)
N(a[2]==false)
local e=f(e[1],u(),a)
if a[2]then
return s(k(t,{e}))
else
return q()
end
end
if l(t,ae)then
return i()
elseif l(t,_e)then
return i()
elseif l(t,ze)then
return i()
elseif l(t,ee)then
N(#e==3)
N(a[2]==false)
local t=f(e[1],u(),a)
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
elseif G(e)then
return i()
elseif Q(e)then
return i()
end
return q()
end
d[h]=true
t(o,e)
e=b(e)
end
return r(e)
end
function b(a)
local e=D(a)
local t
N(not P(e))
if B(e)then
t=ut(oe(e),te(e),a)
elseif G(e)then
t=ht(qe(e),ve(e),pe(e),a)
elseif J(e)then
t=rt(ie(e),ne(e),a)
elseif Q(e)then
t=lt(ke(e),we(e),a)
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
function Xe(e)
while y(e)or A(e)do
e=h(be(e))
end
return e
end
function je(a,o,i)
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
function Qe(t,a,o)
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
function st(t,a)
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
function S(a)
local o=v
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return E(Be,e(o))
end
function Je(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function dt(e,u,d,l)
local s={}
local o={}
local e=D(e)
local h=true
while true do
if r(e)then
return l(o,s)
elseif A(e)then
t(o,ue(e))
e=V(e)
elseif a(e)then
t(s,i(e))
e=n(e)
elseif y(e)then
if h then
h=false
e=b(e)
else
return d()
end
else
return u()
end
end
end
function ut(d,o,u)
local s=b(o)
if y(s)then
return u
end
local function o()return H(z,e(Y,e(ze,e(S(d),s))))end
if a(s)then
return dt(s,o,function()return u end,function(s,e)
if#s~=0 then
error("WIP")
end
if l(e[1],fe)then
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
return Ce(d,i,o)
elseif l(e[1],ot)then
if#e==1 then
return o()
end
local s=h(I(d,e[2]))
if not w(s)then
return o()
end
local h=b(T(s))
if y(h)then
return u
end
if not g(h)then
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
return M(i,o)
elseif l(e[1],Y)then
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
return M(i,o)
end
end)
elseif r(s)then
return s
elseif U(s)then
return Qe(d,s,o())
elseif j(s)then
return o()
end
return q()
end
function U(e)
return g(e)or w(e)
end
function lt(o,t,u)
local function l()return H(z,e(Y,e(_e,e(o,_(t)))))end
o=b(o)
if y(o)then
return u
end
if not w(o)then
return l()
end
local e=h(T(o))
if not(g(e)and c(e,d))then
return l()
end
local o=h(O(o))
if not a(o)then
return l()
end
local e=L(i(o))
local o=h(n(o))
if not(a(o)and r(h(n(o))))then
return l()
end
local d=i(o)
local h=Ke
local o=0
while not r(e)do
if U(e)then
local a=v
do
local e=#t-1
while e>=o do
a=s(t[e+1],a)
e=e-1
end
end
h=je(h,e,a)
o=#t
e=v
elseif a(e)then
if o<#t then
local t=t[o+1]
o=o+1
h=je(h,i(e),t)
e=n(e)
else
return l()
end
else
return l()
end
end
if#t~=o then
return l()
end
return I(h,d)
end
function rt(i,t,o)
local function a()return H(z,e(Y,e(i,_(t))))end
for e=1,#Ge do
local e=Ge[e]
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
function ht(i,o,t,a)
local function a()return H(z,e(fe,e(S(i),o,_(t))))end
if l(o,Ve)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,nt)then
if#t~=2 then
return a()
end
return tt(i,t[1],t[2],a)
elseif l(o,it)then
if#t~=2 then
return a()
end
return le(t[1],I(i,t[2]))
end
return a()
end
function ce(t)
return e(fe,Ve,t)
end
function tt(m,u,f,w)
u=L(u)
local h={}
local c=false
local o=u
while not r(o)do
if U(o)then
t(h,o)
c=true
o=v
elseif a(o)then
t(h,i(o))
o=n(o)
else
return w()
end
end
local o
if c then
o=_(h)
else
o=u
end
local a={}
Je(m,function(o,e)
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
t=s(ce(st(m,a[e+1])),t)
e=e-1
end
end
return E(d,e(u,s(ce(E(d,e(i,f))),t)))
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
u(e,v)
u(t,v)
return true
elseif g(e)then
if not g(t)then
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
return o(e,t,F,W)
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
return"!"..tostring(m(s(F(e),W(e))))
elseif g(e)then
return me(e)
elseif A(e)then
return";("..tostring(m(ue(e))).." "..tostring(m(V(e)))..")"
elseif B(e)then
return"$("..tostring(m(S(oe(e)))).." "..tostring(m(te(e)))..")"
elseif J(e)then
return"%("..tostring(m(ie(e))).." "..tostring(m(_(ne(e))))..")"
elseif G(e)then
return"@("..tostring(m(S(qe(e)))).." "..tostring(m(ve(e))).." "..tostring(m(_(pe(e))))..")"
elseif Q(e)then
return"^("..tostring(m(ke(e))).." "..tostring(m(_(we(e))))..")"
end
return q()
end
function xe(e)
local o={}
local h={}
for s=1,#e do
local e=e[s]
e=D(e)
local function s(e,a,n,i)
t(o,a)
t(h,n(e))
t(h,i(e))
end
if g(e)then
t(o,"^")
t(o,p(e))
t(o,"^")
elseif a(e)then
s(e,".",i,n)
elseif r(e)then
t(o,"_")
elseif w(e)then
s(e,"#",T,O)
elseif j(e)then
s(e,"!",F,W)
elseif Ee(e)then
local e=de(e)
s(e,"$",(function(e)return S(oe(e))end),te)
else
return q()
end
end
return{
o,
h,
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
local e=Ze()
function u()return e end
return e
end
function R()
local e=et()
function R()return e end
return e
end
We=0
X=1
Z=2
re=3
se=4
he=5
ye=6
Te=7
ge=8
Fe=9
Oe=11
Ae=10
local function wt(e)
return R()[e]~=nil
end
local function et(e)
return{
We,
e,
}
end
local function Ze(e)
return u()[e]~=nil
end
local function o(e)
return et(u()[e])
end
v={Z}
local function Te(e)
local t=Xe(e)
local function o(e)
e[2]=L(e[2])
e[3]=L(e[3])
if A(e[2])or A(e[3])then
local t=mt(e)
local a=e[2]
local e=e[3]
local a=Te(a)
local e=Te(e)
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
z=o("太始初核")
local ye=o("符名")
d=o("化滅")
x=o("式形")
local yt=o("等同")
local pt=o("解算")
local U=o("特定其物")
local f=o("省略一物")
Be=o("映表")
local vt=o("如若")
local u=o("一類何物")
local Z=o("是非")
local ge=o("其子")
local Fe=o("爻陽")
local We=o("爻陰")
local mt=o("引用")
local bt=o("應用")
local ft=o("間空")
local he=o("連頸")
local se=o("構物")
local re=o("謬誤")
local ct=o("詞素")
local Oe=o("列序")
local ut=o("首始")
local lt=o("尾末")
local tt=o("之物")
local p=o("宇宙亡矣")
local ht=o("效應")
local st=o("註疏")
at=H(z,e(p,f))
local function p(e)
return E(ye,s(z,s(e,v)))
end
local function Ae(t)
return p(e(u,e(d,f,t),U))
end
local function R(a,t)
return p(e(u,e(d,e(a),f),t))
end
local function X(t)
return p(e(u,d,e(Z,e(u,t,f))))
end
local rt=Ae(se)
Me=R(se,ye)
Pe=R(se,Oe)
Ye=X(se)
local at=Ae(re)
Se=R(re,ye)
Ie=R(re,Oe)
Ne=X(re)
local dt=Ae(he)
He=X(he)
De=R(he,ut)
Le=R(he,lt)
Re=X(ct)
Ue=X(ft)
ae=p(e(u,d,e(Z,yt)))
_e=p(e(u,e(d,s(d,f),f),bt))
ze=p(e(u,d,pt))
local Ae=R(Oe,e(u,tt,f))
ee=p(e(u,d,vt))
Ve=p(e(u,x,mt))
nt=p(e(u,e(x,e(d,f,d)),U))
Y=p(e(x,e(z,d)))
fe=p(e(x,e(z,x)))
ot=p(e(x,x))
local Oe=p(e(u,d,st))
it=p(e(u,x,st))
local Y=E(We,e())
local re=E(Fe,e())
local function fe(e,s,h)
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
return fe(e,function(e)return e end,function(e,e)return false end)
end
local function ot(e)
while P(e)or A(e)do
e=D(be(e))
end
return e
end
local function Ve(e)
return oe(de(e))
end
local function it(e)
return te(de(e))
end
local function nt(e)
if A(e)then
return V(e)
else
return b(e)
end
end
Ke={}
local function se(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not g(e)then
return false
end
if not c(e,Be)then
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
local function de(t,a)
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
return Y
end,
}
end
local function X(t,o,a)
return{
t,
1,
function(e,i)
e=b(e)
if y(e)then
return k(t,{e})
end
if o(e)then
return a(e)
end
return i()
end,
}
end
Ge={
de(Ye,w),
{
rt,
2,
E,
},
X(Me,w,T),
X(Pe,w,O),
de(Ne,j),
{
at,
2,
H,
},
X(Se,j,F),
X(Ie,j,W),
de(Ue,r),
{
dt,
2,
s,
},
de(He,a),
X(De,a,i),
X(Le,a,n),
{
ae,
2,
function(e,t,o)
if e==t then
return re
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
return o(e,t,Y)
end
N(not y(e))
local function o(o,e,t,a)
return s(k(ae,{
t(o),
t(e),
}),k(ae,{
a(o),
a(e),
}))
end
if r(e)then
if not r(e)then
return Y
end
return re
elseif g(e)then
if not g(t)then
return Y
end
if c(e,t)then
return re
else
return Y
end
elseif w(e)then
if not w(t)then
return Y
end
return o(e,t,T,O)
elseif a(e)then
if not a(t)then
return Y
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return Y
end
return o(e,t,F,W)
end
return q()
end,
},
{
_e,
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
return M(s,o)
end,
},
{
ze,
2,
function(e,t,a)
local e=se(e)
if e==false then
return a()
end
return I(e,t)
end,
},
de(Re,g),
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
if not g(e)then
return t()
end
if c(e,Fe)then
return a
end
if c(e,We)then
return o
end
return t()
end,
},
{
Oe,
2,
le,
},
}
local ee
ee=l
local function c(t,e)
local o={t}
local t={e}
while#o~=0 do
local e=xe(o)
local a=e[1]
local n=e[2]
local e=xe(t)
local i=e[1]
local s=e[2]
if#a~=#i then
return false
end
do
local e=0
while e<#a do
if a[e+1]~=i[e+1]then
return false
end
e=e+1
end
end
o=n
t=s
end
return#t==0
end
local function ae(ee)
local Y,y,c,l,m,h,j,T,J,b,W,S,O,R,L,D,F,B,P,A,V,q,w,G,Q,X
function c()
return#Y==y
end
function l()
N(not c())
local e=string.sub(Y,y+1,y+1)
y=y+1
return e
end
function m(e)
N(string.sub(Y,y,y)==e)
y=y-1
end
function h(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function j(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=l()
if not j(e)then
m(e)
return false
end
while j(e)and not c()do
e=l()
end
if not j(e)then
m(e)
end
return true
end
function J()
if c()then
return false
end
local e=l()
local t=""
if not B(e)then
m(e)
return false
end
while B(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if B(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if Ze(t)then
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
local t=K()
local a=t
local function o(a)
local e=K()
C(t,s(a,e))
t=e
end
while true do
T()
if c()then
return h()
end
e=l()
if e==")"then
C(t,v)
return a
end
if e=="."then
T()
local o=P()
C(t,o)
T()
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
local e=P()
o(e)
end
end
function W()
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
return E(i(e),n(e))
end
function S()
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
function B(e)
if j(e)then
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
function P()
T()
local e={
b,
X,
W,
S,
O,
R,
L,
D,
F,
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
function V()
return not c()
end
function q(e)
A(V())
A(l()==e)
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
W,
S,
O,
R,
L,
D,
F,
}
else
e={
b,
Q,
W,
S,
O,
R,
L,
D,
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
return e(Z,a)
elseif o=="@"then
local t=w()
return e(u,e(d,s(a,f),f),t)
elseif o=="?"then
return e(u,d,e(Z,a))
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
return e(ge,_(a))
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
A(V())
local t=l()
if t=="+"then
local t=w()
return e(x,e(z,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
A(V())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(u,e(x,e(d,f,t)),U)
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
return e(z,t)
elseif t=="["then
local e=w()
q("]")
return G(e)
elseif t=="_"then
q(":")
local t=w()
return e(u,t,f)
else
m(t)
local e=J()
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
if g(e)then
return e
end
return p(e)
end
Y=ee
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
O=t("$",function(e,t)
local e=se(e)
if e==false then
return h()
end
return I(e,t)
end)
R=t("%",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return h()end)
return k(t,e)
end)
L=s("@",function(a,t,e)
local o=fe(e,function(e)return e end,function(e,e)return h()end)
local e=se(a)
if e==false then
return h()
end
return Ce(e,t,o)
end)
D=t("^",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return h()end)
return M(t,e)
end)
F=t(";",function(t,e)return le(t,e)end)
return P()
end
local function k(y)
local function t(r,l)
if g(r)then
return me(r)
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
elseif c(h,f)and c(e[3],U)then
return o(":>"..tostring(t(s[3],true)))
end
end
local a=R(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],Z)then
return o(tostring(t(a[2],true)).."?")
end
if s~=false and#s==2 and c(e[3],U)and c(s[1],x)then
local e=R(s[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],f)then
return o(":&>"..tostring(t(e[3],true)))
end
end
local a=c(e[3],f)and"_"or c(e[3],U)and""or t(e[3],true)
return o(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],x)then
local a=R(e[2])
if a~=false and#a==2 and c(a[1],z)then
return o("&+"..tostring(t(a[2],true)))
end
return o("&"..tostring(t(e[2],true)))
elseif c(e[1],Z)then
return o(tostring(t(e[2],true)).."~")
elseif c(e[1],z)then
return o("+"..tostring(t(e[2],true)))
elseif c(e[1],ge)then
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
local e=ae(m(y))
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
if e~=false and#e==2 and c(o,ye)and c(e[1],z)then
return t(e[2],false)
end
return"#"..tostring(k(s(o,a)))
elseif j(e)then
return"!"..tostring(k(s(F(e),W(e))))
elseif g(e)then
return me(e)
elseif A(e)then
return";("..tostring(k(ue(e))).." "..tostring(k(V(e)))..")"
elseif B(e)then
return"$("..tostring(k(S(oe(e)))).." "..tostring(k(te(e)))..")"
elseif J(e)then
return"%("..tostring(k(ie(e))).." "..tostring(k(_(ne(e))))..")"
elseif G(e)then
return"@("..tostring(k(S(qe(e)))).." "..tostring(k(ve(e))).." "..tostring(k(_(pe(e))))..")"
elseif Q(e)then
return"^("..tostring(k(ke(e))).." "..tostring(k(_(we(e))))..")"
end
return q()
end
local function B(h)
local l=K()
local n={function(e)return C(l,e)end}
local a=0
local function i()
error("MT parse ERROR")
end
local function d(e)
if not e then
return i()
end
end
local function u()
d(#h>a)
local e=string.sub(h,a+1,a+1)
a=a+1
return e
end
local r={}
while#n~=0 do
local a={}
for e=1,#n do
local o=n[e]
local e=u()
local function n(n)
local i=K()
local e=K()
t(a,function(e)return C(i,e)end)
t(a,function(t)return C(e,t)end)
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
if wt(e)then
o(et(e))
else
return i()
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
t(r,function()
if e==false or n==false then
return q()
else
local e=se(e)
if e==false then
return i()
else
o(I(e,n))
end
end
end)
elseif e=="_"then
o(v)
else
return i()
end
end
n=a
end
d(a==#h)
do
local e=#r-1
while e>=0 do
r[e+1]()
e=e-1
end
end
return l
end
local function Y(e)
local e={e}
local t=""
while#e~=0 do
local o=xe(e)
local a=o[1]
local i=o[2]
for o=1,#a do
local e=a[o]
t=tostring(t)..tostring(e)
end
e=i
end
return t
end
local function x(e)
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
local function z(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local N=p(s(ge,s(s(ht,s(s(u,s(tt,s(f,v))),v)),v)))
local q=p(s(ge,s(s(ht,s(he,v)),v)))
local function C(a,t)
return E(q,e(a,t))
end
local function U(e)
return E(N,e)
end
local function f(m,y,u,p,s)
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
if l(w,N)then
t=h(t)
if a(t)then
local a=i(t)
local e=h(n(t))
if r(e)then
if s==false then
local t=a
local e=p
local function a()return m(t,e)end
return c(a)
else
local t
t=m
local e
e=y
local o=a
local a=p
local function i()return f(t,e,M(s,o),a)end
return c(i)
end
end
end
elseif l(w,q)then
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
t=y
local o=l
local i=a
local a=p
local function n()return f(e,t,o,a,i)end
return c(n)
else
local t
t=m
local i
i=y
local r=l
local l=a
local h=p
local n=s
local a=o("序甲")
local function o()return f(t,i,r,h,E(d,e(e(a),v(e(ce(l),a),ce(n)))))end
return c(o)
end
end
end
end
end
end
if s==false then
return c(function()return y(u,p,m)end)
else
return c(function()return y(u,p,function(e,t)return c(function()return f(m,y,M(s,{e}),t)end)end)end)
end
end
local function l(e,o,a,t)
return f(e,o,a,t)
end
local function d(e,o,i,t)
return z(f((function(t,a)return x(e(t,a))end),(function(e,t,a)return x(o(e,t,function(e,t)return z(a(e,t))end))end),i,t))
end
local t={}
t.new_comment=le
t.comment_p=A
t.comment_comment=ue
t.comment_x=V
t.un_comment_all=be
t.can_new_symbol_p=Ze
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=g
t.un_symbol=me
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
t.error_p=j
t.error_name=F
t.error_list=W
t.just_p=P
t.evaluate=I
t.apply=M
t.force_all_rec=L
t.force_uncomment_all_rec=Te
t.jsArray_to_list=_
t.maybe_list_to_jsArray=R
t.new_list=e
t.un_just_all=D
t.un_just_comment_all=ot
t.delay_p=Ee
t.delay_just_p=y
t.delay_env=Ve
t.delay_x=it
t.force_all=h
t.force1=b
t.force_uncomment1=nt
t.force_uncomment_all=Xe
t.env_null_v=Ke
t.env_set=je
t.env_get=Qe
t.env2val=S
t.env_foreach=Je
t.val2env=se
t.equal_p=ee
t.simple_print=m
t.complex_parse=ae
t.complex_print=k
t.machinetext_parse=B
t.machinetext_print=Y
t.trampoline_return=x
t.trampoline_delay=c
t.run_trampoline=z
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=N
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=q
t.new_effect_bind=C
t.new_effect_return=U
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
