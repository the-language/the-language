local function u(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local g,H,y,Y,ee,U,W,se,ze,xe,Te,je,Oe,Ae,b,re,I,ke,oe,fe,v,ue,le,h,a,o,i,p,r,E,w,_,A,N,k,F,L,J,Xe,R,K,ae,te,Re,G,ge,pe,ye,T,Q,ce,de,B,V,we,be,M,X,n,O,P,ht,x,d,z,De,rt,Ie,Ne,Se,He,Le,Me,Ge,Ve,Be,Qe,Je,Z,qe,ve,ie,Fe,Ye,ne,he,lt,dt,C,j,e,D,_e,l,s,q,Ke,Pe,Ee,Ce,at,S,We,it,c,Ue,nt,tt,ot,me,Ze,m,f,et,st
function g()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return g()
end
end
function re(e,t)
return{
Ae,
e,
t,
}
end
function I(e)
return e[0+1]==Ae
end
function ke(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function fe(e)
while I(e)do
e=oe(e)
end
return e
end
function v(e)
return e[0+1]==Y
end
function ue(e)
return e[1+1]
end
function le(e)
return y()[ue(e)]
end
function h(t,e)
return{
ee,
t,
e,
}
end
function a(e)
return e[0+1]==ee
end
function o(e)
return e[1+1]
end
function i(e)
return e[2+1]
end
function r(e)
return e[0+1]==U
end
function E(e,t)
return{
W,
e,
t,
}
end
function w(e)
return e[0+1]==W
end
function _(e)
return e[1+1]
end
function A(e)
return e[2+1]
end
function N(t,e)
return{
se,
t,
e,
}
end
function k(e)
return e[0+1]==se
end
function F(e)
return e[1+1]
end
function L(e)
return e[2+1]
end
function J(e)
return e[0+1]==ze
end
function Xe(e)
return e[1+1]
end
function R(e,t)
return{
xe,
e,
t,
}
end
function K(e)
return e[0+1]==xe
end
function ae(e)
return e[1+1]
end
function te(e)
return e[2+1]
end
function Re(t,e,a)
return{
je,
t,
e,
a,
}
end
function G(e)
return e[0+1]==je
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
function T(t,e)
return{
Te,
t,
e,
}
end
function Q(e)
return e[0+1]==Te
end
function ce(e)
return e[1+1]
end
function de(e)
return e[2+1]
end
function B(e,t)
return{
Oe,
e,
t,
}
end
function V(e)
return e[0+1]==Oe
end
function we(e)
return e[1+1]
end
function be(e)
return e[2+1]
end
function M(e)
local e=s(e)
local function t(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
return e
end
if w(e)then
return t(e)
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif I(e)then
return t(e)
end
return e
end
function X()
return{b}
end
function n(e)
return e[0+1]==b
end
function O(e,t)
if e==t then
return
end
e[0+1]=ze
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function P(e,a)
H(n(e))
H(not n(a))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function ht(t)
local e=X()
P(e,t)
return e
end
function C(e,t)
if e==t then
return true
end
if ue(e)==ue(t)then
O(e,t)
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
function D(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
u(t,e)
e=Xe(e)
end
for a=1,#t do
local t=t[a]
O(t,e)
end
return e
end
function _e(e)
return K(e)or G(e)or Q(e)or V(e)
end
function l(e)
return J(e)or _e(e)
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
O(e,t)
do
local e=0
while e<#a do
O(a[e+1],t)
e=e+1
end
end
return t
end
function n(t)
r(t)
if l(t)then
u(a,e)
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
return n(rt)
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
u(a,e)
e=q(e)
t=t+1
end
end
while l(e)do
local h=f(e)
if i[h]==true then
return o()
end
if d[h]==true then
t[0+1]=true
if K(e)then
return o()
elseif Q(e)then
local a=ce(e)
local e=de(e)
local h={
Ie,
Ne,
Se,
He,
Le,
Me,
Ge,
Ve,
Be,
Qe,
Je,
}
local i=false
for e=1,#h do
local e=h[e]
if m(e,a)then
i=true
break
end
end
if i then
H(#e==1)
H(t[1+1]==false)
local e=s(e[0+1],c(),t)
if t[1+1]then
return n(T(a,{e}))
else
return g()
end
end
if m(a,Z)then
return o()
elseif m(a,qe)then
return o()
elseif m(a,ve)then
return o()
elseif m(a,ie)then
H(#e==3)
H(t[1+1]==false)
local a=s(e[0+1],c(),t)
if t[1+1]then
return n(T(ie,{
a,
e[1+1],
e[2+1],
}))
else
return g()
end
end
return g()
elseif G(e)then
return o()
elseif V(e)then
return o()
end
return g()
end
d[h]=true
u(a,e)
e=q(e)
end
return r(e)
end
function q(a)
local e=D(a)
local t
H(not J(e))
if K(e)then
t=it(ae(e),te(e),a)
elseif G(e)then
t=ot(ge(e),pe(e),ye(e),a)
elseif Q(e)then
t=tt(ce(e),de(e),a)
elseif V(e)then
t=nt(we(e),be(e),a)
else
t=e
end
t=D(t)
O(e,t)
return t
end
function Ke(e)
while l(e)or I(e)do
e=s(fe(e))
end
return e
end
function Ee(a,o,i)
local t={}
do
local e=0
while e<#a do
if m(a[(e+0)+1],o)then
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
function Ce(t,a,o)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function at(t,a)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return g()
end
function S(o)
local a=p
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(De,e(a))
end
function We(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function it(h,t,d)
local n=q(t)
if l(n)then
return d
end
local t
t=function()return N(x,e(ne,e(ve,e(S(h),n))))end
if a(n)then
local e={}
local n=n
while not r(n)do
if l(n)then
return d
elseif a(n)then
u(e,o(n))
n=q(i(n))
else
return t()
end
end
if m(e[0+1],he)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
u(a,e[t+1])
t=t+1
end
end
return Re(h,o,a)
elseif m(e[0+1],lt)then
if#e==1 then
return t()
end
local s=s(R(h,e[1+1]))
if not w(s)then
return t()
end
local n=q(_(s))
if l(n)then
return d
end
if not v(n)then
return t()
end
if not C(n,z)then
return t()
end
local n=q(A(s))
if l(n)then
return d
end
if not a(n)then
return t()
end
local o=o(n)
local a=q(i(n))
if l(a)then
return d
end
if not r(a)then
return t()
end
local a={S(h)}
do
local t=2
while t<#e do
u(a,e[t+1])
t=t+1
end
end
return B(o,a)
elseif m(e[0+1],ne)then
if#e==1 then
return t()
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
u(a,R(h,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=R(h,e[0+1])
local a={}
do
local t=1
while t<#e do
u(a,R(h,e[t+1]))
t=t+1
end
end
return B(o,a)
end
elseif r(n)then
return n
elseif c(n)then
return Ce(h,n,t())
elseif k(n)then
return t()
end
return g()
end
function c(e)
return v(e)or w(e)
end
function nt(t,u,m)
local function n()
return N(x,e(ne,e(qe,e(t,j(u)))))
end
t=q(t)
if l(t)then
return m
end
if not w(t)then
return n()
end
local e=s(_(t))
if not(v(e)and C(e,d))then
return n()
end
local t=s(A(t))
if not a(t)then
return n()
end
local e=M(o(t))
local t=s(i(t))
if not(a(t)and r(s(i(t))))then
return n()
end
local d=o(t)
local s=Pe
local t=0
while not r(e)do
if c(e)then
local a=p
do
local e=#u-1
while e>=t do
a=h(u[e+1],a)
e=e-1
end
end
s=Ee(s,e,a)
t=#u
e=p
elseif a(e)then
if t<#u then
local a=u[t+1]
t=t+1
s=Ee(s,o(e),a)
e=i(e)
else
return n()
end
else
return n()
end
end
if#u~=t then
return n()
end
return R(s,d)
end
function tt(i,t,o)
local a
a=function()return N(x,e(ne,e(i,j(t))))end
for e=1,#Ue do
local e=Ue[e]
if m(i,e[0+1])then
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
function ot(i,o,t,a)
local a
a=function()return N(x,e(he,e(S(i),o,j(t))))end
if m(o,Fe)then
if#t~=1 then
return a()
end
return t[0+1]
elseif m(o,Ye)then
if#t~=2 then
return a()
end
return Ze(i,t[0+1],t[1+1],a)
elseif m(o,dt)then
if#t~=2 then
return a()
end
return re(t[0+1],R(i,t[1+1]))
end
return a()
end
function me(t)
return e(he,Fe,t)
end
function Ze(l,n,w,t)
if t==nil then
t=false
end
local function y()
if t==false then
return N(x,e(he,e(S(l),Ye,j({
n,
w,
}))))
else
return t()
end
end
n=M(n)
local s={}
local f=false
local t=n
while not r(t)do
if c(t)then
u(s,t)
f=true
t=p
elseif a(t)then
u(s,o(t))
t=i(t)
else
return y()
end
end
local a=n
if f then
a=j(s)
end
local t={}
We(l,function(a,e)
do
local e=0
while e<#s do
if m(s[e+1],a)then
return
end
e=e+1
end
end
u(t,a)
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
a=h(me(at(l,t[e+1])),a)
e=e-1
end
end
return E(d,e(n,h(me(E(d,e(o,w))),a)))
end
function m(t,e)
if t==e then
return true
end
t=s(t)
e=s(e)
if t==e then
return true
end
local function n(t,e,a,o)
if m(a(t),a(e))and m(o(t),o(e))then
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
O(t,p)
O(e,p)
return true
elseif v(t)then
if not v(e)then
return false
end
return C(t,e)
elseif a(t)then
if not a(e)then
return false
end
return n(t,e,o,i)
elseif k(t)then
if not k(e)then
return false
end
return n(t,e,F,L)
elseif w(t)then
if not w(e)then
return false
end
return n(t,e,_,A)
end
return g()
end
function f(e)
e=D(e)
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
e=D(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif w(e)then
return"#"..tostring(f(h(_(e),A(e))))
elseif k(e)then
return"!"..tostring(f(h(F(e),L(e))))
elseif v(e)then
return le(e)
elseif I(e)then
return";("..tostring(f(ke(e))).." "..tostring(f(oe(e)))..")"
elseif K(e)then
return"$("..tostring(f(S(ae(e)))).." "..tostring(f(te(e)))..")"
elseif Q(e)then
return"%("..tostring(f(ce(e))).." "..tostring(f(j(de(e))))..")"
elseif G(e)then
return"@("..tostring(f(S(ge(e)))).." "..tostring(f(pe(e))).." "..tostring(f(j(ye(e))))..")"
elseif V(e)then
return"^("..tostring(f(we(e))).." "..tostring(f(j(be(e))))..")"
end
return g()
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
local e=et()
c=function()return e end
return e
end
y=function()
local e=st()
y=function()return e end
return e
end
Y=0
ee=1
U=2
W=3
se=4
ze=5
xe=6
Te=7
je=8
Oe=9
Ae=11
b=10
t.new_comment=re
t.comment_p=I
t.comment_comment=ke
t.comment_x=oe
t.un_comment_all=fe
local function nt(e)
return y()[e]~=nil
end
local function Ze(e)
return{
Y,
e,
}
end
local function Xe(e)
return c()[e]~=nil
end
local function n(e)
return Ze(c()[e])
end
t.can_new_symbol_p=Xe
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=v
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={U}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=E
t.data_p=w
t.data_name=_
t.data_list=A
t.New_Error=New_Error
t.new_error=N
t.error_p=k
t.error_name=F
t.error_list=L
t.just_p=J
t.evaluate=R
t.apply=B
local function c(e)
local o=Ke(e)
local function i(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
if I(e[1+1])or I(e[2+1])then
local t=ht(e)
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
if w(o)then
return i(o)
elseif k(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=M
t.force_uncomment_all_rec=c
x=n("太始初核")
local je=n("符名")
d=n("化滅")
z=n("式形")
local bt=n("等同")
local vt=n("解算")
local W=n("特定其物")
local y=n("省略一物")
De=n("映表")
local yt=n("如若")
local c=n("一類何物")
local ee=n("是非")
local Te=n("其子")
local et=n("爻陽")
local tt=n("爻陰")
local pt=n("引用")
local wt=n("應用")
local ft=n("間空")
local se=n("連頸")
local ze=n("構物")
local xe=n("謬誤")
local ut=n("詞素")
local Oe=n("列序")
local st=n("首始")
local mt=n("尾末")
local it=n("之物")
local b=n("宇宙亡矣")
local at=n("效應")
local ot=n("註疏")
rt=N(x,e(b,y))
local function b(e)
return E(je,h(x,h(e,p)))
end
local function Ae(t)
return b(e(c,e(d,y,t),W))
end
local function U(a,t)
return b(e(c,e(d,e(a),y),t))
end
local function Y(t)
return b(e(c,d,e(ee,e(c,t,y))))
end
local ct=Ae(ze)
Ie=U(ze,je)
Ne=U(ze,Oe)
Se=Y(ze)
local rt=Ae(xe)
He=U(xe,je)
Le=U(xe,Oe)
Me=Y(xe)
local ht=Ae(se)
Ge=Y(se)
Ve=U(se,st)
Be=U(se,mt)
Qe=Y(ut)
Je=Y(ft)
Z=b(e(c,d,e(ee,bt)))
qe=b(e(c,e(d,h(d,y),y),wt))
ve=b(e(c,d,vt))
local Ae=U(Oe,e(c,it,y))
ie=b(e(c,d,yt))
Fe=b(e(c,z,pt))
Ye=b(e(c,e(z,e(d,y,d)),W))
ne=b(e(z,e(x,d)))
he=b(e(z,e(x,z)))
lt=b(e(z,z))
local Oe=b(e(c,d,ot))
dt=b(e(c,z,ot))
local Y=E(tt,e())
local ne=E(et,e())
local function xe(e,s,n)
local t={}
while a(e)do
u(t,o(e))
e=i(e)
end
if r(e)then
return s(t)
end
return n(t,e)
end
local function U(e)
return xe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=U
t.new_list=e
local function he(e)
while J(e)or I(e)do
e=D(fe(e))
end
return e
end
t.un_just=D
t.un_just_comment_all=he
t.delay_p=_e
t.delay_just_p=l
local function ze(e)
if K(e)then
return e
elseif G(e)then
error("WIP")
elseif Q(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return g()
end
local function J(e)
return ae(ze(e))
end
local function he(e)
return te(ze(e))
end
t.delay_env=J
t.delay_x=he
local function J(e)
return s(e)
end
local function he(e)
if I(e)then
return oe(e)
else
return q(e)
end
end
t.force_all=J
t.force1=q
t.force_uncomment1=he
t.force_uncomment_all=Ke
Pe={}
local function fe(n)
n=s(n)
if not w(n)then
return false
end
local e=s(_(n))
if not v(e)then
return false
end
if not C(e,De)then
return false
end
e=s(A(n))
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
if m(n[(e+0)+1],h)then
n[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
u(n,h)
u(n,a)
end
end
return n
end
t.env_null_v=Pe
t.env_set=Ee
t.env_get=Ce
t.env2val=S
t.env_foreach=We
t.val2env=fe
local function he(t,a)
return{
t,
1,
function(e)
e=q(e)
if l(e)then
return T(t,{e})
end
if a(e)then
return ne
end
return Y
end,
}
end
local function J(t,o,a)
return{
t,
1,
function(e,i)
e=q(e)
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
Ue={
he(Se,w),
{
ct,
2,
E,
},
J(Ie,w,_),
J(Ne,w,A),
he(Me,k),
{
rt,
2,
N,
},
J(He,k,F),
J(Le,k,L),
he(Je,r),
{
ht,
2,
h,
},
he(Ge,a),
J(Ve,a,o),
J(Be,a,i),
{
Z,
2,
function(e,t,n)
if e==t then
return ne
end
e=q(e)
t=q(t)
if l(e)or l(t)then
return T(Z,{
e,
t,
})
end
if e==t then
return ne
end
local function n(t,a,e)
return T(ie,{
t,
a,
e,
})
end
local function s(e,t)
return n(e,t,Y)
end
H(not l(e))
local function n(e,t,a,o)
return s(T(Z,{
a(e),
a(t),
}),T(Z,{
o(e),
o(t),
}))
end
if r(e)then
if not r(e)then
return Y
end
return ne
elseif v(e)then
if not v(t)then
return Y
end
if C(e,t)then
return ne
else
return Y
end
elseif w(e)then
if not w(t)then
return Y
end
return n(e,t,_,A)
elseif a(e)then
if not a(t)then
return Y
end
return n(e,t,o,i)
elseif k(e)then
if not k(t)then
return Y
end
return n(e,t,F,L)
end
return g()
end,
},
{
qe,
2,
function(h,e,n)
local t={}
local e=s(e)
while a(e)do
u(t,o(e))
e=s(i(e))
end
if not r(e)then
return n()
end
return B(h,t)
end,
},
{
ve,
2,
function(e,a,t)
local e=fe(e)
if e==false then
return t()
end
return R(e,a)
end,
},
he(Qe,v),
{
Ae,
1,
function(e,t)
e=q(e)
if l(e)then
return T(Ae,{e})
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
function(e,a,o,t)
e=q(e)
if l(e)then
return T(ie,{
e,
a,
o,
})
end
if not w(e)then
return t()
end
local e=s(_(e))
if not v(e)then
return t()
end
if C(e,et)then
return a
end
if C(e,tt)then
return o
end
return t()
end,
},
{
Oe,
2,
re,
},
}
t.equal_p=m
local function l(e,t)
if e==t then
return true
end
e=D(e)
t=D(t)
if e==t then
return true
end
local function n(e,t,o,a)
if l(o(e),o(t))and l(a(e),a(t))then
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
O(e,p)
O(t,p)
return true
elseif v(e)then
if not v(t)then
return false
end
return C(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif k(e)then
if not k(t)then
return false
end
return n(e,t,F,L)
elseif w(e)then
if not w(t)then
return false
end
return n(e,t,_,A)
elseif K(e)then
error("WIP")
elseif Q(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return g()
end
local function q(e)
return f(M(e))
end
t.simple_print=f
t.simple_print_force_all_rec=q
local function ie(te)
local Y,g,m,l,f,s,A,O,J,k,V,G,F,I,S,D,C,M,U,_,L,q,w,K,Q,Z
function m()
return#Y==g
end
function l()
H(not m())
local e=string.sub(Y,g+1,g+1)
g=g+1
return e
end
function f(e)
H(string.sub(Y,(g-1)+1,(g-1)+1)==e)
g=g-1
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
function O()
if m()then
return false
end
local e=l()
if not A(e)then
f(e)
return false
end
while A(e)and not m()do
e=l()
end
if not A(e)then
f(e)
end
return true
end
function J()
if m()then
return false
end
local e=l()
local t=""
if not M(e)then
f(e)
return false
end
while M(e)and not m()do
t=tostring(t)..tostring(e)
e=l()
end
if M(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Xe(t)then
return n(t)
else
return s("Not Symbol"..tostring(t))
end
end
function k()
if m()then
return false
end
local e=l()
if e~="("then
f(e)
return false
end
local t=X()
local a=t
local function o(a)
local e=X()
P(t,h(a,e))
t=e
end
while true do
O()
if m()then
return s()
end
e=l()
if e==")"then
P(t,p)
return a
end
if e=="."then
O()
local o=U()
P(t,o)
O()
if m()then
return s()
end
e=l()
if e~=")"then
return s()
end
return a
end
f(e)
local e=U()
o(e)
end
end
function V()
if m()then
return false
end
local e=l()
if e~="#"then
f(e)
return false
end
local e=k()
if e==false then
return s()
end
if not a(e)then
return s()
end
return E(o(e),i(e))
end
function G()
if m()then
return false
end
local e=l()
if e~="!"then
f(e)
return false
end
local e=k()
if e==false then
return s()
end
if not a(e)then
return s()
end
return N(o(e),i(e))
end
function M(e)
if A(e)then
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
function U()
O()
local e={
k,
Z,
V,
G,
F,
I,
S,
D,
C,
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
function _(e)
if e==false then
return s()
end
return e
end
function L()
return not m()
end
function q(e)
_(L())
_(l()==e)
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
k,
J,
a,
V,
G,
F,
I,
S,
D,
C,
}
else
e={
k,
Q,
V,
G,
F,
I,
S,
D,
C,
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
function K(t)
if m()then
return t
end
local a=l()
if a=="."then
local a=w()
return e(c,e(d,e(t),y),a)
elseif a==":"then
local a=w()
return e(c,a,t)
elseif a=="~"then
return e(ee,t)
elseif a=="@"then
local a=w()
return e(c,e(d,h(t,y),y),a)
elseif a=="?"then
return e(c,d,e(ee,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
u(t,e)
if m()then
break
end
local e=l()
if e~="/"then
f(e)
break
end
end
return e(Te,j(t))
else
f(a)
return t
end
end
function Q()
if m()then
return false
end
local t=l()
if t=="&"then
_(L())
local t=l()
if t=="+"then
local t=w()
return e(z,e(x,t))
else
f(t)
end
local t=w()
return e(z,t)
elseif t==":"then
_(L())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(c,e(z,e(d,y,t)),W)
elseif t==">"then
local t=w()
return e(c,e(d,y,t),W)
else
f(t)
end
local t=w()
return e(c,t,W)
elseif t=="+"then
local t=w()
return e(x,t)
elseif t=="["then
local e=w()
q("]")
return K(e)
elseif t=="_"then
q(":")
local t=w()
return e(c,t,y)
else
f(t)
local e=J()
if e==false then
return false
end
return K(e)
end
end
function Z()
local e=Q()
if e==false then
return false
end
if v(e)then
return e
end
return b(e)
end
Y=te
g=0
local function n(t,n)
return function()
if m()then
return false
end
local e=l()
if e~=t then
f(e)
return false
end
local e=k()
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
if m()then
return false
end
local e=l()
if e~=t then
f(e)
return false
end
local e=k()
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
F=n("$",function(e,t)
local e=fe(e)
if e==false then
return s()
end
return R(e,t)
end)
I=n("%",function(e,t)
local t=xe(t,function(e)return e end,function(e,e)return s()end)
return T(e,t)
end)
S=d("@",function(a,t,e)
local o=xe(e,function(e)return e end,function(e,e)return s()end)
local e=fe(a)
if e==false then
return s()
end
return Re(e,t,o)
end)
D=n("^",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return s()end)
return B(t,e)
end)
C=n(";",function(e,t)return re(e,t)end)
return U()
end
t.complex_parse=ie
local function q(m)
local function n(h,u)
if v(h)then
return le(h)
end
local function t(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(h)
if e~=false and#e==3 and l(e[0+1],c)then
local s=U(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=U(h)
if r~=false and#r==1 and l(s[2+1],y)then
return t(tostring(n(r[0+1],true)).."."..tostring(n(e[2+1],true)))
elseif a(h)and l(i(h),y)and l(s[2+1],y)then
return t(tostring(n(o(h),true)).."@"..tostring(n(e[2+1],true)))
elseif l(h,y)and l(e[2+1],W)then
return t(":>"..tostring(n(s[2+1],true)))
end
end
local a=U(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ee)then
return t(tostring(n(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],W)and l(s[0+1],z)then
local e=U(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],y)then
return t(":&>"..tostring(n(e[2+1],true)))
end
end
local a=l(e[2+1],y)and"_"or l(e[2+1],W)and""or n(e[2+1],true)
return t(tostring(a)..":"..tostring(n(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],z)then
local a=U(e[1+1])
if a~=false and#a==2 and l(a[0+1],x)then
return t("&+"..tostring(n(a[1+1],true)))
end
return t("&"..tostring(n(e[1+1],true)))
elseif l(e[0+1],ee)then
return t(tostring(n(e[1+1],true)).."~")
elseif l(e[0+1],x)then
return t("+"..tostring(n(e[1+1],true)))
elseif l(e[0+1],Te)then
local e=U(e[1+1])
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
return f(h)
else
return f(b(h))
end
end
local e=ie(f(m))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(q(o(e)))
d=" "
e=i(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(q(e))..")"
end
return s
elseif w(e)then
local a=_(e)
local t=A(e)
local e=U(t)
if e~=false and#e==2 and l(a,je)and l(e[0+1],x)then
return n(e[1+1],false)
end
return"#"..tostring(q(h(a,t)))
elseif k(e)then
return"!"..tostring(q(h(F(e),L(e))))
elseif v(e)then
return le(e)
elseif I(e)then
return";("..tostring(q(ke(e))).." "..tostring(q(oe(e)))..")"
elseif K(e)then
return"$("..tostring(q(S(ae(e)))).." "..tostring(q(te(e)))..")"
elseif Q(e)then
return"%("..tostring(q(ce(e))).." "..tostring(q(j(de(e))))..")"
elseif G(e)then
return"@("..tostring(q(S(ge(e)))).." "..tostring(q(pe(e))).." "..tostring(q(j(ye(e))))..")"
elseif V(e)then
return"^("..tostring(q(we(e))).." "..tostring(q(j(be(e))))..")"
end
return g()
end
t.complex_print=q
local function f(n)
local r=X()
local o={function(e)return P(r,e)end}
local e=0
local function i()
error("MT parse ERROR")
end
local function l(e)
if not e then
return i()
end
end
local function d()
l(#n>e)
local t=string.sub(n,e+1,e+1)
e=e+1
return t
end
local s={}
while#o~=0 do
local t={}
for e=1,#o do
local a=o[e]
local e=d()
local o
o=function(i)
local o=X()
local e=X()
u(t,function(e)return P(o,e)end)
u(t,function(t)return P(e,t)end)
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
a(Ze(e))
else
return i()
end
elseif e=="."then
o(h)
elseif e=="#"then
o(E)
elseif e=="!"then
o(N)
elseif e=="$"then
local o=false
local e=false
u(t,function(e)
o=e
end)
u(t,function(t)
e=t
end)
u(s,function()
if o==false or e==false then
return g()
else
local t=fe(o)
if t==false then
return i()
else
a(R(t,e))
end
end
end)
elseif e=="_"then
a(p)
else
return i()
end
end
o=t
end
l(e==#n)
for e=1,#s do
local e=s[e]
e()
end
return r
end
local function l(e)
local s={e}
local n=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=D(e)
local t
t=function(e,o,a,t)
n=tostring(n)..tostring(o)
u(h,a(e))
u(h,t(e))
end
if v(e)then
n=tostring(n).."^"
n=tostring(n)..tostring(ue(e))
n=tostring(n).."^"
elseif a(e)then
t(e,".",o,i)
elseif r(e)then
n=tostring(n).."_"
elseif w(e)then
t(e,"#",_,A)
elseif k(e)then
t(e,"!",F,L)
elseif _e(e)then
local e=ze(e)
t(e,"$",(function(e)return S(ae(e))end),te)
else
return g()
end
end
s=h
end
return n
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
local function v(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=k
t.trampoline_delay=l
t.run_trampoline=v
local g=b(h(Te,h(h(at,h(h(c,h(it,h(y,p))),p)),p)))
local b=b(h(Te,h(h(at,h(se,p)),p)))
local function j(a,t)
return E(b,e(a,t))
end
local function q(e)
return E(g,e)
end
local function c(p,y,u,f,h)
if h==nil then
h=false
end
local function v(e,e)
error("WIP")
end
u=s(u)
if w(u)then
local w=_(u)
local t=A(u)
if m(w,g)then
t=s(t)
if a(t)then
local e=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local t=e
local a=f
local e
e=function()return p(t,a)end
return l(e)
else
local a
a=p
local t
t=y
local o=e
local i=f
local e
e=function()return c(a,t,B(h,o),i)end
return l(e)
end
end
end
elseif m(w,b)then
t=s(t)
if a(t)then
local u=o(t)
local t=s(i(t))
if a(t)then
local o=o(t)
local t=s(i(t))
if r(t)then
if h==false then
local t
t=p
local a
a=y
local n=u
local i=o
local o=f
local e
e=function()return c(t,a,n,o,i)end
return l(e)
else
local a
a=p
local i
i=y
local s=u
local r=o
local u=f
local h=h
local o=n("序甲")
local t
t=function()return c(a,i,s,u,E(d,e(e(o),v(e(me(r),o),me(h)))))end
return l(t)
end
end
end
end
end
end
if h==false then
return l(function()return y(u,f,p)end)
else
return l(function()return y(u,f,function(e,t)return l(function()return c(p,y,B(h,{e}),t)end)end)end)
end
end
local function n(o,a,t,e)
return c(o,a,t,e)
end
local function a(e,o,a,i)
return v(c((function(a,t)return k(e(a,t))end),(function(a,t,e)return k(o(a,t,function(a,t)return v(e(a,t))end))end),a,i))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=b
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=n
t.run_monad_stackoverflow=a
return t