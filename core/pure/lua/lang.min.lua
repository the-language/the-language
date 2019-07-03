local function p(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ne(a,...)
local t=({...})
do
local e=#t-1
while e>=0 do
table.insert(a,1,t[e+1])
e=e-1
end
end
return#a
end
local q,S,f,Ve,Ie,Ae,v,M,Y,se,te,pe,he,ye,oe,ne,O,we,G,qe,y,le,ue,R,s,a,o,n,g,h,T,c,E,A,L,k,U,C,Q,rt,H,B,Z,J,Oe,P,ze,Ee,xe,j,K,ce,de,W,V,Te,je,F,ge,i,N,fe,ht,z,t,x,Se,dt,He,We,Fe,Ye,Pe,Me,De,Re,Le,Ue,Ce,ae,be,ve,ee,ke,lt,X,ie,st,at,_,e,I,me,w,d,b,r,Qe,Be,_e,Ge,et,D,Ke,ot,nt,u,it,tt,Ze,Xe,re,Je,l,m
function q()
error("TheLanguage PANIC")
end
function S(e)
if not e then
return q()
end
end
function ne(e,t)
return{
ye,
e,
t,
}
end
function O(e)
return e[1]==ye
end
function we(e)
return e[2]
end
function G(e)
return e[3]
end
function qe(e)
while O(e)do
e=G(e)
end
return e
end
function y(e)
return e[1]==Ve
end
function le(e)
return e[2]
end
function ue(e)
return f()[le(e)]
end
function R(t,e)
if t==e then
return true
end
if le(t)==le(e)then
N(t,e)
return true
else
return false
end
end
function s(t,e)
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
function n(e)
return e[3]
end
function h(e)
return e[1]==Ae
end
function T(e,t)
return{
v,
e,
t,
}
end
function c(e)
return e[1]==v
end
function E(e)
return e[2]
end
function A(e)
return e[3]
end
function L(e,t)
return{
M,
e,
t,
}
end
function k(e)
return e[1]==M
end
function U(e)
return e[2]
end
function C(e)
return e[3]
end
function Q(e)
return e[1]==Y
end
function rt(e)
return e[2]
end
function H(e,t)
return{
se,
e,
t,
}
end
function B(e)
return e[1]==se
end
function Z(e)
return e[2]
end
function J(e)
return e[3]
end
function Oe(e,t,a)
return{
pe,
e,
t,
a,
}
end
function P(e)
return e[1]==pe
end
function ze(e)
return e[2]
end
function Ee(e)
return e[3]
end
function xe(e)
return e[4]
end
function j(t,e)
return{
te,
t,
e,
}
end
function K(e)
return e[1]==te
end
function ce(e)
return e[2]
end
function de(e)
return e[3]
end
function W(e,t)
return{
he,
e,
t,
}
end
function V(e)
return e[1]==he
end
function Te(e)
return e[2]
end
function je(e)
return e[3]
end
function F(e)
local e=r(e)
local function t(e)
e[2]=F(e[2])
e[3]=F(e[3])
return e
end
if c(e)then
return t(e)
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function ge()
return{oe}
end
function i(e)
return e[1]==oe
end
function N(e,t)
if e==t then
return
end
e[1]=Y
e[2]=t
e[3]=false
e[4]=false
end
function fe(e,t)
S(i(e))
S(not i(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function ht(t)
local e=ge()
fe(e,t)
return e
end
function _(a)
local t=g
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
function I(e)
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
p(t,e)
e=rt(e)
end
for a,t in ipairs(t)do
N(t,e)
end
return e
end
function me(e)
return B(e)or P(e)or K(e)or V(e)
end
function w(e)
return Q(e)or me(e)
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
N(e,t)
do
local e=0
while e<#a do
N(a[e+1],t)
e=e+1
end
end
return t
end
function n(t)
r(t)
if w(t)then
p(a,e)
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
return n(dt)
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
while w(e)and t<32 do
p(a,e)
e=b(e)
t=t+1
end
end
while w(e)do
local s=m(e)
if i[s]==true then
return o()
end
if h[s]==true then
t[1]=true
if B(e)then
return o()
elseif K(e)then
local a=ce(e)
local e=de(e)
local s={
He,
We,
Fe,
Ye,
Pe,
Me,
De,
Re,
Le,
Ue,
Ce,
}
local i=false
for t,e in ipairs(s)do
if l(e,a)then
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
if l(a,ae)then
return o()
elseif l(a,be)then
return o()
elseif l(a,ve)then
return o()
elseif l(a,ee)then
S(#e==3)
S(t[2]==false)
local a=d(e[1],u(),t)
if t[2]then
return n(j(ee,{
a,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif P(e)then
return o()
elseif V(e)then
return o()
end
return q()
end
h[s]=true
p(a,e)
e=b(e)
end
return r(e)
end
function b(a)
local e=I(a)
local t
S(not Q(e))
if B(e)then
t=nt(Z(e),J(e),a)
elseif P(e)then
t=Xe(ze(e),Ee(e),xe(e),a)
elseif K(e)then
t=Ze(ce(e),de(e),a)
elseif V(e)then
t=tt(Te(e),je(e),a)
else
t=e
end
t=I(t)
N(e,t)
return t
end
function r(e)
return d(e)
end
function Qe(e)
while w(e)or O(e)do
e=r(qe(e))
end
return e
end
function _e(a,o,i)
local t={}
do
local e=0
while e<#a do
if l(a[(e+0)+1],o)then
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
function Ge(t,a,o)
do
local e=0
while e<#t do
if l(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function et(t,a)
do
local e=0
while e<#t do
if l(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function D(o)
local a=g
do
local t=0
while t<#o do
a=s(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return T(Se,e(a))
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
function ot(e,d,r,l)
local s={}
local i={}
local e=I(e)
local t=true
while true do
if h(e)then
return l(i,s)
elseif O(e)then
p(i,we(e))
e=G(e)
elseif a(e)then
p(s,o(e))
e=n(e)
elseif w(e)then
if t then
t=false
e=b(e)
else
return r()
end
else
return d()
end
end
end
function nt(s,t,d)
local i=b(t)
if w(i)then
return d
end
local function t()return L(z,e(X,e(ve,e(D(s),i))))end
if a(i)then
return ot(i,t,function()return d end,function(i,e)
if#i~=0 then
error("WIP")
end
if l(e[1],ie)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
p(a,e[t+1])
t=t+1
end
end
return Oe(s,o,a)
elseif l(e[1],st)then
if#e==1 then
return t()
end
local i=r(H(s,e[2]))
if not c(i)then
return t()
end
local r=b(E(i))
if w(r)then
return d
end
if not y(r)then
return t()
end
if not R(r,x)then
return t()
end
local i=b(A(i))
if w(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=b(n(i))
if w(a)then
return d
end
if not h(a)then
return t()
end
local a={D(s)}
do
local t=2
while t<#e do
p(a,e[t+1])
t=t+1
end
end
return W(o,a)
elseif l(e[1],X)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
p(a,H(s,e[t+1]))
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
p(a,H(s,e[t+1]))
t=t+1
end
end
return W(o,a)
end
end)
elseif h(i)then
return i
elseif u(i)then
return Ge(s,i,t())
elseif k(i)then
return t()
end
return q()
end
function u(e)
return y(e)or c(e)
end
function tt(l,i,m)
local function d()return L(z,e(X,e(be,e(l,_(i)))))end
l=b(l)
if w(l)then
return m
end
if not c(l)then
return d()
end
local e=r(E(l))
if not(y(e)and R(e,t))then
return d()
end
local t=r(A(l))
if not a(t)then
return d()
end
local e=F(o(t))
local t=r(n(t))
if not(a(t)and h(r(n(t))))then
return d()
end
local l=o(t)
local r=Be
local t=0
while not h(e)do
if u(e)then
local a=g
do
local e=#i-1
while e>=t do
a=s(i[e+1],a)
e=e-1
end
end
r=_e(r,e,a)
t=#i
e=g
elseif a(e)then
if t<#i then
local a=i[t+1]
t=t+1
r=_e(r,o(e),a)
e=n(e)
else
return d()
end
else
return d()
end
end
if#i~=t then
return d()
end
return H(r,l)
end
function Ze(i,t,o)
local function a()return L(z,e(X,e(i,_(t))))end
for n,e in ipairs(it)do
if l(i,e[1])then
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
local function a()return L(z,e(ie,e(D(i),o,_(t))))end
if l(o,ke)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,lt)then
if#t~=2 then
return a()
end
return Je(i,t[1],t[2],a)
elseif l(o,at)then
if#t~=2 then
return a()
end
return ne(t[1],H(i,t[2]))
end
return a()
end
function re(t)
return e(ie,ke,t)
end
function Je(m,r,f,w)
r=F(r)
local d={}
local c=false
local i=r
while not h(i)do
if u(i)then
p(d,i)
c=true
i=g
elseif a(i)then
p(d,o(i))
i=n(i)
else
return w()
end
end
local o
if c then
o=_(d)
else
o=r
end
local a={}
Ke(m,function(t,e)
do
local e=0
while e<#d do
if l(d[e+1],t)then
return
end
e=e+1
end
end
p(a,t)
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
o=s(re(et(m,a[e+1])),o)
e=e-1
end
end
return T(t,e(r,s(re(T(t,e(i,f))),o)))
end
function l(e,t)
if e==t then
return true
end
e=r(e)
t=r(t)
if e==t then
return true
end
local function i(t,e,a,o)
if l(a(t),a(e))and l(o(t),o(e))then
N(t,e)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
N(e,t)
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
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,U,C)
elseif c(e)then
if not c(t)then
return false
end
return i(e,t,E,A)
end
return q()
end
function m(e)
e=I(e)
local t=""
local i=""
if h(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(m(o(e)))
i=" "
e=I(n(e))
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif c(e)then
return"#"..tostring(m(s(E(e),A(e))))
elseif k(e)then
return"!"..tostring(m(s(U(e),C(e))))
elseif y(e)then
return ue(e)
elseif O(e)then
return";("..tostring(m(we(e))).." "..tostring(m(G(e)))..")"
elseif B(e)then
return"$("..tostring(m(D(Z(e)))).." "..tostring(m(J(e)))..")"
elseif K(e)then
return"%("..tostring(m(ce(e))).." "..tostring(m(_(de(e))))..")"
elseif P(e)then
return"@("..tostring(m(D(ze(e)))).." "..tostring(m(Ee(e))).." "..tostring(m(_(xe(e))))..")"
elseif V(e)then
return"^("..tostring(m(Te(e))).." "..tostring(m(_(je(e))))..")"
end
return q()
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
local e=i()
function d()return e end
return e
end
function f()
local e=u()
function f()return e end
return e
end
Ve=0
Ie=1
Ae=2
v=3
M=4
Y=5
se=6
te=7
pe=8
he=9
ye=11
oe=10
local function rt(e)
return f()[e]~=nil
end
local function Ze(e)
return{
Ve,
e,
}
end
local function et(e)
return d()[e]~=nil
end
local function i(e)
return Ze(d()[e])
end
g={Ae}
local function Ve(e)
local t=Qe(e)
local function o(e)
e[2]=F(e[2])
e[3]=F(e[3])
if O(e[2])or O(e[3])then
local t=ht(e)
local o=e[2]
local a=e[3]
local e=Ve(o)
local a=Ve(a)
t[2]=e
t[3]=a
return t
else
return e
end
end
if c(t)then
return o(t)
elseif k(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=i("太始初核")
local ye=i("符名")
t=i("化滅")
x=i("式形")
local ct=i("等同")
local pt=i("解算")
local Y=i("特定其物")
local f=i("省略一物")
Se=i("映表")
local yt=i("如若")
local u=i("一類何物")
local te=i("是非")
local pe=i("其子")
local Xe=i("爻陽")
local tt=i("爻陰")
local gt=i("引用")
local bt=i("應用")
local wt=i("間空")
local oe=i("連頸")
local se=i("構物")
local he=i("謬誤")
local vt=i("詞素")
local Ie=i("列序")
local ft=i("首始")
local mt=i("尾末")
local Je=i("之物")
local d=i("宇宙亡矣")
local nt=i("效應")
local ot=i("註疏")
dt=L(z,e(d,f))
local function v(e)
return T(ye,s(z,s(e,g)))
end
local function Ae(a)
return v(e(u,e(t,f,a),Y))
end
local function d(a,o)
return v(e(u,e(t,e(a),f),o))
end
local function M(a)
return v(e(u,t,e(te,e(u,a,f))))
end
local ht=Ae(se)
He=d(se,ye)
We=d(se,Ie)
Fe=M(se)
local dt=Ae(he)
Ye=d(he,ye)
Pe=d(he,Ie)
Me=M(he)
local ut=Ae(oe)
De=M(oe)
Re=d(oe,ft)
Le=d(oe,mt)
Ue=M(vt)
Ce=M(wt)
ae=v(e(u,t,e(te,ct)))
be=v(e(u,e(t,s(t,f),f),bt))
ve=v(e(u,t,pt))
local Ie=d(Ie,e(u,Je,f))
ee=v(e(u,t,yt))
ke=v(e(u,x,gt))
lt=v(e(u,e(x,e(t,f,t)),Y))
X=v(e(x,e(z,t)))
ie=v(e(x,e(z,x)))
st=v(e(x,x))
local st=v(e(u,t,ot))
at=v(e(u,x,ot))
local d=T(tt,e())
local he=T(Xe,e())
local function ke(e,i,s)
local t={}
while a(e)do
p(t,o(e))
e=n(e)
end
if h(e)then
return i(t)
end
return s(t,e)
end
local function M(e)
return ke(e,function(e)return e end,function(e,e)return false end)
end
local function lt(e)
while Q(e)or O(e)do
e=I(qe(e))
end
return e
end
local function Ae(e)
if B(e)then
return e
elseif P(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return q()
end
local function ot(e)
return Z(Ae(e))
end
local function ct(e)
return J(Ae(e))
end
local function at(e)
if O(e)then
return G(e)
else
return b(e)
end
end
Be={}
local function se(t)
t=r(t)
if not c(t)then
return false
end
local e=r(E(t))
if not y(e)then
return false
end
if not R(e,Se)then
return false
end
e=r(A(t))
if not a(e)then
return false
end
if not h(r(n(e)))then
return false
end
local t={}
local i=r(o(e))
while not h(i)do
if not a(i)then
return false
end
local e=r(o(i))
i=r(n(i))
if not a(e)then
return false
end
local i=o(e)
e=r(n(e))
if not a(e)then
return false
end
local o=o(e)
if not h(r(n(e)))then
return false
end
local a=true
do
local e=0
while e<#t do
if l(t[(e+0)+1],i)then
t[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
p(t,i)
p(t,o)
end
end
return t
end
local function ie(t,a)
return{
t,
1,
function(e)
e=b(e)
if w(e)then
return j(t,{e})
end
if a(e)then
return he
end
return d
end,
}
end
local function X(t,a,o)
return{
t,
1,
function(e,i)
e=b(e)
if w(e)then
return j(t,{e})
end
if a(e)then
return o(e)
end
return i()
end,
}
end
it={
ie(Fe,c),
{
ht,
2,
T,
},
X(He,c,E),
X(We,c,A),
ie(Me,k),
{
dt,
2,
L,
},
X(Ye,k,U),
X(Pe,k,C),
ie(Ce,h),
{
ut,
2,
s,
},
ie(De,a),
X(Re,a,o),
X(Le,a,n),
{
ae,
2,
function(e,t,i)
if e==t then
return he
end
e=b(e)
t=b(t)
if w(e)or w(t)then
return j(ae,{
e,
t,
})
end
if e==t then
return he
end
local function i(t,e,a)
return j(ee,{
t,
e,
a,
})
end
local function s(e,t)
return i(e,t,d)
end
S(not w(e))
local function i(e,o,t,a)
return s(j(ae,{
t(e),
t(o),
}),j(ae,{
a(e),
a(o),
}))
end
if h(e)then
if not h(e)then
return d
end
return he
elseif y(e)then
if not y(t)then
return d
end
if R(e,t)then
return he
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return i(e,t,E,A)
elseif a(e)then
if not a(t)then
return d
end
return i(e,t,o,n)
elseif k(e)then
if not k(t)then
return d
end
return i(e,t,U,C)
end
return q()
end,
},
{
be,
2,
function(s,e,i)
local t={}
local e=r(e)
while a(e)do
p(t,o(e))
e=r(n(e))
end
if not h(e)then
return i()
end
return W(s,t)
end,
},
{
ve,
2,
function(e,a,t)
local e=se(e)
if e==false then
return t()
end
return H(e,a)
end,
},
ie(Ue,y),
{
Ie,
1,
function(e,t)
e=b(e)
if w(e)then
return j(Ie,{e})
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
e=b(e)
if w(e)then
return j(ee,{
e,
a,
o,
})
end
if not c(e)then
return t()
end
local e=r(E(e))
if not y(e)then
return t()
end
if R(e,Xe)then
return a
end
if R(e,tt)then
return o
end
return t()
end,
},
{
st,
2,
ne,
},
}
local X
X=l
local function d(e,t)
if e==t then
return true
end
e=I(e)
t=I(t)
if e==t then
return true
end
local function i(e,t,a,o)
if d(a(e),a(t))and d(o(e),o(t))then
N(e,t)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
N(e,g)
N(t,g)
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
elseif k(e)then
if not k(t)then
return false
end
return i(e,t,U,C)
elseif c(e)then
if not c(t)then
return false
end
return i(e,t,E,A)
elseif me(e)then
return false
end
return q()
end
local function ee(J)
local D,w,l,d,c,r,q,A,B,b,O,I,N,V,C,P,R,F,M,E,U,k,m,K,G,Q
function l()
return#D==w
end
function d()
S(not l())
local e=string.sub(D,w+1,w+1)
w=w+1
return e
end
function c(e)
S(string.sub(D,w,w)==e)
w=w-1
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
function A()
if l()then
return false
end
local e=d()
if not q(e)then
c(e)
return false
end
while q(e)and not l()do
e=d()
end
if not q(e)then
c(e)
end
return true
end
function B()
if l()then
return false
end
local e=d()
local t=""
if not F(e)then
c(e)
return false
end
while F(e)and not l()do
t=tostring(t)..tostring(e)
e=d()
end
if F(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
if et(t)then
return i(t)
else
return r("Not Atom"..tostring(t))
end
end
function b()
if l()then
return false
end
local e=d()
if e~="("then
c(e)
return false
end
local t=ge()
local a=t
local function o(a)
local e=ge()
fe(t,s(a,e))
t=e
end
while true do
A()
if l()then
return r()
end
e=d()
if e==")"then
fe(t,g)
return a
end
if e=="."then
A()
local o=M()
fe(t,o)
A()
if l()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
c(e)
local e=M()
o(e)
end
end
function O()
if l()then
return false
end
local e=d()
if e~="#"then
c(e)
return false
end
local e=b()
if e==false then
return r()
end
if not a(e)then
return r()
end
return T(o(e),n(e))
end
function I()
if l()then
return false
end
local e=d()
if e~="!"then
c(e)
return false
end
local e=b()
if e==false then
return r()
end
if not a(e)then
return r()
end
return L(o(e),n(e))
end
function F(e)
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
function M()
A()
local e={
b,
Q,
O,
I,
N,
V,
C,
P,
R,
}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function E(e)
if e==false then
return r()
end
return e
end
function U()
return not l()
end
function k(e)
E(U())
E(d()==e)
end
function m(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=m()
k("]")
return e
end
local e
if t then
e={
b,
B,
a,
O,
I,
N,
V,
C,
P,
R,
}
else
e={
b,
G,
O,
I,
N,
V,
C,
P,
R,
}
end
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function K(a)
if l()then
return a
end
local o=d()
if o=="."then
local o=m()
return e(u,e(t,e(a),f),o)
elseif o==":"then
local t=m()
return e(u,t,a)
elseif o=="~"then
return e(te,a)
elseif o=="@"then
local o=m()
return e(u,e(t,s(a,f),f),o)
elseif o=="?"then
return e(u,t,e(te,a))
elseif o=="/"then
local t={a}
while true do
local e=m(true)
p(t,e)
if l()then
break
end
local e=d()
if e~="/"then
c(e)
break
end
end
return e(pe,_(t))
else
c(o)
return a
end
end
function G()
if l()then
return false
end
local a=d()
if a=="&"then
E(U())
local t=d()
if t=="+"then
local t=m()
return e(x,e(z,t))
else
c(t)
end
local t=m()
return e(x,t)
elseif a==":"then
E(U())
local a=d()
if a=="&"then
k(">")
local a=m()
return e(u,e(x,e(t,f,a)),Y)
elseif a==">"then
local a=m()
return e(u,e(t,f,a),Y)
else
c(a)
end
local t=m()
return e(u,t,Y)
elseif a=="+"then
local t=m()
return e(z,t)
elseif a=="["then
local e=m()
k("]")
return K(e)
elseif a=="_"then
k(":")
local t=m()
return e(u,t,f)
else
c(a)
local e=B()
if e==false then
return false
end
return K(e)
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
D=J
w=0
local function t(t,i)
return function()
if l()then
return false
end
local e=d()
if e~=t then
c(e)
return false
end
local e=b()
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
local function s(t,s)
return function()
if l()then
return false
end
local e=d()
if e~=t then
c(e)
return false
end
local e=b()
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
N=t("$",function(e,t)
local e=se(e)
if e==false then
return r()
end
return H(e,t)
end)
V=t("%",function(e,t)
local t=ke(t,function(e)return e end,function(e,e)return r()end)
return j(e,t)
end)
C=s("@",function(o,a,e)
local t=ke(e,function(e)return e end,function(e,e)return r()end)
local e=se(o)
if e==false then
return r()
end
return Oe(e,a,t)
end)
P=t("^",function(e,t)
local t=ke(t,function(e)return e end,function(e,e)return r()end)
return W(e,t)
end)
R=t(";",function(t,e)return ne(t,e)end)
return M()
end
local function j(w)
local function i(r,l)
if y(r)then
return ue(r)
end
local function h(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=M(r)
if e~=false and#e==3 and d(e[1],u)then
local s=M(e[2])
if s~=false and#s==3 and d(s[1],t)then
local t=s[2]
local r=M(t)
if r~=false and#r==1 and d(s[3],f)then
return h(tostring(i(r[1],true)).."."..tostring(i(e[3],true)))
elseif a(t)and d(n(t),f)and d(s[3],f)then
return h(tostring(i(o(t),true)).."@"..tostring(i(e[3],true)))
elseif d(t,f)and d(e[3],Y)then
return h(":>"..tostring(i(s[3],true)))
end
end
local a=M(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],te)then
return h(tostring(i(a[2],true)).."?")
end
if s~=false and#s==2 and d(e[3],Y)and d(s[1],x)then
local e=M(s[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],f)then
return h(":&>"..tostring(i(e[3],true)))
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
return h(tostring(t)..":"..tostring(i(e[2],true)))
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=M(e[2])
if t~=false and#t==2 and d(t[1],z)then
return h("&+"..tostring(i(t[2],true)))
end
return h("&"..tostring(i(e[2],true)))
elseif d(e[1],te)then
return h(tostring(i(e[2],true)).."~")
elseif d(e[1],z)then
return h("+"..tostring(i(e[2],true)))
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
return h(a)
end
end
end
if l then
return m(r)
else
return m(v(r))
end
end
local e=ee(m(w))
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
e=n(e)
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(j(e))..")"
end
return t
elseif c(e)then
local t=E(e)
local a=A(e)
local e=M(a)
if e~=false and#e==2 and d(t,ye)and d(e[1],z)then
return i(e[2],false)
end
return"#"..tostring(j(s(t,a)))
elseif k(e)then
return"!"..tostring(j(s(U(e),C(e))))
elseif y(e)then
return ue(e)
elseif O(e)then
return";("..tostring(j(we(e))).." "..tostring(j(G(e)))..")"
elseif B(e)then
return"$("..tostring(j(D(Z(e)))).." "..tostring(j(J(e)))..")"
elseif K(e)then
return"%("..tostring(j(ce(e))).." "..tostring(j(_(de(e))))..")"
elseif P(e)then
return"@("..tostring(j(D(ze(e)))).." "..tostring(j(Ee(e))).." "..tostring(j(_(xe(e))))..")"
elseif V(e)then
return"^("..tostring(j(Te(e))).." "..tostring(j(_(je(e))))..")"
end
return q()
end
local function S(o)
local e,n,t
function n()
return e==0
end
function t()
return not n()
end
e=#o
local function a(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function i(e)
if not e then
return a()
end
end
local function h()
i(t())
e=e-1
return string.sub(o,e+1,e+1)
end
local e={}
local function o(i)
local o=table.remove(e)
local t=table.remove(e)
if t==nil or o==nil then
return a()
else
return Ne(e,i(t,o))
end
end
while t()do
local t=h()
if t=="^"then
local t=""
while true do
local e=h()
if e=="^"then
break
end
t=tostring(e)..tostring(t)
end
if rt(t)then
Ne(e,Ze(t))
else
return a("can_new_atom_unicodechar_p(\""..tostring(t).."\") == false")
end
elseif t=="."then
o(s)
elseif t=="#"then
o(T)
elseif t=="!"then
o(L)
elseif t=="$"then
o(function(e,t)
local e=se(e)
if e==false then
return a()
else
return H(e,t)
end
end)
elseif t=="_"then
Ne(e,g)
else
return a()
end
end
i(n())
i(#e==1)
return e[1]
end
local function N(e)
local s={e}
local t=""
while#s~=0 do
local r={}
for i,e in ipairs(s)do
e=I(e)
local function i(e,o,i,a)
t=tostring(t)..tostring(o)
return p(r,i(e),a(e))
end
if y(e)then
t=tostring(t)..tostring(("^"..tostring(le(e)).."^"))
elseif a(e)then
i(e,".",o,n)
elseif h(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
i(e,"#",E,A)
elseif k(e)then
i(e,"!",U,C)
elseif me(e)then
local e=Ae(e)
i(e,"$",(function(e)return D(Z(e))end),J)
else
return q()
end
end
s=r
end
return t
end
local function q(e)
return function()return{
false,
e,
}end
end
local function p(e)
return function()return{
true,
e(),
}end
end
local function z(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local x=v(s(pe,s(s(nt,s(s(u,s(Je,s(f,g))),g)),g)))
local v=v(s(pe,s(s(nt,s(oe,g)),g)))
local function P(a,t)
return T(v,e(a,t))
end
local function Y(e)
return T(x,e)
end
local function f(m,w,u,y,d)
if d==nil then
d=false
end
local function b(e,e)
error("WIP")
end
u=r(u)
if c(u)then
local c=E(u)
local s=A(u)
if l(c,x)then
s=r(s)
if a(s)then
local a=o(s)
local e=r(n(s))
if h(e)then
if d==false then
local t=a
local a=y
local function e()return m(t,a)end
return p(e)
else
local t
t=m
local e
e=w
local i=a
local a=y
local function o()return f(t,e,W(d,i),a)end
return p(o)
end
end
end
elseif l(c,v)then
s=r(s)
if a(s)then
local l=o(s)
local s=r(n(s))
if a(s)then
local a=o(s)
local o=r(n(s))
if h(o)then
if d==false then
local e
e=m
local t
t=w
local n=l
local o=a
local i=y
local function a()return f(e,t,n,i,o)end
return p(a)
else
local n
n=m
local o
o=w
local r=l
local h=a
local s=y
local d=d
local a=i("序甲")
local function i()return f(n,o,r,s,T(t,e(e(a),b(e(re(h),a),re(d)))))end
return p(i)
end
end
end
end
end
end
if d==false then
return p(function()return w(u,y,m)end)
else
return p(function()return w(u,y,function(e,t)return p(function()return f(m,w,W(d,{e}),t)end)end)end)
end
end
local function d(t,e,a,o)
return f(t,e,a,o)
end
local function l(a,i,n,o)
return z(f((function(t,e)return q(a(t,e))end),(function(e,t,a)return q(i(e,t,function(e,t)return z(a(e,t))end))end),n,o))
end
local t={}
t.new_comment=ne
t.comment_p=O
t.comment_comment=we
t.comment_x=G
t.un_comment_all=qe
t.can_new_atom_p=et
t.new_atom=i
t.atom_p=y
t.un_atom=ue
t.atom_equal_p=R
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=n
t.null_v=g
t.null_p=h
t.new_data=T
t.data_p=c
t.data_name=E
t.data_list=A
t.new_error=L
t.error_p=k
t.error_name=U
t.error_list=C
t.just_p=Q
t.evaluate=H
t.apply=W
t.force_all_rec=F
t.force_uncomment_all_rec=Ve
t.jsArray_to_list=_
t.maybe_list_to_jsArray=M
t.new_list=e
t.un_just_all=I
t.un_just_comment_all=lt
t.delay_p=me
t.delay_just_p=w
t.delay_env=ot
t.delay_x=ct
t.force_all=r
t.force1=b
t.force_uncomment1=at
t.force_uncomment_all=Qe
t.env_null_v=Be
t.env_set=_e
t.env_get=Ge
t.env2val=D
t.env_foreach=Ke
t.val2env=se
t.equal_p=X
t.simple_print=m
t.complex_parse=ee
t.complex_print=j
t.machinetext_parse=S
t.machinetext_print=N
t.trampoline_return=q
t.trampoline_delay=p
t.run_trampoline=z
t.return_effect_systemName=x
t.bind_effect_systemName=v
t.new_effect_bind=P
t.new_effect_return=Y
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
