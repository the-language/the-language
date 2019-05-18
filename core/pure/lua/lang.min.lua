function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,R,c,M,te,P,pe,Oe,ye,we,v,ve,Ae,F,fe,le,I,be,ae,de,y,he,re,h,a,o,i,p,r,_,f,z,T,N,b,L,U,X,n,S,B,ne,ie,Se,V,ke,ge,_e,E,Y,me,ue,W,G,ze,Ee,C,J,ot,A,K,Je,q,d,x,He,st,Ie,Ne,Re,De,Ke,Be,Ve,Ye,Ge,Qe,Ce,Z,Te,ce,oe,Ue,Le,ee,se,at,et,D,j,e,H,xe,l,s,g,Me,je,qe,We,tt,O,Pe,ht,w,Fe,Xe,Ze,it,Q,nt,u,m,dt,rt
function k()
error("TheLanguage PANIC")
end
function R(e)
if not e then
return k()
end
end
function le(t,e)
return{
F,
t,
e,
}
end
function I(e)
return e[0+1]==F
end
function be(e)
return e[1+1]
end
function ae(e)
return e[2+1]
end
function de(e)
while I(e)do
e=ae(e)
end
return e
end
function y(e)
return e[0+1]==M
end
function he(e)
return e[1+1]
end
function re(e)
return c()[he(e)]
end
function h(t,e)
return{
te,
t,
e,
}
end
function a(e)
return e[0+1]==te
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==P
end
function _(e,t)
return{
pe,
e,
t,
}
end
function f(e)
return e[0+1]==pe
end
function z(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function N(e,t)
return{
Oe,
e,
t,
}
end
function b(e)
return e[0+1]==Oe
end
function L(e)
return e[1+1]
end
function U(e)
return e[2+1]
end
function X(e)
return e[0+1]==ye
end
function n(e)
return e[1+1]
end
function S(t,e)
return{
we,
t,
e,
}
end
function B(e)
return e[0+1]==we
end
function ne(e)
return e[1+1]
end
function ie(e)
return e[2+1]
end
function Se(e,a,t)
return{
ve,
e,
a,
t,
}
end
function V(e)
return e[0+1]==ve
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
function E(e,t)
return{
v,
e,
t,
}
end
function Y(e)
return e[0+1]==v
end
function me(e)
return e[1+1]
end
function ue(e)
return e[2+1]
end
function W(e,t)
return{
Ae,
e,
t,
}
end
function G(e)
return e[0+1]==Ae
end
function ze(e)
return e[1+1]
end
function Ee(e)
return e[2+1]
end
function C(e)
local e=s(e)
local function t(e)
e[1+1]=C(e[1+1])
e[2+1]=C(e[2+1])
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
return{fe}
end
function ot(e)
return e[0+1]==fe
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
function K(e,t)
R(ot(e))
local e=e
local t=t
e[0+1]=t[0+1]
e[1+1]=t[1+1]
e[2+1]=t[2+1]
e[3+1]=t[3+1]
end
function Je(t)
local e=J()
K(e,t)
return e
end
function D(e,t)
if e==t then
return true
end
if he(e)==he(t)then
A(e,t)
return true
else
return false
end
end
function j(a)
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
return j(e)
end
function H(e)
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
return B(e)or V(e)or Y(e)or G(e)
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
local e,h,n
function h(t)
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
h(t)
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
return n(st)
end
local function d()
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
local h=m(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if B(e)then
return o()
elseif Y(e)then
local a=me(e)
local e=ue(e)
local h={
Ie,
Ne,
Re,
De,
Ke,
Be,
Ve,
Ye,
Ge,
Qe,
Ce,
}
local i=false
for e=1,#h do
local e=h[e]
if u(e,a)then
i=true
break
end
end
if i then
R(#e==1)
R(t[1+1]==false)
local e=s(e[0+1],d(),t)
if t[1+1]then
return n(E(a,{e}))
else
return k()
end
end
if u(a,Z)then
return o()
elseif u(a,Te)then
return o()
elseif u(a,ce)then
return o()
elseif u(a,oe)then
R(#e==3)
R(t[1+1]==false)
local a=s(e[0+1],d(),t)
if t[1+1]then
return n(E(oe,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif V(e)then
return o()
elseif G(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return h(e)
end
function g(a)
local e=H(a)
local t
R(not X(e))
if B(e)then
t=ht(ne(e),ie(e),a)
elseif V(e)then
t=it(ke(e),ge(e),_e(e),a)
elseif Y(e)then
t=Ze(me(e),ue(e),a)
elseif G(e)then
t=Xe(ze(e),Ee(e),a)
else
t=e
end
t=H(t)
A(e,t)
return t
end
function Me(e)
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
function We(t,a,o)
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
function tt(t,a)
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
function O(o)
local a=p
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(He,e(a))
end
function Pe(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ht(h,t,d)
local n=g(t)
if l(n)then
return d
end
local t
t=function()return N(q,e(ee,e(ce,e(O(h),n))))end
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
return Se(h,o,a)
elseif u(e[0+1],at)then
if#e==1 then
return t()
end
local s=s(S(h,e[1+1]))
if not f(s)then
return t()
end
local n=g(z(s))
if l(n)then
return d
end
if not y(n)then
return t()
end
if not D(n,x)then
return t()
end
local n=g(T(s))
if l(n)then
return d
end
if not a(n)then
return t()
end
local o=o(n)
local a=g(i(n))
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
return W(o,a)
elseif u(e[0+1],ee)then
if#e==1 then
return t()
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
return E(o,a)
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
return W(o,a)
end
elseif r(n)then
return n
elseif w(n)then
return We(h,n,t())
elseif b(n)then
return t()
end
return k()
end
function w(e)
return y(e)or f(e)
end
function Xe(t,n,c)
local function u()
return N(q,e(ee,e(Te,e(t,j(n)))))
end
t=g(t)
if l(t)then
return c
end
if not f(t)then
return u()
end
local e=s(z(t))
if not(y(e)and D(e,d))then
return u()
end
local t=s(T(t))
if not a(t)then
return u()
end
local e=C(o(t))
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
function Ze(i,t,o)
local a
a=function()return N(q,e(ee,e(i,j(t))))end
for e=1,#Fe do
local e=Fe[e]
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
return k()
end
end
return a()
end
function it(i,o,t,a)
local a
a=function()return N(q,e(se,e(O(i),o,j(t))))end
if u(o,Ue)then
if#t~=1 then
return a()
end
return t[0+1]
elseif u(o,Le)then
if#t~=2 then
return a()
end
return nt(i,t[0+1],t[1+1],a)
elseif u(o,et)then
if#t~=2 then
return a()
end
return le(t[0+1],S(i,t[1+1]))
end
return a()
end
function Q(t)
return e(se,Ue,t)
end
function nt(l,n,c,t)
if t==nil then
t=false
end
local function f()
if t==false then
return N(q,e(se,e(O(l),Le,j({
n,
c,
}))))
else
return t()
end
end
n=C(n)
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
a=j(s)
end
local t={}
Pe(l,function(a,e)
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
a=h(Q(tt(l,t[e+1])),a)
e=e-1
end
end
return _(d,e(n,h(Q(_(d,e(o,c))),a)))
end
function u(e,t)
if e==t then
return true
end
e=s(e)
t=s(t)
if e==t then
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
return D(e,t)
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
elseif f(e)then
if not f(t)then
return false
end
return n(e,t,z,T)
end
return k()
end
function m(e)
e=H(e)
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
e=H(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(m(h(z(e),T(e))))
elseif b(e)then
return"!"..tostring(m(h(L(e),U(e))))
elseif y(e)then
return re(e)
elseif I(e)then
return";("..tostring(m(be(e))).." "..tostring(m(ae(e)))..")"
elseif B(e)then
return"$("..tostring(m(O(ne(e)))).." "..tostring(m(ie(e)))..")"
elseif Y(e)then
return"%("..tostring(m(me(e))).." "..tostring(m(j(ue(e))))..")"
elseif V(e)then
return"@("..tostring(m(O(ke(e)))).." "..tostring(m(ge(e))).." "..tostring(m(j(_e(e))))..")"
elseif G(e)then
return"^("..tostring(m(ze(e))).." "..tostring(m(j(Ee(e))))..")"
end
return k()
end
function dt()
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
function rt()
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
local e=dt()
w=function()return e end
return e
end
c=function()
local e=rt()
c=function()return e end
return e
end
M=0
te=1
P=2
pe=3
Oe=4
ye=5
we=6
v=7
ve=8
Ae=9
F=11
fe=10
t.new_comment=le
t.comment_p=I
t.comment_comment=be
t.comment_x=ae
t.un_comment_all=de
local function dt(e)
return c()[e]~=nil
end
local function Ze(e)
return{
M,
e,
}
end
local function Xe(e)
return w()[e]~=nil
end
local function n(e)
return Ze(w()[e])
end
t.can_new_symbol_p=Xe
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=y
t.un_symbol=re
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={P}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=f
t.data_name=z
t.data_list=T
t.New_Error=New_Error
t.new_error=N
t.error_p=b
t.error_name=L
t.error_list=U
t.just_p=X
t.evaluate=S
t.apply=W
local function c(e)
local o=Me(e)
local function i(e)
e[1+1]=C(e[1+1])
e[2+1]=C(e[2+1])
if I(e[1+1])or I(e[2+1])then
local t=Je(e)
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
t.force_all_rec=C
t.force_uncomment_all_rec=c
q=n("太始初核")
local pe=n("符名")
d=n("化滅")
x=n("式形")
local wt=n("等同")
local ft=n("解算")
local F=n("特定其物")
local w=n("省略一物")
He=n("映表")
local yt=n("如若")
local c=n("一類何物")
local te=n("是非")
local ve=n("其子")
local tt=n("爻陽")
local Je=n("爻陰")
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
local nt=n("之物")
local v=n("宇宙亡矣")
local it=n("效應")
local ot=n("註疏")
st=N(q,e(v,w))
local function v(e)
return _(pe,h(q,h(e,p)))
end
local function Ae(t)
return v(e(c,e(d,w,t),F))
end
local function M(t,a)
return v(e(c,e(d,e(t),w),a))
end
local function P(t)
return v(e(c,d,e(te,e(c,t,w))))
end
local ht=Ae(we)
Ie=M(we,pe)
Ne=M(we,Oe)
Re=P(we)
local st=Ae(ye)
De=M(ye,pe)
Ke=M(ye,Oe)
Be=P(ye)
local rt=Ae(fe)
Ve=P(fe)
Ye=M(fe,ut)
Ge=M(fe,lt)
Qe=P(ct)
Ce=P(mt)
Z=v(e(c,d,e(te,wt)))
Te=v(e(c,e(d,h(d,w),w),vt))
ce=v(e(c,d,ft))
local Oe=M(Oe,e(c,nt,w))
oe=v(e(c,d,yt))
Ue=v(e(c,x,pt))
Le=v(e(c,e(x,e(d,w,d)),F))
ee=v(e(x,e(q,d)))
se=v(e(x,e(q,x)))
at=v(e(x,x))
local Le=v(e(c,d,ot))
et=v(e(c,x,ot))
local P=_(Je,e())
local se=_(tt,e())
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
local function M(e)
return ye(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=M
t.new_list=e
local function we(e)
while X(e)or I(e)do
e=H(de(e))
end
return e
end
t.un_just=H
t.un_just_comment_all=we
t.delay_p=xe
t.delay_just_p=l
local function Ae(e)
if B(e)then
return e
elseif V(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return k()
end
local function X(e)
return ne(Ae(e))
end
local function de(e)
return ie(Ae(e))
end
t.delay_env=X
t.delay_x=de
local function X(e)
return s(e)
end
local function de(e)
if I(e)then
return ae(e)
else
return g(e)
end
end
t.force_all=X
t.force1=g
t.force_uncomment1=de
t.force_uncomment_all=Me
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
if not D(e,He)then
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
if u(n[(e+0)+1],h)then
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
t.env_null_v=je
t.env_set=qe
t.env_get=We
t.env2val=O
t.env_foreach=Pe
t.val2env=we
local function de(t,a)
return{
t,
1,
function(e)
e=g(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return se
end
return P
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
return E(t,{e})
end
if o(e)then
return i(e)
end
return a()
end,
}
end
Fe={
de(Re,f),
{
ht,
2,
_,
},
X(Ie,f,z),
X(Ne,f,T),
de(Be,b),
{
st,
2,
N,
},
X(De,b,L),
X(Ke,b,U),
de(Ce,r),
{
rt,
2,
h,
},
de(Ve,a),
X(Ye,a,o),
X(Ge,a,i),
{
Z,
2,
function(e,t,n)
if e==t then
return se
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return E(Z,{
e,
t,
})
end
if e==t then
return se
end
local function n(a,t,e)
return E(oe,{
a,
t,
e,
})
end
local function s(e,t)
return n(e,t,P)
end
R(not l(e))
local function n(o,a,e,t)
return s(E(Z,{
e(o),
e(a),
}),E(Z,{
t(o),
t(a),
}))
end
if r(e)then
if not r(e)then
return P
end
return se
elseif y(e)then
if not y(t)then
return P
end
if D(e,t)then
return se
else
return P
end
elseif f(e)then
if not f(t)then
return P
end
return n(e,t,z,T)
elseif a(e)then
if not a(t)then
return P
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return P
end
return n(e,t,L,U)
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
return n()
end
return W(h,t)
end,
},
{
ce,
2,
function(e,t,a)
local e=we(e)
if e==false then
return a()
end
return S(e,t)
end,
},
de(Qe,y),
{
Oe,
1,
function(e,t)
e=g(e)
if l(e)then
return E(Oe,{e})
end
if not a(e)then
return t()
end
return o(e)
end,
},
{
oe,
3,
function(e,o,a,t)
e=g(e)
if l(e)then
return E(oe,{
e,
o,
a,
})
end
if not f(e)then
return t()
end
local e=s(z(e))
if not y(e)then
return t()
end
if D(e,tt)then
return o
end
if D(e,Je)then
return a
end
return t()
end,
},
{
Le,
2,
le,
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
return D(e,t)
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
elseif f(e)then
if not f(t)then
return false
end
return n(e,t,z,T)
elseif B(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return k()
end
local function g(e)
return m(C(e))
end
t.simple_print=m
t.simple_print_force_all_rec=g
local function X(Z)
local Y,b,u,l,m,s,z,T,Q,g,M,P,V,U,C,D,L,I,O,A,H,k,f,B,G,X
function u()
return#Y==b
end
function l()
R(not u())
local e=string.sub(Y,b+1,b+1)
b=b+1
return e
end
function m(e)
R(string.sub(Y,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function s(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function z(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if u()then
return false
end
local e=l()
if not z(e)then
m(e)
return false
end
while z(e)and not u()do
e=l()
end
if not z(e)then
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
if Xe(t)then
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
K(t,h(a,e))
t=e
end
while true do
T()
if u()then
return s()
end
e=l()
if e==")"then
K(t,p)
return a
end
if e=="."then
T()
local o=O()
K(t,o)
T()
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
function P()
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
function I(e)
if z(e)then
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
function O()
T()
local e={
g,
X,
M,
P,
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
function H()
return not u()
end
function k(e)
A(H())
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
P,
V,
U,
C,
D,
L,
}
else
e={
g,
G,
M,
P,
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
return e(te,t)
elseif a=="@"then
local a=f()
return e(c,e(d,h(t,w),w),a)
elseif a=="?"then
return e(c,d,e(te,t))
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
return e(ve,j(t))
else
m(a)
return t
end
end
function G()
if u()then
return false
end
local t=l()
if t=="&"then
A(H())
local t=l()
if t=="+"then
local t=f()
return e(x,e(q,t))
else
m(t)
end
local t=f()
return e(x,t)
elseif t==":"then
A(H())
local t=l()
if t=="&"then
k(">")
local t=f()
return e(c,e(x,e(d,w,t)),F)
elseif t==">"then
local t=f()
return e(c,e(d,w,t),F)
else
m(t)
end
local t=f()
return e(c,t,F)
elseif t=="+"then
local t=f()
return e(q,t)
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
local e=G()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
Y=Z
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
local function h(t,h)
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
return E(t,e)
end)
C=h("@",function(a,t,e)
local o=ye(e,function(e)return e end,function(e,e)return s()end)
local e=we(a)
if e==false then
return s()
end
return Se(e,t,o)
end)
D=n("^",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return s()end)
return W(t,e)
end)
L=n(";",function(e,t)return le(e,t)end)
return O()
end
t.complex_parse=X
local function g(p)
local function n(h,u)
if y(h)then
return re(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=M(h)
if e~=false and#e==3 and l(e[0+1],c)then
local s=M(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=M(h)
if r~=false and#r==1 and l(s[2+1],w)then
return t(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),w)and l(s[2+1],w)then
return t(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,w)and l(e[2+1],F)then
return t(":>"..tostring(n(s[2+1],true)))
end
end
local a=M(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],te)then
return t(tostring(n(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],F)and l(s[0+1],x)then
local e=M(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return t(":&>"..tostring(n(e[2+1],true)))
end
end
local a=l(e[2+1],w)and"_"or l(e[2+1],F)and""or n(e[2+1],true)
return t(tostring(a)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=M(e[1+1])
if a~=false and#a==2 and l(a[0+1],q)then
return t("&+"..tostring(n(a[1+1],true)))
end
return t("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],te)then
return t(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],q)then
return t("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],ve)then
local e=M(e[1+1])
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
local t=T(e)
local e=M(t)
if e~=false and#e==2 and l(a,pe)and l(e[0+1],q)then
return n(e[1+1],false)
end
return"#"..tostring(g(h(a,t)))
elseif b(e)then
return"!"..tostring(g(h(L(e),U(e))))
elseif y(e)then
return re(e)
elseif I(e)then
return";("..tostring(g(be(e))).." "..tostring(g(ae(e)))..")"
elseif B(e)then
return"$("..tostring(g(O(ne(e)))).." "..tostring(g(ie(e)))..")"
elseif Y(e)then
return"%("..tostring(g(me(e))).." "..tostring(g(j(ue(e))))..")"
elseif V(e)then
return"@("..tostring(g(O(ke(e)))).." "..tostring(g(ge(e))).." "..tostring(g(j(_e(e))))..")"
elseif G(e)then
return"^("..tostring(g(ze(e))).." "..tostring(g(j(Ee(e))))..")"
end
return k()
end
t.complex_print=g
local function l(i)
local d=J()
local o={d}
local a=0
local function n()
error("MT parse ERROR")
end
local function s(e)
if not e then
return n()
end
end
local function r()
s(#i>a)
local e=string.sub(i,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=r()
local a
a=function(a)
local t=J()
local e=J()
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,e)
K(o,a(t,e))
end
if t=="^"then
local e=""
while true do
local t=r()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if dt(e)then
K(o,Ze(e))
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
K(o,p)
else
return n()
end
end
o=i
end
s(a==#i)
return d
end
local function m(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=H(e)
local t
t=function(e,a,t,o)
n=tostring(n)..tostring(a)
__TS__ArrayPush(h,t(e))
__TS__ArrayPush(h,o(e))
end
if y(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(he(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif f(e)then
t(e,"#",z,T)
elseif b(e)then
t(e,"!",L,U)
elseif xe(e)then
local e=Ae(e)
t(e,"$",(function(e)return O(ne(e))end),ie)
else
return k()
end
end
s=h
end
return n
end
t.machinetext_parse=l
t.machinetext_print=m
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
local b=v(h(ve,h(h(it,h(h(c,h(nt,h(w,p))),p)),p)))
local v=v(h(ve,h(h(it,h(fe,p)),p)))
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
local t=T(c)
if u(f,b)then
t=s(t)
if a(t)then
local a=o(t)
local e=s(i(t))
if r(e)then
if h==false then
local a=a
local t=w
local e
e=function()return p(a,t)end
return l(e)
else
local t
t=p
local e
e=y
local i=a
local o=w
local a
a=function()return m(t,e,W(h,i),o)end
return l(a)
end
end
end
elseif u(f,v)then
t=s(t)
if a(t)then
local c=o(t)
local t=s(i(t))
if a(t)then
local u=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local t
t=p
local e
e=y
local n=c
local o=u
local i=w
local a
a=function()return m(t,e,n,i,o)end
return l(a)
else
local i
i=p
local o
o=y
local c=c
local r=u
local s=w
local h=h
local a=n("序甲")
local t
t=function()return m(i,o,c,s,_(d,e(e(a),g(e(Q(r),a),Q(h)))))end
return l(t)
end
end
end
end
end
end
if h==false then
return l(function()return y(c,w,p)end)
else
return l(function()return y(c,w,function(t,e)return l(function()return m(p,y,W(h,{t}),e)end)end)end)
end
end
local function e(e,a,t,o)
return m(e,a,t,o)
end
local function s(a,i,n,o)
return k(m((function(t,e)return g(a(t,e))end),(function(e,a,t)return g(i(e,a,function(e,a)return k(t(e,a))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=e
t.run_monad_stackoverflow=s
return t