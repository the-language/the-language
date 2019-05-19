function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,I,w,Ee,ze,_e,ye,F,M,W,ne,Te,ee,Ae,Je,ce,H,ke,Z,me,p,ue,le,h,a,o,n,y,r,z,m,_,E,N,g,U,L,Q,ot,S,K,oe,X,Qe,G,pe,ve,be,T,P,he,re,V,B,ge,qe,C,J,s,A,Y,at,q,d,x,Le,tt,Ce,De,Ue,Ne,Ie,Oe,Ke,Se,Re,He,Me,te,fe,we,ae,Fe,Ve,ie,de,dt,rt,D,j,e,R,je,l,i,b,Be,Ge,xe,Ye,ht,O,Pe,u,v,We,it,nt,st,se,et,c,f,Ze,Xe
function k()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return k()
end
end
function ce(e,t)
return{
Ae,
e,
t,
}
end
function H(e)
return e[0+1]==Ae
end
function ke(e)
return e[1+1]
end
function Z(e)
return e[2+1]
end
function me(e)
while H(e)do
e=Z(e)
end
return e
end
function p(e)
return e[0+1]==Ee
end
function ue(e)
return e[1+1]
end
function le(e)
return w()[ue(e)]
end
function h(t,e)
return{
ze,
t,
e,
}
end
function a(e)
return e[0+1]==ze
end
function o(e)
return e[1+1]
end
function n(e)
return e[2+1]
end
function r(e)
return e[0+1]==_e
end
function z(e,t)
return{
ye,
e,
t,
}
end
function m(e)
return e[0+1]==ye
end
function _(e)
return e[1+1]
end
function E(e)
return e[2+1]
end
function N(t,e)
return{
F,
t,
e,
}
end
function g(e)
return e[0+1]==F
end
function U(e)
return e[1+1]
end
function L(e)
return e[2+1]
end
function Q(e)
return e[0+1]==M
end
function ot(e)
return e[1+1]
end
function S(e,t)
return{
W,
e,
t,
}
end
function K(e)
return e[0+1]==W
end
function oe(e)
return e[1+1]
end
function X(e)
return e[2+1]
end
function Qe(t,e,a)
return{
Te,
t,
e,
a,
}
end
function G(e)
return e[0+1]==Te
end
function pe(e)
return e[1+1]
end
function ve(e)
return e[2+1]
end
function be(e)
return e[3+1]
end
function T(t,e)
return{
ne,
t,
e,
}
end
function P(e)
return e[0+1]==ne
end
function he(e)
return e[1+1]
end
function re(e)
return e[2+1]
end
function V(e,t)
return{
ee,
e,
t,
}
end
function B(e)
return e[0+1]==ee
end
function ge(e)
return e[1+1]
end
function qe(e)
return e[2+1]
end
function C(e)
local e=i(e)
local function t(e)
e[1+1]=C(e[1+1])
e[2+1]=C(e[2+1])
return e
end
if m(e)then
return t(e)
elseif g(e)then
return t(e)
elseif a(e)then
return t(e)
elseif H(e)then
return t(e)
end
return e
end
function J()
return{Je}
end
function s(e)
return e[0+1]==Je
end
function A(e,t)
if e==t then
return
end
e[0+1]=M
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function Y(e,a)
I(s(e))
I(not s(a))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function at(t)
local e=J()
Y(e,t)
return e
end
function D(t,e)
if t==e then
return true
end
if ue(t)==ue(e)then
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
function R(e)
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
__TS__ArrayPush(t,e)
e=ot(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function je(e)
return K(e)or G(e)or P(e)or B(e)
end
function l(e)
return Q(e)or je(e)
end
function i(o,n,t,a)
if n==nil then
n={}
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
return i(t,n,{
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
local function u()
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
local t=0
while l(e)and t<32 do
__TS__ArrayPush(a,e)
e=b(e)
t=t+1
end
end
while l(e)do
local h=f(e)
if n[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if K(e)then
return o()
elseif P(e)then
local a=he(e)
local e=re(e)
local h={
Ce,
De,
Ue,
Ne,
Ie,
Oe,
Ke,
Se,
Re,
He,
Me,
}
local n=false
for e=1,#h do
local e=h[e]
if c(e,a)then
n=true
break
end
end
if n then
I(#e==1)
I(t[1+1]==false)
local e=i(e[0+1],u(),t)
if t[1+1]then
return s(T(a,{e}))
else
return k()
end
end
if c(a,te)then
return o()
elseif c(a,fe)then
return o()
elseif c(a,we)then
return o()
elseif c(a,ae)then
I(#e==3)
I(t[1+1]==false)
local a=i(e[0+1],u(),t)
if t[1+1]then
return s(T(ae,{
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
elseif B(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=b(e)
end
return d(e)
end
function b(a)
local e=R(a)
local t
I(not Q(e))
if K(e)then
t=u(oe(e),X(e),a)
elseif G(e)then
t=st(pe(e),ve(e),be(e),a)
elseif P(e)then
t=nt(he(e),re(e),a)
elseif B(e)then
t=it(ge(e),qe(e),a)
else
t=e
end
t=R(t)
A(e,t)
return t
end
function Be(e)
while l(e)or H(e)do
e=i(me(e))
end
return e
end
function xe(a,o,i)
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
function Ye(t,a,o)
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
function ht(t,a)
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
function O(a)
local o=y
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return z(Le,e(o))
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
function u(h,t,d)
local s=b(t)
if l(s)then
return d
end
local t
t=function()return N(q,e(ie,e(we,e(O(h),s))))end
if a(s)then
local e={}
local s=s
while not r(s)do
if l(s)then
return d
elseif a(s)then
__TS__ArrayPush(e,o(s))
s=b(n(s))
else
return t()
end
end
if c(e[0+1],de)then
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
elseif c(e[0+1],dt)then
if#e==1 then
return t()
end
local s=i(S(h,e[1+1]))
if not m(s)then
return t()
end
local i=b(_(s))
if l(i)then
return d
end
if not p(i)then
return t()
end
if not D(i,x)then
return t()
end
local i=b(E(s))
if l(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=b(n(i))
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
return V(o,a)
elseif c(e[0+1],ie)then
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
return V(o,a)
end
elseif r(s)then
return s
elseif v(s)then
return Ye(h,s,t())
elseif g(s)then
return t()
end
return k()
end
function v(e)
return p(e)or m(e)
end
function it(t,u,c)
local function s()
return N(q,e(ie,e(fe,e(t,j(u)))))
end
t=b(t)
if l(t)then
return c
end
if not m(t)then
return s()
end
local e=i(_(t))
if not(p(e)and D(e,d))then
return s()
end
local t=i(E(t))
if not a(t)then
return s()
end
local e=C(o(t))
local t=i(n(t))
if not(a(t)and r(i(n(t))))then
return s()
end
local d=o(t)
local i=Ge
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
i=xe(i,e,a)
t=#u
e=y
elseif a(e)then
if t<#u then
local a=u[t+1]
t=t+1
i=xe(i,o(e),a)
e=n(e)
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
return S(i,d)
end
function nt(i,t,o)
local a
a=function()return N(q,e(ie,e(i,j(t))))end
for e=1,#We do
local e=We[e]
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
function st(i,o,t,a)
local a
a=function()return N(q,e(de,e(O(i),o,j(t))))end
if c(o,Fe)then
if#t~=1 then
return a()
end
return t[0+1]
elseif c(o,Ve)then
if#t~=2 then
return a()
end
return et(i,t[0+1],t[1+1],a)
elseif c(o,rt)then
if#t~=2 then
return a()
end
return ce(t[0+1],S(i,t[1+1]))
end
return a()
end
function se(t)
return e(de,Fe,t)
end
function et(l,i,m,t)
if t==nil then
t=false
end
local function f()
if t==false then
return N(q,e(de,e(O(l),Ve,j({
i,
m,
}))))
else
return t()
end
end
i=C(i)
local s={}
local u=false
local t=i
while not r(t)do
if v(t)then
__TS__ArrayPush(s,t)
u=true
t=y
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=n(t)
else
return f()
end
end
local a=i
if u then
a=j(s)
end
local t={}
Pe(l,function(a,e)
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
a=h(se(ht(l,t[e+1])),a)
e=e-1
end
end
return z(d,e(i,h(se(z(d,e(o,m))),a)))
end
function c(e,t)
if e==t then
return true
end
e=i(e)
t=i(t)
if e==t then
return true
end
local function i(e,t,o,a)
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
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,L)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,_,E)
end
return k()
end
function f(e)
e=R(e)
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
e=R(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(f(h(_(e),E(e))))
elseif g(e)then
return"!"..tostring(f(h(U(e),L(e))))
elseif p(e)then
return le(e)
elseif H(e)then
return";("..tostring(f(ke(e))).." "..tostring(f(Z(e)))..")"
elseif K(e)then
return"$("..tostring(f(O(oe(e)))).." "..tostring(f(X(e)))..")"
elseif P(e)then
return"%("..tostring(f(he(e))).." "..tostring(f(j(re(e))))..")"
elseif G(e)then
return"@("..tostring(f(O(pe(e)))).." "..tostring(f(ve(e))).." "..tostring(f(j(be(e))))..")"
elseif B(e)then
return"^("..tostring(f(ge(e))).." "..tostring(f(j(qe(e))))..")"
end
return k()
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
local u
u=function()
local e=Ze()
u=function()return e end
return e
end
w=function()
local e=Xe()
w=function()return e end
return e
end
Ee=0
ze=1
_e=2
ye=3
F=4
M=5
W=6
ne=7
Te=8
ee=9
Ae=11
Je=10
t.new_comment=ce
t.comment_p=H
t.comment_comment=ke
t.comment_x=Z
t.un_comment_all=me
local function nt(e)
return w()[e]~=nil
end
local function ot(e)
return{
Ee,
e,
}
end
local function et(e)
return u()[e]~=nil
end
local function s(e)
return ot(u()[e])
end
t.can_new_symbol_p=et
t.New_Symbol=New_Symbol
t.new_symbol=s
t.symbol_p=p
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=n
y={_e}
t.Null_V=Null_V
t.null_v=y
t.null_p=r
t.New_Data=New_Data
t.new_data=z
t.data_p=m
t.data_name=_
t.data_list=E
t.New_Error=New_Error
t.new_error=N
t.error_p=g
t.error_name=U
t.error_list=L
t.just_p=Q
t.evaluate=S
t.apply=V
local function u(e)
local o=Be(e)
local function i(e)
e[1+1]=C(e[1+1])
e[2+1]=C(e[2+1])
if H(e[1+1])or H(e[2+1])then
local t=at(e)
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
elseif g(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=C
t.force_uncomment_all_rec=u
q=s("太始初核")
local ye=s("符名")
d=s("化滅")
x=s("式形")
local vt=s("等同")
local pt=s("解算")
local W=s("特定其物")
local w=s("省略一物")
Le=s("映表")
local wt=s("如若")
local u=s("一類何物")
local ee=s("是非")
local Ee=s("其子")
local at=s("爻陽")
local it=s("爻陰")
local yt=s("引用")
local ft=s("應用")
local mt=s("間空")
local ne=s("連頸")
local ze=s("構物")
local _e=s("謬誤")
local ht=s("詞素")
local Ae=s("列序")
local st=s("首始")
local ct=s("尾末")
local Ze=s("之物")
local v=s("宇宙亡矣")
local Je=s("效應")
local Xe=s("註疏")
tt=N(q,e(v,w))
local function v(e)
return z(ye,h(q,h(e,y)))
end
local function Te(t)
return v(e(u,e(d,w,t),W))
end
local function M(a,t)
return v(e(u,e(d,e(a),w),t))
end
local function F(t)
return v(e(u,d,e(ee,e(u,t,w))))
end
local ut=Te(ze)
Ce=M(ze,ye)
De=M(ze,Ae)
Ue=F(ze)
local lt=Te(_e)
Ne=M(_e,ye)
Ie=M(_e,Ae)
Oe=F(_e)
local tt=Te(ne)
Ke=F(ne)
Se=M(ne,st)
Re=M(ne,ct)
He=F(ht)
Me=F(mt)
te=v(e(u,d,e(ee,vt)))
fe=v(e(u,e(d,h(d,w),w),ft))
we=v(e(u,d,pt))
local Te=M(Ae,e(u,Ze,w))
ae=v(e(u,d,wt))
Fe=v(e(u,x,yt))
Ve=v(e(u,e(x,e(d,w,d)),W))
ie=v(e(x,e(q,d)))
de=v(e(x,e(q,x)))
dt=v(e(x,x))
local Ae=v(e(u,d,Xe))
rt=v(e(u,x,Xe))
local F=z(it,e())
local ie=z(at,e())
local function ze(e,s,i)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(e)
end
if r(e)then
return s(t)
end
return i(t,e)
end
local function M(e)
return ze(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=M
t.new_list=e
local function de(e)
while Q(e)or H(e)do
e=R(me(e))
end
return e
end
t.un_just=R
t.un_just_comment_all=de
t.delay_p=je
t.delay_just_p=l
local function _e(e)
if K(e)then
return e
elseif G(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return k()
end
local function Q(e)
return oe(_e(e))
end
local function de(e)
return X(_e(e))
end
t.delay_env=Q
t.delay_x=de
local function Q(e)
return i(e)
end
local function de(e)
if H(e)then
return Z(e)
else
return b(e)
end
end
t.force_all=Q
t.force1=b
t.force_uncomment1=de
t.force_uncomment_all=Be
Ge={}
local function me(s)
s=i(s)
if not m(s)then
return false
end
local e=i(_(s))
if not p(e)then
return false
end
if not D(e,Le)then
return false
end
e=i(E(s))
if not a(e)then
return false
end
if not r(i(n(e)))then
return false
end
local s={}
local h=i(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=i(o(h))
h=i(n(h))
if not a(e)then
return false
end
local h=o(e)
e=i(n(e))
if not a(e)then
return false
end
local a=o(e)
if not r(i(n(e)))then
return false
end
local t=true
do
local e=0
while e<#s do
if c(s[(e+0)+1],h)then
s[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
__TS__ArrayPush(s,h)
__TS__ArrayPush(s,a)
end
end
return s
end
t.env_null_v=Ge
t.env_set=xe
t.env_get=Ye
t.env2val=O
t.env_foreach=Pe
t.val2env=me
local function de(t,a)
return{
t,
1,
function(e)
e=b(e)
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
local function Q(t,o,a)
return{
t,
1,
function(e,i)
e=b(e)
if l(e)then
return T(t,{e})
end
if o(e)then
return a(e)
end
return i()
end,
}
end
We={
de(Ue,m),
{
ut,
2,
z,
},
Q(Ce,m,_),
Q(De,m,E),
de(Oe,g),
{
lt,
2,
N,
},
Q(Ne,g,U),
Q(Ie,g,L),
de(Me,r),
{
tt,
2,
h,
},
de(Ke,a),
Q(Se,a,o),
Q(Re,a,n),
{
te,
2,
function(e,t,i)
if e==t then
return ie
end
e=b(e)
t=b(t)
if l(e)or l(t)then
return T(te,{
e,
t,
})
end
if e==t then
return ie
end
local function i(t,a,e)
return T(ae,{
t,
a,
e,
})
end
local function s(e,t)
return i(e,t,F)
end
I(not l(e))
local function i(a,e,t,o)
return s(T(te,{
t(a),
t(e),
}),T(te,{
o(a),
o(e),
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
if D(e,t)then
return ie
else
return F
end
elseif m(e)then
if not m(t)then
return F
end
return i(e,t,_,E)
elseif a(e)then
if not a(t)then
return F
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return F
end
return i(e,t,U,L)
end
return k()
end,
},
{
fe,
2,
function(h,e,s)
local t={}
local e=i(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=i(n(e))
end
if not r(e)then
return s()
end
return V(h,t)
end,
},
{
we,
2,
function(e,a,t)
local e=me(e)
if e==false then
return t()
end
return S(e,a)
end,
},
de(He,p),
{
Te,
1,
function(e,t)
e=b(e)
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
ae,
3,
function(e,o,a,t)
e=b(e)
if l(e)then
return T(ae,{
e,
o,
a,
})
end
if not m(e)then
return t()
end
local e=i(_(e))
if not p(e)then
return t()
end
if D(e,at)then
return o
end
if D(e,it)then
return a
end
return t()
end,
},
{
Ae,
2,
ce,
},
}
t.equal_p=c
local function l(e,t)
if e==t then
return true
end
e=R(e)
t=R(t)
if e==t then
return true
end
local function i(e,t,a,o)
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
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,L)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,_,E)
elseif K(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return k()
end
local function b(e)
return f(C(e))
end
t.simple_print=f
t.simple_print_force_all_rec=b
local function te(Z)
local B,b,c,l,m,i,E,_,Q,g,P,F,R,D,L,H,O,U,M,A,C,k,f,K,G,X
function c()
return#B==b
end
function l()
I(not c())
local e=string.sub(B,b+1,b+1)
b=b+1
return e
end
function m(e)
I(string.sub(B,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function i(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function E(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function _()
if c()then
return false
end
local e=l()
if not E(e)then
m(e)
return false
end
while E(e)and not c()do
e=l()
end
if not E(e)then
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
if et(t)then
return s(t)
else
return i("Not Symbol"..tostring(t))
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
local function o(a)
local e=J()
Y(t,h(a,e))
t=e
end
while true do
_()
if c()then
return i()
end
e=l()
if e==")"then
Y(t,y)
return a
end
if e=="."then
_()
local o=M()
Y(t,o)
_()
if c()then
return i()
end
e=l()
if e~=")"then
return i()
end
return a
end
m(e)
local e=M()
o(e)
end
end
function P()
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
return i()
end
if not a(e)then
return i()
end
return z(o(e),n(e))
end
function F()
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
return i()
end
if not a(e)then
return i()
end
return N(o(e),n(e))
end
function U(e)
if E(e)then
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
function M()
_()
local e={
g,
X,
P,
F,
R,
D,
L,
H,
O,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return i()
end
function A(e)
if e==false then
return i()
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
P,
F,
R,
D,
L,
H,
O,
}
else
e={
g,
G,
P,
F,
R,
D,
L,
H,
O,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return i()
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
return e(ee,t)
elseif a=="@"then
local a=f()
return e(u,e(d,h(t,w),w),a)
elseif a=="?"then
return e(u,d,e(ee,t))
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
return e(Ee,j(t))
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
return e(x,e(q,t))
else
m(t)
end
local t=f()
return e(x,t)
elseif t==":"then
A(C())
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
return e(q,t)
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
function X()
local e=G()
if e==false then
return false
end
if p(e)then
return e
end
return v(e)
end
B=Z
b=0
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
return i()
end
if not a(e)then
return i()
end
local t=n(e)
if not(a(t)and r(n(t)))then
return i()
end
return s(o(e),o(t))
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
return i()
end
if not a(e)then
return i()
end
local t=n(e)
if not a(t)then
return i()
end
local s=n(t)
if not(a(s)and r(n(s)))then
return i()
end
return h(o(e),o(t),o(s))
end
end
R=s("$",function(e,t)
local e=me(e)
if e==false then
return i()
end
return S(e,t)
end)
D=s("%",function(t,e)
local e=ze(e,function(e)return e end,function(e,e)return i()end)
return T(t,e)
end)
L=h("@",function(e,t,a)
local a=ze(a,function(e)return e end,function(e,e)return i()end)
local e=me(e)
if e==false then
return i()
end
return Qe(e,t,a)
end)
H=s("^",function(t,e)
local e=ze(e,function(e)return e end,function(e,e)return i()end)
return V(t,e)
end)
O=s(";",function(e,t)return ce(e,t)end)
return M()
end
t.complex_parse=te
local function b(y)
local function i(r,c)
if p(r)then
return le(r)
end
local function t(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=M(r)
if e~=false and#e==3 and l(e[0+1],u)then
local s=M(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=M(h)
if r~=false and#r==1 and l(s[2+1],w)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(n(h),w)and l(s[2+1],w)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,w)and l(e[2+1],W)then
return t(":>"..tostring(i(s[2+1],true)))
end
end
local a=M(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ee)then
return t(tostring(i(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],W)and l(s[0+1],x)then
local e=M(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],w)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],w)and"_"or l(e[2+1],W)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=M(e[1+1])
if a~=false and#a==2 and l(a[0+1],q)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ee)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],q)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],Ee)then
local e=M(e[1+1])
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
if c then
return f(r)
else
return f(v(r))
end
end
local e=te(f(y))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(b(o(e)))
d=" "
e=n(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(b(e))..")"
end
return s
elseif m(e)then
local a=_(e)
local t=E(e)
local e=M(t)
if e~=false and#e==2 and l(a,ye)and l(e[0+1],q)then
return i(e[1+1],false)
end
return"#"..tostring(b(h(a,t)))
elseif g(e)then
return"!"..tostring(b(h(U(e),L(e))))
elseif p(e)then
return le(e)
elseif H(e)then
return";("..tostring(b(ke(e))).." "..tostring(b(Z(e)))..")"
elseif K(e)then
return"$("..tostring(b(O(oe(e)))).." "..tostring(b(X(e)))..")"
elseif P(e)then
return"%("..tostring(b(he(e))).." "..tostring(b(j(re(e))))..")"
elseif G(e)then
return"@("..tostring(b(O(pe(e)))).." "..tostring(b(ve(e))).." "..tostring(b(j(be(e))))..")"
elseif B(e)then
return"^("..tostring(b(ge(e))).." "..tostring(b(j(qe(e))))..")"
end
return k()
end
t.complex_print=b
local function f(s)
local l=J()
local a={function(e)return Y(l,e)end}
local e=0
local function o()
error("MT parse ERROR")
end
local function r(e)
if not e then
return o()
end
end
local function d()
r(#s>e)
local t=string.sub(s,e+1,e+1)
e=e+1
return t
end
local n={}
while#a~=0 do
local t={}
for e=1,#a do
local a=a[e]
local e=d()
local i
i=function(i)
local o=J()
local e=J()
__TS__ArrayPush(t,function(e)return Y(o,e)end)
__TS__ArrayPush(t,function(t)return Y(e,t)end)
a(i(o,e))
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
if nt(e)then
a(ot(e))
else
return o()
end
elseif e=="."then
i(h)
elseif e=="#"then
i(z)
elseif e=="!"then
i(N)
elseif e=="$"then
local e=false
local i=false
__TS__ArrayPush(t,function(t)
e=t
end)
__TS__ArrayPush(t,function(e)
i=e
end)
__TS__ArrayPush(n,function()
if e==false or i==false then
return k()
else
local e=me(e)
if e==false then
return o()
else
a(S(e,i))
end
end
end)
elseif e=="_"then
a(y)
else
return o()
end
end
a=t
end
r(e==#s)
for e=1,#n do
local e=n[e]
e()
end
return l
end
local function l(e)
local s={e}
local i=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=R(e)
local t
t=function(e,t,o,a)
i=tostring(i)..tostring(t)
__TS__ArrayPush(h,o(e))
__TS__ArrayPush(h,a(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ue(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",_,E)
elseif g(e)then
t(e,"!",U,L)
elseif je(e)then
local e=_e(e)
t(e,"$",(function(e)return O(oe(e))end),X)
else
return k()
end
end
s=h
end
return i
end
t.machinetext_parse=f
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
local b=v(h(Ee,h(h(Je,h(h(u,h(Ze,h(w,y))),y)),y)))
local v=v(h(Ee,h(h(Je,h(ne,y)),y)))
local function j(a,t)
return z(v,e(a,t))
end
local function q(e)
return z(b,e)
end
local function f(w,p,u,y,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
u=i(u)
if m(u)then
local m=_(u)
local t=E(u)
if c(m,b)then
t=i(t)
if a(t)then
local e=o(t)
local t=i(n(t))
if r(t)then
if h==false then
local t=e
local a=y
local e
e=function()return w(t,a)end
return l(e)
else
local a
a=w
local t
t=p
local i=e
local o=y
local e
e=function()return f(a,t,V(h,i),o)end
return l(e)
end
end
end
elseif c(m,v)then
t=i(t)
if a(t)then
local u=o(t)
local t=i(n(t))
if a(t)then
local o=o(t)
local t=i(n(t))
if r(t)then
if h==false then
local a
a=w
local t
t=p
local n=u
local i=o
local o=y
local e
e=function()return f(a,t,n,o,i)end
return l(e)
else
local t
t=w
local i
i=p
local r=u
local c=o
local u=y
local n=h
local o=s("序甲")
local a
a=function()return f(t,i,r,u,z(d,e(e(o),g(e(se(c),o),se(n)))))end
return l(a)
end
end
end
end
end
end
if h==false then
return l(function()return p(u,y,w)end)
else
return l(function()return p(u,y,function(t,e)return l(function()return f(w,p,V(h,{t}),e)end)end)end)
end
end
local function a(e,t,a,o)
return f(e,t,a,o)
end
local function o(e,o,n,i)
return g(f((function(a,t)return k(e(a,t))end),(function(a,e,t)return k(o(a,e,function(a,e)return g(t(a,e))end))end),n,i))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=a
t.run_monad_stackoverflow=o
return t