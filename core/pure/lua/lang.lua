function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local k,S,f,D,Y,B,be,ae,Te,Oe,Pe,Ae,we,fe,se,je,C,ze,xe,y,ue,de,h,a,o,n,p,r,_,m,z,T,I,b,U,M,X,u,O,K,ie,oe,We,V,qe,ge,ke,E,W,re,he,F,P,Ee,_e,L,J,s,A,G,Je,j,d,x,Ye,nt,Se,Ne,Ie,He,Be,Ue,Me,Ce,Re,De,Le,Z,me,le,ee,Fe,Ve,te,ne,st,Xe,R,q,e,H,ye,l,i,g,Qe,pe,ve,Ge,tt,N,Ke,ot,v,ce,at,et,it,Q,rt,c,w,ht,Ze
function k()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return k()
end
end
function je(t,e)
return{
fe,
t,
e,
}
end
function C(e)
return e[0+1]==fe
end
function ze(e)
return e[2+1]
end
function xe(e)
while C(e)do
e=ze(e)
end
return e
end
function y(e)
return e[0+1]==D
end
function ue(e)
return e[1+1]
end
function de(e)
return f()[ue(e)]
end
function h(t,e)
return{
Y,
t,
e,
}
end
function a(e)
return e[0+1]==Y
end
function o(e)
return e[1+1]
end
function n(e)
return e[2+1]
end
function r(e)
return e[0+1]==B
end
function _(t,e)
return{
be,
t,
e,
}
end
function m(e)
return e[0+1]==be
end
function z(e)
return e[1+1]
end
function T(e)
return e[2+1]
end
function I(e,t)
return{
ae,
e,
t,
}
end
function b(e)
return e[0+1]==ae
end
function U(e)
return e[1+1]
end
function M(e)
return e[2+1]
end
function X(e)
return e[0+1]==Te
end
function u(e)
return e[1+1]
end
function O(t,e)
return{
Oe,
t,
e,
}
end
function K(e)
return e[0+1]==Oe
end
function ie(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function We(a,e,t)
return{
Ae,
a,
e,
t,
}
end
function V(e)
return e[0+1]==Ae
end
function qe(e)
return e[1+1]
end
function ge(e)
return e[2+1]
end
function ke(e)
return e[3+1]
end
function E(t,e)
return{
Pe,
t,
e,
}
end
function W(e)
return e[0+1]==Pe
end
function re(e)
return e[1+1]
end
function he(e)
return e[2+1]
end
function F(e,t)
return{
we,
e,
t,
}
end
function P(e)
return e[0+1]==we
end
function Ee(e)
return e[1+1]
end
function _e(e)
return e[2+1]
end
function L(e)
local e=i(e)
local function t(e)
e[1+1]=L(e[1+1])
e[2+1]=L(e[2+1])
return e
end
if m(e)then
return t(e)
elseif b(e)then
return t(e)
elseif a(e)then
return t(e)
elseif C(e)then
return t(e)
end
return e
end
function J()
return{se}
end
function s(e)
return e[0+1]==se
end
function A(e,t)
if e==t then
return
end
e[0+1]=Te
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function G(e,a)
S(s(e))
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
function R(e,t)
if e==t then
return true
end
if ue(e)==ue(t)then
A(e,t)
return true
else
return false
end
end
function q(a)
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
return q(e)
end
function H(e)
if not X(e)then
return e
end
local e=e
local t={}
while X(e)do
__TS__ArrayPush(t,e)
e=u(e)
end
for a=1,#t do
local t=t[a]
A(t,e)
end
return e
end
function ye(e)
return K(e)or V(e)or W(e)or P(e)
end
function l(e)
return X(e)or ye(e)
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
r(t)
if l(t)then
__TS__ArrayPush(a,e)
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
return s(nt)
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
__TS__ArrayPush(a,e)
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
if K(e)then
return o()
elseif W(e)then
local a=re(e)
local e=he(e)
local h={
Se,
Ne,
Ie,
He,
Be,
Ue,
Me,
Ce,
Re,
De,
Le,
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
S(#e==1)
S(t[1+1]==false)
local e=i(e[0+1],d(),t)
if t[1+1]then
return s(E(a,{e}))
else
return k()
end
end
if c(a,Z)then
return o()
elseif c(a,me)then
return o()
elseif c(a,le)then
return o()
elseif c(a,ee)then
S(#e==3)
S(t[1+1]==false)
local a=i(e[0+1],d(),t)
if t[1+1]then
return s(E(ee,{
a,
e[1+1],
e[2+1],
}))
else
return k()
end
end
return k()
elseif V(e)then
return o()
elseif P(e)then
return o()
end
return k()
end
h[r]=true
__TS__ArrayPush(a,e)
e=g(e)
end
return r(e)
end
function g(a)
local e=H(a)
local t
S(not X(e))
if K(e)then
t=ot(ie(e),oe(e),a)
elseif V(e)then
t=it(qe(e),ge(e),ke(e),a)
elseif W(e)then
t=et(re(e),he(e),a)
elseif P(e)then
t=at(Ee(e),_e(e),a)
else
t=e
end
t=H(t)
A(e,t)
return t
end
function Qe(e)
while l(e)or C(e)do
e=i(xe(e))
end
return e
end
function ve(a,o,i)
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
function Ge(t,o,a)
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
function tt(t,a)
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
function N(a)
local o=p
do
local t=0
while t<#a do
o=h(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Ye,e(o))
end
function Ke(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ot(h,t,d)
local s=g(t)
if l(s)then
return d
end
local t=I(j,e(te,e(le,e(N(h),s))))
if a(s)then
local e={}
local s=s
while not r(s)do
if l(s)then
return d
elseif a(s)then
__TS__ArrayPush(e,o(s))
s=g(n(s))
else
return t
end
end
if c(e[0+1],ne)then
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
return We(h,o,a)
elseif c(e[0+1],st)then
if#e==1 then
return t
end
local i=i(O(h,e[1+1]))
if not m(i)then
return t
end
local s=g(z(i))
if l(s)then
return d
end
if not y(s)then
return t
end
if not R(s,x)then
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
local a=g(n(i))
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
return F(o,a)
elseif c(e[0+1],te)then
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
return F(o,a)
end
elseif r(s)then
return s
elseif v(s)then
return Ge(h,s,t)
elseif b(s)then
return t
end
return k()
end
function v(e)
return y(e)or m(e)
end
function at(t,s,c)
local function u()
return I(j,e(te,e(me,e(t,q(s)))))
end
t=g(t)
if l(t)then
return c
end
if not m(t)then
return u()
end
local e=i(z(t))
if not(y(e)and R(e,d))then
return u()
end
local t=i(T(t))
if not a(t)then
return u()
end
local e=L(o(t))
local t=i(n(t))
if not(a(t)and r(i(n(t))))then
return u()
end
local d=o(t)
local i=pe
local t=0
while not r(e)do
if v(e)then
local a=p
do
local e=#s-1
while e>=t do
a=h(s[e+1],a)
e=e-1
end
end
i=ve(i,e,a)
t=#s
e=p
elseif a(e)then
if t<#s then
local a=s[t+1]
t=t+1
i=ve(i,o(e),a)
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
return O(i,d)
end
function et(o,t,a)
local a=I(j,e(te,e(o,q(t))))
do
local e=0
while e<#ce do
if c(o,ce[e+1][0+1])then
local o=ce[e+1][1+1]
if#t~=o then
return a
end
local e=ce[e+1][2+1]
if o==1 then
return e(t[0+1],a)
elseif o==2 then
return e(t[0+1],t[1+1],a)
elseif o==3 then
return e(t[0+1],t[1+1],t[2+1],a)
end
return k()
end
e=e+1
end
end
return a
end
function it(o,a,t,i)
local e=I(j,e(ne,e(N(o),a,q(t))))
if c(a,Fe)then
if#t~=1 then
return e
end
return t[0+1]
elseif c(a,Ve)then
if#t~=2 then
return e
end
return rt(o,t[0+1],t[1+1],e)
elseif c(a,Xe)then
if#t~=2 then
return e
end
return je(t[0+1],O(o,t[1+1]))
end
return e
end
function Q(t)
return e(ne,Fe,t)
end
function rt(l,i,u,t)
if t==nil then
t=false
end
local function f()
if t==false then
return I(j,e(ne,e(N(l),Ve,q({
i,
u,
}))))
else
return t
end
end
i=L(i)
local s={}
local m=false
local t=i
while not r(t)do
if v(t)then
__TS__ArrayPush(s,t)
m=true
t=p
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=n(t)
else
return f()
end
end
local a=i
if m then
a=q(s)
end
local t={}
Ke(l,function(a,e)
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
a=h(Q(tt(l,t[e+1])),a)
e=e-1
end
end
return _(d,e(i,h(Q(_(d,e(o,u))),a)))
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
return i(e,t,o,n)
elseif b(e)then
if not b(t)then
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
e=H(e)
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
e=H(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(z(e),T(e))))
elseif b(e)then
return"!"..tostring(w(h(U(e),M(e))))
elseif y(e)then
return de(e)
elseif K(e)then
return"$("..tostring(w(N(ie(e)))).." "..tostring(w(oe(e)))..")"
elseif W(e)then
return"%("..tostring(w(re(e))).." "..tostring(w(q(he(e))))..")"
elseif V(e)then
return"@("..tostring(w(N(qe(e)))).." "..tostring(w(ge(e))).." "..tostring(w(q(ke(e))))..")"
elseif P(e)then
return"^("..tostring(w(Ee(e))).." "..tostring(w(q(_e(e))))..")"
end
return k()
end
function ht()
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
local u
u=function()
local e=ht()
u=function()return e end
return e
end
f=function()
local e=Ze()
f=function()return e end
return e
end
D=0
Y=1
B=2
be=3
ae=4
Te=5
Oe=6
Pe=7
Ae=8
we=9
fe=11
se=10
local function s(e)
return e[1+1]
end
t.new_comment=je
t.comment_p=C
t.comment_comment=s
t.comment_x=ze
t.un_comment_all=xe
local function rt(e)
return f()[e]~=nil
end
local function at(e)
return{
D,
e,
}
end
local function tt(e)
return u()[e]~=nil
end
local function s(e)
return at(u()[e])
end
t.can_new_symbol_p=tt
t.New_Symbol=New_Symbol
t.new_symbol=s
t.symbol_p=y
t.un_symbol=de
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=n
p={B}
t.Null_V=Null_V
t.null_v=p
t.null_p=r
t.New_Data=New_Data
t.new_data=_
t.data_p=m
t.data_name=z
t.data_list=T
t.New_Error=New_Error
t.new_error=I
t.error_p=b
t.error_name=U
t.error_list=M
t.just_p=X
t.evaluate=O
t.apply=F
local function u(e)
local o=Qe(e)
local function i(e)
e[1+1]=L(e[1+1])
e[2+1]=L(e[2+1])
if C(e[1+1])or C(e[2+1])then
local t=Je(e)
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
elseif b(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=L
t.force_uncomment_all_rec=u
j=s("太始初核")
local be=s("符名")
d=s("化滅")
x=s("式形")
local ft=s("等同")
local mt=s("解算")
local B=s("特定其物")
local f=s("省略一物")
Ye=s("映表")
local yt=s("如若")
local u=s("一類何物")
local ae=s("是非")
local we=s("其子")
local ot=s("陽")
local Je=s("陰")
local pt=s("引用")
local ct=s("應用")
local wt=s("間空")
local se=s("連頸")
local Te=s("構物")
local fe=s("謬誤")
local dt=s("詞素")
local Ae=s("列序")
local lt=s("首始")
local ut=s("尾末")
local Pe=s("之物")
local v=s("宇宙亡矣")
local et=s("效應")
local Ze=s("註疏")
nt=I(j,e(v,f))
local function v(e)
return _(be,h(j,h(e,p)))
end
local function Oe(t)
return v(e(u,e(d,f,t),B))
end
local function D(a,t)
return v(e(u,e(d,e(a),f),t))
end
local function Y(t)
return v(e(u,d,e(ae,e(u,t,f))))
end
local it=Oe(Te)
Se=D(Te,be)
Ne=D(Te,Ae)
Ie=Y(Te)
local nt=Oe(fe)
He=D(fe,be)
Be=D(fe,Ae)
Ue=Y(fe)
local ht=Oe(se)
Me=Y(se)
Ce=D(se,lt)
Re=D(se,ut)
De=Y(dt)
Le=Y(wt)
Z=v(e(u,d,e(ae,ft)))
me=v(e(u,e(d,h(d,f),f),ct))
le=v(e(u,d,mt))
local Ae=D(Ae,e(u,Pe,f))
ee=v(e(u,d,yt))
Fe=v(e(u,x,pt))
Ve=v(e(u,e(x,e(d,f,d)),B))
te=v(e(x,e(j,d)))
ne=v(e(x,e(j,x)))
st=v(e(x,x))
local Oe=v(e(u,d,Ze))
Xe=v(e(u,x,Ze))
local Y=_(Je,e())
local ne=_(ot,e())
local function fe(e,s,i)
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
local function D(e)
return fe(e,function(e)return e end,function(e,e)return false end)
end
t.jsArray_to_list=q
t.maybe_list_to_jsArray=D
t.new_list=e
local function Te(e)
while X(e)or C(e)do
e=H(xe(e))
end
return e
end
t.un_just=H
t.un_just_comment_all=Te
t.delay_p=ye
t.delay_just_p=l
local function Te(e)
if K(e)then
return e
elseif V(e)then
error("WIP")
elseif W(e)then
error("WIP")
elseif P(e)then
error("WIP")
end
return k()
end
local function X(e)
return ie(Te(e))
end
local function xe(e)
return oe(Te(e))
end
t.delay_env=X
t.delay_x=xe
local function X(e)
return i(e)
end
local function xe(e)
if C(e)then
return ze(e)
else
return g(e)
end
end
t.force_all=X
t.force1=g
t.force_uncomment1=xe
t.force_uncomment_all=Qe
pe={}
local function xe(s)
s=i(s)
if not m(s)then
return false
end
local e=i(z(s))
if not y(e)then
return false
end
if not R(e,Ye)then
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
t.env_null_v=pe
t.env_set=ve
t.env_get=Ge
t.env2val=N
t.env_foreach=Ke
t.val2env=xe
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
return ne
end
return Y
end,
}
end
local function C(t,o,i)
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
ce={
X(Ie,m),
{
it,
2,
_,
},
C(Se,m,z),
C(Ne,m,T),
X(Ue,b),
{
nt,
2,
I,
},
C(He,b,U),
C(Be,b,M),
X(Le,r),
{
ht,
2,
h,
},
X(Me,a),
C(Ce,a,o),
C(Re,a,n),
{
Z,
2,
function(e,t,i)
if e==t then
return ne
end
e=g(e)
t=g(t)
if l(e)or l(t)then
return E(Z,{
e,
t,
})
end
if e==t then
return ne
end
local function i(e,a,t)
return E(ee,{
e,
a,
t,
})
end
local function s(e,t)
return i(e,t,Y)
end
S(not l(e))
local function i(e,t,a,o)
return s(E(Z,{
a(e),
a(t),
}),E(Z,{
o(e),
o(t),
}))
end
if r(e)then
if not r(e)then
return Y
end
return ne
elseif y(e)then
if not y(t)then
return Y
end
return R(e,t)and ne or Y
elseif m(e)then
if not m(t)then
return Y
end
return i(e,t,z,T)
elseif a(e)then
if not a(t)then
return Y
end
return i(e,t,o,n)
elseif b(e)then
if not b(t)then
return Y
end
return i(e,t,U,M)
end
return k()
end,
},
{
me,
2,
function(s,e,h)
local t={}
local e=i(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=i(n(e))
end
if not r(e)then
return h
end
return F(s,t)
end,
},
{
le,
2,
function(e,t,a)
local e=xe(e)
if e==false then
return a
end
return O(e,t)
end,
},
X(De,y),
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
local e=i(z(e))
if not y(e)then
return t
end
if R(e,ot)then
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
t.equal_p=c
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function i(t,e,a,o)
if l(a(t),a(e))and l(o(t),o(e))then
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
return i(e,t,o,n)
elseif b(e)then
if not b(t)then
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
elseif W(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif P(e)then
error("WIP")
end
return k()
end
local function g(e)
return w(L(e))
end
t.simple_print=w
t.simple_print_force_all_rec=g
local function X(X)
local W,b,c,l,m,i,A,T,P,g,M,Y,N,L,C,H,D,R,z,U,k,w,K,V,Q
function c()
return#W==b
end
function l()
S(not c())
local e=string.sub(W,b+1,b+1)
b=b+1
return e
end
function m(e)
S(string.sub(W,(b-1)+1,(b-1)+1)==e)
b=b-1
end
function i(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=l()
if not A(e)then
m(e)
return false
end
while A(e)and not c()do
e=l()
end
if not A(e)then
m(e)
end
return true
end
function P()
if c()then
return false
end
local e=l()
local t=""
if not D(e)then
m(e)
return false
end
while D(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if D(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if tt(t)then
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
G(t,h(a,e))
t=e
end
while true do
T()
if c()then
return i()
end
e=l()
if e==")"then
G(t,p)
return a
end
if e=="."then
T()
local o=R()
G(t,o)
T()
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
local e=R()
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
return i()
end
if not a(e)then
return i()
end
return _(o(e),n(e))
end
function Y()
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
return I(o(e),n(e))
end
function D(t)
if A(t)then
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
}
for a=1,#e do
local e=e[a]
if e==t then
return false
end
end
return true
end
function R()
T()
local t={
g,
Q,
M,
Y,
N,
L,
C,
H,
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
return i()
end
function z(e)
if e==false then
return i()
end
return e
end
function U()
return not c()
end
function k(e)
z(U())
z(l()==e)
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
P,
t,
M,
Y,
N,
L,
C,
H,
}or{
g,
V,
M,
Y,
N,
L,
C,
H,
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
return i()
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
return e(ae,t)
elseif a=="@"then
local a=w()
return e(u,e(d,h(t,f),f),a)
elseif a=="?"then
return e(u,d,e(ae,t))
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
return e(we,q(t))
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
z(U())
local t=l()
if t=="+"then
local t=w()
return e(x,e(j,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif t==":"then
z(U())
local t=l()
if t=="&"then
k(">")
local t=w()
return e(u,e(x,e(d,f,t)),B)
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
local e=P()
if e==false then
return false
end
return K(e)
end
end
function Q()
local e=V()
if e==false then
return false
end
if y(e)then
return e
end
return v(e)
end
W=X
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
local s=n(e)
if not a(s)then
return i()
end
local t=n(s)
if not(a(t)and r(n(t)))then
return i()
end
return h(o(e),o(s),o(t))
end
end
N=s("$",function(e,t)
local e=xe(e)
if e==false then
return i()
end
return O(e,t)
end)
L=s("%",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return i()end)
return E(t,e)
end)
C=h("@",function(a,t,e)
local o=fe(e,function(e)return e end,function(e,e)return i()end)
local e=xe(a)
if e==false then
return i()
end
return We(e,t,o)
end)
H=s("^",function(t,e)
local e=fe(e,function(e)return e end,function(e,e)return i()end)
return F(t,e)
end)
return R()
end
t.complex_parse=X
local function g(p)
local function i(h,c)
if y(h)then
return de(h)
end
local function t(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(h)
if e~=false and#e==3 and l(e[0+1],u)then
local s=D(e[1+1])
if s~=false and#s==3 and l(s[0+1],d)then
local h=s[1+1]
local r=D(h)
if r~=false and#r==1 and l(s[2+1],f)then
return t(tostring(i(r[0+1],true)).."."..tostring(i(e[2+1],true)))
elseif a(h)and l(n(h),f)and l(s[2+1],f)then
return t(tostring(i(o(h),true)).."@"..tostring(i(e[2+1],true)))
elseif l(h,f)and l(e[2+1],B)then
return t(":>"..tostring(i(s[2+1],true)))
end
end
local a=D(e[2+1])
if l(e[1+1],d)and a~=false and#a==2 and l(a[0+1],ae)then
return t(tostring(i(a[1+1],true)).."?")
end
if s~=false and#s==2 and l(e[2+1],B)and l(s[0+1],x)then
local e=D(s[1+1])
if e~=false and#e==3 and l(e[0+1],d)and l(e[1+1],f)then
return t(":&>"..tostring(i(e[2+1],true)))
end
end
local a=l(e[2+1],f)and"_"or l(e[2+1],B)and""or i(e[2+1],true)
return t(tostring(a)..":"..tostring(i(e[1+1],true)))
elseif e~=false and#e==2 then
if l(e[0+1],x)then
local a=D(e[1+1])
if a~=false and#a==2 and l(a[0+1],j)then
return t("&+"..tostring(i(a[1+1],true)))
end
return t("&"..tostring(i(e[1+1],true)))
elseif l(e[0+1],ae)then
return t(tostring(i(e[1+1],true)).."~")
elseif l(e[0+1],j)then
return t("+"..tostring(i(e[1+1],true)))
elseif l(e[0+1],we)then
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
return t(a)
end
end
end
if c then
return w(h)
else
return w(v(h))
end
end
local e=X(w(p))
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
elseif m(e)then
local a=z(e)
local t=T(e)
local e=D(t)
if e~=false and#e==2 and l(a,be)and l(e[0+1],j)then
return i(e[1+1],false)
end
return"#"..tostring(g(h(a,t)))
elseif b(e)then
return"!"..tostring(g(h(U(e),M(e))))
elseif y(e)then
return de(e)
elseif K(e)then
return"$("..tostring(g(N(ie(e)))).." "..tostring(g(oe(e)))..")"
elseif W(e)then
return"%("..tostring(g(re(e))).." "..tostring(g(q(he(e))))..")"
elseif V(e)then
return"@("..tostring(g(N(qe(e)))).." "..tostring(g(ge(e))).." "..tostring(g(q(ke(e))))..")"
elseif P(e)then
return"^("..tostring(g(Ee(e))).." "..tostring(g(q(_e(e))))..")"
end
return k()
end
t.complex_print=g
local function w(i)
local d=J()
local o={d}
local t=0
local function n()
error("MT parse ERROR")
end
local function s(e)
if not e then
return n()
end
end
local function r()
s(#i>t)
local e=string.sub(i,t+1,t+1)
t=t+1
return e
end
while#o~=0 do
local i={}
for t=1,#o do
local o=o[t]
local t=r()
local a
a=function(a)
local e=J()
local t=J()
__TS__ArrayPush(i,e)
__TS__ArrayPush(i,t)
G(o,a(e,t))
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
G(o,at(e))
else
return n()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(_)
elseif t=="!"then
a(I)
elseif t=="$"then
a(function(a,t)return O(pe,e(te,le,Q(a),Q(t)))end)
elseif t=="_"then
G(o,p)
else
return n()
end
end
o=i
end
s(t==#i)
return d
end
local function l(e)
local s={e}
local i=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=H(e)
local t
t=function(e,a,o,t)
i=tostring(i)..tostring(a)
__TS__ArrayPush(h,o(e))
__TS__ArrayPush(h,t(e))
end
if y(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ue(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",z,T)
elseif b(e)then
t(e,"!",U,M)
elseif ye(e)then
local e=Te(e)
t(e,"$",(function(e)return N(ie(e))end),oe)
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
local b=v(h(we,h(h(et,h(h(u,h(Pe,h(f,p))),p)),p)))
local v=v(h(we,h(h(et,h(se,p)),p)))
local function j(a,t)
return _(v,e(a,t))
end
local function q(e)
return _(b,e)
end
local function w(f,p,u,y,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
u=i(u)
if m(u)then
local m=z(u)
local t=T(u)
if c(m,b)then
t=i(t)
if a(t)then
local a=o(t)
local e=i(n(t))
if r(e)then
if h==false then
local a=a
local t=y
local e
e=function()return f(a,t)end
return l(e)
else
local e
e=f
local t
t=p
local o=a
local i=y
local a
a=function()return w(e,t,F(h,o),i)end
return l(a)
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
local t
t=f
local a
a=p
local n=u
local o=o
local i=y
local e
e=function()return w(t,a,n,i,o)end
return l(e)
else
local t
t=f
local a
a=p
local c=u
local u=o
local r=y
local n=h
local i=s("序甲")
local o
o=function()return w(t,a,c,r,_(d,e(e(i),g(e(Q(u),i),Q(n)))))end
return l(o)
end
end
end
end
end
end
if h==false then
return l(function()return p(u,y,f)end)
else
return l(function()return p(u,y,function(e,t)return l(function()return w(f,p,F(h,{e}),t)end)end)end)
end
end
local function s(t,o,a,e)
return w(t,o,a,e)
end
local function e(e,o,i,n)
return k(w((function(t,a)return g(e(t,a))end),(function(e,t,a)return g(o(e,t,function(e,t)return k(a(e,t))end))end),i,n))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=b
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=v
t.new_effect_bind=j
t.new_effect_return=q
t.run_monad_trampoline=s
t.run_monad_stackoverflow=e
return t