function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,R,w,me,ye,re,M,F,K,ie,Ee,Ae,Te,Je,Oe,le,I,ke,ne,xe,p,he,ue,h,a,o,i,y,r,z,m,_,T,S,b,C,L,J,u,O,W,oe,ae,Qe,G,ve,je,be,E,V,fe,de,P,Y,ge,pe,U,X,s,A,B,ot,j,d,q,Ke,at,Ve,Be,Ge,Ye,Pe,We,Ce,Ue,De,Le,Re,te,we,ce,Z,Ie,Ne,ee,se,Xe,Ze,D,x,e,H,qe,l,n,g,Se,ze,_e,He,et,N,Me,tt,v,Fe,it,st,nt,Q,dt,c,f,ht,rt
function k()
error("TheLanguage PANIC")
end
function R(e)
if not e then
return k()
end
end
function le(e,t)
return{
Je,
e,
t,
}
end
function I(e)
return e[0+1]==Je
end
function ke(e)
return e[1+1]
end
function ne(e)
return e[2+1]
end
function xe(e)
while I(e)do
e=ne(e)
end
return e
end
function p(e)
return e[0+1]==me
end
function he(e)
return e[1+1]
end
function ue(e)
return w()[he(e)]
end
function h(t,e)
return{
ye,
t,
e,
}
end
function a(e)
return e[0+1]==ye
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==re
end
function z(e,t)
return{
M,
e,
t,
}
end
function m(e)
return e[0+1]==M
end
function _(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function S(t,e)
return{
F,
t,
e,
}
end
function b(e)
return e[0+1]==F
end
function C(e)
return e[1+1]
end
function L(e)
return e[2+1]
end
function J(e)
return e[0+1]==K
end
function u(e)
return e[1+1]
end
function O(e,t)
return{
ie,
e,
t,
}
end
function W(e)
return e[0+1]==ie
end
function oe(e)
return e[1+1]
end
function ae(e)
return e[2+1]
end
function Qe(t,e,a)
return{
Ae,
t,
e,
a,
}
end
function G(e)
return e[0+1]==Ae
end
function ve(e)
return e[1+1]
end
function je(e)
return e[2+1]
end
function be(e)
return e[3+1]
end
function E(t,e)
return{
Ee,
t,
e,
}
end
function V(e)
return e[0+1]==Ee
end
function fe(e)
return e[1+1]
end
function de(e)
return e[2+1]
end
function P(e,t)
return{
Te,
e,
t,
}
end
function Y(e)
return e[0+1]==Te
end
function ge(e)
return e[1+1]
end
function pe(e)
return e[2+1]
end
function U(e)
local e=n(e)
local function t(e)
e[1+1]=U(e[1+1])
e[2+1]=U(e[2+1])
return e
end
if m(e)then
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
function X()
return{Oe}
end
function s(e)
return e[0+1]==Oe
end
function A(e,t)
if e==t then
return
end
e[0+1]=K
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function B(e,a)
R(s(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function ot(t)
local e=X()
B(e,t)
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
function x(a)
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
return x(e)
end
function H(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
__TS__ArrayPush(t,e)
e=u(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function qe(e)
return W(e)or G(e)or V(e)or Y(e)
end
function l(e)
return J(e)or qe(e)
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
return s(at)
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
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if W(e)then
return o()
elseif V(e)then
local a=fe(e)
local e=de(e)
local h={
Ve,
Be,
Ge,
Ye,
Pe,
We,
Ce,
Ue,
De,
Le,
Re,
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
R(#e==1)
R(t[1+1]==false)
local e=n(e[0+1],u(),t)
if t[1+1]then
return s(E(a,{e}))
else
return k()
end
end
if c(a,te)then
return o()
elseif c(a,we)then
return o()
elseif c(a,ce)then
return o()
elseif c(a,Z)then
R(#e==3)
R(t[1+1]==false)
local a=n(e[0+1],u(),t)
if t[1+1]then
return s(E(Z,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif G(e)then
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
local e=H(a)
local t
R(not J(e))
if W(e)then
t=tt(oe(e),ae(e),a)
elseif G(e)then
t=nt(ve(e),je(e),be(e),a)
elseif V(e)then
t=st(fe(e),de(e),a)
elseif Y(e)then
t=it(ge(e),pe(e),a)
else
t=e
end
t=H(t)
A(e,t)
return t
end
function Se(e)
while l(e)or I(e)do
e=n(xe(e))
end
return e
end
function _e(a,o,i)
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
function He(t,a,o)
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
function N(a)
local o=y
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return z(Ke,e(o))
end
function Me(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function tt(h,t,d)
local s=g(t)
if l(s)then
return d
end
local t
t=function()return S(j,e(ee,e(ce,e(N(h),s))))end
if a(s)then
local e={}
local s=s
while not r(s)do
if l(s)then
return d
elseif a(s)then
__TS__ArrayPush(e,o(s))
s=g(i(s))
else
return t()
end
end
if c(e[0+1],se)then
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
elseif c(e[0+1],Xe)then
if#e==1 then
return t()
end
local n=n(O(h,e[1+1]))
if not m(n)then
return t()
end
local s=g(_(n))
if l(s)then
return d
end
if not p(s)then
return t()
end
if not D(s,q)then
return t()
end
local n=g(T(n))
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
local a={N(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif c(e[0+1],ee)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,O(h,e[t+1]))
t=t+1
end
end
return E(o,a)
else
local o=O(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,O(h,e[t+1]))
t=t+1
end
end
return P(o,a)
end
elseif r(s)then
return s
elseif v(s)then
return He(h,s,t())
elseif b(s)then
return t()
end
return k()
end
function v(e)
return p(e)or m(e)
end
function it(t,u,c)
local function s()
return S(j,e(ee,e(we,e(t,x(u)))))
end
t=g(t)
if l(t)then
return c
end
if not m(t)then
return s()
end
local e=n(_(t))
if not(p(e)and D(e,d))then
return s()
end
local t=n(T(t))
if not a(t)then
return s()
end
local e=U(o(t))
local t=n(i(t))
if not(a(t)and r(n(i(t))))then
return s()
end
local d=o(t)
local n=ze
local t=0
while not r(e)do
if v(e)then
local a=y
do
local e=#u-1
while e>=t do
a=h(u[e+1],a)
e=e-1
end
end
n=_e(n,e,a)
t=#u
e=y
elseif a(e)then
if t<#u then
local a=u[t+1]
t=t+1
n=_e(n,o(e),a)
e=i(e)
else
return s()
end
else
return s()
end
end
if#u~=t then
return s()
end
return O(n,d)
end
function st(i,t,o)
local a
a=function()return S(j,e(ee,e(i,x(t))))end
for e=1,#Fe do
local e=Fe[e]
if c(i,e[0+1])then
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
function nt(i,o,t,a)
local a
a=function()return S(j,e(se,e(N(i),o,x(t))))end
if c(o,Ie)then
if#t~=1 then
return a()
end
return t[0+1]
elseif c(o,Ne)then
if#t~=2 then
return a()
end
return dt(i,t[0+1],t[1+1],a)
elseif c(o,Ze)then
if#t~=2 then
return a()
end
return le(t[0+1],O(i,t[1+1]))
end
return a()
end
function Q(t)
return e(se,Ie,t)
end
function dt(l,n,u,t)
if t==nil then
t=false
end
local function f()
if t==false then
return S(j,e(se,e(N(l),Ne,x({
n,
u,
}))))
else
return t()
end
end
n=U(n)
local s={}
local m=false
local t=n
while not r(t)do
if v(t)then
__TS__ArrayPush(s,t)
m=true
t=y
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=i(t)
else
return f()
end
end
local o=n
if m then
o=x(s)
end
local t={}
Me(l,function(a,e)
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
local a=o
do
local e=#t-1
while e>=0 do
a=h(t[e+1],a)
e=e-1
end
end
local o=o
do
local e=#t-1
while e>=0 do
o=h(Q(et(l,t[e+1])),o)
e=e-1
end
end
return z(d,e(n,h(Q(z(d,e(a,u))),o)))
end
function c(e,t)
if e==t then
return true
end
e=n(e)
t=n(t)
if e==t then
return true
end
local function n(e,t,o,a)
if c(o(e),o(t))and c(a(e),a(t))then
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
return n(e,t,C,L)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,_,T)
end
return k()
end
function f(e)
e=H(e)
local t=""
local n=""
if r(e)then
return"()"
elseif a(e)then
t="("
n=""
while a(e)do
t=tostring(t)..tostring(n)..tostring(f(o(e)))
n=" "
e=H(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(f(h(_(e),T(e))))
elseif b(e)then
return"!"..tostring(f(h(C(e),L(e))))
elseif p(e)then
return ue(e)
elseif I(e)then
return";("..tostring(f(ke(e))).." "..tostring(f(ne(e)))..")"
elseif W(e)then
return"$("..tostring(f(N(oe(e)))).." "..tostring(f(ae(e)))..")"
elseif V(e)then
return"%("..tostring(f(fe(e))).." "..tostring(f(x(de(e))))..")"
elseif G(e)then
return"@("..tostring(f(N(ve(e)))).." "..tostring(f(je(e))).." "..tostring(f(x(be(e))))..")"
elseif Y(e)then
return"^("..tostring(f(ge(e))).." "..tostring(f(x(pe(e))))..")"
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
local u
u=function()
local e=ht()
u=function()return e end
return e
end
w=function()
local e=rt()
w=function()return e end
return e
end
me=0
ye=1
re=2
M=3
F=4
K=5
ie=6
Ee=7
Ae=8
Te=9
Je=11
Oe=10
t.new_comment=le
t.comment_p=I
t.comment_comment=ke
t.comment_x=ne
t.un_comment_all=xe
local function rt(e)
return w()[e]~=nil
end
local function Je(e)
return{
me,
e,
}
end
local function st(e)
return u()[e]~=nil
end
local function s(e)
return Je(u()[e])
end
t.can_new_symbol_p=st
t.New_Symbol=New_Symbol
t.new_symbol=s
t.symbol_p=p
t.un_symbol=ue
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
y={re}
t.Null_V=Null_V
t.null_v=y
t.null_p=r
t.New_Data=New_Data
t.new_data=z
t.data_p=m
t.data_name=_
t.data_list=T
t.New_Error=New_Error
t.new_error=S
t.error_p=b
t.error_name=C
t.error_list=L
t.just_p=J
t.evaluate=O
t.apply=P
local function u(e)
local o=Se(e)
local function i(e)
e[1+1]=U(e[1+1])
e[2+1]=U(e[2+1])
if I(e[1+1])or I(e[2+1])then
local t=ot(e)
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
t.force_all_rec=U
t.force_uncomment_all_rec=u
j=s("太始初核")
local Ee=s("符名")
d=s("化滅")
q=s("式形")
local vt=s("等同")
local yt=s("解算")
local F=s("特定其物")
local w=s("省略一物")
Ke=s("映表")
local wt=s("如若")
local u=s("一類何物")
local ie=s("是非")
local Te=s("其子")
local et=s("爻陽")
local tt=s("爻陰")
local ct=s("引用")
local dt=s("應用")
local pt=s("間空")
local re=s("連頸")
local ye=s("構物")
local me=s("謬誤")
local ft=s("詞素")
local Oe=s("列序")
local ht=s("首始")
local mt=s("尾末")
local it=s("之物")
local v=s("宇宙亡矣")
local ot=s("效應")
local nt=s("註疏")
at=S(j,e(v,w))
local function v(e)
return z(Ee,h(j,h(e,y)))
end
local function Ae(t)
return v(e(u,e(d,w,t),F))
end
local function M(t,a)
return v(e(u,e(d,e(t),w),a))
end
local function K(t)
return v(e(u,d,e(ie,e(u,t,w))))
end
local ut=Ae(ye)
Ve=M(ye,Ee)
Be=M(ye,Oe)
Ge=K(ye)
local lt=Ae(me)
Ye=M(me,Ee)
Pe=M(me,Oe)
We=K(me)
local at=Ae(re)
Ce=K(re)
Ue=M(re,ht)
De=M(re,mt)
Le=K(ft)
Re=K(pt)
te=v(e(u,d,e(ie,vt)))
we=v(e(u,e(d,h(d,w),w),dt))
ce=v(e(u,d,yt))
local Oe=M(Oe,e(u,it,w))
Z=v(e(u,d,wt))
Ie=v(e(u,q,ct))
Ne=v(e(u,e(q,e(d,w,d)),F))
ee=v(e(q,e(j,d)))
se=v(e(q,e(j,q)))
Xe=v(e(q,q))
local Ie=v(e(u,d,nt))
Ze=v(e(u,q,nt))
local K=z(tt,e())
local me=z(et,e())
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
t.jsArray_to_list=x
t.maybe_list_to_jsArray=M
t.new_list=e
local function se(e)
while J(e)or I(e)do
e=H(xe(e))
end
return e
end
t.un_just=H
t.un_just_comment_all=se
t.delay_p=qe
t.delay_just_p=l
local function Ae(e)
if W(e)then
return e
elseif G(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return k()
end
local function se(e)
return oe(Ae(e))
end
local function J(e)
return ae(Ae(e))
end
t.delay_env=se
t.delay_x=J
local function J(e)
return n(e)
end
local function se(e)
if I(e)then
return ne(e)
else
return g(e)
end
end
t.force_all=J
t.force1=g
t.force_uncomment1=se
t.force_uncomment_all=Se
ze={}
local function xe(s)
s=n(s)
if not m(s)then
return false
end
local e=n(_(s))
if not p(e)then
return false
end
if not D(e,Ke)then
return false
end
e=n(T(s))
if not a(e)then
return false
end
if not r(n(i(e)))then
return false
end
local s={}
local h=n(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=n(o(h))
h=n(i(h))
if not a(e)then
return false
end
local t=o(e)
e=n(i(e))
if not a(e)then
return false
end
local a=o(e)
if not r(n(i(e)))then
return false
end
local o=true
do
local e=0
while e<#s do
if c(s[(e+0)+1],t)then
s[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
__TS__ArrayPush(s,t)
__TS__ArrayPush(s,a)
end
end
return s
end
t.env_null_v=ze
t.env_set=_e
t.env_get=He
t.env2val=N
t.env_foreach=Me
t.val2env=xe
local function se(t,a)
return{
t,
1,
function(e)
e=g(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return me
end
return K
end,
}
end
local function J(t,i,o)
return{
t,
1,
function(e,a)
e=g(e)
if l(e)then
return E(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
Fe={
se(Ge,m),
{
ut,
2,
z,
},
J(Ve,m,_),
J(Be,m,T),
se(We,b),
{
lt,
2,
S,
},
J(Ye,b,C),
J(Pe,b,L),
se(Re,r),
{
at,
2,
h,
},
se(Ce,a),
J(Ue,a,o),
J(De,a,i),
{
te,
2,
function(e,t,n)
if e==t then
return me
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return E(te,{
e,
t,
})
end
if e==t then
return me
end
local function n(e,a,t)
return E(Z,{
e,
a,
t,
})
end
local function s(e,t)
return n(e,t,K)
end
R(not l(e))
local function n(e,t,o,a)
return s(E(te,{
o(e),
o(t),
}),E(te,{
a(e),
a(t),
}))
end
if r(e)then
if not r(e)then
return K
end
return me
elseif p(e)then
if not p(t)then
return K
end
if D(e,t)then
return me
else
return K
end
elseif m(e)then
if not m(t)then
return K
end
return n(e,t,_,T)
elseif a(e)then
if not a(t)then
return K
end
return n(e,t,o,i)
elseif b(e)then
if not b(t)then
return K
end
return n(e,t,C,L)
end
return k()
end,
},
{
we,
2,
function(h,e,s)
local t={}
local e=n(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(i(e))
end
if not r(e)then
return s()
end
return P(h,t)
end,
},
{
ce,
2,
function(e,t,a)
local e=xe(e)
if e==false then
return a()
end
return O(e,t)
end,
},
se(Le,p),
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
Z,
3,
function(e,a,o,t)
e=g(e)
if l(e)then
return E(Z,{
e,
a,
o,
})
end
if not m(e)then
return t()
end
local e=n(_(e))
if not p(e)then
return t()
end
if D(e,et)then
return a
end
if D(e,tt)then
return o
end
return t()
end,
},
{
Ie,
2,
le,
},
}
t.equal_p=c
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function n(t,e,o,a)
if l(o(t),o(e))and l(a(t),a(e))then
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
return n(e,t,C,L)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,_,T)
elseif W(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return k()
end
local function g(e)
return f(U(e))
end
t.simple_print=f
t.simple_print_force_all_rec=g
local function J(Z)
local H,b,c,l,m,n,_,T,Q,g,N,I,U,L,D,M,Y,W,V,A,C,k,f,K,G,J
function c()
return#H==b
end
function l()
R(not c())
local e=string.sub(H,b+1,b+1)
b=b+1
return e
end
function m(e)
R(string.sub(H,(b-1)+1,(b-1)+1)==e)
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
function T()
if c()then
return false
end
local e=l()
if not _(e)then
m(e)
return false
end
while _(e)and not c()do
e=l()
end
if not _(e)then
m(e)
end
return true
end
function Q()
if c()then
return false
end
local e=l()
local t=""
if not W(e)then
m(e)
return false
end
while W(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if W(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if st(t)then
return s(t)
else
return n("Not Symbol"..tostring(t))
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
B(t,h(a,e))
t=e
end
while true do
T()
if c()then
return n()
end
e=l()
if e==")"then
B(t,y)
return a
end
if e=="."then
T()
local o=V()
B(t,o)
T()
if c()then
return n()
end
e=l()
if e~=")"then
return n()
end
return a
end
m(e)
local e=V()
o(e)
end
end
function N()
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
return n()
end
if not a(e)then
return n()
end
return z(o(e),i(e))
end
function I()
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
return n()
end
if not a(e)then
return n()
end
return S(o(e),i(e))
end
function W(t)
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
function V()
T()
local e={
g,
J,
N,
I,
U,
L,
D,
M,
Y,
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
function A(e)
if e==false then
return n()
end
return e
end
function C()
return not c()
end
function k(e)
A(C())
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
N,
I,
U,
L,
D,
M,
Y,
}
else
e={
g,
G,
N,
I,
U,
L,
D,
M,
Y,
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
function K(t)
if c()then
return t
end
local a=l()
if a=="."then
local a=f()
return e(u,e(d,e(t),w),a)
elseif a==":"then
local a=f()
return e(u,a,t)
elseif a=="~"then
return e(ie,t)
elseif a=="@"then
local a=f()
return e(u,e(d,h(t,w),w),a)
elseif a=="?"then
return e(u,d,e(ie,t))
elseif a=="/"then
local t={t}
while true do
local e=f(true)
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
return e(Te,x(t))
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
A(C())
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
A(C())
local t=l()
if t=="&"then
k(">")
local t=f()
return e(u,e(q,e(d,w,t)),F)
elseif t==">"then
local t=f()
return e(u,e(d,w,t),F)
else
m(t)
end
local t=f()
return e(u,t,F)
elseif t=="+"then
local t=f()
return e(j,t)
elseif t=="["then
local e=f()
k("]")
return K(e)
elseif t=="_"then
k(":")
local t=f()
return e(u,t,w)
else
m(t)
local e=Q()
if e==false then
return false
end
return K(e)
end
end
function J()
local e=G()
if e==false then
return false
end
if p(e)then
return e
end
return v(e)
end
H=Z
b=0
local function e(t,s)
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
return n()
end
if not a(e)then
return n()
end
local t=i(e)
if not(a(t)and r(i(t)))then
return n()
end
return s(o(e),o(t))
end
end
local function d(t,h)
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
return n()
end
if not a(e)then
return n()
end
local t=i(e)
if not a(t)then
return n()
end
local s=i(t)
if not(a(s)and r(i(s)))then
return n()
end
return h(o(e),o(t),o(s))
end
end
U=e("$",function(e,t)
local e=xe(e)
if e==false then
return n()
end
return O(e,t)
end)
L=e("%",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return n()end)
return E(t,e)
end)
D=d("@",function(e,a,t)
local t=ye(t,function(e)return e end,function(e,e)return n()end)
local e=xe(e)
if e==false then
return n()
end
return Qe(e,a,t)
end)
M=e("^",function(t,e)
local e=ye(e,function(e)return e end,function(e,e)return n()end)
return P(t,e)
end)
Y=e(";",function(e,t)return le(e,t)end)
return V()
end
t.complex_parse=J
local function g(y)
local function n(h,c)
if p(h)then
return ue(h)
end
local function s(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=M(h)
if e~=false and#e==3 and l(e[0+1],u)then
local t=M(e[1+1])
if t~=false and#t==3 and l(t[0+1],d)then
local h=t[1+1]
local r=M(h)
if r~=false and#r==1 and l(t[2+1],w)then
return s(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),w)and l(t[2+1],w)then
return s(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,w)and l(e[2+1],F)then
return s(":>"..tostring(n(t[2+1],true)))
end
end
local a=M(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ie)then
return s(tostring(n(a[1+1],true)).."?")
end
if t~=false and#t==2 and l(e[2+1],F)and l(t[0+1],q)then
local e=M(t[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return s(":&>"..tostring(n(e[2+1],true)))
end
end
local t=l(e[2+1],w)and"_"or l(e[2+1],F)and""or n(e[2+1],true)
return s(tostring(t)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],q)then
local t=M(e[1+1])
if t~=false and#t==2 and l(t[0+1],j)then
return s("&+"..tostring(n(t[1+1],true)))
end
return s("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],ie)then
return s(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return s("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],Te)then
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
return s(a)
end
end
end
if c then
return f(h)
else
return f(v(h))
end
end
local e=J(f(y))
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
local e=M(a)
if e~=false and#e==2 and l(t,Ee)and l(e[0+1],j)then
return n(e[1+1],false)
end
return"#"..tostring(g(h(t,a)))
elseif b(e)then
return"!"..tostring(g(h(C(e),L(e))))
elseif p(e)then
return ue(e)
elseif I(e)then
return";("..tostring(g(ke(e))).." "..tostring(g(ne(e)))..")"
elseif W(e)then
return"$("..tostring(g(N(oe(e)))).." "..tostring(g(ae(e)))..")"
elseif V(e)then
return"%("..tostring(g(fe(e))).." "..tostring(g(x(de(e))))..")"
elseif G(e)then
return"@("..tostring(g(N(ve(e)))).." "..tostring(g(je(e))).." "..tostring(g(x(be(e))))..")"
elseif Y(e)then
return"^("..tostring(g(ge(e))).." "..tostring(g(x(pe(e))))..")"
end
return k()
end
t.complex_print=g
local function l(i)
local d=X()
local o={function(e)return B(d,e)end}
local t=0
local function n()
error("MT parse ERROR")
end
local function s(e)
if not e then
return n()
end
end
local function r()
s(#i>t)
local e=string.sub(i,t+1,t+1)
t=t+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=r()
local a
a=function(a)
local t=X()
local e=X()
__TS__ArrayPush(i,function(e)return B(t,e)end)
__TS__ArrayPush(i,function(t)return B(e,t)end)
o(a(t,e))
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
if rt(e)then
o(Je(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(z)
elseif t=="!"then
a(S)
elseif t=="$"then
a(function(t,a)return O(ze,e(ee,ce,Q(t),Q(a)))end)
elseif t=="_"then
o(y)
else
return n()
end
end
o=i
end
s(t==#i)
return d
end
local function f(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=H(e)
local t
t=function(e,a,o,t)
n=tostring(n)..tostring(a)
__TS__ArrayPush(h,o(e))
__TS__ArrayPush(h,t(e))
end
if p(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(he(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif m(e)then
t(e,"#",_,T)
elseif b(e)then
t(e,"!",C,L)
elseif qe(e)then
local e=Ae(e)
t(e,"$",(function(e)return N(oe(e))end),ae)
else
return k()
end
end
s=h
end
return n
end
t.machinetext_parse=l
t.machinetext_print=f
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
local function b(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=g
t.trampoline_delay=l
t.run_trampoline=b
local k=v(h(Te,h(h(ot,h(h(u,h(it,h(w,y))),y)),y)))
local v=v(h(Te,h(h(ot,h(re,y)),y)))
local function q(a,t)
return z(v,e(a,t))
end
local function j(e)
return z(k,e)
end
local function y(p,w,u,f,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=n(u)
if m(u)then
local m=_(u)
local t=T(u)
if c(m,k)then
t=n(t)
if a(t)then
local e=o(t)
local t=n(i(t))
if r(t)then
if h==false then
local a=e
local t=f
local e
e=function()return p(a,t)end
return l(e)
else
local a
a=p
local t
t=w
local i=e
local o=f
local e
e=function()return y(a,t,P(h,i),o)end
return l(e)
end
end
end
elseif c(m,v)then
t=n(t)
if a(t)then
local u=o(t)
local t=n(i(t))
if a(t)then
local a=o(t)
local t=n(i(t))
if r(t)then
if h==false then
local e
e=p
local o
o=w
local i=u
local a=a
local n=f
local t
t=function()return y(e,o,i,n,a)end
return l(t)
else
local i
i=p
local o
o=w
local c=u
local u=a
local r=f
local n=h
local t=s("序甲")
local a
a=function()return y(i,o,c,r,z(d,e(e(t),b(e(Q(u),t),Q(n)))))end
return l(a)
end
end
end
end
end
end
if h==false then
return l(function()return w(u,f,p)end)
else
return l(function()return w(u,f,function(t,e)return l(function()return y(p,w,P(h,{t}),e)end)end)end)
end
end
local function i(a,o,t,e)
return y(a,o,t,e)
end
local function e(e,a,i,o)
return b(y((function(t,a)return g(e(t,a))end),(function(o,t,e)return g(a(o,t,function(a,t)return b(e(a,t))end))end),i,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=k
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=i
t.run_monad_stackoverflow=e
return t