local function v(e,...)
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
local j,H,m,Ve,Ie,Ae,b,M,Y,ne,ae,pe,he,ye,se,fe,I,oe,K,qe,p,le,de,D,s,a,o,i,y,h,T,c,E,A,L,g,C,U,B,rt,S,Q,X,Z,Oe,G,_e,Te,ze,q,P,ue,re,F,V,je,xe,W,ge,d,O,we,lt,z,t,x,Se,dt,He,We,Fe,Ye,Pe,Me,De,Re,Le,Ue,Ce,te,be,ve,ee,ke,st,J,ie,nt,tt,_,e,N,me,w,n,k,r,Qe,Be,Ee,Ge,et,R,Ke,ot,it,u,at,ht,Ze,Xe,ce,Je,l,f
function j()
error("TheLanguage PANIC")
end
function H(e)
if not e then
return j()
end
end
function fe(e,t)
return{
ye,
e,
t,
}
end
function I(e)
return e[1]==ye
end
function oe(e)
return e[2]
end
function K(e)
return e[3]
end
function qe(e)
while I(e)do
e=K(e)
end
return e
end
function p(e)
return e[1]==Ve
end
function le(e)
return e[2]
end
function de(e)
return m()[le(e)]
end
function D(t,e)
if t==e then
return true
end
if le(t)==le(e)then
O(t,e)
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
function i(e)
return e[3]
end
function h(e)
return e[1]==Ae
end
function T(t,e)
return{
b,
t,
e,
}
end
function c(e)
return e[1]==b
end
function E(e)
return e[2]
end
function A(e)
return e[3]
end
function L(t,e)
return{
M,
t,
e,
}
end
function g(e)
return e[1]==M
end
function C(e)
return e[2]
end
function U(e)
return e[3]
end
function B(e)
return e[1]==Y
end
function rt(e)
return e[2]
end
function S(t,e)
return{
ne,
t,
e,
}
end
function Q(e)
return e[1]==ne
end
function X(e)
return e[2]
end
function Z(e)
return e[3]
end
function Oe(e,a,t)
return{
pe,
e,
a,
t,
}
end
function G(e)
return e[1]==pe
end
function _e(e)
return e[2]
end
function Te(e)
return e[3]
end
function ze(e)
return e[4]
end
function q(t,e)
return{
ae,
t,
e,
}
end
function P(e)
return e[1]==ae
end
function ue(e)
return e[2]
end
function re(e)
return e[3]
end
function F(t,e)
return{
he,
t,
e,
}
end
function V(e)
return e[1]==he
end
function je(e)
return e[2]
end
function xe(e)
return e[3]
end
function W(e)
local e=r(e)
local function t(e)
e[2]=W(e[2])
e[3]=W(e[3])
return e
end
if c(e)then
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
function ge()
return{se}
end
function d(e)
return e[1]==se
end
function O(e,t)
if e==t then
return
end
e[1]=Y
e[2]=t
e[3]=false
e[4]=false
end
function we(e,t)
H(d(e))
H(not d(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function lt(t)
local e=ge()
we(e,t)
return e
end
function _(a)
local t=y
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
function N(e)
if not B(e)then
return e
end
local e=e
local t={}
while B(e)do
v(t,e)
e=rt(e)
end
for a,t in ipairs(t)do
O(t,e)
end
return e
end
function me(e)
return Q(e)or G(e)or P(e)or V(e)
end
function w(e)
return B(e)or me(e)
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
local e,r,s
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
function s(t)
r(t)
if w(t)then
v(a,e)
return n(t,i,{
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
return s(dt)
end
local function d()
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
v(a,e)
e=k(e)
t=t+1
end
end
while w(e)do
local r=f(e)
if i[r]==true then
return o()
end
if h[r]==true then
t[1]=true
if Q(e)then
return o()
elseif P(e)then
local a=ue(e)
local e=re(e)
local h={
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
for t,e in ipairs(h)do
if l(e,a)then
i=true
break
end
end
if i then
H(#e==1)
H(t[2]==false)
local e=n(e[1],d(),t)
if t[2]then
return s(q(a,{e}))
else
return j()
end
end
if l(a,te)then
return o()
elseif l(a,be)then
return o()
elseif l(a,ve)then
return o()
elseif l(a,ee)then
H(#e==3)
H(t[2]==false)
local a=n(e[1],d(),t)
if t[2]then
return s(q(ee,{
a,
e[2],
e[3],
}))
else
return j()
end
end
return j()
elseif G(e)then
return o()
elseif V(e)then
return o()
end
return j()
end
h[r]=true
v(a,e)
e=k(e)
end
return r(e)
end
function k(a)
local e=N(a)
local t
H(not B(e))
if Q(e)then
t=it(X(e),Z(e),a)
elseif G(e)then
t=Xe(_e(e),Te(e),ze(e),a)
elseif P(e)then
t=Ze(ue(e),re(e),a)
elseif V(e)then
t=ht(je(e),xe(e),a)
else
t=e
end
t=N(t)
O(e,t)
return t
end
function r(e)
return n(e)
end
function Qe(e)
while w(e)or I(e)do
e=r(qe(e))
end
return e
end
function Ee(a,o,i)
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
return j()
end
function R(o)
local a=y
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
local t={}
local e=N(e)
local n=true
while true do
if h(e)then
return l(t,s)
elseif I(e)then
v(t,oe(e))
e=K(e)
elseif a(e)then
v(s,o(e))
e=i(e)
elseif w(e)then
if n then
n=false
e=k(e)
else
return r()
end
else
return d()
end
end
end
function it(s,t,d)
local n=k(t)
if w(n)then
return d
end
local function t()return L(z,e(J,e(ve,e(R(s),n))))end
if a(n)then
return ot(n,t,function()return d end,function(n,e)
if#n~=0 then
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
v(a,e[t+1])
t=t+1
end
end
return Oe(s,o,a)
elseif l(e[1],nt)then
if#e==1 then
return t()
end
local n=r(S(s,e[2]))
if not c(n)then
return t()
end
local r=k(E(n))
if w(r)then
return d
end
if not p(r)then
return t()
end
if not D(r,x)then
return t()
end
local n=k(A(n))
if w(n)then
return d
end
if not a(n)then
return t()
end
local o=o(n)
local a=k(i(n))
if w(a)then
return d
end
if not h(a)then
return t()
end
local a={R(s)}
do
local t=2
while t<#e do
v(a,e[t+1])
t=t+1
end
end
return F(o,a)
elseif l(e[1],J)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
v(a,S(s,e[t+1]))
t=t+1
end
end
return q(o,a)
else
local o=S(s,e[1])
local a={}
do
local t=1
while t<#e do
v(a,S(s,e[t+1]))
t=t+1
end
end
return F(o,a)
end
end)
elseif h(n)then
return n
elseif u(n)then
return Ge(s,n,t())
elseif g(n)then
return t()
end
return j()
end
function u(e)
return p(e)or c(e)
end
function ht(l,n,m)
local function d()return L(z,e(J,e(be,e(l,_(n)))))end
l=k(l)
if w(l)then
return m
end
if not c(l)then
return d()
end
local e=r(E(l))
if not(p(e)and D(e,t))then
return d()
end
local t=r(A(l))
if not a(t)then
return d()
end
local e=W(o(t))
local t=r(i(t))
if not(a(t)and h(r(i(t))))then
return d()
end
local l=o(t)
local r=Be
local t=0
while not h(e)do
if u(e)then
local a=y
do
local e=#n-1
while e>=t do
a=s(n[e+1],a)
e=e-1
end
end
r=Ee(r,e,a)
t=#n
e=y
elseif a(e)then
if t<#n then
local a=n[t+1]
t=t+1
r=Ee(r,o(e),a)
e=i(e)
else
return d()
end
else
return d()
end
end
if#n~=t then
return d()
end
return S(r,l)
end
function Ze(i,t,o)
local function a()return L(z,e(J,e(i,_(t))))end
for n,e in ipairs(at)do
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
return j()
end
end
return a()
end
function Xe(i,o,t,a)
local function a()return L(z,e(ie,e(R(i),o,_(t))))end
if l(o,ke)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,st)then
if#t~=2 then
return a()
end
return Je(i,t[1],t[2],a)
elseif l(o,tt)then
if#t~=2 then
return a()
end
return fe(t[1],S(i,t[2]))
end
return a()
end
function ce(t)
return e(ie,ke,t)
end
function Je(m,d,f,w)
d=W(d)
local r={}
local c=false
local n=d
while not h(n)do
if u(n)then
v(r,n)
c=true
n=y
elseif a(n)then
v(r,o(n))
n=i(n)
else
return w()
end
end
local o
if c then
o=_(r)
else
o=d
end
local a={}
Ke(m,function(t,e)
do
local e=0
while e<#r do
if l(r[e+1],t)then
return
end
e=e+1
end
end
v(a,t)
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
o=s(ce(et(m,a[e+1])),o)
e=e-1
end
end
return T(t,e(d,s(ce(T(t,e(i,f))),o)))
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
local function n(t,e,o,a)
if l(o(t),o(e))and l(a(t),a(e))then
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
O(e,y)
O(t,y)
return true
elseif p(e)then
if not p(t)then
return false
end
return D(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,C,U)
elseif c(e)then
if not c(t)then
return false
end
return n(e,t,E,A)
end
return j()
end
function f(e)
e=N(e)
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
e=N(i(e))
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(f(e))..")"
end
return t
elseif c(e)then
return"#"..tostring(f(s(E(e),A(e))))
elseif g(e)then
return"!"..tostring(f(s(C(e),U(e))))
elseif p(e)then
return de(e)
elseif I(e)then
return";("..tostring(f(oe(e))).." "..tostring(f(K(e)))..")"
elseif Q(e)then
return"$("..tostring(f(R(X(e)))).." "..tostring(f(Z(e)))..")"
elseif P(e)then
return"%("..tostring(f(ue(e))).." "..tostring(f(_(re(e))))..")"
elseif G(e)then
return"@("..tostring(f(R(_e(e)))).." "..tostring(f(Te(e))).." "..tostring(f(_(ze(e))))..")"
elseif V(e)then
return"^("..tostring(f(je(e))).." "..tostring(f(_(xe(e))))..")"
end
return j()
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
local e=n()
function d()return e end
return e
end
function m()
local e=u()
function m()return e end
return e
end
Ve=0
Ie=1
Ae=2
b=3
M=4
Y=5
ne=6
ae=7
pe=8
he=9
ye=11
se=10
local function rt(e)
return m()[e]~=nil
end
local function Ze(e)
return{
Ve,
e,
}
end
local function Xe(e)
return d()[e]~=nil
end
local function n(e)
return Ze(d()[e])
end
y={Ae}
local function Ve(e)
local t=Qe(e)
local function o(e)
e[2]=W(e[2])
e[3]=W(e[3])
if I(e[2])or I(e[3])then
local t=lt(e)
local a=e[2]
local e=e[3]
local a=Ve(a)
local e=Ve(e)
t[2]=a
t[3]=e
return t
else
return e
end
end
if c(t)then
return o(t)
elseif g(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=n("太始初核")
local ye=n("符名")
t=n("化滅")
x=n("式形")
local pt=n("等同")
local vt=n("解算")
local Y=n("特定其物")
local m=n("省略一物")
Se=n("映表")
local yt=n("如若")
local u=n("一類何物")
local ae=n("是非")
local pe=n("其子")
local Je=n("爻陽")
local et=n("爻陰")
local gt=n("引用")
local wt=n("應用")
local bt=n("間空")
local ne=n("連頸")
local se=n("構物")
local he=n("謬誤")
local ft=n("詞素")
local Ie=n("列序")
local ct=n("首始")
local mt=n("尾末")
local ht=n("之物")
local d=n("宇宙亡矣")
local ot=n("效應")
local it=n("註疏")
dt=L(z,e(d,m))
local function b(e)
return T(ye,s(z,s(e,y)))
end
local function Ae(a)
return b(e(u,e(t,m,a),Y))
end
local function d(a,o)
return b(e(u,e(t,e(a),m),o))
end
local function M(a)
return b(e(u,t,e(ae,e(u,a,m))))
end
local dt=Ae(se)
He=d(se,ye)
We=d(se,Ie)
Fe=M(se)
local lt=Ae(he)
Ye=d(he,ye)
Pe=d(he,Ie)
Me=M(he)
local ut=Ae(ne)
De=M(ne)
Re=d(ne,ct)
Le=d(ne,mt)
Ue=M(ft)
Ce=M(bt)
te=b(e(u,t,e(ae,pt)))
be=b(e(u,e(t,s(t,m),m),wt))
ve=b(e(u,t,vt))
local Ie=d(Ie,e(u,ht,m))
ee=b(e(u,t,yt))
ke=b(e(u,x,gt))
st=b(e(u,e(x,e(t,m,t)),Y))
J=b(e(x,e(z,t)))
ie=b(e(x,e(z,x)))
nt=b(e(x,x))
local nt=b(e(u,t,it))
tt=b(e(u,x,it))
local d=T(et,e())
local se=T(Je,e())
local function ke(e,n,s)
local t={}
while a(e)do
v(t,o(e))
e=i(e)
end
if h(e)then
return n(t)
end
return s(t,e)
end
local function M(e)
return ke(e,function(e)return e end,function(e,e)return false end)
end
local function tt(e)
while B(e)or I(e)do
e=N(qe(e))
end
return e
end
local function Ae(e)
if Q(e)then
return e
elseif G(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return j()
end
local function it(e)
return X(Ae(e))
end
local function ct(e)
return Z(Ae(e))
end
local function st(e)
if I(e)then
return K(e)
else
return k(e)
end
end
Be={}
local function he(t)
t=r(t)
if not c(t)then
return false
end
local e=r(E(t))
if not p(e)then
return false
end
if not D(e,Se)then
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
local o=o(e)
if not h(r(i(e)))then
return false
end
local a=true
do
local e=0
while e<#t do
if l(t[(e+0)+1],n)then
t[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
v(t,n)
v(t,o)
end
end
return t
end
local function ie(t,a)
return{
t,
1,
function(e)
e=k(e)
if w(e)then
return q(t,{e})
end
if a(e)then
return se
end
return d
end,
}
end
local function J(t,a,o)
return{
t,
1,
function(e,i)
e=k(e)
if w(e)then
return q(t,{e})
end
if a(e)then
return o(e)
end
return i()
end,
}
end
at={
ie(Fe,c),
{
dt,
2,
T,
},
J(He,c,E),
J(We,c,A),
ie(Me,g),
{
lt,
2,
L,
},
J(Ye,g,C),
J(Pe,g,U),
ie(Ce,h),
{
ut,
2,
s,
},
ie(De,a),
J(Re,a,o),
J(Le,a,i),
{
te,
2,
function(e,t,n)
if e==t then
return se
end
e=k(e)
t=k(t)
if w(e)or w(t)then
return q(te,{
e,
t,
})
end
if e==t then
return se
end
local function n(a,t,e)
return q(ee,{
a,
t,
e,
})
end
local function s(t,e)
return n(t,e,d)
end
H(not w(e))
local function n(e,o,t,a)
return s(q(te,{
t(e),
t(o),
}),q(te,{
a(e),
a(o),
}))
end
if h(e)then
if not h(e)then
return d
end
return se
elseif p(e)then
if not p(t)then
return d
end
if D(e,t)then
return se
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return n(e,t,E,A)
elseif a(e)then
if not a(t)then
return d
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return d
end
return n(e,t,C,U)
end
return j()
end,
},
{
be,
2,
function(n,e,s)
local t={}
local e=r(e)
while a(e)do
v(t,o(e))
e=r(i(e))
end
if not h(e)then
return s()
end
return F(n,t)
end,
},
{
ve,
2,
function(e,a,t)
local e=he(e)
if e==false then
return t()
end
return S(e,a)
end,
},
ie(Ue,p),
{
Ie,
1,
function(e,t)
e=k(e)
if w(e)then
return q(Ie,{e})
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
e=k(e)
if w(e)then
return q(ee,{
e,
a,
o,
})
end
if not c(e)then
return t()
end
local e=r(E(e))
if not p(e)then
return t()
end
if D(e,Je)then
return a
end
if D(e,et)then
return o
end
return t()
end,
},
{
nt,
2,
fe,
},
}
local J
J=l
local function d(e,t)
if e==t then
return true
end
e=N(e)
t=N(t)
if e==t then
return true
end
local function n(e,t,a,o)
if d(a(e),a(t))and d(o(e),o(t))then
O(e,t)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
O(e,y)
O(t,y)
return true
elseif p(e)then
if not p(t)then
return false
end
return D(e,t)
elseif a(e)then
if not a(t)then
return false
end
return n(e,t,o,i)
elseif g(e)then
if not g(t)then
return false
end
return n(e,t,C,U)
elseif c(e)then
if not c(t)then
return false
end
return n(e,t,E,A)
elseif me(e)then
return false
end
return j()
end
local function ee(J)
local D,w,l,d,c,r,j,E,B,g,O,I,N,V,C,P,R,W,M,A,U,k,f,K,G,Q
function l()
return#D==w
end
function d()
H(not l())
local e=string.sub(D,w+1,w+1)
w=w+1
return e
end
function c(e)
H(string.sub(D,w,w)==e)
w=w-1
end
function r(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function j(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function E()
if l()then
return false
end
local e=d()
if not j(e)then
c(e)
return false
end
while j(e)and not l()do
e=d()
end
if not j(e)then
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
if not W(e)then
c(e)
return false
end
while W(e)and not l()do
t=tostring(t)..tostring(e)
e=d()
end
if W(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
if Xe(t)then
return n(t)
else
return r("Not Symbol"..tostring(t))
end
end
function g()
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
we(t,s(a,e))
t=e
end
while true do
E()
if l()then
return r()
end
e=d()
if e==")"then
we(t,y)
return a
end
if e=="."then
E()
local o=M()
we(t,o)
E()
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
local e=g()
if e==false then
return r()
end
if not a(e)then
return r()
end
return T(o(e),i(e))
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
local e=g()
if e==false then
return r()
end
if not a(e)then
return r()
end
return L(o(e),i(e))
end
function W(e)
if j(e)then
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
E()
local e={
g,
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
function A(e)
if e==false then
return r()
end
return e
end
function U()
return not l()
end
function k(e)
A(U())
A(d()==e)
end
function f(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=f()
k("]")
return e
end
local e
if t then
e={
g,
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
g,
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
local o=f()
return e(u,e(t,e(a),m),o)
elseif o==":"then
local t=f()
return e(u,t,a)
elseif o=="~"then
return e(ae,a)
elseif o=="@"then
local o=f()
return e(u,e(t,s(a,m),m),o)
elseif o=="?"then
return e(u,t,e(ae,a))
elseif o=="/"then
local t={a}
while true do
local e=f(true)
v(t,e)
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
A(U())
local t=d()
if t=="+"then
local t=f()
return e(x,e(z,t))
else
c(t)
end
local t=f()
return e(x,t)
elseif a==":"then
A(U())
local a=d()
if a=="&"then
k(">")
local a=f()
return e(u,e(x,e(t,m,a)),Y)
elseif a==">"then
local a=f()
return e(u,e(t,m,a),Y)
else
c(a)
end
local t=f()
return e(u,t,Y)
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
return e(u,t,m)
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
if p(e)then
return e
end
return b(e)
end
D=J
w=0
local function t(t,n)
return function()
if l()then
return false
end
local e=d()
if e~=t then
c(e)
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
if l()then
return false
end
local e=d()
if e~=t then
c(e)
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
N=t("$",function(e,t)
local e=he(e)
if e==false then
return r()
end
return S(e,t)
end)
V=t("%",function(t,e)
local e=ke(e,function(e)return e end,function(e,e)return r()end)
return q(t,e)
end)
C=s("@",function(o,a,e)
local t=ke(e,function(e)return e end,function(e,e)return r()end)
local e=he(o)
if e==false then
return r()
end
return Oe(e,a,t)
end)
P=t("^",function(t,e)
local e=ke(e,function(e)return e end,function(e,e)return r()end)
return F(t,e)
end)
R=t(";",function(t,e)return fe(t,e)end)
return M()
end
local function q(w)
local function n(r,l)
if p(r)then
return de(r)
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
if r~=false and#r==1 and d(h[3],m)then
return s(tostring(n(r[1],true)).."."..tostring(n(e[3],true)))
elseif a(t)and d(i(t),m)and d(h[3],m)then
return s(tostring(n(o(t),true)).."@"..tostring(n(e[3],true)))
elseif d(t,m)and d(e[3],Y)then
return s(":>"..tostring(n(h[3],true)))
end
end
local a=M(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],ae)then
return s(tostring(n(a[2],true)).."?")
end
if h~=false and#h==2 and d(e[3],Y)and d(h[1],x)then
local e=M(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],m)then
return s(":&>"..tostring(n(e[3],true)))
end
end
local t
if d(e[3],m)then
t="_"
elseif d(e[3],Y)then
t=""
else
t=n(e[3],true)
end
return s(tostring(t)..":"..tostring(n(e[2],true)))
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=M(e[2])
if t~=false and#t==2 and d(t[1],z)then
return s("&+"..tostring(n(t[2],true)))
end
return s("&"..tostring(n(e[2],true)))
elseif d(e[1],ae)then
return s(tostring(n(e[2],true)).."~")
elseif d(e[1],z)then
return s("+"..tostring(n(e[2],true)))
elseif d(e[1],pe)then
local e=M(e[2])
if e~=false and#e>1 then
local a=n(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(n(e[t+1],true))
t=t+1
end
end
return s(a)
end
end
end
if l then
return f(r)
else
return f(b(r))
end
end
local e=ee(f(w))
local t=""
local r=""
if h(e)then
return"()"
elseif a(e)then
t="("
r=""
while a(e)do
t=tostring(t)..tostring(r)..tostring(q(o(e)))
r=" "
e=i(e)
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(q(e))..")"
end
return t
elseif c(e)then
local t=E(e)
local a=A(e)
local e=M(a)
if e~=false and#e==2 and d(t,ye)and d(e[1],z)then
return n(e[2],false)
end
return"#"..tostring(q(s(t,a)))
elseif g(e)then
return"!"..tostring(q(s(C(e),U(e))))
elseif p(e)then
return de(e)
elseif I(e)then
return";("..tostring(q(oe(e))).." "..tostring(q(K(e)))..")"
elseif Q(e)then
return"$("..tostring(q(R(X(e)))).." "..tostring(q(Z(e)))..")"
elseif P(e)then
return"%("..tostring(q(ue(e))).." "..tostring(q(_(re(e))))..")"
elseif G(e)then
return"@("..tostring(q(R(_e(e)))).." "..tostring(q(Te(e))).." "..tostring(q(_(ze(e))))..")"
elseif V(e)then
return"^("..tostring(q(je(e))).." "..tostring(q(_(xe(e))))..")"
end
return j()
end
local function H(o)
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
return a("can_new_symbol_unicodechar_p(\""..tostring(t).."\") == false")
end
elseif t=="."then
o(s)
elseif t=="#"then
o(T)
elseif t=="!"then
o(L)
elseif t=="$"then
o(function(e,t)
local e=he(e)
if e==false then
return a()
else
return S(e,t)
end
end)
elseif t=="_"then
Ne(e,y)
else
return a()
end
end
i(n())
i(#e==1)
return e[1]
end
local function O(e)
local s={e}
local t=""
while#s~=0 do
local r={}
for n,e in ipairs(s)do
e=N(e)
local function n(e,i,a,o)
t=tostring(t)..tostring(i)
return v(r,a(e),o(e))
end
if p(e)then
t=tostring(t)..tostring(("^"..tostring(le(e)).."^"))
elseif a(e)then
n(e,".",o,i)
elseif h(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
n(e,"#",E,A)
elseif g(e)then
n(e,"!",C,U)
elseif me(e)then
local e=Ae(e)
n(e,"$",(function(e)return R(X(e))end),Z)
else
return j()
end
end
s=r
end
return t
end
local function j(e)
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
local function z(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local x=b(s(pe,s(s(ot,s(s(u,s(ht,s(m,y))),y)),y)))
local b=b(s(pe,s(s(ot,s(ne,y)),y)))
local function P(a,t)
return T(b,e(a,t))
end
local function Y(e)
return T(x,e)
end
local function v(f,y,m,w,u)
if u==nil then
u=false
end
local function p(e,e)
error("WIP")
end
m=r(m)
if c(m)then
local c=E(m)
local s=A(m)
if l(c,x)then
s=r(s)
if a(s)then
local a=o(s)
local e=r(i(s))
if h(e)then
if u==false then
local t=a
local a=w
local function e()return f(t,a)end
return d(e)
else
local t
t=f
local e
e=y
local i=a
local a=w
local function o()return v(t,e,F(u,i),a)end
return d(o)
end
end
end
elseif l(c,b)then
s=r(s)
if a(s)then
local l=o(s)
local s=r(i(s))
if a(s)then
local a=o(s)
local o=r(i(s))
if h(o)then
if u==false then
local e
e=f
local t
t=y
local n=l
local o=a
local i=w
local function a()return v(e,t,n,i,o)end
return d(a)
else
local i
i=f
local o
o=y
local r=l
local h=a
local s=w
local l=u
local a=n("序甲")
local function n()return v(i,o,r,s,T(t,e(e(a),p(e(ce(h),a),ce(l)))))end
return d(n)
end
end
end
end
end
end
if u==false then
return d(function()return y(m,w,f)end)
else
return d(function()return y(m,w,function(e,t)return d(function()return v(f,y,F(u,{e}),t)end)end)end)
end
end
local function l(t,e,a,o)
return v(t,e,a,o)
end
local function u(a,i,n,o)
return z(v((function(t,e)return j(a(t,e))end),(function(e,t,a)return j(i(e,t,function(e,t)return z(a(e,t))end))end),n,o))
end
local t={}
t.new_comment=fe
t.comment_p=I
t.comment_comment=oe
t.comment_x=K
t.un_comment_all=qe
t.can_new_symbol_p=Xe
t.new_symbol=n
t.symbol_p=p
t.un_symbol=de
t.symbol_equal_p=D
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=i
t.null_v=y
t.null_p=h
t.new_data=T
t.data_p=c
t.data_name=E
t.data_list=A
t.new_error=L
t.error_p=g
t.error_name=C
t.error_list=U
t.just_p=B
t.evaluate=S
t.apply=F
t.force_all_rec=W
t.force_uncomment_all_rec=Ve
t.jsArray_to_list=_
t.maybe_list_to_jsArray=M
t.new_list=e
t.un_just_all=N
t.un_just_comment_all=tt
t.delay_p=me
t.delay_just_p=w
t.delay_env=it
t.delay_x=ct
t.force_all=r
t.force1=k
t.force_uncomment1=st
t.force_uncomment_all=Qe
t.env_null_v=Be
t.env_set=Ee
t.env_get=Ge
t.env2val=R
t.env_foreach=Ke
t.val2env=he
t.equal_p=J
t.simple_print=f
t.complex_parse=ee
t.complex_print=q
t.machinetext_parse=H
t.machinetext_print=O
t.trampoline_return=j
t.trampoline_delay=d
t.run_trampoline=z
t.return_effect_systemName=x
t.bind_effect_systemName=b
t.new_effect_bind=P
t.new_effect_return=Y
t.run_monad_trampoline=l
t.run_monad_stackoverflow=u
return t
