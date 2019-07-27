local function p(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Re(a,...)
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
local j,I,Z,W,he,U,Ee,Ze,et,Ye,Ke,ue,xe,re,le,k,ce,C,X,y,Y,H,s,a,o,n,v,r,A,u,z,O,D,q,M,F,Q,ut,R,G,ee,ae,De,B,ve,ze,_e,x,V,pe,fe,P,K,qe,be,J,Xe,ge,i,S,we,lt,E,oe,t,_,Ie,at,Ue,Le,He,Se,Ne,Ge,Be,Je,Pe,Me,Ce,te,Ae,Oe,ie,ke,nt,ne,de,it,ot,T,e,N,ye,w,se,d,b,h,Fe,je,l,g,We,Te,Qe,tt,L,Ve,ct,mt,dt,rt,st,me,ht,f,c,m
function j()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return j()
end
end
function le(t,e)
return{xe,t,e}
end
function k(e)
return e[1]==xe
end
function ce(e)
return e[2]
end
function C(e)
return e[3]
end
function X(e)
while k(e)do
e=C(e)
end
return e
end
function y(e)
return e[1]==Z
end
function Y(e)
return e[2]
end
function H(t,e)
if t==e then
return true
end
if Y(t)==Y(e)then
S(t,e)
return true
else
return false
end
end
function s(t,e)
return{W,t,e}
end
function a(e)
return e[1]==W
end
function o(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==he
end
function A(t,e)
return{U,t,e}
end
function u(e)
return e[1]==U
end
function z(e)
return e[2]
end
function O(e)
return e[3]
end
function D(e,t)
return{Ee,e,t}
end
function q(e)
return e[1]==Ee
end
function M(e)
return e[2]
end
function F(e)
return e[3]
end
function Q(e)
return e[1]==Ze
end
function ut(e)
return e[2]
end
function R(t,e)
return{et,t,e}
end
function G(e)
return e[1]==et
end
function ee(e)
return e[2]
end
function ae(e)
return e[3]
end
function De(e,a,t)
return{Ke,e,a,t}
end
function B(e)
return e[1]==Ke
end
function ve(e)
return e[2]
end
function ze(e)
return e[3]
end
function _e(e)
return e[4]
end
function x(t,e)
return{Ye,t,e}
end
function V(e)
return e[1]==Ye
end
function pe(e)
return e[2]
end
function fe(e)
return e[3]
end
function P(e,t)
return{ue,e,t}
end
function K(e)
return e[1]==ue
end
function qe(e)
return e[2]
end
function be(e)
return e[3]
end
function J(e)
local e=h(e)
local function t(e)
e[2]=J(e[2])
e[3]=J(e[3])
return e
end
if u(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif k(e)then
return t(e)
end
return e
end
function ge()
return{re}
end
function i(e)
return e[1]==re
end
function S(e,t)
if e==t then
return
end
if e==v then
e=t
t=v
end
e[1]=Ze
e[2]=t
e[3]=false
e[4]=false
end
function we(e,a)
I(
i(e)
)
I(
not i(a)
)
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function lt(t)
local e=ge()
we(e,t)
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
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
p(t,e)
e=ut(e)
end
for a,t in ipairs(t)do
S(t,e)
end
return e
end
function ye(e)
return G(e)or B(e)or V(e)or K(e)
end
function w(e)
return Q(e)or ye(e)
end
function se(e)
return w(e)or k(e)
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
local e,s,n
function s(t)
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
function n(t)
s(t)
if w(t)then
p(a,e)
return d(t,i,{false,false},a)
end
return t
end
local h={}
e=o
local function o()
t[2]=true
return n(at)
end
local function r()
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
if G(e)then
return o()
elseif V(e)then
local a=pe(e)
local e=fe(e)
local s={Ue,Le,He,Se,Ne,Ge,Be,Je,Pe,Me,Ce}
local i=false
for t,e in ipairs(s)do
if c(e,a)then
i=true
break
end
end
if i then
I(#e==1)
I(t[2]==false)
local e=d(
e[1],
r(),
t
)
if t[2]then
return n(
x(a,{e})
)
else
return j()
end
end
if c(a,te)then
return o()
elseif c(a,Ae)then
return o()
elseif c(a,Oe)then
return o()
elseif c(a,ie)then
I(#e==3)
I(t[2]==false)
local a=d(
e[1],
r(),
t
)
if t[2]then
return n(
x(ie,{a,e[2],e[3]})
)
else
return j()
end
end
return j()
elseif B(e)then
return o()
elseif K(e)then
return o()
end
return j()
end
h[s]=true
p(a,e)
e=b(e)
end
return s(e)
end
function b(a)
local e=N(a)
local t
I(
not Q(e)
)
if G(e)then
t=ct(
ee(e),
ae(e),
a
)
elseif B(e)then
t=st(
ve(e),
ze(e),
_e(e),
a
)
elseif V(e)then
t=rt(
pe(e),
fe(e),
a
)
elseif K(e)then
t=dt(
qe(e),
be(e),
a
)
else
t=e
end
t=N(t)
S(e,t)
return t
end
function h(e)
return d(e)
end
function Fe(e)
while w(e)or k(e)do
e=h(
X(e)
)
end
return e
end
function je(e)
while k(e)do
e=C(e)
end
e=b(e)
while k(e)do
e=C(e)
end
return e
end
function l(e,h,l,d)
local t={}
local i={}
local e=N(e)
local s=true
while true do
if r(e)then
return d(i,t)
elseif k(e)then
p(
i,
ce(e)
)
e=C(e)
elseif a(e)then
p(
t,
o(e)
)
e=n(e)
elseif w(e)then
if s then
s=false
e=b(e)
else
return l()
end
else
return h()
end
end
end
function g(e)
if se(e)then
e=je(e)
end
if se(e)then
return nil
end
if y(e)then
return true
end
if not u(e)then
return false
end
local e=z(e)
if se(e)then
e=je(e)
end
if se(e)then
return nil
end
if not y(e)then
return false
end
return H(e,oe)
end
function Te(a,o,i)
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
function Qe(t,o,a)
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
return j()
end
function L(a)
local o=v
do
local t=0
while t<#a do
o=s(
e(a[(t+0)+1],a[(t+1)+1]),
o
)
t=t+2
end
end
return A(
Ie,
e(o)
)
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
function ct(s,t,d)
local i=b(t)
if w(i)then
return d
end
local function t()return D(
E,
e(
ne,
e(
Oe,
e(
L(s),
i
)
)
)
)end
if a(i)then
return l(
i,
t,
function()return d end,
function(i,e)
if#i~=0 then
error("WIP")
end
if c(e[1],de)then
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
return De(s,o,a)
elseif c(e[1],it)then
if#e==1 then
return t()
end
local i=h(
R(s,e[2])
)
if not u(i)then
return t()
end
local h=b(
z(i)
)
if w(h)then
return d
end
if not y(h)then
return t()
end
if not H(h,_)then
return t()
end
local i=b(
O(i)
)
if w(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=b(
n(i)
)
if w(a)then
return d
end
if not r(a)then
return t()
end
local a={
L(s)
}
do
local t=2
while t<#e do
p(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif c(e[1],ne)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
p(
a,
R(s,e[t+1])
)
t=t+1
end
end
return x(o,a)
else
local o=R(s,e[1])
local a={}
do
local t=1
while t<#e do
p(
a,
R(s,e[t+1])
)
t=t+1
end
end
return P(o,a)
end
end
)
elseif r(i)then
return i
elseif q(i)then
return t()
else
local e=g(i)
if e==nil then
return d
end
if e==true then
return Qe(
s,
i,
t()
)
end
return j()
end
return j()
end
function dt(i,l,c)
local function d()return D(
E,
e(
ne,
e(
Ae,
e(
i,
T(l)
)
)
)
)end
i=b(i)
if w(i)then
return c
end
if not u(i)then
return d()
end
local e=h(
z(i)
)
if not(y(e)and H(e,t))then
return d()
end
local t=h(
O(i)
)
if not a(t)then
return d()
end
local e=J(
o(t)
)
local t=h(
n(t)
)
if not(a(t)and r(
h(
n(t)
)
))then
return d()
end
local u=o(t)
local i=We
local t=0
while not r(e)do
local h=g(e)
if h==nil then
return c
end
if h==true then
local a=v
do
local e=#l-1
while e>=t do
a=s(l[e+1],a)
e=e-1
end
end
i=Te(i,e,a)
t=#l
e=v
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
i=Te(
i,
o(e),
a
)
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
return R(i,u)
end
function rt(i,t,o)
local function a()return D(
E,
e(
ne,
e(
i,
T(t)
)
)
)end
for n,e in ipairs(mt)do
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
return j()
end
end
return a()
end
function st(i,o,t,a)
local function a()return D(
E,
e(
de,
e(
L(i),
o,
T(t)
)
)
)end
if c(o,ke)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,nt)then
if#t~=2 then
return a()
end
return ht(i,t[1],t[2],a)
elseif c(o,ot)then
if#t~=2 then
return a()
end
return le(
t[1],
R(i,t[2])
)
end
return a()
end
function me(t)
return e(de,ke,t)
end
function ht(u,d,f,m)
d=Xe(d)
local h={}
local l=false
local i=d
while not r(i)do
local e=g(i)
I(e~=nil)
if e then
p(h,i)
l=true
i=v
elseif a(i)then
p(
h,
o(i)
)
i=n(i)
else
return m()
end
end
local o
if l then
o=T(h)
else
o=d
end
local a={}
Ve(
u,
function(t,e)
do
local e=0
while e<#h do
if c(h[e+1],t)then
return
end
e=e+1
end
end
p(a,t)
end
)
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
o=s(
me(
tt(u,a[e+1])
),
o
)
e=e-1
end
end
return A(
t,
e(
d,
s(
me(
A(
t,
e(i,f)
)
),
o
)
)
)
end
function f(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function i(e,t,a,o)
local a=f(
a(e),
a(t)
)
local o=f(
o(e),
o(t)
)
if a==true and o==true then
S(e,t)
return true
elseif a~=false and o~=false then
return nil
else
return false
end
end
if k(t)then
local t=X(t)
local e=f(t,e)
if e==true then
e=nil
end
return e
elseif k(e)then
local e=X(e)
local e=f(t,e)
if e==true then
e=nil
end
return e
elseif r(t)then
if not r(e)then
return false
end
S(t,e)
return true
elseif y(t)then
if not y(e)then
return false
end
return H(t,e)
elseif a(t)then
if not a(e)then
return false
end
return i(t,e,o,n)
elseif q(t)then
if not q(e)then
return false
end
return i(t,e,M,F)
elseif u(t)then
if not u(e)then
return false
end
return i(t,e,z,O)
end
return j()
end
function c(e,t)
return f(e,t)~=false
end
function m(e)
e=N(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(
m(
o(e)
)
)
i=" "
e=N(
n(e)
)
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
m(e)
)..")"
end
return t
elseif u(e)then
return"#"..tostring(
m(
s(
z(e),
O(e)
)
)
)
elseif q(e)then
return"!"..tostring(
m(
s(
M(e),
F(e)
)
)
)
elseif y(e)then
return Y(e)
elseif k(e)then
return";("..tostring(
m(
ce(e)
)
).." "..tostring(
m(
C(e)
)
)..")"
elseif G(e)then
return"$("..tostring(
m(
L(
ee(e)
)
)
).." "..tostring(
m(
ae(e)
)
)..")"
elseif V(e)then
return"%("..tostring(
m(
pe(e)
)
).." "..tostring(
m(
T(
fe(e)
)
)
)..")"
elseif B(e)then
return"@("..tostring(
m(
L(
ve(e)
)
)
).." "..tostring(
m(
ze(e)
)
).." "..tostring(
m(
T(
_e(e)
)
)
)..")"
elseif K(e)then
return"^("..tostring(
m(
qe(e)
)
).." "..tostring(
m(
T(
be(e)
)
)
)..")"
end
return j()
end
Z=0
W=1
he=2
U=3
Ee=4
Ze=5
et=6
Ye=7
Ke=8
ue=9
xe=11
re=10
local function i(e)
return{Z,e}
end
v={he}
local function Ee(e)
local t=Fe(e)
local function o(e)
e[2]=J(e[2])
e[3]=J(e[3])
if k(e[2])or k(e[3])then
local t=lt(e)
local a=e[2]
local o=e[3]
local e=Ee(a)
local a=Ee(o)
t[2]=e
t[3]=a
return t
else
return e
end
end
if u(t)then
return o(t)
elseif q(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
Xe=Ee
E=i("太始初核")
oe=i("符名")
t=i("化滅")
_=i("式形")
local rt=i("等同")
local dt=i("解算")
local W=i("特定其物")
local f=i("省略一物")
Ie=i("映表")
local lt=i("如若")
local l=i("一類何物")
local Z=i("是非")
local xe=i("其子")
local ht=i("爻陽")
local Ze=i("爻陰")
local bt=i("引用")
local yt=i("應用")
local vt=i("間空")
local ue=i("連頸")
local he=i("構物")
local re=i("謬誤")
local gt=i("詞素")
local Ye=i("列序")
local pt=i("首始")
local wt=i("尾末")
local et=i("之物")
local d=i("宇宙亡矣")
local tt=i("效應")
local st=i("註疏")
at=D(
E,
e(d,f)
)
local function g(e)
return A(
oe,
s(
E,
s(e,v)
)
)
end
local function Ke(a)
return g(
e(
l,
e(t,f,a),
W
)
)
end
local function d(a,o)
return g(
e(
l,
e(
t,
e(a),
f
),
o
)
)
end
local function U(a)
return g(
e(
l,
t,
e(
Z,
e(l,a,f)
)
)
)
end
local ct=Ke(he)
Ue=d(he,oe)
Le=d(he,Ye)
He=U(he)
local ut=Ke(re)
Se=d(re,oe)
Ne=d(re,Ye)
Ge=U(re)
local ft=Ke(ue)
Be=U(ue)
Je=d(ue,pt)
Pe=d(ue,wt)
Me=U(gt)
Ce=U(vt)
te=g(
e(
l,
t,
e(Z,rt)
)
)
Ae=g(
e(
l,
e(
t,
s(t,f),
f
),
yt
)
)
Oe=g(
e(l,t,dt)
)
local Ke=d(
Ye,
e(l,et,f)
)
ie=g(
e(l,t,lt)
)
ke=g(
e(l,_,bt)
)
nt=g(
e(
l,
e(
_,
e(t,f,t)
),
W
)
)
ne=g(
e(
_,
e(E,t)
)
)
de=g(
e(
_,
e(E,_)
)
)
it=g(
e(_,_)
)
local it=g(
e(l,t,st)
)
ot=g(
e(l,_,st)
)
local d=A(
Ze,
e()
)
local re=A(
ht,
e()
)
local function ke(e,i,s)
local t={}
while a(e)do
p(
t,
o(e)
)
e=n(e)
end
if r(e)then
return i(t)
end
return s(t,e)
end
local function U(e)
return ke(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function at(e)
while Q(e)or k(e)do
e=N(
X(e)
)
end
return e
end
local function Ye(e)
if G(e)then
return e
elseif B(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif K(e)then
error("WIP")
end
return j()
end
local function ot(e)
return ee(
Ye(e)
)
end
local function st(e)
return ae(
Ye(e)
)
end
local function nt(e)
if k(e)then
return C(e)
else
return b(e)
end
end
local ne={nil}
local function ne(e,e)
error("WIP")
end
local function he(a)
local t={}
local e={}
for o,a in ipairs(a)do
local t=ne(a,t)
p(e,t)
end
return{e,t}
end
local function ne(e,e,e)
error("WIP")
end
We={}
local function de(t)
t=h(t)
if not u(t)then
return false
end
local e=h(
z(t)
)
if not y(e)then
return false
end
if not H(e,Ie)then
return false
end
e=h(
O(t)
)
if not a(e)then
return false
end
if not r(
h(
n(e)
)
)then
return false
end
local t={}
local i=h(
o(e)
)
while not r(i)do
if not a(i)then
return false
end
local e=h(
o(i)
)
i=h(
n(i)
)
if not a(e)then
return false
end
local i=o(e)
e=h(
n(e)
)
if not a(e)then
return false
end
local a=o(e)
if not r(
h(
n(e)
)
)then
return false
end
local o=true
do
local e=0
while e<#t do
if c(t[(e+0)+1],i)then
t[(e+1)+1]=a
o=false
break
end
e=e+2
end
end
if o then
p(t,i)
p(t,a)
end
end
return t
end
local function he(t,a)
return{
t,
1,
function(e)
e=b(e)
if w(e)then
return x(t,{e})
end
if a(e)then
return re
end
return d
end
}
end
local function ne(t,i,a)
return{
t,
1,
function(e,o)
e=b(e)
if w(e)then
return x(t,{e})
end
if i(e)then
return a(e)
end
return o()
end
}
end
mt={
he(He,u),
{ct,2,A},
ne(Ue,u,z),
ne(Le,u,O),
he(Ge,q),
{ut,2,D},
ne(Se,q,M),
ne(Ne,q,F),
he(Ce,r),
{ft,2,s},
he(Be,a),
ne(Je,a,o),
ne(Pe,a,n),
{
te,
2,
function(e,t,i)
if e==t then
return re
end
e=b(e)
t=b(t)
if w(e)or w(t)then
return x(te,{e,t})
end
if e==t then
return re
end
local function i(a,t,e)
return x(ie,{a,t,e})
end
local function s(t,e)
return i(t,e,d)
end
I(
not w(e)
)
local function i(a,t,e,o)
return s(
x(
te,
{
e(a),
e(t)
}
),
x(
te,
{
o(a),
o(t)
}
)
)
end
if r(e)then
if not r(e)then
return d
end
return re
elseif y(e)then
if not y(t)then
return d
end
if H(e,t)then
return re
else
return d
end
elseif u(e)then
if not u(t)then
return d
end
return i(e,t,z,O)
elseif a(e)then
if not a(t)then
return d
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return d
end
return i(e,t,M,F)
end
return j()
end
},
{
Ae,
2,
function(i,e,s)
local t={}
local e=h(e)
while a(e)do
p(
t,
o(e)
)
e=h(
n(e)
)
end
if not r(e)then
return s()
end
return P(i,t)
end
},
{
Oe,
2,
function(e,a,t)
local e=de(e)
if e==false then
return t()
end
return R(e,a)
end
},
he(Me,y),
{
Ke,
1,
function(e,t)
e=b(e)
if w(e)then
return x(Ke,{e})
end
if not a(e)then
return t()
end
return o(e)
end
},
{
ie,
3,
function(e,o,a,t)
e=b(e)
if w(e)then
return x(ie,{e,o,a})
end
if not u(e)then
return t()
end
local e=h(
z(e)
)
if not y(e)then
return t()
end
if H(e,ht)then
return o
end
if H(e,Ze)then
return a
end
return t()
end
},
{it,2,le}
}
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
if d(
a(t),
a(e)
)and d(
o(t),
o(e)
)then
S(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
S(e,v)
S(t,v)
return true
elseif y(e)then
if not y(t)then
return false
end
return H(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,M,F)
elseif u(e)then
if not u(t)then
return false
end
return i(e,t,z,O)
elseif ye(e)then
return false
end
return j()
end
local function te(J)
local V,w,u,d,c,h,z,q,G,b,U,L,H,O,N,S,C,Y,F,j,M,k,m,K,B,Q
function u()
return#V==w
end
function d()
I(
not u()
)
local e=string.sub(V,w+1,w+1)
w=w+1
return e
end
function c(e)
I(
string.sub(V,w,w)==e
)
w=w-1
end
function h(e)
if e==nil then
e=""
end
error(
"TheLanguage parse ERROR!"..tostring(e)
)
end
function z(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function q()
if u()then
return false
end
local e=d()
if not z(e)then
c(e)
return false
end
while z(e)and not u()do
e=d()
end
if not z(e)then
c(e)
end
return true
end
function G()
if u()then
return false
end
local e=d()
local t=""
if not Y(e)then
c(e)
return false
end
while Y(e)and not u()do
t=tostring(t)..tostring(e)
e=d()
end
if Y(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
return i(t)
end
function b()
if u()then
return false
end
local e=d()
if e~="("then
c(e)
return false
end
local t=ge()
local a=t
local function i(a)
local e=ge()
we(
t,
s(a,e)
)
t=e
end
while true do
q()
if u()then
return h()
end
e=d()
if e==")"then
we(t,v)
return a
end
if e=="."then
q()
local o=F()
we(t,o)
q()
if u()then
return h()
end
e=d()
if e~=")"then
return h()
end
return a
end
c(e)
local e=F()
i(e)
end
end
function U()
if u()then
return false
end
local e=d()
if e~="#"then
c(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
return A(
o(e),
n(e)
)
end
function L()
if u()then
return false
end
local e=d()
if e~="!"then
c(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
return D(
o(e),
n(e)
)
end
function Y(e)
if z(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function F()
q()
local e={b,Q,U,L,H,O,N,S,C}
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function j(e)
if e==false then
return h()
end
return e
end
function M()
return not u()
end
function k(e)
j(
M()
)
j(
d()==e
)
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
e={b,G,a,U,L,H,O,N,S,C}
else
e={b,B,U,L,H,O,N,S,C}
end
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return h()
end
function K(a)
if u()then
return a
end
local o=d()
if o=="."then
local o=m()
return e(
l,
e(
t,
e(a),
f
),
o
)
elseif o==":"then
local t=m()
return e(l,t,a)
elseif o=="~"then
return e(Z,a)
elseif o=="@"then
local o=m()
return e(
l,
e(
t,
s(a,f),
f
),
o
)
elseif o=="?"then
return e(
l,
t,
e(Z,a)
)
elseif o=="/"then
local t={a}
while true do
local e=m(true)
p(t,e)
if u()then
break
end
local e=d()
if e~="/"then
c(e)
break
end
end
return e(
xe,
T(t)
)
else
c(o)
return a
end
end
function B()
if u()then
return false
end
local a=d()
if a=="&"then
j(
M()
)
local t=d()
if t=="+"then
local t=m()
return e(
_,
e(E,t)
)
else
c(t)
end
local t=m()
return e(_,t)
elseif a==":"then
j(
M()
)
local a=d()
if a=="&"then
k(">")
local a=m()
return e(
l,
e(
_,
e(t,f,a)
),
W
)
elseif a==">"then
local a=m()
return e(
l,
e(t,f,a),
W
)
else
c(a)
end
local t=m()
return e(l,t,W)
elseif a=="+"then
local t=m()
return e(E,t)
elseif a=="["then
local e=m()
k("]")
return K(e)
elseif a=="_"then
k(":")
local t=m()
return e(l,t,f)
else
c(a)
local e=G()
if e==false then
return false
end
return K(e)
end
end
function Q()
local e=B()
if e==false then
return false
end
if y(e)then
return e
end
return g(e)
end
V=J
w=0
local function t(t,i)
return function()
if u()then
return false
end
local e=d()
if e~=t then
c(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
local t=n(e)
if not(a(t)and r(
n(t)
))then
return h()
end
return i(
o(e),
o(t)
)
end
end
local function l(t,s)
return function()
if u()then
return false
end
local e=d()
if e~=t then
c(e)
return false
end
local e=b()
if e==false then
return h()
end
if not a(e)then
return h()
end
local i=n(e)
if not a(i)then
return h()
end
local t=n(i)
if not(a(t)and r(
n(t)
))then
return h()
end
return s(
o(e),
o(i),
o(t)
)
end
end
H=t(
"$",
function(e,t)
local e=de(e)
if e==false then
return h()
end
return R(e,t)
end
)
O=t(
"%",
function(t,e)
local e=ke(
e,
function(e)return e end,
function(e,e)return h()end
)
return x(t,e)
end
)
N=l(
"@",
function(e,a,t)
local t=ke(
t,
function(e)return e end,
function(e,e)return h()end
)
local e=de(e)
if e==false then
return h()
end
return De(e,a,t)
end
)
S=t(
"^",
function(t,e)
local e=ke(
e,
function(e)return e end,
function(e,e)return h()end
)
return P(t,e)
end
)
C=t(
";",
function(e,t)return le(e,t)end
)
return F()
end
local function x(c)
local function i(r,u)
if y(r)then
return Y(r)
end
local function h(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=U(r)
if e~=false and#e==3 and d(e[1],l)then
local s=U(e[2])
if s~=false and#s==3 and d(s[1],t)then
local t=s[2]
local r=U(t)
if r~=false and#r==1 and d(s[3],f)then
return h(
tostring(
i(r[1],true)
).."."..tostring(
i(e[3],true)
)
)
elseif a(t)and d(
n(t),
f
)and d(s[3],f)then
return h(
tostring(
i(
o(t),
true
)
).."@"..tostring(
i(e[3],true)
)
)
elseif d(t,f)and d(e[3],W)then
return h(
":>"..tostring(
i(s[3],true)
)
)
end
end
local a=U(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],Z)then
return h(
tostring(
i(a[2],true)
).."?"
)
end
if s~=false and#s==2 and d(e[3],W)and d(s[1],_)then
local e=U(s[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],f)then
return h(
":&>"..tostring(
i(e[3],true)
)
)
end
end
local t
if d(e[3],f)then
t="_"
elseif d(e[3],W)then
t=""
else
t=i(e[3],true)
end
return h(
tostring(t)..":"..tostring(
i(e[2],true)
)
)
elseif e~=false and#e==2 then
if d(e[1],_)then
local t=U(e[2])
if t~=false and#t==2 and d(t[1],E)then
return h(
"&+"..tostring(
i(t[2],true)
)
)
end
return h(
"&"..tostring(
i(e[2],true)
)
)
elseif d(e[1],Z)then
return h(
tostring(
i(e[2],true)
).."~"
)
elseif d(e[1],E)then
return h(
"+"..tostring(
i(e[2],true)
)
)
elseif d(e[1],xe)then
local e=U(e[2])
if e~=false and#e>1 then
local a=i(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(
i(e[t+1],true)
)
t=t+1
end
end
return h(a)
end
end
end
if u then
return m(r)
else
return m(
g(r)
)
end
end
local e=te(
m(c)
)
local t=""
local h=""
if r(e)then
return"()"
elseif a(e)then
t="("
h=""
while a(e)do
t=tostring(t)..tostring(h)..tostring(
x(
o(e)
)
)
h=" "
e=n(e)
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
x(e)
)..")"
end
return t
elseif u(e)then
local a=z(e)
local t=O(e)
local e=U(t)
if e~=false and#e==2 and d(a,oe)and d(e[1],E)then
return i(e[2],false)
end
return"#"..tostring(
x(
s(a,t)
)
)
elseif q(e)then
return"!"..tostring(
x(
s(
M(e),
F(e)
)
)
)
elseif y(e)then
return Y(e)
elseif k(e)then
return";("..tostring(
x(
ce(e)
)
).." "..tostring(
x(
C(e)
)
)..")"
elseif G(e)then
return"$("..tostring(
x(
L(
ee(e)
)
)
).." "..tostring(
x(
ae(e)
)
)..")"
elseif V(e)then
return"%("..tostring(
x(
pe(e)
)
).." "..tostring(
x(
T(
fe(e)
)
)
)..")"
elseif B(e)then
return"@("..tostring(
x(
L(
ve(e)
)
)
).." "..tostring(
x(
ze(e)
)
).." "..tostring(
x(
T(
_e(e)
)
)
)..")"
elseif K(e)then
return"^("..tostring(
x(
qe(e)
)
).." "..tostring(
x(
T(
be(e)
)
)
)..")"
end
return j()
end
local function W(o)
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
error(
"MT parse ERROR "..tostring(e)
)
end
local function h(e)
if not e then
return a()
end
end
local function r()
h(
t()
)
e=e-1
return string.sub(o,e+1,e+1)
end
local e={}
local function o(i)
local t=table.remove(e)
local o=table.remove(e)
if o==nil or t==nil then
return a()
else
return Re(
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
Re(
e,
i(t)
)
elseif t=="."then
o(s)
elseif t=="#"then
o(A)
elseif t=="!"then
o(D)
elseif t=="$"then
o(
function(e,t)
local e=de(e)
if e==false then
return a()
else
return R(e,t)
end
end
)
elseif t=="_"then
Re(e,v)
else
return a()
end
end
h(
n()
)
h(#e==1)
return e[1]
end
local function I(e)
local s={e}
local t=""
while#s~=0 do
local h={}
for i,e in ipairs(s)do
e=N(e)
local function i(e,i,o,a)
t=tostring(t)..tostring(i)
return p(
h,
o(e),
a(e)
)
end
if y(e)then
t=tostring(t)..tostring(
("^"..tostring(
Y(e)
).."^")
)
elseif a(e)then
i(e,".",o,n)
elseif r(e)then
t=tostring(t)..tostring(("_"))
elseif u(e)then
i(e,"#",z,O)
elseif q(e)then
i(e,"!",M,F)
elseif ye(e)then
local e=Ye(e)
i(
e,
"$",
(function(e)return L(
ee(e)
)end),
ae
)
else
return j()
end
end
s=h
end
return t
end
local function E(e)
return function()return{false,e}end
end
local function d(e)
return function()return{
true,
e()
}end
end
local function j(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local _=g(
s(
xe,
s(
s(
tt,
s(
s(
l,
s(
et,
s(f,v)
)
),
v
)
),
v
)
)
)
local g=g(
s(
xe,
s(
s(
tt,
s(ue,v)
),
v
)
)
)
local function S(t,a)
return A(
g,
e(t,a)
)
end
local function V(e)
return A(_,e)
end
local function p(y,w,m,f,l)
if l==nil then
l=false
end
local function v(e,e)
error("WIP")
end
m=h(m)
if u(m)then
local u=z(m)
local s=O(m)
if c(u,_)then
s=h(s)
if a(s)then
local t=o(s)
local e=h(
n(s)
)
if r(e)then
if l==false then
local e=t
local t=f
local function a()return y(e,t)end
return d(a)
else
local a
a=y
local e
e=w
local i=t
local o=f
local function t()return p(
a,
e,
P(l,i),
o
)end
return d(t)
end
end
end
elseif c(u,g)then
s=h(s)
if a(s)then
local u=o(s)
local s=h(
n(s)
)
if a(s)then
local a=o(s)
local o=h(
n(s)
)
if r(o)then
if l==false then
local e
e=y
local t
t=w
local o=u
local n=a
local a=f
local function i()return p(e,t,o,a,n)end
return d(i)
else
local o
o=y
local n
n=w
local u=u
local s=a
local h=f
local r=l
local a=i("序甲")
local function i()return p(
o,
n,
u,
h,
A(
t,
e(
e(a),
v(
e(
me(s),
a
),
me(r)
)
)
)
)end
return d(i)
end
end
end
end
end
end
if l==false then
return d(
function()return w(m,f,y)end
)
else
return d(
function()return w(
m,
f,
function(t,e)return d(
function()return p(
y,
w,
P(l,{t}),
e
)end
)end
)end
)
end
end
local function f(o,a,e,t)
return p(o,a,e,t)
end
local function l(e,o,t,a)
return j(
p(
(function(a,t)return E(
e(a,t)
)end),
(function(a,t,e)return E(
o(
a,
t,
function(t,a)return j(
e(t,a)
)end
)
)end),
t,
a
)
)
end
local t={}
t.new_comment=le
t.comment_p=k
t.comment_comment=ce
t.comment_x=C
t.un_comment_all=X
t.new_atom=i
t.atom_p=y
t.un_atom=Y
t.atom_equal_p=H
t.new_construction=s
t.construction_p=a
t.construction_head=o
t.construction_tail=n
t.null_v=v
t.null_p=r
t.new_data=A
t.data_p=u
t.data_name=z
t.data_list=O
t.new_error=D
t.error_p=q
t.error_name=M
t.error_list=F
t.just_p=Q
t.evaluate=R
t.apply=P
t.force_all_rec=J
t.force_uncomment_all_rec=Ee
t.unlazy_all_rec=Xe
t.jsArray_to_list=T
t.maybe_list_to_jsArray=U
t.new_list=e
t.un_just_all=N
t.un_just_comment_all=at
t.delay_p=ye
t.delay_just_p=w
t.lazy_p=se
t.delay_env=ot
t.delay_x=st
t.force_all=h
t.force1=b
t.force_uncomment1=nt
t.force_uncomment_all=Fe
t.unlazy1=je
t.env_null_v=We
t.env_set=Te
t.env_get=Qe
t.env2val=L
t.env_foreach=Ve
t.val2env=de
t.equal_p=c
t.simple_print=m
t.complex_parse=te
t.complex_print=x
t.machinetext_parse=W
t.machinetext_print=I
t.trampoline_return=E
t.trampoline_delay=d
t.run_trampoline=j
t.return_effect_systemName=_
t.bind_effect_systemName=g
t.new_effect_bind=S
t.new_effect_return=V
t.run_monad_trampoline=f
t.run_monad_stackoverflow=l
return t
