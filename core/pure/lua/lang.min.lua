local function v(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ie(a,...)
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
local q,I,m,b,C,ae,F,Oe,de,re,le,pe,ye,Ae,je,me,O,oe,Q,Ee,p,ue,ie,L,s,a,o,i,y,h,_,c,T,A,D,k,U,M,G,dt,N,K,X,te,Ce,B,be,ge,xe,j,V,ne,se,Y,P,qe,Te,W,ke,d,S,ce,rt,z,t,x,Ve,lt,Fe,Qe,Ge,Ke,Be,We,Ye,Pe,Ue,Me,Le,J,ze,_e,ee,De,st,Z,we,nt,at,E,e,H,he,w,n,g,r,Re,He,ve,Ne,tt,R,Se,ot,it,u,et,ht,Ze,Xe,fe,Je,l,f
function q()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return q()
end
end
function me(e,t)
return{
Ae,
e,
t,
}
end
function O(e)
return e[1]==Ae
end
function oe(e)
return e[2]
end
function Q(e)
return e[3]
end
function Ee(e)
while O(e)do
e=Q(e)
end
return e
end
function p(e)
return e[1]==b
end
function ue(e)
return e[2]
end
function ie(e)
return m()[ue(e)]
end
function L(t,e)
if t==e then
return true
end
if ue(t)==ue(e)then
S(t,e)
return true
else
return false
end
end
function s(t,e)
return{
C,
t,
e,
}
end
function a(e)
return e[1]==C
end
function o(e)
return e[2]
end
function i(e)
return e[3]
end
function h(e)
return e[1]==ae
end
function _(t,e)
return{
F,
t,
e,
}
end
function c(e)
return e[1]==F
end
function T(e)
return e[2]
end
function A(e)
return e[3]
end
function D(t,e)
return{
Oe,
t,
e,
}
end
function k(e)
return e[1]==Oe
end
function U(e)
return e[2]
end
function M(e)
return e[3]
end
function G(e)
return e[1]==de
end
function dt(e)
return e[2]
end
function N(t,e)
return{
re,
t,
e,
}
end
function K(e)
return e[1]==re
end
function X(e)
return e[2]
end
function te(e)
return e[3]
end
function Ce(a,e,t)
return{
pe,
a,
e,
t,
}
end
function B(e)
return e[1]==pe
end
function be(e)
return e[2]
end
function ge(e)
return e[3]
end
function xe(e)
return e[4]
end
function j(e,t)
return{
le,
e,
t,
}
end
function V(e)
return e[1]==le
end
function ne(e)
return e[2]
end
function se(e)
return e[3]
end
function Y(e,t)
return{
ye,
e,
t,
}
end
function P(e)
return e[1]==ye
end
function qe(e)
return e[2]
end
function Te(e)
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
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function ke()
return{je}
end
function d(e)
return e[1]==je
end
function S(e,t)
if e==t then
return
end
if e==y then
e=t
t=y
end
e[1]=de
e[2]=t
e[3]=false
e[4]=false
end
function ce(e,t)
I(d(e))
I(not d(t))
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function rt(t)
local e=ke()
ce(e,t)
return e
end
function E(a)
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
return E(e)
end
function H(e)
if not G(e)then
return e
end
local e=e
local t={}
while G(e)do
v(t,e)
e=dt(e)
end
for a,t in ipairs(t)do
S(t,e)
end
return e
end
function he(e)
return K(e)or B(e)or V(e)or P(e)
end
function w(e)
return G(e)or he(e)
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
local e,d,s
function d(t)
S(e,t)
do
local e=0
while e<#a do
S(a[e+1],t)
e=e+1
end
end
return t
end
function s(t)
d(t)
if w(t)then
v(a,e)
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
return s(lt)
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
while w(e)and t<32 do
v(a,e)
e=g(e)
t=t+1
end
end
while w(e)do
local h=f(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[1]=true
if K(e)then
return o()
elseif V(e)then
local a=ne(e)
local e=se(e)
local h={
Fe,
Qe,
Ge,
Ke,
Be,
We,
Ye,
Pe,
Ue,
Me,
Le,
}
local i=false
for t,e in ipairs(h)do
if l(e,a)then
i=true
break
end
end
if i then
I(#e==1)
I(t[2]==false)
local e=n(e[1],u(),t)
if t[2]then
return s(j(a,{e}))
else
return q()
end
end
if l(a,J)then
return o()
elseif l(a,ze)then
return o()
elseif l(a,_e)then
return o()
elseif l(a,ee)then
I(#e==3)
I(t[2]==false)
local a=n(e[1],u(),t)
if t[2]then
return s(j(ee,{
a,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif B(e)then
return o()
elseif P(e)then
return o()
end
return q()
end
r[h]=true
v(a,e)
e=g(e)
end
return d(e)
end
function g(a)
local e=H(a)
local t
I(not G(e))
if K(e)then
t=it(X(e),te(e),a)
elseif B(e)then
t=Xe(be(e),ge(e),xe(e),a)
elseif V(e)then
t=Ze(ne(e),se(e),a)
elseif P(e)then
t=ht(qe(e),Te(e),a)
else
t=e
end
t=H(t)
S(e,t)
return t
end
function r(e)
return n(e)
end
function Re(e)
while w(e)or O(e)do
e=r(Ee(e))
end
return e
end
function ve(a,o,i)
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
function Ne(t,a,o)
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
function tt(t,a)
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
function R(a)
local o=y
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Ve,e(o))
end
function Se(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ot(e,l,r,d)
local s={}
local n={}
local e=H(e)
local t=true
while true do
if h(e)then
return d(n,s)
elseif O(e)then
v(n,oe(e))
e=Q(e)
elseif a(e)then
v(s,o(e))
e=i(e)
elseif w(e)then
if t then
t=false
e=g(e)
else
return r()
end
else
return l()
end
end
end
function it(s,t,d)
local n=g(t)
if w(n)then
return d
end
local function t()return D(z,e(Z,e(_e,e(R(s),n))))end
if a(n)then
return ot(n,t,function()return d end,function(n,e)
if#n~=0 then
error("WIP")
end
if l(e[1],we)then
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
return Ce(s,o,a)
elseif l(e[1],nt)then
if#e==1 then
return t()
end
local n=r(N(s,e[2]))
if not c(n)then
return t()
end
local r=g(T(n))
if w(r)then
return d
end
if not p(r)then
return t()
end
if not L(r,x)then
return t()
end
local n=g(A(n))
if w(n)then
return d
end
if not a(n)then
return t()
end
local o=o(n)
local a=g(i(n))
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
return Y(o,a)
elseif l(e[1],Z)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
v(a,N(s,e[t+1]))
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
v(a,N(s,e[t+1]))
t=t+1
end
end
return Y(o,a)
end
end)
elseif h(n)then
return n
elseif u(n)then
return Ne(s,n,t())
elseif k(n)then
return t()
end
return q()
end
function u(e)
return p(e)or c(e)
end
function ht(d,l,m)
local function n()return D(z,e(Z,e(ze,e(d,E(l)))))end
d=g(d)
if w(d)then
return m
end
if not c(d)then
return n()
end
local e=r(T(d))
if not(p(e)and L(e,t))then
return n()
end
local t=r(A(d))
if not a(t)then
return n()
end
local e=W(o(t))
local t=r(i(t))
if not(a(t)and h(r(i(t))))then
return n()
end
local d=o(t)
local r=He
local t=0
while not h(e)do
if u(e)then
local a=y
do
local e=#l-1
while e>=t do
a=s(l[e+1],a)
e=e-1
end
end
r=ve(r,e,a)
t=#l
e=y
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
r=ve(r,o(e),a)
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
function Ze(i,t,o)
local function a()return D(z,e(Z,e(i,E(t))))end
for n,e in ipairs(et)do
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
local function a()return D(z,e(we,e(R(i),o,E(t))))end
if l(o,De)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,st)then
if#t~=2 then
return a()
end
return Je(i,t[1],t[2],a)
elseif l(o,at)then
if#t~=2 then
return a()
end
return me(t[1],N(i,t[2]))
end
return a()
end
function fe(t)
return e(we,De,t)
end
function Je(m,r,f,w)
r=W(r)
local d={}
local c=false
local n=r
while not h(n)do
if u(n)then
v(d,n)
c=true
n=y
elseif a(n)then
v(d,o(n))
n=i(n)
else
return w()
end
end
local o
if c then
o=E(d)
else
o=r
end
local a={}
Se(m,function(t,e)
do
local e=0
while e<#d do
if l(d[e+1],t)then
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
o=s(fe(tt(m,a[e+1])),o)
e=e-1
end
end
return _(t,e(r,s(fe(_(t,e(i,f))),o)))
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
local function n(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
S(e,t)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
S(e,t)
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
return n(e,t,o,i)
elseif k(e)then
if not k(t)then
return false
end
return n(e,t,U,M)
elseif c(e)then
if not c(t)then
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
elseif c(e)then
return"#"..tostring(f(s(T(e),A(e))))
elseif k(e)then
return"!"..tostring(f(s(U(e),M(e))))
elseif p(e)then
return ie(e)
elseif O(e)then
return";("..tostring(f(oe(e))).." "..tostring(f(Q(e)))..")"
elseif K(e)then
return"$("..tostring(f(R(X(e)))).." "..tostring(f(te(e)))..")"
elseif V(e)then
return"%("..tostring(f(ne(e))).." "..tostring(f(E(se(e))))..")"
elseif B(e)then
return"@("..tostring(f(R(be(e)))).." "..tostring(f(ge(e))).." "..tostring(f(E(xe(e))))..")"
elseif P(e)then
return"^("..tostring(f(qe(e))).." "..tostring(f(E(Te(e))))..")"
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
function m()
local e=n()
function m()return e end
return e
end
b=0
C=1
ae=2
F=3
Oe=4
de=5
re=6
le=7
pe=8
ye=9
Ae=11
je=10
local function mt(e)
return m()[e]~=nil
end
local function Xe(e)
return{
b,
e,
}
end
local function Ze(e)
return d()[e]~=nil
end
local function n(e)
return Xe(d()[e])
end
y={ae}
local function Ae(e)
local t=Re(e)
local function o(e)
e[2]=W(e[2])
e[3]=W(e[3])
if O(e[2])or O(e[3])then
local t=rt(e)
local a=e[2]
local e=e[3]
local a=Ae(a)
local e=Ae(e)
t[2]=a
t[3]=e
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
z=n("太始初核")
local ye=n("符名")
t=n("化滅")
x=n("式形")
local rt=n("等同")
local dt=n("解算")
local F=n("特定其物")
local m=n("省略一物")
Ve=n("映表")
local ct=n("如若")
local u=n("一類何物")
local ae=n("是非")
local pe=n("其子")
local Je=n("爻陽")
local tt=n("爻陰")
local ut=n("引用")
local pt=n("應用")
local ft=n("間空")
local de=n("連頸")
local re=n("構物")
local le=n("謬誤")
local bt=n("詞素")
local Oe=n("列序")
local gt=n("首始")
local vt=n("尾末")
local it=n("之物")
local d=n("宇宙亡矣")
local ht=n("效應")
local ot=n("註疏")
lt=D(z,e(d,m))
local function b(e)
return _(ye,s(z,s(e,y)))
end
local function je(a)
return b(e(u,e(t,m,a),F))
end
local function d(o,a)
return b(e(u,e(t,e(o),m),a))
end
local function C(a)
return b(e(u,t,e(ae,e(u,a,m))))
end
local yt=je(re)
Fe=d(re,ye)
Qe=d(re,Oe)
Ge=C(re)
local lt=je(le)
Ke=d(le,ye)
Be=d(le,Oe)
We=C(le)
local wt=je(de)
Ye=C(de)
Pe=d(de,gt)
Ue=d(de,vt)
Me=C(bt)
Le=C(ft)
J=b(e(u,t,e(ae,rt)))
ze=b(e(u,e(t,s(t,m),m),pt))
_e=b(e(u,t,dt))
local rt=d(Oe,e(u,it,m))
ee=b(e(u,t,ct))
De=b(e(u,x,ut))
st=b(e(u,e(x,e(t,m,t)),F))
Z=b(e(x,e(z,t)))
we=b(e(x,e(z,x)))
nt=b(e(x,x))
local nt=b(e(u,t,ot))
at=b(e(u,x,ot))
local d=_(tt,e())
local we=_(Je,e())
local function je(e,n,s)
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
local function C(e)
return je(e,function(e)return e end,function(e,e)return false end)
end
local function st(e)
while G(e)or O(e)do
e=H(Ee(e))
end
return e
end
local function Oe(e)
if K(e)then
return e
elseif B(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif P(e)then
error("WIP")
end
return q()
end
local function De(e)
return X(Oe(e))
end
local function at(e)
return te(Oe(e))
end
local function ot(e)
if O(e)then
return Q(e)
else
return g(e)
end
end
He={}
local function re(t)
t=r(t)
if not c(t)then
return false
end
local e=r(T(t))
if not p(e)then
return false
end
if not L(e,Ve)then
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
if l(t[(e+0)+1],n)then
t[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
v(t,n)
v(t,a)
end
end
return t
end
local function le(t,a)
return{
t,
1,
function(e)
e=g(e)
if w(e)then
return j(t,{e})
end
if a(e)then
return we
end
return d
end,
}
end
local function Z(t,a,o)
return{
t,
1,
function(e,i)
e=g(e)
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
et={
le(Ge,c),
{
yt,
2,
_,
},
Z(Fe,c,T),
Z(Qe,c,A),
le(We,k),
{
lt,
2,
D,
},
Z(Ke,k,U),
Z(Be,k,M),
le(Le,h),
{
wt,
2,
s,
},
le(Ye,a),
Z(Pe,a,o),
Z(Ue,a,i),
{
J,
2,
function(e,t,n)
if e==t then
return we
end
e=g(e)
t=g(t)
if w(e)or w(t)then
return j(J,{
e,
t,
})
end
if e==t then
return we
end
local function n(t,a,e)
return j(ee,{
t,
a,
e,
})
end
local function s(t,e)
return n(t,e,d)
end
I(not w(e))
local function n(e,a,o,t)
return s(j(J,{
o(e),
o(a),
}),j(J,{
t(e),
t(a),
}))
end
if h(e)then
if not h(e)then
return d
end
return we
elseif p(e)then
if not p(t)then
return d
end
if L(e,t)then
return we
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return n(e,t,T,A)
elseif a(e)then
if not a(t)then
return d
end
return n(e,t,o,i)
elseif k(e)then
if not k(t)then
return d
end
return n(e,t,U,M)
end
return q()
end,
},
{
ze,
2,
function(s,e,n)
local t={}
local e=r(e)
while a(e)do
v(t,o(e))
e=r(i(e))
end
if not h(e)then
return n()
end
return Y(s,t)
end,
},
{
_e,
2,
function(e,a,t)
local e=re(e)
if e==false then
return t()
end
return N(e,a)
end,
},
le(Me,p),
{
rt,
1,
function(e,t)
e=g(e)
if w(e)then
return j(rt,{e})
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
e=g(e)
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
local e=r(T(e))
if not p(e)then
return t()
end
if L(e,Je)then
return a
end
if L(e,tt)then
return o
end
return t()
end,
},
{
nt,
2,
me,
},
}
local Z
Z=l
local function d(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function n(t,e,a,o)
if d(a(t),a(e))and d(o(t),o(e))then
S(t,e)
return true
else
return false
end
end
if h(e)then
if not h(t)then
return false
end
S(e,y)
S(t,y)
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
return n(e,t,o,i)
elseif k(e)then
if not k(t)then
return false
end
return n(e,t,U,M)
elseif c(e)then
if not c(t)then
return false
end
return n(e,t,T,A)
elseif he(e)then
return false
end
return q()
end
local function J(J)
local C,w,l,d,c,r,T,A,B,g,V,W,P,M,O,H,S,L,U,q,R,k,f,G,K,Q
function l()
return#C==w
end
function d()
I(not l())
local e=string.sub(C,w+1,w+1)
w=w+1
return e
end
function c(e)
I(string.sub(C,w,w)==e)
w=w-1
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
function A()
if l()then
return false
end
local e=d()
if not T(e)then
c(e)
return false
end
while T(e)and not l()do
e=d()
end
if not T(e)then
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
if not L(e)then
c(e)
return false
end
while L(e)and not l()do
t=tostring(t)..tostring(e)
e=d()
end
if L(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
if Ze(t)then
return n(t)
else
return r("Not Atom"..tostring(t))
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
local t=ke()
local a=t
local function i(a)
local e=ke()
ce(t,s(a,e))
t=e
end
while true do
A()
if l()then
return r()
end
e=d()
if e==")"then
ce(t,y)
return a
end
if e=="."then
A()
local o=U()
ce(t,o)
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
local e=U()
i(e)
end
end
function V()
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
return _(o(e),i(e))
end
function W()
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
return D(o(e),i(e))
end
function L(e)
if T(e)then
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
A()
local e={
g,
Q,
V,
W,
P,
M,
O,
H,
S,
}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function q(e)
if e==false then
return r()
end
return e
end
function R()
return not l()
end
function k(e)
q(R())
q(d()==e)
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
B,
a,
V,
W,
P,
M,
O,
H,
S,
}
else
t={
g,
K,
V,
W,
P,
M,
O,
H,
S,
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
function G(a)
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
return e(pe,E(t))
else
c(o)
return a
end
end
function K()
if l()then
return false
end
local a=d()
if a=="&"then
q(R())
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
q(R())
local a=d()
if a=="&"then
k(">")
local a=f()
return e(u,e(x,e(t,m,a)),F)
elseif a==">"then
local a=f()
return e(u,e(t,m,a),F)
else
c(a)
end
local t=f()
return e(u,t,F)
elseif a=="+"then
local t=f()
return e(z,t)
elseif a=="["then
local e=f()
k("]")
return G(e)
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
return G(e)
end
end
function Q()
local e=K()
if e==false then
return false
end
if p(e)then
return e
end
return b(e)
end
C=J
w=0
local function e(t,n)
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
P=e("$",function(e,t)
local e=re(e)
if e==false then
return r()
end
return N(e,t)
end)
M=e("%",function(e,t)
local t=je(t,function(e)return e end,function(e,e)return r()end)
return j(e,t)
end)
O=s("@",function(o,a,e)
local t=je(e,function(e)return e end,function(e,e)return r()end)
local e=re(o)
if e==false then
return r()
end
return Ce(e,a,t)
end)
H=e("^",function(t,e)
local e=je(e,function(e)return e end,function(e,e)return r()end)
return Y(t,e)
end)
S=e(";",function(t,e)return me(t,e)end)
return U()
end
local function j(w)
local function n(r,l)
if p(r)then
return ie(r)
end
local function h(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=C(r)
if e~=false and#e==3 and d(e[1],u)then
local s=C(e[2])
if s~=false and#s==3 and d(s[1],t)then
local t=s[2]
local r=C(t)
if r~=false and#r==1 and d(s[3],m)then
return h(tostring(n(r[1],true)).."."..tostring(n(e[3],true)))
elseif a(t)and d(i(t),m)and d(s[3],m)then
return h(tostring(n(o(t),true)).."@"..tostring(n(e[3],true)))
elseif d(t,m)and d(e[3],F)then
return h(":>"..tostring(n(s[3],true)))
end
end
local a=C(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],ae)then
return h(tostring(n(a[2],true)).."?")
end
if s~=false and#s==2 and d(e[3],F)and d(s[1],x)then
local e=C(s[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],m)then
return h(":&>"..tostring(n(e[3],true)))
end
end
local t
if d(e[3],m)then
t="_"
elseif d(e[3],F)then
t=""
else
t=n(e[3],true)
end
return h(tostring(t)..":"..tostring(n(e[2],true)))
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=C(e[2])
if t~=false and#t==2 and d(t[1],z)then
return h("&+"..tostring(n(t[2],true)))
end
return h("&"..tostring(n(e[2],true)))
elseif d(e[1],ae)then
return h(tostring(n(e[2],true)).."~")
elseif d(e[1],z)then
return h("+"..tostring(n(e[2],true)))
elseif d(e[1],pe)then
local e=C(e[2])
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
if l then
return f(r)
else
return f(b(r))
end
end
local e=J(f(w))
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
elseif c(e)then
local a=T(e)
local t=A(e)
local e=C(t)
if e~=false and#e==2 and d(a,ye)and d(e[1],z)then
return n(e[2],false)
end
return"#"..tostring(j(s(a,t)))
elseif k(e)then
return"!"..tostring(j(s(U(e),M(e))))
elseif p(e)then
return ie(e)
elseif O(e)then
return";("..tostring(j(oe(e))).." "..tostring(j(Q(e)))..")"
elseif K(e)then
return"$("..tostring(j(R(X(e)))).." "..tostring(j(te(e)))..")"
elseif V(e)then
return"%("..tostring(j(ne(e))).." "..tostring(j(E(se(e))))..")"
elseif B(e)then
return"@("..tostring(j(R(be(e)))).." "..tostring(j(ge(e))).." "..tostring(j(E(xe(e))))..")"
elseif P(e)then
return"^("..tostring(j(qe(e))).." "..tostring(j(E(Te(e))))..")"
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
return Ie(e,i(t,o))
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
if mt(t)then
Ie(e,Xe(t))
else
return a("can_new_atom_unicodechar_p(\""..tostring(t).."\") == false")
end
elseif t=="."then
o(s)
elseif t=="#"then
o(_)
elseif t=="!"then
o(D)
elseif t=="$"then
o(function(e,t)
local e=re(e)
if e==false then
return a()
else
return N(e,t)
end
end)
elseif t=="_"then
Ie(e,y)
else
return a()
end
end
i(n())
i(#e==1)
return e[1]
end
local function I(e)
local s={e}
local t=""
while#s~=0 do
local r={}
for n,e in ipairs(s)do
e=H(e)
local function n(e,i,a,o)
t=tostring(t)..tostring(i)
return v(r,a(e),o(e))
end
if p(e)then
t=tostring(t)..tostring(("^"..tostring(ue(e)).."^"))
elseif a(e)then
n(e,".",o,i)
elseif h(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
n(e,"#",T,A)
elseif k(e)then
n(e,"!",U,M)
elseif he(e)then
local e=Oe(e)
n(e,"$",(function(e)return R(X(e))end),te)
else
return q()
end
end
s=r
end
return t
end
local function z(e)
return function()return{
false,
e,
}end
end
local function v(e)
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
local x=b(s(pe,s(s(ht,s(s(u,s(it,s(m,y))),y)),y)))
local b=b(s(pe,s(s(ht,s(de,y)),y)))
local function F(t,a)
return _(b,e(t,a))
end
local function P(e)
return _(x,e)
end
local function m(f,w,u,y,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
u=r(u)
if c(u)then
local c=T(u)
local s=A(u)
if l(c,x)then
s=r(s)
if a(s)then
local e=o(s)
local t=r(i(s))
if h(t)then
if d==false then
local t=e
local a=y
local function e()return f(t,a)end
return v(e)
else
local t
t=f
local a
a=w
local i=e
local e=y
local function o()return m(t,a,Y(d,i),e)end
return v(o)
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
if d==false then
local t
t=f
local e
e=w
local n=l
local o=a
local i=y
local function a()return m(t,e,n,i,o)end
return v(a)
else
local i
i=f
local o
o=w
local r=l
local h=a
local s=y
local d=d
local a=n("序甲")
local function n()return m(i,o,r,s,_(t,e(e(a),p(e(fe(h),a),fe(d)))))end
return v(n)
end
end
end
end
end
end
if d==false then
return v(function()return w(u,y,f)end)
else
return v(function()return w(u,y,function(e,t)return v(function()return m(f,w,Y(d,{e}),t)end)end)end)
end
end
local function d(t,e,a,o)
return m(t,e,a,o)
end
local function l(a,i,n,o)
return q(m((function(t,e)return z(a(t,e))end),(function(e,t,a)return z(i(e,t,function(e,t)return q(a(e,t))end))end),n,o))
end
local t={}
t.new_comment=me
t.comment_p=O
t.comment_comment=oe
t.comment_x=Q
t.un_comment_all=Ee
t.can_new_atom_p=Ze
t.new_atom=n
t.atom_p=p
t.un_atom=ie
t.atom_equal_p=L
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=i
t.null_v=y
t.null_p=h
t.new_data=_
t.data_p=c
t.data_name=T
t.data_list=A
t.new_error=D
t.error_p=k
t.error_name=U
t.error_list=M
t.just_p=G
t.evaluate=N
t.apply=Y
t.force_all_rec=W
t.force_uncomment_all_rec=Ae
t.jsArray_to_list=E
t.maybe_list_to_jsArray=C
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=st
t.delay_p=he
t.delay_just_p=w
t.delay_env=De
t.delay_x=at
t.force_all=r
t.force1=g
t.force_uncomment1=ot
t.force_uncomment_all=Re
t.env_null_v=He
t.env_set=ve
t.env_get=Ne
t.env2val=R
t.env_foreach=Se
t.val2env=re
t.equal_p=Z
t.simple_print=f
t.complex_parse=J
t.complex_print=j
t.machinetext_parse=S
t.machinetext_print=I
t.trampoline_return=z
t.trampoline_delay=v
t.run_trampoline=q
t.return_effect_systemName=x
t.bind_effect_systemName=b
t.new_effect_bind=F
t.new_effect_return=P
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
