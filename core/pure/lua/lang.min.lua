local function d(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local q,S,u,qe,ye,Ie,Te,xe,me,Se,ee,he,b,F,Z,fe,I,ce,K,ze,y,we,le,L,s,a,o,i,v,h,E,m,T,A,D,g,M,C,G,rt,N,B,oe,ie,De,V,_e,Ee,je,j,J,re,de,Y,Q,pe,ve,P,X,l,O,W,dt,z,t,x,Re,ht,He,Ae,Ne,Oe,Le,Ge,Ke,We,Ye,Ve,Pe,te,ge,ke,ae,Be,at,U,ue,st,tt,_,e,H,se,p,n,k,r,Me,Ce,be,Fe,Xe,R,Ue,Je,Ze,w,et,it,nt,Qe,ne,ot,c,f
function q()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return q()
end
end
function fe(t,e)
return{
F,
t,
e,
}
end
function I(e)
return e[1]==F
end
function ce(e)
return e[2]
end
function K(e)
return e[3]
end
function ze(e)
while I(e)do
e=K(e)
end
return e
end
function y(e)
return e[1]==qe
end
function we(e)
return e[2]
end
function le(e)
return u()[we(e)]
end
function L(e,t)
if e==t then
return true
end
if we(e)==we(t)then
O(e,t)
return true
else
return false
end
end
function s(t,e)
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
function h(e)
return e[1]==Ie
end
function E(t,e)
return{
Te,
t,
e,
}
end
function m(e)
return e[1]==Te
end
function T(e)
return e[2]
end
function A(e)
return e[3]
end
function D(e,t)
return{
xe,
e,
t,
}
end
function g(e)
return e[1]==xe
end
function M(e)
return e[2]
end
function C(e)
return e[3]
end
function G(e)
return e[1]==me
end
function rt(e)
return e[2]
end
function N(e,t)
return{
Se,
e,
t,
}
end
function B(e)
return e[1]==Se
end
function oe(e)
return e[2]
end
function ie(e)
return e[3]
end
function De(e,t,a)
return{
he,
e,
t,
a,
}
end
function V(e)
return e[1]==he
end
function _e(e)
return e[2]
end
function Ee(e)
return e[3]
end
function je(e)
return e[4]
end
function j(t,e)
return{
ee,
t,
e,
}
end
function J(e)
return e[1]==ee
end
function re(e)
return e[2]
end
function de(e)
return e[3]
end
function Y(t,e)
return{
b,
t,
e,
}
end
function Q(e)
return e[1]==b
end
function pe(e)
return e[2]
end
function ve(e)
return e[3]
end
function P(e)
local e=r(e)
local function t(e)
e[2]=P(e[2])
e[3]=P(e[3])
return e
end
if m(e)then
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
return{Z}
end
function l(e)
return e[1]==Z
end
function O(e,t)
if e==t then
return
end
e[1]=me
e[2]=t
e[3]=false
e[4]=false
end
function W(e,t)
S(l(e))
S(not l(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function dt(t)
local e=X()
W(e,t)
return e
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
if not G(e)then
return e
end
local e=e
local t={}
while G(e)do
d(t,e)
e=rt(e)
end
for a,t in ipairs(t)do
O(t,e)
end
return e
end
function se(e)
return B(e)or V(e)or J(e)or Q(e)
end
function p(e)
return G(e)or se(e)
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
l(t)
if p(t)then
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
local function u()
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
while p(e)and t<32 do
d(a,e)
e=k(e)
t=t+1
end
end
while p(e)do
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[1]=true
if B(e)then
return o()
elseif J(e)then
local a=re(e)
local e=de(e)
local h={
He,
Ae,
Ne,
Oe,
Le,
Ge,
Ke,
We,
Ye,
Ve,
Pe,
}
local i=false
for t,e in ipairs(h)do
if c(e,a)then
i=true
break
end
end
if i then
S(#e==1)
S(t[2]==false)
local e=n(e[1],u(),t)
if t[2]then
return s(j(a,{e}))
else
return q()
end
end
if c(a,te)then
return o()
elseif c(a,ge)then
return o()
elseif c(a,ke)then
return o()
elseif c(a,ae)then
S(#e==3)
S(t[2]==false)
local a=n(e[1],u(),t)
if t[2]then
return s(j(ae,{
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
elseif Q(e)then
return o()
end
return q()
end
r[h]=true
d(a,e)
e=k(e)
end
return l(e)
end
function k(a)
local e=H(a)
local t
S(not G(e))
if B(e)then
t=Ze(oe(e),ie(e),a)
elseif V(e)then
t=Qe(_e(e),Ee(e),je(e),a)
elseif J(e)then
t=nt(re(e),de(e),a)
elseif Q(e)then
t=it(pe(e),ve(e),a)
else
t=e
end
t=H(t)
O(e,t)
return t
end
function r(e)
return n(e)
end
function Me(e)
while p(e)or I(e)do
e=r(ze(e))
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
function Fe(t,a,o)
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
function Xe(t,a)
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
local a=v
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(Re,e(a))
end
function Ue(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function Je(e,l,u,r)
local t={}
local n={}
local e=H(e)
local s=true
while true do
if h(e)then
return r(n,t)
elseif I(e)then
d(n,ce(e))
e=K(e)
elseif a(e)then
d(t,o(e))
e=i(e)
elseif p(e)then
if s then
s=false
e=k(e)
else
return u()
end
else
return l()
end
end
end
function Ze(s,t,l)
local n=k(t)
if p(n)then
return l
end
local function t()return D(z,e(U,e(ke,e(R(s),n))))end
if a(n)then
return Je(n,t,function()return l end,function(n,e)
if#n~=0 then
error("WIP")
end
if c(e[1],ue)then
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
return De(s,o,a)
elseif c(e[1],st)then
if#e==1 then
return t()
end
local n=r(N(s,e[2]))
if not m(n)then
return t()
end
local r=k(T(n))
if p(r)then
return l
end
if not y(r)then
return t()
end
if not L(r,x)then
return t()
end
local n=k(A(n))
if p(n)then
return l
end
if not a(n)then
return t()
end
local o=o(n)
local a=k(i(n))
if p(a)then
return l
end
if not h(a)then
return t()
end
local a={R(s)}
do
local t=2
while t<#e do
d(a,e[t+1])
t=t+1
end
end
return Y(o,a)
elseif c(e[1],U)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
d(a,N(s,e[t+1]))
t=t+1
end
end
return j(o,a)
else
local o=N(s,e[1])
local a={}
do
local t=1
while t<#e do
d(a,N(s,e[t+1]))
t=t+1
end
end
return Y(o,a)
end
end)
elseif h(n)then
return n
elseif w(n)then
return Fe(s,n,t())
elseif g(n)then
return t()
end
return q()
end
function w(e)
return y(e)or m(e)
end
function it(d,l,u)
local function n()return D(z,e(U,e(ge,e(d,_(l)))))end
d=k(d)
if p(d)then
return u
end
if not m(d)then
return n()
end
local e=r(T(d))
if not(y(e)and L(e,t))then
return n()
end
local t=r(A(d))
if not a(t)then
return n()
end
local e=P(o(t))
local t=r(i(t))
if not(a(t)and h(r(i(t))))then
return n()
end
local d=o(t)
local r=Ce
local t=0
while not h(e)do
if w(e)then
local a=v
do
local e=#l-1
while e>=t do
a=s(l[e+1],a)
e=e-1
end
end
r=be(r,e,a)
t=#l
e=v
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
r=be(r,o(e),a)
e=i(e)
else
return n()
end
else
return n()
end
end
if#l~=t then
return n()
end
return N(r,d)
end
function nt(i,t,o)
local function a()return D(z,e(U,e(i,_(t))))end
for n,e in ipairs(et)do
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
function Qe(i,o,t,a)
local function a()return D(z,e(ue,e(R(i),o,_(t))))end
if c(o,Be)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,at)then
if#t~=2 then
return a()
end
return ot(i,t[1],t[2],a)
elseif c(o,tt)then
if#t~=2 then
return a()
end
return fe(t[1],N(i,t[2]))
end
return a()
end
function ne(t)
return e(ue,Be,t)
end
function ot(u,r,f,y)
r=P(r)
local l={}
local m=false
local n=r
while not h(n)do
if w(n)then
d(l,n)
m=true
n=v
elseif a(n)then
d(l,o(n))
n=i(n)
else
return y()
end
end
local o
if m then
o=_(l)
else
o=r
end
local a={}
Ue(u,function(t,e)
do
local e=0
while e<#l do
if c(l[e+1],t)then
return
end
e=e+1
end
end
d(a,t)
end)
local i=o
do
local e=#a-1
while e>=0 do
i=s(a[e+1],i)
e=e-1
end
end
local o=o
do
local e=#a-1
while e>=0 do
o=s(ne(Xe(u,a[e+1])),o)
e=e-1
end
end
return E(t,e(r,s(ne(E(t,e(i,f))),o)))
end
function c(e,t)
if e==t then
return true
end
e=r(e)
t=r(t)
if e==t then
return true
end
local function n(t,e,o,a)
if c(o(t),o(e))and c(a(t),a(e))then
O(t,e)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
O(e,v)
O(t,v)
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
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,M,C)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,T,A)
end
return q()
end
function f(e)
e=H(e)
local t=""
local n=""
if h(e)then
return"()"
elseif a(e)then
t="("
n=""
while a(e)do
t=tostring(t)..tostring(n)..tostring(f(o(e)))
n=" "
e=H(i(e))
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(f(s(T(e),A(e))))
elseif g(e)then
return"!"..tostring(f(s(M(e),C(e))))
elseif y(e)then
return le(e)
elseif I(e)then
return";("..tostring(f(ce(e))).." "..tostring(f(K(e)))..")"
elseif B(e)then
return"$("..tostring(f(R(oe(e)))).." "..tostring(f(ie(e)))..")"
elseif J(e)then
return"%("..tostring(f(re(e))).." "..tostring(f(_(de(e))))..")"
elseif V(e)then
return"@("..tostring(f(R(_e(e)))).." "..tostring(f(Ee(e))).." "..tostring(f(_(je(e))))..")"
elseif Q(e)then
return"^("..tostring(f(pe(e))).." "..tostring(f(_(ve(e))))..")"
end
return q()
end
local function n()
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
local function w()
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
local function l()
local e=n()
function l()return e end
return e
end
function u()
local e=w()
function u()return e end
return e
end
qe=0
ye=1
Ie=2
Te=3
xe=4
me=5
Se=6
ee=7
he=8
b=9
F=11
Z=10
local function pt(e)
return u()[e]~=nil
end
local function it(e)
return{
qe,
e,
}
end
local function ot(e)
return l()[e]~=nil
end
local function n(e)
return it(l()[e])
end
v={Ie}
local function Ie(e)
local t=Me(e)
local function o(e)
e[2]=P(e[2])
e[3]=P(e[3])
if I(e[2])or I(e[3])then
local t=dt(e)
local a=e[2]
local e=e[3]
local a=Ie(a)
local e=Ie(e)
t[2]=a
t[3]=e
return t
else
return e
end
end
if m(t)then
return o(t)
elseif g(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=n("太始初核")
local qe=n("符名")
t=n("化滅")
x=n("式形")
local rt=n("等同")
local ct=n("解算")
local F=n("特定其物")
local w=n("省略一物")
Re=n("映表")
local dt=n("如若")
local u=n("一類何物")
local ee=n("是非")
local Te=n("其子")
local nt=n("爻陽")
local Ze=n("爻陰")
local ft=n("引用")
local wt=n("應用")
local mt=n("間空")
local he=n("連頸")
local ye=n("構物")
local me=n("謬誤")
local lt=n("詞素")
local xe=n("列序")
local ut=n("首始")
local yt=n("尾末")
local Je=n("之物")
local l=n("宇宙亡矣")
local Qe=n("效應")
local Xe=n("註疏")
ht=D(z,e(l,w))
local function b(e)
return E(qe,s(z,s(e,v)))
end
local function Se(a)
return b(e(u,e(t,w,a),F))
end
local function l(a,o)
return b(e(u,e(t,e(a),w),o))
end
local function Z(a)
return b(e(u,t,e(ee,e(u,a,w))))
end
local gt=Se(ye)
He=l(ye,qe)
Ae=l(ye,xe)
Ne=Z(ye)
local bt=Se(me)
Oe=l(me,qe)
Le=l(me,xe)
Ge=Z(me)
local vt=Se(he)
Ke=Z(he)
We=l(he,ut)
Ye=l(he,yt)
Ve=Z(lt)
Pe=Z(mt)
te=b(e(u,t,e(ee,rt)))
ge=b(e(u,e(t,s(t,w),w),wt))
ke=b(e(u,t,ct))
local ht=l(xe,e(u,Je,w))
ae=b(e(u,t,dt))
Be=b(e(u,x,ft))
at=b(e(u,e(x,e(t,w,t)),F))
U=b(e(x,e(z,t)))
ue=b(e(x,e(z,x)))
st=b(e(x,x))
local Be=b(e(u,t,Xe))
tt=b(e(u,x,Xe))
local l=E(Ze,e())
local me=E(nt,e())
local function xe(e,n,s)
local t={}
while a(e)do
d(t,o(e))
e=i(e)
end
if h(e)then
return n(t)
end
return s(t,e)
end
local function U(e)
return xe(e,function(e)return e end,function(e,e)return false end)
end
local function at(e)
while G(e)or I(e)do
e=H(ze(e))
end
return e
end
local function Se(e)
if B(e)then
return e
elseif V(e)then
error("WIP")
elseif J(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return q()
end
local function tt(e)
return oe(Se(e))
end
local function Xe(e)
return ie(Se(e))
end
local function st(e)
if I(e)then
return K(e)
else
return k(e)
end
end
Ce={}
local function ye(t)
t=r(t)
if not m(t)then
return false
end
local e=r(T(t))
if not y(e)then
return false
end
if not L(e,Re)then
return false
end
e=r(A(t))
if not a(e)then
return false
end
if not h(r(i(e)))then
return false
end
local t={}
local n=r(o(e))
while not h(n)do
if not a(n)then
return false
end
local e=r(o(n))
n=r(i(n))
if not a(e)then
return false
end
local n=o(e)
e=r(i(e))
if not a(e)then
return false
end
local a=o(e)
if not h(r(i(e)))then
return false
end
local o=true
do
local e=0
while e<#t do
if c(t[(e+0)+1],n)then
t[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
d(t,n)
d(t,a)
end
end
return t
end
local function ue(t,a)
return{
t,
1,
function(e)
e=k(e)
if p(e)then
return j(t,{e})
end
if a(e)then
return me
end
return l
end,
}
end
local function Z(t,o,a)
return{
t,
1,
function(e,i)
e=k(e)
if p(e)then
return j(t,{e})
end
if o(e)then
return a(e)
end
return i()
end,
}
end
et={
ue(Ne,m),
{
gt,
2,
E,
},
Z(He,m,T),
Z(Ae,m,A),
ue(Ge,g),
{
bt,
2,
D,
},
Z(Oe,g,M),
Z(Le,g,C),
ue(Pe,h),
{
vt,
2,
s,
},
ue(Ke,a),
Z(We,a,o),
Z(Ye,a,i),
{
te,
2,
function(e,t,n)
if e==t then
return me
end
e=k(e)
t=k(t)
if p(e)or p(t)then
return j(te,{
e,
t,
})
end
if e==t then
return me
end
local function n(e,t,a)
return j(ae,{
e,
t,
a,
})
end
local function s(t,e)
return n(t,e,l)
end
S(not p(e))
local function n(a,t,e,o)
return s(j(te,{
e(a),
e(t),
}),j(te,{
o(a),
o(t),
}))
end
if h(e)then
if not h(e)then
return l
end
return me
elseif y(e)then
if not y(t)then
return l
end
if L(e,t)then
return me
else
return l
end
elseif m(e)then
if not m(t)then
return l
end
return n(e,t,T,A)
elseif a(e)then
if not a(t)then
return l
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return l
end
return n(e,t,M,C)
end
return q()
end,
},
{
ge,
2,
function(s,e,n)
local t={}
local e=r(e)
while a(e)do
d(t,o(e))
e=r(i(e))
end
if not h(e)then
return n()
end
return Y(s,t)
end,
},
{
ke,
2,
function(e,a,t)
local e=ye(e)
if e==false then
return t()
end
return N(e,a)
end,
},
ue(Ve,y),
{
ht,
1,
function(e,t)
e=k(e)
if p(e)then
return j(ht,{e})
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
function(e,a,o,t)
e=k(e)
if p(e)then
return j(ae,{
e,
a,
o,
})
end
if not m(e)then
return t()
end
local e=r(T(e))
if not y(e)then
return t()
end
if L(e,nt)then
return a
end
if L(e,Ze)then
return o
end
return t()
end,
},
{
Be,
2,
fe,
},
}
local te
te=c
local function l(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function n(t,e,a,o)
if l(a(t),a(e))and l(o(t),o(e))then
O(t,e)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
O(e,v)
O(t,v)
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
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,M,C)
elseif m(e)then
if not m(t)then
return false
end
return n(e,t,T,A)
elseif se(e)then
return false
end
return q()
end
local function Z(Z)
local B,p,c,l,m,r,q,T,Q,g,H,O,I,R,M,P,V,L,U,A,C,k,f,K,G,J
function c()
return#B==p
end
function l()
S(not c())
local e=string.sub(B,p+1,p+1)
p=p+1
return e
end
function m(e)
S(string.sub(B,p,p)==e)
p=p-1
end
function r(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function q(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if c()then
return false
end
local e=l()
if not q(e)then
m(e)
return false
end
while q(e)and not c()do
e=l()
end
if not q(e)then
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
if not L(e)then
m(e)
return false
end
while L(e)and not c()do
t=tostring(t)..tostring(e)
e=l()
end
if L(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if ot(t)then
return n(t)
else
return r("Not Symbol"..tostring(t))
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
local t=X()
local a=t
local function o(a)
local e=X()
W(t,s(a,e))
t=e
end
while true do
T()
if c()then
return r()
end
e=l()
if e==")"then
W(t,v)
return a
end
if e=="."then
T()
local o=U()
W(t,o)
T()
if c()then
return r()
end
e=l()
if e~=")"then
return r()
end
return a
end
m(e)
local e=U()
o(e)
end
end
function H()
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
return r()
end
if not a(e)then
return r()
end
return E(o(e),i(e))
end
function O()
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
return r()
end
if not a(e)then
return r()
end
return D(o(e),i(e))
end
function L(e)
if q(e)then
return false
end
for a,t in ipairs({
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
})do
if t==e then
return false
end
end
return true
end
function U()
T()
local e={
g,
J,
H,
O,
I,
R,
M,
P,
V,
}
for t,e in ipairs(e)do
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
function C()
return not c()
end
function k(e)
A(C())
A(l()==e)
end
function f(e)
if e==nil then
e=false
end
local function a()
k("[")
local e=f()
k("]")
return e
end
local t
if e then
t={
g,
Q,
a,
H,
O,
I,
R,
M,
P,
V,
}
else
t={
g,
G,
H,
O,
I,
R,
M,
P,
V,
}
end
for t,e in ipairs(t)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function K(a)
if c()then
return a
end
local o=l()
if o=="."then
local o=f()
return e(u,e(t,e(a),w),o)
elseif o==":"then
local t=f()
return e(u,t,a)
elseif o=="~"then
return e(ee,a)
elseif o=="@"then
local o=f()
return e(u,e(t,s(a,w),w),o)
elseif o=="?"then
return e(u,t,e(ee,a))
elseif o=="/"then
local t={a}
while true do
local e=f(true)
d(t,e)
if c()then
break
end
local e=l()
if e~="/"then
m(e)
break
end
end
return e(Te,_(t))
else
m(o)
return a
end
end
function G()
if c()then
return false
end
local a=l()
if a=="&"then
A(C())
local t=l()
if t=="+"then
local t=f()
return e(x,e(z,t))
else
m(t)
end
local t=f()
return e(x,t)
elseif a==":"then
A(C())
local a=l()
if a=="&"then
k(">")
local a=f()
return e(u,e(x,e(t,w,a)),F)
elseif a==">"then
local a=f()
return e(u,e(t,w,a),F)
else
m(a)
end
local t=f()
return e(u,t,F)
elseif a=="+"then
local t=f()
return e(z,t)
elseif a=="["then
local e=f()
k("]")
return K(e)
elseif a=="_"then
k(":")
local t=f()
return e(u,t,w)
else
m(a)
local e=Q()
if e==false then
return false
end
return K(e)
end
end
function J()
local e=G()
if e==false then
return false
end
if y(e)then
return e
end
return b(e)
end
B=Z
p=0
local function e(t,n)
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
return r()
end
if not a(e)then
return r()
end
local t=i(e)
if not(a(t)and h(i(t)))then
return r()
end
return n(o(e),o(t))
end
end
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
return r()
end
if not a(e)then
return r()
end
local n=i(e)
if not a(n)then
return r()
end
local t=i(n)
if not(a(t)and h(i(t)))then
return r()
end
return s(o(e),o(n),o(t))
end
end
I=e("$",function(e,t)
local e=ye(e)
if e==false then
return r()
end
return N(e,t)
end)
R=e("%",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return r()end)
return j(t,e)
end)
M=s("@",function(o,a,e)
local t=xe(e,function(e)return e end,function(e,e)return r()end)
local e=ye(o)
if e==false then
return r()
end
return De(e,a,t)
end)
P=e("^",function(t,e)
local e=xe(e,function(e)return e end,function(e,e)return r()end)
return Y(t,e)
end)
V=e(";",function(t,e)return fe(t,e)end)
return U()
end
local function j(c)
local function n(r,d)
if y(r)then
return le(r)
end
local function h(e)
if d then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(r)
if e~=false and#e==3 and l(e[1],u)then
local s=U(e[2])
if s~=false and#s==3 and l(s[1],t)then
local t=s[2]
local r=U(t)
if r~=false and#r==1 and l(s[3],w)then
return h(tostring(n(r[1],true)).."."..tostring(n(e[3],true)))
elseif a(t)and l(i(t),w)and l(s[3],w)then
return h(tostring(n(o(t),true)).."@"..tostring(n(e[3],true)))
elseif l(t,w)and l(e[3],F)then
return h(":>"..tostring(n(s[3],true)))
end
end
local a=U(e[3])
if l(e[2],t)and a~=false and#a==2 and l(a[1],ee)then
return h(tostring(n(a[2],true)).."?")
end
if s~=false and#s==2 and l(e[3],F)and l(s[1],x)then
local e=U(s[2])
if e~=false and#e==3 and l(e[1],t)and l(e[2],w)then
return h(":&>"..tostring(n(e[3],true)))
end
end
local t
if l(e[3],w)then
t="_"
elseif l(e[3],F)then
t=""
else
t=n(e[3],true)
end
return h(tostring(t)..":"..tostring(n(e[2],true)))
elseif e~=false and#e==2 then
if l(e[1],x)then
local t=U(e[2])
if t~=false and#t==2 and l(t[1],z)then
return h("&+"..tostring(n(t[2],true)))
end
return h("&"..tostring(n(e[2],true)))
elseif l(e[1],ee)then
return h(tostring(n(e[2],true)).."~")
elseif l(e[1],z)then
return h("+"..tostring(n(e[2],true)))
elseif l(e[1],Te)then
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
return h(a)
end
end
end
if d then
return f(r)
else
return f(b(r))
end
end
local e=Z(f(c))
local t=""
local r=""
if h(e)then
return"()"
elseif a(e)then
t="("
r=""
while a(e)do
t=tostring(t)..tostring(r)..tostring(j(o(e)))
r=" "
e=i(e)
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(j(e))..")"
end
return t
elseif m(e)then
local a=T(e)
local t=A(e)
local e=U(t)
if e~=false and#e==2 and l(a,qe)and l(e[1],z)then
return n(e[2],false)
end
return"#"..tostring(j(s(a,t)))
elseif g(e)then
return"!"..tostring(j(s(M(e),C(e))))
elseif y(e)then
return le(e)
elseif I(e)then
return";("..tostring(j(ce(e))).." "..tostring(j(K(e)))..")"
elseif B(e)then
return"$("..tostring(j(R(oe(e)))).." "..tostring(j(ie(e)))..")"
elseif J(e)then
return"%("..tostring(j(re(e))).." "..tostring(j(_(de(e))))..")"
elseif V(e)then
return"@("..tostring(j(R(_e(e)))).." "..tostring(j(Ee(e))).." "..tostring(j(_(je(e))))..")"
elseif Q(e)then
return"^("..tostring(j(pe(e))).." "..tostring(j(_(ve(e))))..")"
end
return q()
end
local function S(h)
local l=X()
local r={function(e)return W(l,e)end}
local t=0
local function a(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function c(e)
if not e then
return a()
end
end
local function u()
c(#h>t)
local e=string.sub(h,t+1,t+1)
t=t+1
return e
end
local n={}
while#r~=0 do
local t={}
for e,o in ipairs(r)do
local e=u()
local function i(i)
local e=X()
local a=X()
d(t,function(t)return W(e,t)end)
d(t,function(e)return W(a,e)end)
o(i(e,a))
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
if pt(e)then
o(it(e))
else
return a("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
i(s)
elseif e=="#"then
i(E)
elseif e=="!"then
i(D)
elseif e=="$"then
local i=false
local e=false
d(t,function(e)
i=e
end)
d(t,function(t)
e=t
end)
d(n,function()
if i==false or e==false then
return q()
else
local t=ye(i)
if t==false then
return a()
else
o(N(t,e))
end
end
end)
elseif e=="_"then
o(v)
else
return a()
end
end
r=t
end
c(t==#h)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return l
end
local function l(e,t,s)
e=H(e)
local function n(e,i,o,a)
t(i)
s(o(e))
return s(a(e))
end
if y(e)then
t("^")
t(we(e))
return t("^")
elseif a(e)then
return n(e,".",o,i)
elseif h(e)then
return t("_")
elseif m(e)then
return n(e,"#",T,A)
elseif g(e)then
return n(e,"!",M,C)
elseif se(e)then
local e=Se(e)
return n(e,"$",(function(e)return R(oe(e))end),ie)
else
return q()
end
end
local function q(a)
local t={}
local e={}
for o,a in ipairs(a)do
l(a,function(e)return d(t,e)end,function(t)return d(e,t)end)
end
return{
t,
e,
}
end
local function F(e)
local e={e}
local t=""
while#e~=0 do
local a=q(e)
local i=a[1]
local o=a[2]
for o,a in ipairs(i)do
t=tostring(t)..tostring(a)
end
e=o
end
return t
end
local function x(e)
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
local function O(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local q=b(s(Te,s(s(Qe,s(s(u,s(Je,s(w,v))),v)),v)))
local z=b(s(Te,s(s(Qe,s(he,v)),v)))
local function V(a,t)
return E(z,e(a,t))
end
local function W(e)
return E(q,e)
end
local function b(y,f,u,w,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
u=r(u)
if m(u)then
local m=T(u)
local s=A(u)
if c(m,q)then
s=r(s)
if a(s)then
local a=o(s)
local e=r(i(s))
if h(e)then
if d==false then
local a=a
local t=w
local function e()return y(a,t)end
return l(e)
else
local t
t=y
local e
e=f
local o=a
local a=w
local function i()return b(t,e,Y(d,o),a)end
return l(i)
end
end
end
elseif c(m,z)then
s=r(s)
if a(s)then
local u=o(s)
local s=r(i(s))
if a(s)then
local a=o(s)
local o=r(i(s))
if h(o)then
if d==false then
local t
t=y
local e
e=f
local n=u
local o=a
local i=w
local function a()return b(t,e,n,i,o)end
return l(a)
else
local i
i=y
local o
o=f
local r=u
local h=a
local s=w
local d=d
local a=n("序甲")
local function n()return b(i,o,r,s,E(t,e(e(a),p(e(ne(h),a),ne(d)))))end
return l(n)
end
end
end
end
end
end
if d==false then
return l(function()return f(u,w,y)end)
else
return l(function()return f(u,w,function(e,t)return l(function()return b(y,f,Y(d,{e}),t)end)end)end)
end
end
local function d(t,e,a,o)
return b(t,e,a,o)
end
local function u(a,i,n,o)
return O(b((function(t,e)return x(a(t,e))end),(function(e,t,a)return x(i(e,t,function(e,t)return O(a(e,t))end))end),n,o))
end
local t={}
t.new_comment=fe
t.comment_p=I
t.comment_comment=ce
t.comment_x=K
t.un_comment_all=ze
t.can_new_symbol_p=ot
t.new_symbol=n
t.symbol_p=y
t.un_symbol=le
t.symbol_equal_p=L
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=i
t.null_v=v
t.null_p=h
t.new_data=E
t.data_p=m
t.data_name=T
t.data_list=A
t.new_error=D
t.error_p=g
t.error_name=M
t.error_list=C
t.just_p=G
t.evaluate=N
t.apply=Y
t.force_all_rec=P
t.force_uncomment_all_rec=Ie
t.jsArray_to_list=_
t.maybe_list_to_jsArray=U
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=at
t.delay_p=se
t.delay_just_p=p
t.delay_env=tt
t.delay_x=Xe
t.force_all=r
t.force1=k
t.force_uncomment1=st
t.force_uncomment_all=Me
t.env_null_v=Ce
t.env_set=be
t.env_get=Fe
t.env2val=R
t.env_foreach=Ue
t.val2env=ye
t.equal_p=te
t.simple_print=f
t.complex_parse=Z
t.complex_print=j
t.machinetext_parse=S
t.machinetext_print=F
t.trampoline_return=x
t.trampoline_delay=l
t.run_trampoline=O
t.return_effect_systemName=q
t.bind_effect_systemName=z
t.new_effect_bind=V
t.new_effect_return=W
t.run_monad_trampoline=d
t.run_monad_stackoverflow=u
return t
