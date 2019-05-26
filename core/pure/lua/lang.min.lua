local function t(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local q,I,R,We,Z,ae,he,ne,se,fe,ye,we,Fe,Oe,Ae,ie,A,re,J,xe,b,p,ce,s,a,i,n,v,r,E,w,T,O,S,j,M,F,K,mt,N,G,ee,X,Ce,V,qe,je,ze,k,B,le,de,Y,Q,Te,_e,W,P,o,u,C,ct,z,d,x,Be,at,Me,Pe,Ye,Ne,Se,Ie,He,De,Le,Re,Ue,te,Ee,ke,oe,Ve,it,U,me,ot,et,c,_,e,D,ve,y,be,m,g,h,Xe,Je,pe,Qe,ht,H,Ke,lt,ut,L,Ge,dt,rt,st,ue,tt,l,f,ge,nt,Ze
function q()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return q()
end
end
function ie(e,t)
return{
Oe,
e,
t,
}
end
function A(e)
return e[1]==Oe
end
function re(e)
return e[2]
end
function J(e)
return e[3]
end
function xe(e)
while A(e)do
e=J(e)
end
return e
end
function b(e)
return e[1]==We
end
function p(e)
return e[2]
end
function ce(e)
return R()[p(e)]
end
function s(t,e)
return{
Z,
t,
e,
}
end
function a(e)
return e[1]==Z
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==ae
end
function E(t,e)
return{
he,
t,
e,
}
end
function w(e)
return e[1]==he
end
function T(e)
return e[2]
end
function O(e)
return e[3]
end
function S(t,e)
return{
ne,
t,
e,
}
end
function j(e)
return e[1]==ne
end
function M(e)
return e[2]
end
function F(e)
return e[3]
end
function K(e)
return e[1]==se
end
function mt(e)
return e[2]
end
function N(e,t)
return{
fe,
e,
t,
}
end
function G(e)
return e[1]==fe
end
function ee(e)
return e[2]
end
function X(e)
return e[3]
end
function Ce(e,a,t)
return{
we,
e,
a,
t,
}
end
function V(e)
return e[1]==we
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
ye,
e,
t,
}
end
function B(e)
return e[1]==ye
end
function le(e)
return e[2]
end
function de(e)
return e[3]
end
function Y(t,e)
return{
Fe,
t,
e,
}
end
function Q(e)
return e[1]==Fe
end
function Te(e)
return e[2]
end
function _e(e)
return e[3]
end
function W(e)
local e=h(e)
local function t(e)
e[2]=W(e[2])
e[3]=W(e[3])
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
function P()
return{Ae}
end
function o(e)
return e[1]==Ae
end
function u(e,t)
if e==t then
return
end
e[1]=se
e[2]=t
e[3]=false
e[4]=false
end
function C(e,t)
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
local e=P()
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
if not K(e)then
return e
end
local e=e
local a={}
while K(e)do
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
return G(e)or V(e)or B(e)or Q(e)
end
function y(e)
return K(e)or ve(e)
end
function be(e)
if G(e)then
return e
elseif V(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif Q(e)then
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
return s(at)
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
local h=f(e)
if n[h]==true then
return i()
end
if r[h]==true then
a[1]=true
if G(e)then
return i()
elseif B(e)then
local t=le(e)
local e=de(e)
local o={
Me,
Pe,
Ye,
Ne,
Se,
Ie,
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
I(#e==1)
I(a[2]==false)
local e=m(e[1],d(),a)
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
elseif l(t,oe)then
I(#e==3)
I(a[2]==false)
local t=m(e[1],d(),a)
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
elseif V(e)then
return i()
elseif Q(e)then
return i()
end
return q()
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
I(not K(e))
if G(e)then
t=ut(ee(e),X(e),a)
elseif V(e)then
t=st(qe(e),je(e),ze(e),a)
elseif B(e)then
t=rt(le(e),de(e),a)
elseif Q(e)then
t=dt(Te(e),_e(e),a)
else
t=e
end
t=D(t)
u(e,t)
return t
end
function h(e)
return m(e)
end
function Xe(e)
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
function ht(t,a)
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
function H(a)
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
function Ke(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function lt(e,u,d,l)
local s={}
local o={}
local e=D(e)
local h=true
while true do
if r(e)then
return l(o,s)
elseif A(e)then
t(o,re(e))
e=J(e)
elseif a(e)then
t(s,i(e))
e=n(e)
elseif y(e)then
if h then
h=false
e=g(e)
else
return d()
end
else
return u()
end
end
end
function ut(d,o,u)
local s=g(o)
if y(s)then
return u
end
local function o()return S(z,e(U,e(ke,e(H(d),s))))end
if a(s)then
return lt(s,o,function()return u end,function(s,e)
if#s~=0 then
error("WIP")
end
if l(e[1],me)then
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
local h=h(N(d,e[2]))
if not w(h)then
return o()
end
local s=g(T(h))
if y(s)then
return u
end
if not b(s)then
return o()
end
if not c(s,x)then
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
return Y(i,o)
elseif l(e[1],U)then
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
return Y(i,o)
end
end)
elseif r(s)then
return s
elseif L(s)then
return Qe(d,s,o())
elseif j(s)then
return o()
end
return q()
end
function L(e)
return b(e)or w(e)
end
function dt(t,o,u)
local function l()return S(z,e(U,e(Ee,e(t,_(o)))))end
t=g(t)
if y(t)then
return u
end
if not w(t)then
return l()
end
local e=h(T(t))
if not(b(e)and c(e,d))then
return l()
end
local t=h(O(t))
if not a(t)then
return l()
end
local e=W(i(t))
local t=h(n(t))
if not(a(t)and r(h(n(t))))then
return l()
end
local d=i(t)
local h=Je
local t=0
while not r(e)do
if L(e)then
local a=v
do
local e=#o-1
while e>=t do
a=s(o[e+1],a)
e=e-1
end
end
h=pe(h,e,a)
t=#o
e=v
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
function rt(i,t,o)
local function a()return S(z,e(U,e(i,_(t))))end
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
function st(i,o,t,a)
local function a()return S(z,e(me,e(H(i),o,_(t))))end
if l(o,Ve)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,it)then
if#t~=2 then
return a()
end
return tt(i,t[1],t[2],a)
elseif l(o,et)then
if#t~=2 then
return a()
end
return ie(t[1],N(i,t[2]))
end
return a()
end
function ue(t)
return e(me,Ve,t)
end
function tt(m,u,f,w)
u=W(u)
local h={}
local c=false
local o=u
while not r(o)do
if L(o)then
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
Ke(m,function(o,e)
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
o=s(ue(ht(m,a[e+1])),o)
e=e-1
end
end
return E(d,e(u,s(ue(E(d,e(t,f))),o)))
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
local function o(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
u(e,t)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
u(t,v)
u(e,v)
return true
elseif b(t)then
if not b(e)then
return false
end
return c(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif j(t)then
if not j(e)then
return false
end
return o(t,e,M,F)
elseif w(t)then
if not w(e)then
return false
end
return o(t,e,T,O)
end
return q()
end
function f(e)
e=D(e)
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
e=D(n(e))
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
return"!"..tostring(f(s(M(e),F(e))))
elseif b(e)then
return ce(e)
elseif A(e)then
return";("..tostring(f(re(e))).." "..tostring(f(J(e)))..")"
elseif G(e)then
return"$("..tostring(f(H(ee(e)))).." "..tostring(f(X(e)))..")"
elseif B(e)then
return"%("..tostring(f(le(e))).." "..tostring(f(_(de(e))))..")"
elseif V(e)then
return"@("..tostring(f(H(qe(e)))).." "..tostring(f(je(e))).." "..tostring(f(_(ze(e))))..")"
elseif Q(e)then
return"^("..tostring(f(Te(e))).." "..tostring(f(_(_e(e))))..")"
end
return q()
end
function ge(e)
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
if b(e)then
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
s(e,"!",M,F)
elseif ve(e)then
local e=be(e)
s(e,"$",(function(e)return H(ee(e))end),X)
else
return q()
end
end
return{
o,
h,
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
local e=nt()
function u()return e end
return e
end
function R()
local e=Ze()
function R()return e end
return e
end
We=0
Z=1
ae=2
he=3
ne=4
se=5
fe=6
ye=7
we=8
Fe=9
Oe=11
Ae=10
local function ft(e)
return R()[e]~=nil
end
local function tt(e)
return{
We,
e,
}
end
local function Ze(e)
return u()[e]~=nil
end
local function o(e)
return tt(u()[e])
end
v={ae}
local function Oe(e)
local t=Xe(e)
local function o(e)
e[2]=W(e[2])
e[3]=W(e[3])
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
z=o("太始初核")
local we=o("符名")
d=o("化滅")
x=o("式形")
local yt=o("等同")
local wt=o("解算")
local L=o("特定其物")
local m=o("省略一物")
Be=o("映表")
local pt=o("如若")
local u=o("一類何物")
local ae=o("是非")
local fe=o("其子")
local We=o("爻陽")
local Fe=o("爻陰")
local vt=o("引用")
local bt=o("應用")
local mt=o("間空")
local se=o("連頸")
local ne=o("構物")
local he=o("謬誤")
local ct=o("詞素")
local Ae=o("列序")
local ut=o("首始")
local lt=o("尾末")
local ht=o("之物")
local p=o("宇宙亡矣")
local st=o("效應")
local nt=o("註疏")
at=S(z,e(p,m))
local function p(e)
return E(we,s(z,s(e,v)))
end
local function ye(t)
return p(e(u,e(d,m,t),L))
end
local function R(t,a)
return p(e(u,e(d,e(t),m),a))
end
local function Z(t)
return p(e(u,d,e(ae,e(u,t,m))))
end
local dt=ye(ne)
Me=R(ne,we)
Pe=R(ne,Ae)
Ye=Z(ne)
local rt=ye(he)
Ne=R(he,we)
Se=R(he,Ae)
Ie=Z(he)
local at=ye(se)
He=Z(se)
De=R(se,ut)
Le=R(se,lt)
Re=Z(ct)
Ue=Z(mt)
te=p(e(u,d,e(ae,yt)))
Ee=p(e(u,e(d,s(d,m),m),bt))
ke=p(e(u,d,wt))
local Ae=R(Ae,e(u,ht,m))
oe=p(e(u,d,pt))
Ve=p(e(u,x,vt))
it=p(e(u,e(x,e(d,m,d)),L))
U=p(e(x,e(z,d)))
me=p(e(x,e(z,x)))
ot=p(e(x,x))
local Ve=p(e(u,d,nt))
et=p(e(u,x,nt))
local U=E(Fe,e())
local me=E(We,e())
local function ye(e,s,h)
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
return ye(e,function(e)return e end,function(e,e)return false end)
end
local function ot(e)
while K(e)or A(e)do
e=D(xe(e))
end
return e
end
local function et(e)
return ee(be(e))
end
local function it(e)
return X(be(e))
end
local function be(e)
if A(e)then
return J(e)
else
return g(e)
end
end
Je={}
local function ne(o)
o=h(o)
if not w(o)then
return false
end
local e=h(T(o))
if not b(e)then
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
local function he(t,a)
return{
t,
1,
function(e)
e=g(e)
if y(e)then
return k(t,{e})
end
if a(e)then
return me
end
return U
end,
}
end
local function Z(t,o,a)
return{
t,
1,
function(e,i)
e=g(e)
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
he(Ye,w),
{
dt,
2,
E,
},
Z(Me,w,T),
Z(Pe,w,O),
he(Ie,j),
{
rt,
2,
S,
},
Z(Ne,j,M),
Z(Se,j,F),
he(Ue,r),
{
at,
2,
s,
},
he(He,a),
Z(De,a,i),
Z(Le,a,n),
{
te,
2,
function(e,t,o)
if e==t then
return me
end
e=g(e)
t=g(t)
if y(e)or y(t)then
return k(te,{
e,
t,
})
end
if e==t then
return me
end
local function o(e,t,a)
return k(oe,{
e,
t,
a,
})
end
local function s(e,t)
return o(e,t,U)
end
I(not y(e))
local function o(o,a,e,t)
return s(k(te,{
e(o),
e(a),
}),k(te,{
t(o),
t(a),
}))
end
if r(e)then
if not r(e)then
return U
end
return me
elseif b(e)then
if not b(t)then
return U
end
if c(e,t)then
return me
else
return U
end
elseif w(e)then
if not w(t)then
return U
end
return o(e,t,T,O)
elseif a(e)then
if not a(t)then
return U
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return U
end
return o(e,t,M,F)
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
return Y(s,o)
end,
},
{
ke,
2,
function(e,t,a)
local e=ne(e)
if e==false then
return a()
end
return N(e,t)
end,
},
he(Re,b),
{
Ae,
1,
function(e,t)
e=g(e)
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
e=g(e)
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
if not b(e)then
return t()
end
if c(e,We)then
return o
end
if c(e,Fe)then
return a
end
return t()
end,
},
{
Ve,
2,
ie,
},
}
local Z
Z=l
local function c(t,e)
local t={t}
local o={e}
while#t~=0 do
local e=ge(t)
local a=e[1]
local s=e[2]
local e=ge(o)
local i=e[1]
local n=e[2]
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
t=s
o=n
end
return#o==0
end
local function te(Z)
local V,y,c,l,f,h,T,j,K,g,U,H,B,F,W,D,R,O,G,A,M,q,w,J,Q,X
function c()
return#V==y
end
function l()
I(not c())
local e=string.sub(V,y+1,y+1)
y=y+1
return e
end
function f(e)
I(string.sub(V,y,y)==e)
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
function j()
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
if not O(e)then
f(e)
return false
end
while O(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if O(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Ze(t)then
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
f(e)
return false
end
local t=P()
local a=t
local function o(a)
local e=P()
C(t,s(a,e))
t=e
end
while true do
j()
if c()then
return h()
end
e=l()
if e==")"then
C(t,v)
return a
end
if e=="."then
j()
local o=G()
C(t,o)
j()
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
local e=G()
o(e)
end
end
function U()
if c()then
return false
end
local e=l()
if e~="#"then
f(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
return E(i(e),n(e))
end
function H()
if c()then
return false
end
local e=l()
if e~="!"then
f(e)
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
function O(t)
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
function G()
j()
local e={
g,
X,
U,
H,
B,
F,
W,
D,
R,
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
g,
K,
a,
U,
H,
B,
F,
W,
D,
R,
}
else
e={
g,
Q,
U,
H,
B,
F,
W,
D,
R,
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
return e(u,e(d,e(a),m),t)
elseif o==":"then
local t=w()
return e(u,t,a)
elseif o=="~"then
return e(ae,a)
elseif o=="@"then
local t=w()
return e(u,e(d,s(a,m),m),t)
elseif o=="?"then
return e(u,d,e(ae,a))
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
return e(fe,_(a))
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
A(M())
local t=l()
if t=="+"then
local t=w()
return e(x,e(z,t))
else
f(t)
end
local t=w()
return e(x,t)
elseif t==":"then
A(M())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(u,e(x,e(d,m,t)),L)
elseif t==">"then
local t=w()
return e(u,e(d,m,t),L)
else
f(t)
end
local t=w()
return e(u,t,L)
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
return e(u,t,m)
else
f(t)
local e=K()
if e==false then
return false
end
return J(e)
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
local function e(t,o)
return function()
if c()then
return false
end
local e=l()
if e~=t then
f(e)
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
f(e)
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
B=e("$",function(e,t)
local e=ne(e)
if e==false then
return h()
end
return N(e,t)
end)
F=e("%",function(e,t)
local t=ye(t,function(e)return e end,function(e,e)return h()end)
return k(e,t)
end)
W=d("@",function(o,a,e)
local t=ye(e,function(e)return e end,function(e,e)return h()end)
local e=ne(o)
if e==false then
return h()
end
return Ce(e,a,t)
end)
D=e("^",function(e,t)
local t=ye(t,function(e)return e end,function(e,e)return h()end)
return Y(e,t)
end)
R=e(";",function(e,t)return ie(e,t)end)
return G()
end
local function k(y)
local function t(h,l)
if b(h)then
return ce(h)
end
local function o(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=R(h)
if e~=false and#e==3 and c(e[1],u)then
local s=R(e[2])
if s~=false and#s==3 and c(s[1],d)then
local h=s[2]
local r=R(h)
if r~=false and#r==1 and c(s[3],m)then
return o(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and c(n(h),m)and c(s[3],m)then
return o(tostring(t(i(h),true)).."@"..tostring(t(e[3],true)))
elseif c(h,m)and c(e[3],L)then
return o(":>"..tostring(t(s[3],true)))
end
end
local a=R(e[3])
if c(e[2],d)and a~=false and#a==2 and c(a[1],ae)then
return o(tostring(t(a[2],true)).."?")
end
if s~=false and#s==2 and c(e[3],L)and c(s[1],x)then
local e=R(s[2])
if e~=false and#e==3 and c(e[1],d)and c(e[2],m)then
return o(":&>"..tostring(t(e[3],true)))
end
end
local a=c(e[3],m)and"_"or c(e[3],L)and""or t(e[3],true)
return o(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if c(e[1],x)then
local a=R(e[2])
if a~=false and#a==2 and c(a[1],z)then
return o("&+"..tostring(t(a[2],true)))
end
return o("&"..tostring(t(e[2],true)))
elseif c(e[1],ae)then
return o(tostring(t(e[2],true)).."~")
elseif c(e[1],z)then
return o("+"..tostring(t(e[2],true)))
elseif c(e[1],fe)then
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
return f(h)
else
return f(p(h))
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
local e=R(o)
if e~=false and#e==2 and c(a,we)and c(e[1],z)then
return t(e[2],false)
end
return"#"..tostring(k(s(a,o)))
elseif j(e)then
return"!"..tostring(k(s(M(e),F(e))))
elseif b(e)then
return ce(e)
elseif A(e)then
return";("..tostring(k(re(e))).." "..tostring(k(J(e)))..")"
elseif G(e)then
return"$("..tostring(k(H(ee(e)))).." "..tostring(k(X(e)))..")"
elseif B(e)then
return"%("..tostring(k(le(e))).." "..tostring(k(_(de(e))))..")"
elseif V(e)then
return"@("..tostring(k(H(qe(e)))).." "..tostring(k(je(e))).." "..tostring(k(_(ze(e))))..")"
elseif Q(e)then
return"^("..tostring(k(Te(e))).." "..tostring(k(_(_e(e))))..")"
end
return q()
end
local function V(r)
local l=P()
local o={function(e)return C(l,e)end}
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
while#o~=0 do
local a={}
for e=1,#o do
local o=o[e]
local e=u()
local function n(n)
local i=P()
local e=P()
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
if ft(e)then
o(tt(e))
else
return i("can_new_symbol_unicodechar_p("..tostring(e)..") == false")
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
local t=ne(n)
if t==false then
return i()
else
o(N(t,e))
end
end
end)
elseif e=="_"then
o(v)
else
return i()
end
end
o=a
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
local function C(e)
local t={e}
local e=""
while#t~=0 do
local o=ge(t)
local a=o[1]
local i=o[2]
for o=1,#a do
local t=a[o]
e=tostring(e)..tostring(t)
end
t=i
end
return e
end
local function z(e)
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
local function q(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local I=p(s(fe,s(s(st,s(s(u,s(ht,s(m,v))),v)),v)))
local x=p(s(fe,s(s(st,s(se,v)),v)))
local function U(a,t)
return E(x,e(a,t))
end
local function L(e)
return E(I,e)
end
local function p(f,y,u,m,s)
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
if l(w,I)then
t=h(t)
if a(t)then
local a=i(t)
local e=h(n(t))
if r(e)then
if s==false then
local t=a
local e=m
local function a()return f(t,e)end
return c(a)
else
local t
t=f
local e
e=y
local a=a
local i=m
local function o()return p(t,e,Y(s,a),i)end
return c(o)
end
end
end
elseif l(w,x)then
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
t=f
local e
e=y
local o=l
local i=a
local a=m
local function n()return p(t,e,o,a,i)end
return c(n)
else
local t
t=f
local i
i=y
local r=l
local l=a
local h=m
local n=s
local a=o("序甲")
local function o()return p(t,i,r,h,E(d,e(e(a),v(e(ue(l),a),ue(n)))))end
return c(o)
end
end
end
end
end
end
if s==false then
return c(function()return y(u,m,f)end)
else
return c(function()return y(u,m,function(e,t)return c(function()return p(f,y,Y(s,{e}),t)end)end)end)
end
end
local function l(e,o,a,t)
return p(e,o,a,t)
end
local function d(e,a,o,i)
return q(p((function(t,a)return z(e(t,a))end),(function(o,t,e)return z(a(o,t,function(t,a)return q(e(t,a))end))end),o,i))
end
local t={}
t.new_comment=ie
t.comment_p=A
t.comment_comment=re
t.comment_x=J
t.un_comment_all=xe
t.can_new_symbol_p=Ze
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=b
t.un_symbol=ce
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
t.new_error=S
t.error_p=j
t.error_name=M
t.error_list=F
t.just_p=K
t.evaluate=N
t.apply=Y
t.force_all_rec=W
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=_
t.maybe_list_to_jsArray=R
t.new_list=e
t.un_just_all=D
t.un_just_comment_all=ot
t.delay_p=ve
t.delay_just_p=y
t.delay_env=et
t.delay_x=it
t.force_all=h
t.force1=g
t.force_uncomment1=be
t.force_uncomment_all=Xe
t.env_null_v=Je
t.env_set=pe
t.env_get=Qe
t.env2val=H
t.env_foreach=Ke
t.val2env=ne
t.equal_p=Z
t.simple_print=f
t.complex_parse=te
t.complex_print=k
t.machinetext_parse=V
t.machinetext_print=C
t.trampoline_return=z
t.trampoline_delay=c
t.run_trampoline=q
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=I
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=x
t.new_effect_bind=U
t.new_effect_return=L
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
