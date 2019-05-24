local function d(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local g,H,y,Ae,Ie,ye,fe,ue,ee,W,re,L,V,b,ve,ce,O,se,J,Ee,p,he,de,h,a,o,s,v,r,_,w,E,T,D,q,F,M,X,rt,S,Y,oe,ie,Ne,P,xe,qe,be,A,Q,we,me,K,G,ke,ge,U,Z,i,I,B,ut,z,l,j,We,ht,Ye,Le,De,Me,Fe,Ce,Qe,Oe,Ue,He,Se,te,Te,ze,ae,Re,st,ne,pe,dt,lt,C,x,e,N,je,u,n,k,Ke,Ge,_e,Ve,Xe,R,Be,Je,nt,c,Pe,it,tt,et,le,Ze,m,f,at,ot
function g()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return g()
end
end
function ce(e,t)
return{
b,
e,
t,
}
end
function O(e)
return e[1]==b
end
function se(e)
return e[2]
end
function J(e)
return e[3]
end
function Ee(e)
while O(e)do
e=J(e)
end
return e
end
function p(e)
return e[1]==Ae
end
function he(e)
return e[2]
end
function de(e)
return y()[he(e)]
end
function h(t,e)
return{
Ie,
t,
e,
}
end
function a(e)
return e[1]==Ie
end
function o(e)
return e[2]
end
function s(e)
return e[3]
end
function r(e)
return e[1]==ye
end
function _(t,e)
return{
fe,
t,
e,
}
end
function w(e)
return e[1]==fe
end
function E(e)
return e[2]
end
function T(e)
return e[3]
end
function D(e,t)
return{
ue,
e,
t,
}
end
function q(e)
return e[1]==ue
end
function F(e)
return e[2]
end
function M(e)
return e[3]
end
function X(e)
return e[1]==ee
end
function rt(e)
return e[2]
end
function S(t,e)
return{
W,
t,
e,
}
end
function Y(e)
return e[1]==W
end
function oe(e)
return e[2]
end
function ie(e)
return e[3]
end
function Ne(a,t,e)
return{
L,
a,
t,
e,
}
end
function P(e)
return e[1]==L
end
function xe(e)
return e[2]
end
function qe(e)
return e[3]
end
function be(e)
return e[4]
end
function A(e,t)
return{
re,
e,
t,
}
end
function Q(e)
return e[1]==re
end
function we(e)
return e[2]
end
function me(e)
return e[3]
end
function K(t,e)
return{
V,
t,
e,
}
end
function G(e)
return e[1]==V
end
function ke(e)
return e[2]
end
function ge(e)
return e[3]
end
function U(e)
local e=n(e)
local function t(e)
e[2]=U(e[2])
e[3]=U(e[3])
return e
end
if w(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function Z()
return{ve}
end
function i(e)
return e[1]==ve
end
function I(e,t)
if e==t then
return
end
e[1]=ee
e[2]=t
e[3]=false
e[4]=false
end
function B(t,e)
H(i(t))
H(not i(e))
local t=t
local e=e
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ut(t)
local e=Z()
B(e,t)
return e
end
function C(e,t)
if e==t then
return true
end
if he(e)==he(t)then
I(e,t)
return true
else
return false
end
end
function x(a)
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
return x(e)
end
function N(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
d(t,e)
e=rt(e)
end
for a=1,#t do
local t=t[a]
I(t,e)
end
return e
end
function je(e)
return Y(e)or P(e)or Q(e)or G(e)
end
function u(e)
return X(e)or je(e)
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
local e,l,s
function l(t)
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
function s(t)
l(t)
if u(t)then
d(a,e)
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
t[2]=true
return s(ht)
end
local function c()
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
while u(e)and t<32 do
d(a,e)
e=k(e)
t=t+1
end
end
while u(e)do
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[1]=true
if Y(e)then
return o()
elseif Q(e)then
local a=we(e)
local e=me(e)
local h={
Ye,
Le,
De,
Me,
Fe,
Ce,
Qe,
Oe,
Ue,
He,
Se,
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
H(t[2]==false)
local e=n(e[1],c(),t)
if t[2]then
return s(A(a,{e}))
else
return g()
end
end
if m(a,te)then
return o()
elseif m(a,Te)then
return o()
elseif m(a,ze)then
return o()
elseif m(a,ae)then
H(#e==3)
H(t[2]==false)
local a=n(e[1],c(),t)
if t[2]then
return s(A(ae,{
a,
e[2],
e[3],
}))
else
return g()
end
end
return g()
elseif P(e)then
return o()
elseif G(e)then
return o()
end
return g()
end
r[h]=true
d(a,e)
e=k(e)
end
return l(e)
end
function k(a)
local e=N(a)
local t
H(not X(e))
if Y(e)then
t=nt(oe(e),ie(e),a)
elseif P(e)then
t=et(xe(e),qe(e),be(e),a)
elseif Q(e)then
t=tt(we(e),me(e),a)
elseif G(e)then
t=it(ke(e),ge(e),a)
else
t=e
end
t=N(t)
I(e,t)
return t
end
function Ke(e)
while u(e)or O(e)do
e=n(Ee(e))
end
return e
end
function _e(a,o,i)
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
function Ve(t,a,o)
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
function Xe(t,a)
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
function R(o)
local a=v
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return _(We,e(a))
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
function Je(e,l,h,c)
local t={}
local i={}
local e=N(e)
local n=true
while true do
if r(e)then
return c(i,t)
elseif O(e)then
d(i,se(e))
e=J(e)
elseif a(e)then
d(t,o(e))
e=s(e)
elseif u(e)then
if n then
n=false
e=k(e)
else
return h()
end
else
return l()
end
end
end
function nt(h,t,l)
local i=k(t)
if u(i)then
return l
end
local t
t=function()return D(z,e(ne,e(ze,e(R(h),i))))end
if a(i)then
return Je(i,t,function()return l end,function(i,e)
if#i~=0 then
error("WIP")
end
if m(e[1],pe)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
d(a,e[t+1])
t=t+1
end
end
return Ne(h,o,a)
elseif m(e[1],dt)then
if#e==1 then
return t()
end
local i=n(S(h,e[2]))
if not w(i)then
return t()
end
local n=k(E(i))
if u(n)then
return l
end
if not p(n)then
return t()
end
if not C(n,j)then
return t()
end
local i=k(T(i))
if u(i)then
return l
end
if not a(i)then
return t()
end
local o=o(i)
local a=k(s(i))
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
d(a,e[t+1])
t=t+1
end
end
return K(o,a)
elseif m(e[1],ne)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
d(a,S(h,e[t+1]))
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
d(a,S(h,e[t+1]))
t=t+1
end
end
return K(o,a)
end
end)
elseif r(i)then
return i
elseif c(i)then
return Ve(h,i,t())
elseif q(i)then
return t()
end
return g()
end
function c(e)
return p(e)or w(e)
end
function it(d,i,m)
local t
t=function()return D(z,e(ne,e(Te,e(d,x(i)))))end
d=k(d)
if u(d)then
return m
end
if not w(d)then
return t()
end
local e=n(E(d))
if not(p(e)and C(e,l))then
return t()
end
local d=n(T(d))
if not a(d)then
return t()
end
local e=U(o(d))
local d=n(s(d))
if not(a(d)and r(n(s(d))))then
return t()
end
local l=o(d)
local d=Ge
local n=0
while not r(e)do
if c(e)then
local t=v
do
local e=#i-1
while e>=n do
t=h(i[e+1],t)
e=e-1
end
end
d=_e(d,e,t)
n=#i
e=v
elseif a(e)then
if n<#i then
local t=i[n+1]
n=n+1
d=_e(d,o(e),t)
e=s(e)
else
return t()
end
else
return t()
end
end
if#i~=n then
return t()
end
return S(d,l)
end
function tt(i,t,o)
local a
a=function()return D(z,e(ne,e(i,x(t))))end
for e=1,#Pe do
local e=Pe[e]
if m(i,e[1])then
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
return g()
end
end
return a()
end
function et(i,o,t,a)
local a
a=function()return D(z,e(pe,e(R(i),o,x(t))))end
if m(o,Re)then
if#t~=1 then
return a()
end
return t[1]
elseif m(o,st)then
if#t~=2 then
return a()
end
return Ze(i,t[1],t[2],a)
elseif m(o,lt)then
if#t~=2 then
return a()
end
return ce(t[1],S(i,t[2]))
end
return a()
end
function le(t)
return e(pe,Re,t)
end
function Ze(f,n,y,w)
n=U(n)
local i={}
local u=false
local t=n
while not r(t)do
if c(t)then
d(i,t)
u=true
t=v
elseif a(t)then
d(i,o(t))
t=s(t)
else
return w()
end
end
local a
if u then
a=x(i)
else
a=n
end
local t={}
Be(f,function(a,e)
do
local e=0
while e<#i do
if m(i[e+1],a)then
return
end
e=e+1
end
end
d(t,a)
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
a=h(le(Xe(f,t[e+1])),a)
e=e-1
end
end
return _(l,e(n,h(le(_(l,e(o,y))),a)))
end
function m(e,t)
if e==t then
return true
end
e=n(e)
t=n(t)
if e==t then
return true
end
local function i(e,t,o,a)
if m(o(e),o(t))and m(a(e),a(t))then
I(e,t)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
I(e,v)
I(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return C(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,F,M)
elseif w(e)then
if not w(t)then
return false
end
return i(e,t,E,T)
end
return g()
end
function f(e)
e=N(e)
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
e=N(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif w(e)then
return"#"..tostring(f(h(E(e),T(e))))
elseif q(e)then
return"!"..tostring(f(h(F(e),M(e))))
elseif p(e)then
return de(e)
elseif O(e)then
return";("..tostring(f(se(e))).." "..tostring(f(J(e)))..")"
elseif Y(e)then
return"$("..tostring(f(R(oe(e)))).." "..tostring(f(ie(e)))..")"
elseif Q(e)then
return"%("..tostring(f(we(e))).." "..tostring(f(x(me(e))))..")"
elseif P(e)then
return"@("..tostring(f(R(xe(e)))).." "..tostring(f(qe(e))).." "..tostring(f(x(be(e))))..")"
elseif G(e)then
return"^("..tostring(f(ke(e))).." "..tostring(f(x(ge(e))))..")"
end
return g()
end
function at()
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
local c
c=function()
local e=at()
c=function()return e end
return e
end
y=function()
local e=ot()
y=function()return e end
return e
end
Ae=0
Ie=1
ye=2
fe=3
ue=4
ee=5
W=6
re=7
L=8
V=9
b=11
ve=10
t.new_comment=ce
t.comment_p=O
t.comment_comment=se
t.comment_x=J
t.un_comment_all=Ee
local function nt(e)
return y()[e]~=nil
end
local function Xe(e)
return{
Ae,
e,
}
end
local function Je(e)
return c()[e]~=nil
end
local function i(e)
return Xe(c()[e])
end
t.can_new_symbol_p=Je
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=p
t.un_symbol=de
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=s
v={ye}
t.Null_V=Null_V
t.null_v=v
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=w
t.data_name=E
t.data_list=T
t.New_Error=New_Error
t.new_error=D
t.error_p=q
t.error_name=F
t.error_list=M
t.just_p=X
t.evaluate=S
t.apply=K
local function c(e)
local o=Ke(e)
local function i(e)
e[2]=U(e[2])
e[3]=U(e[3])
if O(e[2])or O(e[3])then
local t=ut(e)
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
if w(o)then
return i(o)
elseif q(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=U
t.force_uncomment_all_rec=c
z=i("太始初核")
local ve=i("符名")
l=i("化滅")
j=i("式形")
local yt=i("等同")
local pt=i("解算")
local V=i("特定其物")
local y=i("省略一物")
We=i("映表")
local ft=i("如若")
local c=i("一類何物")
local ee=i("是非")
local ye=i("其子")
local et=i("爻陽")
local Ze=i("爻陰")
local wt=i("引用")
local mt=i("應用")
local ct=i("間空")
local fe=i("連頸")
local re=i("構物")
local ue=i("謬誤")
local it=i("詞素")
local Ie=i("列序")
local ut=i("首始")
local rt=i("尾末")
local tt=i("之物")
local b=i("宇宙亡矣")
local ot=i("效應")
local at=i("註疏")
ht=D(z,e(b,y))
local function b(e)
return _(ve,h(z,h(e,v)))
end
local function Ae(t)
return b(e(c,e(l,y,t),V))
end
local function L(a,t)
return b(e(c,e(l,e(a),y),t))
end
local function W(t)
return b(e(c,l,e(ee,e(c,t,y))))
end
local ht=Ae(re)
Ye=L(re,ve)
Le=L(re,Ie)
De=W(re)
local vt=Ae(ue)
Me=L(ue,ve)
Fe=L(ue,Ie)
Ce=W(ue)
local bt=Ae(fe)
Qe=W(fe)
Oe=L(fe,ut)
Ue=L(fe,rt)
He=W(it)
Se=W(ct)
te=b(e(c,l,e(ee,yt)))
Te=b(e(c,e(l,h(l,y),y),mt))
ze=b(e(c,l,pt))
local Ae=L(Ie,e(c,tt,y))
ae=b(e(c,l,ft))
Re=b(e(c,j,wt))
st=b(e(c,e(j,e(l,y,l)),V))
ne=b(e(j,e(z,l)))
pe=b(e(j,e(z,j)))
dt=b(e(j,j))
local Ie=b(e(c,l,at))
lt=b(e(c,j,at))
local W=_(Ze,e())
local ue=_(et,e())
local function pe(e,n,i)
local t={}
while a(e)do
d(t,o(e))
e=s(e)
end
if r(e)then
return n(t)
end
return i(t,e)
end
local function L(e)
return pe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=L
t.new_list=e
local function ne(e)
while X(e)or O(e)do
e=N(Ee(e))
end
return e
end
t.un_just=N
t.un_just_comment_all=ne
t.delay_p=je
t.delay_just_p=u
local function Ee(e)
if Y(e)then
return e
elseif P(e)then
error("WIP")
elseif Q(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return g()
end
local function X(e)
return oe(Ee(e))
end
local function ne(e)
return ie(Ee(e))
end
t.delay_env=X
t.delay_x=ne
local function X(e)
return n(e)
end
local function ne(e)
if O(e)then
return J(e)
else
return k(e)
end
end
t.force_all=X
t.force1=k
t.force_uncomment1=ne
t.force_uncomment_all=Ke
Ge={}
local function ne(i)
i=n(i)
if not w(i)then
return false
end
local e=n(E(i))
if not p(e)then
return false
end
if not C(e,We)then
return false
end
e=n(T(i))
if not a(e)then
return false
end
if not r(n(s(e)))then
return false
end
local i={}
local h=n(o(e))
while not r(h)do
if not a(h)then
return false
end
local e=n(o(h))
h=n(s(h))
if not a(e)then
return false
end
local h=o(e)
e=n(s(e))
if not a(e)then
return false
end
local a=o(e)
if not r(n(s(e)))then
return false
end
local t=true
do
local e=0
while e<#i do
if m(i[(e+0)+1],h)then
i[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
d(i,h)
d(i,a)
end
end
return i
end
t.env_null_v=Ge
t.env_set=_e
t.env_get=Ve
t.env2val=R
t.env_foreach=Be
t.val2env=ne
local function re(t,a)
return{
t,
1,
function(e)
e=k(e)
if u(e)then
return A(t,{e})
end
if a(e)then
return ue
end
return W
end,
}
end
local function X(t,o,a)
return{
t,
1,
function(e,i)
e=k(e)
if u(e)then
return A(t,{e})
end
if o(e)then
return a(e)
end
return i()
end,
}
end
Pe={
re(De,w),
{
ht,
2,
_,
},
X(Ye,w,E),
X(Le,w,T),
re(Ce,q),
{
vt,
2,
D,
},
X(Me,q,F),
X(Fe,q,M),
re(Se,r),
{
bt,
2,
h,
},
re(Qe,a),
X(Oe,a,o),
X(Ue,a,s),
{
te,
2,
function(e,t,i)
if e==t then
return ue
end
e=k(e)
t=k(t)
if u(e)or u(t)then
return A(te,{
e,
t,
})
end
if e==t then
return ue
end
local function i(e,a,t)
return A(ae,{
e,
a,
t,
})
end
local function n(e,t)
return i(e,t,W)
end
H(not u(e))
local function i(o,a,t,e)
return n(A(te,{
t(o),
t(a),
}),A(te,{
e(o),
e(a),
}))
end
if r(e)then
if not r(e)then
return W
end
return ue
elseif p(e)then
if not p(t)then
return W
end
if C(e,t)then
return ue
else
return W
end
elseif w(e)then
if not w(t)then
return W
end
return i(e,t,E,T)
elseif a(e)then
if not a(t)then
return W
end
return i(e,t,o,s)
elseif q(e)then
if not q(t)then
return W
end
return i(e,t,F,M)
end
return g()
end,
},
{
Te,
2,
function(h,e,i)
local t={}
local e=n(e)
while a(e)do
d(t,o(e))
e=n(s(e))
end
if not r(e)then
return i()
end
return K(h,t)
end,
},
{
ze,
2,
function(e,t,a)
local e=ne(e)
if e==false then
return a()
end
return S(e,t)
end,
},
re(He,p),
{
Ae,
1,
function(e,t)
e=k(e)
if u(e)then
return A(Ae,{e})
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
e=k(e)
if u(e)then
return A(ae,{
e,
o,
a,
})
end
if not w(e)then
return t()
end
local e=n(E(e))
if not p(e)then
return t()
end
if C(e,et)then
return o
end
if C(e,Ze)then
return a
end
return t()
end,
},
{
Ie,
2,
ce,
},
}
t.equal_p=m
local function u(e,t)
if e==t then
return true
end
e=N(e)
t=N(t)
if e==t then
return true
end
local function i(t,e,o,a)
if u(o(t),o(e))and u(a(t),a(e))then
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
I(e,v)
I(t,v)
return true
elseif p(e)then
if not p(t)then
return false
end
return C(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,F,M)
elseif w(e)then
if not w(t)then
return false
end
return i(e,t,E,T)
elseif Y(e)then
error("WIP")
elseif Q(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return g()
end
local function k(e)
return f(U(e))
end
t.simple_print=f
t.simple_print_force_all_rec=k
local function X(te)
local W,g,m,u,f,n,T,O,Q,k,N,L,P,R,C,Y,U,F,I,E,M,q,w,J,G,X
function m()
return#W==g
end
function u()
H(not m())
local e=string.sub(W,g+1,g+1)
g=g+1
return e
end
function f(e)
H(string.sub(W,g,g)==e)
g=g-1
end
function n(e)
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
function Q()
if m()then
return false
end
local e=u()
local t=""
if not F(e)then
f(e)
return false
end
while F(e)and not m()do
t=tostring(t)..tostring(e)
e=u()
end
if F(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
if Je(t)then
return i(t)
else
return n("Not Symbol"..tostring(t))
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
local t=Z()
local a=t
local function o(a)
local e=Z()
B(t,h(a,e))
t=e
end
while true do
O()
if m()then
return n()
end
e=u()
if e==")"then
B(t,v)
return a
end
if e=="."then
O()
local o=I()
B(t,o)
O()
if m()then
return n()
end
e=u()
if e~=")"then
return n()
end
return a
end
f(e)
local e=I()
o(e)
end
end
function N()
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
return n()
end
if not a(e)then
return n()
end
return _(o(e),s(e))
end
function L()
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
return n()
end
if not a(e)then
return n()
end
return D(o(e),s(e))
end
function F(t)
if T(t)then
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
function I()
O()
local e={
k,
X,
N,
L,
P,
R,
C,
Y,
U,
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
function E(e)
if e==false then
return n()
end
return e
end
function M()
return not m()
end
function q(e)
E(M())
E(u()==e)
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
Q,
a,
N,
L,
P,
R,
C,
Y,
U,
}
else
e={
k,
G,
N,
L,
P,
R,
C,
Y,
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
return n()
end
function J(t)
if m()then
return t
end
local a=u()
if a=="."then
local a=w()
return e(c,e(l,e(t),y),a)
elseif a==":"then
local a=w()
return e(c,a,t)
elseif a=="~"then
return e(ee,t)
elseif a=="@"then
local a=w()
return e(c,e(l,h(t,y),y),a)
elseif a=="?"then
return e(c,l,e(ee,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
d(t,e)
if m()then
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
function G()
if m()then
return false
end
local t=u()
if t=="&"then
E(M())
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
E(M())
local t=u()
if t=="&"then
q(">")
local t=w()
return e(c,e(j,e(l,y,t)),V)
elseif t==">"then
local t=w()
return e(c,e(l,y,t),V)
else
f(t)
end
local t=w()
return e(c,t,V)
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
local e=Q()
if e==false then
return false
end
return J(e)
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
return b(e)
end
W=te
g=0
local function e(t,i)
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
return n()
end
if not a(e)then
return n()
end
local t=s(e)
if not(a(t)and r(s(t)))then
return n()
end
return i(o(e),o(t))
end
end
local function d(t,h)
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
return n()
end
if not a(e)then
return n()
end
local i=s(e)
if not a(i)then
return n()
end
local t=s(i)
if not(a(t)and r(s(t)))then
return n()
end
return h(o(e),o(i),o(t))
end
end
P=e("$",function(e,t)
local e=ne(e)
if e==false then
return n()
end
return S(e,t)
end)
R=e("%",function(t,e)
local e=pe(e,function(e)return e end,function(e,e)return n()end)
return A(t,e)
end)
C=d("@",function(a,o,e)
local t=pe(e,function(e)return e end,function(e,e)return n()end)
local e=ne(a)
if e==false then
return n()
end
return Ne(e,o,t)
end)
Y=e("^",function(t,e)
local e=pe(e,function(e)return e end,function(e,e)return n()end)
return K(t,e)
end)
U=e(";",function(e,t)return ce(e,t)end)
return I()
end
t.complex_parse=X
local function k(m)
local function i(h,d)
if p(h)then
return de(h)
end
local function n(e)
if d then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(h)
if e~=false and#e==3 and u(e[1],c)then
local t=L(e[2])
if t~=false and#t==3 and u(t[1],l)then
local h=t[2]
local r=L(h)
if r~=false and#r==1 and u(t[3],y)then
return n(tostring(i(r[1],true)).."."..tostring(i(e[3],true)))
elseif a(h)and u(s(h),y)and u(t[3],y)then
return n(tostring(i(o(h),true)).."@"..tostring(i(e[3],true)))
elseif u(h,y)and u(e[3],V)then
return n(":>"..tostring(i(t[3],true)))
end
end
local a=L(e[3])
if u(e[2],l)and a~=false and#a==2 and u(a[1],ee)then
return n(tostring(i(a[2],true)).."?")
end
if t~=false and#t==2 and u(e[3],V)and u(t[1],j)then
local e=L(t[2])
if e~=false and#e==3 and u(e[1],l)and u(e[2],y)then
return n(":&>"..tostring(i(e[3],true)))
end
end
local t=u(e[3],y)and"_"or u(e[3],V)and""or i(e[3],true)
return n(tostring(t)..":"..tostring(i(e[2],true)))
elseif e~=false and#e==2 then
if u(e[1],j)then
local t=L(e[2])
if t~=false and#t==2 and u(t[1],z)then
return n("&+"..tostring(i(t[2],true)))
end
return n("&"..tostring(i(e[2],true)))
elseif u(e[1],ee)then
return n(tostring(i(e[2],true)).."~")
elseif u(e[1],z)then
return n("+"..tostring(i(e[2],true)))
elseif u(e[1],ye)then
local e=L(e[2])
if e~=false and#e>1 then
local a=i(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(i(e[t+1],true))
t=t+1
end
end
return n(a)
end
end
end
if d then
return f(h)
else
return f(b(h))
end
end
local e=X(f(m))
local n=""
local d=""
if r(e)then
return"()"
elseif a(e)then
n="("
d=""
while a(e)do
n=tostring(n)..tostring(d)..tostring(k(o(e)))
d=" "
e=s(e)
end
if r(e)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(k(e))..")"
end
return n
elseif w(e)then
local a=E(e)
local t=T(e)
local e=L(t)
if e~=false and#e==2 and u(a,ve)and u(e[1],z)then
return i(e[2],false)
end
return"#"..tostring(k(h(a,t)))
elseif q(e)then
return"!"..tostring(k(h(F(e),M(e))))
elseif p(e)then
return de(e)
elseif O(e)then
return";("..tostring(k(se(e))).." "..tostring(k(J(e)))..")"
elseif Y(e)then
return"$("..tostring(k(R(oe(e)))).." "..tostring(k(ie(e)))..")"
elseif Q(e)then
return"%("..tostring(k(we(e))).." "..tostring(k(x(me(e))))..")"
elseif P(e)then
return"@("..tostring(k(R(xe(e)))).." "..tostring(k(qe(e))).." "..tostring(k(x(be(e))))..")"
elseif G(e)then
return"^("..tostring(k(ke(e))).." "..tostring(k(x(ge(e))))..")"
end
return g()
end
t.complex_print=k
local function f(n)
local r=Z()
local o={function(e)return B(r,e)end}
local t=0
local function i()
error("MT parse ERROR")
end
local function l(e)
if not e then
return i()
end
end
local function u()
l(#n>t)
local e=string.sub(n,t+1,t+1)
t=t+1
return e
end
local s={}
while#o~=0 do
local t={}
for e=1,#o do
local a=o[e]
local e=u()
local o
o=function(i)
local e=Z()
local o=Z()
d(t,function(t)return B(e,t)end)
d(t,function(e)return B(o,e)end)
a(i(e,o))
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
if nt(e)then
a(Xe(e))
else
return i()
end
elseif e=="."then
o(h)
elseif e=="#"then
o(_)
elseif e=="!"then
o(D)
elseif e=="$"then
local e=false
local o=false
d(t,function(t)
e=t
end)
d(t,function(e)
o=e
end)
d(s,function()
if e==false or o==false then
return g()
else
local e=ne(e)
if e==false then
return i()
else
a(S(e,o))
end
end
end)
elseif e=="_"then
a(v)
else
return i()
end
end
o=t
end
l(t==#n)
do
local e=#s-1
while e>=0 do
s[e+1]()
e=e-1
end
end
return r
end
local function u(e)
local n={e}
local i=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=N(e)
local t
t=function(e,o,a,t)
i=tostring(i)..tostring(o)
d(h,a(e))
d(h,t(e))
end
if p(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(he(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,s)
elseif r(e)then
i=tostring(i).."_"
elseif w(e)then
t(e,"#",E,T)
elseif q(e)then
t(e,"!",F,M)
elseif je(e)then
local e=Ee(e)
t(e,"$",(function(e)return R(oe(e))end),ie)
else
return g()
end
end
n=h
end
return i
end
t.machinetext_parse=f
t.machinetext_print=u
local function q(e)
return function()return{
false,
e,
}end
end
local function d(e)
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
t.trampoline_delay=d
t.run_trampoline=k
local g=b(h(ye,h(h(ot,h(h(c,h(tt,h(y,v))),v)),v)))
local v=b(h(ye,h(h(ot,h(fe,v)),v)))
local function j(a,t)
return _(v,e(a,t))
end
local function x(e)
return _(g,e)
end
local function p(c,f,u,y,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
u=n(u)
if w(u)then
local w=E(u)
local t=T(u)
if m(w,g)then
t=n(t)
if a(t)then
local e=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local a=e
local t=y
local e
e=function()return c(a,t)end
return d(e)
else
local a
a=c
local t
t=f
local o=e
local i=y
local e
e=function()return p(a,t,K(h,o),i)end
return d(e)
end
end
end
elseif m(w,v)then
t=n(t)
if a(t)then
local u=o(t)
local t=n(s(t))
if a(t)then
local a=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local e
e=c
local o
o=f
local n=u
local a=a
local i=y
local t
t=function()return p(e,o,n,i,a)end
return d(t)
else
local n
n=c
local o
o=f
local s=u
local r=a
local u=y
local h=h
local a=i("序甲")
local t
t=function()return p(n,o,s,u,_(l,e(e(a),b(e(le(r),a),le(h)))))end
return d(t)
end
end
end
end
end
end
if h==false then
return d(function()return f(u,y,c)end)
else
return d(function()return f(u,y,function(e,t)return d(function()return p(c,f,K(h,{e}),t)end)end)end)
end
end
local function i(a,e,t,o)
return p(a,e,t,o)
end
local function s(a,i,n,o)
return k(p((function(t,e)return q(a(t,e))end),(function(a,t,e)return q(i(a,t,function(a,t)return k(e(a,t))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=x
t.run_monad_trampoline=i
t.run_monad_stackoverflow=s
return t