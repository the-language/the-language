local function s(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local q,H,b,we,ye,de,F,te,W,he,ke,Je,Qe,Te,Ae,ue,O,ce,J,me,v,re,le,h,a,o,i,p,r,_,f,E,T,D,g,C,M,X,ct,S,G,ee,Z,Ke,V,je,qe,xe,A,P,ie,se,K,Y,Ee,_e,m,Q,U,I,B,Ze,z,l,j,Ue,et,Le,Me,We,Fe,De,Ce,Re,Oe,Ne,Ie,Se,ae,ve,be,oe,He,Xe,ne,ze,tt,st,L,x,e,N,pe,u,n,k,d,Ye,Ve,ge,Pe,lt,R,Be,ut,rt,y,Ge,dt,ht,ot,fe,at,c,w,it,nt
function q()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return q()
end
end
function ue(t,e)
return{
Te,
t,
e,
}
end
function O(e)
return e[1]==Te
end
function ce(e)
return e[2]
end
function J(e)
return e[3]
end
function me(e)
while O(e)do
e=J(e)
end
return e
end
function v(e)
return e[1]==we
end
function re(e)
return e[2]
end
function le(e)
return b()[re(e)]
end
function h(t,e)
return{
ye,
t,
e,
}
end
function a(e)
return e[1]==ye
end
function o(e)
return e[2]
end
function i(e)
return e[3]
end
function r(e)
return e[1]==de
end
function _(e,t)
return{
F,
e,
t,
}
end
function f(e)
return e[1]==F
end
function E(e)
return e[2]
end
function T(e)
return e[3]
end
function D(e,t)
return{
te,
e,
t,
}
end
function g(e)
return e[1]==te
end
function C(e)
return e[2]
end
function M(e)
return e[3]
end
function X(e)
return e[1]==W
end
function ct(e)
return e[2]
end
function S(e,t)
return{
he,
e,
t,
}
end
function G(e)
return e[1]==he
end
function ee(e)
return e[2]
end
function Z(e)
return e[3]
end
function Ke(e,t,a)
return{
Je,
e,
t,
a,
}
end
function V(e)
return e[1]==Je
end
function je(e)
return e[2]
end
function qe(e)
return e[3]
end
function xe(e)
return e[4]
end
function A(e,t)
return{
ke,
e,
t,
}
end
function P(e)
return e[1]==ke
end
function ie(e)
return e[2]
end
function se(e)
return e[3]
end
function K(e,t)
return{
Qe,
e,
t,
}
end
function Y(e)
return e[1]==Qe
end
function Ee(e)
return e[2]
end
function _e(e)
return e[3]
end
function m(e)
local e=d(e)
local function t(e)
e[2]=m(e[2])
e[3]=m(e[3])
return e
end
if f(e)then
return t(e)
elseif g(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function Q()
return{Ae}
end
function U(e)
return e[1]==Ae
end
function I(e,t)
if e==t then
return
end
e[1]=W
e[2]=t
e[3]=false
e[4]=false
end
function B(e,t)
H(U(e))
H(not U(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function Ze(t)
local e=Q()
B(e,t)
return e
end
function L(e,t)
if e==t then
return true
end
if re(e)==re(t)then
I(e,t)
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
function N(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
s(t,e)
e=ct(e)
end
for a=1,#t do
local t=t[a]
I(t,e)
end
return e
end
function pe(e)
return G(e)or V(e)or P(e)or Y(e)
end
function u(e)
return X(e)or pe(e)
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
local e,r,h
function r(t)
I(e,t)
do
local e=0
while e<#a do
I(a[e+1],t)
e=e+1
end
end
return t
end
function h(t)
r(t)
if u(t)then
s(a,e)
return n(t,i,{
false,
false,
},a)
end
return t
end
local d={}
e=o
local function o()
t[2]=true
return h(et)
end
local function l()
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
while u(e)and t<32 do
s(a,e)
e=k(e)
t=t+1
end
end
while u(e)do
local r=w(e)
if i[r]==true then
return o()
end
if d[r]==true then
t[1]=true
if G(e)then
return o()
elseif P(e)then
local a=ie(e)
local e=se(e)
local i={
Le,
Me,
We,
Fe,
De,
Ce,
Re,
Oe,
Ne,
Ie,
Se,
}
local s=false
for e=1,#i do
local e=i[e]
if c(e,a)then
s=true
break
end
end
if s then
H(#e==1)
H(t[2]==false)
local e=n(e[1],l(),t)
if t[2]then
return h(A(a,{e}))
else
return q()
end
end
if c(a,ae)then
return o()
elseif c(a,ve)then
return o()
elseif c(a,be)then
return o()
elseif c(a,oe)then
H(#e==3)
H(t[2]==false)
local a=n(e[1],l(),t)
if t[2]then
return h(A(oe,{
a,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif V(e)then
return o()
elseif Y(e)then
return o()
end
return q()
end
d[r]=true
s(a,e)
e=k(e)
end
return r(e)
end
function k(a)
local e=N(a)
local t
H(not X(e))
if G(e)then
t=rt(ee(e),Z(e),a)
elseif V(e)then
t=ot(je(e),qe(e),xe(e),a)
elseif P(e)then
t=ht(ie(e),se(e),a)
elseif Y(e)then
t=dt(Ee(e),_e(e),a)
else
t=e
end
t=N(t)
I(e,t)
return t
end
function d(e)
return n(e)
end
function Ye(e)
while u(e)or O(e)do
e=d(me(e))
end
return e
end
function ge(a,o,i)
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
function Pe(t,a,o)
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
function lt(t,a)
do
local e=0
while e<#t do
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function R(o)
local a=p
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(Ue,e(a))
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
function ut(e,d,l,c)
local t={}
local n={}
local e=N(e)
local h=true
while true do
if r(e)then
return c(n,t)
elseif O(e)then
s(n,ce(e))
e=J(e)
elseif a(e)then
s(t,o(e))
e=i(e)
elseif u(e)then
if h then
h=false
e=k(e)
else
return l()
end
else
return d()
end
end
end
function rt(h,t,l)
local n=k(t)
if u(n)then
return l
end
local t
t=function()return D(z,e(ne,e(be,e(R(h),n))))end
if a(n)then
return ut(n,t,function()return l end,function(n,e)
if#n~=0 then
error("WIP")
end
if c(e[1],ze)then
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
return Ke(h,o,a)
elseif c(e[1],tt)then
if#e==1 then
return t()
end
local d=d(S(h,e[2]))
if not f(d)then
return t()
end
local n=k(E(d))
if u(n)then
return l
end
if not v(n)then
return t()
end
if not L(n,j)then
return t()
end
local n=k(T(d))
if u(n)then
return l
end
if not a(n)then
return t()
end
local o=o(n)
local a=k(i(n))
if u(a)then
return l
end
if not r(a)then
return t()
end
local a={R(h)}
do
local t=2
while t<#e do
s(a,e[t+1])
t=t+1
end
end
return K(o,a)
elseif c(e[1],ne)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
s(a,S(h,e[t+1]))
t=t+1
end
end
return A(o,a)
else
local o=S(h,e[1])
local a={}
do
local t=1
while t<#e do
s(a,S(h,e[t+1]))
t=t+1
end
end
return K(o,a)
end
end)
elseif r(n)then
return n
elseif y(n)then
return Pe(h,n,t())
elseif g(n)then
return t()
end
return q()
end
function y(e)
return v(e)or f(e)
end
function dt(n,s,c)
local t
t=function()return D(z,e(ne,e(ve,e(n,x(s)))))end
n=k(n)
if u(n)then
return c
end
if not f(n)then
return t()
end
local e=d(E(n))
if not(v(e)and L(e,l))then
return t()
end
local n=d(T(n))
if not a(n)then
return t()
end
local e=m(o(n))
local n=d(i(n))
if not(a(n)and r(d(i(n))))then
return t()
end
local l=o(n)
local d=Ve
local n=0
while not r(e)do
if y(e)then
local t=p
do
local e=#s-1
while e>=n do
t=h(s[e+1],t)
e=e-1
end
end
d=ge(d,e,t)
n=#s
e=p
elseif a(e)then
if n<#s then
local t=s[n+1]
n=n+1
d=ge(d,o(e),t)
e=i(e)
else
return t()
end
else
return t()
end
end
if#s~=n then
return t()
end
return S(d,l)
end
function ht(i,t,o)
local a
a=function()return D(z,e(ne,e(i,x(t))))end
for e=1,#Ge do
local e=Ge[e]
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
return q()
end
end
return a()
end
function ot(i,o,t,a)
local a
a=function()return D(z,e(ze,e(R(i),o,x(t))))end
if c(o,He)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,Xe)then
if#t~=2 then
return a()
end
return at(i,t[1],t[2],a)
elseif c(o,st)then
if#t~=2 then
return a()
end
return ue(t[1],S(i,t[2]))
end
return a()
end
function fe(t)
return e(ze,He,t)
end
function at(u,n,w,f)
n=m(n)
local d={}
local m=false
local t=n
while not r(t)do
if y(t)then
s(d,t)
m=true
t=p
elseif a(t)then
s(d,o(t))
t=i(t)
else
return f()
end
end
local a
if m then
a=x(d)
else
a=n
end
local t={}
Be(u,function(a,e)
do
local e=0
while e<#d do
if c(d[e+1],a)then
return
end
e=e+1
end
end
s(t,a)
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
a=h(fe(lt(u,t[e+1])),a)
e=e-1
end
end
return _(l,e(n,h(fe(_(l,e(o,w))),a)))
end
function c(e,t)
if e==t then
return true
end
e=d(e)
t=d(t)
if e==t then
return true
end
local function n(t,e,o,a)
if c(o(t),o(e))and c(a(t),a(e))then
I(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
I(e,p)
I(t,p)
return true
elseif v(e)then
if not v(t)then
return false
end
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,C,M)
elseif f(e)then
if not f(t)then
return false
end
return n(e,t,E,T)
end
return q()
end
function w(e)
e=N(e)
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
e=N(i(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(w(h(E(e),T(e))))
elseif g(e)then
return"!"..tostring(w(h(C(e),M(e))))
elseif v(e)then
return le(e)
elseif O(e)then
return";("..tostring(w(ce(e))).." "..tostring(w(J(e)))..")"
elseif G(e)then
return"$("..tostring(w(R(ee(e)))).." "..tostring(w(Z(e)))..")"
elseif P(e)then
return"%("..tostring(w(ie(e))).." "..tostring(w(x(se(e))))..")"
elseif V(e)then
return"@("..tostring(w(R(je(e)))).." "..tostring(w(qe(e))).." "..tostring(w(x(xe(e))))..")"
elseif Y(e)then
return"^("..tostring(w(Ee(e))).." "..tostring(w(x(_e(e))))..")"
end
return q()
end
function it()
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
local y
y=function()
local e=it()
y=function()return e end
return e
end
b=function()
local e=nt()
b=function()return e end
return e
end
we=0
ye=1
de=2
F=3
te=4
W=5
he=6
ke=7
Je=8
Qe=9
Te=11
Ae=10
t.new_comment=ue
t.comment_p=O
t.comment_comment=ce
t.comment_x=J
t.un_comment_all=me
local function vt(e)
return b()[e]~=nil
end
local function at(e)
return{
we,
e,
}
end
local function ot(e)
return y()[e]~=nil
end
local function n(e)
return at(y()[e])
end
t.can_new_symbol_p=ot
t.New_Symbol=New_Symbol
t.new_symbol=n
t.symbol_p=v
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=i
p={de}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=f
t.data_name=E
t.data_list=T
t.New_Error=New_Error
t.new_error=D
t.error_p=g
t.error_name=C
t.error_list=M
t.just_p=X
t.evaluate=S
t.apply=K
local function y(e)
local o=Ye(e)
local function i(e)
e[2]=m(e[2])
e[3]=m(e[3])
if O(e[2])or O(e[3])then
local t=Ze(e)
local a=e[2]
local e=e[3]
local a=y(a)
local e=y(e)
t[2]=a
t[3]=e
return t
else
return e
end
end
if f(o)then
return i(o)
elseif g(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=m
t.force_uncomment_all_rec=y
z=n("太始初核")
local we=n("符名")
l=n("化滅")
j=n("式形")
local ht=n("等同")
local ft=n("解算")
local F=n("特定其物")
local y=n("省略一物")
Ue=n("映表")
local mt=n("如若")
local m=n("一類何物")
local te=n("是非")
local ye=n("其子")
local Je=n("爻陽")
local Qe=n("爻陰")
local wt=n("引用")
local yt=n("應用")
local pt=n("間空")
local de=n("連頸")
local he=n("構物")
local ke=n("謬誤")
local ct=n("詞素")
local Ae=n("列序")
local ut=n("首始")
local rt=n("尾末")
local Ze=n("之物")
local b=n("宇宙亡矣")
local nt=n("效應")
local it=n("註疏")
et=D(z,e(b,y))
local function b(e)
return _(we,h(z,h(e,p)))
end
local function Te(t)
return b(e(m,e(l,y,t),F))
end
local function U(t,a)
return b(e(m,e(l,e(t),y),a))
end
local function W(t)
return b(e(m,l,e(te,e(m,t,y))))
end
local et=Te(he)
Le=U(he,we)
Me=U(he,Ae)
We=W(he)
local lt=Te(ke)
Fe=U(ke,we)
De=U(ke,Ae)
Ce=W(ke)
local dt=Te(de)
Re=W(de)
Oe=U(de,ut)
Ne=U(de,rt)
Ie=W(ct)
Se=W(pt)
ae=b(e(m,l,e(te,ht)))
ve=b(e(m,e(l,h(l,y),y),yt))
be=b(e(m,l,ft))
local Te=U(Ae,e(m,Ze,y))
oe=b(e(m,l,mt))
He=b(e(m,j,wt))
Xe=b(e(m,e(j,e(l,y,l)),F))
ne=b(e(j,e(z,l)))
ze=b(e(j,e(z,j)))
tt=b(e(j,j))
local Ae=b(e(m,l,it))
st=b(e(m,j,it))
local W=_(Qe,e())
local he=_(Je,e())
local function ke(e,h,n)
local t={}
while a(e)do
s(t,o(e))
e=i(e)
end
if r(e)then
return h(t)
end
return n(t,e)
end
local function U(e)
return ke(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=U
t.new_list=e
local function ne(e)
while X(e)or O(e)do
e=N(me(e))
end
return e
end
t.un_just_all=N
t.un_just_comment_all=ne
t.delay_p=pe
t.delay_just_p=u
local function ze(e)
if G(e)then
return e
elseif V(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return q()
end
local function X(e)
return ee(ze(e))
end
local function ne(e)
return Z(ze(e))
end
t.delay_env=X
t.delay_x=ne
local function X(e)
if O(e)then
return J(e)
else
return k(e)
end
end
t.force_all=d
t.force1=k
t.force_uncomment1=X
t.force_uncomment_all=Ye
Ve={}
local function me(n)
n=d(n)
if not f(n)then
return false
end
local e=d(E(n))
if not v(e)then
return false
end
if not L(e,Ue)then
return false
end
e=d(T(n))
if not a(e)then
return false
end
if not r(d(i(e)))then
return false
end
local n={}
local h=d(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=d(o(h))
h=d(i(h))
if not a(e)then
return false
end
local h=o(e)
e=d(i(e))
if not a(e)then
return false
end
local a=o(e)
if not r(d(i(e)))then
return false
end
local t=true
do
local e=0
while e<#n do
if c(n[(e+0)+1],h)then
n[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
s(n,h)
s(n,a)
end
end
return n
end
t.env_null_v=Ve
t.env_set=ge
t.env_get=Pe
t.env2val=R
t.env_foreach=Be
t.val2env=me
local function ne(t,a)
return{
t,
1,
function(e)
e=k(e)
if u(e)then
return A(t,{e})
end
if a(e)then
return he
end
return W
end,
}
end
local function X(t,a,o)
return{
t,
1,
function(e,i)
e=k(e)
if u(e)then
return A(t,{e})
end
if a(e)then
return o(e)
end
return i()
end,
}
end
Ge={
ne(We,f),
{
et,
2,
_,
},
X(Le,f,E),
X(Me,f,T),
ne(Ce,g),
{
lt,
2,
D,
},
X(Fe,g,C),
X(De,g,M),
ne(Se,r),
{
dt,
2,
h,
},
ne(Re,a),
X(Oe,a,o),
X(Ne,a,i),
{
ae,
2,
function(e,t,n)
if e==t then
return he
end
e=k(e)
t=k(t)
if u(e)or u(t)then
return A(ae,{
e,
t,
})
end
if e==t then
return he
end
local function n(t,e,a)
return A(oe,{
t,
e,
a,
})
end
local function s(t,e)
return n(t,e,W)
end
H(not u(e))
local function n(o,a,t,e)
return s(A(ae,{
t(o),
t(a),
}),A(ae,{
e(o),
e(a),
}))
end
if r(e)then
if not r(e)then
return W
end
return he
elseif v(e)then
if not v(t)then
return W
end
if L(e,t)then
return he
else
return W
end
elseif f(e)then
if not f(t)then
return W
end
return n(e,t,E,T)
elseif a(e)then
if not a(t)then
return W
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return W
end
return n(e,t,C,M)
end
return q()
end,
},
{
ve,
2,
function(n,e,h)
local t={}
local e=d(e)
while a(e)do
s(t,o(e))
e=d(i(e))
end
if not r(e)then
return h()
end
return K(n,t)
end,
},
{
be,
2,
function(e,t,a)
local e=me(e)
if e==false then
return a()
end
return S(e,t)
end,
},
ne(Ie,v),
{
Te,
1,
function(e,t)
e=k(e)
if u(e)then
return A(Te,{e})
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
function(e,a,o,t)
e=k(e)
if u(e)then
return A(oe,{
e,
a,
o,
})
end
if not f(e)then
return t()
end
local e=d(E(e))
if not v(e)then
return t()
end
if L(e,Je)then
return a
end
if L(e,Qe)then
return o
end
return t()
end,
},
{
Ae,
2,
ue,
},
}
local u
u=c
t.equal_p=u
local function u(e,n)
if e==n then
return true
end
e=N(e)
n=N(n)
if e==n then
return true
end
local function s(t,e,o,a)
if u(o(t),o(e))and u(a(t),a(e))then
I(t,e)
return true
else
return false
end
end
if r(e)then
if not r(n)then
return false
end
I(e,p)
I(n,p)
return true
elseif v(e)then
if not v(n)then
return false
end
return L(e,n)
elseif a(e)then
if not a(n)then
return false
end
return s(e,n,o,i)
elseif g(e)then
if not g(n)then
return false
end
return s(e,n,C,M)
elseif f(e)then
if not f(n)then
return false
end
return s(e,n,E,T)
elseif G(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return q()
end
t.simple_print=w
local function ae(ee)
local V,g,c,u,f,d,E,T,G,k,L,R,C,Y,M,P,W,N,U,O,I,q,w,X,J,Z
function c()
return#V==g
end
function u()
H(not c())
local e=string.sub(V,g+1,g+1)
g=g+1
return e
end
function f(e)
H(string.sub(V,g,g)==e)
g=g-1
end
function d(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function E(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=u()
if not E(e)then
f(e)
return false
end
while E(e)and not c()do
e=u()
end
if not E(e)then
f(e)
end
return true
end
function G()
if c()then
return false
end
local e=u()
local t=""
if not N(e)then
f(e)
return false
end
while N(e)and not c()do
t=tostring(t)..tostring(e)
e=u()
end
if N(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if ot(t)then
return n(t)
else
return d("Not Symbol"..tostring(t))
end
end
function k()
if c()then
return false
end
local e=u()
if e~="("then
f(e)
return false
end
local t=Q()
local a=t
local function o(a)
local e=Q()
B(t,h(a,e))
t=e
end
while true do
T()
if c()then
return d()
end
e=u()
if e==")"then
B(t,p)
return a
end
if e=="."then
T()
local o=U()
B(t,o)
T()
if c()then
return d()
end
e=u()
if e~=")"then
return d()
end
return a
end
f(e)
local e=U()
o(e)
end
end
function L()
if c()then
return false
end
local e=u()
if e~="#"then
f(e)
return false
end
local e=k()
if e==false then
return d()
end
if not a(e)then
return d()
end
return _(o(e),i(e))
end
function R()
if c()then
return false
end
local e=u()
if e~="!"then
f(e)
return false
end
local e=k()
if e==false then
return d()
end
if not a(e)then
return d()
end
return D(o(e),i(e))
end
function N(t)
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
function U()
T()
local e={
k,
Z,
L,
R,
C,
Y,
M,
P,
W,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return d()
end
function O(e)
if e==false then
return d()
end
return e
end
function I()
return not c()
end
function q(e)
O(I())
O(u()==e)
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
G,
a,
L,
R,
C,
Y,
M,
P,
W,
}
else
e={
k,
J,
L,
R,
C,
Y,
M,
P,
W,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return d()
end
function X(t)
if c()then
return t
end
local a=u()
if a=="."then
local a=w()
return e(m,e(l,e(t),y),a)
elseif a==":"then
local a=w()
return e(m,a,t)
elseif a=="~"then
return e(te,t)
elseif a=="@"then
local a=w()
return e(m,e(l,h(t,y),y),a)
elseif a=="?"then
return e(m,l,e(te,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
s(t,e)
if c()then
break
end
local e=u()
if e~="/"then
f(e)
break
end
end
return e(ye,x(t))
else
f(a)
return t
end
end
function J()
if c()then
return false
end
local t=u()
if t=="&"then
O(I())
local t=u()
if t=="+"then
local t=w()
return e(j,e(z,t))
else
f(t)
end
local t=w()
return e(j,t)
elseif t==":"then
O(I())
local t=u()
if t=="&"then
q(">")
local t=w()
return e(m,e(j,e(l,y,t)),F)
elseif t==">"then
local t=w()
return e(m,e(l,y,t),F)
else
f(t)
end
local t=w()
return e(m,t,F)
elseif t=="+"then
local t=w()
return e(z,t)
elseif t=="["then
local e=w()
q("]")
return X(e)
elseif t=="_"then
q(":")
local t=w()
return e(m,t,y)
else
f(t)
local e=G()
if e==false then
return false
end
return X(e)
end
end
function Z()
local e=J()
if e==false then
return false
end
if v(e)then
return e
end
return b(e)
end
V=ee
g=0
local function n(t,n)
return function()
if c()then
return false
end
local e=u()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return d()
end
if not a(e)then
return d()
end
local t=i(e)
if not(a(t)and r(i(t)))then
return d()
end
return n(o(e),o(t))
end
end
local function s(t,s)
return function()
if c()then
return false
end
local e=u()
if e~=t then
f(e)
return false
end
local e=k()
if e==false then
return d()
end
if not a(e)then
return d()
end
local n=i(e)
if not a(n)then
return d()
end
local t=i(n)
if not(a(t)and r(i(t)))then
return d()
end
return s(o(e),o(n),o(t))
end
end
C=n("$",function(e,t)
local e=me(e)
if e==false then
return d()
end
return S(e,t)
end)
Y=n("%",function(t,e)
local e=ke(e,function(e)return e end,function(e,e)return d()end)
return A(t,e)
end)
M=s("@",function(a,t,e)
local o=ke(e,function(e)return e end,function(e,e)return d()end)
local e=me(a)
if e==false then
return d()
end
return Ke(e,t,o)
end)
P=n("^",function(t,e)
local e=ke(e,function(e)return e end,function(e,e)return d()end)
return K(t,e)
end)
W=n(";",function(t,e)return ue(t,e)end)
return U()
end
t.complex_parse=ae
local function k(c)
local function n(r,d)
if v(r)then
return le(r)
end
local function t(e)
if d then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(r)
if e~=false and#e==3 and u(e[1],m)then
local s=U(e[2])
if s~=false and#s==3 and u(s[1],l)then
local h=s[2]
local r=U(h)
if r~=false and#r==1 and u(s[3],y)then
return t(tostring(n(r[1],true)).."."..tostring(n(e[3],true)))
elseif a(h)and u(i(h),y)and u(s[3],y)then
return t(tostring(n(o(h),true)).."@"..tostring(n(e[3],true)))
elseif u(h,y)and u(e[3],F)then
return t(":>"..tostring(n(s[3],true)))
end
end
local a=U(e[3])
if u(e[2],l)and a~=false and#a==2 and u(a[1],te)then
return t(tostring(n(a[2],true)).."?")
end
if s~=false and#s==2 and u(e[3],F)and u(s[1],j)then
local e=U(s[2])
if e~=false and#e==3 and u(e[1],l)and u(e[2],y)then
return t(":&>"..tostring(n(e[3],true)))
end
end
local a=u(e[3],y)and"_"or u(e[3],F)and""or n(e[3],true)
return t(tostring(a)..":"..tostring(n(e[2],true)))
elseif e~=false and#e==2 then
if u(e[1],j)then
local a=U(e[2])
if a~=false and#a==2 and u(a[1],z)then
return t("&+"..tostring(n(a[2],true)))
end
return t("&"..tostring(n(e[2],true)))
elseif u(e[1],te)then
return t(tostring(n(e[2],true)).."~")
elseif u(e[1],z)then
return t("+"..tostring(n(e[2],true)))
elseif u(e[1],ye)then
local e=U(e[2])
if e~=false and#e>1 then
local a=n(e[1],true)
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
if d then
return w(r)
else
return w(b(r))
end
end
local e=ae(w(c))
local s=""
local d=""
if r(e)then
return"()"
elseif a(e)then
s="("
d=""
while a(e)do
s=tostring(s)..tostring(d)..tostring(k(o(e)))
d=" "
e=i(e)
end
if r(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(k(e))..")"
end
return s
elseif f(e)then
local a=E(e)
local t=T(e)
local e=U(t)
if e~=false and#e==2 and u(a,we)and u(e[1],z)then
return n(e[2],false)
end
return"#"..tostring(k(h(a,t)))
elseif g(e)then
return"!"..tostring(k(h(C(e),M(e))))
elseif v(e)then
return le(e)
elseif O(e)then
return";("..tostring(k(ce(e))).." "..tostring(k(J(e)))..")"
elseif G(e)then
return"$("..tostring(k(R(ee(e)))).." "..tostring(k(Z(e)))..")"
elseif P(e)then
return"%("..tostring(k(ie(e))).." "..tostring(k(x(se(e))))..")"
elseif V(e)then
return"@("..tostring(k(R(je(e)))).." "..tostring(k(qe(e))).." "..tostring(k(x(xe(e))))..")"
elseif Y(e)then
return"^("..tostring(k(Ee(e))).." "..tostring(k(x(_e(e))))..")"
end
return q()
end
t.complex_print=k
local function w(r)
local l=Q()
local n={function(e)return B(l,e)end}
local t=0
local function a()
error("MT parse ERROR")
end
local function u(e)
if not e then
return a()
end
end
local function c()
u(#r>t)
local e=string.sub(r,t+1,t+1)
t=t+1
return e
end
local d={}
while#n~=0 do
local t={}
for e=1,#n do
local i=n[e]
local e=c()
local o
o=function(o)
local a=Q()
local e=Q()
s(t,function(e)return B(a,e)end)
s(t,function(t)return B(e,t)end)
i(o(a,e))
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
if vt(e)then
i(at(e))
else
return a()
end
elseif e=="."then
o(h)
elseif e=="#"then
o(_)
elseif e=="!"then
o(D)
elseif e=="$"then
local o=false
local e=false
s(t,function(e)
o=e
end)
s(t,function(t)
e=t
end)
s(d,function()
if o==false or e==false then
return q()
else
local t=me(o)
if t==false then
return a()
else
i(S(t,e))
end
end
end)
elseif e=="_"then
i(p)
else
return a()
end
end
n=t
end
u(t==#r)
do
local e=#d-1
while e>=0 do
d[e+1]()
e=e-1
end
end
return l
end
local function u(e)
local t={}
local h={}
for n=1,#e do
local e=e[n]
e=N(e)
local n
n=function(e,o,a,i)
s(t,o)
s(h,a(e))
s(h,i(e))
end
if v(e)then
s(t,"^")
s(t,re(e))
s(t,"^")
elseif a(e)then
n(e,".",o,i)
elseif r(e)then
s(t,"_")
elseif f(e)then
n(e,"#",E,T)
elseif g(e)then
n(e,"!",C,M)
elseif pe(e)then
local e=ze(e)
n(e,"$",(function(e)return R(ee(e))end),Z)
else
return q()
end
end
return{
t,
h,
}
end
local function s(e)
local a={e}
local e=""
while#a~=0 do
local t,i=unpack(u(a))
for o=1,#t do
local t=t[o]
e=tostring(e)..tostring(t)
end
a=i
end
return e
end
t.machinetext_parse=w
t.machinetext_print=s
local function k(e)
return function()return{
false,
e,
}end
end
local function s(e)
return function()return{
true,
e(),
}end
end
local function v(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
t.trampoline_return=k
t.trampoline_delay=s
t.run_trampoline=v
local g=b(h(ye,h(h(nt,h(h(m,h(Ze,h(y,p))),p)),p)))
local b=b(h(ye,h(h(nt,h(de,p)),p)))
local function q(t,a)
return _(b,e(t,a))
end
local function j(e)
return _(g,e)
end
local function p(y,w,u,m,h)
if h==nil then
h=false
end
local function v(e,e)
error("WIP")
end
u=d(u)
if f(u)then
local f=E(u)
local t=T(u)
if c(f,g)then
t=d(t)
if a(t)then
local e=o(t)
local t=d(i(t))
if r(t)then
if h==false then
local a=e
local t=m
local e
e=function()return y(a,t)end
return s(e)
else
local a
a=y
local t
t=w
local i=e
local o=m
local e
e=function()return p(a,t,K(h,i),o)end
return s(e)
end
end
end
elseif c(f,b)then
t=d(t)
if a(t)then
local u=o(t)
local t=d(i(t))
if a(t)then
local a=o(t)
local t=d(i(t))
if r(t)then
if h==false then
local e
e=y
local o
o=w
local i=u
local n=a
local a=m
local t
t=function()return p(e,o,i,a,n)end
return s(t)
else
local i
i=y
local o
o=w
local d=u
local r=a
local u=m
local h=h
local t=n("序甲")
local a
a=function()return p(i,o,d,u,_(l,e(e(t),v(e(fe(r),t),fe(h)))))end
return s(a)
end
end
end
end
end
end
if h==false then
return s(function()return w(u,m,y)end)
else
return s(function()return w(u,m,function(e,t)return s(function()return p(y,w,K(h,{e}),t)end)end)end)
end
end
local function o(e,t,a,o)
return p(e,t,a,o)
end
local function s(i,n,o,a)
return v(p((function(t,e)return k(i(t,e))end),(function(e,a,t)return k(n(e,a,function(e,a)return v(t(e,a))end))end),o,a))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=b
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=o
t.run_monad_stackoverflow=s
return t