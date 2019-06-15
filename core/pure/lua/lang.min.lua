local function t(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local g,S,u,fe,le,Z,b,W,Oe,Te,Ae,ke,pe,ee,he,ue,I,re,K,xe,v,ce,ye,D,s,a,o,n,y,r,_,m,E,A,R,q,C,M,V,rt,N,X,te,oe,Me,G,ve,ge,be,j,B,de,se,F,J,qe,je,P,Q,i,O,Y,Qe,z,d,x,Ke,ot,Ce,Le,Ue,We,Fe,Se,Ne,Ie,He,Re,De,ae,_e,Ee,ie,Pe,st,U,me,nt,it,T,e,H,ne,p,l,k,h,Ge,Ve,ze,Be,Ze,L,Ye,Je,Xe,w,at,tt,et,dt,we,ht,c,f
function g()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return g()
end
end
function ue(e,t)
return{
ee,
e,
t,
}
end
function I(e)
return e[1]==ee
end
function re(e)
return e[2]
end
function K(e)
return e[3]
end
function xe(e)
while I(e)do
e=K(e)
end
return e
end
function v(e)
return e[1]==fe
end
function ce(e)
return e[2]
end
function ye(e)
return u()[ce(e)]
end
function D(t,e)
if t==e then
return true
end
if ce(t)==ce(e)then
O(t,e)
return true
else
return false
end
end
function s(t,e)
return{
le,
t,
e,
}
end
function a(e)
return e[1]==le
end
function o(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==Z
end
function _(e,t)
return{
b,
e,
t,
}
end
function m(e)
return e[1]==b
end
function E(e)
return e[2]
end
function A(e)
return e[3]
end
function R(t,e)
return{
W,
t,
e,
}
end
function q(e)
return e[1]==W
end
function C(e)
return e[2]
end
function M(e)
return e[3]
end
function V(e)
return e[1]==Oe
end
function rt(e)
return e[2]
end
function N(e,t)
return{
Te,
e,
t,
}
end
function X(e)
return e[1]==Te
end
function te(e)
return e[2]
end
function oe(e)
return e[3]
end
function Me(a,t,e)
return{
ke,
a,
t,
e,
}
end
function G(e)
return e[1]==ke
end
function ve(e)
return e[2]
end
function ge(e)
return e[3]
end
function be(e)
return e[4]
end
function j(t,e)
return{
Ae,
t,
e,
}
end
function B(e)
return e[1]==Ae
end
function de(e)
return e[2]
end
function se(e)
return e[3]
end
function F(t,e)
return{
pe,
t,
e,
}
end
function J(e)
return e[1]==pe
end
function qe(e)
return e[2]
end
function je(e)
return e[3]
end
function P(e)
local e=h(e)
local function t(e)
e[2]=P(e[2])
e[3]=P(e[3])
return e
end
if m(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif I(e)then
return t(e)
end
return e
end
function Q()
return{he}
end
function i(e)
return e[1]==he
end
function O(e,t)
if e==t then
return
end
e[1]=Oe
e[2]=t
e[3]=false
e[4]=false
end
function Y(e,t)
S(i(e))
S(not i(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function Qe(t)
local e=Q()
Y(e,t)
return e
end
function T(a)
local t=y
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
return T(e)
end
function H(e)
if not V(e)then
return e
end
local e=e
local a={}
while V(e)do
t(a,e)
e=rt(e)
end
for a,t in ipairs(a)do
O(t,e)
end
return e
end
function ne(e)
return X(e)or G(e)or B(e)or J(e)
end
function p(e)
return V(e)or ne(e)
end
function l(i,n,a,o)
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
O(e,t)
do
local e=0
while e<#o do
O(o[e+1],t)
e=e+1
end
end
return t
end
function s(a)
h(a)
if p(a)then
t(o,e)
return l(a,n,{
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
return s(ot)
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
while p(e)and a<32 do
t(o,e)
e=k(e)
a=a+1
end
end
while p(e)do
local h=f(e)
if n[h]==true then
return i()
end
if r[h]==true then
a[1]=true
if X(e)then
return i()
elseif B(e)then
local t=de(e)
local e=se(e)
local n={
Ce,
Le,
Ue,
We,
Fe,
Se,
Ne,
Ie,
He,
Re,
De,
}
local o=false
for a,e in ipairs(n)do
if c(e,t)then
o=true
break
end
end
if o then
S(#e==1)
S(a[2]==false)
local e=l(e[1],d(),a)
if a[2]then
return s(j(t,{e}))
else
return g()
end
end
if c(t,ae)then
return i()
elseif c(t,_e)then
return i()
elseif c(t,Ee)then
return i()
elseif c(t,ie)then
S(#e==3)
S(a[2]==false)
local t=l(e[1],d(),a)
if a[2]then
return s(j(ie,{
t,
e[2],
e[3],
}))
else
return g()
end
end
return g()
elseif G(e)then
return i()
elseif J(e)then
return i()
end
return g()
end
r[h]=true
t(o,e)
e=k(e)
end
return h(e)
end
function k(a)
local e=H(a)
local t
S(not V(e))
if X(e)then
t=Xe(te(e),oe(e),a)
elseif G(e)then
t=dt(ve(e),ge(e),be(e),a)
elseif B(e)then
t=et(de(e),se(e),a)
elseif J(e)then
t=tt(qe(e),je(e),a)
else
t=e
end
t=H(t)
O(e,t)
return t
end
function h(e)
return l(e)
end
function Ge(e)
while p(e)or I(e)do
e=h(xe(e))
end
return e
end
function ze(a,o,i)
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
function Be(t,a,o)
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
function Ze(t,a)
do
local e=0
while e<#t do
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return g()
end
function L(o)
local a=y
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(Ke,e(a))
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
function Je(e,u,l,d)
local h={}
local i={}
local e=H(e)
local s=true
while true do
if r(e)then
return d(i,h)
elseif I(e)then
t(i,re(e))
e=K(e)
elseif a(e)then
t(h,o(e))
e=n(e)
elseif p(e)then
if s then
s=false
e=k(e)
else
return l()
end
else
return u()
end
end
end
function Xe(d,i,l)
local s=k(i)
if p(s)then
return l
end
local function i()return R(z,e(U,e(Ee,e(L(d),s))))end
if a(s)then
return Je(s,i,function()return l end,function(s,e)
if#s~=0 then
error("WIP")
end
if c(e[1],me)then
if#e==1 then
return i()
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
return Me(d,i,o)
elseif c(e[1],nt)then
if#e==1 then
return i()
end
local h=h(N(d,e[2]))
if not m(h)then
return i()
end
local s=k(E(h))
if p(s)then
return l
end
if not v(s)then
return i()
end
if not D(s,x)then
return i()
end
local s=k(A(h))
if p(s)then
return l
end
if not a(s)then
return i()
end
local h=o(s)
local a=k(n(s))
if p(a)then
return l
end
if not r(a)then
return i()
end
local o={L(d)}
do
local a=2
while a<#e do
t(o,e[a+1])
a=a+1
end
end
return F(h,o)
elseif c(e[1],U)then
if#e==1 then
return i()
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
return j(i,o)
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
return F(i,o)
end
end)
elseif r(s)then
return s
elseif w(s)then
return Be(d,s,i())
elseif q(s)then
return i()
end
return g()
end
function w(e)
return v(e)or m(e)
end
function tt(l,i,u)
local function t()return R(z,e(U,e(_e,e(l,T(i)))))end
l=k(l)
if p(l)then
return u
end
if not m(l)then
return t()
end
local e=h(E(l))
if not(v(e)and D(e,d))then
return t()
end
local d=h(A(l))
if not a(d)then
return t()
end
local e=P(o(d))
local d=h(n(d))
if not(a(d)and r(h(n(d))))then
return t()
end
local l=o(d)
local d=Ve
local h=0
while not r(e)do
if w(e)then
local t=y
do
local e=#i-1
while e>=h do
t=s(i[e+1],t)
e=e-1
end
end
d=ze(d,e,t)
h=#i
e=y
elseif a(e)then
if h<#i then
local t=i[h+1]
h=h+1
d=ze(d,o(e),t)
e=n(e)
else
return t()
end
else
return t()
end
end
if#i~=h then
return t()
end
return N(d,l)
end
function et(i,t,o)
local function a()return R(z,e(U,e(i,T(t))))end
for n,e in ipairs(at)do
if c(i,e[1])then
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
return g()
end
end
return a()
end
function dt(i,o,t,a)
local function a()return R(z,e(me,e(L(i),o,T(t))))end
if c(o,Pe)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,st)then
if#t~=2 then
return a()
end
return ht(i,t[1],t[2],a)
elseif c(o,it)then
if#t~=2 then
return a()
end
return ue(t[1],N(i,t[2]))
end
return a()
end
function we(t)
return e(me,Pe,t)
end
function ht(m,h,f,p)
h=P(h)
local l={}
local u=false
local i=h
while not r(i)do
if w(i)then
t(l,i)
u=true
i=y
elseif a(i)then
t(l,o(i))
i=n(i)
else
return p()
end
end
local o
if u then
o=T(l)
else
o=h
end
local a={}
Ye(m,function(o,e)
do
local e=0
while e<#l do
if c(l[e+1],o)then
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
t=s(we(Ze(m,a[e+1])),t)
e=e-1
end
end
return _(d,e(h,s(we(_(d,e(i,f))),t)))
end
function c(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function i(t,e,o,a)
if c(o(t),o(e))and c(a(t),a(e))then
O(t,e)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
O(t,y)
O(e,y)
return true
elseif v(t)then
if not v(e)then
return false
end
return D(t,e)
elseif a(t)then
if not a(e)then
return false
end
return i(t,e,o,n)
elseif q(t)then
if not q(e)then
return false
end
return i(t,e,C,M)
elseif m(t)then
if not m(e)then
return false
end
return i(t,e,E,A)
end
return g()
end
function f(e)
e=H(e)
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
e=H(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(f(s(E(e),A(e))))
elseif q(e)then
return"!"..tostring(f(s(C(e),M(e))))
elseif v(e)then
return ye(e)
elseif I(e)then
return";("..tostring(f(re(e))).." "..tostring(f(K(e)))..")"
elseif X(e)then
return"$("..tostring(f(L(te(e)))).." "..tostring(f(oe(e)))..")"
elseif B(e)then
return"%("..tostring(f(de(e))).." "..tostring(f(T(se(e))))..")"
elseif G(e)then
return"@("..tostring(f(L(ve(e)))).." "..tostring(f(ge(e))).." "..tostring(f(T(be(e))))..")"
elseif J(e)then
return"^("..tostring(f(qe(e))).." "..tostring(f(T(je(e))))..")"
end
return g()
end
local function w()
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
local function i()
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
local e=w()
function l()return e end
return e
end
function u()
local e=i()
function u()return e end
return e
end
fe=0
le=1
Z=2
b=3
W=4
Oe=5
Te=6
Ae=7
ke=8
pe=9
ee=11
he=10
local function dt(e)
return u()[e]~=nil
end
local function Je(e)
return{
fe,
e,
}
end
local function Xe(e)
return l()[e]~=nil
end
local function i(e)
return Je(l()[e])
end
y={Z}
local function Oe(e)
local t=Ge(e)
local function o(e)
e[2]=P(e[2])
e[3]=P(e[3])
if I(e[2])or I(e[3])then
local t=Qe(e)
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
if m(t)then
return o(t)
elseif q(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=i("太始初核")
local pe=i("符名")
d=i("化滅")
x=i("式形")
local yt=i("等同")
local ft=i("解算")
local W=i("特定其物")
local w=i("省略一物")
Ke=i("映表")
local wt=i("如若")
local u=i("一類何物")
local ee=i("是非")
local ke=i("其子")
local ht=i("爻陽")
local rt=i("爻陰")
local mt=i("引用")
local ct=i("應用")
local ut=i("間空")
local le=i("連頸")
local he=i("構物")
local fe=i("謬誤")
local lt=i("詞素")
local Ae=i("列序")
local et=i("首始")
local vt=i("尾末")
local tt=i("之物")
local l=i("宇宙亡矣")
local Qe=i("效應")
local Ze=i("註疏")
ot=R(z,e(l,w))
local function b(e)
return _(pe,s(z,s(e,y)))
end
local function Te(t)
return b(e(u,e(d,w,t),W))
end
local function l(t,a)
return b(e(u,e(d,e(t),w),a))
end
local function Z(t)
return b(e(u,d,e(ee,e(u,t,w))))
end
local pt=Te(he)
Ce=l(he,pe)
Le=l(he,Ae)
Ue=Z(he)
local ot=Te(fe)
We=l(fe,pe)
Fe=l(fe,Ae)
Se=Z(fe)
local bt=Te(le)
Ne=Z(le)
Ie=l(le,et)
He=l(le,vt)
Re=Z(lt)
De=Z(ut)
ae=b(e(u,d,e(ee,yt)))
_e=b(e(u,e(d,s(d,w),w),ct))
Ee=b(e(u,d,ft))
local et=l(Ae,e(u,tt,w))
ie=b(e(u,d,wt))
Pe=b(e(u,x,mt))
st=b(e(u,e(x,e(d,w,d)),W))
U=b(e(x,e(z,d)))
me=b(e(x,e(z,x)))
nt=b(e(x,x))
local st=b(e(u,d,Ze))
it=b(e(u,x,Ze))
local l=_(rt,e())
local he=_(ht,e())
local function Te(e,h,s)
local i={}
while a(e)do
t(i,o(e))
e=n(e)
end
if r(e)then
return h(i)
end
return s(i,e)
end
local function U(e)
return Te(e,function(e)return e end,function(e,e)return false end)
end
local function nt(e)
while V(e)or I(e)do
e=H(xe(e))
end
return e
end
local function Ae(e)
if X(e)then
return e
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif J(e)then
error("WIP")
end
return g()
end
local function it(e)
return te(Ae(e))
end
local function Ze(e)
return oe(Ae(e))
end
local function Pe(e)
if I(e)then
return K(e)
else
return k(e)
end
end
Ve={}
local function fe(i)
i=h(i)
if not m(i)then
return false
end
local e=h(E(i))
if not v(e)then
return false
end
if not D(e,Ke)then
return false
end
e=h(A(i))
if not a(e)then
return false
end
if not r(h(n(e)))then
return false
end
local i={}
local s=h(o(e))
while not r(s)do
if not a(s)then
return false
end
local e=h(o(s))
s=h(n(s))
if not a(e)then
return false
end
local s=o(e)
e=h(n(e))
if not a(e)then
return false
end
local o=o(e)
if not r(h(n(e)))then
return false
end
local a=true
do
local e=0
while e<#i do
if c(i[(e+0)+1],s)then
i[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
t(i,s)
t(i,o)
end
end
return i
end
local function me(t,a)
return{
t,
1,
function(e)
e=k(e)
if p(e)then
return j(t,{e})
end
if a(e)then
return he
end
return l
end,
}
end
local function Z(t,a,i)
return{
t,
1,
function(e,o)
e=k(e)
if p(e)then
return j(t,{e})
end
if a(e)then
return i(e)
end
return o()
end,
}
end
at={
me(Ue,m),
{
pt,
2,
_,
},
Z(Ce,m,E),
Z(Le,m,A),
me(Se,q),
{
ot,
2,
R,
},
Z(We,q,C),
Z(Fe,q,M),
me(De,r),
{
bt,
2,
s,
},
me(Ne,a),
Z(Ie,a,o),
Z(He,a,n),
{
ae,
2,
function(e,t,i)
if e==t then
return he
end
e=k(e)
t=k(t)
if p(e)or p(t)then
return j(ae,{
e,
t,
})
end
if e==t then
return he
end
local function i(t,a,e)
return j(ie,{
t,
a,
e,
})
end
local function s(t,e)
return i(t,e,l)
end
S(not p(e))
local function i(e,t,o,a)
return s(j(ae,{
o(e),
o(t),
}),j(ae,{
a(e),
a(t),
}))
end
if r(e)then
if not r(e)then
return l
end
return he
elseif v(e)then
if not v(t)then
return l
end
if D(e,t)then
return he
else
return l
end
elseif m(e)then
if not m(t)then
return l
end
return i(e,t,E,A)
elseif a(e)then
if not a(t)then
return l
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return l
end
return i(e,t,C,M)
end
return g()
end,
},
{
_e,
2,
function(d,e,s)
local i={}
local e=h(e)
while a(e)do
t(i,o(e))
e=h(n(e))
end
if not r(e)then
return s()
end
return F(d,i)
end,
},
{
Ee,
2,
function(e,a,t)
local e=fe(e)
if e==false then
return t()
end
return N(e,a)
end,
},
me(Re,v),
{
et,
1,
function(e,t)
e=k(e)
if p(e)then
return j(et,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
ie,
3,
function(e,o,a,t)
e=k(e)
if p(e)then
return j(ie,{
e,
o,
a,
})
end
if not m(e)then
return t()
end
local e=h(E(e))
if not v(e)then
return t()
end
if D(e,ht)then
return o
end
if D(e,rt)then
return a
end
return t()
end,
},
{
st,
2,
ue,
},
}
local Z
Z=c
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function i(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
O(e,t)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
O(e,y)
O(t,y)
return true
elseif v(e)then
if not v(t)then
return false
end
return D(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,C,M)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,E,A)
elseif ne(e)then
return false
end
return g()
end
local function ae(Z)
local D,p,c,l,m,h,A,E,K,g,L,U,C,O,H,I,M,V,B,q,P,k,f,G,J,X
function c()
return#D==p
end
function l()
S(not c())
local e=string.sub(D,p+1,p+1)
p=p+1
return e
end
function m(e)
S(string.sub(D,p,p)==e)
p=p-1
end
function h(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function E()
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
if not V(e)then
m(e)
return false
end
while V(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if V(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if Xe(t)then
return i(t)
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
local t=Q()
local a=t
local function o(a)
local e=Q()
Y(t,s(a,e))
t=e
end
while true do
E()
if c()then
return h()
end
e=l()
if e==")"then
Y(t,y)
return a
end
if e=="."then
E()
local o=B()
Y(t,o)
E()
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
local e=B()
o(e)
end
end
function L()
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
return _(o(e),n(e))
end
function U()
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
return R(o(e),n(e))
end
function V(e)
if A(e)then
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
function B()
E()
local e={
g,
X,
L,
U,
C,
O,
H,
I,
M,
}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function q(e)
if e==false then
return h()
end
return e
end
function P()
return not c()
end
function k(e)
q(P())
q(l()==e)
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
K,
a,
L,
U,
C,
O,
H,
I,
M,
}
else
e={
g,
J,
L,
U,
C,
O,
H,
I,
M,
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
local t=f()
return e(u,e(d,e(a),w),t)
elseif o==":"then
local t=f()
return e(u,t,a)
elseif o=="~"then
return e(ee,a)
elseif o=="@"then
local t=f()
return e(u,e(d,s(a,w),w),t)
elseif o=="?"then
return e(u,d,e(ee,a))
elseif o=="/"then
local a={a}
while true do
local e=f(true)
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
return e(ke,T(a))
else
m(o)
return a
end
end
function J()
if c()then
return false
end
local t=l()
if t=="&"then
q(P())
local t=l()
if t=="+"then
local t=f()
return e(x,e(z,t))
else
m(t)
end
local t=f()
return e(x,t)
elseif t==":"then
q(P())
local t=l()
if t=="&"then
k(">")
local t=f()
return e(u,e(x,e(d,w,t)),W)
elseif t==">"then
local t=f()
return e(u,e(d,w,t),W)
else
m(t)
end
local t=f()
return e(u,t,W)
elseif t=="+"then
local t=f()
return e(z,t)
elseif t=="["then
local e=f()
k("]")
return G(e)
elseif t=="_"then
k(":")
local t=f()
return e(u,t,w)
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
local e=J()
if e==false then
return false
end
if v(e)then
return e
end
return b(e)
end
D=Z
p=0
local function t(t,i)
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
return i(o(e),o(t))
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
local e=g()
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
local i=n(t)
if not(a(i)and r(n(i)))then
return h()
end
return s(o(e),o(t),o(i))
end
end
C=t("$",function(e,t)
local e=fe(e)
if e==false then
return h()
end
return N(e,t)
end)
O=t("%",function(t,e)
local e=Te(e,function(e)return e end,function(e,e)return h()end)
return j(t,e)
end)
H=s("@",function(a,t,e)
local o=Te(e,function(e)return e end,function(e,e)return h()end)
local e=fe(a)
if e==false then
return h()
end
return Me(e,t,o)
end)
I=t("^",function(e,t)
local t=Te(t,function(e)return e end,function(e,e)return h()end)
return F(e,t)
end)
M=t(";",function(e,t)return ue(e,t)end)
return B()
end
local function j(y)
local function t(h,c)
if v(h)then
return ye(h)
end
local function i(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(h)
if e~=false and#e==3 and l(e[1],u)then
local s=U(e[2])
if s~=false and#s==3 and l(s[1],d)then
local h=s[2]
local r=U(h)
if r~=false and#r==1 and l(s[3],w)then
return i(tostring(t(r[1],true)).."."..tostring(t(e[3],true)))
elseif a(h)and l(n(h),w)and l(s[3],w)then
return i(tostring(t(o(h),true)).."@"..tostring(t(e[3],true)))
elseif l(h,w)and l(e[3],W)then
return i(":>"..tostring(t(s[3],true)))
end
end
local a=U(e[3])
if l(e[2],d)and a~=false and#a==2 and l(a[1],ee)then
return i(tostring(t(a[2],true)).."?")
end
if s~=false and#s==2 and l(e[3],W)and l(s[1],x)then
local e=U(s[2])
if e~=false and#e==3 and l(e[1],d)and l(e[2],w)then
return i(":&>"..tostring(t(e[3],true)))
end
end
local a
if l(e[3],w)then
a="_"
elseif l(e[3],W)then
a=""
else
a=t(e[3],true)
end
return i(tostring(a)..":"..tostring(t(e[2],true)))
elseif e~=false and#e==2 then
if l(e[1],x)then
local a=U(e[2])
if a~=false and#a==2 and l(a[1],z)then
return i("&+"..tostring(t(a[2],true)))
end
return i("&"..tostring(t(e[2],true)))
elseif l(e[1],ee)then
return i(tostring(t(e[2],true)).."~")
elseif l(e[1],z)then
return i("+"..tostring(t(e[2],true)))
elseif l(e[1],ke)then
local e=U(e[2])
if e~=false and#e>1 then
local o=t(e[1],true)
do
local a=1
while a<#e do
o=tostring(o).."/"..tostring(t(e[a+1],true))
a=a+1
end
end
return i(o)
end
end
end
if c then
return f(h)
else
return f(b(h))
end
end
local e=ae(f(y))
local i=""
local h=""
if r(e)then
return"()"
elseif a(e)then
i="("
h=""
while a(e)do
i=tostring(i)..tostring(h)..tostring(j(o(e)))
h=" "
e=n(e)
end
if r(e)then
i=tostring(i)..")"
else
i=tostring(i).." . "..tostring(j(e))..")"
end
return i
elseif m(e)then
local a=E(e)
local o=A(e)
local e=U(o)
if e~=false and#e==2 and l(a,pe)and l(e[1],z)then
return t(e[2],false)
end
return"#"..tostring(j(s(a,o)))
elseif q(e)then
return"!"..tostring(j(s(C(e),M(e))))
elseif v(e)then
return ye(e)
elseif I(e)then
return";("..tostring(j(re(e))).." "..tostring(j(K(e)))..")"
elseif X(e)then
return"$("..tostring(j(L(te(e)))).." "..tostring(j(oe(e)))..")"
elseif B(e)then
return"%("..tostring(j(de(e))).." "..tostring(j(T(se(e))))..")"
elseif G(e)then
return"@("..tostring(j(L(ve(e)))).." "..tostring(j(ge(e))).." "..tostring(j(T(be(e))))..")"
elseif J(e)then
return"^("..tostring(j(qe(e))).." "..tostring(j(T(je(e))))..")"
end
return g()
end
local function W(n)
local d=Q()
local h={function(e)return Y(d,e)end}
local e=0
local function i(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function u(e)
if not e then
return i()
end
end
local function l()
u(#n>e)
local t=string.sub(n,e+1,e+1)
e=e+1
return t
end
local r={}
while#h~=0 do
local a={}
for e,o in ipairs(h)do
local e=l()
local function n(n)
local i=Q()
local e=Q()
t(a,function(e)return Y(i,e)end)
t(a,function(t)return Y(e,t)end)
o(n(i,e))
end
if e=="^"then
local e=""
while true do
local t=l()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if dt(e)then
o(Je(e))
else
return i("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
n(s)
elseif e=="#"then
n(_)
elseif e=="!"then
n(R)
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
return g()
else
local e=fe(e)
if e==false then
return i()
else
o(N(e,n))
end
end
end)
elseif e=="_"then
o(y)
else
return i()
end
end
h=a
end
u(e==#n)
do
local e=#r-1
while e>=0 do
r[e+1]()
e=e-1
end
end
return d
end
local function l(e)
local s={}
local h={}
for i,e in ipairs(e)do
e=H(e)
local function i(e,i,o,a)
t(s,i)
return t(h,o(e),a(e))
end
if v(e)then
t(s,"^",ce(e),"^")
elseif a(e)then
i(e,".",o,n)
elseif r(e)then
t(s,"_")
elseif m(e)then
i(e,"#",E,A)
elseif q(e)then
i(e,"!",C,M)
elseif ne(e)then
local e=Ae(e)
i(e,"$",(function(e)return L(te(e))end),oe)
else
return g()
end
end
return{
s,
h,
}
end
local function Y(e)
local t={e}
local e=""
while#t~=0 do
local a=l(t)
local i=a[1]
local o=a[2]
for o,a in ipairs(i)do
e=tostring(e)..tostring(a)
end
t=o
end
return e
end
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
local function z(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local x=b(s(ke,s(s(Qe,s(s(u,s(tt,s(w,y))),y)),y)))
local b=b(s(ke,s(s(Qe,s(le,y)),y)))
local function O(t,a)
return _(b,e(t,a))
end
local function S(e)
return _(x,e)
end
local function w(f,p,u,y,s)
if s==nil then
s=false
end
local function v(e,e)
error("WIP")
end
u=h(u)
if m(u)then
local m=E(u)
local t=A(u)
if c(m,x)then
t=h(t)
if a(t)then
local a=o(t)
local e=h(n(t))
if r(e)then
if s==false then
local e=a
local t=y
local function a()return f(e,t)end
return l(a)
else
local t
t=f
local e
e=p
local a=a
local i=y
local function o()return w(t,e,F(s,a),i)end
return l(o)
end
end
end
elseif c(m,b)then
t=h(t)
if a(t)then
local u=o(t)
local t=h(n(t))
if a(t)then
local o=o(t)
local t=h(n(t))
if r(t)then
if s==false then
local t
t=f
local e
e=p
local n=u
local i=o
local o=y
local function a()return w(t,e,n,o,i)end
return l(a)
else
local t
t=f
local a
a=p
local n=u
local h=o
local r=y
local s=s
local o=i("序甲")
local function i()return w(t,a,n,r,_(d,e(e(o),v(e(we(h),o),we(s)))))end
return l(i)
end
end
end
end
end
end
if s==false then
return l(function()return p(u,y,f)end)
else
return l(function()return p(u,y,function(e,t)return l(function()return w(f,p,F(s,{e}),t)end)end)end)
end
end
local function u(o,a,t,e)
return w(o,a,t,e)
end
local function d(e,o,a,i)
return z(w((function(a,t)return g(e(a,t))end),(function(a,e,t)return g(o(a,e,function(e,a)return z(t(e,a))end))end),a,i))
end
local t={}
t.new_comment=ue
t.comment_p=I
t.comment_comment=re
t.comment_x=K
t.un_comment_all=xe
t.can_new_symbol_p=Xe
t.new_symbol=i
t.symbol_p=v
t.un_symbol=ye
t.symbol_equal_p=D
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=n
t.null_v=y
t.null_p=r
t.new_data=_
t.data_p=m
t.data_name=E
t.data_list=A
t.new_error=R
t.error_p=q
t.error_name=C
t.error_list=M
t.just_p=V
t.evaluate=N
t.apply=F
t.force_all_rec=P
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=T
t.maybe_list_to_jsArray=U
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=nt
t.delay_p=ne
t.delay_just_p=p
t.delay_env=it
t.delay_x=Ze
t.force_all=h
t.force1=k
t.force_uncomment1=Pe
t.force_uncomment_all=Ge
t.env_null_v=Ve
t.env_set=ze
t.env_get=Be
t.env2val=L
t.env_foreach=Ye
t.val2env=fe
t.equal_p=Z
t.simple_print=f
t.complex_parse=ae
t.complex_print=j
t.machinetext_parse=W
t.machinetext_print=Y
t.trampoline_return=g
t.trampoline_delay=l
t.run_trampoline=z
t.return_effect_systemName=x
t.bind_effect_systemName=b
t.new_effect_bind=O
t.new_effect_return=S
t.run_monad_trampoline=u
t.run_monad_stackoverflow=d
return t
