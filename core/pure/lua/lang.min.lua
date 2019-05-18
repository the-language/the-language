function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,H,v,fe,Le,Ue,me,we,G,C,K,re,oe,ce,Ve,je,R,ke,xe,y,le,de,h,a,o,i,p,r,z,m,_,T,O,b,L,U,Q,n,I,P,ie,ee,Ge,B,ge,pe,ye,E,F,ne,se,W,Y,ve,qe,D,X,u,A,V,tt,x,d,j,Qe,Je,Be,Ke,Fe,De,We,Ye,Pe,Ce,Ae,Se,He,ae,be,ue,te,Ne,Re,Z,he,Xe,Ze,M,q,e,S,_e,l,s,g,Ie,Ee,ze,Oe,et,N,Te,at,f,Me,it,ot,rt,J,st,c,w,ht,nt
function k()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return k()
end
end
function je(e,t)
return{
ce,
e,
t,
}
end
function R(e)
return e[0+1]==ce
end
function ke(e)
return e[2+1]
end
function xe(e)
while R(e)do
e=ke(e)
end
return e
end
function y(e)
return e[0+1]==fe
end
function le(e)
return e[1+1]
end
function de(e)
return v()[le(e)]
end
function h(t,e)
return{
Le,
t,
e,
}
end
function a(e)
return e[0+1]==Le
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==Ue
end
function z(e,t)
return{
me,
e,
t,
}
end
function m(e)
return e[0+1]==me
end
function _(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function O(e,t)
return{
we,
e,
t,
}
end
function b(e)
return e[0+1]==we
end
function L(e)
return e[1+1]
end
function U(e)
return e[2+1]
end
function Q(e)
return e[0+1]==G
end
function n(e)
return e[1+1]
end
function I(e,t)
return{
C,
e,
t,
}
end
function P(e)
return e[0+1]==C
end
function ie(e)
return e[1+1]
end
function ee(e)
return e[2+1]
end
function Ge(t,e,a)
return{
re,
t,
e,
a,
}
end
function B(e)
return e[0+1]==re
end
function ge(e)
return e[1+1]
end
function pe(e)
return e[2+1]
end
function ye(e)
return e[3+1]
end
function E(t,e)
return{
K,
t,
e,
}
end
function F(e)
return e[0+1]==K
end
function ne(e)
return e[1+1]
end
function se(e)
return e[2+1]
end
function W(e,t)
return{
oe,
e,
t,
}
end
function Y(e)
return e[0+1]==oe
end
function ve(e)
return e[1+1]
end
function qe(e)
return e[2+1]
end
function D(e)
local e=s(e)
local function t(e)
e[1+1]=D(e[1+1])
e[2+1]=D(e[2+1])
return e
end
if m(e)then
return t(e)
elseif b(e)then
return t(e)
elseif a(e)then
return t(e)
elseif R(e)then
return t(e)
end
return e
end
function X()
return{Ve}
end
function u(e)
return e[0+1]==Ve
end
function A(e,t)
if e==t then
return
end
e[0+1]=G
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function V(e,a)
H(u(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function tt(t)
local e=X()
V(e,t)
return e
end
function M(t,e)
if t==e then
return true
end
if le(t)==le(e)then
A(t,e)
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
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
__TS__ArrayPush(t,e)
e=n(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function _e(e)
return P(e)or B(e)or F(e)or Y(e)
end
function l(e)
return Q(e)or _e(e)
end
function s(o,i,t,a)
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
local e,d,n
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
function n(t)
d(t)
if l(t)then
__TS__ArrayPush(a,e)
return s(t,i,{
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
return n(Je)
end
local function u()
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
e=g(e)
t=t+1
end
end
while l(e)do
local h=w(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if P(e)then
return o()
elseif F(e)then
local a=ne(e)
local e=se(e)
local h={
Be,
Ke,
Fe,
De,
We,
Ye,
Pe,
Ce,
Ae,
Se,
He,
}
local i=false
for e=1,#h do
local e=h[e]
if c(e,a)then
i=true
break
end
end
if i then
H(#e==1)
H(t[1+1]==false)
local e=s(e[0+1],u(),t)
if t[1+1]then
return n(E(a,{e}))
else
return k()
end
end
if c(a,ae)then
return o()
elseif c(a,be)then
return o()
elseif c(a,ue)then
return o()
elseif c(a,te)then
H(#e==3)
H(t[1+1]==false)
local a=s(e[0+1],u(),t)
if t[1+1]then
return n(E(te,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif B(e)then
return o()
elseif Y(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return d(e)
end
function g(a)
local e=S(a)
local t
H(not Q(e))
if P(e)then
t=at(ie(e),ee(e),a)
elseif B(e)then
t=rt(ge(e),pe(e),ye(e),a)
elseif F(e)then
t=ot(ne(e),se(e),a)
elseif Y(e)then
t=it(ve(e),qe(e),a)
else
t=e
end
t=S(t)
A(e,t)
return t
end
function Ie(e)
while l(e)or R(e)do
e=s(xe(e))
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
function Oe(t,a,o)
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
function et(t,a)
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
function N(o)
local a=p
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return z(Qe,e(a))
end
function Te(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function at(h,t,d)
local n=g(t)
if l(n)then
return d
end
local t=O(x,e(Z,e(ue,e(N(h),n))))
if a(n)then
local e={}
local n=n
while not r(n)do
if l(n)then
return d
elseif a(n)then
__TS__ArrayPush(e,o(n))
n=g(i(n))
else
return t
end
end
if c(e[0+1],he)then
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
elseif c(e[0+1],Xe)then
if#e==1 then
return t
end
local s=s(I(h,e[1+1]))
if not m(s)then
return t
end
local n=g(_(s))
if l(n)then
return d
end
if not y(n)then
return t
end
if not M(n,j)then
return t
end
local n=g(T(s))
if l(n)then
return d
end
if not a(n)then
return t
end
local o=o(n)
local a=g(i(n))
if l(a)then
return d
end
if not r(a)then
return t
end
local a={N(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return W(o,a)
elseif c(e[0+1],Z)then
if#e==1 then
return t
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
return E(o,a)
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
return W(o,a)
end
elseif r(n)then
return n
elseif f(n)then
return Oe(h,n,t)
elseif b(n)then
return t
end
return k()
end
function f(e)
return y(e)or m(e)
end
function it(t,n,c)
local function u()
return O(x,e(Z,e(be,e(t,q(n)))))
end
t=g(t)
if l(t)then
return c
end
if not m(t)then
return u()
end
local e=s(_(t))
if not(y(e)and M(e,d))then
return u()
end
local t=s(T(t))
if not a(t)then
return u()
end
local e=D(o(t))
local t=s(i(t))
if not(a(t)and r(s(i(t))))then
return u()
end
local d=o(t)
local s=Ee
local t=0
while not r(e)do
if f(e)then
local a=p
do
local e=#n-1
while e>=t do
a=h(n[e+1],a)
e=e-1
end
end
s=ze(s,e,a)
t=#n
e=p
elseif a(e)then
if t<#n then
local a=n[t+1]
t=t+1
s=ze(s,o(e),a)
e=i(e)
else
return u()
end
else
return u()
end
end
if#n~=t then
return u()
end
return I(s,d)
end
function ot(i,t,o)
local a=O(x,e(Z,e(i,q(t))))
for e=1,#Me do
local e=Me[e]
if c(i,e[0+1])then
if#t~=e[1+1]then
return a
end
if e[1+1]==1 then
return e[2+1](t[0+1],a,o)
elseif e[1+1]==2 then
return e[2+1](t[0+1],t[1+1],a,o)
elseif e[1+1]==3 then
return e[2+1](t[0+1],t[1+1],t[2+1],a,o)
end
return k()
end
end
return a
end
function rt(o,a,t,i)
local e=O(x,e(he,e(N(o),a,q(t))))
if c(a,Ne)then
if#t~=1 then
return e
end
return t[0+1]
elseif c(a,Re)then
if#t~=2 then
return e
end
return st(o,t[0+1],t[1+1],e)
elseif c(a,Ze)then
if#t~=2 then
return e
end
return je(t[0+1],I(o,t[1+1]))
end
return e
end
function J(t)
return e(he,Ne,t)
end
function st(l,n,m,t)
if t==nil then
t=false
end
local function w()
if t==false then
return O(x,e(he,e(N(l),Re,q({
n,
m,
}))))
else
return t
end
end
n=D(n)
local s={}
local u=false
local t=n
while not r(t)do
if f(t)then
__TS__ArrayPush(s,t)
u=true
t=p
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=i(t)
else
return w()
end
end
local a=n
if u then
a=q(s)
end
local t={}
Te(l,function(a,e)
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
a=h(J(et(l,t[e+1])),a)
e=e-1
end
end
return z(d,e(n,h(J(z(d,e(o,m))),a)))
end
function c(e,t)
if e==t then
return true
end
e=s(e)
t=s(t)
if e==t then
return true
end
local function n(t,e,o,a)
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
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return false
end
return n(e,t,L,U)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,_,T)
end
return k()
end
function w(e)
e=S(e)
local t=""
local n=""
if r(e)then
return"()"
elseif a(e)then
t="("
n=""
while a(e)do
t=tostring(t)..tostring(n)..tostring(w(o(e)))
n=" "
e=S(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(_(e),T(e))))
elseif b(e)then
return"!"..tostring(w(h(L(e),U(e))))
elseif y(e)then
return de(e)
elseif P(e)then
return"$("..tostring(w(N(ie(e)))).." "..tostring(w(ee(e)))..")"
elseif F(e)then
return"%("..tostring(w(ne(e))).." "..tostring(w(q(se(e))))..")"
elseif B(e)then
return"@("..tostring(w(N(ge(e)))).." "..tostring(w(pe(e))).." "..tostring(w(q(ye(e))))..")"
elseif Y(e)then
return"^("..tostring(w(ve(e))).." "..tostring(w(q(qe(e))))..")"
end
return k()
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
local u
u=function()
local e=ht()
u=function()return e end
return e
end
v=function()
local e=nt()
v=function()return e end
return e
end
fe=0
Le=1
Ue=2
me=3
we=4
G=5
C=6
K=7
re=8
oe=9
ce=11
Ve=10
local function n(e)
return e[1+1]
end
t.new_comment=je
t.comment_p=R
t.comment_comment=n
t.comment_x=ke
t.un_comment_all=xe
local function ht(e)
return v()[e]~=nil
end
local function at(e)
return{
fe,
e,
}
end
local function ot(e)
return u()[e]~=nil
end
local function n(e)
return at(u()[e])
end
t.can_new_symbol_p=ot
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=y
t.un_symbol=de
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={Ue}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=z
t.data_p=m
t.data_name=_
t.data_list=T
t.New_Error=New_Error
t.new_error=O
t.error_p=b
t.error_name=L
t.error_list=U
t.just_p=Q
t.evaluate=I
t.apply=W
local function u(e)
local o=Ie(e)
local function i(e)
e[1+1]=D(e[1+1])
e[2+1]=D(e[2+1])
if R(e[1+1])or R(e[2+1])then
local t=tt(e)
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
elseif b(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=D
t.force_uncomment_all_rec=u
x=n("太始初核")
local fe=n("符名")
d=n("化滅")
j=n("式形")
local yt=n("等同")
local wt=n("解算")
local K=n("特定其物")
local f=n("省略一物")
Qe=n("映表")
local ft=n("如若")
local u=n("一類何物")
local oe=n("是非")
local me=n("其子")
local Ve=n("爻陽")
local et=n("爻陰")
local rt=n("引用")
local pt=n("應用")
local mt=n("間空")
local re=n("連頸")
local ce=n("構物")
local we=n("謬誤")
local st=n("詞素")
local Ue=n("列序")
local ut=n("首始")
local ct=n("尾末")
local tt=n("之物")
local v=n("宇宙亡矣")
local it=n("效應")
local nt=n("註疏")
Je=O(x,e(v,f))
local function v(e)
return z(fe,h(x,h(e,p)))
end
local function Le(t)
return v(e(u,e(d,f,t),K))
end
local function C(a,t)
return v(e(u,e(d,e(a),f),t))
end
local function G(t)
return v(e(u,d,e(oe,e(u,t,f))))
end
local dt=Le(ce)
Be=C(ce,fe)
Ke=C(ce,Ue)
Fe=G(ce)
local Je=Le(we)
De=C(we,fe)
We=C(we,Ue)
Ye=G(we)
local lt=Le(re)
Pe=G(re)
Ce=C(re,ut)
Ae=C(re,ct)
Se=G(st)
He=G(mt)
ae=v(e(u,d,e(oe,yt)))
be=v(e(u,e(d,h(d,f),f),pt))
ue=v(e(u,d,wt))
local Le=C(Ue,e(u,tt,f))
te=v(e(u,d,ft))
Ne=v(e(u,j,rt))
Re=v(e(u,e(j,e(d,f,d)),K))
Z=v(e(j,e(x,d)))
he=v(e(j,e(x,j)))
Xe=v(e(j,j))
local Ne=v(e(u,d,nt))
Ze=v(e(u,j,nt))
local G=z(et,e())
local he=z(Ve,e())
local function we(e,n,s)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=i(e)
end
if r(e)then
return n(t)
end
return s(t,e)
end
local function C(e)
return we(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=q
t.maybe_list_to_jsArray=C
t.new_list=e
local function ce(e)
while Q(e)or R(e)do
e=S(xe(e))
end
return e
end
t.un_just=S
t.un_just_comment_all=ce
t.delay_p=_e
t.delay_just_p=l
local function xe(e)
if P(e)then
return e
elseif B(e)then
error("WIP")
elseif F(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return k()
end
local function ce(e)
return ie(xe(e))
end
local function Q(e)
return ee(xe(e))
end
t.delay_env=ce
t.delay_x=Q
local function ce(e)
return s(e)
end
local function Q(e)
if R(e)then
return ke(e)
else
return g(e)
end
end
t.force_all=ce
t.force1=g
t.force_uncomment1=Q
t.force_uncomment_all=Ie
Ee={}
local function ce(n)
n=s(n)
if not m(n)then
return false
end
local e=s(_(n))
if not y(e)then
return false
end
if not M(e,Qe)then
return false
end
e=s(T(n))
if not a(e)then
return false
end
if not r(s(i(e)))then
return false
end
local n={}
local h=s(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=s(o(h))
h=s(i(h))
if not a(e)then
return false
end
local h=o(e)
e=s(i(e))
if not a(e)then
return false
end
local t=o(e)
if not r(s(i(e)))then
return false
end
local a=true
do
local e=0
while e<#n do
if c(n[(e+0)+1],h)then
n[(e+1)+1]=t
a=false
break
end
e=e+2
end
end
if a then
__TS__ArrayPush(n,h)
__TS__ArrayPush(n,t)
end
end
return n
end
t.env_null_v=Ee
t.env_set=ze
t.env_get=Oe
t.env2val=N
t.env_foreach=Te
t.val2env=ce
local function Q(t,a)
return{
t,
1,
function(e,o)
e=g(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return he
end
return G
end,
}
end
local function R(t,a,o)
return{
t,
1,
function(e,i)
e=g(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return o(e)
end
return i
end,
}
end
Me={
Q(Fe,m),
{
dt,
2,
z,
},
R(Be,m,_),
R(Ke,m,T),
Q(Ye,b),
{
Je,
2,
O,
},
R(De,b,L),
R(We,b,U),
Q(He,r),
{
lt,
2,
h,
},
Q(Pe,a),
R(Ce,a,o),
R(Ae,a,i),
{
ae,
2,
function(e,t,n)
if e==t then
return he
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return E(ae,{
e,
t,
})
end
if e==t then
return he
end
local function n(a,e,t)
return E(te,{
a,
e,
t,
})
end
local function s(t,e)
return n(t,e,G)
end
H(not l(e))
local function n(a,o,e,t)
return s(E(ae,{
e(a),
e(o),
}),E(ae,{
t(a),
t(o),
}))
end
if r(e)then
if not r(e)then
return G
end
return he
elseif y(e)then
if not y(t)then
return G
end
if M(e,t)then
return he
else
return G
end
elseif m(e)then
if not m(t)then
return G
end
return n(e,t,_,T)
elseif a(e)then
if not a(t)then
return G
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return G
end
return n(e,t,L,U)
end
return k()
end,
},
{
be,
2,
function(n,e,h)
local t={}
local e=s(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(i(e))
end
if not r(e)then
return h
end
return W(n,t)
end,
},
{
ue,
2,
function(e,t,a)
local e=ce(e)
if e==false then
return a
end
return I(e,t)
end,
},
Q(Se,y),
{
Le,
1,
function(e,t)
e=g(e)
if l(e)then
return E(Le,{e})
end
if not a(e)then
return t
end
return o(e)
end,
},
{
te,
3,
function(e,a,o,t)
e=g(e)
if l(e)then
return E(te,{
e,
a,
o,
})
end
if not m(e)then
return t
end
local e=s(_(e))
if not y(e)then
return t
end
if M(e,Ve)then
return a
end
if M(e,et)then
return o
end
return t
end,
},
{
Ne,
2,
je,
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
local function n(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
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
A(e,p)
A(t,p)
return true
elseif y(e)then
if not y(t)then
return false
end
return M(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return false
end
return n(e,t,L,U)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,_,T)
elseif P(e)then
error("WIP")
elseif F(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return k()
end
local function g(e)
return w(D(e))
end
t.simple_print=w
t.simple_print_force_all_rec=g
local function te(J)
local C,b,c,l,m,s,A,_,P,g,Y,N,D,R,S,L,U,F,T,M,k,w,B,G,Q
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
function s(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function _()
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
function P()
if c()then
return false
end
local e=l()
local t=""
if not U(e)then
m(e)
return false
end
while U(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if U(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if ot(t)then
return n(t)
else
return s("Not Symbol"..tostring(t))
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
V(t,h(a,e))
t=e
end
while true do
_()
if c()then
return s()
end
e=l()
if e==")"then
V(t,p)
return a
end
if e=="."then
_()
local o=F()
V(t,o)
_()
if c()then
return s()
end
e=l()
if e~=")"then
return s()
end
return a
end
m(e)
local e=F()
o(e)
end
end
function Y()
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
return s()
end
if not a(e)then
return s()
end
return z(o(e),i(e))
end
function N()
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
return s()
end
if not a(e)then
return s()
end
return O(o(e),i(e))
end
function U(t)
if A(t)then
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
}
for a=1,#e do
local e=e[a]
if e==t then
return false
end
end
return true
end
function F()
_()
local e={
g,
Q,
Y,
N,
D,
R,
S,
L,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return s()
end
function T(e)
if e==false then
return s()
end
return e
end
function M()
return not c()
end
function k(e)
T(M())
T(l()==e)
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
P,
a,
Y,
N,
D,
R,
S,
L,
}
else
e={
g,
G,
Y,
N,
D,
R,
S,
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
return s()
end
function B(t)
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
return e(oe,t)
elseif a=="@"then
local a=w()
return e(u,e(d,h(t,f),f),a)
elseif a=="?"then
return e(u,d,e(oe,t))
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
return e(me,q(t))
else
m(a)
return t
end
end
function G()
if c()then
return false
end
local t=l()
if t=="&"then
T(M())
local t=l()
if t=="+"then
local t=w()
return e(j,e(x,t))
else
m(t)
end
local t=w()
return e(j,t)
elseif t==":"then
T(M())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(j,e(d,f,t)),K)
elseif t==">"then
local t=w()
return e(u,e(d,f,t),K)
else
m(t)
end
local t=w()
return e(u,t,K)
elseif t=="+"then
local t=w()
return e(x,t)
elseif t=="["then
local e=w()
k("]")
return B(e)
elseif t=="_"then
k(":")
local t=w()
return e(u,t,f)
else
m(t)
local e=P()
if e==false then
return false
end
return B(e)
end
end
function Q()
local e=G()
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
local function n(t,n)
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
return s()
end
if not a(e)then
return s()
end
local t=i(e)
if not(a(t)and r(i(t)))then
return s()
end
return n(o(e),o(t))
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
return s()
end
if not a(e)then
return s()
end
local n=i(e)
if not a(n)then
return s()
end
local t=i(n)
if not(a(t)and r(i(t)))then
return s()
end
return h(o(e),o(n),o(t))
end
end
D=n("$",function(e,t)
local e=ce(e)
if e==false then
return s()
end
return I(e,t)
end)
R=n("%",function(e,t)
local t=we(t,function(e)return e end,function(e,e)return s()end)
return E(e,t)
end)
S=h("@",function(e,a,t)
local t=we(t,function(e)return e end,function(e,e)return s()end)
local e=ce(e)
if e==false then
return s()
end
return Ge(e,a,t)
end)
L=n("^",function(t,e)
local e=we(e,function(e)return e end,function(e,e)return s()end)
return W(t,e)
end)
return F()
end
t.complex_parse=te
local function g(p)
local function n(r,c)
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
local e=C(r)
if e~=false and#e==3 and l(e[0+1],u)then
local s=C(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=C(h)
if r~=false and#r==1 and l(s[2+1],f)then
return t(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),f)and l(s[2+1],f)then
return t(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,f)and l(e[2+1],K)then
return t(":>"..tostring(n(s[2+1],true)))
end
end
local a=C(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],oe)then
return t(tostring(n(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],K)and l(s[0+1],j)then
local e=C(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],f)then
return t(":&>"..tostring(n(e[2+1],true)))
end
end
local a=l(e[2+1],f)and"_"or l(e[2+1],K)and""or n(e[2+1],true)
return t(tostring(a)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],j)then
local a=C(e[1+1])
if a~=false and#a==2 and l(a[0+1],x)then
return t("&+"..tostring(n(a[1+1],true)))
end
return t("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],oe)then
return t(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],x)then
return t("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],me)then
local e=C(e[1+1])
if e~=false and#e>1 then
local a=n(e[0+1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(n(e[t+1],true))
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
local e=te(w(p))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(g(o(e)))
d=" "
e=i(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(g(e))..")"
end
return s
elseif m(e)then
local t=_(e)
local a=T(e)
local e=C(a)
if e~=false and#e==2 and l(t,fe)and l(e[0+1],x)then
return n(e[1+1],false)
end
return"#"..tostring(g(h(t,a)))
elseif b(e)then
return"!"..tostring(g(h(L(e),U(e))))
elseif y(e)then
return de(e)
elseif P(e)then
return"$("..tostring(g(N(ie(e)))).." "..tostring(g(ee(e)))..")"
elseif F(e)then
return"%("..tostring(g(ne(e))).." "..tostring(g(q(se(e))))..")"
elseif B(e)then
return"@("..tostring(g(N(ge(e)))).." "..tostring(g(pe(e))).." "..tostring(g(q(ye(e))))..")"
elseif Y(e)then
return"^("..tostring(g(ve(e))).." "..tostring(g(q(qe(e))))..")"
end
return k()
end
t.complex_print=g
local function l(i)
local r=X()
local o={r}
local a=0
local function n()
error("MT parse ERROR")
end
local function d(e)
if not e then
return n()
end
end
local function s()
d(#i>a)
local e=string.sub(i,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=s()
local a
a=function(a)
local t=X()
local e=X()
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,e)
V(o,a(t,e))
end
if t=="^"then
local e=""
while true do
local t=s()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if ht(e)then
V(o,at(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(z)
elseif t=="!"then
a(O)
elseif t=="$"then
a(function(t,a)return I(Ee,e(Z,ue,J(t),J(a)))end)
elseif t=="_"then
V(o,p)
else
return n()
end
end
o=i
end
d(a==#i)
return r
end
local function w(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=S(e)
local t
t=function(e,a,t,o)
n=tostring(n)..tostring(a)
__TS__ArrayPush(h,t(e))
__TS__ArrayPush(h,o(e))
end
if y(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(le(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif m(e)then
t(e,"#",_,T)
elseif b(e)then
t(e,"!",L,U)
elseif _e(e)then
local e=xe(e)
t(e,"$",(function(e)return N(ie(e))end),ee)
else
return k()
end
end
s=h
end
return n
end
t.machinetext_parse=l
t.machinetext_print=w
local function b(e)
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
t.trampoline_return=b
t.trampoline_delay=l
t.run_trampoline=k
local g=v(h(me,h(h(it,h(h(u,h(tt,h(f,p))),p)),p)))
local v=v(h(me,h(h(it,h(re,p)),p)))
local function q(a,t)
return z(v,e(a,t))
end
local function j(e)
return z(g,e)
end
local function p(w,y,u,f,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=s(u)
if m(u)then
local m=_(u)
local t=T(u)
if c(m,g)then
t=s(t)
if a(t)then
local a=o(t)
local e=s(i(t))
if r(e)then
if h==false then
local a=a
local t=f
local e
e=function()return w(a,t)end
return l(e)
else
local e
e=w
local o
o=y
local i=a
local a=f
local t
t=function()return p(e,o,W(h,i),a)end
return l(t)
end
end
end
elseif c(m,v)then
t=s(t)
if a(t)then
local u=o(t)
local t=s(i(t))
if a(t)then
local a=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local e
e=w
local t
t=y
local i=u
local n=a
local o=f
local a
a=function()return p(e,t,i,o,n)end
return l(a)
else
local t
t=w
local i
i=y
local u=u
local r=a
local s=f
local h=h
local o=n("序甲")
local a
a=function()return p(t,i,u,s,z(d,e(e(o),b(e(J(r),o),J(h)))))end
return l(a)
end
end
end
end
end
end
if h==false then
return l(function()return y(u,f,w)end)
else
return l(function()return y(u,f,function(e,t)return l(function()return p(w,y,W(h,{e}),t)end)end)end)
end
end
local function i(o,t,e,a)
return p(o,t,e,a)
end
local function o(e,a,o,i)
return k(p((function(t,a)return b(e(t,a))end),(function(o,e,t)return b(a(o,e,function(a,e)return k(t(a,e))end))end),o,i))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=i
t.run_monad_stackoverflow=o
return t