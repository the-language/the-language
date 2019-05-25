local function s(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,I,L,Je,Qe,Te,_e,We,De,we,fe,ce,Ae,Z,ne,le,O,ue,K,xe,v,D,de,h,a,i,n,g,d,_,y,T,A,H,j,Y,W,P,mt,N,G,X,ae,Ye,B,ze,je,ge,E,V,re,he,M,Q,ke,qe,w,J,o,c,F,ft,z,l,q,Pe,ct,Le,Ce,He,Me,Ue,Be,Ve,Fe,Oe,Ie,Ne,te,ve,me,ee,Se,rt,oe,ie,ut,at,U,x,e,R,be,m,pe,p,b,r,Re,Ge,ye,Ke,nt,S,Ze,it,tt,C,Xe,ot,ht,lt,se,dt,u,f,Ee,st,et
function k()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return k()
end
end
function le(t,e)
return{
Z,
t,
e,
}
end
function O(e)
return e[1]==Z
end
function ue(e)
return e[2]
end
function K(e)
return e[3]
end
function xe(e)
while O(e)do
e=K(e)
end
return e
end
function v(e)
return e[1]==Je
end
function D(e)
return e[2]
end
function de(e)
return L()[D(e)]
end
function h(t,e)
return{
Qe,
t,
e,
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
function d(e)
return e[1]==Te
end
function _(t,e)
return{
_e,
t,
e,
}
end
function y(e)
return e[1]==_e
end
function T(e)
return e[2]
end
function A(e)
return e[3]
end
function H(e,t)
return{
We,
e,
t,
}
end
function j(e)
return e[1]==We
end
function Y(e)
return e[2]
end
function W(e)
return e[3]
end
function P(e)
return e[1]==De
end
function mt(e)
return e[2]
end
function N(e,t)
return{
we,
e,
t,
}
end
function G(e)
return e[1]==we
end
function X(e)
return e[2]
end
function ae(e)
return e[3]
end
function Ye(a,e,t)
return{
ce,
a,
e,
t,
}
end
function B(e)
return e[1]==ce
end
function ze(e)
return e[2]
end
function je(e)
return e[3]
end
function ge(e)
return e[4]
end
function E(t,e)
return{
fe,
t,
e,
}
end
function V(e)
return e[1]==fe
end
function re(e)
return e[2]
end
function he(e)
return e[3]
end
function M(t,e)
return{
Ae,
t,
e,
}
end
function Q(e)
return e[1]==Ae
end
function ke(e)
return e[2]
end
function qe(e)
return e[3]
end
function w(e)
local e=r(e)
local function t(e)
e[2]=w(e[2])
e[3]=w(e[3])
return e
end
if y(e)then
return t(e)
elseif j(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function J()
return{ne}
end
function o(e)
return e[1]==ne
end
function c(e,t)
if e==t then
return
end
e[1]=De
e[2]=t
e[3]=false
e[4]=false
end
function F(e,a)
I(o(e))
I(not o(a))
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ft(t)
local e=J()
F(e,t)
return e
end
function U(t,e)
if t==e then
return true
end
if D(t)==D(e)then
c(t,e)
return true
else
return false
end
end
function x(a)
local t=g
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
if not P(e)then
return e
end
local e=e
local t={}
while P(e)do
s(t,e)
e=mt(e)
end
for a=1,#t do
local t=t[a]
c(t,e)
end
return e
end
function be(e)
return G(e)or B(e)or V(e)or Q(e)
end
function m(e)
return P(e)or be(e)
end
function pe(e)
if G(e)then
return e
elseif B(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return k()
end
function p(o,i,t,a)
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
c(e,t)
do
local e=0
while e<#a do
c(a[e+1],t)
e=e+1
end
end
return t
end
function n(t)
h(t)
if m(t)then
s(a,e)
return p(t,i,{
false,
false,
},a)
end
return t
end
local r={}
e=o
local function o()
t[2]=true
return n(ct)
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
while m(e)and t<32 do
s(a,e)
e=b(e)
t=t+1
end
end
while m(e)do
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[1]=true
if G(e)then
return o()
elseif V(e)then
local a=re(e)
local e=he(e)
local s={
Le,
Ce,
He,
Me,
Ue,
Be,
Ve,
Fe,
Oe,
Ie,
Ne,
}
local i=false
for e=1,#s do
local e=s[e]
if u(e,a)then
i=true
break
end
end
if i then
I(#e==1)
I(t[2]==false)
local e=p(e[1],d(),t)
if t[2]then
return n(E(a,{e}))
else
return k()
end
end
if u(a,te)then
return o()
elseif u(a,ve)then
return o()
elseif u(a,me)then
return o()
elseif u(a,ee)then
I(#e==3)
I(t[2]==false)
local a=p(e[1],d(),t)
if t[2]then
return n(E(ee,{
a,
e[2],
e[3],
}))
else
return k()
end
end
return k()
elseif B(e)then
return o()
elseif Q(e)then
return o()
end
return k()
end
r[h]=true
s(a,e)
e=b(e)
end
return h(e)
end
function b(a)
local e=R(a)
local t
I(not P(e))
if G(e)then
t=tt(X(e),ae(e),a)
elseif B(e)then
t=lt(ze(e),je(e),ge(e),a)
elseif V(e)then
t=ht(re(e),he(e),a)
elseif Q(e)then
t=ot(ke(e),qe(e),a)
else
t=e
end
t=R(t)
c(e,t)
return t
end
function r(e)
return p(e)
end
function Re(e)
while m(e)or O(e)do
e=r(xe(e))
end
return e
end
function ye(a,o,i)
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
function Ke(t,a,o)
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
function nt(t,a)
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
function S(o)
local a=g
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(Pe,e(a))
end
function Ze(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function it(e,u,l,r)
local t={}
local o={}
local e=R(e)
local h=true
while true do
if d(e)then
return r(o,t)
elseif O(e)then
s(o,ue(e))
e=K(e)
elseif a(e)then
s(t,i(e))
e=n(e)
elseif m(e)then
if h then
h=false
e=b(e)
else
return l()
end
else
return u()
end
end
end
function tt(h,t,l)
local o=b(t)
if m(o)then
return l
end
local function t()return H(z,e(oe,e(me,e(S(h),o))))end
if a(o)then
return it(o,t,function()return l end,function(o,e)
if#o~=0 then
error("WIP")
end
if u(e[1],ie)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
s(a,e[t+1])
t=t+1
end
end
return Ye(h,o,a)
elseif u(e[1],ut)then
if#e==1 then
return t()
end
local r=r(N(h,e[2]))
if not y(r)then
return t()
end
local o=b(T(r))
if m(o)then
return l
end
if not v(o)then
return t()
end
if not U(o,q)then
return t()
end
local o=b(A(r))
if m(o)then
return l
end
if not a(o)then
return t()
end
local i=i(o)
local a=b(n(o))
if m(a)then
return l
end
if not d(a)then
return t()
end
local a={S(h)}
do
local t=2
while t<#e do
s(a,e[t+1])
t=t+1
end
end
return M(i,a)
elseif u(e[1],oe)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
s(a,N(h,e[t+1]))
t=t+1
end
end
return E(o,a)
else
local o=N(h,e[1])
local a={}
do
local t=1
while t<#e do
s(a,N(h,e[t+1]))
t=t+1
end
end
return M(o,a)
end
end)
elseif d(o)then
return o
elseif C(o)then
return Ke(h,o,t())
elseif j(o)then
return t()
end
return k()
end
function C(e)
return v(e)or y(e)
end
function ot(o,s,u)
local function t()return H(z,e(oe,e(ve,e(o,x(s)))))end
o=b(o)
if m(o)then
return u
end
if not y(o)then
return t()
end
local e=r(T(o))
if not(v(e)and U(e,l))then
return t()
end
local o=r(A(o))
if not a(o)then
return t()
end
local e=w(i(o))
local o=r(n(o))
if not(a(o)and d(r(n(o))))then
return t()
end
local l=i(o)
local r=Ge
local o=0
while not d(e)do
if C(e)then
local t=g
do
local e=#s-1
while e>=o do
t=h(s[e+1],t)
e=e-1
end
end
r=ye(r,e,t)
o=#s
e=g
elseif a(e)then
if o<#s then
local t=s[o+1]
o=o+1
r=ye(r,i(e),t)
e=n(e)
else
return t()
end
else
return t()
end
end
if#s~=o then
return t()
end
return N(r,l)
end
function ht(i,t,o)
local function a()return H(z,e(oe,e(i,x(t))))end
for e=1,#Xe do
local e=Xe[e]
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
return k()
end
end
return a()
end
function lt(i,o,t,a)
local function a()return H(z,e(ie,e(S(i),o,x(t))))end
if u(o,Se)then
if#t~=1 then
return a()
end
return t[1]
elseif u(o,rt)then
if#t~=2 then
return a()
end
return dt(i,t[1],t[2],a)
elseif u(o,at)then
if#t~=2 then
return a()
end
return le(t[1],N(i,t[2]))
end
return a()
end
function se(t)
return e(ie,Se,t)
end
function dt(m,o,f,y)
o=w(o)
local r={}
local c=false
local t=o
while not d(t)do
if C(t)then
s(r,t)
c=true
t=g
elseif a(t)then
s(r,i(t))
t=n(t)
else
return y()
end
end
local a
if c then
a=x(r)
else
a=o
end
local t={}
Ze(m,function(a,e)
do
local e=0
while e<#r do
if u(r[e+1],a)then
return
end
e=e+1
end
end
s(t,a)
end)
local i=a
do
local e=#t-1
while e>=0 do
i=h(t[e+1],i)
e=e-1
end
end
local a=a
do
local e=#t-1
while e>=0 do
a=h(se(nt(m,t[e+1])),a)
e=e-1
end
end
return _(l,e(o,h(se(_(l,e(i,f))),a)))
end
function u(t,e)
if t==e then
return true
end
t=r(t)
e=r(e)
if t==e then
return true
end
local function o(e,t,o,a)
if u(o(e),o(t))and u(a(e),a(t))then
c(e,t)
return true
else
return false
end
end
if d(t)then
if not d(e)then
return false
end
c(t,g)
c(e,g)
return true
elseif v(t)then
if not v(e)then
return false
end
return U(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif j(t)then
if not j(e)then
return false
end
return o(t,e,Y,W)
elseif y(t)then
if not y(e)then
return false
end
return o(t,e,T,A)
end
return k()
end
function f(e)
e=R(e)
local t=""
local o=""
if d(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(f(i(e)))
o=" "
e=R(n(e))
end
if d(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif y(e)then
return"#"..tostring(f(h(T(e),A(e))))
elseif j(e)then
return"!"..tostring(f(h(Y(e),W(e))))
elseif v(e)then
return de(e)
elseif O(e)then
return";("..tostring(f(ue(e))).." "..tostring(f(K(e)))..")"
elseif G(e)then
return"$("..tostring(f(S(X(e)))).." "..tostring(f(ae(e)))..")"
elseif V(e)then
return"%("..tostring(f(re(e))).." "..tostring(f(x(he(e))))..")"
elseif B(e)then
return"@("..tostring(f(S(ze(e)))).." "..tostring(f(je(e))).." "..tostring(f(x(ge(e))))..")"
elseif Q(e)then
return"^("..tostring(f(ke(e))).." "..tostring(f(x(qe(e))))..")"
end
return k()
end
function Ee(e)
local t={}
local h={}
for o=1,#e do
local e=e[o]
e=R(e)
local function o(e,a,o,i)
s(t,a)
s(h,o(e))
s(h,i(e))
end
if v(e)then
s(t,"^")
s(t,D(e))
s(t,"^")
elseif a(e)then
o(e,".",i,n)
elseif d(e)then
s(t,"_")
elseif y(e)then
o(e,"#",T,A)
elseif j(e)then
o(e,"!",Y,W)
elseif be(e)then
local e=pe(e)
o(e,"$",(function(e)return S(X(e))end),ae)
else
return k()
end
end
return{
t,
h,
}
end
function st()
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
local function c()
local e=st()
function c()return e end
return e
end
function L()
local e=et()
function L()return e end
return e
end
Je=0
Qe=1
Te=2
_e=3
We=4
De=5
we=6
fe=7
ce=8
Ae=9
Z=11
ne=10
t.new_comment=le
t.comment_p=O
t.comment_comment=ue
t.comment_x=K
t.un_comment_all=xe
local function wt(e)
return L()[e]~=nil
end
local function Qe(e)
return{
Je,
e,
}
end
local function Je(e)
return c()[e]~=nil
end
local function o(e)
return Qe(c()[e])
end
t.can_new_symbol_p=Je
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=v
t.un_symbol=de
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
g={Te}
t.Null_V=Null_V
t.null_v=g
t.null_p=d
t.New_Data=New_Data
t.new_data=_
t.data_p=y
t.data_name=T
t.data_list=A
t.New_Error=New_Error
t.new_error=H
t.error_p=j
t.error_name=Y
t.error_list=W
t.just_p=P
t.evaluate=N
t.apply=M
local function c(e)
local o=Re(e)
local function i(e)
e[2]=w(e[2])
e[3]=w(e[3])
if O(e[2])or O(e[3])then
local t=ft(e)
local a=e[2]
local e=e[3]
local a=c(a)
local e=c(e)
t[2]=a
t[3]=e
return t
else
return e
end
end
if y(o)then
return i(o)
elseif j(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=w
t.force_uncomment_all_rec=c
z=o("太始初核")
local ce=o("符名")
l=o("化滅")
q=o("式形")
local pt=o("等同")
local yt=o("解算")
local L=o("特定其物")
local w=o("省略一物")
Pe=o("映表")
local vt=o("如若")
local c=o("一類何物")
local Z=o("是非")
local we=o("其子")
local De=o("爻陽")
local We=o("爻陰")
local ft=o("引用")
local mt=o("應用")
local lt=o("間空")
local ne=o("連頸")
local fe=o("構物")
local _e=o("謬誤")
local ht=o("詞素")
local Te=o("列序")
local st=o("首始")
local dt=o("尾末")
local et=o("之物")
local p=o("宇宙亡矣")
local tt=o("效應")
local ot=o("註疏")
ct=H(z,e(p,w))
local function p(e)
return _(ce,h(z,h(e,g)))
end
local function Ae(t)
return p(e(c,e(l,w,t),L))
end
local function D(a,t)
return p(e(c,e(l,e(a),w),t))
end
local function C(t)
return p(e(c,l,e(Z,e(c,t,w))))
end
local it=Ae(fe)
Le=D(fe,ce)
Ce=D(fe,Te)
He=C(fe)
local nt=Ae(_e)
Me=D(_e,ce)
Ue=D(_e,Te)
Be=C(_e)
local Ae=Ae(ne)
Ve=C(ne)
Fe=D(ne,st)
Oe=D(ne,dt)
Ie=C(ht)
Ne=C(lt)
te=p(e(c,l,e(Z,pt)))
ve=p(e(c,e(l,h(l,w),w),mt))
me=p(e(c,l,yt))
local _e=D(Te,e(c,et,w))
ee=p(e(c,l,vt))
Se=p(e(c,q,ft))
rt=p(e(c,e(q,e(l,w,l)),L))
oe=p(e(q,e(z,l)))
ie=p(e(q,e(z,q)))
ut=p(e(q,q))
local Te=p(e(c,l,ot))
at=p(e(c,q,ot))
local C=_(We,e())
local ie=_(De,e())
local function fe(e,o,h)
local t={}
while a(e)do
s(t,i(e))
e=n(e)
end
if d(e)then
return o(t)
end
return h(t,e)
end
local function D(e)
return fe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=D
t.new_list=e
local function oe(e)
while P(e)or O(e)do
e=R(xe(e))
end
return e
end
t.un_just_all=R
t.un_just_comment_all=oe
t.delay_p=be
t.delay_just_p=m
local function R(e)
return X(pe(e))
end
local function P(e)
return ae(pe(e))
end
t.delay_env=R
t.delay_x=P
local function R(e)
if O(e)then
return K(e)
else
return b(e)
end
end
t.force_all=r
t.force1=b
t.force_uncomment1=R
t.force_uncomment_all=Re
Ge={}
local function oe(o)
o=r(o)
if not y(o)then
return false
end
local e=r(T(o))
if not v(e)then
return false
end
if not U(e,Pe)then
return false
end
e=r(A(o))
if not a(e)then
return false
end
if not d(r(n(e)))then
return false
end
local o={}
local h=r(i(e))
while not d(h)do
if not a(h)then
return false
end
local e=r(i(h))
h=r(n(h))
if not a(e)then
return false
end
local h=i(e)
e=r(n(e))
if not a(e)then
return false
end
local t=i(e)
if not d(r(n(e)))then
return false
end
local a=true
do
local e=0
while e<#o do
if u(o[(e+0)+1],h)then
o[(e+1)+1]=t
a=false
break
end
e=e+2
end
end
if a then
s(o,h)
s(o,t)
end
end
return o
end
t.env_null_v=Ge
t.env_set=ye
t.env_get=Ke
t.env2val=S
t.env_foreach=Ze
t.val2env=oe
local function P(t,a)
return{
t,
1,
function(e)
e=b(e)
if m(e)then
return E(t,{e})
end
if a(e)then
return ie
end
return C
end,
}
end
local function R(t,a,o)
return{
t,
1,
function(e,i)
e=b(e)
if m(e)then
return E(t,{e})
end
if a(e)then
return o(e)
end
return i()
end,
}
end
Xe={
P(He,y),
{
it,
2,
_,
},
R(Le,y,T),
R(Ce,y,A),
P(Be,j),
{
nt,
2,
H,
},
R(Me,j,Y),
R(Ue,j,W),
P(Ne,d),
{
Ae,
2,
h,
},
P(Ve,a),
R(Fe,a,i),
R(Oe,a,n),
{
te,
2,
function(e,t,o)
if e==t then
return ie
end
e=b(e)
t=b(t)
if m(e)or m(t)then
return E(te,{
e,
t,
})
end
if e==t then
return ie
end
local function o(e,t,a)
return E(ee,{
e,
t,
a,
})
end
local function s(e,t)
return o(e,t,C)
end
I(not m(e))
local function o(e,t,a,o)
return s(E(te,{
a(e),
a(t),
}),E(te,{
o(e),
o(t),
}))
end
if d(e)then
if not d(e)then
return C
end
return ie
elseif v(e)then
if not v(t)then
return C
end
if U(e,t)then
return ie
else
return C
end
elseif y(e)then
if not y(t)then
return C
end
return o(e,t,T,A)
elseif a(e)then
if not a(t)then
return C
end
return o(e,t,i,n)
elseif j(e)then
if not j(t)then
return C
end
return o(e,t,Y,W)
end
return k()
end,
},
{
ve,
2,
function(h,e,o)
local t={}
local e=r(e)
while a(e)do
s(t,i(e))
e=r(n(e))
end
if not d(e)then
return o()
end
return M(h,t)
end,
},
{
me,
2,
function(e,a,t)
local e=oe(e)
if e==false then
return t()
end
return N(e,a)
end,
},
P(Ie,v),
{
_e,
1,
function(e,t)
e=b(e)
if m(e)then
return E(_e,{e})
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
if m(e)then
return E(ee,{
e,
a,
o,
})
end
if not y(e)then
return t()
end
local e=r(T(e))
if not v(e)then
return t()
end
if U(e,De)then
return a
end
if U(e,We)then
return o
end
return t()
end,
},
{
Te,
2,
le,
},
}
local m
m=u
t.equal_p=m
local function m(a,e)
local a={a}
local o={e}
while#a~=0 do
local t,s=unpack(Ee(a))
local i,n=unpack(Ee(o))
if#t~=#i then
return false
end
do
local e=0
while e<#t do
if t[e+1]~=i[e+1]then
return false
end
e=e+1
end
end
a=s
o=n
end
return#o==0
end
t.simple_print=f
local function te(te)
local Y,b,m,u,f,r,T,A,Q,k,S,W,C,G,U,V,P,B,D,O,R,j,y,K,X,ee
function m()
return#Y==b
end
function u()
I(not m())
local e=string.sub(Y,b+1,b+1)
b=b+1
return e
end
function f(e)
I(string.sub(Y,b,b)==e)
b=b-1
end
function r(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function T(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function A()
if m()then
return false
end
local e=u()
if not T(e)then
f(e)
return false
end
while T(e)and not m()do
e=u()
end
if not T(e)then
f(e)
end
return true
end
function Q()
if m()then
return false
end
local e=u()
local t=""
if not B(e)then
f(e)
return false
end
while B(e)and not m()do
t=tostring(t)..tostring(e)
e=u()
end
if B(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Je(t)then
return o(t)
else
return r("Not Symbol"..tostring(t))
end
end
function k()
if m()then
return false
end
local e=u()
if e~="("then
f(e)
return false
end
local t=J()
local a=t
local function o(a)
local e=J()
F(t,h(a,e))
t=e
end
while true do
A()
if m()then
return r()
end
e=u()
if e==")"then
F(t,g)
return a
end
if e=="."then
A()
local o=D()
F(t,o)
A()
if m()then
return r()
end
e=u()
if e~=")"then
return r()
end
return a
end
f(e)
local e=D()
o(e)
end
end
function S()
if m()then
return false
end
local e=u()
if e~="#"then
f(e)
return false
end
local e=k()
if e==false then
return r()
end
if not a(e)then
return r()
end
return _(i(e),n(e))
end
function W()
if m()then
return false
end
local e=u()
if e~="!"then
f(e)
return false
end
local e=k()
if e==false then
return r()
end
if not a(e)then
return r()
end
return H(i(e),n(e))
end
function B(e)
if T(e)then
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
function D()
A()
local e={
k,
ee,
S,
W,
C,
G,
U,
V,
P,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return r()
end
function O(e)
if e==false then
return r()
end
return e
end
function R()
return not m()
end
function j(e)
O(R())
O(u()==e)
end
function y(t)
if t==nil then
t=false
end
local function a()
j("[")
local e=y()
j("]")
return e
end
local e
if t then
e={
k,
Q,
a,
S,
W,
C,
G,
U,
V,
P,
}
else
e={
k,
X,
S,
W,
C,
G,
U,
V,
P,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return r()
end
function K(t)
if m()then
return t
end
local a=u()
if a=="."then
local a=y()
return e(c,e(l,e(t),w),a)
elseif a==":"then
local a=y()
return e(c,a,t)
elseif a=="~"then
return e(Z,t)
elseif a=="@"then
local a=y()
return e(c,e(l,h(t,w),w),a)
elseif a=="?"then
return e(c,l,e(Z,t))
elseif a=="/"then
local t={t}
while true do
local e=y(true)
s(t,e)
if m()then
break
end
local e=u()
if e~="/"then
f(e)
break
end
end
return e(we,x(t))
else
f(a)
return t
end
end
function X()
if m()then
return false
end
local t=u()
if t=="&"then
O(R())
local t=u()
if t=="+"then
local t=y()
return e(q,e(z,t))
else
f(t)
end
local t=y()
return e(q,t)
elseif t==":"then
O(R())
local t=u()
if t=="&"then
j(">")
local t=y()
return e(c,e(q,e(l,w,t)),L)
elseif t==">"then
local t=y()
return e(c,e(l,w,t),L)
else
f(t)
end
local t=y()
return e(c,t,L)
elseif t=="+"then
local t=y()
return e(z,t)
elseif t=="["then
local e=y()
j("]")
return K(e)
elseif t=="_"then
j(":")
local t=y()
return e(c,t,w)
else
f(t)
local e=Q()
if e==false then
return false
end
return K(e)
end
end
function ee()
local e=X()
if e==false then
return false
end
if v(e)then
return e
end
return p(e)
end
Y=te
b=0
local function e(t,o)
return function()
if m()then
return false
end
local e=u()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return r()
end
if not a(e)then
return r()
end
local t=n(e)
if not(a(t)and d(n(t)))then
return r()
end
return o(i(e),i(t))
end
end
local function s(t,s)
return function()
if m()then
return false
end
local e=u()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return r()
end
if not a(e)then
return r()
end
local t=n(e)
if not a(t)then
return r()
end
local o=n(t)
if not(a(o)and d(n(o)))then
return r()
end
return s(i(e),i(t),i(o))
end
end
C=e("$",function(e,t)
local e=oe(e)
if e==false then
return r()
end
return N(e,t)
end)
G=e("%",function(e,t)
local t=fe(t,function(e)return e end,function(e,e)return r()end)
return E(e,t)
end)
U=s("@",function(o,t,e)
local a=fe(e,function(e)return e end,function(e,e)return r()end)
local e=oe(o)
if e==false then
return r()
end
return Ye(e,t,a)
end)
V=e("^",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return r()end)
return M(t,e)
end)
P=e(";",function(e,t)return le(e,t)end)
return D()
end
t.complex_parse=te
local function b(u)
local function o(r,d)
if v(r)then
return de(r)
end
local function t(e)
if d then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and m(e[1],c)then
local s=D(e[2])
if s~=false and#s==3 and m(s[1],l)then
local h=s[2]
local r=D(h)
if r~=false and#r==1 and m(s[3],w)then
return t(tostring(o(r[1],true)).."."..tostring(o(e[3],true)))
elseif a(h)and m(n(h),w)and m(s[3],w)then
return t(tostring(o(i(h),true)).."@"..tostring(o(e[3],true)))
elseif m(h,w)and m(e[3],L)then
return t(":>"..tostring(o(s[3],true)))
end
end
local a=D(e[3])
if m(e[2],l)and a~=false and#a==2 and m(a[1],Z)then
return t(tostring(o(a[2],true)).."?")
end
if s~=false and#s==2 and m(e[3],L)and m(s[1],q)then
local e=D(s[2])
if e~=false and#e==3 and m(e[1],l)and m(e[2],w)then
return t(":&>"..tostring(o(e[3],true)))
end
end
local a=m(e[3],w)and"_"or m(e[3],L)and""or o(e[3],true)
return t(tostring(a)..":"..tostring(o(e[2],true)))
elseif e~=false and#e==2 then
if m(e[1],q)then
local a=D(e[2])
if a~=false and#a==2 and m(a[1],z)then
return t("&+"..tostring(o(a[2],true)))
end
return t("&"..tostring(o(e[2],true)))
elseif m(e[1],Z)then
return t(tostring(o(e[2],true)).."~")
elseif m(e[1],z)then
return t("+"..tostring(o(e[2],true)))
elseif m(e[1],we)then
local e=D(e[2])
if e~=false and#e>1 then
local a=o(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(o(e[t+1],true))
t=t+1
end
end
return t(a)
end
end
end
if d then
return f(r)
else
return f(p(r))
end
end
local e=te(f(u))
local s=""
local r=""
if d(e)then
return"()"
elseif a(e)then
s="("
r=""
while a(e)do
s=tostring(s)..tostring(r)..tostring(b(i(e)))
r=" "
e=n(e)
end
if d(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(b(e))..")"
end
return s
elseif y(e)then
local t=T(e)
local a=A(e)
local e=D(a)
if e~=false and#e==2 and m(t,ce)and m(e[1],z)then
return o(e[2],false)
end
return"#"..tostring(b(h(t,a)))
elseif j(e)then
return"!"..tostring(b(h(Y(e),W(e))))
elseif v(e)then
return de(e)
elseif O(e)then
return";("..tostring(b(ue(e))).." "..tostring(b(K(e)))..")"
elseif G(e)then
return"$("..tostring(b(S(X(e)))).." "..tostring(b(ae(e)))..")"
elseif V(e)then
return"%("..tostring(b(re(e))).." "..tostring(b(x(he(e))))..")"
elseif B(e)then
return"@("..tostring(b(S(ze(e)))).." "..tostring(b(je(e))).." "..tostring(b(x(ge(e))))..")"
elseif Q(e)then
return"^("..tostring(b(ke(e))).." "..tostring(b(x(qe(e))))..")"
end
return k()
end
t.complex_print=b
local function m(i)
local r=J()
local o={function(e)return F(r,e)end}
local t=0
local function a()
error("MT parse ERROR")
end
local function d(e)
if not e then
return a()
end
end
local function l()
d(#i>t)
local e=string.sub(i,t+1,t+1)
t=t+1
return e
end
local n={}
while#o~=0 do
local t={}
for e=1,#o do
local o=o[e]
local e=l()
local function i(i)
local a=J()
local e=J()
s(t,function(e)return F(a,e)end)
s(t,function(t)return F(e,t)end)
o(i(a,e))
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
if wt(e)then
o(Qe(e))
else
return a()
end
elseif e=="."then
i(h)
elseif e=="#"then
i(_)
elseif e=="!"then
i(H)
elseif e=="$"then
local e=false
local i=false
s(t,function(t)
e=t
end)
s(t,function(e)
i=e
end)
s(n,function()
if e==false or i==false then
return k()
else
local e=oe(e)
if e==false then
return a()
else
o(N(e,i))
end
end
end)
elseif e=="_"then
o(g)
else
return a()
end
end
o=t
end
d(t==#i)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return r
end
local function s(e)
local e={e}
local a=""
while#e~=0 do
local t,o=unpack(Ee(e))
for o=1,#t do
local e=t[o]
a=tostring(a)..tostring(e)
end
e=o
end
return a
end
t.machinetext_parse=m
t.machinetext_print=s
local function q(e)
return function()return{
false,
e,
}end
end
local function m(e)
return function()return{
true,
e(),
}end
end
local function k(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
t.trampoline_return=q
t.trampoline_delay=m
t.run_trampoline=k
local b=p(h(we,h(h(tt,h(h(c,h(et,h(w,g))),g)),g)))
local v=p(h(we,h(h(tt,h(ne,g)),g)))
local function x(a,t)
return _(v,e(a,t))
end
local function j(e)
return _(b,e)
end
local function w(p,c,h,f,s)
if s==nil then
s=false
end
local function g(e,e)
error("WIP")
end
h=r(h)
if y(h)then
local y=T(h)
local t=A(h)
if u(y,b)then
t=r(t)
if a(t)then
local a=i(t)
local e=r(n(t))
if d(e)then
if s==false then
local t=a
local e=f
local function a()return p(t,e)end
return m(a)
else
local e
e=p
local t
t=c
local a=a
local o=f
local function i()return w(e,t,M(s,a),o)end
return m(i)
end
end
end
elseif u(y,v)then
t=r(t)
if a(t)then
local h=i(t)
local t=r(n(t))
if a(t)then
local i=i(t)
local t=r(n(t))
if d(t)then
if s==false then
local e
e=p
local t
t=c
local a=h
local o=i
local n=f
local function i()return w(e,t,a,n,o)end
return m(i)
else
local a
a=p
local n
n=c
local d=h
local r=i
local h=f
local i=s
local t=o("序甲")
local function o()return w(a,n,d,h,_(l,e(e(t),g(e(se(r),t),se(i)))))end
return m(o)
end
end
end
end
end
end
if s==false then
return m(function()return c(h,f,p)end)
else
return m(function()return c(h,f,function(t,e)return m(function()return w(p,c,M(s,{t}),e)end)end)end)
end
end
local function s(t,e,o,a)
return w(t,e,o,a)
end
local function e(e,i,o,n)
return k(w((function(a,t)return q(e(a,t))end),(function(e,t,a)return q(i(e,t,function(e,t)return k(a(e,t))end))end),o,n))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=x
t.new_effect_return=j
t.run_monad_trampoline=s
t.run_monad_stackoverflow=e
return t
