function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,H,c,v,D,W,Oe,ve,ye,pe,fe,B,Z,Ae,we,le,I,be,ne,de,y,se,he,h,a,o,i,p,r,_,f,z,E,N,b,M,C,X,n,S,F,ie,oe,Qe,Y,ke,ge,_e,T,K,me,ue,P,V,ze,Ee,L,J,Xe,A,G,Ze,j,d,q,We,Je,Ie,Me,Pe,Ye,Ve,Be,Ke,Ge,Le,Re,De,ae,Te,ce,te,He,Ne,ee,re,st,ot,U,x,e,R,xe,l,s,g,Se,je,qe,Ue,dt,O,Fe,rt,w,Ce,ht,it,nt,Q,at,u,m,tt,et
function k()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return k()
end
end
function le(t,e)
return{
Ae,
t,
e,
}
end
function I(e)
return e[0+1]==Ae
end
function be(e)
return e[1+1]
end
function ne(e)
return e[2+1]
end
function de(e)
while I(e)do
e=ne(e)
end
return e
end
function y(e)
return e[0+1]==v
end
function se(e)
return e[1+1]
end
function he(e)
return c()[se(e)]
end
function h(t,e)
return{
D,
t,
e,
}
end
function a(e)
return e[0+1]==D
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==W
end
function _(e,t)
return{
Oe,
e,
t,
}
end
function f(e)
return e[0+1]==Oe
end
function z(e)
return e[1+1]
end
function E(e)
return e[2+1]
end
function N(e,t)
return{
ve,
e,
t,
}
end
function b(e)
return e[0+1]==ve
end
function M(e)
return e[1+1]
end
function C(e)
return e[2+1]
end
function X(e)
return e[0+1]==ye
end
function n(e)
return e[1+1]
end
function S(e,t)
return{
pe,
e,
t,
}
end
function F(e)
return e[0+1]==pe
end
function ie(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function Qe(e,a,t)
return{
B,
e,
a,
t,
}
end
function Y(e)
return e[0+1]==B
end
function ke(e)
return e[1+1]
end
function ge(e)
return e[2+1]
end
function _e(e)
return e[3+1]
end
function T(e,t)
return{
fe,
e,
t,
}
end
function K(e)
return e[0+1]==fe
end
function me(e)
return e[1+1]
end
function ue(e)
return e[2+1]
end
function P(e,t)
return{
Z,
e,
t,
}
end
function V(e)
return e[0+1]==Z
end
function ze(e)
return e[1+1]
end
function Ee(e)
return e[2+1]
end
function L(e)
local e=s(e)
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
elseif I(e)then
return t(e)
end
return e
end
function J()
return{we}
end
function Xe(e)
return e[0+1]==we
end
function A(e,t)
if e==t then
return
end
e[0+1]=ye
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function G(e,t)
H(Xe(e))
local e=e
local t=t
e[0+1]=t[0+1]
e[1+1]=t[1+1]
e[2+1]=t[2+1]
e[3+1]=t[3+1]
end
function Ze(t)
local e=J()
G(e,t)
return e
end
function U(e,t)
if e==t then
return true
end
if se(e)==se(t)then
A(e,t)
return true
else
return false
end
end
function x(a)
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
return x(e)
end
function R(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
__TS__ArrayPush(t,e)
e=n(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function xe(e)
return F(e)or Y(e)or K(e)or V(e)
end
function l(e)
return X(e)or xe(e)
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
local e,r,n
function r(t)
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
r(t)
if l(t)then
__TS__ArrayPush(a,e)
return s(t,i,{
false,
false,
},a)
end
return t
end
local d={}
e=o
local function o()
t[1+1]=true
return n(Je)
end
local function c()
local e={}
for t in pairs(d)do
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
local h=m(e)
if i[h]==true then
return o()
end
if d[h]==true then
t[0+1]=true
if F(e)then
return o()
elseif K(e)then
local a=me(e)
local e=ue(e)
local i={
Ie,
Me,
Pe,
Ye,
Ve,
Be,
Ke,
Ge,
Le,
Re,
De,
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
H(#e==1)
H(t[1+1]==false)
local e=s(e[0+1],c(),t)
if t[1+1]then
return n(T(a,{e}))
else
return k()
end
end
if u(a,ae)then
return o()
elseif u(a,Te)then
return o()
elseif u(a,ce)then
return o()
elseif u(a,te)then
H(#e==3)
H(t[1+1]==false)
local a=s(e[0+1],c(),t)
if t[1+1]then
return n(T(te,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif Y(e)then
return o()
elseif V(e)then
return o()
end
return k()
end
d[h]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return r(e)
end
function g(a)
local e=R(a)
local t
H(not X(e))
if F(e)then
t=rt(ie(e),oe(e),a)
elseif Y(e)then
t=nt(ke(e),ge(e),_e(e),a)
elseif K(e)then
t=it(me(e),ue(e),a)
elseif V(e)then
t=ht(ze(e),Ee(e),a)
else
t=e
end
t=R(t)
A(e,t)
return t
end
function Se(e)
while l(e)or I(e)do
e=s(de(e))
end
return e
end
function qe(a,o,i)
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
function Ue(t,a,o)
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
function dt(t,a)
do
local e=0
while e<#t do
if u(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function O(a)
local o=p
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(We,e(o))
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
function rt(h,t,d)
local n=g(t)
if l(n)then
return d
end
local t=N(j,e(ee,e(ce,e(O(h),n))))
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
if u(e[0+1],re)then
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
return Qe(h,o,a)
elseif u(e[0+1],st)then
if#e==1 then
return t
end
local n=s(S(h,e[1+1]))
if not f(n)then
return t
end
local s=g(z(n))
if l(s)then
return d
end
if not y(s)then
return t
end
if not U(s,q)then
return t
end
local n=g(E(n))
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
local a={O(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif u(e[0+1],ee)then
if#e==1 then
return t
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,S(h,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=S(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,S(h,e[t+1]))
t=t+1
end
end
return P(o,a)
end
elseif r(n)then
return n
elseif w(n)then
return Ue(h,n,t)
elseif b(n)then
return t
end
return k()
end
function w(e)
return y(e)or f(e)
end
function ht(t,n,c)
local function u()
return N(j,e(ee,e(Te,e(t,x(n)))))
end
t=g(t)
if l(t)then
return c
end
if not f(t)then
return u()
end
local e=s(z(t))
if not(y(e)and U(e,d))then
return u()
end
local t=s(E(t))
if not a(t)then
return u()
end
local e=L(o(t))
local t=s(i(t))
if not(a(t)and r(s(i(t))))then
return u()
end
local d=o(t)
local s=je
local t=0
while not r(e)do
if w(e)then
local a=p
do
local e=#n-1
while e>=t do
a=h(n[e+1],a)
e=e-1
end
end
s=qe(s,e,a)
t=#n
e=p
elseif a(e)then
if t<#n then
local a=n[t+1]
t=t+1
s=qe(s,o(e),a)
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
return S(s,d)
end
function it(i,t,o)
local a=N(j,e(ee,e(i,x(t))))
for e=1,#Ce do
local e=Ce[e]
if u(i,e[0+1])then
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
function nt(o,a,t,i)
local e=N(j,e(re,e(O(o),a,x(t))))
if u(a,He)then
if#t~=1 then
return e
end
return t[0+1]
elseif u(a,Ne)then
if#t~=2 then
return e
end
return at(o,t[0+1],t[1+1],e)
elseif u(a,ot)then
if#t~=2 then
return e
end
return le(t[0+1],S(o,t[1+1]))
end
return e
end
function Q(t)
return e(re,He,t)
end
function at(l,n,c,t)
if t==nil then
t=false
end
local function f()
if t==false then
return N(j,e(re,e(O(l),Ne,x({
n,
c,
}))))
else
return t
end
end
n=L(n)
local s={}
local m=false
local t=n
while not r(t)do
if w(t)then
__TS__ArrayPush(s,t)
m=true
t=p
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=i(t)
else
return f()
end
end
local a=n
if m then
a=x(s)
end
local t={}
Fe(l,function(a,e)
do
local e=0
while e<#s do
if u(s[e+1],a)then
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
a=h(Q(dt(l,t[e+1])),a)
e=e-1
end
end
return _(d,e(n,h(Q(_(d,e(o,c))),a)))
end
function u(t,e)
if t==e then
return true
end
t=s(t)
e=s(e)
if t==e then
return true
end
local function n(t,e,a,o)
if u(a(t),a(e))and u(o(t),o(e))then
A(t,e)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
A(t,p)
A(e,p)
return true
elseif y(t)then
if not y(e)then
return false
end
return U(t,e)
elseif a(t)then
if not a(e)then
return false
end
return n(t,e,o,i)
elseif b(t)then
if not b(e)then
return false
end
return n(t,e,M,C)
elseif f(t)then
if not f(e)then
return false
end
return n(t,e,z,E)
end
return k()
end
function m(e)
e=R(e)
local t=""
local n=""
if r(e)then
return"()"
elseif a(e)then
t="("
n=""
while a(e)do
t=tostring(t)..tostring(n)..tostring(m(o(e)))
n=" "
e=R(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(m(h(z(e),E(e))))
elseif b(e)then
return"!"..tostring(m(h(M(e),C(e))))
elseif y(e)then
return he(e)
elseif I(e)then
return";("..tostring(m(be(e))).." "..tostring(m(ne(e)))..")"
elseif F(e)then
return"$("..tostring(m(O(ie(e)))).." "..tostring(m(oe(e)))..")"
elseif K(e)then
return"%("..tostring(m(me(e))).." "..tostring(m(x(ue(e))))..")"
elseif Y(e)then
return"@("..tostring(m(O(ke(e)))).." "..tostring(m(ge(e))).." "..tostring(m(x(_e(e))))..")"
elseif V(e)then
return"^("..tostring(m(ze(e))).." "..tostring(m(x(Ee(e))))..")"
end
return k()
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
local w
w=function()
local e=tt()
w=function()return e end
return e
end
c=function()
local e=et()
c=function()return e end
return e
end
v=0
D=1
W=2
Oe=3
ve=4
ye=5
pe=6
fe=7
B=8
Z=9
Ae=11
we=10
t.new_comment=le
t.comment_p=I
t.comment_comment=be
t.comment_x=ne
t.un_comment_all=de
local function dt(e)
return c()[e]~=nil
end
local function tt(e)
return{
v,
e,
}
end
local function at(e)
return w()[e]~=nil
end
local function n(e)
return tt(w()[e])
end
t.can_new_symbol_p=at
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=y
t.un_symbol=he
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={W}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=f
t.data_name=z
t.data_list=E
t.New_Error=New_Error
t.new_error=N
t.error_p=b
t.error_name=M
t.error_list=C
t.just_p=X
t.evaluate=S
t.apply=P
local function c(e)
local o=Se(e)
local function i(e)
e[1+1]=L(e[1+1])
e[2+1]=L(e[2+1])
if I(e[1+1])or I(e[2+1])then
local t=Ze(e)
local a=e[1+1]
local e=e[2+1]
local a=c(a)
local e=c(e)
t[1+1]=a
t[2+1]=e
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
j=n("太始初核")
local pe=n("符名")
d=n("化滅")
q=n("式形")
local wt=n("等同")
local ft=n("解算")
local W=n("特定其物")
local w=n("省略一物")
We=n("映表")
local yt=n("如若")
local c=n("一類何物")
local Z=n("是非")
local ve=n("其子")
local it=n("爻陽")
local et=n("爻陰")
local pt=n("引用")
local vt=n("應用")
local mt=n("間空")
local fe=n("連頸")
local we=n("構物")
local ye=n("謬誤")
local ct=n("詞素")
local Oe=n("列序")
local ut=n("首始")
local lt=n("尾末")
local Xe=n("之物")
local v=n("宇宙亡矣")
local nt=n("效應")
local Ze=n("註疏")
Je=N(j,e(v,w))
local function v(e)
return _(pe,h(j,h(e,p)))
end
local function Ae(t)
return v(e(c,e(d,w,t),W))
end
local function D(t,a)
return v(e(c,e(d,e(t),w),a))
end
local function B(t)
return v(e(c,d,e(Z,e(c,t,w))))
end
local ht=Ae(we)
Ie=D(we,pe)
Me=D(we,Oe)
Pe=B(we)
local Je=Ae(ye)
Ye=D(ye,pe)
Ve=D(ye,Oe)
Be=B(ye)
local rt=Ae(fe)
Ke=B(fe)
Ge=D(fe,ut)
Le=D(fe,lt)
Re=B(ct)
De=B(mt)
ae=v(e(c,d,e(Z,wt)))
Te=v(e(c,e(d,h(d,w),w),vt))
ce=v(e(c,d,ft))
local Oe=D(Oe,e(c,Xe,w))
te=v(e(c,d,yt))
He=v(e(c,q,pt))
Ne=v(e(c,e(q,e(d,w,d)),W))
ee=v(e(q,e(j,d)))
re=v(e(q,e(j,q)))
st=v(e(q,q))
local Ne=v(e(c,d,Ze))
ot=v(e(c,q,Ze))
local B=_(et,e())
local re=_(it,e())
local function ye(e,n,s)
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
local function D(e)
return ye(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=D
t.new_list=e
local function we(e)
while X(e)or I(e)do
e=R(de(e))
end
return e
end
t.un_just=R
t.un_just_comment_all=we
t.delay_p=xe
t.delay_just_p=l
local function Ae(e)
if F(e)then
return e
elseif Y(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return k()
end
local function X(e)
return ie(Ae(e))
end
local function de(e)
return oe(Ae(e))
end
t.delay_env=X
t.delay_x=de
local function X(e)
return s(e)
end
local function de(e)
if I(e)then
return ne(e)
else
return g(e)
end
end
t.force_all=X
t.force1=g
t.force_uncomment1=de
t.force_uncomment_all=Se
je={}
local function we(n)
n=s(n)
if not f(n)then
return false
end
local e=s(z(n))
if not y(e)then
return false
end
if not U(e,We)then
return false
end
e=s(E(n))
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
local a=o(e)
if not r(s(i(e)))then
return false
end
local t=true
do
local e=0
while e<#n do
if u(n[(e+0)+1],h)then
n[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
__TS__ArrayPush(n,h)
__TS__ArrayPush(n,a)
end
end
return n
end
t.env_null_v=je
t.env_set=qe
t.env_get=Ue
t.env2val=O
t.env_foreach=Fe
t.val2env=we
local function de(t,a)
return{
t,
1,
function(e,o)
e=g(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return re
end
return B
end,
}
end
local function X(t,o,i)
return{
t,
1,
function(e,a)
e=g(e)
if l(e)then
return T(t,{e})
end
if o(e)then
return i(e)
end
return a
end,
}
end
Ce={
de(Pe,f),
{
ht,
2,
_,
},
X(Ie,f,z),
X(Me,f,E),
de(Be,b),
{
Je,
2,
N,
},
X(Ye,b,M),
X(Ve,b,C),
de(De,r),
{
rt,
2,
h,
},
de(Ke,a),
X(Ge,a,o),
X(Le,a,i),
{
ae,
2,
function(e,t,n)
if e==t then
return re
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return T(ae,{
e,
t,
})
end
if e==t then
return re
end
local function n(a,t,e)
return T(te,{
a,
t,
e,
})
end
local function s(e,t)
return n(e,t,B)
end
H(not l(e))
local function n(a,t,o,e)
return s(T(ae,{
o(a),
o(t),
}),T(ae,{
e(a),
e(t),
}))
end
if r(e)then
if not r(e)then
return B
end
return re
elseif y(e)then
if not y(t)then
return B
end
if U(e,t)then
return re
else
return B
end
elseif f(e)then
if not f(t)then
return B
end
return n(e,t,z,E)
elseif a(e)then
if not a(t)then
return B
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return B
end
return n(e,t,M,C)
end
return k()
end,
},
{
Te,
2,
function(h,e,n)
local t={}
local e=s(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(i(e))
end
if not r(e)then
return n
end
return P(h,t)
end,
},
{
ce,
2,
function(e,t,a)
local e=we(e)
if e==false then
return a
end
return S(e,t)
end,
},
de(Re,y),
{
Oe,
1,
function(e,t)
e=g(e)
if l(e)then
return T(Oe,{e})
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
function(e,o,a,t)
e=g(e)
if l(e)then
return T(te,{
e,
o,
a,
})
end
if not f(e)then
return t
end
local e=s(z(e))
if not y(e)then
return t
end
if U(e,it)then
return o
end
if U(e,et)then
return a
end
return t
end,
},
{
Ne,
2,
le,
},
}
t.equal_p=u
local function l(e,t)
if e==t then
return true
end
e=R(e)
t=R(t)
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
return U(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return false
end
return n(e,t,M,C)
elseif f(e)then
if not f(t)then
return false
end
return n(e,t,z,E)
elseif F(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return k()
end
local function g(e)
return m(L(e))
end
t.simple_print=m
t.simple_print_force_all_rec=g
local function X(ee)
local F,b,u,l,m,s,E,z,Q,g,M,Y,V,U,C,D,L,I,O,A,R,k,f,B,K,X
function u()
return#F==b
end
function l()
H(not u())
local e=string.sub(F,b+1,b+1)
b=b+1
return e
end
function m(e)
H(string.sub(F,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function s(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function E(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function z()
if u()then
return false
end
local e=l()
if not E(e)then
m(e)
return false
end
while E(e)and not u()do
e=l()
end
if not E(e)then
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
if not I(e)then
m(e)
return false
end
while I(e)and not u()do
t=tostring(t)..tostring(e)
e=l()
end
if I(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if at(t)then
return n(t)
else
return s("Not Symbol"..tostring(t))
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
local function i(a)
local e=J()
G(t,h(a,e))
t=e
end
while true do
z()
if u()then
return s()
end
e=l()
if e==")"then
G(t,p)
return a
end
if e=="."then
z()
local o=O()
G(t,o)
z()
if u()then
return s()
end
e=l()
if e~=")"then
return s()
end
return a
end
m(e)
local e=O()
i(e)
end
end
function M()
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
return s()
end
if not a(e)then
return s()
end
return _(o(e),i(e))
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
return s()
end
if not a(e)then
return s()
end
return N(o(e),i(e))
end
function I(t)
if E(t)then
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
z()
local e={
g,
X,
M,
Y,
V,
U,
C,
D,
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
function A(e)
if e==false then
return s()
end
return e
end
function R()
return not u()
end
function k(e)
A(R())
A(l()==e)
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
M,
Y,
V,
U,
C,
D,
L,
}
else
e={
g,
K,
M,
Y,
V,
U,
C,
D,
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
return e(Z,t)
elseif a=="@"then
local a=f()
return e(c,e(d,h(t,w),w),a)
elseif a=="?"then
return e(c,d,e(Z,t))
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
return e(ve,x(t))
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
A(R())
local t=l()
if t=="+"then
local t=f()
return e(q,e(j,t))
else
m(t)
end
local t=f()
return e(q,t)
elseif t==":"then
A(R())
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
return e(j,t)
elseif t=="["then
local e=f()
k("]")
return B(e)
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
return B(e)
end
end
function X()
local e=K()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
F=ee
b=0
local function n(t,n)
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
V=n("$",function(e,t)
local e=we(e)
if e==false then
return s()
end
return S(e,t)
end)
U=n("%",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return s()end)
return T(t,e)
end)
C=d("@",function(o,t,e)
local a=ye(e,function(e)return e end,function(e,e)return s()end)
local e=we(o)
if e==false then
return s()
end
return Qe(e,t,a)
end)
D=n("^",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return s()end)
return P(t,e)
end)
L=n(";",function(e,t)return le(e,t)end)
return O()
end
t.complex_parse=X
local function g(p)
local function n(h,u)
if y(h)then
return he(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(h)
if e~=false and#e==3 and l(e[0+1],c)then
local s=D(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=D(h)
if r~=false and#r==1 and l(s[2+1],w)then
return t(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),w)and l(s[2+1],w)then
return t(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,w)and l(e[2+1],W)then
return t(":>"..tostring(n(s[2+1],true)))
end
end
local a=D(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],Z)then
return t(tostring(n(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],W)and l(s[0+1],q)then
local e=D(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return t(":&>"..tostring(n(e[2+1],true)))
end
end
local a=l(e[2+1],w)and"_"or l(e[2+1],W)and""or n(e[2+1],true)
return t(tostring(a)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],q)then
local a=D(e[1+1])
if a~=false and#a==2 and l(a[0+1],j)then
return t("&+"..tostring(n(a[1+1],true)))
end
return t("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],Z)then
return t(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return t("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],ve)then
local e=D(e[1+1])
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
if u then
return m(h)
else
return m(v(h))
end
end
local e=X(m(p))
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
elseif f(e)then
local a=z(e)
local t=E(e)
local e=D(t)
if e~=false and#e==2 and l(a,pe)and l(e[0+1],j)then
return n(e[1+1],false)
end
return"#"..tostring(g(h(a,t)))
elseif b(e)then
return"!"..tostring(g(h(M(e),C(e))))
elseif y(e)then
return he(e)
elseif I(e)then
return";("..tostring(g(be(e))).." "..tostring(g(ne(e)))..")"
elseif F(e)then
return"$("..tostring(g(O(ie(e)))).." "..tostring(g(oe(e)))..")"
elseif K(e)then
return"%("..tostring(g(me(e))).." "..tostring(g(x(ue(e))))..")"
elseif Y(e)then
return"@("..tostring(g(O(ke(e)))).." "..tostring(g(ge(e))).." "..tostring(g(x(_e(e))))..")"
elseif V(e)then
return"^("..tostring(g(ze(e))).." "..tostring(g(x(Ee(e))))..")"
end
return k()
end
t.complex_print=g
local function m(i)
local s=J()
local o={s}
local a=0
local function n()
error("MT parse ERROR")
end
local function r(e)
if not e then
return n()
end
end
local function d()
r(#i>a)
local e=string.sub(i,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=d()
local a
a=function(a)
local t=J()
local e=J()
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,e)
G(o,a(t,e))
end
if t=="^"then
local e=""
while true do
local t=d()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if dt(e)then
G(o,tt(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(_)
elseif t=="!"then
a(N)
elseif t=="$"then
a(function(a,t)return S(je,e(ee,ce,Q(a),Q(t)))end)
elseif t=="_"then
G(o,p)
else
return n()
end
end
o=i
end
r(a==#i)
return s
end
local function l(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=R(e)
local t
t=function(e,o,a,t)
n=tostring(n)..tostring(o)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,t(e))
end
if y(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(se(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif f(e)then
t(e,"#",z,E)
elseif b(e)then
t(e,"!",M,C)
elseif xe(e)then
local e=Ae(e)
t(e,"$",(function(e)return O(ie(e))end),oe)
else
return k()
end
end
s=h
end
return n
end
t.machinetext_parse=m
t.machinetext_print=l
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
local function k(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=g
t.trampoline_delay=l
t.run_trampoline=k
local b=v(h(ve,h(h(nt,h(h(c,h(Xe,h(w,p))),p)),p)))
local v=v(h(ve,h(h(nt,h(fe,p)),p)))
local function j(t,a)
return _(v,e(t,a))
end
local function q(e)
return _(b,e)
end
local function m(p,y,c,w,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
c=s(c)
if f(c)then
local f=z(c)
local t=E(c)
if u(f,b)then
t=s(t)
if a(t)then
local o=o(t)
local e=s(i(t))
if r(e)then
if h==false then
local t=o
local a=w
local e
e=function()return p(t,a)end
return l(e)
else
local t
t=p
local a
a=y
local o=o
local i=w
local e
e=function()return m(t,a,P(h,o),i)end
return l(e)
end
end
end
elseif u(f,v)then
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
e=p
local t
t=y
local i=u
local n=a
local o=w
local a
a=function()return m(e,t,i,o,n)end
return l(a)
else
local i
i=p
local o
o=y
local c=u
local u=a
local r=w
local s=h
local t=n("序甲")
local a
a=function()return m(i,o,c,r,_(d,e(e(t),g(e(Q(u),t),Q(s)))))end
return l(a)
end
end
end
end
end
end
if h==false then
return l(function()return y(c,w,p)end)
else
return l(function()return y(c,w,function(e,t)return l(function()return m(p,y,P(h,{e}),t)end)end)end)
end
end
local function s(t,e,o,a)
return m(t,e,o,a)
end
local function n(e,i,a,o)
return k(m((function(a,t)return g(e(a,t))end),(function(a,e,t)return g(i(a,e,function(e,a)return k(t(e,a))end))end),a,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=s
t.run_monad_stackoverflow=n
return t