function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local b,H,f,fe,P,L,Z,me,we,re,v,Oe,Ae,ye,de,je,D,ke,qe,y,he,ne,h,a,o,s,p,r,z,m,_,T,I,k,U,C,X,i,O,W,ae,te,Se,V,xe,_e,ze,E,K,se,ue,B,G,Ee,Te,M,J,Je,A,Y,ot,q,d,x,Re,st,He,Ie,Ne,Ke,Pe,Ye,Be,Ge,We,Me,Ce,ie,ge,ce,ee,Fe,Ue,oe,F,et,tt,R,j,e,S,be,l,n,g,Le,ve,pe,Ve,rt,N,De,at,c,le,Ze,it,ht,Q,nt,u,w,Xe,Qe
function b()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return b()
end
end
function je(e,t)
return{
ye,
e,
t,
}
end
function D(e)
return e[0+1]==ye
end
function ke(e)
return e[2+1]
end
function qe(e)
while D(e)do
e=ke(e)
end
return e
end
function y(e)
return e[0+1]==fe
end
function he(e)
return e[1+1]
end
function ne(e)
return f()[he(e)]
end
function h(e,t)
return{
P,
e,
t,
}
end
function a(e)
return e[0+1]==P
end
function o(e)
return e[1+1]
end
function s(e)
return e[2+1]
end
function r(e)
return e[0+1]==L
end
function z(t,e)
return{
Z,
t,
e,
}
end
function m(e)
return e[0+1]==Z
end
function _(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function I(e,t)
return{
me,
e,
t,
}
end
function k(e)
return e[0+1]==me
end
function U(e)
return e[1+1]
end
function C(e)
return e[2+1]
end
function X(e)
return e[0+1]==we
end
function i(e)
return e[1+1]
end
function O(t,e)
return{
re,
t,
e,
}
end
function W(e)
return e[0+1]==re
end
function ae(e)
return e[1+1]
end
function te(e)
return e[2+1]
end
function Se(a,e,t)
return{
Oe,
a,
e,
t,
}
end
function V(e)
return e[0+1]==Oe
end
function xe(e)
return e[1+1]
end
function _e(e)
return e[2+1]
end
function ze(e)
return e[3+1]
end
function E(t,e)
return{
v,
t,
e,
}
end
function K(e)
return e[0+1]==v
end
function se(e)
return e[1+1]
end
function ue(e)
return e[2+1]
end
function B(e,t)
return{
Ae,
e,
t,
}
end
function G(e)
return e[0+1]==Ae
end
function Ee(e)
return e[1+1]
end
function Te(e)
return e[2+1]
end
function M(e)
local e=n(e)
local function t(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
return e
end
if m(e)then
return t(e)
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif D(e)then
return t(e)
end
return e
end
function J()
return{de}
end
function Je(e)
return e[0+1]==de
end
function A(e,t)
if e==t then
return
end
e[0+1]=we
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function Y(e,a)
H(Je(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function ot(t)
local e=J()
Y(e,t)
return e
end
function R(e,t)
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
function S(e)
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
function be(e)
return W(e)or V(e)or K(e)or G(e)
end
function l(e)
return X(e)or be(e)
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
return s(st)
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
e=g(e)
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
if W(e)then
return o()
elseif K(e)then
local a=se(e)
local e=ue(e)
local i={
He,
Ie,
Ne,
Ke,
Pe,
Ye,
Be,
Ge,
We,
Me,
Ce,
}
local h=false
for e=1,#i do
local e=i[e]
if u(e,a)then
h=true
break
end
end
if h then
H(#e==1)
H(t[1+1]==false)
local e=n(e[0+1],d(),t)
if t[1+1]then
return s(E(a,{e}))
else
return b()
end
end
if u(a,ie)then
return o()
elseif u(a,ge)then
return o()
elseif u(a,ce)then
return o()
elseif u(a,ee)then
H(#e==3)
H(t[1+1]==false)
local a=n(e[0+1],d(),t)
if t[1+1]then
return s(E(ee,{
a,
e[1+1],
e[2+1],
}))
else
return b()
end
end
return b()
elseif V(e)then
return o()
elseif G(e)then
return o()
end
return b()
end
r[h]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return h(e)
end
function g(a)
local e=S(a)
local t
H(not X(e))
if W(e)then
t=at(ae(e),te(e),a)
elseif V(e)then
t=ht(xe(e),_e(e),ze(e),a)
elseif K(e)then
t=it(se(e),ue(e),a)
elseif G(e)then
t=Ze(Ee(e),Te(e),a)
else
t=e
end
t=S(t)
A(e,t)
return t
end
function Le(e)
while l(e)or D(e)do
e=n(qe(e))
end
return e
end
function pe(a,o,i)
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
function Ve(t,a,o)
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
function rt(t,a)
do
local e=0
while e<#t do
if u(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return b()
end
function N(a)
local o=p
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return z(Re,e(o))
end
function De(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function at(h,t,d)
local i=g(t)
if l(i)then
return d
end
local t=I(q,e(oe,e(ce,e(N(h),i))))
if a(i)then
local e={}
local i=i
while not r(i)do
if l(i)then
return d
elseif a(i)then
__TS__ArrayPush(e,o(i))
i=g(s(i))
else
return t
end
end
if u(e[0+1],F)then
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
return Se(h,o,a)
elseif u(e[0+1],et)then
if#e==1 then
return t
end
local i=n(O(h,e[1+1]))
if not m(i)then
return t
end
local n=g(_(i))
if l(n)then
return d
end
if not y(n)then
return t
end
if not R(n,x)then
return t
end
local i=g(T(i))
if l(i)then
return d
end
if not a(i)then
return t
end
local o=o(i)
local a=g(s(i))
if l(a)then
return d
end
if not r(a)then
return t
end
local a={N(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return B(o,a)
elseif u(e[0+1],oe)then
if#e==1 then
return t
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
return B(o,a)
end
elseif r(i)then
return i
elseif c(i)then
return Ve(h,i,t)
elseif k(i)then
return t
end
return b()
end
function c(e)
return y(e)or m(e)
end
function Ze(t,u,f)
local function i()
return I(q,e(oe,e(ge,e(t,j(u)))))
end
t=g(t)
if l(t)then
return f
end
if not m(t)then
return i()
end
local e=n(_(t))
if not(y(e)and R(e,d))then
return i()
end
local t=n(T(t))
if not a(t)then
return i()
end
local e=M(o(t))
local t=n(s(t))
if not(a(t)and r(n(s(t))))then
return i()
end
local d=o(t)
local n=ve
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
n=pe(n,e,a)
t=#u
e=p
elseif a(e)then
if t<#u then
local a=u[t+1]
t=t+1
n=pe(n,o(e),a)
e=s(e)
else
return i()
end
else
return i()
end
end
if#u~=t then
return i()
end
return O(n,d)
end
function it(o,t,a)
local a=I(q,e(oe,e(o,j(t))))
do
local e=0
while e<#le do
if u(o,le[e+1][0+1])then
local o=le[e+1][1+1]
if#t~=o then
return a
end
local e=le[e+1][2+1]
if o==1 then
return e(t[0+1],a)
elseif o==2 then
return e(t[0+1],t[1+1],a)
elseif o==3 then
return e(t[0+1],t[1+1],t[2+1],a)
end
return b()
end
e=e+1
end
end
return a
end
function ht(o,a,t,i)
local e=I(q,e(F,e(N(o),a,j(t))))
if u(a,Fe)then
if#t~=1 then
return e
end
return t[0+1]
elseif u(a,Ue)then
if#t~=2 then
return e
end
return nt(o,t[0+1],t[1+1],e)
elseif u(a,tt)then
if#t~=2 then
return e
end
return je(t[0+1],O(o,t[1+1]))
end
return e
end
function Q(t)
return e(F,Fe,t)
end
function nt(l,i,f,t)
if t==nil then
t=false
end
local function w()
if t==false then
return I(q,e(F,e(N(l),Ue,j({
i,
f,
}))))
else
return t
end
end
i=M(i)
local n={}
local m=false
local t=i
while not r(t)do
if c(t)then
__TS__ArrayPush(n,t)
m=true
t=p
elseif a(t)then
__TS__ArrayPush(n,o(t))
t=s(t)
else
return w()
end
end
local o=i
if m then
o=j(n)
end
local t={}
De(l,function(a,e)
do
local e=0
while e<#n do
if u(n[e+1],a)then
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
o=h(Q(rt(l,t[e+1])),o)
e=e-1
end
end
return z(d,e(i,h(Q(z(d,e(a,f))),o)))
end
function u(e,t)
if e==t then
return true
end
e=n(e)
t=n(t)
if e==t then
return true
end
local function i(t,e,o,a)
if u(o(t),o(e))and u(a(t),a(e))then
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
return R(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,U,C)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,_,T)
end
return b()
end
function w(e)
e=S(e)
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
e=S(s(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(_(e),T(e))))
elseif k(e)then
return"!"..tostring(w(h(U(e),C(e))))
elseif y(e)then
return ne(e)
elseif W(e)then
return"$("..tostring(w(N(ae(e)))).." "..tostring(w(te(e)))..")"
elseif K(e)then
return"%("..tostring(w(se(e))).." "..tostring(w(j(ue(e))))..")"
elseif V(e)then
return"@("..tostring(w(N(xe(e)))).." "..tostring(w(_e(e))).." "..tostring(w(j(ze(e))))..")"
elseif G(e)then
return"^("..tostring(w(Ee(e))).." "..tostring(w(j(Te(e))))..")"
end
return b()
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
["陰"]="侌",
["陽"]="𣆄",
["首始"]="𩠐",
}
end
function Qe()
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
["侌"]="陰",
["𣆄"]="陽",
["𩠐"]="首始",
}
end
local c
c=function()
local e=Xe()
c=function()return e end
return e
end
f=function()
local e=Qe()
f=function()return e end
return e
end
fe=0
P=1
L=2
Z=3
me=4
we=5
re=6
v=7
Oe=8
Ae=9
ye=11
de=10
local function i(e)
return e[1+1]
end
t.new_comment=je
t.comment_p=D
t.comment_comment=i
t.comment_x=ke
t.un_comment_all=qe
local function rt(e)
return f()[e]~=nil
end
local function Ze(e)
return{
fe,
e,
}
end
local function Qe(e)
return c()[e]~=nil
end
local function i(e)
return Ze(c()[e])
end
t.can_new_symbol_p=Qe
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=y
t.un_symbol=ne
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=s
p={L}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=z
t.data_p=m
t.data_name=_
t.data_list=T
t.New_Error=New_Error
t.new_error=I
t.error_p=k
t.error_name=U
t.error_list=C
t.just_p=X
t.evaluate=O
t.apply=B
local function c(e)
local o=Le(e)
local function i(e)
e[1+1]=M(e[1+1])
e[2+1]=M(e[2+1])
if D(e[1+1])or D(e[2+1])then
local t=ot(e)
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
if m(o)then
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
q=i("太始初核")
local ye=i("符名")
d=i("化滅")
x=i("式形")
local dt=i("等同")
local ft=i("解算")
local P=i("特定其物")
local f=i("省略一物")
Re=i("映表")
local yt=i("如若")
local c=i("一類何物")
local Z=i("是非")
local we=i("其子")
local Xe=i("陽")
local Je=i("陰")
local pt=i("引用")
local mt=i("應用")
local wt=i("間空")
local de=i("連頸")
local me=i("構物")
local fe=i("謬誤")
local ut=i("詞素")
local Oe=i("列序")
local lt=i("首始")
local ct=i("尾末")
local at=i("之物")
local v=i("宇宙亡矣")
local it=i("效應")
local ot=i("註疏")
st=I(q,e(v,f))
local function v(e)
return z(ye,h(q,h(e,p)))
end
local function Ae(t)
return v(e(c,e(d,f,t),P))
end
local function L(a,t)
return v(e(c,e(d,e(a),f),t))
end
local function re(t)
return v(e(c,d,e(Z,e(c,t,f))))
end
local nt=Ae(me)
He=L(me,ye)
Ie=L(me,Oe)
Ne=re(me)
local st=Ae(fe)
Ke=L(fe,ye)
Pe=L(fe,Oe)
Ye=re(fe)
local ht=Ae(de)
Be=re(de)
Ge=L(de,lt)
We=L(de,ct)
Me=re(ut)
Ce=re(wt)
ie=v(e(c,d,e(Z,dt)))
ge=v(e(c,e(d,h(d,f),f),mt))
ce=v(e(c,d,ft))
local Ae=L(Oe,e(c,at,f))
ee=v(e(c,d,yt))
Fe=v(e(c,x,pt))
Ue=v(e(c,e(x,e(d,f,d)),P))
oe=v(e(x,e(q,d)))
F=v(e(x,e(q,x)))
et=v(e(x,x))
local Oe=v(e(c,d,ot))
tt=v(e(c,x,ot))
local F=z(Je,e())
local re=z(Xe,e())
local function me(e,n,i)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(e)
end
if r(e)then
return n(t)
end
return i(t,e)
end
local function L(e)
return me(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=j
t.maybe_list_to_jsArray=L
t.new_list=e
local function fe(e)
while X(e)or D(e)do
e=S(qe(e))
end
return e
end
t.un_just=S
t.un_just_comment_all=fe
t.delay_p=be
t.delay_just_p=l
local function qe(e)
if W(e)then
return e
elseif V(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return b()
end
local function X(e)
return ae(qe(e))
end
local function fe(e)
return te(qe(e))
end
t.delay_env=X
t.delay_x=fe
local function X(e)
return n(e)
end
local function fe(e)
if D(e)then
return ke(e)
else
return g(e)
end
end
t.force_all=X
t.force1=g
t.force_uncomment1=fe
t.force_uncomment_all=Le
ve={}
local function fe(i)
i=n(i)
if not m(i)then
return false
end
local e=n(_(i))
if not y(e)then
return false
end
if not R(e,Re)then
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
local t=o(e)
e=n(s(e))
if not a(e)then
return false
end
local a=o(e)
if not r(n(s(e)))then
return false
end
local o=true
do
local e=0
while e<#i do
if u(i[(e+0)+1],t)then
i[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,a)
end
end
return i
end
t.env_null_v=ve
t.env_set=pe
t.env_get=Ve
t.env2val=N
t.env_foreach=De
t.val2env=fe
local function X(t,a)
return{
t,
1,
function(e,o)
e=g(e)
if l(e)then
return E(t,{e})
end
if a(e)then
return re
end
return F
end,
}
end
local function D(t,o,i)
return{
t,
1,
function(e,a)
e=g(e)
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
le={
X(Ne,m),
{
nt,
2,
z,
},
D(He,m,_),
D(Ie,m,T),
X(Ye,k),
{
st,
2,
I,
},
D(Ke,k,U),
D(Pe,k,C),
X(Ce,r),
{
ht,
2,
h,
},
X(Be,a),
D(Ge,a,o),
D(We,a,s),
{
ie,
2,
function(e,t,i)
if e==t then
return re
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return E(ie,{
e,
t,
})
end
if e==t then
return re
end
local function i(e,t,a)
return E(ee,{
e,
t,
a,
})
end
local function n(e,t)
return i(e,t,F)
end
H(not l(e))
local function i(e,t,a,o)
return n(E(ie,{
a(e),
a(t),
}),E(ie,{
o(e),
o(t),
}))
end
if r(e)then
if not r(e)then
return F
end
return re
elseif y(e)then
if not y(t)then
return F
end
return R(e,t)and re or F
elseif m(e)then
if not m(t)then
return F
end
return i(e,t,_,T)
elseif a(e)then
if not a(t)then
return F
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return F
end
return i(e,t,U,C)
end
return b()
end,
},
{
ge,
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
return B(i,t)
end,
},
{
ce,
2,
function(e,t,a)
local e=fe(e)
if e==false then
return a
end
return O(e,t)
end,
},
X(Me,y),
{
Ae,
1,
function(e,t)
e=g(e)
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
ee,
3,
function(e,o,a,t)
e=g(e)
if l(e)then
return E(ee,{
e,
o,
a,
})
end
if not m(e)then
return t
end
local e=n(_(e))
if not y(e)then
return t
end
if R(e,Xe)then
return o
end
if R(e,Je)then
return a
end
return t
end,
},
{
Oe,
2,
je,
},
}
t.equal_p=u
local function l(e,t)
if e==t then
return true
end
e=S(e)
t=S(t)
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
A(e,p)
A(t,p)
return true
elseif y(e)then
if not y(t)then
return false
end
return R(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,s)
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,U,C)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,_,T)
elseif W(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return b()
end
local function g(e)
return w(M(e))
end
t.simple_print=w
t.simple_print_force_all_rec=g
local function X(X)
local M,b,u,l,m,n,_,T,K,g,C,R,S,D,L,U,F,W,A,N,k,w,V,G,Q
function u()
return#M==b
end
function l()
H(not u())
local e=string.sub(M,b+1,b+1)
b=b+1
return e
end
function m(e)
H(string.sub(M,(b-1)+1,(b-1)+1)==e)
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
if u()then
return false
end
local e=l()
if not _(e)then
m(e)
return false
end
while _(e)and not u()do
e=l()
end
if not _(e)then
m(e)
end
return true
end
function K()
if u()then
return false
end
local e=l()
local t=""
if not F(e)then
m(e)
return false
end
while F(e)and not u()do
t=tostring(t)..tostring(e)
e=l()
end
if F(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if Qe(t)then
return i(t)
else
return n("Not Symbol"..tostring(t))
end
end
function g()
if u()then
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
T()
if u()then
return n()
end
e=l()
if e==")"then
Y(t,p)
return a
end
if e=="."then
T()
local o=W()
Y(t,o)
T()
if u()then
return n()
end
e=l()
if e~=")"then
return n()
end
return a
end
m(e)
local e=W()
o(e)
end
end
function C()
if u()then
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
return z(o(e),s(e))
end
function R()
if u()then
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
return I(o(e),s(e))
end
function F(e)
if _(e)then
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
}
for a=1,#t do
local t=t[a]
if t==e then
return false
end
end
return true
end
function W()
T()
local t={
g,
Q,
C,
R,
S,
D,
L,
U,
}
do
local e=0
while e<#t do
local t=t[e+1]()
if t~=false then
return t
end
e=e+1
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
function N()
return not u()
end
function k(e)
A(N())
A(l()==e)
end
function w(e)
if e==nil then
e=false
end
local function t()
k("[")
local e=w()
k("]")
return e
end
local t=e and{
g,
K,
t,
C,
R,
S,
D,
L,
U,
}or{
g,
G,
C,
R,
S,
D,
L,
U,
}
do
local e=0
while e<#t do
local t=t[e+1]()
if t~=false then
return t
end
e=e+1
end
end
return n()
end
function V(t)
if u()then
return t
end
local a=l()
if a=="."then
local a=w()
return e(c,e(d,e(t),f),a)
elseif a==":"then
local a=w()
return e(c,a,t)
elseif a=="~"then
return e(Z,t)
elseif a=="@"then
local a=w()
return e(c,e(d,h(t,f),f),a)
elseif a=="?"then
return e(c,d,e(Z,t))
elseif a=="/"then
local t={t}
while true do
local e=w(true)
__TS__ArrayPush(t,e)
if u()then
break
end
local e=l()
if e~="/"then
m(e)
break
end
end
return e(we,j(t))
else
m(a)
return t
end
end
function G()
if u()then
return false
end
local t=l()
if t=="&"then
A(N())
local t=l()
if t=="+"then
local t=w()
return e(x,e(q,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
A(N())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(c,e(x,e(d,f,t)),P)
elseif t==">"then
local t=w()
return e(c,e(d,f,t),P)
else
m(t)
end
local t=w()
return e(c,t,P)
elseif t=="+"then
local t=w()
return e(q,t)
elseif t=="["then
local e=w()
k("]")
return V(e)
elseif t=="_"then
k(":")
local t=w()
return e(c,t,f)
else
m(t)
local e=K()
if e==false then
return false
end
return V(e)
end
end
function Q()
local e=G()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
M=X
b=0
local function h(t,i)
return function()
if u()then
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
local function d(t,h)
return function()
if u()then
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
S=h("$",function(e,t)
local e=fe(e)
if e==false then
return n()
end
return O(e,t)
end)
D=h("%",function(t,e)
local e=me(e,function(e)return e end,function(e,e)return n()end)
return E(t,e)
end)
L=d("@",function(t,o,e)
local a=me(e,function(e)return e end,function(e,e)return n()end)
local e=fe(t)
if e==false then
return n()
end
return Se(e,o,a)
end)
U=h("^",function(t,e)
local e=me(e,function(e)return e end,function(e,e)return n()end)
return B(t,e)
end)
return W()
end
t.complex_parse=X
local function g(p)
local function i(h,u)
if y(h)then
return ne(h)
end
local function t(e)
if u=="inner"then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(h)
if e~=false and#e==3 and l(e[0+1],c)then
local n=L(e[1+1])
if n~=false and#n==3 and l(n[0+1],d)then
local h=n[1+1]
local r=L(h)
if r~=false and#r==1 and l(n[2+1],f)then
return t(tostring(i(r[0+1],"inner")).."."..tostring(i(e[2+1],"inner")))
elseif a(h)and l(s(h),f)and l(n[2+1],f)then
return t(tostring(i(o(h),"inner")).."@"..tostring(i(e[2+1],"inner")))
elseif l(h,f)and l(e[2+1],P)then
return t(":>"..tostring(i(n[2+1],"inner")))
end
end
local a=L(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],Z)then
return t(tostring(i(a[1+1],"inner")).."?")
end
if n~=false and#n==2 and l(e[2+1],P)and l(n[0+1],x)then
local e=L(n[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],f)then
return t(":&>"..tostring(i(e[2+1],"inner")))
end
end
local a=l(e[2+1],f)and"_"or l(e[2+1],P)and""or i(e[2+1],"inner")
return t(tostring(a)..":"..tostring(i(e[1+1],"inner")))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=L(e[1+1])
if a~=false and#a==2 and l(a[0+1],q)then
return t("&+"..tostring(i(a[1+1],"inner")))
end
return t("&"..tostring(i(e[1+1],"inner")))
elseif l(e[0+1],Z)then
return t(tostring(i(e[1+1],"inner")).."~")
elseif l(e[0+1],q)then
return t("+"..tostring(i(e[1+1],"inner")))
elseif l(e[0+1],we)then
local e=L(e[1+1])
if e~=false and#e>1 then
local a=i(e[0+1],"inner")
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(i(e[t+1],"inner"))
t=t+1
end
end
return t(a)
end
end
end
if u=="inner"then
return w(h)
elseif u=="top"then
return w(v(h))
end
return b()
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
n=tostring(n)..tostring(d)..tostring(g(o(e)))
d=" "
e=s(e)
end
if r(e)then
n=tostring(n)..")"
else
n=tostring(n).." . "..tostring(g(e))..")"
end
return n
elseif m(e)then
local t=_(e)
local a=T(e)
local e=L(a)
if e~=false and#e==2 and l(t,ye)and l(e[0+1],q)then
return i(e[1+1],"top")
end
return"#"..tostring(g(h(t,a)))
elseif k(e)then
return"!"..tostring(g(h(U(e),C(e))))
elseif y(e)then
return ne(e)
elseif W(e)then
return"$("..tostring(g(N(ae(e)))).." "..tostring(g(te(e)))..")"
elseif K(e)then
return"%("..tostring(g(se(e))).." "..tostring(g(j(ue(e))))..")"
elseif V(e)then
return"@("..tostring(g(N(xe(e)))).." "..tostring(g(_e(e))).." "..tostring(g(j(ze(e))))..")"
elseif G(e)then
return"^("..tostring(g(Ee(e))).." "..tostring(g(j(Te(e))))..")"
end
return b()
end
t.complex_print=g
local function w(s)
local l=J()
local o={l}
local a=0
local function n()
error("MT parse ERROR")
end
local function d(e)
if not e then
return n()
end
end
local function r()
d(#s>a)
local e=string.sub(s,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=r()
local a
a=function(a)
local t=J()
local e=J()
__TS__ArrayPush(i,t)
__TS__ArrayPush(i,e)
Y(o,a(t,e))
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
Y(o,Ze(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(z)
elseif t=="!"then
a(I)
elseif t=="$"then
a(function(a,t)return O(ve,e(oe,ce,Q(a),Q(t)))end)
elseif t=="_"then
Y(o,p)
else
return n()
end
end
o=i
end
d(a==#s)
return l
end
local function l(e)
local n={e}
local i=""
while#n~=0 do
local h={}
for e=1,#n do
local e=n[e]
e=S(e)
local t
t=function(e,t,a,o)
i=tostring(i)..tostring(t)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,o(e))
end
if y(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(he(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,s)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",_,T)
elseif k(e)then
t(e,"!",U,C)
elseif be(e)then
local e=qe(e)
t(e,"$",(function(e)return N(ae(e))end),te)
else
return b()
end
end
n=h
end
return i
end
t.machinetext_parse=w
t.machinetext_print=l
local function b(e)
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
t.trampoline_return=b
t.trampoline_delay=l
t.run_trampoline=k
local g=v(h(we,h(h(it,h(h(c,h(at,h(f,p))),p)),p)))
local v=v(h(we,h(h(it,h(de,p)),p)))
local function j(t,a)
return z(v,e(t,a))
end
local function q(e)
return z(g,e)
end
local function f(w,y,c,p,h)
if h==nil then
h=false
end
local function b(e,e)
error("WIP")
end
c=n(c)
if m(c)then
local m=_(c)
local t=T(c)
if u(m,g)then
t=n(t)
if a(t)then
local a=o(t)
local e=n(s(t))
if r(e)then
if h==false then
local a=a
local t=p
local e
e=function()return w(a,t)end
return l(e)
else
local e
e=w
local t
t=y
local i=a
local o=p
local a
a=function()return f(e,t,B(h,i),o)end
return l(a)
end
end
end
elseif u(m,v)then
t=n(t)
if a(t)then
local c=o(t)
local t=n(s(t))
if a(t)then
local u=o(t)
local t=n(s(t))
if r(t)then
if h==false then
local t
t=w
local e
e=y
local n=c
local o=u
local i=p
local a
a=function()return f(t,e,n,i,o)end
return l(a)
else
local n
n=w
local o
o=y
local c=c
local r=u
local s=p
local h=h
local a=i("序甲")
local t
t=function()return f(n,o,c,s,z(d,e(e(a),b(e(Q(r),a),Q(h)))))end
return l(t)
end
end
end
end
end
end
if h==false then
return l(function()return y(c,p,w)end)
else
return l(function()return y(c,p,function(t,e)return l(function()return f(w,y,B(h,{t}),e)end)end)end)
end
end
local function e(e,a,t,o)
return f(e,a,t,o)
end
local function s(a,i,n,o)
return k(f((function(t,e)return b(a(t,e))end),(function(e,a,t)return b(i(e,a,function(e,a)return k(t(e,a))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=g
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=e
t.run_monad_stackoverflow=s
return t