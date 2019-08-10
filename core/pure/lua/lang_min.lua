local function l(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ae(a,...)
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
local q,O,Ve,Pe,ve,M,J,Te,be,de,oe,Ye,ce,ae,k,te,D,K,w,L,S,h,a,i,n,p,s,_,c,j,E,B,st,N,V,Z,ee,We,F,ge,ke,xe,z,P,se,ne,C,Y,_e,ze,W,Fe,Ee,o,I,re,it,A,he,t,x,je,nt,ht,Oe,Ne,Ie,Se,He,Me,Le,De,X,fe,me,G,qe,ot,U,ie,tt,et,g,T,e,H,le,y,Q,d,b,r,we,ye,Xe,f,Ue,pe,Ce,Je,R,Re,Ze,at,Qe,Ge,Be,ue,Ke,u,m,v
function q()
error("TheLanguage PANIC")
end
function O(e)
if not e then
return q()
end
end
function ae(e,t)
return{Ye,e,t}
end
function k(e)
return e[1]==Ye
end
function te(e)
return e[2]
end
function D(e)
return e[3]
end
function K(e)
while k(e)do
e=D(e)
end
return e
end
function w(e)
return e[1]==Ve
end
function L(e)
return e[2]
end
function S(t,e)
if t==e then
return true
end
if L(t)==L(e)then
I(t,e)
return true
else
return false
end
end
function h(e,t)
return{Pe,e,t}
end
function a(e)
return e[1]==Pe
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function s(e)
return e[1]==ve
end
function _(t,e)
return{M,t,e}
end
function c(e)
return e[1]==M
end
function j(e)
return e[2]
end
function E(e)
return e[3]
end
function B(e)
return e[1]==J
end
function st(e)
return e[2]
end
function N(t,e)
return{Te,t,e}
end
function V(e)
return e[1]==Te
end
function Z(e)
return e[2]
end
function ee(e)
return e[3]
end
function We(e,t,a)
return{de,e,t,a}
end
function F(e)
return e[1]==de
end
function ge(e)
return e[2]
end
function ke(e)
return e[3]
end
function xe(e)
return e[4]
end
function z(t,e)
return{be,t,e}
end
function P(e)
return e[1]==be
end
function se(e)
return e[2]
end
function ne(e)
return e[3]
end
function C(e,t)
return{oe,e,t}
end
function Y(e)
return e[1]==oe
end
function _e(e)
return e[2]
end
function ze(e)
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
elseif a(e)then
return t(e)
elseif k(e)then
return t(e)
end
return e
end
function Ee()
return{ce}
end
function o(e)
return e[1]==ce
end
function I(e,t)
if e==t then
return
end
if e==p then
e=t
t=p
end
e[1]=J
e[2]=t
e[3]=false
e[4]=false
end
function re(t,e)
O(
o(t)
)
O(
not o(e)
)
local t=t
local e=e
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function it(t)
local e=Ee()
re(e,t)
return e
end
function g(e,t)
return _(
nt,
h(
e,
h(t,p)
)
)
end
function T(a)
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
return T(e)
end
function H(e)
if not B(e)then
return e
end
local e=e
local t={}
while B(e)do
l(t,e)
e=st(e)
end
for a,t in ipairs(t)do
I(t,e)
end
return e
end
function le(e)
return V(e)or F(e)or P(e)or Y(e)
end
function y(e)
return B(e)or le(e)
end
function Q(e)
return y(e)or k(e)
end
function d(o,i,t,a)
if i==nil then
i={}
end
if t==nil then
t={false,false}
end
if a==nil then
a={}
end
local e,h,n
function h(t)
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
h(t)
if y(t)then
l(a,e)
return d(t,i,{false,false},a)
end
return t
end
local s={}
e=o
local function o()
t[2]=true
return n(ht)
end
local function r()
local e={}
for t in pairs(s)do
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
e=b(e)
t=t+1
end
end
while y(e)do
local h=v(e)
if i[h]==true then
return o()
end
if s[h]==true then
t[1]=true
if V(e)then
return o()
elseif P(e)then
local a=se(e)
local e=ne(e)
local s={Oe,Ne,Ie,Se,He,Me,Le,De}
local i=false
for t,e in ipairs(s)do
if m(e,a)then
i=true
break
end
end
if i then
O(#e==1)
O(t[2]==false)
local e=d(
e[1],
r(),
t
)
if t[2]then
return n(
z(a,{e})
)
else
return q()
end
end
if m(a,X)then
return o()
elseif m(a,fe)then
return o()
elseif m(a,me)then
return o()
elseif m(a,G)then
O(#e==3)
O(t[2]==false)
local a=d(
e[1],
r(),
t
)
if t[2]then
return n(
z(G,{a,e[2],e[3]})
)
else
return q()
end
end
return q()
elseif F(e)then
return o()
elseif Y(e)then
return o()
end
return q()
end
s[h]=true
l(a,e)
e=b(e)
end
return h(e)
end
function b(a)
local e=H(a)
local t
O(
not B(e)
)
if V(e)then
t=Ze(
Z(e),
ee(e),
a
)
elseif F(e)then
t=Be(
ge(e),
ke(e),
xe(e),
a
)
elseif P(e)then
t=Ge(
se(e),
ne(e),
a
)
elseif Y(e)then
t=Qe(
_e(e),
ze(e),
a
)
else
t=e
end
t=H(t)
I(e,t)
return t
end
function r(e)
return d(e)
end
function we(e)
while y(e)or k(e)do
e=r(
K(e)
)
end
return e
end
function ye(e)
while k(e)do
e=D(e)
end
e=b(e)
while k(e)do
e=D(e)
end
return e
end
function Xe(e,r,u,d)
local t={}
local o={}
local e=H(e)
local h=true
while true do
if s(e)then
return d(o,t)
elseif k(e)then
l(
o,
te(e)
)
e=D(e)
elseif a(e)then
l(
t,
i(e)
)
e=n(e)
elseif y(e)then
if h then
h=false
e=b(e)
else
return u()
end
else
return r()
end
end
end
function f(e)
if Q(e)then
e=ye(e)
end
if Q(e)then
return nil
end
if w(e)then
return true
end
if not c(e)then
return false
end
local e=j(e)
if Q(e)then
e=ye(e)
end
if Q(e)then
return nil
end
if not w(e)then
return false
end
return S(e,he)
end
function pe(a,o,i)
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
function Ce(t,a,o)
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
function Je(t,a)
do
local e=0
while e<#t do
if m(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return q()
end
function R(a)
local o=p
do
local t=0
while t<#a do
o=h(
e(a[(t+0)+1],a[(t+1)+1]),
o
)
t=t+2
end
end
return _(
je,
e(o)
)
end
function Re(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function Ze(o,t,d)
local h=b(t)
if y(h)then
return d
end
local function t()return g(
A,
e(
U,
e(
me,
e(
R(o),
h
)
)
)
)end
if a(h)then
return Xe(
h,
t,
function()return d end,
function(h,e)
if#h~=0 then
error("WIP")
end
if m(e[1],ie)then
if#e==1 then
return t()
end
local i=e[2]
local a={}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return We(o,i,a)
elseif m(e[1],tt)then
if#e==1 then
return t()
end
local r=r(
N(o,e[2])
)
if not c(r)then
return t()
end
local h=b(
j(r)
)
if y(h)then
return d
end
if not w(h)then
return t()
end
if not S(h,x)then
return t()
end
local h=b(
E(r)
)
if y(h)then
return d
end
if not a(h)then
return t()
end
local i=i(h)
local a=b(
n(h)
)
if y(a)then
return d
end
if not s(a)then
return t()
end
local a={
R(o)
}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return C(i,a)
elseif m(e[1],U)then
if#e==1 then
return t()
end
local i=e[2]
local a={}
do
local t=2
while t<#e do
l(
a,
N(o,e[t+1])
)
t=t+1
end
end
return z(i,a)
else
local i=N(o,e[1])
local a={}
do
local t=1
while t<#e do
l(
a,
N(o,e[t+1])
)
t=t+1
end
end
return C(i,a)
end
end
)
elseif s(h)then
return h
end
local e=f(h)
if e==nil then
return d
end
if e==true then
return Ce(
o,
h,
t()
)
end
return t()
end
function Qe(l,d,u)
local function o()return g(
A,
e(
U,
e(
fe,
e(
l,
T(d)
)
)
)
)end
l=b(l)
if y(l)then
return u
end
if not c(l)then
return o()
end
local e=r(
j(l)
)
if not(w(e)and S(e,t))then
return o()
end
local t=r(
E(l)
)
if not a(t)then
return o()
end
local e=W(
i(t)
)
local t=r(
n(t)
)
if not(a(t)and s(
r(
n(t)
)
))then
return o()
end
local l=i(t)
local r=Ue
local t=0
while not s(e)do
local s=f(e)
if s==nil then
return u
end
if s==true then
local a=p
do
local e=#d-1
while e>=t do
a=h(d[e+1],a)
e=e-1
end
end
r=pe(r,e,a)
t=#d
e=p
elseif a(e)then
if t<#d then
local a=d[t+1]
t=t+1
r=pe(
r,
i(e),
a
)
e=n(e)
else
return o()
end
else
return o()
end
end
if#d~=t then
return o()
end
return N(r,l)
end
function Ge(i,t,o)
local function a()return g(
A,
e(
U,
e(
i,
T(t)
)
)
)end
for n,e in ipairs(at)do
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
return q()
end
end
return a()
end
function Be(i,o,t,a)
local function a()return g(
A,
e(
ie,
e(
R(i),
o,
T(t)
)
)
)end
if m(o,qe)then
if#t~=1 then
return a()
end
return t[1]
elseif m(o,ot)then
if#t~=2 then
return a()
end
return Ke(i,t[1],t[2],a)
elseif m(o,et)then
if#t~=2 then
return a()
end
return ae(
t[1],
N(i,t[2])
)
end
return a()
end
function ue(t)
return e(ie,qe,t)
end
function Ke(c,r,w,y)
r=Fe(r)
local d={}
local u=false
local o=r
while not s(o)do
local e=f(o)
O(e~=nil)
if e then
l(d,o)
u=true
o=p
elseif a(o)then
l(
d,
i(o)
)
o=n(o)
else
return y()
end
end
local o
if u then
o=T(d)
else
o=r
end
local a={}
Re(
c,
function(t,e)
do
local e=0
while e<#d do
if m(d[e+1],t)then
return
end
e=e+1
end
end
l(a,t)
end
)
local i=o
do
local e=#a-1
while e>=0 do
i=h(a[e+1],i)
e=e-1
end
end
local o=o
do
local e=#a-1
while e>=0 do
o=h(
ue(
Je(c,a[e+1])
),
o
)
e=e-1
end
end
return _(
t,
e(
r,
h(
ue(
_(
t,
e(i,w)
)
),
o
)
)
)
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
local function h(t,e,o,a)
local o=u(
o(t),
o(e)
)
local a=u(
a(t),
a(e)
)
if o==true and a==true then
I(t,e)
return true
elseif o~=false and a~=false then
return nil
else
return false
end
end
if k(t)then
local t=K(t)
local e=u(t,e)
if e==true then
e=nil
end
return e
elseif k(e)then
local e=K(e)
local e=u(t,e)
if e==true then
e=nil
end
return e
elseif s(t)then
if not s(e)then
return false
end
I(t,e)
return true
elseif w(t)then
if not w(e)then
return false
end
return S(t,e)
elseif a(t)then
if not a(e)then
return false
end
return h(t,e,i,n)
elseif c(t)then
if not c(e)then
return false
end
return h(t,e,j,E)
end
return q()
end
function m(t,e)
return u(t,e)~=false
end
function v(e)
e=H(e)
local t=""
local o=""
if s(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(
v(
i(e)
)
)
o=" "
e=H(
n(e)
)
end
if s(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
v(e)
)..")"
end
return t
elseif c(e)then
return"#"..tostring(
v(
h(
j(e),
E(e)
)
)
)
elseif w(e)then
return L(e)
elseif k(e)then
return";("..tostring(
v(
te(e)
)
).." "..tostring(
v(
D(e)
)
)..")"
elseif V(e)then
return"$("..tostring(
v(
R(
Z(e)
)
)
).." "..tostring(
v(
ee(e)
)
)..")"
elseif P(e)then
return"%("..tostring(
v(
se(e)
)
).." "..tostring(
v(
T(
ne(e)
)
)
)..")"
elseif F(e)then
return"@("..tostring(
v(
R(
ge(e)
)
)
).." "..tostring(
v(
ke(e)
)
).." "..tostring(
v(
T(
xe(e)
)
)
)..")"
elseif Y(e)then
return"^("..tostring(
v(
_e(e)
)
).." "..tostring(
v(
T(
ze(e)
)
)
)..")"
end
return q()
end
Ve=0
Pe=1
ve=2
M=3
J=4
Te=5
be=6
de=7
oe=8
Ye=10
ce=9
local function o(e)
return{Ve,e}
end
p={ve}
local function ve(e)
local t=we(e)
local function o(e)
e[2]=W(e[2])
e[3]=W(e[3])
if k(e[2])or k(e[3])then
local t=it(e)
local a=e[2]
local e=e[3]
local a=ve(a)
local e=ve(e)
t[2]=a
t[3]=e
return t
else
return e
end
end
if c(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
Fe=ve
A=o("太始初核")
he=o("符名")
t=o("化滅")
x=o("式形")
local Xe=o("等同")
local Ze=o("解算")
local M=o("特定其物")
local f=o("省略一物")
je=o("映表")
local Je=o("如若")
local u=o("一類何物")
local J=o("是非")
local ce=o("其子")
local Ye=o("爻陽")
local Pe=o("爻陰")
local st=o("引用")
local rt=o("應用")
local it=o("間空")
local de=o("連頸")
local oe=o("構物")
nt=o("謬誤")
local Qe=o("詞素")
local Ve=o("列序")
local dt=o("首始")
local lt=o("尾末")
local Ke=o("之物")
local d=o("宇宙亡矣")
local Ge=o("效應")
local Te=o("註疏")
ht=g(
A,
e(d,f)
)
local function g(e)
return _(
he,
h(
A,
h(e,p)
)
)
end
local function Be(a)
return g(
e(
u,
e(t,f,a),
M
)
)
end
local function d(a,o)
return g(
e(
u,
e(
t,
e(a),
f
),
o
)
)
end
local function be(a)
return g(
e(
u,
t,
e(
J,
e(u,a,f)
)
)
)
end
local ht=Be(oe)
Oe=d(oe,he)
Ne=d(oe,Ve)
Ie=be(oe)
local nt=Be(de)
Se=be(de)
He=d(de,dt)
Me=d(de,lt)
Le=be(Qe)
De=be(it)
X=g(
e(
u,
t,
e(J,Xe)
)
)
fe=g(
e(
u,
e(
t,
h(t,f),
f
),
rt
)
)
me=g(
e(u,t,Ze)
)
local Ve=d(
Ve,
e(u,Ke,f)
)
G=g(
e(u,t,Je)
)
qe=g(
e(u,x,st)
)
ot=g(
e(
u,
e(
x,
e(t,f,t)
),
M
)
)
U=g(
e(
x,
e(A,t)
)
)
ie=g(
e(
x,
e(A,x)
)
)
tt=g(
e(x,x)
)
local Qe=g(
e(u,t,Te)
)
et=g(
e(u,x,Te)
)
local d=_(
Pe,
e()
)
local oe=_(
Ye,
e()
)
local function qe(e,h,o)
local t={}
while a(e)do
l(
t,
i(e)
)
e=n(e)
end
if s(e)then
return h(t)
end
return o(t,e)
end
local function U(e)
return qe(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function Je(e)
while B(e)or k(e)do
e=H(
K(e)
)
end
return e
end
local function Te(e)
if V(e)then
return e
elseif F(e)then
error("WIP")
elseif P(e)then
error("WIP")
elseif Y(e)then
error("WIP")
end
return q()
end
local function Ze(e)
return Z(
Te(e)
)
end
local function Be(e)
return ee(
Te(e)
)
end
local function Xe(e)
if k(e)then
return D(e)
else
return b(e)
end
end
local ie={nil}
local function ie(e,o,t)
e=we(e)
if w(e)then
l(
t,
"^",
L(e)
)
elseif a(e)then
l(t,".")
l(
o,
i(e),
n(e)
)
elseif s(e)then
l(t,"_")
elseif c(e)then
l(t,"#")
l(
o,
j(e),
E(e)
)
else
return q()
end
end
local function be(a)
local t={}
local e={}
for o,a in ipairs(a)do
ie(a,t,e)
end
return{e,t}
end
local function ie(e,e,e)
error("WIP")
end
Ue={}
local function ie(t)
t=r(t)
if not c(t)then
return false
end
local e=r(
j(t)
)
if not w(e)then
return false
end
if not S(e,je)then
return false
end
e=r(
E(t)
)
if not a(e)then
return false
end
if not s(
r(
n(e)
)
)then
return false
end
local o={}
local t=r(
i(e)
)
while not s(t)do
if not a(t)then
return false
end
local e=r(
i(t)
)
t=r(
n(t)
)
if not a(e)then
return false
end
local h=i(e)
e=r(
n(e)
)
if not a(e)then
return false
end
local a=i(e)
if not s(
r(
n(e)
)
)then
return false
end
local t=true
do
local e=0
while e<#o do
if m(o[(e+0)+1],h)then
o[(e+1)+1]=a
t=false
break
end
e=e+2
end
end
if t then
l(o,h,a)
end
end
return o
end
local function je(t,a)
return{
t,
1,
function(e)
e=b(e)
if y(e)then
return z(t,{e})
end
if a(e)then
return oe
end
return d
end
}
end
local function be(t,o,i)
return{
t,
1,
function(e,a)
e=b(e)
if y(e)then
return z(t,{e})
end
if o(e)then
return i(e)
end
return a()
end
}
end
at={
je(Ie,c),
{ht,2,_},
be(Oe,c,j),
be(Ne,c,E),
je(De,s),
{nt,2,h},
je(Se,a),
be(He,a,i),
be(Me,a,n),
{
X,
2,
function(e,t,o)
if e==t then
return oe
end
e=b(e)
t=b(t)
if y(e)or y(t)then
return z(X,{e,t})
end
if e==t then
return oe
end
local function o(a,t,e)
return z(G,{a,t,e})
end
local function h(t,e)
return o(t,e,d)
end
O(
not y(e)
)
local function o(e,t,a,o)
return h(
z(
X,
{
a(e),
a(t)
}
),
z(
X,
{
o(e),
o(t)
}
)
)
end
if s(e)then
if not s(e)then
return d
end
return oe
elseif w(e)then
if not w(t)then
return d
end
if S(e,t)then
return oe
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return o(e,t,j,E)
elseif a(e)then
if not a(t)then
return d
end
return o(e,t,i,n)
end
return q()
end
},
{
fe,
2,
function(h,e,o)
local t={}
local e=r(e)
while a(e)do
l(
t,
i(e)
)
e=r(
n(e)
)
end
if not s(e)then
return o()
end
return C(h,t)
end
},
{
me,
2,
function(e,t,a)
local e=ie(e)
if e==false then
return a()
end
return N(e,t)
end
},
je(Le,w),
{
Ve,
1,
function(e,t)
e=b(e)
if y(e)then
return z(Ve,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
G,
3,
function(e,a,o,t)
e=b(e)
if y(e)then
return z(G,{e,a,o})
end
if not c(e)then
return t()
end
local e=r(
j(e)
)
if not w(e)then
return t()
end
if S(e,Ye)then
return a
end
if S(e,Pe)then
return o
end
return t()
end
},
{Qe,2,ae}
}
local function d(e,t)
if e==t then
return true
end
e=H(e)
t=H(t)
if e==t then
return true
end
local function o(t,e,o,a)
if d(
o(t),
o(e)
)and d(
a(t),
a(e)
)then
I(t,e)
return true
else
return false
end
end
if s(e)then
if not s(t)then
return false
end
I(e,p)
I(t,p)
return true
elseif w(e)then
if not w(t)then
return false
end
return S(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif c(e)then
if not c(t)then
return false
end
return o(e,t,j,E)
elseif le(e)then
return false
end
return q()
end
local function G(K)
local F,v,c,d,m,r,j,q,P,b,W,Y,I,D,U,S,R,H,E,L,k,y,V,B,G
function c()
return#F==v
end
function d()
O(
not c()
)
local e=string.sub(F,v+1,v+1)
v=v+1
return e
end
function m(e)
O(
string.sub(F,v,v)==e
)
v=v-1
end
function r(e)
if e==nil then
e=""
end
error(
"TheLanguage parse ERROR!"..tostring(e)
)
end
function j(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function q()
if c()then
return false
end
local e=d()
if not j(e)then
m(e)
return false
end
while j(e)and not c()do
e=d()
end
if not j(e)then
m(e)
end
return true
end
function P()
if c()then
return false
end
local e=d()
local t=""
if not R(e)then
m(e)
return false
end
while R(e)and not c()do
t=tostring(t)..tostring(e)
e=d()
end
if R(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
return o(t)
end
function b()
if c()then
return false
end
local e=d()
if e~="("then
m(e)
return false
end
local t=Ee()
local a=t
local function i(a)
local e=Ee()
re(
t,
h(a,e)
)
t=e
end
while true do
q()
if c()then
return r()
end
e=d()
if e==")"then
re(t,p)
return a
end
if e=="."then
q()
local o=H()
re(t,o)
q()
if c()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
m(e)
local e=H()
i(e)
end
end
function W()
if c()then
return false
end
local e=d()
if e~="#"then
m(e)
return false
end
local e=b()
if e==false then
return r()
end
if not a(e)then
return r()
end
return _(
i(e),
n(e)
)
end
function R(e)
if j(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function H()
q()
local e={b,G,W,Y,I,D,U,S}
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
function L()
return not c()
end
function k(e)
E(
L()
)
E(
d()==e
)
end
function y(e)
if e==nil then
e=false
end
local function a()
k("[")
local e=y()
k("]")
return e
end
local t
if e then
t={b,P,a,W,Y,I,D,U,S}
else
t={b,B,W,Y,I,D,U,S}
end
for t,e in ipairs(t)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function V(a)
if c()then
return a
end
local o=d()
if o=="."then
local o=y()
return e(
u,
e(
t,
e(a),
f
),
o
)
elseif o==":"then
local t=y()
return e(u,t,a)
elseif o=="~"then
return e(J,a)
elseif o=="@"then
local o=y()
return e(
u,
e(
t,
h(a,f),
f
),
o
)
elseif o=="?"then
return e(
u,
t,
e(J,a)
)
elseif o=="/"then
local t={a}
while true do
local e=y(true)
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
return e(
ce,
T(t)
)
else
m(o)
return a
end
end
function B()
if c()then
return false
end
local a=d()
if a=="&"then
E(
L()
)
local t=d()
if t=="+"then
local t=y()
return e(
x,
e(A,t)
)
else
m(t)
end
local t=y()
return e(x,t)
elseif a==":"then
E(
L()
)
local a=d()
if a=="&"then
k(">")
local a=y()
return e(
u,
e(
x,
e(t,f,a)
),
M
)
elseif a==">"then
local a=y()
return e(
u,
e(t,f,a),
M
)
else
m(a)
end
local t=y()
return e(u,t,M)
elseif a=="+"then
local t=y()
return e(A,t)
elseif a=="["then
local e=y()
k("]")
return V(e)
elseif a=="_"then
k(":")
local t=y()
return e(u,t,f)
else
m(a)
local e=P()
if e==false then
return false
end
return V(e)
end
end
function G()
local e=B()
if e==false then
return false
end
if w(e)then
return e
end
return g(e)
end
F=K
v=0
local function t(t,o)
return function()
if c()then
return false
end
local e=d()
if e~=t then
m(e)
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
if not(a(t)and s(
n(t)
))then
return r()
end
return o(
i(e),
i(t)
)
end
end
local function l(t,h)
return function()
if c()then
return false
end
local e=d()
if e~=t then
m(e)
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
if not a(t)then
return r()
end
local o=n(t)
if not(a(o)and s(
n(o)
))then
return r()
end
return h(
i(e),
i(t),
i(o)
)
end
end
Y=t(
"$",
function(e,t)
local e=ie(e)
if e==false then
return r()
end
return N(e,t)
end
)
I=t(
"%",
function(t,e)
local e=qe(
e,
function(e)return e end,
function(e,e)return r()end
)
return z(t,e)
end
)
D=l(
"@",
function(e,t,a)
local a=qe(
a,
function(e)return e end,
function(e,e)return r()end
)
local e=ie(e)
if e==false then
return r()
end
return We(e,t,a)
end
)
U=t(
"^",
function(e,t)
local t=qe(
t,
function(e)return e end,
function(e,e)return r()end
)
return C(e,t)
end
)
S=t(
";",
function(e,t)return ae(e,t)end
)
return H()
end
local function z(m)
local function o(r,l)
if w(r)then
return L(r)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(r)
if e~=false and#e==3 and d(e[1],u)then
local h=U(e[2])
if h~=false and#h==3 and d(h[1],t)then
local t=h[2]
local r=U(t)
if r~=false and#r==1 and d(h[3],f)then
return s(
tostring(
o(r[1],true)
).."."..tostring(
o(e[3],true)
)
)
elseif a(t)and d(
n(t),
f
)and d(h[3],f)then
return s(
tostring(
o(
i(t),
true
)
).."@"..tostring(
o(e[3],true)
)
)
elseif d(t,f)and d(e[3],M)then
return s(
":>"..tostring(
o(h[3],true)
)
)
end
end
local a=U(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],J)then
return s(
tostring(
o(a[2],true)
).."?"
)
end
if h~=false and#h==2 and d(e[3],M)and d(h[1],x)then
local e=U(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],f)then
return s(
":&>"..tostring(
o(e[3],true)
)
)
end
end
local t
if d(e[3],f)then
t="_"
elseif d(e[3],M)then
t=""
else
t=o(e[3],true)
end
return s(
tostring(t)..":"..tostring(
o(e[2],true)
)
)
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=U(e[2])
if t~=false and#t==2 and d(t[1],A)then
return s(
"&+"..tostring(
o(t[2],true)
)
)
end
return s(
"&"..tostring(
o(e[2],true)
)
)
elseif d(e[1],J)then
return s(
tostring(
o(e[2],true)
).."~"
)
elseif d(e[1],A)then
return s(
"+"..tostring(
o(e[2],true)
)
)
elseif d(e[1],ce)then
local e=U(e[2])
if e~=false and#e>1 then
local a=o(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(
o(e[t+1],true)
)
t=t+1
end
end
return s(a)
end
end
end
if l then
return v(r)
else
return v(
g(r)
)
end
end
local e=G(
v(m)
)
local t=""
local r=""
if s(e)then
return"()"
elseif a(e)then
t="("
r=""
while a(e)do
t=tostring(t)..tostring(r)..tostring(
z(
i(e)
)
)
r=" "
e=n(e)
end
if s(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
z(e)
)..")"
end
return t
elseif c(e)then
local t=j(e)
local a=E(e)
local e=U(a)
if e~=false and#e==2 and d(t,he)and d(e[1],A)then
return o(e[2],false)
end
return"#"..tostring(
z(
h(t,a)
)
)
elseif w(e)then
return L(e)
elseif k(e)then
return";("..tostring(
z(
te(e)
)
).." "..tostring(
z(
D(e)
)
)..")"
elseif V(e)then
return"$("..tostring(
z(
R(
Z(e)
)
)
).." "..tostring(
z(
ee(e)
)
)..")"
elseif P(e)then
return"%("..tostring(
z(
se(e)
)
).." "..tostring(
z(
T(
ne(e)
)
)
)..")"
elseif F(e)then
return"@("..tostring(
z(
R(
ge(e)
)
)
).." "..tostring(
z(
ke(e)
)
).." "..tostring(
z(
T(
xe(e)
)
)
)..")"
elseif Y(e)then
return"^("..tostring(
z(
_e(e)
)
).." "..tostring(
z(
T(
ze(e)
)
)
)..")"
end
return q()
end
local function I(i)
local e,s,t
function s()
return e==0
end
function t()
return not s()
end
e=#i
local function a(e)
if e==nil then
e=""
end
error(
"MT parse ERROR "..tostring(e)
)
end
local function n(e)
if not e then
return a()
end
end
local function r()
n(
t()
)
e=e-1
return string.sub(i,e+1,e+1)
end
local e={}
local function i(i)
local t=table.remove(e)
local o=table.remove(e)
if o==nil or t==nil then
return a()
else
return Ae(
e,
i(o,t)
)
end
end
while t()do
local t=r()
if t=="^"then
local t=""
while true do
local e=r()
if e=="^"then
break
end
t=tostring(e)..tostring(t)
end
Ae(
e,
o(t)
)
elseif t=="."then
i(h)
elseif t=="#"then
i(_)
elseif t=="$"then
i(
function(e,t)
local e=ie(e)
if e==false then
return a()
else
return N(e,t)
end
end
)
elseif t=="_"then
Ae(e,p)
else
return a()
end
end
n(
s()
)
n(#e==1)
return e[1]
end
local function M(e)
local o={e}
local t=""
while#o~=0 do
local h={}
for r,e in ipairs(o)do
e=H(e)
local function o(e,i,o,a)
t=tostring(t)..tostring(i)
return l(
h,
o(e),
a(e)
)
end
if w(e)then
t=tostring(t)..tostring(
("^"..tostring(
L(e)
).."^")
)
elseif a(e)then
o(e,".",i,n)
elseif s(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
o(e,"#",j,E)
elseif le(e)then
local e=Te(e)
o(
e,
"$",
(function(e)return R(
Z(e)
)end),
ee
)
else
return q()
end
end
o=h
end
return t
end
local function O(e)
return function()return{false,e}end
end
local function l(e)
return function()return{
true,
e()
}end
end
local function x(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local A=g(
h(
ce,
h(
h(
Ge,
h(
h(
u,
h(
Ke,
h(f,p)
)
),
p
)
),
p
)
)
)
local q=g(
h(
ce,
h(
h(
Ge,
h(de,p)
),
p
)
)
)
local function Y(a,t)
return _(
q,
e(a,t)
)
end
local function F(e)
return _(A,e)
end
local function g(f,w,u,y,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
u=r(u)
if c(u)then
local c=j(u)
local h=E(u)
if m(c,A)then
h=r(h)
if a(h)then
local e=i(h)
local t=r(
n(h)
)
if s(t)then
if d==false then
local t=e
local a=y
local function e()return f(t,a)end
return l(e)
else
local a
a=f
local t
t=w
local i=e
local e=y
local function o()return g(
a,
t,
C(d,i),
e
)end
return l(o)
end
end
end
elseif m(c,q)then
h=r(h)
if a(h)then
local u=i(h)
local h=r(
n(h)
)
if a(h)then
local a=i(h)
local i=r(
n(h)
)
if s(i)then
if d==false then
local e
e=f
local t
t=w
local n=u
local o=a
local i=y
local function a()return g(e,t,n,i,o)end
return l(a)
else
local n
n=f
local i
i=w
local r=u
local h=a
local s=y
local d=d
local a=o("序甲")
local function o()return g(
n,
i,
r,
s,
_(
t,
e(
e(a),
p(
e(
ue(h),
a
),
ue(d)
)
)
)
)end
return l(o)
end
end
end
end
end
end
if d==false then
return l(
function()return w(u,y,f)end
)
else
return l(
function()return w(
u,
y,
function(e,t)return l(
function()return g(
f,
w,
C(d,{e}),
t
)end
)end
)end
)
end
end
local function d(t,e,a,o)
return g(t,e,a,o)
end
local function u(a,i,n,o)
return x(
g(
(function(t,e)return O(
a(t,e)
)end),
(function(e,t,a)return O(
i(
e,
t,
function(e,t)return x(
a(e,t)
)end
)
)end),
n,
o
)
)
end
local t={}
t.new_comment=ae
t.comment_p=k
t.comment_comment=te
t.comment_x=D
t.un_comment_all=K
t.new_atom=o
t.atom_p=w
t.un_atom=L
t.atom_equal_p=S
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=p
t.null_p=s
t.new_data=_
t.data_p=c
t.data_name=j
t.data_list=E
t.just_p=B
t.evaluate=N
t.apply=C
t.force_all_rec=W
t.force_uncomment_all_rec=ve
t.unlazy_all_rec=Fe
t.jsArray_to_list=T
t.maybe_list_to_jsArray=U
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=Je
t.delay_p=le
t.delay_just_p=y
t.lazy_p=Q
t.delay_env=Ze
t.delay_x=Be
t.force_all=r
t.force1=b
t.force_uncomment1=Xe
t.force_uncomment_all=we
t.unlazy1=ye
t.env_null_v=Ue
t.env_set=pe
t.env_get=Ce
t.env2val=R
t.env_foreach=Re
t.val2env=ie
t.equal_p=m
t.simple_print=v
t.complex_parse=G
t.complex_print=z
t.machinetext_parse=I
t.machinetext_print=M
t.trampoline_return=O
t.trampoline_delay=l
t.run_trampoline=x
t.return_effect_systemName=A
t.bind_effect_systemName=q
t.new_effect_bind=Y
t.new_effect_return=F
t.run_monad_trampoline=d
t.run_monad_stackoverflow=u
return t
