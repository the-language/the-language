function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local g,R,w,qe,ne,je,ae,C,v,F,W,ze,xe,Ae,Te,he,S,ge,te,me,p,ce,ue,h,a,o,s,y,r,z,f,_,E,N,b,M,D,Q,at,I,G,oe,Z,Qe,Y,pe,we,fe,T,B,re,le,P,K,ve,be,L,J,i,A,V,ot,x,d,q,De,tt,Le,Ue,Re,He,Ne,Ie,Ke,Oe,Se,Ce,We,X,ke,ye,ee,Pe,Be,ie,se,rt,dt,U,j,e,H,_e,l,n,k,Ve,Ge,Ee,Fe,st,O,Ye,nt,c,Me,ht,et,it,de,Ze,u,m,Je,Xe
function g()
error("TheLanguage PANIC")
end
function R(e)
if not e then
return g()
end
end
function he(e,t)
return{
Ae,
e,
t,
}
end
function S(e)
return e[0+1]==Ae
end
function ge(e)
return e[1+1]
end
function te(e)
return e[2+1]
end
function me(e)
while S(e)do
e=te(e)
end
return e
end
function p(e)
return e[0+1]==qe
end
function ce(e)
return e[1+1]
end
function ue(e)
return w()[ce(e)]
end
function h(t,e)
return{
ne,
t,
e,
}
end
function a(e)
return e[0+1]==ne
end
function o(e)
return e[1+1]
end
function s(e)
return e[2+1]
end
function r(e)
return e[0+1]==je
end
function z(e,t)
return{
ae,
e,
t,
}
end
function f(e)
return e[0+1]==ae
end
function _(e)
return e[1+1]
end
function E(e)
return e[2+1]
end
function N(t,e)
return{
C,
t,
e,
}
end
function b(e)
return e[0+1]==C
end
function M(e)
return e[1+1]
end
function D(e)
return e[2+1]
end
function Q(e)
return e[0+1]==v
end
function at(e)
return e[1+1]
end
function I(e,t)
return{
F,
e,
t,
}
end
function G(e)
return e[0+1]==F
end
function oe(e)
return e[1+1]
end
function Z(e)
return e[2+1]
end
function Qe(t,e,a)
return{
ze,
t,
e,
a,
}
end
function Y(e)
return e[0+1]==ze
end
function pe(e)
return e[1+1]
end
function we(e)
return e[2+1]
end
function fe(e)
return e[3+1]
end
function T(t,e)
return{
W,
t,
e,
}
end
function B(e)
return e[0+1]==W
end
function re(e)
return e[1+1]
end
function le(e)
return e[2+1]
end
function P(e,t)
return{
xe,
e,
t,
}
end
function K(e)
return e[0+1]==xe
end
function ve(e)
return e[1+1]
end
function be(e)
return e[2+1]
end
function L(e)
local e=n(e)
local function t(e)
e[1+1]=L(e[1+1])
e[2+1]=L(e[2+1])
return e
end
if f(e)then
return t(e)
elseif b(e)then
return t(e)
elseif a(e)then
return t(e)
elseif S(e)then
return t(e)
end
return e
end
function J()
return{Te}
end
function i(e)
return e[0+1]==Te
end
function A(e,t)
if e==t then
return
end
e[0+1]=v
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function V(e,t)
R(i(e))
local e=e
local t=t
e[0+1]=t[0+1]
e[1+1]=t[1+1]
e[2+1]=t[2+1]
e[3+1]=t[3+1]
end
function ot(t)
local e=J()
V(e,t)
return e
end
function U(t,e)
if t==e then
return true
end
if ce(t)==ce(e)then
A(t,e)
return true
else
return false
end
end
function j(a)
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
return j(e)
end
function H(e)
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
__TS__ArrayPush(t,e)
e=at(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function _e(e)
return G(e)or Y(e)or B(e)or K(e)
end
function l(e)
return Q(e)or _e(e)
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
return s(tt)
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
e=k(e)
t=t+1
end
end
while l(e)do
local h=m(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if G(e)then
return o()
elseif B(e)then
local a=re(e)
local e=le(e)
local i={
Le,
Ue,
Re,
He,
Ne,
Ie,
Ke,
Oe,
Se,
Ce,
We,
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
R(#e==1)
R(t[1+1]==false)
local e=n(e[0+1],c(),t)
if t[1+1]then
return s(T(a,{e}))
else
return g()
end
end
if u(a,X)then
return o()
elseif u(a,ke)then
return o()
elseif u(a,ye)then
return o()
elseif u(a,ee)then
R(#e==3)
R(t[1+1]==false)
local a=n(e[0+1],c(),t)
if t[1+1]then
return s(T(ee,{
a,
e[1+1],
e[2+1],
}))
else
return g()
end
end
return g()
elseif Y(e)then
return o()
elseif K(e)then
return o()
end
return g()
end
r[h]=true
__TS__ArrayPush(a,e)
e=k(e)
end
return d(e)
end
function k(a)
local e=H(a)
local t
R(not Q(e))
if G(e)then
t=nt(oe(e),Z(e),a)
elseif Y(e)then
t=it(pe(e),we(e),fe(e),a)
elseif B(e)then
t=et(re(e),le(e),a)
elseif K(e)then
t=ht(ve(e),be(e),a)
else
t=e
end
t=H(t)
A(e,t)
return t
end
function Ve(e)
while l(e)or S(e)do
e=n(me(e))
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
function Fe(t,o,a)
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
return g()
end
function O(a)
local o=y
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return z(De,e(o))
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
function nt(h,t,d)
local i=k(t)
if l(i)then
return d
end
local t
t=function()return N(x,e(ie,e(ye,e(O(h),i))))end
if a(i)then
local e={}
local i=i
while not r(i)do
if l(i)then
return d
elseif a(i)then
__TS__ArrayPush(e,o(i))
i=k(s(i))
else
return t()
end
end
if u(e[0+1],se)then
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
return Qe(h,o,a)
elseif u(e[0+1],rt)then
if#e==1 then
return t()
end
local n=n(I(h,e[1+1]))
if not f(n)then
return t()
end
local i=k(_(n))
if l(i)then
return d
end
if not p(i)then
return t()
end
if not U(i,q)then
return t()
end
local i=k(E(n))
if l(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=k(s(i))
if l(a)then
return d
end
if not r(a)then
return t()
end
local a={O(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif u(e[0+1],ie)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,I(h,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=I(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,I(h,e[t+1]))
t=t+1
end
end
return P(o,a)
end
elseif r(i)then
return i
elseif c(i)then
return Fe(h,i,t())
elseif b(i)then
return t()
end
return g()
end
function c(e)
return p(e)or f(e)
end
function ht(i,u,m)
local function t()
return N(x,e(ie,e(ke,e(i,j(u)))))
end
i=k(i)
if l(i)then
return m
end
if not f(i)then
return t()
end
local e=n(_(i))
if not(p(e)and U(e,d))then
return t()
end
local i=n(E(i))
if not a(i)then
return t()
end
local e=L(o(i))
local i=n(s(i))
if not(a(i)and r(n(s(i))))then
return t()
end
local d=o(i)
local n=Ge
local i=0
while not r(e)do
if c(e)then
local t=y
do
local e=#u-1
while e>=i do
t=h(u[e+1],t)
e=e-1
end
end
n=Ee(n,e,t)
i=#u
e=y
elseif a(e)then
if i<#u then
local t=u[i+1]
i=i+1
n=Ee(n,o(e),t)
e=s(e)
else
return t()
end
else
return t()
end
end
if#u~=i then
return t()
end
return I(n,d)
end
function et(i,t,o)
local a
a=function()return N(x,e(ie,e(i,j(t))))end
for e=1,#Me do
local e=Me[e]
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
return g()
end
end
return a()
end
function it(i,o,t,a)
local a
a=function()return N(x,e(se,e(O(i),o,j(t))))end
if u(o,Pe)then
if#t~=1 then
return a()
end
return t[0+1]
elseif u(o,Be)then
if#t~=2 then
return a()
end
return Ze(i,t[0+1],t[1+1],a)
elseif u(o,dt)then
if#t~=2 then
return a()
end
return he(t[0+1],I(i,t[1+1]))
end
return a()
end
function de(t)
return e(se,Pe,t)
end
function Ze(l,i,m,t)
if t==nil then
t=false
end
local function w()
if t==false then
return N(x,e(se,e(O(l),Be,j({
i,
m,
}))))
else
return t()
end
end
i=L(i)
local n={}
local f=false
local t=i
while not r(t)do
if c(t)then
__TS__ArrayPush(n,t)
f=true
t=y
elseif a(t)then
__TS__ArrayPush(n,o(t))
t=s(t)
else
return w()
end
end
local a=i
if f then
a=j(n)
end
local t={}
Ye(l,function(a,e)
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
a=h(de(st(l,t[e+1])),a)
e=e-1
end
end
return z(d,e(i,h(de(z(d,e(o,m))),a)))
end
function u(e,t)
if e==t then
return true
end
e=n(e)
t=n(t)
if e==t then
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
return U(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif b(e)then
if not b(t)then
return false
end
return i(e,t,M,D)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,_,E)
end
return g()
end
function m(e)
e=H(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(m(o(e)))
i=" "
e=H(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(m(h(_(e),E(e))))
elseif b(e)then
return"!"..tostring(m(h(M(e),D(e))))
elseif p(e)then
return ue(e)
elseif S(e)then
return";("..tostring(m(ge(e))).." "..tostring(m(te(e)))..")"
elseif G(e)then
return"$("..tostring(m(O(oe(e)))).." "..tostring(m(Z(e)))..")"
elseif B(e)then
return"%("..tostring(m(re(e))).." "..tostring(m(j(le(e))))..")"
elseif Y(e)then
return"@("..tostring(m(O(pe(e)))).." "..tostring(m(we(e))).." "..tostring(m(j(fe(e))))..")"
elseif K(e)then
return"^("..tostring(m(ve(e))).." "..tostring(m(j(be(e))))..")"
end
return g()
end
function Je()
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
local e=Je()
c=function()return e end
return e
end
w=function()
local e=Xe()
w=function()return e end
return e
end
qe=0
ne=1
je=2
ae=3
C=4
v=5
F=6
W=7
ze=8
xe=9
Ae=11
Te=10
t.new_comment=he
t.comment_p=S
t.comment_comment=ge
t.comment_x=te
t.un_comment_all=me
local function nt(e)
return w()[e]~=nil
end
local function it(e)
return{
qe,
e,
}
end
local function at(e)
return c()[e]~=nil
end
local function i(e)
return it(c()[e])
end
t.can_new_symbol_p=at
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=p
t.un_symbol=ue
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=s
y={je}
t.Null_V=Null_V
t.null_v=y
t.null_p=r
t.New_Data=New_Data
t.new_data=z
t.data_p=f
t.data_name=_
t.data_list=E
t.New_Error=New_Error
t.new_error=N
t.error_p=b
t.error_name=M
t.error_list=D
t.just_p=Q
t.evaluate=I
t.apply=P
local function c(e)
local o=Ve(e)
local function i(e)
e[1+1]=L(e[1+1])
e[2+1]=L(e[2+1])
if S(e[1+1])or S(e[2+1])then
local t=ot(e)
local a=e[1+1]
local o=e[2+1]
local e=c(a)
local a=c(o)
t[1+1]=e
t[2+1]=a
return t
else
return e
end
end
if f(o)then
return i(o)
elseif b(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=L
t.force_uncomment_all_rec=c
x=i("太始初核")
local je=i("符名")
d=i("化滅")
q=i("式形")
local mt=i("等同")
local ct=i("解算")
local W=i("特定其物")
local w=i("省略一物")
De=i("映表")
local wt=i("如若")
local c=i("一類何物")
local ae=i("是非")
local ze=i("其子")
local Je=i("爻陽")
local Xe=i("爻陰")
local pt=i("引用")
local yt=i("應用")
local vt=i("間空")
local ne=i("連頸")
local xe=i("構物")
local qe=i("謬誤")
local ut=i("詞素")
local Ae=i("列序")
local ft=i("首始")
local lt=i("尾末")
local Ze=i("之物")
local v=i("宇宙亡矣")
local et=i("效應")
local ot=i("註疏")
tt=N(x,e(v,w))
local function v(e)
return z(je,h(x,h(e,y)))
end
local function Te(t)
return v(e(c,e(d,w,t),W))
end
local function C(t,a)
return v(e(c,e(d,e(t),w),a))
end
local function F(t)
return v(e(c,d,e(ae,e(c,t,w))))
end
local tt=Te(xe)
Le=C(xe,je)
Ue=C(xe,Ae)
Re=F(xe)
local ht=Te(qe)
He=C(qe,je)
Ne=C(qe,Ae)
Ie=F(qe)
local st=Te(ne)
Ke=F(ne)
Oe=C(ne,ft)
Se=C(ne,lt)
Ce=F(ut)
We=F(vt)
X=v(e(c,d,e(ae,mt)))
ke=v(e(c,e(d,h(d,w),w),yt))
ye=v(e(c,d,ct))
local Te=C(Ae,e(c,Ze,w))
ee=v(e(c,d,wt))
Pe=v(e(c,q,pt))
Be=v(e(c,e(q,e(d,w,d)),W))
ie=v(e(q,e(x,d)))
se=v(e(q,e(x,q)))
rt=v(e(q,q))
local Ae=v(e(c,d,ot))
dt=v(e(c,q,ot))
local F=z(Xe,e())
local ie=z(Je,e())
local function qe(e,i,n)
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
local function C(e)
return qe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=C
t.new_list=e
local function se(e)
while Q(e)or S(e)do
e=H(me(e))
end
return e
end
t.un_just=H
t.un_just_comment_all=se
t.delay_p=_e
t.delay_just_p=l
local function xe(e)
if G(e)then
return e
elseif Y(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return g()
end
local function se(e)
return oe(xe(e))
end
local function Q(e)
return Z(xe(e))
end
t.delay_env=se
t.delay_x=Q
local function Q(e)
return n(e)
end
local function se(e)
if S(e)then
return te(e)
else
return k(e)
end
end
t.force_all=Q
t.force1=k
t.force_uncomment1=se
t.force_uncomment_all=Ve
Ge={}
local function me(i)
i=n(i)
if not f(i)then
return false
end
local e=n(_(i))
if not p(e)then
return false
end
if not U(e,De)then
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
t.env_null_v=Ge
t.env_set=Ee
t.env_get=Fe
t.env2val=O
t.env_foreach=Ye
t.val2env=me
local function se(t,a)
return{
t,
1,
function(e)
e=k(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return ie
end
return F
end,
}
end
local function Q(t,a,i)
return{
t,
1,
function(e,o)
e=k(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return i(e)
end
return o()
end,
}
end
Me={
se(Re,f),
{
tt,
2,
z,
},
Q(Le,f,_),
Q(Ue,f,E),
se(Ie,b),
{
ht,
2,
N,
},
Q(He,b,M),
Q(Ne,b,D),
se(We,r),
{
st,
2,
h,
},
se(Ke,a),
Q(Oe,a,o),
Q(Se,a,s),
{
X,
2,
function(e,t,i)
if e==t then
return ie
end
e=k(e)
t=k(t)
if l(e)or l(t)then
return T(X,{
e,
t,
})
end
if e==t then
return ie
end
local function i(a,t,e)
return T(ee,{
a,
t,
e,
})
end
local function n(t,e)
return i(t,e,F)
end
R(not l(e))
local function i(o,e,a,t)
return n(T(X,{
a(o),
a(e),
}),T(X,{
t(o),
t(e),
}))
end
if r(e)then
if not r(e)then
return F
end
return ie
elseif p(e)then
if not p(t)then
return F
end
if U(e,t)then
return ie
else
return F
end
elseif f(e)then
if not f(t)then
return F
end
return i(e,t,_,E)
elseif a(e)then
if not a(t)then
return F
end
return i(e,t,o,s)
elseif b(e)then
if not b(t)then
return F
end
return i(e,t,M,D)
end
return g()
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
return P(h,t)
end,
},
{
ye,
2,
function(e,a,t)
local e=me(e)
if e==false then
return t()
end
return I(e,a)
end,
},
se(Ce,p),
{
Te,
1,
function(e,t)
e=k(e)
if l(e)then
return T(Te,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
ee,
3,
function(e,o,a,t)
e=k(e)
if l(e)then
return T(ee,{
e,
o,
a,
})
end
if not f(e)then
return t()
end
local e=n(_(e))
if not p(e)then
return t()
end
if U(e,Je)then
return o
end
if U(e,Xe)then
return a
end
return t()
end,
},
{
Ae,
2,
he,
},
}
t.equal_p=u
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function i(t,e,a,o)
if l(a(t),a(e))and l(o(t),o(e))then
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
return U(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif b(e)then
if not b(t)then
return false
end
return i(e,t,M,D)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,_,E)
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return g()
end
local function k(e)
return m(L(e))
end
t.simple_print=m
t.simple_print_force_all_rec=k
local function X(Z)
local F,b,u,l,m,n,_,A,Q,g,B,Y,M,C,O,U,H,L,S,E,D,k,f,G,K,X
function u()
return#F==b
end
function l()
R(not u())
local e=string.sub(F,b+1,b+1)
b=b+1
return e
end
function m(e)
R(string.sub(F,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function n(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function _(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function A()
if u()then
return false
end
local e=l()
if not _(e)then
m(e)
return false
end
while _(e)and not u()do
e=l()
end
if not _(e)then
m(e)
end
return true
end
function Q()
if u()then
return false
end
local e=l()
local t=""
if not L(e)then
m(e)
return false
end
while L(e)and not u()do
t=tostring(t)..tostring(e)
e=l()
end
if L(e)then
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
local t=J()
local a=t
local function o(a)
local e=J()
V(t,h(a,e))
t=e
end
while true do
A()
if u()then
return n()
end
e=l()
if e==")"then
V(t,y)
return a
end
if e=="."then
A()
local o=S()
V(t,o)
A()
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
local e=S()
o(e)
end
end
function B()
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
return z(o(e),s(e))
end
function Y()
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
return N(o(e),s(e))
end
function L(t)
if _(t)then
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
function S()
A()
local e={
g,
X,
B,
Y,
M,
C,
O,
U,
H,
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
function E(e)
if e==false then
return n()
end
return e
end
function D()
return not u()
end
function k(e)
E(D())
E(l()==e)
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
Q,
a,
B,
Y,
M,
C,
O,
U,
H,
}
else
e={
g,
K,
B,
Y,
M,
C,
O,
U,
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
return n()
end
function G(t)
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
return e(ae,t)
elseif a=="@"then
local a=f()
return e(c,e(d,h(t,w),w),a)
elseif a=="?"then
return e(c,d,e(ae,t))
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
return e(ze,j(t))
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
E(D())
local t=l()
if t=="+"then
local t=f()
return e(q,e(x,t))
else
m(t)
end
local t=f()
return e(q,t)
elseif t==":"then
E(D())
local t=l()
if t=="&"then
k(">")
local t=f()
return e(c,e(q,e(d,w,t)),W)
elseif t==">"then
local t=f()
return e(c,e(d,w,t),W)
else
m(t)
end
local t=f()
return e(c,t,W)
elseif t=="+"then
local t=f()
return e(x,t)
elseif t=="["then
local e=f()
k("]")
return G(e)
elseif t=="_"then
k(":")
local t=f()
return e(c,t,w)
else
m(t)
local e=Q()
if e==false then
return false
end
return G(e)
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
F=Z
b=0
local function i(t,i)
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
local function d(t,h)
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
M=i("$",function(e,t)
local e=me(e)
if e==false then
return n()
end
return I(e,t)
end)
C=i("%",function(t,e)
local e=qe(e,function(e)return e end,function(e,e)return n()end)
return T(t,e)
end)
O=d("@",function(o,a,e)
local t=qe(e,function(e)return e end,function(e,e)return n()end)
local e=me(o)
if e==false then
return n()
end
return Qe(e,a,t)
end)
U=i("^",function(t,e)
local e=qe(e,function(e)return e end,function(e,e)return n()end)
return P(t,e)
end)
H=i(";",function(e,t)return he(e,t)end)
return S()
end
t.complex_parse=X
local function k(y)
local function i(h,u)
if p(h)then
return ue(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=C(h)
if e~=false and#e==3 and l(e[0+1],c)then
local n=C(e[1+1])
if n~=false and#n==3 and l(n[0+1],d)then
local h=n[1+1]
local r=C(h)
if r~=false and#r==1 and l(n[2+1],w)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(s(h),w)and l(n[2+1],w)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,w)and l(e[2+1],W)then
return t(":>"..tostring(i(n[2+1],true)))
end
end
local a=C(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ae)then
return t(tostring(i(a[1+1],true)).."?")
end
if n~=false and#n==2 and l(e[2+1],W)and l(n[0+1],q)then
local e=C(n[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],w)and"_"or l(e[2+1],W)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],q)then
local a=C(e[1+1])
if a~=false and#a==2 and l(a[0+1],x)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ae)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],x)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ze)then
local e=C(e[1+1])
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
return m(h)
else
return m(v(h))
end
end
local e=X(m(y))
local n=""
local d=""
if r(e)then
return"()"
elseif a(e)then
n="("
d=""
while a(e)do
n=tostring(n)..tostring(d)..tostring(k(o(e)))
d=" "
e=s(e)
end
if r(e)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(k(e))..")"
end
return n
elseif f(e)then
local a=_(e)
local t=E(e)
local e=C(t)
if e~=false and#e==2 and l(a,je)and l(e[0+1],x)then
return i(e[1+1],false)
end
return"#"..tostring(k(h(a,t)))
elseif b(e)then
return"!"..tostring(k(h(M(e),D(e))))
elseif p(e)then
return ue(e)
elseif S(e)then
return";("..tostring(k(ge(e))).." "..tostring(k(te(e)))..")"
elseif G(e)then
return"$("..tostring(k(O(oe(e)))).." "..tostring(k(Z(e)))..")"
elseif B(e)then
return"%("..tostring(k(re(e))).." "..tostring(k(j(le(e))))..")"
elseif Y(e)then
return"@("..tostring(k(O(pe(e)))).." "..tostring(k(we(e))).." "..tostring(k(j(fe(e))))..")"
elseif K(e)then
return"^("..tostring(k(ve(e))).." "..tostring(k(j(be(e))))..")"
end
return g()
end
t.complex_print=k
local function m(n)
local r=J()
local o={function(e)return V(r,e)end}
local e=0
local function i()
error("MT parse ERROR")
end
local function d(e)
if not e then
return i()
end
end
local function l()
d(#n>e)
local t=string.sub(n,e+1,e+1)
e=e+1
return t
end
local s={}
while#o~=0 do
local t={}
for e=1,#o do
local a=o[e]
local e=l()
local o
o=function(i)
local o=J()
local e=J()
__TS__ArrayPush(t,function(e)return V(o,e)end)
__TS__ArrayPush(t,function(t)return V(e,t)end)
a(i(o,e))
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
if nt(e)then
a(it(e))
else
return i()
end
elseif e=="."then
o(h)
elseif e=="#"then
o(z)
elseif e=="!"then
o(N)
elseif e=="$"then
local o=false
local e=false
__TS__ArrayPush(t,function(e)
o=e
end)
__TS__ArrayPush(t,function(t)
e=t
end)
__TS__ArrayPush(s,function()
if o==false or e==false then
return g()
else
local t=me(o)
if t==false then
return i()
else
a(I(t,e))
end
end
end)
elseif e=="_"then
a(y)
else
return i()
end
end
o=t
end
d(e==#n)
for e=1,#s do
local e=s[e]
e()
end
return r
end
local function l(e)
local n={e}
local i=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=H(e)
local t
t=function(e,a,o,t)
i=tostring(i)..tostring(a)
__TS__ArrayPush(h,o(e))
__TS__ArrayPush(h,t(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ce(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,s)
elseif r(e)then
i=tostring(i).."_"
elseif f(e)then
t(e,"#",_,E)
elseif b(e)then
t(e,"!",M,D)
elseif _e(e)then
local e=xe(e)
t(e,"$",(function(e)return O(oe(e))end),Z)
else
return g()
end
end
n=h
end
return i
end
t.machinetext_parse=m
t.machinetext_print=l
local function k(e)
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
t.trampoline_return=k
t.trampoline_delay=l
t.run_trampoline=g
local b=v(h(ze,h(h(et,h(h(c,h(Ze,h(w,y))),y)),y)))
local v=v(h(ze,h(h(et,h(ne,y)),y)))
local function j(a,t)
return z(v,e(a,t))
end
local function q(e)
return z(b,e)
end
local function w(m,p,c,y,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
c=n(c)
if f(c)then
local f=_(c)
local t=E(c)
if u(f,b)then
t=n(t)
if a(t)then
local e=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local t=e
local a=y
local e
e=function()return m(t,a)end
return l(e)
else
local a
a=m
local t
t=p
local o=e
local i=y
local e
e=function()return w(a,t,P(h,o),i)end
return l(e)
end
end
end
elseif u(f,v)then
t=n(t)
if a(t)then
local u=o(t)
local t=n(s(t))
if a(t)then
local o=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local a
a=m
local t
t=p
local n=u
local o=o
local i=y
local e
e=function()return w(a,t,n,i,o)end
return l(e)
else
local t
t=m
local a
a=p
local u=u
local r=o
local s=y
local n=h
local i=i("序甲")
local o
o=function()return w(t,a,u,s,z(d,e(e(i),g(e(de(r),i),de(n)))))end
return l(o)
end
end
end
end
end
end
if h==false then
return l(function()return p(c,y,m)end)
else
return l(function()return p(c,y,function(e,t)return l(function()return w(m,p,P(h,{e}),t)end)end)end)
end
end
local function a(a,t,o,e)
return w(a,t,o,e)
end
local function n(e,i,o,a)
return g(w((function(t,a)return k(e(t,a))end),(function(a,t,e)return k(i(a,t,function(a,t)return g(e(a,t))end))end),o,a))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=a
t.run_monad_stackoverflow=n
return t