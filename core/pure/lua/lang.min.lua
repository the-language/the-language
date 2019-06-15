local function l(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local q,S,f,pe,Oe,ne,he,Z,ee,ve,b,Y,Ae,ye,be,ce,O,ue,X,ze,p,fe,me,L,s,a,o,n,v,r,E,m,_,A,R,g,U,C,V,rt,H,B,te,ae,Ge,Q,_e,xe,qe,j,J,le,re,P,G,je,Ee,F,K,i,I,W,dt,z,t,x,Be,Je,Ke,Ve,Ye,Re,De,We,Me,Pe,Ne,Ce,Le,ie,Te,ke,oe,Ue,ot,M,se,ht,st,T,e,N,de,y,d,k,h,Fe,Se,ge,Ie,it,D,He,nt,tt,u,at,et,Ze,Xe,we,Qe,c,w
function q()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return q()
end
end
function ce(t,e)
return{
ye,
t,
e,
}
end
function O(e)
return e[1]==ye
end
function ue(e)
return e[2]
end
function X(e)
return e[3]
end
function ze(e)
while O(e)do
e=X(e)
end
return e
end
function p(e)
return e[1]==pe
end
function fe(e)
return e[2]
end
function me(e)
return f()[fe(e)]
end
function L(e,t)
if e==t then
return true
end
if fe(e)==fe(t)then
I(e,t)
return true
else
return false
end
end
function s(e,t)
return{
Oe,
e,
t,
}
end
function a(e)
return e[1]==Oe
end
function o(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==ne
end
function E(t,e)
return{
he,
t,
e,
}
end
function m(e)
return e[1]==he
end
function _(e)
return e[2]
end
function A(e)
return e[3]
end
function R(t,e)
return{
Z,
t,
e,
}
end
function g(e)
return e[1]==Z
end
function U(e)
return e[2]
end
function C(e)
return e[3]
end
function V(e)
return e[1]==ee
end
function rt(e)
return e[2]
end
function H(e,t)
return{
ve,
e,
t,
}
end
function B(e)
return e[1]==ve
end
function te(e)
return e[2]
end
function ae(e)
return e[3]
end
function Ge(e,a,t)
return{
Y,
e,
a,
t,
}
end
function Q(e)
return e[1]==Y
end
function _e(e)
return e[2]
end
function xe(e)
return e[3]
end
function qe(e)
return e[4]
end
function j(t,e)
return{
b,
t,
e,
}
end
function J(e)
return e[1]==b
end
function le(e)
return e[2]
end
function re(e)
return e[3]
end
function P(t,e)
return{
Ae,
t,
e,
}
end
function G(e)
return e[1]==Ae
end
function je(e)
return e[2]
end
function Ee(e)
return e[3]
end
function F(e)
local e=h(e)
local function t(e)
e[2]=F(e[2])
e[3]=F(e[3])
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
function K()
return{be}
end
function i(e)
return e[1]==be
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
function W(e,t)
S(i(e))
S(not i(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function dt(t)
local e=K()
W(e,t)
return e
end
function T(a)
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
return T(e)
end
function N(e)
if not V(e)then
return e
end
local e=e
local t={}
while V(e)do
l(t,e)
e=rt(e)
end
for a,t in ipairs(t)do
I(t,e)
end
return e
end
function de(e)
return B(e)or Q(e)or J(e)or G(e)
end
function y(e)
return V(e)or de(e)
end
function d(o,i,t,a)
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
function n(t)
r(t)
if y(t)then
l(a,e)
return d(t,i,{
false,
false,
},a)
end
return t
end
local h={}
e=o
local function o()
t[2]=true
return n(Je)
end
local function u()
local e={}
for t in pairs(h)do
e[t]=true
end
for t in pairs(i)do
e[t]=true
end
return e
end
do
local t=0
while y(e)and t<32 do
l(a,e)
e=k(e)
t=t+1
end
end
while y(e)do
local s=w(e)
if i[s]==true then
return o()
end
if h[s]==true then
t[1]=true
if B(e)then
return o()
elseif J(e)then
local a=le(e)
local e=re(e)
local s={
Ke,
Ve,
Ye,
Re,
De,
We,
Me,
Pe,
Ne,
Ce,
Le,
}
local i=false
for t,e in ipairs(s)do
if c(e,a)then
i=true
break
end
end
if i then
S(#e==1)
S(t[2]==false)
local e=d(e[1],u(),t)
if t[2]then
return n(j(a,{e}))
else
return q()
end
end
if c(a,ie)then
return o()
elseif c(a,Te)then
return o()
elseif c(a,ke)then
return o()
elseif c(a,oe)then
S(#e==3)
S(t[2]==false)
local a=d(e[1],u(),t)
if t[2]then
return n(j(oe,{
a,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif Q(e)then
return o()
elseif G(e)then
return o()
end
return q()
end
h[s]=true
l(a,e)
e=k(e)
end
return r(e)
end
function k(a)
local e=N(a)
local t
S(not V(e))
if B(e)then
t=tt(te(e),ae(e),a)
elseif Q(e)then
t=Xe(_e(e),xe(e),qe(e),a)
elseif J(e)then
t=Ze(le(e),re(e),a)
elseif G(e)then
t=et(je(e),Ee(e),a)
else
t=e
end
t=N(t)
I(e,t)
return t
end
function h(e)
return d(e)
end
function Fe(e)
while y(e)or O(e)do
e=h(ze(e))
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
function Ie(t,o,a)
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
function it(t,a)
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
function D(a)
local o=v
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return E(Be,e(o))
end
function He(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function nt(e,d,h,u)
local i={}
local s={}
local e=N(e)
local t=true
while true do
if r(e)then
return u(s,i)
elseif O(e)then
l(s,ue(e))
e=X(e)
elseif a(e)then
l(i,o(e))
e=n(e)
elseif y(e)then
if t then
t=false
e=k(e)
else
return h()
end
else
return d()
end
end
end
function tt(s,t,d)
local i=k(t)
if y(i)then
return d
end
local function t()return R(z,e(M,e(ke,e(D(s),i))))end
if a(i)then
return nt(i,t,function()return d end,function(i,e)
if#i~=0 then
error("WIP")
end
if c(e[1],se)then
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
return Ge(s,o,a)
elseif c(e[1],ht)then
if#e==1 then
return t()
end
local h=h(H(s,e[2]))
if not m(h)then
return t()
end
local i=k(_(h))
if y(i)then
return d
end
if not p(i)then
return t()
end
if not L(i,x)then
return t()
end
local i=k(A(h))
if y(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=k(n(i))
if y(a)then
return d
end
if not r(a)then
return t()
end
local a={D(s)}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif c(e[1],M)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
l(a,H(s,e[t+1]))
t=t+1
end
end
return j(o,a)
else
local o=H(s,e[1])
local a={}
do
local t=1
while t<#e do
l(a,H(s,e[t+1]))
t=t+1
end
end
return P(o,a)
end
end)
elseif r(i)then
return i
elseif u(i)then
return Ie(s,i,t())
elseif g(i)then
return t()
end
return q()
end
function u(e)
return p(e)or m(e)
end
function et(i,l,c)
local function d()return R(z,e(M,e(Te,e(i,T(l)))))end
i=k(i)
if y(i)then
return c
end
if not m(i)then
return d()
end
local e=h(_(i))
if not(p(e)and L(e,t))then
return d()
end
local t=h(A(i))
if not a(t)then
return d()
end
local e=F(o(t))
local t=h(n(t))
if not(a(t)and r(h(n(t))))then
return d()
end
local h=o(t)
local i=Se
local t=0
while not r(e)do
if u(e)then
local a=v
do
local e=#l-1
while e>=t do
a=s(l[e+1],a)
e=e-1
end
end
i=ge(i,e,a)
t=#l
e=v
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
i=ge(i,o(e),a)
e=n(e)
else
return d()
end
else
return d()
end
end
if#l~=t then
return d()
end
return H(i,h)
end
function Ze(i,t,o)
local function a()return R(z,e(M,e(i,T(t))))end
for n,e in ipairs(at)do
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
function Xe(i,o,t,a)
local function a()return R(z,e(se,e(D(i),o,T(t))))end
if c(o,Ue)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,ot)then
if#t~=2 then
return a()
end
return Qe(i,t[1],t[2],a)
elseif c(o,st)then
if#t~=2 then
return a()
end
return ce(t[1],H(i,t[2]))
end
return a()
end
function we(t)
return e(se,Ue,t)
end
function Qe(m,d,y,w)
d=F(d)
local h={}
local f=false
local i=d
while not r(i)do
if u(i)then
l(h,i)
f=true
i=v
elseif a(i)then
l(h,o(i))
i=n(i)
else
return w()
end
end
local o
if f then
o=T(h)
else
o=d
end
local a={}
He(m,function(t,e)
do
local e=0
while e<#h do
if c(h[e+1],t)then
return
end
e=e+1
end
end
l(a,t)
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
o=s(we(it(m,a[e+1])),o)
e=e-1
end
end
return E(t,e(d,s(we(E(t,e(i,y))),o)))
end
function c(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function i(e,t,a,o)
if c(a(e),a(t))and c(o(e),o(t))then
I(e,t)
return true
else
return false
end
end
if r(t)then
if not r(e)then
return false
end
I(t,v)
I(e,v)
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
return i(t,e,U,C)
elseif m(t)then
if not m(e)then
return false
end
return i(t,e,_,A)
end
return q()
end
function w(e)
e=N(e)
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
e=N(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(s(_(e),A(e))))
elseif g(e)then
return"!"..tostring(w(s(U(e),C(e))))
elseif p(e)then
return me(e)
elseif O(e)then
return";("..tostring(w(ue(e))).." "..tostring(w(X(e)))..")"
elseif B(e)then
return"$("..tostring(w(D(te(e)))).." "..tostring(w(ae(e)))..")"
elseif J(e)then
return"%("..tostring(w(le(e))).." "..tostring(w(T(re(e))))..")"
elseif Q(e)then
return"@("..tostring(w(D(_e(e)))).." "..tostring(w(xe(e))).." "..tostring(w(T(qe(e))))..")"
elseif G(e)then
return"^("..tostring(w(je(e))).." "..tostring(w(T(Ee(e))))..")"
end
return q()
end
local function u()
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
local function i()
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
local function d()
local e=u()
function d()return e end
return e
end
function f()
local e=i()
function f()return e end
return e
end
pe=0
Oe=1
ne=2
he=3
Z=4
ee=5
ve=6
b=7
Y=8
Ae=9
ye=11
be=10
local function ut(e)
return f()[e]~=nil
end
local function it(e)
return{
pe,
e,
}
end
local function nt(e)
return d()[e]~=nil
end
local function i(e)
return it(d()[e])
end
v={ne}
local function Oe(e)
local t=Fe(e)
local function o(e)
e[2]=F(e[2])
e[3]=F(e[3])
if O(e[2])or O(e[3])then
local t=dt(e)
local a=e[2]
local e=e[3]
local a=Oe(a)
local e=Oe(e)
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
z=i("太始初核")
local be=i("符名")
t=i("化滅")
x=i("式形")
local vt=i("等同")
local gt=i("解算")
local Y=i("特定其物")
local f=i("省略一物")
Be=i("映表")
local bt=i("如若")
local u=i("一類何物")
local Z=i("是非")
local pe=i("其子")
local et=i("爻陽")
local tt=i("爻陰")
local pt=i("引用")
local mt=i("應用")
local ct=i("間空")
local ye=i("連頸")
local ne=i("構物")
local he=i("謬誤")
local wt=i("詞素")
local ve=i("列序")
local ft=i("首始")
local yt=i("尾末")
local Xe=i("之物")
local d=i("宇宙亡矣")
local Ze=i("效應")
local Qe=i("註疏")
Je=R(z,e(d,f))
local function b(e)
return E(be,s(z,s(e,v)))
end
local function Ae(a)
return b(e(u,e(t,f,a),Y))
end
local function d(o,a)
return b(e(u,e(t,e(o),f),a))
end
local function ee(a)
return b(e(u,t,e(Z,e(u,a,f))))
end
local dt=Ae(ne)
Ke=d(ne,be)
Ve=d(ne,ve)
Ye=ee(ne)
local rt=Ae(he)
Re=d(he,be)
De=d(he,ve)
We=ee(he)
local lt=Ae(ye)
Me=ee(ye)
Pe=d(ye,ft)
Ne=d(ye,yt)
Ce=ee(wt)
Le=ee(ct)
ie=b(e(u,t,e(Z,vt)))
Te=b(e(u,e(t,s(t,f),f),mt))
ke=b(e(u,t,gt))
local Je=d(ve,e(u,Xe,f))
oe=b(e(u,t,bt))
Ue=b(e(u,x,pt))
ot=b(e(u,e(x,e(t,f,t)),Y))
M=b(e(x,e(z,t)))
se=b(e(x,e(z,x)))
ht=b(e(x,x))
local ot=b(e(u,t,Qe))
st=b(e(u,x,Qe))
local d=E(tt,e())
local he=E(et,e())
local function ve(e,s,i)
local t={}
while a(e)do
l(t,o(e))
e=n(e)
end
if r(e)then
return s(t)
end
return i(t,e)
end
local function M(e)
return ve(e,function(e)return e end,function(e,e)return false end)
end
local function Ue(e)
while V(e)or O(e)do
e=N(ze(e))
end
return e
end
local function Ae(e)
if B(e)then
return e
elseif Q(e)then
error("WIP")
elseif J(e)then
error("WIP")
elseif G(e)then
error("WIP")
end
return q()
end
local function Qe(e)
return te(Ae(e))
end
local function st(e)
return ae(Ae(e))
end
local function ht(e)
if O(e)then
return X(e)
else
return k(e)
end
end
Se={}
local function se(t)
t=h(t)
if not m(t)then
return false
end
local e=h(_(t))
if not p(e)then
return false
end
if not L(e,Be)then
return false
end
e=h(A(t))
if not a(e)then
return false
end
if not r(h(n(e)))then
return false
end
local t={}
local i=h(o(e))
while not r(i)do
if not a(i)then
return false
end
local e=h(o(i))
i=h(n(i))
if not a(e)then
return false
end
local i=o(e)
e=h(n(e))
if not a(e)then
return false
end
local o=o(e)
if not r(h(n(e)))then
return false
end
local a=true
do
local e=0
while e<#t do
if c(t[(e+0)+1],i)then
t[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
l(t,i)
l(t,o)
end
end
return t
end
local function ne(t,a)
return{
t,
1,
function(e)
e=k(e)
if y(e)then
return j(t,{e})
end
if a(e)then
return he
end
return d
end,
}
end
local function ee(t,i,o)
return{
t,
1,
function(e,a)
e=k(e)
if y(e)then
return j(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
at={
ne(Ye,m),
{
dt,
2,
E,
},
ee(Ke,m,_),
ee(Ve,m,A),
ne(We,g),
{
rt,
2,
R,
},
ee(Re,g,U),
ee(De,g,C),
ne(Le,r),
{
lt,
2,
s,
},
ne(Me,a),
ee(Pe,a,o),
ee(Ne,a,n),
{
ie,
2,
function(e,t,i)
if e==t then
return he
end
e=k(e)
t=k(t)
if y(e)or y(t)then
return j(ie,{
e,
t,
})
end
if e==t then
return he
end
local function i(t,e,a)
return j(oe,{
t,
e,
a,
})
end
local function s(e,t)
return i(e,t,d)
end
S(not y(e))
local function i(o,a,e,t)
return s(j(ie,{
e(o),
e(a),
}),j(ie,{
t(o),
t(a),
}))
end
if r(e)then
if not r(e)then
return d
end
return he
elseif p(e)then
if not p(t)then
return d
end
if L(e,t)then
return he
else
return d
end
elseif m(e)then
if not m(t)then
return d
end
return i(e,t,_,A)
elseif a(e)then
if not a(t)then
return d
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return d
end
return i(e,t,U,C)
end
return q()
end,
},
{
Te,
2,
function(i,e,s)
local t={}
local e=h(e)
while a(e)do
l(t,o(e))
e=h(n(e))
end
if not r(e)then
return s()
end
return P(i,t)
end,
},
{
ke,
2,
function(e,a,t)
local e=se(e)
if e==false then
return t()
end
return H(e,a)
end,
},
ne(Ce,p),
{
Je,
1,
function(e,t)
e=k(e)
if y(e)then
return j(Je,{e})
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
if y(e)then
return j(oe,{
e,
a,
o,
})
end
if not m(e)then
return t()
end
local e=h(_(e))
if not p(e)then
return t()
end
if L(e,et)then
return a
end
if L(e,tt)then
return o
end
return t()
end,
},
{
ot,
2,
ce,
},
}
local oe
oe=c
local function d(e,t)
if e==t then
return true
end
e=N(e)
t=N(t)
if e==t then
return true
end
local function i(t,e,a,o)
if d(a(t),a(e))and d(o(t),o(e))then
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
return L(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif g(e)then
if not g(t)then
return false
end
return i(e,t,U,C)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,_,A)
elseif de(e)then
return false
end
return q()
end
local function ee(ee)
local M,y,c,d,m,h,q,_,J,g,V,U,B,I,F,C,O,L,D,A,N,k,w,G,Q,X
function c()
return#M==y
end
function d()
S(not c())
local e=string.sub(M,y+1,y+1)
y=y+1
return e
end
function m(e)
S(string.sub(M,y,y)==e)
y=y-1
end
function h(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function q(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function _()
if c()then
return false
end
local e=d()
if not q(e)then
m(e)
return false
end
while q(e)and not c()do
e=d()
end
if not q(e)then
m(e)
end
return true
end
function J()
if c()then
return false
end
local e=d()
local t=""
if not L(e)then
m(e)
return false
end
while L(e)and not c()do
t=tostring(t)..tostring(e)
e=d()
end
if L(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
if nt(t)then
return i(t)
else
return h("Not Symbol"..tostring(t))
end
end
function g()
if c()then
return false
end
local e=d()
if e~="("then
m(e)
return false
end
local t=K()
local a=t
local function i(a)
local e=K()
W(t,s(a,e))
t=e
end
while true do
_()
if c()then
return h()
end
e=d()
if e==")"then
W(t,v)
return a
end
if e=="."then
_()
local o=D()
W(t,o)
_()
if c()then
return h()
end
e=d()
if e~=")"then
return h()
end
return a
end
m(e)
local e=D()
i(e)
end
end
function V()
if c()then
return false
end
local e=d()
if e~="#"then
m(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
return E(o(e),n(e))
end
function U()
if c()then
return false
end
local e=d()
if e~="!"then
m(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
return R(o(e),n(e))
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
function D()
_()
local e={
g,
X,
V,
U,
B,
I,
F,
C,
O,
}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function A(e)
if e==false then
return h()
end
return e
end
function N()
return not c()
end
function k(e)
A(N())
A(d()==e)
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
J,
a,
V,
U,
B,
I,
F,
C,
O,
}
else
e={
g,
Q,
V,
U,
B,
I,
F,
C,
O,
}
end
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function G(a)
if c()then
return a
end
local o=d()
if o=="."then
local o=w()
return e(u,e(t,e(a),f),o)
elseif o==":"then
local t=w()
return e(u,t,a)
elseif o=="~"then
return e(Z,a)
elseif o=="@"then
local o=w()
return e(u,e(t,s(a,f),f),o)
elseif o=="?"then
return e(u,t,e(Z,a))
elseif o=="/"then
local t={a}
while true do
local e=w(true)
l(t,e)
if c()then
break
end
local e=d()
if e~="/"then
m(e)
break
end
end
return e(pe,T(t))
else
m(o)
return a
end
end
function Q()
if c()then
return false
end
local a=d()
if a=="&"then
A(N())
local t=d()
if t=="+"then
local t=w()
return e(x,e(z,t))
else
m(t)
end
local t=w()
return e(x,t)
elseif a==":"then
A(N())
local a=d()
if a=="&"then
k(">")
local a=w()
return e(u,e(x,e(t,f,a)),Y)
elseif a==">"then
local a=w()
return e(u,e(t,f,a),Y)
else
m(a)
end
local t=w()
return e(u,t,Y)
elseif a=="+"then
local t=w()
return e(z,t)
elseif a=="["then
local e=w()
k("]")
return G(e)
elseif a=="_"then
k(":")
local t=w()
return e(u,t,f)
else
m(a)
local e=J()
if e==false then
return false
end
return G(e)
end
end
function X()
local e=Q()
if e==false then
return false
end
if p(e)then
return e
end
return b(e)
end
M=ee
y=0
local function e(t,i)
return function()
if c()then
return false
end
local e=d()
if e~=t then
m(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
local t=n(e)
if not(a(t)and r(n(t)))then
return h()
end
return i(o(e),o(t))
end
end
local function l(t,s)
return function()
if c()then
return false
end
local e=d()
if e~=t then
m(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
local t=n(e)
if not a(t)then
return h()
end
local i=n(t)
if not(a(i)and r(n(i)))then
return h()
end
return s(o(e),o(t),o(i))
end
end
B=e("$",function(e,t)
local e=se(e)
if e==false then
return h()
end
return H(e,t)
end)
I=e("%",function(e,t)
local t=ve(t,function(e)return e end,function(e,e)return h()end)
return j(e,t)
end)
F=l("@",function(o,a,e)
local t=ve(e,function(e)return e end,function(e,e)return h()end)
local e=se(o)
if e==false then
return h()
end
return Ge(e,a,t)
end)
C=e("^",function(t,e)
local e=ve(e,function(e)return e end,function(e,e)return h()end)
return P(t,e)
end)
O=e(";",function(e,t)return ce(e,t)end)
return D()
end
local function j(c)
local function i(r,l)
if p(r)then
return me(r)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=M(r)
if e~=false and#e==3 and d(e[1],u)then
local h=M(e[2])
if h~=false and#h==3 and d(h[1],t)then
local t=h[2]
local r=M(t)
if r~=false and#r==1 and d(h[3],f)then
return s(tostring(i(r[1],true)).."."..tostring(i(e[3],true)))
elseif a(t)and d(n(t),f)and d(h[3],f)then
return s(tostring(i(o(t),true)).."@"..tostring(i(e[3],true)))
elseif d(t,f)and d(e[3],Y)then
return s(":>"..tostring(i(h[3],true)))
end
end
local a=M(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],Z)then
return s(tostring(i(a[2],true)).."?")
end
if h~=false and#h==2 and d(e[3],Y)and d(h[1],x)then
local e=M(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],f)then
return s(":&>"..tostring(i(e[3],true)))
end
end
local t
if d(e[3],f)then
t="_"
elseif d(e[3],Y)then
t=""
else
t=i(e[3],true)
end
return s(tostring(t)..":"..tostring(i(e[2],true)))
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=M(e[2])
if t~=false and#t==2 and d(t[1],z)then
return s("&+"..tostring(i(t[2],true)))
end
return s("&"..tostring(i(e[2],true)))
elseif d(e[1],Z)then
return s(tostring(i(e[2],true)).."~")
elseif d(e[1],z)then
return s("+"..tostring(i(e[2],true)))
elseif d(e[1],pe)then
local e=M(e[2])
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
return w(r)
else
return w(b(r))
end
end
local e=ee(w(c))
local t=""
local h=""
if r(e)then
return"()"
elseif a(e)then
t="("
h=""
while a(e)do
t=tostring(t)..tostring(h)..tostring(j(o(e)))
h=" "
e=n(e)
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(j(e))..")"
end
return t
elseif m(e)then
local t=_(e)
local a=A(e)
local e=M(a)
if e~=false and#e==2 and d(t,be)and d(e[1],z)then
return i(e[2],false)
end
return"#"..tostring(j(s(t,a)))
elseif g(e)then
return"!"..tostring(j(s(U(e),C(e))))
elseif p(e)then
return me(e)
elseif O(e)then
return";("..tostring(j(ue(e))).." "..tostring(j(X(e)))..")"
elseif B(e)then
return"$("..tostring(j(D(te(e)))).." "..tostring(j(ae(e)))..")"
elseif J(e)then
return"%("..tostring(j(le(e))).." "..tostring(j(T(re(e))))..")"
elseif Q(e)then
return"@("..tostring(j(D(_e(e)))).." "..tostring(j(xe(e))).." "..tostring(j(T(qe(e))))..")"
elseif G(e)then
return"^("..tostring(j(je(e))).." "..tostring(j(T(Ee(e))))..")"
end
return q()
end
local function B(r)
local c=K()
local h={function(e)return W(c,e)end}
local t=0
local function a(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function u(e)
if not e then
return a()
end
end
local function d()
u(#r>t)
local e=string.sub(r,t+1,t+1)
t=t+1
return e
end
local n={}
while#h~=0 do
local t={}
for e,o in ipairs(h)do
local e=d()
local function i(i)
local a=K()
local e=K()
l(t,function(e)return W(a,e)end)
l(t,function(t)return W(e,t)end)
o(i(a,e))
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
if ut(e)then
o(it(e))
else
return a("can_new_symbol_unicodechar_p(\""..tostring(e).."\") == false")
end
elseif e=="."then
i(s)
elseif e=="#"then
i(E)
elseif e=="!"then
i(R)
elseif e=="$"then
local i=false
local e=false
l(t,function(e)
i=e
end)
l(t,function(t)
e=t
end)
l(n,function()
if i==false or e==false then
return q()
else
local t=se(i)
if t==false then
return a()
else
o(H(t,e))
end
end
end)
elseif e=="_"then
o(v)
else
return a()
end
end
h=t
end
u(t==#r)
do
local e=#n-1
while e>=0 do
n[e+1]()
e=e-1
end
end
return c
end
local function S(e)
local s={e}
local t=""
while#s~=0 do
local h={}
for i,e in ipairs(s)do
e=N(e)
local function i(e,o,a,i)
t=tostring(t)..tostring(o)
return l(h,a(e),i(e))
end
if p(e)then
t=tostring(t)..tostring(("^"..tostring(fe(e)).."^"))
elseif a(e)then
i(e,".",o,n)
elseif r(e)then
t=tostring(t)..tostring(("_"))
elseif m(e)then
i(e,"#",_,A)
elseif g(e)then
i(e,"!",U,C)
elseif de(e)then
local e=Ae(e)
i(e,"$",(function(e)return D(te(e))end),ae)
else
return q()
end
end
s=h
end
return t
end
local function z(e)
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
local function I(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local x=b(s(pe,s(s(Ze,s(s(u,s(Xe,s(f,v))),v)),v)))
local q=b(s(pe,s(s(Ze,s(ye,v)),v)))
local function Y(a,t)
return E(q,e(a,t))
end
local function W(e)
return E(x,e)
end
local function b(f,w,u,y,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
u=h(u)
if m(u)then
local m=_(u)
local s=A(u)
if c(m,x)then
s=h(s)
if a(s)then
local a=o(s)
local e=h(n(s))
if r(e)then
if d==false then
local t=a
local e=y
local function a()return f(t,e)end
return l(a)
else
local t
t=f
local e
e=w
local a=a
local o=y
local function i()return b(t,e,P(d,a),o)end
return l(i)
end
end
end
elseif c(m,q)then
s=h(s)
if a(s)then
local u=o(s)
local s=h(n(s))
if a(s)then
local a=o(s)
local o=h(n(s))
if r(o)then
if d==false then
local t
t=f
local e
e=w
local i=u
local a=a
local o=y
local function n()return b(t,e,i,o,a)end
return l(n)
else
local o
o=f
local n
n=w
local r=u
local u=a
local s=y
local h=d
local a=i("序甲")
local function i()return b(o,n,r,s,E(t,e(e(a),p(e(we(u),a),we(h)))))end
return l(i)
end
end
end
end
end
end
if d==false then
return l(function()return w(u,y,f)end)
else
return l(function()return w(u,y,function(t,e)return l(function()return b(f,w,P(d,{t}),e)end)end)end)
end
end
local function d(e,t,o,a)
return b(e,t,o,a)
end
local function u(o,e,t,a)
return I(b((function(e,t)return z(o(e,t))end),(function(o,a,t)return z(e(o,a,function(e,a)return I(t(e,a))end))end),t,a))
end
local t={}
t.new_comment=ce
t.comment_p=O
t.comment_comment=ue
t.comment_x=X
t.un_comment_all=ze
t.can_new_symbol_p=nt
t.new_symbol=i
t.symbol_p=p
t.un_symbol=me
t.symbol_equal_p=L
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=n
t.null_v=v
t.null_p=r
t.new_data=E
t.data_p=m
t.data_name=_
t.data_list=A
t.new_error=R
t.error_p=g
t.error_name=U
t.error_list=C
t.just_p=V
t.evaluate=H
t.apply=P
t.force_all_rec=F
t.force_uncomment_all_rec=Oe
t.jsArray_to_list=T
t.maybe_list_to_jsArray=M
t.new_list=e
t.un_just_all=N
t.un_just_comment_all=Ue
t.delay_p=de
t.delay_just_p=y
t.delay_env=Qe
t.delay_x=st
t.force_all=h
t.force1=k
t.force_uncomment1=ht
t.force_uncomment_all=Fe
t.env_null_v=Se
t.env_set=ge
t.env_get=Ie
t.env2val=D
t.env_foreach=He
t.val2env=se
t.equal_p=oe
t.simple_print=w
t.complex_parse=ee
t.complex_print=j
t.machinetext_parse=B
t.machinetext_print=S
t.trampoline_return=z
t.trampoline_delay=l
t.run_trampoline=I
t.return_effect_systemName=x
t.bind_effect_systemName=q
t.new_effect_bind=Y
t.new_effect_return=W
t.run_monad_trampoline=d
t.run_monad_stackoverflow=u
return t
