local function l(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,S,C,ye,ie,we,fe,Ie,Oe,Ae,ue,Je,G,Z,W,re,I,se,J,be,p,de,le,s,a,o,n,v,h,x,f,z,A,D,g,U,M,Q,ct,N,Y,te,ae,Te,F,qe,je,ge,T,P,ce,me,B,V,xe,ve,m,X,i,O,K,ut,E,d,j,Ye,Xe,Fe,We,Pe,Ge,Ve,Qe,Ke,Be,Le,Ce,Ue,oe,Ee,_e,ee,Me,tt,ne,pe,Ze,et,L,_,e,H,ze,u,w,q,r,He,Se,ke,Ne,at,R,Re,dt,lt,b,De,rt,ht,st,he,nt,c,y,it,ot
function k()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return k()
end
end
function re(t,e)
return{
Z,
t,
e,
}
end
function I(e)
return e[1]==Z
end
function se(e)
return e[2]
end
function J(e)
return e[3]
end
function be(e)
while I(e)do
e=J(e)
end
return e
end
function p(e)
return e[1]==ye
end
function de(e)
return e[2]
end
function le(e)
return C()[de(e)]
end
function s(t,e)
return{
ie,
t,
e,
}
end
function a(e)
return e[1]==ie
end
function o(e)
return e[2]
end
function n(e)
return e[3]
end
function h(e)
return e[1]==we
end
function x(t,e)
return{
fe,
t,
e,
}
end
function f(e)
return e[1]==fe
end
function z(e)
return e[2]
end
function A(e)
return e[3]
end
function D(t,e)
return{
Ie,
t,
e,
}
end
function g(e)
return e[1]==Ie
end
function U(e)
return e[2]
end
function M(e)
return e[3]
end
function Q(e)
return e[1]==Oe
end
function ct(e)
return e[2]
end
function N(e,t)
return{
Ae,
e,
t,
}
end
function Y(e)
return e[1]==Ae
end
function te(e)
return e[2]
end
function ae(e)
return e[3]
end
function Te(a,e,t)
return{
Je,
a,
e,
t,
}
end
function F(e)
return e[1]==Je
end
function qe(e)
return e[2]
end
function je(e)
return e[3]
end
function ge(e)
return e[4]
end
function T(t,e)
return{
ue,
t,
e,
}
end
function P(e)
return e[1]==ue
end
function ce(e)
return e[2]
end
function me(e)
return e[3]
end
function B(e,t)
return{
G,
e,
t,
}
end
function V(e)
return e[1]==G
end
function xe(e)
return e[2]
end
function ve(e)
return e[3]
end
function m(e)
local e=r(e)
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
elseif I(e)then
return t(e)
end
return e
end
function X()
return{W}
end
function i(e)
return e[1]==W
end
function O(e,t)
if e==t then
return
end
e[1]=Oe
e[2]=t
e[3]=false
e[4]=false
end
function K(e,a)
S(i(e))
S(not i(a))
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ut(t)
local e=X()
K(e,t)
return e
end
function L(e,t)
if e==t then
return true
end
if de(e)==de(t)then
O(e,t)
return true
else
return false
end
end
function _(a)
local t=v
do
local e=#a-1
while e>=0 do
t=s(a[e+1],t)
e=e-1
end
end
return t
end
function e(...)
local e=({...})
return _(e)
end
function H(e)
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
l(t,e)
e=ct(e)
end
for a=1,#t do
local t=t[a]
O(t,e)
end
return e
end
function ze(e)
return Y(e)or F(e)or P(e)or V(e)
end
function u(e)
return Q(e)or ze(e)
end
function w(o,i,t,a)
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
if u(t)then
l(a,e)
return w(t,i,{
false,
false,
},a)
end
return t
end
local s={}
e=o
local function o()
t[2]=true
return n(Xe)
end
local function d()
local e={}
for t in pairs(s)do
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
l(a,e)
e=q(e)
t=t+1
end
end
while u(e)do
local h=y(e)
if i[h]==true then
return o()
end
if s[h]==true then
t[1]=true
if Y(e)then
return o()
elseif P(e)then
local a=ce(e)
local e=me(e)
local i={
Fe,
We,
Pe,
Ge,
Ve,
Qe,
Ke,
Be,
Le,
Ce,
Ue,
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
S(#e==1)
S(t[2]==false)
local e=w(e[1],d(),t)
if t[2]then
return n(T(a,{e}))
else
return k()
end
end
if c(a,oe)then
return o()
elseif c(a,Ee)then
return o()
elseif c(a,_e)then
return o()
elseif c(a,ee)then
S(#e==3)
S(t[2]==false)
local a=w(e[1],d(),t)
if t[2]then
return n(T(ee,{
a,
e[2],
e[3],
}))
else
return k()
end
end
return k()
elseif F(e)then
return o()
elseif V(e)then
return o()
end
return k()
end
s[h]=true
l(a,e)
e=q(e)
end
return r(e)
end
function q(a)
local e=H(a)
local t
S(not Q(e))
if Y(e)then
t=lt(te(e),ae(e),a)
elseif F(e)then
t=st(qe(e),je(e),ge(e),a)
elseif P(e)then
t=ht(ce(e),me(e),a)
elseif V(e)then
t=rt(xe(e),ve(e),a)
else
t=e
end
t=H(t)
O(e,t)
return t
end
function r(e)
return w(e)
end
function He(e)
while u(e)or I(e)do
e=r(be(e))
end
return e
end
function ke(a,o,i)
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
function Ne(t,o,a)
do
local e=0
while e<#t do
if c(t[(e+0)+1],o)then
return t[(e+1)+1]
end
e=e+2
end
end
return a
end
function at(t,a)
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
function R(a)
local o=v
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return x(Ye,e(o))
end
function Re(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function dt(e,c,d,r)
local t={}
local i={}
local e=H(e)
local s=true
while true do
if h(e)then
return r(i,t)
elseif I(e)then
l(i,se(e))
e=J(e)
elseif a(e)then
l(t,o(e))
e=n(e)
elseif u(e)then
if s then
s=false
e=q(e)
else
return d()
end
else
return c()
end
end
end
function lt(s,t,d)
local i=q(t)
if u(i)then
return d
end
local t
t=function()return D(E,e(ne,e(_e,e(R(s),i))))end
if a(i)then
return dt(i,t,function()return d end,function(i,e)
if#i~=0 then
error("WIP")
end
if c(e[1],pe)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return Te(s,o,a)
elseif c(e[1],Ze)then
if#e==1 then
return t()
end
local i=r(N(s,e[2]))
if not f(i)then
return t()
end
local r=q(z(i))
if u(r)then
return d
end
if not p(r)then
return t()
end
if not L(r,j)then
return t()
end
local i=q(A(i))
if u(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=q(n(i))
if u(a)then
return d
end
if not h(a)then
return t()
end
local a={R(s)}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return B(o,a)
elseif c(e[1],ne)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
l(a,N(s,e[t+1]))
t=t+1
end
end
return T(o,a)
else
local o=N(s,e[1])
local a={}
do
local t=1
while t<#e do
l(a,N(s,e[t+1]))
t=t+1
end
end
return B(o,a)
end
end)
elseif h(i)then
return i
elseif b(i)then
return Ne(s,i,t())
elseif g(i)then
return t()
end
return k()
end
function b(e)
return p(e)or f(e)
end
function rt(i,l,c)
local t
t=function()return D(E,e(ne,e(Ee,e(i,_(l)))))end
i=q(i)
if u(i)then
return c
end
if not f(i)then
return t()
end
local e=r(z(i))
if not(p(e)and L(e,d))then
return t()
end
local i=r(A(i))
if not a(i)then
return t()
end
local e=m(o(i))
local i=r(n(i))
if not(a(i)and h(r(n(i))))then
return t()
end
local d=o(i)
local r=Se
local i=0
while not h(e)do
if b(e)then
local t=v
do
local e=#l-1
while e>=i do
t=s(l[e+1],t)
e=e-1
end
end
r=ke(r,e,t)
i=#l
e=v
elseif a(e)then
if i<#l then
local t=l[i+1]
i=i+1
r=ke(r,o(e),t)
e=n(e)
else
return t()
end
else
return t()
end
end
if#l~=i then
return t()
end
return N(r,d)
end
function ht(i,t,o)
local a
a=function()return D(E,e(ne,e(i,_(t))))end
for e=1,#De do
local e=De[e]
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
return k()
end
end
return a()
end
function st(i,o,t,a)
local a
a=function()return D(E,e(pe,e(R(i),o,_(t))))end
if c(o,Me)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,tt)then
if#t~=2 then
return a()
end
return nt(i,t[1],t[2],a)
elseif c(o,et)then
if#t~=2 then
return a()
end
return re(t[1],N(i,t[2]))
end
return a()
end
function he(t)
return e(pe,Me,t)
end
function nt(f,i,y,w)
i=m(i)
local r={}
local u=false
local t=i
while not h(t)do
if b(t)then
l(r,t)
u=true
t=v
elseif a(t)then
l(r,o(t))
t=n(t)
else
return w()
end
end
local a
if u then
a=_(r)
else
a=i
end
local t={}
Re(f,function(a,e)
do
local e=0
while e<#r do
if c(r[e+1],a)then
return
end
e=e+1
end
end
l(t,a)
end)
local o=a
do
local e=#t-1
while e>=0 do
o=s(t[e+1],o)
e=e-1
end
end
local a=a
do
local e=#t-1
while e>=0 do
a=s(he(at(f,t[e+1])),a)
e=e-1
end
end
return x(d,e(i,s(he(x(d,e(o,y))),a)))
end
function c(t,e)
if t==e then
return true
end
t=r(t)
e=r(e)
if t==e then
return true
end
local function i(t,e,a,o)
if c(a(t),a(e))and c(o(t),o(e))then
O(t,e)
return true
else
return false
end
end
if h(t)then
if not h(e)then
return false
end
O(t,v)
O(e,v)
return true
elseif p(t)then
if not p(e)then
return false
end
return L(t,e)
elseif a(t)then
if not a(e)then
return false
end
return i(t,e,o,n)
elseif g(t)then
if not g(e)then
return false
end
return i(t,e,U,M)
elseif f(t)then
if not f(e)then
return false
end
return i(t,e,z,A)
end
return k()
end
function y(e)
e=H(e)
local t=""
local i=""
if h(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(y(o(e)))
i=" "
e=H(n(e))
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(y(e))..")"
end
return t
elseif f(e)then
return"#"..tostring(y(s(z(e),A(e))))
elseif g(e)then
return"!"..tostring(y(s(U(e),M(e))))
elseif p(e)then
return le(e)
elseif I(e)then
return";("..tostring(y(se(e))).." "..tostring(y(J(e)))..")"
elseif Y(e)then
return"$("..tostring(y(R(te(e)))).." "..tostring(y(ae(e)))..")"
elseif P(e)then
return"%("..tostring(y(ce(e))).." "..tostring(y(_(me(e))))..")"
elseif F(e)then
return"@("..tostring(y(R(qe(e)))).." "..tostring(y(je(e))).." "..tostring(y(_(ge(e))))..")"
elseif V(e)then
return"^("..tostring(y(xe(e))).." "..tostring(y(_(ve(e))))..")"
end
return k()
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
function ot()
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
local e=it()
w=function()return e end
return e
end
C=function()
local e=ot()
C=function()return e end
return e
end
ye=0
ie=1
we=2
fe=3
Ie=4
Oe=5
Ae=6
ue=7
Je=8
G=9
Z=11
W=10
t.new_comment=re
t.comment_p=I
t.comment_comment=se
t.comment_x=J
t.un_comment_all=be
local function vt(e)
return C()[e]~=nil
end
local function nt(e)
return{
ye,
e,
}
end
local function st(e)
return w()[e]~=nil
end
local function i(e)
return nt(w()[e])
end
t.can_new_symbol_p=st
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=p
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=n
v={we}
t.Null_V=Null_V
t.null_v=v
t.null_p=h
t.New_Data=New_Data
t.new_data=x
t.data_p=f
t.data_name=z
t.data_list=A
t.New_Error=New_Error
t.new_error=D
t.error_p=g
t.error_name=U
t.error_list=M
t.just_p=Q
t.evaluate=N
t.apply=B
local function w(e)
local o=He(e)
local function i(e)
e[2]=m(e[2])
e[3]=m(e[3])
if I(e[2])or I(e[3])then
local t=ut(e)
local a=e[2]
local e=e[3]
local a=w(a)
local e=w(e)
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
t.force_uncomment_all_rec=w
E=i("太始初核")
local we=i("符名")
d=i("化滅")
j=i("式形")
local ft=i("等同")
local mt=i("解算")
local G=i("特定其物")
local w=i("省略一物")
Ye=i("映表")
local ct=i("如若")
local m=i("一類何物")
local Z=i("是非")
local ye=i("其子")
local Je=i("爻陽")
local Ie=i("爻陰")
local rt=i("引用")
local ht=i("應用")
local dt=i("間空")
local ie=i("連頸")
local fe=i("構物")
local ue=i("謬誤")
local lt=i("詞素")
local Ae=i("列序")
local ut=i("首始")
local wt=i("尾末")
local ot=i("之物")
local b=i("宇宙亡矣")
local at=i("效應")
local it=i("註疏")
Xe=D(E,e(b,w))
local function b(e)
return x(we,s(E,s(e,v)))
end
local function Oe(t)
return b(e(m,e(d,w,t),G))
end
local function C(t,a)
return b(e(m,e(d,e(t),w),a))
end
local function W(t)
return b(e(m,d,e(Z,e(m,t,w))))
end
local yt=Oe(fe)
Fe=C(fe,we)
We=C(fe,Ae)
Pe=W(fe)
local pt=Oe(ue)
Ge=C(ue,we)
Ve=C(ue,Ae)
Qe=W(ue)
local Xe=Oe(ie)
Ke=W(ie)
Be=C(ie,ut)
Le=C(ie,wt)
Ce=W(lt)
Ue=W(dt)
oe=b(e(m,d,e(Z,ft)))
Ee=b(e(m,e(d,s(d,w),w),ht))
_e=b(e(m,d,mt))
local Ae=C(Ae,e(m,ot,w))
ee=b(e(m,d,ct))
Me=b(e(m,j,rt))
tt=b(e(m,e(j,e(d,w,d)),G))
ne=b(e(j,e(E,d)))
pe=b(e(j,e(E,j)))
Ze=b(e(j,j))
local Oe=b(e(m,d,it))
et=b(e(m,j,it))
local W=x(Ie,e())
local ne=x(Je,e())
local function pe(e,s,i)
local t={}
while a(e)do
l(t,o(e))
e=n(e)
end
if h(e)then
return s(t)
end
return i(t,e)
end
local function C(e)
return pe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=_
t.maybe_list_to_jsArray=C
t.new_list=e
local function ue(e)
while Q(e)or I(e)do
e=H(be(e))
end
return e
end
t.un_just_all=H
t.un_just_comment_all=ue
t.delay_p=ze
t.delay_just_p=u
local function be(e)
if Y(e)then
return e
elseif F(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return k()
end
local function ue(e)
return te(be(e))
end
local function Q(e)
return ae(be(e))
end
t.delay_env=ue
t.delay_x=Q
local function Q(e)
if I(e)then
return J(e)
else
return q(e)
end
end
t.force_all=r
t.force1=q
t.force_uncomment1=Q
t.force_uncomment_all=He
Se={}
local function fe(i)
i=r(i)
if not f(i)then
return false
end
local e=r(z(i))
if not p(e)then
return false
end
if not L(e,Ye)then
return false
end
e=r(A(i))
if not a(e)then
return false
end
if not h(r(n(e)))then
return false
end
local i={}
local s=r(o(e))
while not h(s)do
if not a(s)then
return false
end
local e=r(o(s))
s=r(n(s))
if not a(e)then
return false
end
local s=o(e)
e=r(n(e))
if not a(e)then
return false
end
local a=o(e)
if not h(r(n(e)))then
return false
end
local t=true
do
local e=0
while e<#i do
if c(i[(e+0)+1],s)then
i[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
l(i,s)
l(i,a)
end
end
return i
end
t.env_null_v=Se
t.env_set=ke
t.env_get=Ne
t.env2val=R
t.env_foreach=Re
t.val2env=fe
local function ue(t,a)
return{
t,
1,
function(e)
e=q(e)
if u(e)then
return T(t,{e})
end
if a(e)then
return ne
end
return W
end,
}
end
local function Q(t,i,o)
return{
t,
1,
function(e,a)
e=q(e)
if u(e)then
return T(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
De={
ue(Pe,f),
{
yt,
2,
x,
},
Q(Fe,f,z),
Q(We,f,A),
ue(Qe,g),
{
pt,
2,
D,
},
Q(Ge,g,U),
Q(Ve,g,M),
ue(Ue,h),
{
Xe,
2,
s,
},
ue(Ke,a),
Q(Be,a,o),
Q(Le,a,n),
{
oe,
2,
function(e,t,i)
if e==t then
return ne
end
e=q(e)
t=q(t)
if u(e)or u(t)then
return T(oe,{
e,
t,
})
end
if e==t then
return ne
end
local function i(e,t,a)
return T(ee,{
e,
t,
a,
})
end
local function s(t,e)
return i(t,e,W)
end
S(not u(e))
local function i(e,t,o,a)
return s(T(oe,{
o(e),
o(t),
}),T(oe,{
a(e),
a(t),
}))
end
if h(e)then
if not h(e)then
return W
end
return ne
elseif p(e)then
if not p(t)then
return W
end
if L(e,t)then
return ne
else
return W
end
elseif f(e)then
if not f(t)then
return W
end
return i(e,t,z,A)
elseif a(e)then
if not a(t)then
return W
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return W
end
return i(e,t,U,M)
end
return k()
end,
},
{
Ee,
2,
function(s,e,i)
local t={}
local e=r(e)
while a(e)do
l(t,o(e))
e=r(n(e))
end
if not h(e)then
return i()
end
return B(s,t)
end,
},
{
_e,
2,
function(e,a,t)
local e=fe(e)
if e==false then
return t()
end
return N(e,a)
end,
},
ue(Ce,p),
{
Ae,
1,
function(e,t)
e=q(e)
if u(e)then
return T(Ae,{e})
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
e=q(e)
if u(e)then
return T(ee,{
e,
o,
a,
})
end
if not f(e)then
return t()
end
local e=r(z(e))
if not p(e)then
return t()
end
if L(e,Je)then
return o
end
if L(e,Ie)then
return a
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
local u
u=c
t.equal_p=u
local function u(e,i)
if e==i then
return true
end
e=H(e)
i=H(i)
if e==i then
return true
end
local function s(e,t,o,a)
if u(o(e),o(t))and u(a(e),a(t))then
O(e,t)
return true
else
return false
end
end
if h(e)then
if not h(i)then
return false
end
O(e,v)
O(i,v)
return true
elseif p(e)then
if not p(i)then
return false
end
return L(e,i)
elseif a(e)then
if not a(i)then
return false
end
return s(e,i,o,n)
elseif g(e)then
if not g(i)then
return false
end
return s(e,i,U,M)
elseif f(e)then
if not f(i)then
return false
end
return s(e,i,z,A)
elseif Y(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif F(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return k()
end
t.simple_print=y
local function ee(te)
local R,g,c,u,f,r,A,z,J,k,W,Y,F,M,I,P,U,C,H,O,L,q,y,V,Q,ee
function c()
return#R==g
end
function u()
S(not c())
local e=string.sub(R,g+1,g+1)
g=g+1
return e
end
function f(e)
S(string.sub(R,g,g)==e)
g=g-1
end
function r(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function z()
if c()then
return false
end
local e=u()
if not A(e)then
f(e)
return false
end
while A(e)and not c()do
e=u()
end
if not A(e)then
f(e)
end
return true
end
function J()
if c()then
return false
end
local e=u()
local t=""
if not C(e)then
f(e)
return false
end
while C(e)and not c()do
t=tostring(t)..tostring(e)
e=u()
end
if C(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if st(t)then
return i(t)
else
return r("Not Symbol"..tostring(t))
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
local t=X()
local a=t
local function o(a)
local e=X()
K(t,s(a,e))
t=e
end
while true do
z()
if c()then
return r()
end
e=u()
if e==")"then
K(t,v)
return a
end
if e=="."then
z()
local o=H()
K(t,o)
z()
if c()then
return r()
end
e=u()
if e~=")"then
return r()
end
return a
end
f(e)
local e=H()
o(e)
end
end
function W()
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
return r()
end
if not a(e)then
return r()
end
return x(o(e),n(e))
end
function Y()
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
return r()
end
if not a(e)then
return r()
end
return D(o(e),n(e))
end
function C(e)
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
function H()
z()
local e={
k,
ee,
W,
Y,
F,
M,
I,
P,
U,
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
function L()
return not c()
end
function q(e)
O(L())
O(u()==e)
end
function y(t)
if t==nil then
t=false
end
local function a()
q("[")
local e=y()
q("]")
return e
end
local e
if t then
e={
k,
J,
a,
W,
Y,
F,
M,
I,
P,
U,
}
else
e={
k,
Q,
W,
Y,
F,
M,
I,
P,
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
return r()
end
function V(t)
if c()then
return t
end
local a=u()
if a=="."then
local a=y()
return e(m,e(d,e(t),w),a)
elseif a==":"then
local a=y()
return e(m,a,t)
elseif a=="~"then
return e(Z,t)
elseif a=="@"then
local a=y()
return e(m,e(d,s(t,w),w),a)
elseif a=="?"then
return e(m,d,e(Z,t))
elseif a=="/"then
local t={t}
while true do
local e=y(true)
l(t,e)
if c()then
break
end
local e=u()
if e~="/"then
f(e)
break
end
end
return e(ye,_(t))
else
f(a)
return t
end
end
function Q()
if c()then
return false
end
local t=u()
if t=="&"then
O(L())
local t=u()
if t=="+"then
local t=y()
return e(j,e(E,t))
else
f(t)
end
local t=y()
return e(j,t)
elseif t==":"then
O(L())
local t=u()
if t=="&"then
q(">")
local t=y()
return e(m,e(j,e(d,w,t)),G)
elseif t==">"then
local t=y()
return e(m,e(d,w,t),G)
else
f(t)
end
local t=y()
return e(m,t,G)
elseif t=="+"then
local t=y()
return e(E,t)
elseif t=="["then
local e=y()
q("]")
return V(e)
elseif t=="_"then
q(":")
local t=y()
return e(m,t,w)
else
f(t)
local e=J()
if e==false then
return false
end
return V(e)
end
end
function ee()
local e=Q()
if e==false then
return false
end
if p(e)then
return e
end
return b(e)
end
R=te
g=0
local function i(t,i)
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
return r()
end
if not a(e)then
return r()
end
local t=n(e)
if not(a(t)and h(n(t)))then
return r()
end
return i(o(e),o(t))
end
end
local function d(t,s)
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
return r()
end
if not a(e)then
return r()
end
local i=n(e)
if not a(i)then
return r()
end
local t=n(i)
if not(a(t)and h(n(t)))then
return r()
end
return s(o(e),o(i),o(t))
end
end
F=i("$",function(e,t)
local e=fe(e)
if e==false then
return r()
end
return N(e,t)
end)
M=i("%",function(e,t)
local t=pe(t,function(e)return e end,function(e,e)return r()end)
return T(e,t)
end)
I=d("@",function(t,o,e)
local a=pe(e,function(e)return e end,function(e,e)return r()end)
local e=fe(t)
if e==false then
return r()
end
return Te(e,o,a)
end)
P=i("^",function(t,e)
local e=pe(e,function(e)return e end,function(e,e)return r()end)
return B(t,e)
end)
U=i(";",function(e,t)return re(e,t)end)
return H()
end
t.complex_parse=ee
local function q(c)
local function i(r,l)
if p(r)then
return le(r)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=C(r)
if e~=false and#e==3 and u(e[1],m)then
local t=C(e[2])
if t~=false and#t==3 and u(t[1],d)then
local h=t[2]
local r=C(h)
if r~=false and#r==1 and u(t[3],w)then
return s(tostring(i(r[1],true)).."."..tostring(i(e[3],true)))
elseif a(h)and u(n(h),w)and u(t[3],w)then
return s(tostring(i(o(h),true)).."@"..tostring(i(e[3],true)))
elseif u(h,w)and u(e[3],G)then
return s(":>"..tostring(i(t[3],true)))
end
end
local a=C(e[3])
if u(e[2],d)and a~=false and#a==2 and u(a[1],Z)then
return s(tostring(i(a[2],true)).."?")
end
if t~=false and#t==2 and u(e[3],G)and u(t[1],j)then
local e=C(t[2])
if e~=false and#e==3 and u(e[1],d)and u(e[2],w)then
return s(":&>"..tostring(i(e[3],true)))
end
end
local t=u(e[3],w)and"_"or u(e[3],G)and""or i(e[3],true)
return s(tostring(t)..":"..tostring(i(e[2],true)))
elseif e~=false and#e==2 then
if u(e[1],j)then
local t=C(e[2])
if t~=false and#t==2 and u(t[1],E)then
return s("&+"..tostring(i(t[2],true)))
end
return s("&"..tostring(i(e[2],true)))
elseif u(e[1],Z)then
return s(tostring(i(e[2],true)).."~")
elseif u(e[1],E)then
return s("+"..tostring(i(e[2],true)))
elseif u(e[1],ye)then
local e=C(e[2])
if e~=false and#e>1 then
local a=i(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(i(e[t+1],true))
t=t+1
end
end
return s(a)
end
end
end
if l then
return y(r)
else
return y(b(r))
end
end
local e=ee(y(c))
local r=""
local d=""
if h(e)then
return"()"
elseif a(e)then
r="("
d=""
while a(e)do
r=tostring(r)..tostring(d)..tostring(q(o(e)))
d=" "
e=n(e)
end
if h(e)then
r=tostring(r)..")"
else
r=tostring(r).." . "..tostring(q(e))..")"
end
return r
elseif f(e)then
local a=z(e)
local t=A(e)
local e=C(t)
if e~=false and#e==2 and u(a,we)and u(e[1],E)then
return i(e[2],false)
end
return"#"..tostring(q(s(a,t)))
elseif g(e)then
return"!"..tostring(q(s(U(e),M(e))))
elseif p(e)then
return le(e)
elseif I(e)then
return";("..tostring(q(se(e))).." "..tostring(q(J(e)))..")"
elseif Y(e)then
return"$("..tostring(q(R(te(e)))).." "..tostring(q(ae(e)))..")"
elseif P(e)then
return"%("..tostring(q(ce(e))).." "..tostring(q(_(me(e))))..")"
elseif F(e)then
return"@("..tostring(q(R(qe(e)))).." "..tostring(q(je(e))).." "..tostring(q(_(ge(e))))..")"
elseif V(e)then
return"^("..tostring(q(xe(e))).." "..tostring(q(_(ve(e))))..")"
end
return k()
end
t.complex_print=q
local function y(h)
local r=X()
local a={function(e)return K(r,e)end}
local t=0
local function o()
error("MT parse ERROR")
end
local function u(e)
if not e then
return o()
end
end
local function d()
u(#h>t)
local e=string.sub(h,t+1,t+1)
t=t+1
return e
end
local n={}
while#a~=0 do
local t={}
for e=1,#a do
local a=a[e]
local e=d()
local i
i=function(i)
local o=X()
local e=X()
l(t,function(e)return K(o,e)end)
l(t,function(t)return K(e,t)end)
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
if vt(e)then
a(nt(e))
else
return o()
end
elseif e=="."then
i(s)
elseif e=="#"then
i(x)
elseif e=="!"then
i(D)
elseif e=="$"then
local e=false
local i=false
l(t,function(t)
e=t
end)
l(t,function(e)
i=e
end)
l(n,function()
if e==false or i==false then
return k()
else
local e=fe(e)
if e==false then
return o()
else
a(N(e,i))
end
end
end)
elseif e=="_"then
a(v)
else
return o()
end
end
a=t
end
u(t==#h)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return r
end
local function u(e)
local s={e}
local i=""
while#s~=0 do
local r={}
for e=1,#s do
local e=s[e]
e=H(e)
local t
t=function(e,o,a,t)
i=tostring(i)..tostring(o)
l(r,a(e))
l(r,t(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(de(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif h(e)then
i=tostring(i).."_"
elseif f(e)then
t(e,"#",z,A)
elseif g(e)then
t(e,"!",U,M)
elseif ze(e)then
local e=be(e)
t(e,"$",(function(e)return R(te(e))end),ae)
else
return k()
end
end
s=r
end
return i
end
t.machinetext_parse=y
t.machinetext_print=u
local function q(e)
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
while e[1]do
e=e[2]()
end
return e[2]
end
t.trampoline_return=q
t.trampoline_delay=l
t.run_trampoline=g
local k=b(s(ye,s(s(at,s(s(m,s(ot,s(w,v))),v)),v)))
local v=b(s(ye,s(s(at,s(ie,v)),v)))
local function j(t,a)
return x(v,e(t,a))
end
local function _(e)
return x(k,e)
end
local function m(p,y,u,w,s)
if s==nil then
s=false
end
local function b(e,e)
error("WIP")
end
u=r(u)
if f(u)then
local f=z(u)
local t=A(u)
if c(f,k)then
t=r(t)
if a(t)then
local e=o(t)
local t=r(n(t))
if h(t)then
if s==false then
local t=e
local a=w
local e
e=function()return p(t,a)end
return l(e)
else
local a
a=p
local t
t=y
local i=e
local o=w
local e
e=function()return m(a,t,B(s,i),o)end
return l(e)
end
end
end
elseif c(f,v)then
t=r(t)
if a(t)then
local u=o(t)
local t=r(n(t))
if a(t)then
local a=o(t)
local t=r(n(t))
if h(t)then
if s==false then
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
local n
n=p
local o
o=y
local u=u
local r=a
local h=w
local s=s
local a=i("序甲")
local t
t=function()return m(n,o,u,h,x(d,e(e(a),b(e(he(r),a),he(s)))))end
return l(t)
end
end
end
end
end
end
if s==false then
return l(function()return y(u,w,p)end)
else
return l(function()return y(u,w,function(t,e)return l(function()return m(p,y,B(s,{t}),e)end)end)end)
end
end
local function s(o,a,t,e)
return m(o,a,t,e)
end
local function n(e,a,o,i)
return g(m((function(a,t)return q(e(a,t))end),(function(e,o,t)return q(a(e,o,function(e,a)return g(t(e,a))end))end),o,i))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=k
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=_
t.run_monad_trampoline=s
t.run_monad_stackoverflow=n
return t