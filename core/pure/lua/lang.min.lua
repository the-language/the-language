local function s(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,N,U,Je,Qe,Te,_e,We,De,ve,fe,ce,Ae,Z,ne,de,O,ue,Q,xe,g,R,le,h,a,i,n,b,d,_,y,T,A,H,j,W,M,G,mt,I,B,ee,te,Ye,P,ze,je,ge,E,K,he,se,F,J,ke,qe,w,V,o,c,Y,ct,z,l,q,Pe,ft,Le,Ce,He,Me,Ue,Be,Ve,Fe,Oe,Ie,Ne,X,pe,me,ae,Se,rt,oe,ie,ut,at,L,x,e,D,ye,m,be,p,v,r,Re,Ge,we,Ke,nt,S,Ze,it,tt,C,Xe,ot,ht,lt,re,dt,u,f,Ee,st,et
function k()
error("TheLanguage PANIC")
end
function N(e)
if not e then
return k()
end
end
function de(t,e)
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
function Q(e)
return e[3]
end
function xe(e)
while O(e)do
e=Q(e)
end
return e
end
function g(e)
return e[1]==Je
end
function R(e)
return e[2]
end
function le(e)
return U()[R(e)]
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
function W(e)
return e[2]
end
function M(e)
return e[3]
end
function G(e)
return e[1]==De
end
function mt(e)
return e[2]
end
function I(e,t)
return{
ve,
e,
t,
}
end
function B(e)
return e[1]==ve
end
function ee(e)
return e[2]
end
function te(e)
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
function P(e)
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
function K(e)
return e[1]==fe
end
function he(e)
return e[2]
end
function se(e)
return e[3]
end
function F(t,e)
return{
Ae,
t,
e,
}
end
function J(e)
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
function V()
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
function Y(e,a)
N(o(e))
N(not o(a))
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ct(t)
local e=V()
Y(e,t)
return e
end
function L(t,e)
if t==e then
return true
end
if R(t)==R(e)then
c(t,e)
return true
else
return false
end
end
function x(a)
local t=b
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
function D(e)
if not G(e)then
return e
end
local e=e
local t={}
while G(e)do
s(t,e)
e=mt(e)
end
for a=1,#t do
local t=t[a]
c(t,e)
end
return e
end
function ye(e)
return B(e)or P(e)or K(e)or J(e)
end
function m(e)
return G(e)or ye(e)
end
function be(e)
if B(e)then
return e
elseif P(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif J(e)then
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
return n(ft)
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
e=v(e)
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
if B(e)then
return o()
elseif K(e)then
local a=he(e)
local e=se(e)
local i={
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
local s=false
for e=1,#i do
local e=i[e]
if u(e,a)then
s=true
break
end
end
if s then
N(#e==1)
N(t[2]==false)
local e=p(e[1],d(),t)
if t[2]then
return n(E(a,{e}))
else
return k()
end
end
if u(a,X)then
return o()
elseif u(a,pe)then
return o()
elseif u(a,me)then
return o()
elseif u(a,ae)then
N(#e==3)
N(t[2]==false)
local a=p(e[1],d(),t)
if t[2]then
return n(E(ae,{
a,
e[2],
e[3],
}))
else
return k()
end
end
return k()
elseif P(e)then
return o()
elseif J(e)then
return o()
end
return k()
end
r[h]=true
s(a,e)
e=v(e)
end
return h(e)
end
function v(a)
local e=D(a)
local t
N(not G(e))
if B(e)then
t=tt(ee(e),te(e),a)
elseif P(e)then
t=lt(ze(e),je(e),ge(e),a)
elseif K(e)then
t=ht(he(e),se(e),a)
elseif J(e)then
t=ot(ke(e),qe(e),a)
else
t=e
end
t=D(t)
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
function we(a,o,i)
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
local a=b
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
local o={}
local h={}
local e=D(e)
local t=true
while true do
if d(e)then
return r(h,o)
elseif O(e)then
s(h,ue(e))
e=Q(e)
elseif a(e)then
s(o,i(e))
e=n(e)
elseif m(e)then
if t then
t=false
e=v(e)
else
return l()
end
else
return u()
end
end
end
function tt(h,t,l)
local o=v(t)
if m(o)then
return l
end
local t
t=function()return H(z,e(oe,e(me,e(S(h),o))))end
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
local r=r(I(h,e[2]))
if not y(r)then
return t()
end
local o=v(T(r))
if m(o)then
return l
end
if not g(o)then
return t()
end
if not L(o,q)then
return t()
end
local o=v(A(r))
if m(o)then
return l
end
if not a(o)then
return t()
end
local i=i(o)
local a=v(n(o))
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
return F(i,a)
elseif u(e[1],oe)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
s(a,I(h,e[t+1]))
t=t+1
end
end
return E(o,a)
else
local o=I(h,e[1])
local a={}
do
local t=1
while t<#e do
s(a,I(h,e[t+1]))
t=t+1
end
end
return F(o,a)
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
return g(e)or y(e)
end
function ot(o,s,u)
local t
t=function()return H(z,e(oe,e(pe,e(o,x(s)))))end
o=v(o)
if m(o)then
return u
end
if not y(o)then
return t()
end
local e=r(T(o))
if not(g(e)and L(e,l))then
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
local t=b
do
local e=#s-1
while e>=o do
t=h(s[e+1],t)
e=e-1
end
end
r=we(r,e,t)
o=#s
e=b
elseif a(e)then
if o<#s then
local t=s[o+1]
o=o+1
r=we(r,i(e),t)
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
return I(r,l)
end
function ht(i,t,o)
local a
a=function()return H(z,e(oe,e(i,x(t))))end
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
local a
a=function()return H(z,e(ie,e(S(i),o,x(t))))end
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
return de(t[1],I(i,t[2]))
end
return a()
end
function re(t)
return e(ie,Se,t)
end
function dt(m,r,f,y)
r=w(r)
local o={}
local c=false
local t=r
while not d(t)do
if C(t)then
s(o,t)
c=true
t=b
elseif a(t)then
s(o,i(t))
t=n(t)
else
return y()
end
end
local a
if c then
a=x(o)
else
a=r
end
local t={}
Ze(m,function(a,e)
do
local e=0
while e<#o do
if u(o[e+1],a)then
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
a=h(re(nt(m,t[e+1])),a)
e=e-1
end
end
return _(l,e(r,h(re(_(l,e(o,f))),a)))
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
c(t,b)
c(e,b)
return true
elseif g(t)then
if not g(e)then
return false
end
return L(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif j(t)then
if not j(e)then
return false
end
return o(t,e,W,M)
elseif y(t)then
if not y(e)then
return false
end
return o(t,e,T,A)
end
return k()
end
function f(e)
e=D(e)
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
e=D(n(e))
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
return"!"..tostring(f(h(W(e),M(e))))
elseif g(e)then
return le(e)
elseif O(e)then
return";("..tostring(f(ue(e))).." "..tostring(f(Q(e)))..")"
elseif B(e)then
return"$("..tostring(f(S(ee(e)))).." "..tostring(f(te(e)))..")"
elseif K(e)then
return"%("..tostring(f(he(e))).." "..tostring(f(x(se(e))))..")"
elseif P(e)then
return"@("..tostring(f(S(ze(e)))).." "..tostring(f(je(e))).." "..tostring(f(x(ge(e))))..")"
elseif J(e)then
return"^("..tostring(f(ke(e))).." "..tostring(f(x(qe(e))))..")"
end
return k()
end
function Ee(e)
local t={}
local h={}
for o=1,#e do
local e=e[o]
e=D(e)
local o
o=function(e,a,o,i)
s(t,a)
s(h,o(e))
s(h,i(e))
end
if g(e)then
s(t,"^")
s(t,R(e))
s(t,"^")
elseif a(e)then
o(e,".",i,n)
elseif d(e)then
s(t,"_")
elseif y(e)then
o(e,"#",T,A)
elseif j(e)then
o(e,"!",W,M)
elseif ye(e)then
local e=be(e)
o(e,"$",(function(e)return S(ee(e))end),te)
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
local c
c=function()
local e=st()
c=function()return e end
return e
end
U=function()
local e=et()
U=function()return e end
return e
end
Je=0
Qe=1
Te=2
_e=3
We=4
De=5
ve=6
fe=7
ce=8
Ae=9
Z=11
ne=10
t.new_comment=de
t.comment_p=O
t.comment_comment=ue
t.comment_x=Q
t.un_comment_all=xe
local function wt(e)
return U()[e]~=nil
end
local function Qe(e)
return{
Je,
e,
}
end
local function De(e)
return c()[e]~=nil
end
local function o(e)
return Qe(c()[e])
end
t.can_new_symbol_p=De
t.New_Symbol=New_Symbol
t.new_symbol=o
t.symbol_p=g
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
b={Te}
t.Null_V=Null_V
t.null_v=b
t.null_p=d
t.New_Data=New_Data
t.new_data=_
t.data_p=y
t.data_name=T
t.data_list=A
t.New_Error=New_Error
t.new_error=H
t.error_p=j
t.error_name=W
t.error_list=M
t.just_p=G
t.evaluate=I
t.apply=F
local function c(e)
local o=Re(e)
local function i(e)
e[2]=w(e[2])
e[3]=w(e[3])
if O(e[2])or O(e[3])then
local t=ct(e)
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
local U=o("特定其物")
local w=o("省略一物")
Pe=o("映表")
local vt=o("如若")
local c=o("一類何物")
local Z=o("是非")
local fe=o("其子")
local We=o("爻陽")
local Je=o("爻陰")
local mt=o("引用")
local ct=o("應用")
local lt=o("間空")
local ne=o("連頸")
local ve=o("構物")
local _e=o("謬誤")
local ht=o("詞素")
local Te=o("列序")
local st=o("首始")
local dt=o("尾末")
local et=o("之物")
local p=o("宇宙亡矣")
local tt=o("效應")
local ot=o("註疏")
ft=H(z,e(p,w))
local function p(e)
return _(ce,h(z,h(e,b)))
end
local function Ae(t)
return p(e(c,e(l,w,t),U))
end
local function R(a,t)
return p(e(c,e(l,e(a),w),t))
end
local function C(t)
return p(e(c,l,e(Z,e(c,t,w))))
end
local it=Ae(ve)
Le=R(ve,ce)
Ce=R(ve,Te)
He=C(ve)
local nt=Ae(_e)
Me=R(_e,ce)
Ue=R(_e,Te)
Be=C(_e)
local Ae=Ae(ne)
Ve=C(ne)
Fe=R(ne,st)
Oe=R(ne,dt)
Ie=C(ht)
Ne=C(lt)
X=p(e(c,l,e(Z,pt)))
pe=p(e(c,e(l,h(l,w),w),ct))
me=p(e(c,l,yt))
local _e=R(Te,e(c,et,w))
ae=p(e(c,l,vt))
Se=p(e(c,q,mt))
rt=p(e(c,e(q,e(l,w,l)),U))
oe=p(e(q,e(z,l)))
ie=p(e(q,e(z,q)))
ut=p(e(q,q))
local Te=p(e(c,l,ot))
at=p(e(c,q,ot))
local C=_(Je,e())
local oe=_(We,e())
local function ve(e,o,h)
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
local function R(e)
return ve(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=R
t.new_list=e
local function ie(e)
while G(e)or O(e)do
e=D(xe(e))
end
return e
end
t.un_just_all=D
t.un_just_comment_all=ie
t.delay_p=ye
t.delay_just_p=m
local function D(e)
return ee(be(e))
end
local function G(e)
return te(be(e))
end
t.delay_env=D
t.delay_x=G
local function D(e)
if O(e)then
return Q(e)
else
return v(e)
end
end
t.force_all=r
t.force1=v
t.force_uncomment1=D
t.force_uncomment_all=Re
Ge={}
local function G(o)
o=r(o)
if not y(o)then
return false
end
local e=r(T(o))
if not g(e)then
return false
end
if not L(e,Pe)then
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
t.env_set=we
t.env_get=Ke
t.env2val=S
t.env_foreach=Ze
t.val2env=G
local function ie(t,a)
return{
t,
1,
function(e)
e=v(e)
if m(e)then
return E(t,{e})
end
if a(e)then
return oe
end
return C
end,
}
end
local function D(t,a,o)
return{
t,
1,
function(e,i)
e=v(e)
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
ie(He,y),
{
it,
2,
_,
},
D(Le,y,T),
D(Ce,y,A),
ie(Be,j),
{
nt,
2,
H,
},
D(Me,j,W),
D(Ue,j,M),
ie(Ne,d),
{
Ae,
2,
h,
},
ie(Ve,a),
D(Fe,a,i),
D(Oe,a,n),
{
X,
2,
function(e,t,o)
if e==t then
return oe
end
e=v(e)
t=v(t)
if m(e)or m(t)then
return E(X,{
e,
t,
})
end
if e==t then
return oe
end
local function o(e,t,a)
return E(ae,{
e,
t,
a,
})
end
local function s(e,t)
return o(e,t,C)
end
N(not m(e))
local function o(e,t,a,o)
return s(E(X,{
a(e),
a(t),
}),E(X,{
o(e),
o(t),
}))
end
if d(e)then
if not d(e)then
return C
end
return oe
elseif g(e)then
if not g(t)then
return C
end
if L(e,t)then
return oe
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
return o(e,t,W,M)
end
return k()
end,
},
{
pe,
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
return F(h,t)
end,
},
{
me,
2,
function(e,a,t)
local e=G(e)
if e==false then
return t()
end
return I(e,a)
end,
},
ie(Ie,g),
{
_e,
1,
function(e,t)
e=v(e)
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
ae,
3,
function(e,a,o,t)
e=v(e)
if m(e)then
return E(ae,{
e,
a,
o,
})
end
if not y(e)then
return t()
end
local e=r(T(e))
if not g(e)then
return t()
end
if L(e,We)then
return a
end
if L(e,Je)then
return o
end
return t()
end,
},
{
Te,
2,
de,
},
}
local m
m=u
t.equal_p=m
local function m(a,e)
local o={a}
local a={e}
while#o~=0 do
local t,s=unpack(Ee(o))
local i,n=unpack(Ee(a))
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
o=s
a=n
end
return#a==0
end
t.simple_print=f
local function ae(ae)
local P,v,m,u,f,r,T,O,ee,k,B,W,Q,S,K,M,D,R,C,A,L,j,y,X,J,te
function m()
return#P==v
end
function u()
N(not m())
local e=string.sub(P,v+1,v+1)
v=v+1
return e
end
function f(e)
N(string.sub(P,v,v)==e)
v=v-1
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
function O()
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
function ee()
if m()then
return false
end
local e=u()
local t=""
if not R(e)then
f(e)
return false
end
while R(e)and not m()do
t=tostring(t)..tostring(e)
e=u()
end
if R(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if De(t)then
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
local t=V()
local a=t
local function o(a)
local e=V()
Y(t,h(a,e))
t=e
end
while true do
O()
if m()then
return r()
end
e=u()
if e==")"then
Y(t,b)
return a
end
if e=="."then
O()
local o=C()
Y(t,o)
O()
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
local e=C()
o(e)
end
end
function B()
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
function R(e)
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
function C()
O()
local e={
k,
te,
B,
W,
Q,
S,
K,
M,
D,
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
function A(e)
if e==false then
return r()
end
return e
end
function L()
return not m()
end
function j(e)
A(L())
A(u()==e)
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
ee,
a,
B,
W,
Q,
S,
K,
M,
D,
}
else
e={
k,
J,
B,
W,
Q,
S,
K,
M,
D,
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
function X(t)
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
return e(fe,x(t))
else
f(a)
return t
end
end
function J()
if m()then
return false
end
local t=u()
if t=="&"then
A(L())
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
A(L())
local t=u()
if t=="&"then
j(">")
local t=y()
return e(c,e(q,e(l,w,t)),U)
elseif t==">"then
local t=y()
return e(c,e(l,w,t),U)
else
f(t)
end
local t=y()
return e(c,t,U)
elseif t=="+"then
local t=y()
return e(z,t)
elseif t=="["then
local e=y()
j("]")
return X(e)
elseif t=="_"then
j(":")
local t=y()
return e(c,t,w)
else
f(t)
local e=ee()
if e==false then
return false
end
return X(e)
end
end
function te()
local e=J()
if e==false then
return false
end
if g(e)then
return e
end
return p(e)
end
P=ae
v=0
local function o(t,o)
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
Q=o("$",function(e,t)
local e=G(e)
if e==false then
return r()
end
return I(e,t)
end)
S=o("%",function(t,e)
local e=ve(e,function(e)return e end,function(e,e)return r()end)
return E(t,e)
end)
K=s("@",function(e,a,t)
local t=ve(t,function(e)return e end,function(e,e)return r()end)
local e=G(e)
if e==false then
return r()
end
return Ye(e,a,t)
end)
M=o("^",function(e,t)
local t=ve(t,function(e)return e end,function(e,e)return r()end)
return F(e,t)
end)
D=o(";",function(e,t)return de(e,t)end)
return C()
end
t.complex_parse=ae
local function v(u)
local function o(r,d)
if g(r)then
return le(r)
end
local function s(e)
if d then
return"["..tostring(e).."]"
else
return e
end
end
local e=R(r)
if e~=false and#e==3 and m(e[1],c)then
local t=R(e[2])
if t~=false and#t==3 and m(t[1],l)then
local h=t[2]
local r=R(h)
if r~=false and#r==1 and m(t[3],w)then
return s(tostring(o(r[1],true)).."."..tostring(o(e[3],true)))
elseif a(h)and m(n(h),w)and m(t[3],w)then
return s(tostring(o(i(h),true)).."@"..tostring(o(e[3],true)))
elseif m(h,w)and m(e[3],U)then
return s(":>"..tostring(o(t[3],true)))
end
end
local a=R(e[3])
if m(e[2],l)and a~=false and#a==2 and m(a[1],Z)then
return s(tostring(o(a[2],true)).."?")
end
if t~=false and#t==2 and m(e[3],U)and m(t[1],q)then
local e=R(t[2])
if e~=false and#e==3 and m(e[1],l)and m(e[2],w)then
return s(":&>"..tostring(o(e[3],true)))
end
end
local t=m(e[3],w)and"_"or m(e[3],U)and""or o(e[3],true)
return s(tostring(t)..":"..tostring(o(e[2],true)))
elseif e~=false and#e==2 then
if m(e[1],q)then
local t=R(e[2])
if t~=false and#t==2 and m(t[1],z)then
return s("&+"..tostring(o(t[2],true)))
end
return s("&"..tostring(o(e[2],true)))
elseif m(e[1],Z)then
return s(tostring(o(e[2],true)).."~")
elseif m(e[1],z)then
return s("+"..tostring(o(e[2],true)))
elseif m(e[1],fe)then
local e=R(e[2])
if e~=false and#e>1 then
local a=o(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(o(e[t+1],true))
t=t+1
end
end
return s(a)
end
end
end
if d then
return f(r)
else
return f(p(r))
end
end
local e=ae(f(u))
local s=""
local r=""
if d(e)then
return"()"
elseif a(e)then
s="("
r=""
while a(e)do
s=tostring(s)..tostring(r)..tostring(v(i(e)))
r=" "
e=n(e)
end
if d(e)then
s=tostring(s)..")"
else
s=tostring(s).." . "..tostring(v(e))..")"
end
return s
elseif y(e)then
local t=T(e)
local a=A(e)
local e=R(a)
if e~=false and#e==2 and m(t,ce)and m(e[1],z)then
return o(e[2],false)
end
return"#"..tostring(v(h(t,a)))
elseif j(e)then
return"!"..tostring(v(h(W(e),M(e))))
elseif g(e)then
return le(e)
elseif O(e)then
return";("..tostring(v(ue(e))).." "..tostring(v(Q(e)))..")"
elseif B(e)then
return"$("..tostring(v(S(ee(e)))).." "..tostring(v(te(e)))..")"
elseif K(e)then
return"%("..tostring(v(he(e))).." "..tostring(v(x(se(e))))..")"
elseif P(e)then
return"@("..tostring(v(S(ze(e)))).." "..tostring(v(je(e))).." "..tostring(v(x(ge(e))))..")"
elseif J(e)then
return"^("..tostring(v(ke(e))).." "..tostring(v(x(qe(e))))..")"
end
return k()
end
t.complex_print=v
local function m(n)
local d=V()
local o={function(e)return Y(d,e)end}
local e=0
local function a()
error("MT parse ERROR")
end
local function l(e)
if not e then
return a()
end
end
local function u()
l(#n>e)
local t=string.sub(n,e+1,e+1)
e=e+1
return t
end
local r={}
while#o~=0 do
local t={}
for e=1,#o do
local o=o[e]
local e=u()
local i
i=function(i)
local a=V()
local e=V()
s(t,function(e)return Y(a,e)end)
s(t,function(t)return Y(e,t)end)
o(i(a,e))
end
if e=="^"then
local e=""
while true do
local t=u()
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
local i=false
local e=false
s(t,function(e)
i=e
end)
s(t,function(t)
e=t
end)
s(r,function()
if i==false or e==false then
return k()
else
local t=G(i)
if t==false then
return a()
else
o(I(t,e))
end
end
end)
elseif e=="_"then
o(b)
else
return a()
end
end
o=t
end
l(e==#n)
do
local e=#r-1
while e>=0 do
r[e+1]()
e=e-1
end
end
return d
end
local function s(e)
local a={e}
local e=""
while#a~=0 do
local t,o=unpack(Ee(a))
for o=1,#t do
local t=t[o]
e=tostring(e)..tostring(t)
end
a=o
end
return e
end
t.machinetext_parse=m
t.machinetext_print=s
local function k(e)
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
local function q(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
t.trampoline_return=k
t.trampoline_delay=m
t.run_trampoline=q
local g=p(h(fe,h(h(tt,h(h(c,h(et,h(w,b))),b)),b)))
local v=p(h(fe,h(h(tt,h(ne,b)),b)))
local function x(a,t)
return _(v,e(a,t))
end
local function j(e)
return _(g,e)
end
local function f(c,w,h,p,s)
if s==nil then
s=false
end
local function b(e,e)
error("WIP")
end
h=r(h)
if y(h)then
local y=T(h)
local t=A(h)
if u(y,g)then
t=r(t)
if a(t)then
local o=i(t)
local e=r(n(t))
if d(e)then
if s==false then
local t=o
local a=p
local e
e=function()return c(t,a)end
return m(e)
else
local t
t=c
local a
a=w
local o=o
local i=p
local e
e=function()return f(t,a,F(s,o),i)end
return m(e)
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
local t
t=c
local e
e=w
local o=h
local i=i
local n=p
local a
a=function()return f(t,e,o,n,i)end
return m(a)
else
local t
t=c
local a
a=w
local h=h
local r=i
local n=p
local s=s
local o=o("序甲")
local i
i=function()return f(t,a,h,n,_(l,e(e(o),b(e(re(r),o),re(s)))))end
return m(i)
end
end
end
end
end
end
if s==false then
return m(function()return w(h,p,c)end)
else
return m(function()return w(h,p,function(t,e)return m(function()return f(c,w,F(s,{t}),e)end)end)end)
end
end
local function s(e,t,a,o)
return f(e,t,a,o)
end
local function e(a,n,o,i)
return q(f((function(e,t)return k(a(e,t))end),(function(a,t,e)return k(n(a,t,function(t,a)return q(e(t,a))end))end),o,i))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=x
t.new_effect_return=j
t.run_monad_trampoline=s
t.run_monad_stackoverflow=e
return t