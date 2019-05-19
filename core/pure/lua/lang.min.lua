local function u(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,S,y,re,_e,Ee,se,ve,oe,b,C,Q,P,Me,Fe,fe,H,je,Z,ke,p,ce,ue,h,a,o,n,v,r,E,f,_,T,R,q,U,F,J,nt,I,V,ie,ae,We,Y,qe,ge,pe,A,W,me,de,B,G,be,ze,M,X,s,O,K,it,z,d,x,Ce,ht,De,Oe,Ie,Ae,Se,Re,Ue,He,Le,Ye,Ne,te,xe,ye,ee,Pe,Ge,ne,he,rt,lt,L,j,e,D,we,l,i,g,Je,Ke,Te,Qe,dt,N,Be,st,c,Ve,ot,at,Ze,le,Xe,m,w,et,tt
function k()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return k()
end
end
function fe(t,e)
return{
Me,
t,
e,
}
end
function H(e)
return e[0+1]==Me
end
function je(e)
return e[1+1]
end
function Z(e)
return e[2+1]
end
function ke(e)
while H(e)do
e=Z(e)
end
return e
end
function p(e)
return e[0+1]==re
end
function ce(e)
return e[1+1]
end
function ue(e)
return y()[ce(e)]
end
function h(t,e)
return{
_e,
t,
e,
}
end
function a(e)
return e[0+1]==_e
end
function o(e)
return e[1+1]
end
function n(e)
return e[2+1]
end
function r(e)
return e[0+1]==Ee
end
function E(t,e)
return{
se,
t,
e,
}
end
function f(e)
return e[0+1]==se
end
function _(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function R(t,e)
return{
ve,
t,
e,
}
end
function q(e)
return e[0+1]==ve
end
function U(e)
return e[1+1]
end
function F(e)
return e[2+1]
end
function J(e)
return e[0+1]==oe
end
function nt(e)
return e[1+1]
end
function I(e,t)
return{
b,
e,
t,
}
end
function V(e)
return e[0+1]==b
end
function ie(e)
return e[1+1]
end
function ae(e)
return e[2+1]
end
function We(e,t,a)
return{
Q,
e,
t,
a,
}
end
function Y(e)
return e[0+1]==Q
end
function qe(e)
return e[1+1]
end
function ge(e)
return e[2+1]
end
function pe(e)
return e[3+1]
end
function A(e,t)
return{
C,
e,
t,
}
end
function W(e)
return e[0+1]==C
end
function me(e)
return e[1+1]
end
function de(e)
return e[2+1]
end
function B(e,t)
return{
P,
e,
t,
}
end
function G(e)
return e[0+1]==P
end
function be(e)
return e[1+1]
end
function ze(e)
return e[2+1]
end
function M(e)
local e=i(e)
local function t(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
return e
end
if f(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif H(e)then
return t(e)
end
return e
end
function X()
return{Fe}
end
function s(e)
return e[0+1]==Fe
end
function O(e,t)
if e==t then
return
end
e[0+1]=oe
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function K(e,t)
S(s(e))
S(not s(t))
local e=e
local t=t
e[0+1]=t[0+1]
e[1+1]=t[1+1]
e[2+1]=t[2+1]
e[3+1]=t[3+1]
end
function it(t)
local e=X()
K(e,t)
return e
end
function L(e,t)
if e==t then
return true
end
if ce(e)==ce(t)then
O(e,t)
return true
else
return false
end
end
function j(a)
local t=v
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
e=nt(e)
end
for a=1,#t do
local t=t[a]
O(t,e)
end
return e
end
function we(e)
return V(e)or Y(e)or W(e)or G(e)
end
function l(e)
return J(e)or we(e)
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
local e,r,s
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
function s(t)
r(t)
if l(t)then
u(a,e)
return i(t,n,{
false,
false,
},a)
end
return t
end
local h={}
e=o
local function o()
t[1+1]=true
return s(ht)
end
local function d()
local e={}
for t in pairs(h)do
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
u(a,e)
e=g(e)
t=t+1
end
end
while l(e)do
local r=w(e)
if n[r]==true then
return o()
end
if h[r]==true then
t[0+1]=true
if V(e)then
return o()
elseif W(e)then
local a=me(e)
local e=de(e)
local h={
De,
Oe,
Ie,
Ae,
Se,
Re,
Ue,
He,
Le,
Ye,
Ne,
}
local n=false
for e=1,#h do
local e=h[e]
if m(e,a)then
n=true
break
end
end
if n then
S(#e==1)
S(t[1+1]==false)
local e=i(e[0+1],d(),t)
if t[1+1]then
return s(A(a,{e}))
else
return k()
end
end
if m(a,te)then
return o()
elseif m(a,xe)then
return o()
elseif m(a,ye)then
return o()
elseif m(a,ee)then
S(#e==3)
S(t[1+1]==false)
local a=i(e[0+1],d(),t)
if t[1+1]then
return s(A(ee,{
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
elseif G(e)then
return o()
end
return k()
end
h[r]=true
u(a,e)
e=g(e)
end
return r(e)
end
function g(a)
local e=D(a)
local t
S(not J(e))
if V(e)then
t=st(ie(e),ae(e),a)
elseif Y(e)then
t=Ze(qe(e),ge(e),pe(e),a)
elseif W(e)then
t=at(me(e),de(e),a)
elseif G(e)then
t=ot(be(e),ze(e),a)
else
t=e
end
t=D(t)
O(e,t)
return t
end
function Je(e)
while l(e)or H(e)do
e=i(ke(e))
end
return e
end
function Te(a,o,i)
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
function Qe(t,a,o)
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
function dt(t,a)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function N(o)
local a=v
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(Ce,e(a))
end
function Be(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function st(h,t,d)
local s=g(t)
if l(s)then
return d
end
local t
t=function()return R(z,e(ne,e(ye,e(N(h),s))))end
if a(s)then
local e={}
local s=s
while not r(s)do
if l(s)then
return d
elseif a(s)then
u(e,o(s))
s=g(n(s))
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
return We(h,o,a)
elseif m(e[0+1],rt)then
if#e==1 then
return t()
end
local i=i(I(h,e[1+1]))
if not f(i)then
return t()
end
local s=g(_(i))
if l(s)then
return d
end
if not p(s)then
return t()
end
if not L(s,x)then
return t()
end
local i=g(T(i))
if l(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=g(n(i))
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
u(a,I(h,e[t+1]))
t=t+1
end
end
return A(o,a)
else
local o=I(h,e[0+1])
local a={}
do
local t=1
while t<#e do
u(a,I(h,e[t+1]))
t=t+1
end
end
return B(o,a)
end
elseif r(s)then
return s
elseif c(s)then
return Qe(h,s,t())
elseif q(s)then
return t()
end
return k()
end
function c(e)
return p(e)or f(e)
end
function ot(t,s,m)
local function u()
return R(z,e(ne,e(xe,e(t,j(s)))))
end
t=g(t)
if l(t)then
return m
end
if not f(t)then
return u()
end
local e=i(_(t))
if not(p(e)and L(e,d))then
return u()
end
local t=i(T(t))
if not a(t)then
return u()
end
local e=M(o(t))
local t=i(n(t))
if not(a(t)and r(i(n(t))))then
return u()
end
local d=o(t)
local i=Ke
local t=0
while not r(e)do
if c(e)then
local a=v
do
local e=#s-1
while e>=t do
a=h(s[e+1],a)
e=e-1
end
end
i=Te(i,e,a)
t=#s
e=v
elseif a(e)then
if t<#s then
local a=s[t+1]
t=t+1
i=Te(i,o(e),a)
e=n(e)
else
return u()
end
else
return u()
end
end
if#s~=t then
return u()
end
return I(i,d)
end
function at(i,t,o)
local a
a=function()return R(z,e(ne,e(i,j(t))))end
for e=1,#Ve do
local e=Ve[e]
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
return k()
end
end
return a()
end
function Ze(i,o,t,a)
local a
a=function()return R(z,e(he,e(N(i),o,j(t))))end
if m(o,Pe)then
if#t~=1 then
return a()
end
return t[0+1]
elseif m(o,Ge)then
if#t~=2 then
return a()
end
return Xe(i,t[0+1],t[1+1],a)
elseif m(o,lt)then
if#t~=2 then
return a()
end
return fe(t[0+1],I(i,t[1+1]))
end
return a()
end
function le(t)
return e(he,Pe,t)
end
function Xe(l,i,f,t)
if t==nil then
t=false
end
local function y()
if t==false then
return R(z,e(he,e(N(l),Ge,j({
i,
f,
}))))
else
return t()
end
end
i=M(i)
local s={}
local w=false
local t=i
while not r(t)do
if c(t)then
u(s,t)
w=true
t=v
elseif a(t)then
u(s,o(t))
t=n(t)
else
return y()
end
end
local a=i
if w then
a=j(s)
end
local t={}
Be(l,function(a,e)
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
a=h(le(dt(l,t[e+1])),a)
e=e-1
end
end
return E(d,e(i,h(le(E(d,e(o,f))),a)))
end
function m(e,t)
if e==t then
return true
end
e=i(e)
t=i(t)
if e==t then
return true
end
local function i(t,e,o,a)
if m(o(t),o(e))and m(a(t),a(e))then
O(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
O(e,v)
O(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,U,F)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,_,T)
end
return k()
end
function w(e)
e=D(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(w(o(e)))
i=" "
e=D(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(w(h(_(e),T(e))))
elseif q(e)then
return"!"..tostring(w(h(U(e),F(e))))
elseif p(e)then
return ue(e)
elseif H(e)then
return";("..tostring(w(je(e))).." "..tostring(w(Z(e)))..")"
elseif V(e)then
return"$("..tostring(w(N(ie(e)))).." "..tostring(w(ae(e)))..")"
elseif W(e)then
return"%("..tostring(w(me(e))).." "..tostring(w(j(de(e))))..")"
elseif Y(e)then
return"@("..tostring(w(N(qe(e)))).." "..tostring(w(ge(e))).." "..tostring(w(j(pe(e))))..")"
elseif G(e)then
return"^("..tostring(w(be(e))).." "..tostring(w(j(ze(e))))..")"
end
return k()
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
local e=tt()
y=function()return e end
return e
end
re=0
_e=1
Ee=2
se=3
ve=4
oe=5
b=6
C=7
Q=8
P=9
Me=11
Fe=10
t.new_comment=fe
t.comment_p=H
t.comment_comment=je
t.comment_x=Z
t.un_comment_all=ke
local function pt(e)
return y()[e]~=nil
end
local function Ze(e)
return{
re,
e,
}
end
local function et(e)
return c()[e]~=nil
end
local function s(e)
return Ze(c()[e])
end
t.can_new_symbol_p=et
t.New_Symbol=New_Symbol
t.new_symbol=s
t.symbol_p=p
t.un_symbol=ue
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=n
v={Ee}
t.Null_V=Null_V
t.null_v=v
t.null_p=r
t.New_Data=New_Data
t.new_data=E
t.data_p=f
t.data_name=_
t.data_list=T
t.New_Error=New_Error
t.new_error=R
t.error_p=q
t.error_name=U
t.error_list=F
t.just_p=J
t.evaluate=I
t.apply=B
local function c(e)
local o=Je(e)
local function i(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
if H(e[1+1])or H(e[2+1])then
local t=it(e)
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
elseif q(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=M
t.force_uncomment_all_rec=c
z=s("太始初核")
local Ee=s("符名")
d=s("化滅")
x=s("式形")
local ct=s("等同")
local ut=s("解算")
local Q=s("特定其物")
local y=s("省略一物")
Ce=s("映表")
local nt=s("如若")
local c=s("一類何物")
local oe=s("是非")
local _e=s("其子")
local at=s("爻陽")
local tt=s("爻陰")
local st=s("引用")
local dt=s("應用")
local mt=s("間空")
local se=s("連頸")
local ve=s("構物")
local re=s("謬誤")
local wt=s("詞素")
local Me=s("列序")
local ft=s("首始")
local yt=s("尾末")
local Xe=s("之物")
local b=s("宇宙亡矣")
local it=s("效應")
local ot=s("註疏")
ht=R(z,e(b,y))
local function b(e)
return E(Ee,h(z,h(e,v)))
end
local function Fe(t)
return b(e(c,e(d,y,t),Q))
end
local function C(a,t)
return b(e(c,e(d,e(a),y),t))
end
local function P(t)
return b(e(c,d,e(oe,e(c,t,y))))
end
local ht=Fe(ve)
De=C(ve,Ee)
Oe=C(ve,Me)
Ie=P(ve)
local vt=Fe(re)
Ae=C(re,Ee)
Se=C(re,Me)
Re=P(re)
local Fe=Fe(se)
Ue=P(se)
He=C(se,ft)
Le=C(se,yt)
Ye=P(wt)
Ne=P(mt)
te=b(e(c,d,e(oe,ct)))
xe=b(e(c,e(d,h(d,y),y),dt))
ye=b(e(c,d,ut))
local Me=C(Me,e(c,Xe,y))
ee=b(e(c,d,nt))
Pe=b(e(c,x,st))
Ge=b(e(c,e(x,e(d,y,d)),Q))
ne=b(e(x,e(z,d)))
he=b(e(x,e(z,x)))
rt=b(e(x,x))
local Pe=b(e(c,d,ot))
lt=b(e(c,x,ot))
local P=E(tt,e())
local re=E(at,e())
local function ve(e,s,i)
local t={}
while a(e)do
u(t,o(e))
e=n(e)
end
if r(e)then
return s(t)
end
return i(t,e)
end
local function C(e)
return ve(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=C
t.new_list=e
local function ne(e)
while J(e)or H(e)do
e=D(ke(e))
end
return e
end
t.un_just=D
t.un_just_comment_all=ne
t.delay_p=we
t.delay_just_p=l
local function ke(e)
if V(e)then
return e
elseif Y(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return k()
end
local function ne(e)
return ie(ke(e))
end
local function J(e)
return ae(ke(e))
end
t.delay_env=ne
t.delay_x=J
local function J(e)
return i(e)
end
local function ne(e)
if H(e)then
return Z(e)
else
return g(e)
end
end
t.force_all=J
t.force1=g
t.force_uncomment1=ne
t.force_uncomment_all=Je
Ke={}
local function he(s)
s=i(s)
if not f(s)then
return false
end
local e=i(_(s))
if not p(e)then
return false
end
if not L(e,Ce)then
return false
end
e=i(T(s))
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
local t=o(e)
if not r(i(n(e)))then
return false
end
local a=true
do
local e=0
while e<#s do
if m(s[(e+0)+1],h)then
s[(e+1)+1]=t
a=false
break
end
e=e+2
end
end
if a then
u(s,h)
u(s,t)
end
end
return s
end
t.env_null_v=Ke
t.env_set=Te
t.env_get=Qe
t.env2val=N
t.env_foreach=Be
t.val2env=he
local function ne(t,a)
return{
t,
1,
function(e)
e=g(e)
if l(e)then
return A(t,{e})
end
if a(e)then
return re
end
return P
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
return A(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
Ve={
ne(Ie,f),
{
ht,
2,
E,
},
J(De,f,_),
J(Oe,f,T),
ne(Re,q),
{
vt,
2,
R,
},
J(Ae,q,U),
J(Se,q,F),
ne(Ne,r),
{
Fe,
2,
h,
},
ne(Ue,a),
J(He,a,o),
J(Le,a,n),
{
te,
2,
function(e,t,i)
if e==t then
return re
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return A(te,{
e,
t,
})
end
if e==t then
return re
end
local function i(a,t,e)
return A(ee,{
a,
t,
e,
})
end
local function s(t,e)
return i(t,e,P)
end
S(not l(e))
local function i(o,e,a,t)
return s(A(te,{
a(o),
a(e),
}),A(te,{
t(o),
t(e),
}))
end
if r(e)then
if not r(e)then
return P
end
return re
elseif p(e)then
if not p(t)then
return P
end
if L(e,t)then
return re
else
return P
end
elseif f(e)then
if not f(t)then
return P
end
return i(e,t,_,T)
elseif a(e)then
if not a(t)then
return P
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return P
end
return i(e,t,U,F)
end
return k()
end,
},
{
xe,
2,
function(s,e,h)
local t={}
local e=i(e)
while a(e)do
u(t,o(e))
e=i(n(e))
end
if not r(e)then
return h()
end
return B(s,t)
end,
},
{
ye,
2,
function(e,a,t)
local e=he(e)
if e==false then
return t()
end
return I(e,a)
end,
},
ne(Ye,p),
{
Me,
1,
function(e,t)
e=g(e)
if l(e)then
return A(Me,{e})
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
function(e,a,o,t)
e=g(e)
if l(e)then
return A(ee,{
e,
a,
o,
})
end
if not f(e)then
return t()
end
local e=i(_(e))
if not p(e)then
return t()
end
if L(e,at)then
return a
end
if L(e,tt)then
return o
end
return t()
end,
},
{
Pe,
2,
fe,
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
local function i(t,e,o,a)
if l(o(t),o(e))and l(a(t),a(e))then
O(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
O(e,v)
O(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,U,F)
elseif f(e)then
if not f(t)then
return false
end
return i(e,t,_,T)
elseif V(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return k()
end
local function g(e)
return w(M(e))
end
t.simple_print=w
t.simple_print_force_all_rec=g
local function ee(ee)
local H,g,m,l,f,i,_,T,V,k,D,Y,P,F,W,M,U,L,C,O,N,q,w,J,G,Z
function m()
return#H==g
end
function l()
S(not m())
local e=string.sub(H,g+1,g+1)
g=g+1
return e
end
function f(e)
S(string.sub(H,(g-1)+1,(g-1)+1)==e)
g=g-1
end
function i(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function _(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if m()then
return false
end
local e=l()
if not _(e)then
f(e)
return false
end
while _(e)and not m()do
e=l()
end
if not _(e)then
f(e)
end
return true
end
function V()
if m()then
return false
end
local e=l()
local t=""
if not L(e)then
f(e)
return false
end
while L(e)and not m()do
t=tostring(t)..tostring(e)
e=l()
end
if L(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if et(t)then
return s(t)
else
return i("Not Symbol"..tostring(t))
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
K(t,h(a,e))
t=e
end
while true do
T()
if m()then
return i()
end
e=l()
if e==")"then
K(t,v)
return a
end
if e=="."then
T()
local o=C()
K(t,o)
T()
if m()then
return i()
end
e=l()
if e~=")"then
return i()
end
return a
end
f(e)
local e=C()
o(e)
end
end
function D()
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
return i()
end
if not a(e)then
return i()
end
return E(o(e),n(e))
end
function Y()
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
return i()
end
if not a(e)then
return i()
end
return R(o(e),n(e))
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
function C()
T()
local e={
k,
Z,
D,
Y,
P,
F,
W,
M,
U,
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
function O(e)
if e==false then
return i()
end
return e
end
function N()
return not m()
end
function q(e)
O(N())
O(l()==e)
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
V,
a,
D,
Y,
P,
F,
W,
M,
U,
}
else
e={
k,
G,
D,
Y,
P,
F,
W,
M,
U,
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
function J(t)
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
return e(oe,t)
elseif a=="@"then
local a=w()
return e(c,e(d,h(t,y),y),a)
elseif a=="?"then
return e(c,d,e(oe,t))
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
return e(_e,j(t))
else
f(a)
return t
end
end
function G()
if m()then
return false
end
local t=l()
if t=="&"then
O(N())
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
O(N())
local t=l()
if t=="&"then
q(">")
local t=w()
return e(c,e(x,e(d,y,t)),Q)
elseif t==">"then
local t=w()
return e(c,e(d,y,t),Q)
else
f(t)
end
local t=w()
return e(c,t,Q)
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
return e(c,t,y)
else
f(t)
local e=V()
if e==false then
return false
end
return J(e)
end
end
function Z()
local e=G()
if e==false then
return false
end
if p(e)then
return e
end
return b(e)
end
H=ee
g=0
local function s(t,s)
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
P=s("$",function(e,t)
local e=he(e)
if e==false then
return i()
end
return I(e,t)
end)
F=s("%",function(e,t)
local t=ve(t,function(e)return e end,function(e,e)return i()end)
return A(e,t)
end)
W=d("@",function(a,o,e)
local t=ve(e,function(e)return e end,function(e,e)return i()end)
local e=he(a)
if e==false then
return i()
end
return We(e,o,t)
end)
M=s("^",function(t,e)
local e=ve(e,function(e)return e end,function(e,e)return i()end)
return B(t,e)
end)
U=s(";",function(t,e)return fe(t,e)end)
return C()
end
t.complex_parse=ee
local function g(m)
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
local s=C(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=C(h)
if r~=false and#r==1 and l(s[2+1],y)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(n(h),y)and l(s[2+1],y)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,y)and l(e[2+1],Q)then
return t(":>"..tostring(i(s[2+1],true)))
end
end
local a=C(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],oe)then
return t(tostring(i(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],Q)and l(s[0+1],x)then
local e=C(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],y)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],y)and"_"or l(e[2+1],Q)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=C(e[1+1])
if a~=false and#a==2 and l(a[0+1],z)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],oe)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],z)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],_e)then
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
return w(h)
else
return w(b(h))
end
end
local e=ee(w(m))
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
e=n(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(g(e))..")"
end
return s
elseif f(e)then
local a=_(e)
local t=T(e)
local e=C(t)
if e~=false and#e==2 and l(a,Ee)and l(e[0+1],z)then
return i(e[1+1],false)
end
return"#"..tostring(g(h(a,t)))
elseif q(e)then
return"!"..tostring(g(h(U(e),F(e))))
elseif p(e)then
return ue(e)
elseif H(e)then
return";("..tostring(g(je(e))).." "..tostring(g(Z(e)))..")"
elseif V(e)then
return"$("..tostring(g(N(ie(e)))).." "..tostring(g(ae(e)))..")"
elseif W(e)then
return"%("..tostring(g(me(e))).." "..tostring(g(j(de(e))))..")"
elseif Y(e)then
return"@("..tostring(g(N(qe(e)))).." "..tostring(g(ge(e))).." "..tostring(g(j(pe(e))))..")"
elseif G(e)then
return"^("..tostring(g(be(e))).." "..tostring(g(j(ze(e))))..")"
end
return k()
end
t.complex_print=g
local function w(s)
local d=X()
local i={function(e)return K(d,e)end}
local t=0
local function n()
error("MT parse ERROR")
end
local function l(e)
if not e then
return n()
end
end
local function c()
l(#s>t)
local e=string.sub(s,t+1,t+1)
t=t+1
return e
end
local r={}
while#i~=0 do
local t={}
for e=1,#i do
local o=i[e]
local e=c()
local a
a=function(i)
local e=X()
local a=X()
u(t,function(t)return K(e,t)end)
u(t,function(e)return K(a,e)end)
o(i(e,a))
end
if e=="^"then
local e=""
while true do
local t=c()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if pt(e)then
o(Ze(e))
else
return n()
end
elseif e=="."then
a(h)
elseif e=="#"then
a(E)
elseif e=="!"then
a(R)
elseif e=="$"then
local a=false
local e=false
u(t,function(e)
a=e
end)
u(t,function(t)
e=t
end)
u(r,function()
if a==false or e==false then
return k()
else
local t=he(a)
if t==false then
return n()
else
o(I(t,e))
end
end
end)
elseif e=="_"then
o(v)
else
return n()
end
end
i=t
end
l(t==#s)
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
local s={e}
local i=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=D(e)
local t
t=function(e,t,a,o)
i=tostring(i)..tostring(t)
u(h,a(e))
u(h,o(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ce(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif r(e)then
i=tostring(i).."_"
elseif f(e)then
t(e,"#",_,T)
elseif q(e)then
t(e,"!",U,F)
elseif we(e)then
local e=ke(e)
t(e,"$",(function(e)return N(ie(e))end),ae)
else
return k()
end
end
s=h
end
return i
end
t.machinetext_parse=w
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
local q=b(h(_e,h(h(it,h(h(c,h(Xe,h(y,v))),v)),v)))
local v=b(h(_e,h(h(it,h(se,v)),v)))
local function j(a,t)
return E(v,e(a,t))
end
local function b(e)
return E(q,e)
end
local function c(w,p,u,y,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=i(u)
if f(u)then
local f=_(u)
local t=T(u)
if m(f,q)then
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
e=function()return c(a,t,B(h,i),o)end
return l(e)
end
end
end
elseif m(f,v)then
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
local e
e=p
local n=u
local i=o
local o=y
local t
t=function()return c(a,e,n,o,i)end
return l(t)
else
local i
i=w
local t
t=p
local n=u
local u=o
local r=y
local h=h
local o=s("序甲")
local a
a=function()return c(i,t,n,r,E(d,e(e(o),b(e(le(u),o),le(h)))))end
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
return l(function()return p(u,y,function(e,t)return l(function()return c(w,p,B(h,{e}),t)end)end)end)
end
end
local function s(o,t,e,a)
return c(o,t,e,a)
end
local function e(n,i,o,a)
return k(c((function(t,e)return g(n(t,e))end),(function(e,t,a)return g(i(e,t,function(t,e)return k(a(t,e))end))end),o,a))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=q
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=b
t.run_monad_trampoline=s
t.run_monad_stackoverflow=e
return t