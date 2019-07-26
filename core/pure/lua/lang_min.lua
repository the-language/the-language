local function p(e,...)
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
local k,I,F,de,re,W,Z,le,Ke,Ee,et,Ze,ke,be,ye,j,ue,M,ie,y,Y,S,s,a,o,n,v,r,A,u,z,O,L,q,U,C,J,dt,R,V,X,oe,Ve,G,Te,ge,ve,x,B,pe,me,P,Q,qe,ze,K,Le,Oe,i,N,we,ot,E,ae,t,_,We,it,Se,Ge,Je,Qe,Ye,He,Re,Fe,Me,Be,Ne,te,Ae,xe,se,Ce,nt,ee,he,tt,at,T,e,H,fe,w,ne,d,g,h,De,_e,l,b,Xe,je,Ue,lt,D,Pe,ut,ct,mt,ht,st,ce,rt,m,f,c
function k()
error("TheLanguage PANIC")
end
function I(e)
if not e then
return k()
end
end
function ye(e,t)
return{ke,e,t}
end
function j(e)
return e[1]==ke
end
function ue(e)
return e[2]
end
function M(e)
return e[3]
end
function ie(e)
while j(e)do
e=M(e)
end
return e
end
function y(e)
return e[1]==F
end
function Y(e)
return e[2]
end
function S(t,e)
if t==e then
return true
end
if Y(t)==Y(e)then
N(t,e)
return true
else
return false
end
end
function s(t,e)
return{de,t,e}
end
function a(e)
return e[1]==de
end
function o(e)
return e[2]
end
function n(e)
return e[3]
end
function r(e)
return e[1]==re
end
function A(t,e)
return{W,t,e}
end
function u(e)
return e[1]==W
end
function z(e)
return e[2]
end
function O(e)
return e[3]
end
function L(e,t)
return{Z,e,t}
end
function q(e)
return e[1]==Z
end
function U(e)
return e[2]
end
function C(e)
return e[3]
end
function J(e)
return e[1]==le
end
function dt(e)
return e[2]
end
function R(t,e)
return{Ke,t,e}
end
function V(e)
return e[1]==Ke
end
function X(e)
return e[2]
end
function oe(e)
return e[3]
end
function Ve(e,t,a)
return{et,e,t,a}
end
function G(e)
return e[1]==et
end
function Te(e)
return e[2]
end
function ge(e)
return e[3]
end
function ve(e)
return e[4]
end
function x(t,e)
return{Ee,t,e}
end
function B(e)
return e[1]==Ee
end
function pe(e)
return e[2]
end
function me(e)
return e[3]
end
function P(e,t)
return{Ze,e,t}
end
function Q(e)
return e[1]==Ze
end
function qe(e)
return e[2]
end
function ze(e)
return e[3]
end
function K(e)
local e=h(e)
local function t(e)
e[2]=K(e[2])
e[3]=K(e[3])
return e
end
if u(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif j(e)then
return t(e)
end
return e
end
function Oe()
return{be}
end
function i(e)
return e[1]==be
end
function N(e,t)
if e==t then
return
end
if e==v then
e=t
t=v
end
e[1]=le
e[2]=t
e[3]=false
e[4]=false
end
function we(e,t)
I(
i(e)
)
I(
not i(t)
)
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function ot(t)
local e=Oe()
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
function H(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
p(t,e)
e=dt(e)
end
for a,t in ipairs(t)do
N(t,e)
end
return e
end
function fe(e)
return V(e)or G(e)or B(e)or Q(e)
end
function w(e)
return J(e)or fe(e)
end
function ne(e)
return w(e)or j(e)
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
h(t)
if w(t)then
p(a,e)
return d(t,i,{false,false},a)
end
return t
end
local r={}
e=o
local function o()
t[2]=true
return n(it)
end
local function l()
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
p(a,e)
e=g(e)
t=t+1
end
end
while w(e)do
local s=c(e)
if i[s]==true then
return o()
end
if r[s]==true then
t[1]=true
if V(e)then
return o()
elseif B(e)then
local a=pe(e)
local e=me(e)
local s={Se,Ge,Je,Qe,Ye,He,Re,Fe,Me,Be,Ne}
local i=false
for t,e in ipairs(s)do
if f(e,a)then
i=true
break
end
end
if i then
I(#e==1)
I(t[2]==false)
local e=d(
e[1],
l(),
t
)
if t[2]then
return n(
x(a,{e})
)
else
return k()
end
end
if f(a,te)then
return o()
elseif f(a,Ae)then
return o()
elseif f(a,xe)then
return o()
elseif f(a,se)then
I(#e==3)
I(t[2]==false)
local a=d(
e[1],
l(),
t
)
if t[2]then
return n(
x(se,{a,e[2],e[3]})
)
else
return k()
end
end
return k()
elseif G(e)then
return o()
elseif Q(e)then
return o()
end
return k()
end
r[s]=true
p(a,e)
e=g(e)
end
return h(e)
end
function g(a)
local e=H(a)
local t
I(
not J(e)
)
if V(e)then
t=ut(
X(e),
oe(e),
a
)
elseif G(e)then
t=st(
Te(e),
ge(e),
ve(e),
a
)
elseif B(e)then
t=ht(
pe(e),
me(e),
a
)
elseif Q(e)then
t=mt(
qe(e),
ze(e),
a
)
else
t=e
end
t=H(t)
N(e,t)
return t
end
function h(e)
return d(e)
end
function De(e)
while w(e)or j(e)do
e=h(
ie(e)
)
end
return e
end
function _e(e)
while j(e)do
e=M(e)
end
e=g(e)
while j(e)do
e=M(e)
end
return e
end
function l(e,d,l,h)
local i={}
local s={}
local e=H(e)
local t=true
while true do
if r(e)then
return h(s,i)
elseif j(e)then
p(
s,
ue(e)
)
e=M(e)
elseif a(e)then
p(
i,
o(e)
)
e=n(e)
elseif w(e)then
if t then
t=false
e=g(e)
else
return l()
end
else
return d()
end
end
end
function b(e)
if ne(e)then
e=_e(e)
end
if ne(e)then
return nil
end
if y(e)then
return true
end
if not u(e)then
return false
end
local e=z(e)
if ne(e)then
e=_e(e)
end
if ne(e)then
return nil
end
if not y(e)then
return false
end
return S(e,ae)
end
function je(a,o,i)
local t={}
do
local e=0
while e<#a do
if f(a[(e+0)+1],o)then
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
function Ue(t,a,o)
do
local e=0
while e<#t do
if f(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function lt(t,a)
do
local e=0
while e<#t do
if f(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function D(o)
local a=v
do
local t=0
while t<#o do
a=s(
e(o[(t+0)+1],o[(t+1)+1]),
a
)
t=t+2
end
end
return A(
We,
e(a)
)
end
function Pe(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function ut(s,t,d)
local i=g(t)
if w(i)then
return d
end
local function t()return L(
E,
e(
ee,
e(
xe,
e(
D(s),
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
if f(e[1],he)then
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
return Ve(s,o,a)
elseif f(e[1],tt)then
if#e==1 then
return t()
end
local h=h(
R(s,e[2])
)
if not u(h)then
return t()
end
local i=g(
z(h)
)
if w(i)then
return d
end
if not y(i)then
return t()
end
if not S(i,_)then
return t()
end
local i=g(
O(h)
)
if w(i)then
return d
end
if not a(i)then
return t()
end
local o=o(i)
local a=g(
n(i)
)
if w(a)then
return d
end
if not r(a)then
return t()
end
local a={
D(s)
}
do
local t=2
while t<#e do
p(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif f(e[1],ee)then
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
local e=b(i)
if e==nil then
return d
end
if e==true then
return Ue(
s,
i,
t()
)
end
return k()
end
return k()
end
function mt(i,l,c)
local function d()return L(
E,
e(
ee,
e(
Ae,
e(
i,
T(l)
)
)
)
)end
i=g(i)
if w(i)then
return c
end
if not u(i)then
return d()
end
local e=h(
z(i)
)
if not(y(e)and S(e,t))then
return d()
end
local t=h(
O(i)
)
if not a(t)then
return d()
end
local e=K(
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
local i=Xe
local t=0
while not r(e)do
local h=b(e)
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
i=je(i,e,a)
t=#l
e=v
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
i=je(
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
function ht(i,t,o)
local function a()return L(
E,
e(
ee,
e(
i,
T(t)
)
)
)end
for n,e in ipairs(ct)do
if f(i,e[1])then
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
return k()
end
end
return a()
end
function st(i,o,t,a)
local function a()return L(
E,
e(
he,
e(
D(i),
o,
T(t)
)
)
)end
if f(o,Ce)then
if#t~=1 then
return a()
end
return t[1]
elseif f(o,nt)then
if#t~=2 then
return a()
end
return rt(i,t[1],t[2],a)
elseif f(o,at)then
if#t~=2 then
return a()
end
return ye(
t[1],
R(i,t[2])
)
end
return a()
end
function ce(t)
return e(he,Ce,t)
end
function rt(u,d,c,m)
d=Le(d)
local h={}
local l=false
local i=d
while not r(i)do
local e=b(i)
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
Pe(
u,
function(t,e)
do
local e=0
while e<#h do
if f(h[e+1],t)then
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
ce(
lt(u,a[e+1])
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
ce(
A(
t,
e(i,c)
)
),
o
)
)
)
end
function m(t,e)
if t==e then
return true
end
t=h(t)
e=h(e)
if t==e then
return true
end
local function i(e,t,a,o)
local a=m(
a(e),
a(t)
)
local o=m(
o(e),
o(t)
)
if a==true and o==true then
N(e,t)
return true
elseif a~=false and o~=false then
return nil
else
return false
end
end
if j(t)then
local t=ie(t)
local e=m(t,e)
if e==true then
e=nil
end
return e
elseif j(e)then
local e=ie(e)
local e=m(t,e)
if e==true then
e=nil
end
return e
elseif r(t)then
if not r(e)then
return false
end
N(t,e)
return true
elseif y(t)then
if not y(e)then
return false
end
return S(t,e)
elseif a(t)then
if not a(e)then
return false
end
return i(t,e,o,n)
elseif q(t)then
if not q(e)then
return false
end
return i(t,e,U,C)
elseif u(t)then
if not u(e)then
return false
end
return i(t,e,z,O)
end
return k()
end
function f(t,e)
return m(t,e)~=false
end
function c(e)
e=H(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(
c(
o(e)
)
)
i=" "
e=H(
n(e)
)
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
c(e)
)..")"
end
return t
elseif u(e)then
return"#"..tostring(
c(
s(
z(e),
O(e)
)
)
)
elseif q(e)then
return"!"..tostring(
c(
s(
U(e),
C(e)
)
)
)
elseif y(e)then
return Y(e)
elseif j(e)then
return";("..tostring(
c(
ue(e)
)
).." "..tostring(
c(
M(e)
)
)..")"
elseif V(e)then
return"$("..tostring(
c(
D(
X(e)
)
)
).." "..tostring(
c(
oe(e)
)
)..")"
elseif B(e)then
return"%("..tostring(
c(
pe(e)
)
).." "..tostring(
c(
T(
me(e)
)
)
)..")"
elseif G(e)then
return"@("..tostring(
c(
D(
Te(e)
)
)
).." "..tostring(
c(
ge(e)
)
).." "..tostring(
c(
T(
ve(e)
)
)
)..")"
elseif Q(e)then
return"^("..tostring(
c(
qe(e)
)
).." "..tostring(
c(
T(
ze(e)
)
)
)..")"
end
return k()
end
F=0
de=1
re=2
W=3
Z=4
le=5
Ke=6
Ee=7
et=8
Ze=9
ke=11
be=10
local function i(e)
return{F,e}
end
v={re}
local function Ee(e)
local t=De(e)
local function o(e)
e[2]=K(e[2])
e[3]=K(e[3])
if j(e[2])or j(e[3])then
local t=ot(e)
local a=e[2]
local e=e[3]
local a=Ee(a)
local e=Ee(e)
t[2]=a
t[3]=e
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
Le=Ee
E=i("太始初核")
ae=i("符名")
t=i("化滅")
_=i("式形")
local bt=i("等同")
local pt=i("解算")
local W=i("特定其物")
local m=i("省略一物")
We=i("映表")
local vt=i("如若")
local l=i("一類何物")
local Z=i("是非")
local be=i("其子")
local ht=i("爻陽")
local st=i("爻陰")
local rt=i("引用")
local ft=i("應用")
local dt=i("間空")
local le=i("連頸")
local re=i("構物")
local de=i("謬誤")
local ut=i("詞素")
local ke=i("列序")
local lt=i("首始")
local mt=i("尾末")
local ot=i("之物")
local d=i("宇宙亡矣")
local et=i("效應")
local Ze=i("註疏")
it=L(
E,
e(d,m)
)
local function b(e)
return A(
ae,
s(
E,
s(e,v)
)
)
end
local function Ke(a)
return b(
e(
l,
e(t,m,a),
W
)
)
end
local function d(o,a)
return b(
e(
l,
e(
t,
e(o),
m
),
a
)
)
end
local function F(a)
return b(
e(
l,
t,
e(
Z,
e(l,a,m)
)
)
)
end
local it=Ke(re)
Se=d(re,ae)
Ge=d(re,ke)
Je=F(re)
local yt=Ke(de)
Qe=d(de,ae)
Ye=d(de,ke)
He=F(de)
local wt=Ke(le)
Re=F(le)
Fe=d(le,lt)
Me=d(le,mt)
Be=F(ut)
Ne=F(dt)
te=b(
e(
l,
t,
e(Z,bt)
)
)
Ae=b(
e(
l,
e(
t,
s(t,m),
m
),
ft
)
)
xe=b(
e(l,t,pt)
)
local Ke=d(
ke,
e(l,ot,m)
)
se=b(
e(l,t,vt)
)
Ce=b(
e(l,_,rt)
)
nt=b(
e(
l,
e(
_,
e(t,m,t)
),
W
)
)
ee=b(
e(
_,
e(E,t)
)
)
he=b(
e(
_,
e(E,_)
)
)
tt=b(
e(_,_)
)
local nt=b(
e(l,t,Ze)
)
at=b(
e(l,_,Ze)
)
local d=A(
st,
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
local function F(e)
return ke(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function at(e)
while J(e)or j(e)do
e=H(
ie(e)
)
end
return e
end
local function Ce(e)
if V(e)then
return e
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return k()
end
local function rt(e)
return X(
Ce(e)
)
end
local function tt(e)
return oe(
Ce(e)
)
end
local function Ze(e)
if j(e)then
return M(e)
else
return g(e)
end
end
Xe={}
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
if not S(e,We)then
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
if f(t[(e+0)+1],i)then
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
e=g(e)
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
local function ee(t,a,o)
return{
t,
1,
function(e,i)
e=g(e)
if w(e)then
return x(t,{e})
end
if a(e)then
return o(e)
end
return i()
end
}
end
ct={
he(Je,u),
{it,2,A},
ee(Se,u,z),
ee(Ge,u,O),
he(He,q),
{yt,2,L},
ee(Qe,q,U),
ee(Ye,q,C),
he(Ne,r),
{wt,2,s},
he(Re,a),
ee(Fe,a,o),
ee(Me,a,n),
{
te,
2,
function(e,t,i)
if e==t then
return re
end
e=g(e)
t=g(t)
if w(e)or w(t)then
return x(te,{e,t})
end
if e==t then
return re
end
local function i(t,a,e)
return x(se,{t,a,e})
end
local function s(t,e)
return i(t,e,d)
end
I(
not w(e)
)
local function i(t,e,a,o)
return s(
x(
te,
{
a(t),
a(e)
}
),
x(
te,
{
o(t),
o(e)
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
if S(e,t)then
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
return i(e,t,U,C)
end
return k()
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
xe,
2,
function(e,t,a)
local e=de(e)
if e==false then
return a()
end
return R(e,t)
end
},
he(Be,y),
{
Ke,
1,
function(e,t)
e=g(e)
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
se,
3,
function(e,a,o,t)
e=g(e)
if w(e)then
return x(se,{e,a,o})
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
if S(e,ht)then
return a
end
if S(e,st)then
return o
end
return t()
end
},
{nt,2,ye}
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
local function i(t,e,o,a)
if d(
o(t),
o(e)
)and d(
a(t),
a(e)
)then
N(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
N(e,v)
N(t,v)
return true
elseif y(e)then
if not y(t)then
return false
end
return S(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,U,C)
elseif u(e)then
if not u(t)then
return false
end
return i(e,t,z,O)
elseif fe(e)then
return false
end
return k()
end
local function ee(J)
local O,w,u,d,c,h,z,q,B,g,F,Y,V,C,U,D,S,H,M,j,N,k,f,K,G,Q
function u()
return#O==w
end
function d()
I(
not u()
)
local e=string.sub(O,w+1,w+1)
w=w+1
return e
end
function c(e)
I(
string.sub(O,w,w)==e
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
function B()
if u()then
return false
end
local e=d()
local t=""
if not H(e)then
c(e)
return false
end
while H(e)and not u()do
t=tostring(t)..tostring(e)
e=d()
end
if H(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
return i(t)
end
function g()
if u()then
return false
end
local e=d()
if e~="("then
c(e)
return false
end
local t=Oe()
local a=t
local function o(a)
local e=Oe()
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
local o=M()
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
local e=M()
o(e)
end
end
function F()
if u()then
return false
end
local e=d()
if e~="#"then
c(e)
return false
end
local e=g()
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
function Y()
if u()then
return false
end
local e=d()
if e~="!"then
c(e)
return false
end
local e=g()
if e==false then
return h()
end
if not a(e)then
return h()
end
return L(
o(e),
n(e)
)
end
function H(e)
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
function M()
q()
local e={g,Q,F,Y,V,C,U,D,S}
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
function N()
return not u()
end
function k(e)
j(
N()
)
j(
d()==e
)
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
e={g,B,a,F,Y,V,C,U,D,S}
else
e={g,G,F,Y,V,C,U,D,S}
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
local o=f()
return e(
l,
e(
t,
e(a),
m
),
o
)
elseif o==":"then
local t=f()
return e(l,t,a)
elseif o=="~"then
return e(Z,a)
elseif o=="@"then
local o=f()
return e(
l,
e(
t,
s(a,m),
m
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
local e=f(true)
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
be,
T(t)
)
else
c(o)
return a
end
end
function G()
if u()then
return false
end
local a=d()
if a=="&"then
j(
N()
)
local t=d()
if t=="+"then
local t=f()
return e(
_,
e(E,t)
)
else
c(t)
end
local t=f()
return e(_,t)
elseif a==":"then
j(
N()
)
local a=d()
if a=="&"then
k(">")
local a=f()
return e(
l,
e(
_,
e(t,m,a)
),
W
)
elseif a==">"then
local a=f()
return e(
l,
e(t,m,a),
W
)
else
c(a)
end
local t=f()
return e(l,t,W)
elseif a=="+"then
local t=f()
return e(E,t)
elseif a=="["then
local e=f()
k("]")
return K(e)
elseif a=="_"then
k(":")
local t=f()
return e(l,t,m)
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
return b(e)
end
O=J
w=0
local function e(t,i)
return function()
if u()then
return false
end
local e=d()
if e~=t then
c(e)
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
local e=g()
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
V=e(
"$",
function(e,t)
local e=de(e)
if e==false then
return h()
end
return R(e,t)
end
)
C=e(
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
U=l(
"@",
function(a,o,e)
local t=ke(
e,
function(e)return e end,
function(e,e)return h()end
)
local e=de(a)
if e==false then
return h()
end
return Ve(e,o,t)
end
)
D=e(
"^",
function(e,t)
local t=ke(
t,
function(e)return e end,
function(e,e)return h()end
)
return P(e,t)
end
)
S=e(
";",
function(e,t)return ye(e,t)end
)
return M()
end
local function x(f)
local function i(r,u)
if y(r)then
return Y(r)
end
local function s(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=F(r)
if e~=false and#e==3 and d(e[1],l)then
local h=F(e[2])
if h~=false and#h==3 and d(h[1],t)then
local t=h[2]
local r=F(t)
if r~=false and#r==1 and d(h[3],m)then
return s(
tostring(
i(r[1],true)
).."."..tostring(
i(e[3],true)
)
)
elseif a(t)and d(
n(t),
m
)and d(h[3],m)then
return s(
tostring(
i(
o(t),
true
)
).."@"..tostring(
i(e[3],true)
)
)
elseif d(t,m)and d(e[3],W)then
return s(
":>"..tostring(
i(h[3],true)
)
)
end
end
local a=F(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],Z)then
return s(
tostring(
i(a[2],true)
).."?"
)
end
if h~=false and#h==2 and d(e[3],W)and d(h[1],_)then
local e=F(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],m)then
return s(
":&>"..tostring(
i(e[3],true)
)
)
end
end
local t
if d(e[3],m)then
t="_"
elseif d(e[3],W)then
t=""
else
t=i(e[3],true)
end
return s(
tostring(t)..":"..tostring(
i(e[2],true)
)
)
elseif e~=false and#e==2 then
if d(e[1],_)then
local t=F(e[2])
if t~=false and#t==2 and d(t[1],E)then
return s(
"&+"..tostring(
i(t[2],true)
)
)
end
return s(
"&"..tostring(
i(e[2],true)
)
)
elseif d(e[1],Z)then
return s(
tostring(
i(e[2],true)
).."~"
)
elseif d(e[1],E)then
return s(
"+"..tostring(
i(e[2],true)
)
)
elseif d(e[1],be)then
local e=F(e[2])
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
return s(a)
end
end
end
if u then
return c(r)
else
return c(
b(r)
)
end
end
local e=ee(
c(f)
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
local e=F(t)
if e~=false and#e==2 and d(a,ae)and d(e[1],E)then
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
U(e),
C(e)
)
)
)
elseif y(e)then
return Y(e)
elseif j(e)then
return";("..tostring(
x(
ue(e)
)
).." "..tostring(
x(
M(e)
)
)..")"
elseif V(e)then
return"$("..tostring(
x(
D(
X(e)
)
)
).." "..tostring(
x(
oe(e)
)
)..")"
elseif B(e)then
return"%("..tostring(
x(
pe(e)
)
).." "..tostring(
x(
T(
me(e)
)
)
)..")"
elseif G(e)then
return"@("..tostring(
x(
D(
Te(e)
)
)
).." "..tostring(
x(
ge(e)
)
).." "..tostring(
x(
T(
ve(e)
)
)
)..")"
elseif Q(e)then
return"^("..tostring(
x(
qe(e)
)
).." "..tostring(
x(
T(
ze(e)
)
)
)..")"
end
return k()
end
local function W(a)
local e,h,t
function h()
return e==0
end
function t()
return not h()
end
e=#a
local function o(e)
if e==nil then
e=""
end
error(
"MT parse ERROR "..tostring(e)
)
end
local function n(e)
if not e then
return o()
end
end
local function r()
n(
t()
)
e=e-1
return string.sub(a,e+1,e+1)
end
local e={}
local function a(i)
local a=table.remove(e)
local t=table.remove(e)
if t==nil or a==nil then
return o()
else
return Ie(
e,
i(t,a)
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
Ie(
e,
i(t)
)
elseif t=="."then
a(s)
elseif t=="#"then
a(A)
elseif t=="!"then
a(L)
elseif t=="$"then
a(
function(e,t)
local e=de(e)
if e==false then
return o()
else
return R(e,t)
end
end
)
elseif t=="_"then
Ie(e,v)
else
return o()
end
end
n(
h()
)
n(#e==1)
return e[1]
end
local function I(e)
local s={e}
local t=""
while#s~=0 do
local h={}
for i,e in ipairs(s)do
e=H(e)
local function i(e,o,a,i)
t=tostring(t)..tostring(o)
return p(
h,
a(e),
i(e)
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
i(e,"!",U,C)
elseif fe(e)then
local e=Ce(e)
i(
e,
"$",
(function(e)return D(
X(e)
)end),
oe
)
else
return k()
end
end
s=h
end
return t
end
local function E(e)
return function()return{false,e}end
end
local function p(e)
return function()return{
true,
e()
}end
end
local function _(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local k=b(
s(
be,
s(
s(
et,
s(
s(
l,
s(
ot,
s(m,v)
)
),
v
)
),
v
)
)
)
local b=b(
s(
be,
s(
s(
et,
s(le,v)
),
v
)
)
)
local function N(t,a)
return A(
b,
e(t,a)
)
end
local function V(e)
return A(k,e)
end
local function m(y,w,l,c,d)
if d==nil then
d=false
end
local function v(e,e)
error("WIP")
end
l=h(l)
if u(l)then
local u=z(l)
local s=O(l)
if f(u,k)then
s=h(s)
if a(s)then
local a=o(s)
local e=h(
n(s)
)
if r(e)then
if d==false then
local a=a
local t=c
local function e()return y(a,t)end
return p(e)
else
local t
t=y
local e
e=w
local o=a
local a=c
local function i()return m(
t,
e,
P(d,o),
a
)end
return p(i)
end
end
end
elseif f(u,b)then
s=h(s)
if a(s)then
local l=o(s)
local s=h(
n(s)
)
if a(s)then
local a=o(s)
local o=h(
n(s)
)
if r(o)then
if d==false then
local e
e=y
local t
t=w
local o=l
local a=a
local n=c
local function i()return m(e,t,o,n,a)end
return p(i)
else
local o
o=y
local n
n=w
local l=l
local r=a
local h=c
local s=d
local a=i("序甲")
local function i()return m(
o,
n,
l,
h,
A(
t,
e(
e(a),
v(
e(
ce(r),
a
),
ce(s)
)
)
)
)end
return p(i)
end
end
end
end
end
end
if d==false then
return p(
function()return w(l,c,y)end
)
else
return p(
function()return w(
l,
c,
function(e,t)return p(
function()return m(
y,
w,
P(d,{e}),
t
)end
)end
)end
)
end
end
local function l(a,t,o,e)
return m(a,t,o,e)
end
local function d(t,o,n,i)
return _(
m(
(function(e,a)return E(
t(e,a)
)end),
(function(a,e,t)return E(
o(
a,
e,
function(e,a)return _(
t(e,a)
)end
)
)end),
n,
i
)
)
end
local t={}
t.new_comment=ye
t.comment_p=j
t.comment_comment=ue
t.comment_x=M
t.un_comment_all=ie
t.new_atom=i
t.atom_p=y
t.un_atom=Y
t.atom_equal_p=S
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
t.new_error=L
t.error_p=q
t.error_name=U
t.error_list=C
t.just_p=J
t.evaluate=R
t.apply=P
t.force_all_rec=K
t.force_uncomment_all_rec=Ee
t.unlazy_all_rec=Le
t.jsArray_to_list=T
t.maybe_list_to_jsArray=F
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=at
t.delay_p=fe
t.delay_just_p=w
t.lazy_p=ne
t.delay_env=rt
t.delay_x=tt
t.force_all=h
t.force1=g
t.force_uncomment1=Ze
t.force_uncomment_all=De
t.unlazy1=_e
t.env_null_v=Xe
t.env_set=je
t.env_get=Ue
t.env2val=D
t.env_foreach=Pe
t.val2env=de
t.equal_p=f
t.simple_print=c
t.complex_parse=ee
t.complex_print=x
t.machinetext_parse=W
t.machinetext_print=I
t.trampoline_return=E
t.trampoline_delay=p
t.run_trampoline=_
t.return_effect_systemName=k
t.bind_effect_systemName=b
t.new_effect_bind=N
t.new_effect_return=V
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
