function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,H,f,B,Z,Ae,Te,pe,D,ue,we,de,ne,ve,Qe,fe,O,me,ye,y,ce,le,h,a,o,s,p,r,_,m,z,T,N,g,U,M,X,i,I,K,ae,oe,Ke,P,qe,je,ze,E,Y,se,he,W,F,Ee,_e,C,J,u,A,G,Je,j,d,q,Le,Ze,De,Ce,Fe,Me,Ue,Ie,Oe,Ne,Se,He,Ge,ie,xe,re,te,Re,We,ee,V,Xe,et,L,x,e,R,ge,l,n,b,Pe,ke,be,Ye,st,S,Ve,nt,v,Be,rt,ht,it,Q,tt,c,w,at,ot
function k()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return k()
end
end
function fe(e,t)
return{
ve,
e,
t,
}
end
function O(e)
return e[0+1]==ve
end
function me(e)
return e[2+1]
end
function ye(e)
while O(e)do
e=me(e)
end
return e
end
function y(e)
return e[0+1]==B
end
function ce(e)
return e[1+1]
end
function le(e)
return f()[ce(e)]
end
function h(e,t)
return{
Z,
e,
t,
}
end
function a(e)
return e[0+1]==Z
end
function o(e)
return e[1+1]
end
function s(e)
return e[2+1]
end
function r(e)
return e[0+1]==Ae
end
function _(t,e)
return{
Te,
t,
e,
}
end
function m(e)
return e[0+1]==Te
end
function z(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function N(e,t)
return{
pe,
e,
t,
}
end
function g(e)
return e[0+1]==pe
end
function U(e)
return e[1+1]
end
function M(e)
return e[2+1]
end
function X(e)
return e[0+1]==D
end
function i(e)
return e[1+1]
end
function I(t,e)
return{
ue,
t,
e,
}
end
function K(e)
return e[0+1]==ue
end
function ae(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function Ke(e,a,t)
return{
de,
e,
a,
t,
}
end
function P(e)
return e[0+1]==de
end
function qe(e)
return e[1+1]
end
function je(e)
return e[2+1]
end
function ze(e)
return e[3+1]
end
function E(t,e)
return{
we,
t,
e,
}
end
function Y(e)
return e[0+1]==we
end
function se(e)
return e[1+1]
end
function he(e)
return e[2+1]
end
function W(e,t)
return{
ne,
e,
t,
}
end
function F(e)
return e[0+1]==ne
end
function Ee(e)
return e[1+1]
end
function _e(e)
return e[2+1]
end
function C(e)
local e=n(e)
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
elseif O(e)then
return t(e)
end
return e
end
function J()
return{Qe}
end
function u(e)
return e[0+1]==Qe
end
function A(e,t)
if e==t then
return
end
e[0+1]=D
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function G(e,a)
H(u(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function Je(t)
local e=J()
G(e,t)
return e
end
function L(e,t)
if e==t then
return true
end
if ce(e)==ce(t)then
A(e,t)
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
function R(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
__TS__ArrayPush(t,e)
e=i(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function ge(e)
return K(e)or P(e)or Y(e)or F(e)
end
function l(e)
return X(e)or ge(e)
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
local e,h,s
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
function s(t)
h(t)
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
return s(Ze)
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
e=b(e)
t=t+1
end
end
while l(e)do
local h=w(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if K(e)then
return o()
elseif Y(e)then
local a=se(e)
local e=he(e)
local h={
De,
Ce,
Fe,
Me,
Ue,
Ie,
Oe,
Ne,
Se,
He,
Ge,
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
H(#e==1)
H(t[1+1]==false)
local e=n(e[0+1],d(),t)
if t[1+1]then
return s(E(a,{e}))
else
return k()
end
end
if c(a,ie)then
return o()
elseif c(a,xe)then
return o()
elseif c(a,re)then
return o()
elseif c(a,te)then
H(#e==3)
H(t[1+1]==false)
local a=n(e[0+1],d(),t)
if t[1+1]then
return s(E(te,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif P(e)then
return o()
elseif F(e)then
return o()
end
return k()
end
r[h]=true
__TS__ArrayPush(a,e)
e=b(e)
end
return h(e)
end
function b(a)
local e=R(a)
local t
H(not X(e))
if K(e)then
t=nt(ae(e),oe(e),a)
elseif P(e)then
t=it(qe(e),je(e),ze(e),a)
elseif Y(e)then
t=ht(se(e),he(e),a)
elseif F(e)then
t=rt(Ee(e),_e(e),a)
else
t=e
end
t=R(t)
A(e,t)
return t
end
function Pe(e)
while l(e)or O(e)do
e=n(ye(e))
end
return e
end
function be(a,o,i)
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
function st(t,a)
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
function S(a)
local o=p
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Le,e(o))
end
function Ve(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function nt(h,t,d)
local i=b(t)
if l(i)then
return d
end
local t=N(j,e(ee,e(re,e(S(h),i))))
if a(i)then
local e={}
local i=i
while not r(i)do
if l(i)then
return d
elseif a(i)then
__TS__ArrayPush(e,o(i))
i=b(s(i))
else
return t
end
end
if c(e[0+1],V)then
if#e==1 then
return t
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
return Ke(h,o,a)
elseif c(e[0+1],Xe)then
if#e==1 then
return t
end
local i=n(I(h,e[1+1]))
if not m(i)then
return t
end
local n=b(z(i))
if l(n)then
return d
end
if not y(n)then
return t
end
if not L(n,q)then
return t
end
local i=b(T(i))
if l(i)then
return d
end
if not a(i)then
return t
end
local o=o(i)
local a=b(s(i))
if l(a)then
return d
end
if not r(a)then
return t
end
local a={S(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return W(o,a)
elseif c(e[0+1],ee)then
if#e==1 then
return t
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,I(h,e[t+1]))
t=t+1
end
end
return E(o,a)
else
local o=I(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,I(h,e[t+1]))
t=t+1
end
end
return W(o,a)
end
elseif r(i)then
return i
elseif v(i)then
return Ye(h,i,t)
elseif g(i)then
return t
end
return k()
end
function v(e)
return y(e)or m(e)
end
function rt(t,i,c)
local function u()
return N(j,e(ee,e(xe,e(t,x(i)))))
end
t=b(t)
if l(t)then
return c
end
if not m(t)then
return u()
end
local e=n(z(t))
if not(y(e)and L(e,d))then
return u()
end
local t=n(T(t))
if not a(t)then
return u()
end
local e=C(o(t))
local t=n(s(t))
if not(a(t)and r(n(s(t))))then
return u()
end
local d=o(t)
local n=ke
local t=0
while not r(e)do
if v(e)then
local a=p
do
local e=#i-1
while e>=t do
a=h(i[e+1],a)
e=e-1
end
end
n=be(n,e,a)
t=#i
e=p
elseif a(e)then
if t<#i then
local a=i[t+1]
t=t+1
n=be(n,o(e),a)
e=s(e)
else
return u()
end
else
return u()
end
end
if#i~=t then
return u()
end
return I(n,d)
end
function ht(i,t,o)
local a=N(j,e(ee,e(i,x(t))))
for e=1,#Be do
local e=Be[e]
if c(i,e[0+1])then
if#t~=e[1+1]then
return a
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
return a
end
function it(o,a,t,i)
local e=N(j,e(V,e(S(o),a,x(t))))
if c(a,Re)then
if#t~=1 then
return e
end
return t[0+1]
elseif c(a,We)then
if#t~=2 then
return e
end
return tt(o,t[0+1],t[1+1],e)
elseif c(a,et)then
if#t~=2 then
return e
end
return fe(t[0+1],I(o,t[1+1]))
end
return e
end
function Q(t)
return e(V,Re,t)
end
function tt(l,i,u,t)
if t==nil then
t=false
end
local function f()
if t==false then
return N(j,e(V,e(S(l),We,x({
i,
u,
}))))
else
return t
end
end
i=C(i)
local n={}
local m=false
local t=i
while not r(t)do
if v(t)then
__TS__ArrayPush(n,t)
m=true
t=p
elseif a(t)then
__TS__ArrayPush(n,o(t))
t=s(t)
else
return f()
end
end
local o=i
if m then
o=x(n)
end
local t={}
Ve(l,function(a,e)
do
local e=0
while e<#n do
if c(n[e+1],a)then
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
o=h(Q(st(l,t[e+1])),o)
e=e-1
end
end
return _(d,e(i,h(Q(_(d,e(a,u))),o)))
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
local function i(t,e,o,a)
if c(o(t),o(e))and c(a(t),a(e))then
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
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,M)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,z,T)
end
return k()
end
function w(e)
e=R(e)
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
e=R(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(z(e),T(e))))
elseif g(e)then
return"!"..tostring(w(h(U(e),M(e))))
elseif y(e)then
return le(e)
elseif O(e)then
elseif K(e)then
return"$("..tostring(w(S(ae(e)))).." "..tostring(w(oe(e)))..")"
elseif Y(e)then
return"%("..tostring(w(se(e))).." "..tostring(w(x(he(e))))..")"
elseif P(e)then
return"@("..tostring(w(S(qe(e)))).." "..tostring(w(je(e))).." "..tostring(w(x(ze(e))))..")"
elseif F(e)then
return"^("..tostring(w(Ee(e))).." "..tostring(w(x(_e(e))))..")"
end
return k()
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
local u
u=function()
local e=at()
u=function()return e end
return e
end
f=function()
local e=ot()
f=function()return e end
return e
end
B=0
Z=1
Ae=2
Te=3
pe=4
D=5
ue=6
we=7
de=8
ne=9
ve=11
Qe=10
local function tt(e)
return e[1+1]
end
t.new_comment=fe
t.comment_p=O
t.comment_comment=tt
t.comment_x=me
t.un_comment_all=ye
local function vt(e)
return f()[e]~=nil
end
local function st(e)
return{
B,
e,
}
end
local function ot(e)
return u()[e]~=nil
end
local function i(e)
return st(u()[e])
end
t.can_new_symbol_p=ot
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=y
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=s
p={Ae}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=m
t.data_name=z
t.data_list=T
t.New_Error=New_Error
t.new_error=N
t.error_p=g
t.error_name=U
t.error_list=M
t.just_p=X
t.evaluate=I
t.apply=W
local function u(e)
local o=Pe(e)
local function i(e)
e[1+1]=C(e[1+1])
e[2+1]=C(e[2+1])
if O(e[1+1])or O(e[2+1])then
local t=Je(e)
local a=e[1+1]
local o=e[2+1]
local e=u(a)
local a=u(o)
t[1+1]=e
t[2+1]=a
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
j=i("太始初核")
local ve=i("符名")
d=i("化滅")
q=i("式形")
local dt=i("等同")
local ht=i("解算")
local B=i("特定其物")
local f=i("省略一物")
Le=i("映表")
local rt=i("如若")
local u=i("一類何物")
local Z=i("是非")
local pe=i("其子")
local nt=i("爻陽")
local it=i("爻陰")
local ft=i("引用")
local ut=i("應用")
local wt=i("間空")
local de=i("連頸")
local ue=i("構物")
local we=i("謬誤")
local lt=i("詞素")
local Ae=i("列序")
local yt=i("首始")
local pt=i("尾末")
local Je=i("之物")
local v=i("宇宙亡矣")
local at=i("效應")
local Qe=i("註疏")
Ze=N(j,e(v,f))
local function v(e)
return _(ve,h(j,h(e,p)))
end
local function Te(t)
return v(e(u,e(d,f,t),B))
end
local function D(a,t)
return v(e(u,e(d,e(a),f),t))
end
local function ne(t)
return v(e(u,d,e(Z,e(u,t,f))))
end
local ct=Te(ue)
De=D(ue,ve)
Ce=D(ue,Ae)
Fe=ne(ue)
local Ze=Te(we)
Me=D(we,ve)
Ue=D(we,Ae)
Ie=ne(we)
local mt=Te(de)
Oe=ne(de)
Ne=D(de,yt)
Se=D(de,pt)
He=ne(lt)
Ge=ne(wt)
ie=v(e(u,d,e(Z,dt)))
xe=v(e(u,e(d,h(d,f),f),ut))
re=v(e(u,d,ht))
local Ae=D(Ae,e(u,Je,f))
te=v(e(u,d,rt))
Re=v(e(u,q,ft))
We=v(e(u,e(q,e(d,f,d)),B))
ee=v(e(q,e(j,d)))
V=v(e(q,e(j,q)))
Xe=v(e(q,q))
local Re=v(e(u,d,Qe))
et=v(e(u,q,Qe))
local V=_(it,e())
local ne=_(nt,e())
local function we(e,i,n)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(e)
end
if r(e)then
return i(t)
end
return n(t,e)
end
local function D(e)
return we(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=x
t.maybe_list_to_jsArray=D
t.new_list=e
local function ue(e)
while X(e)or O(e)do
e=R(ye(e))
end
return e
end
t.un_just=R
t.un_just_comment_all=ue
t.delay_p=ge
t.delay_just_p=l
local function Te(e)
if K(e)then
return e
elseif P(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif F(e)then
error("WIP")
end
return k()
end
local function ue(e)
return ae(Te(e))
end
local function X(e)
return oe(Te(e))
end
t.delay_env=ue
t.delay_x=X
local function X(e)
return n(e)
end
local function ue(e)
if O(e)then
return me(e)
else
return b(e)
end
end
t.force_all=X
t.force1=b
t.force_uncomment1=ue
t.force_uncomment_all=Pe
ke={}
local function ye(i)
i=n(i)
if not m(i)then
return false
end
local e=n(z(i))
if not y(e)then
return false
end
if not L(e,Le)then
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
if c(i[(e+0)+1],h)then
i[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
__TS__ArrayPush(i,h)
__TS__ArrayPush(i,a)
end
end
return i
end
t.env_null_v=ke
t.env_set=be
t.env_get=Ye
t.env2val=S
t.env_foreach=Ve
t.val2env=ye
local function ue(t,a)
return{
t,
1,
function(e,o)
e=b(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return ne
end
return V
end,
}
end
local function X(t,o,i)
return{
t,
1,
function(e,a)
e=b(e)
if l(e)then
return E(t,{e})
end
if o(e)then
return i(e)
end
return a
end,
}
end
Be={
ue(Fe,m),
{
ct,
2,
_,
},
X(De,m,z),
X(Ce,m,T),
ue(Ie,g),
{
Ze,
2,
N,
},
X(Me,g,U),
X(Ue,g,M),
ue(Ge,r),
{
mt,
2,
h,
},
ue(Oe,a),
X(Ne,a,o),
X(Se,a,s),
{
ie,
2,
function(e,t,i)
if e==t then
return ne
end
e=b(e)
t=b(t)
if l(e)or l(t)then
return E(ie,{
e,
t,
})
end
if e==t then
return ne
end
local function i(e,a,t)
return E(te,{
e,
a,
t,
})
end
local function n(e,t)
return i(e,t,V)
end
H(not l(e))
local function i(o,a,e,t)
return n(E(ie,{
e(o),
e(a),
}),E(ie,{
t(o),
t(a),
}))
end
if r(e)then
if not r(e)then
return V
end
return ne
elseif y(e)then
if not y(t)then
return V
end
if L(e,t)then
return ne
else
return V
end
elseif m(e)then
if not m(t)then
return V
end
return i(e,t,z,T)
elseif a(e)then
if not a(t)then
return V
end
return i(e,t,o,s)
elseif g(e)then
if not g(t)then
return V
end
return i(e,t,U,M)
end
return k()
end,
},
{
xe,
2,
function(i,e,h)
local t={}
local e=n(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(s(e))
end
if not r(e)then
return h
end
return W(i,t)
end,
},
{
re,
2,
function(e,a,t)
local e=ye(e)
if e==false then
return t
end
return I(e,a)
end,
},
ue(He,y),
{
Ae,
1,
function(e,t)
e=b(e)
if l(e)then
return E(Ae,{e})
end
if not a(e)then
return t
end
return o(e)
end,
},
{
te,
3,
function(e,o,a,t)
e=b(e)
if l(e)then
return E(te,{
e,
o,
a,
})
end
if not m(e)then
return t
end
local e=n(z(e))
if not y(e)then
return t
end
if L(e,nt)then
return o
end
if L(e,it)then
return a
end
return t
end,
},
{
Re,
2,
fe,
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
local function i(e,t,o,a)
if l(o(e),o(t))and l(a(e),a(t))then
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
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,M)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,z,T)
elseif K(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif F(e)then
error("WIP")
end
return k()
end
local function b(e)
return w(C(e))
end
t.simple_print=w
t.simple_print_force_all_rec=b
local function X(ee)
local R,b,c,l,m,n,T,z,Q,g,M,L,U,S,D,C,F,P,O,A,Y,k,w,K,V,X
function c()
return#R==b
end
function l()
H(not c())
local e=string.sub(R,b+1,b+1)
b=b+1
return e
end
function m(e)
H(string.sub(R,(b-1)+1,(b-1)+1)==e)
b=b-1
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
function z()
if c()then
return false
end
local e=l()
if not T(e)then
m(e)
return false
end
while T(e)and not c()do
e=l()
end
if not T(e)then
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
if not P(e)then
m(e)
return false
end
while P(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if P(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if ot(t)then
return i(t)
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
local t=J()
local a=t
local function o(a)
local e=J()
G(t,h(a,e))
t=e
end
while true do
z()
if c()then
return n()
end
e=l()
if e==")"then
G(t,p)
return a
end
if e=="."then
z()
local o=O()
G(t,o)
z()
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
local e=O()
o(e)
end
end
function M()
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
return _(o(e),s(e))
end
function L()
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
return N(o(e),s(e))
end
function P(e)
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
function O()
z()
local e={
g,
X,
M,
L,
U,
S,
D,
C,
F,
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
function Y()
return not c()
end
function k(e)
A(Y())
A(l()==e)
end
function w(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=w()
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
L,
U,
S,
D,
C,
F,
}
else
e={
g,
V,
M,
L,
U,
S,
D,
C,
F,
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
local a=w()
return e(u,e(d,e(t),f),a)
elseif a==":"then
local a=w()
return e(u,a,t)
elseif a=="~"then
return e(Z,t)
elseif a=="@"then
local a=w()
return e(u,e(d,h(t,f),f),a)
elseif a=="?"then
return e(u,d,e(Z,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
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
return e(pe,x(t))
else
m(a)
return t
end
end
function V()
if c()then
return false
end
local t=l()
if t=="&"then
A(Y())
local t=l()
if t=="+"then
local t=w()
return e(q,e(j,t))
else
m(t)
end
local t=w()
return e(q,t)
elseif t==":"then
A(Y())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(q,e(d,f,t)),B)
elseif t==">"then
local t=w()
return e(u,e(d,f,t),B)
else
m(t)
end
local t=w()
return e(u,t,B)
elseif t=="+"then
local t=w()
return e(j,t)
elseif t=="["then
local e=w()
k("]")
return K(e)
elseif t=="_"then
k(":")
local t=w()
return e(u,t,f)
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
local e=V()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
R=ee
b=0
local function i(t,i)
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
local t=s(e)
if not(a(t)and r(s(t)))then
return n()
end
return i(o(e),o(t))
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
return n()
end
if not a(e)then
return n()
end
local t=s(e)
if not a(t)then
return n()
end
local i=s(t)
if not(a(i)and r(s(i)))then
return n()
end
return h(o(e),o(t),o(i))
end
end
U=i("$",function(e,t)
local e=ye(e)
if e==false then
return n()
end
return I(e,t)
end)
S=i("%",function(t,e)
local e=we(e,function(e)return e end,function(e,e)return n()end)
return E(t,e)
end)
D=h("@",function(o,a,e)
local t=we(e,function(e)return e end,function(e,e)return n()end)
local e=ye(o)
if e==false then
return n()
end
return Ke(e,a,t)
end)
C=i("^",function(t,e)
local e=we(e,function(e)return e end,function(e,e)return n()end)
return W(t,e)
end)
F=i(";",function(e,t)return fe(e,t)end)
return O()
end
t.complex_parse=X
local function b(p)
local function i(r,c)
if y(r)then
return le(r)
end
local function n(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and l(e[0+1],u)then
local t=D(e[1+1])
if t~=false and#t==3 and l(t[0+1],d)then
local h=t[1+1]
local r=D(h)
if r~=false and#r==1 and l(t[2+1],f)then
return n(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(s(h),f)and l(t[2+1],f)then
return n(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,f)and l(e[2+1],B)then
return n(":>"..tostring(i(t[2+1],true)))
end
end
local a=D(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],Z)then
return n(tostring(i(a[1+1],true)).."?")
end
if t~=false and#t==2 and l(e[2+1],B)and l(t[0+1],q)then
local e=D(t[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],f)then
return n(":&>"..tostring(i(e[2+1],true)))
end
end
local t=l(e[2+1],f)and"_"or l(e[2+1],B)and""or i(e[2+1],true)
return n(tostring(t)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],q)then
local t=D(e[1+1])
if t~=false and#t==2 and l(t[0+1],j)then
return n("&+"..tostring(i(t[1+1],true)))
end
return n("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],Z)then
return n(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return n("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],pe)then
local e=D(e[1+1])
if e~=false and#e>1 then
local a=i(e[0+1],true)
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
if c then
return w(r)
else
return w(v(r))
end
end
local e=X(w(p))
local n=""
local d=""
if r(e)then
return"()"
elseif a(e)then
n="("
d=""
while a(e)do
n=tostring(n)..tostring(d)..tostring(b(o(e)))
d=" "
e=s(e)
end
if r(e)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(b(e))..")"
end
return n
elseif m(e)then
local t=z(e)
local a=T(e)
local e=D(a)
if e~=false and#e==2 and l(t,ve)and l(e[0+1],j)then
return i(e[1+1],false)
end
return"#"..tostring(b(h(t,a)))
elseif g(e)then
return"!"..tostring(b(h(U(e),M(e))))
elseif y(e)then
return le(e)
elseif O(e)then
return";("..tostring(b(tt(e))).." "..tostring(b(me(e)))..")"
elseif K(e)then
return"$("..tostring(b(S(ae(e)))).." "..tostring(b(oe(e)))..")"
elseif Y(e)then
return"%("..tostring(b(se(e))).." "..tostring(b(x(he(e))))..")"
elseif P(e)then
return"@("..tostring(b(S(qe(e)))).." "..tostring(b(je(e))).." "..tostring(b(x(ze(e))))..")"
elseif F(e)then
return"^("..tostring(b(Ee(e))).." "..tostring(b(x(_e(e))))..")"
end
return k()
end
t.complex_print=b
local function w(s)
local r=J()
local o={r}
local a=0
local function n()
error("MT parse ERROR")
end
local function l(e)
if not e then
return n()
end
end
local function d()
l(#s>a)
local e=string.sub(s,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=d()
local a
a=function(a)
local t=J()
local e=J()
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,e)
G(o,a(t,e))
end
if t=="^"then
local e=""
while true do
local t=d()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if vt(e)then
G(o,st(e))
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
a(function(t,a)return I(ke,e(ee,re,Q(t),Q(a)))end)
elseif t=="_"then
G(o,p)
else
return n()
end
end
o=i
end
l(a==#s)
return r
end
local function l(e)
local n={e}
local i=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=R(e)
local t
t=function(e,o,a,t)
i=tostring(i)..tostring(o)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,t(e))
end
if y(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ce(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,s)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",z,T)
elseif g(e)then
t(e,"!",U,M)
elseif ge(e)then
local e=Te(e)
t(e,"$",(function(e)return S(ae(e))end),oe)
else
return k()
end
end
n=h
end
return i
end
t.machinetext_parse=w
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
local b=v(h(pe,h(h(at,h(h(u,h(Je,h(f,p))),p)),p)))
local v=v(h(pe,h(h(at,h(de,p)),p)))
local function q(a,t)
return _(v,e(a,t))
end
local function j(e)
return _(b,e)
end
local function f(y,p,u,w,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
u=n(u)
if m(u)then
local m=z(u)
local t=T(u)
if c(m,b)then
t=n(t)
if a(t)then
local e=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local t=e
local a=w
local e
e=function()return y(t,a)end
return l(e)
else
local t
t=y
local a
a=p
local o=e
local i=w
local e
e=function()return f(t,a,W(h,o),i)end
return l(e)
end
end
end
elseif c(m,v)then
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
e=y
local t
t=p
local o=u
local n=a
local i=w
local a
a=function()return f(e,t,o,i,n)end
return l(a)
else
local n
n=y
local t
t=p
local c=u
local u=a
local r=w
local s=h
local a=i("序甲")
local o
o=function()return f(n,t,c,r,_(d,e(e(a),g(e(Q(u),a),Q(s)))))end
return l(o)
end
end
end
end
end
end
if h==false then
return l(function()return p(u,w,y)end)
else
return l(function()return p(u,w,function(e,t)return l(function()return f(y,p,W(h,{e}),t)end)end)end)
end
end
local function a(t,e,a,o)
return f(t,e,a,o)
end
local function s(a,i,n,o)
return g(f((function(t,e)return k(a(t,e))end),(function(e,a,t)return k(i(e,a,function(e,a)return g(t(e,a))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=a
t.run_monad_stackoverflow=s
return t