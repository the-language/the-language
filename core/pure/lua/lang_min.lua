local function l(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ne(t,...)
local a=({...})
do
local e=#a-1
while e>=0 do
table.insert(t,1,a[e+1])
e=e-1
end
end
return#t
end
local k,j,nt,ot,P,R,F,re,se,fe,et,Ze,pe,J,Se,Ke,Qe,le,q,ie,C,ee,m,L,I,h,a,i,n,y,s,_,u,x,A,V,tt,H,G,Q,X,Ce,Y,Oe,_e,Ee,O,K,me,ce,M,B,Ae,Ie,W,Re,ze,o,S,oe,ut,E,he,t,z,Pe,lt,mt,Me,Ue,We,Ye,Ve,Le,Fe,De,te,je,ge,ae,Te,dt,U,ue,ct,rt,b,T,e,N,ne,p,Z,d,g,r,be,ke,ht,f,xe,Xe,st,Je,ye,we,qe,Be,ve,Ge,it,D,He,at,pt,yt,wt,vt,de,ft,c,w,v
function k()
error("TheLanguage PANIC")
end
function j(e)
if not e then
return k()
end
end
function nt(e)
for e in pairs(e)do
return false
end
return true
end
function ot(a)
local t={}
for e in pairs(a)do
t[e]=a[e]
end
return t
end
function P(e)
return function()return{false,e}end
end
function R(e)
return function()return{
true,
e()
}end
end
function le(e,t)
return{Ke,e,t}
end
function q(e)
return e[1]==Ke
end
function ie(e)
return e[2]
end
function C(e)
return e[3]
end
function ee(e)
while q(e)do
e=C(e)
end
return e
end
function m(e)
return e[1]==F
end
function L(e)
return e[2]
end
function I(e,t)
if e==t then
return true
end
if L(e)==L(t)then
S(e,t)
return true
else
return false
end
end
function h(t,e)
return{re,t,e}
end
function a(e)
return e[1]==re
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function s(e)
return e[1]==se
end
function _(t,e)
return{fe,t,e}
end
function u(e)
return e[1]==fe
end
function x(e)
return e[2]
end
function A(e)
return e[3]
end
function V(e)
return e[1]==et
end
function tt(e)
return e[2]
end
function H(e,t)
return{Ze,e,t}
end
function G(e)
return e[1]==Ze
end
function Q(e)
return e[2]
end
function X(e)
return e[3]
end
function Ce(e,t,a)
return{J,e,t,a}
end
function Y(e)
return e[1]==J
end
function Oe(e)
return e[2]
end
function _e(e)
return e[3]
end
function Ee(e)
return e[4]
end
function O(t,e)
return{pe,t,e}
end
function K(e)
return e[1]==pe
end
function me(e)
return e[2]
end
function ce(e)
return e[3]
end
function M(t,e)
return{Se,t,e}
end
function B(e)
return e[1]==Se
end
function Ae(e)
return e[2]
end
function Ie(e)
return e[3]
end
function W(e)
local e=r(e)
local function t(e)
e[2]=W(e[2])
e[3]=W(e[3])
return e
end
if u(e)then
return t(e)
elseif a(e)then
return t(e)
elseif q(e)then
return t(e)
end
return e
end
function ze()
return{Qe}
end
function o(e)
return e[1]==Qe
end
function S(e,t)
if e==t then
return
end
if e==y then
e=t
t=y
end
e[1]=et
e[2]=t
e[3]=false
e[4]=false
end
function oe(t,e)
j(
o(t)
)
j(
not o(e)
)
local t=t
local e=e
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ut(t)
local e=ze()
oe(e,t)
return e
end
function b(e,t)
return _(
lt,
h(
e,
h(t,y)
)
)
end
function T(a)
local t=y
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
function N(e)
if not V(e)then
return e
end
local e=e
local t={}
while V(e)do
l(t,e)
e=tt(e)
end
for a,t in ipairs(t)do
S(t,e)
end
return e
end
function ne(e)
return G(e)or Y(e)or K(e)or B(e)
end
function p(e)
return V(e)or ne(e)
end
function Z(e)
return p(e)or q(e)
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
h(t)
if p(t)then
l(a,e)
return d(t,i,{false,false},a)
end
return t
end
local r={}
e=o
local function o()
t[2]=true
return n(mt)
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
l(a,e)
e=g(e)
t=t+1
end
end
while p(e)do
local s=v(e)
if i[s]==true then
return o()
end
if r[s]==true then
t[1]=true
if G(e)then
return o()
elseif K(e)then
local a=me(e)
local e=ce(e)
local s={Me,Ue,We,Ye,Ve,Le,Fe,De}
local i=false
for t,e in ipairs(s)do
if w(e,a)then
i=true
break
end
end
if i then
j(#e==1)
j(t[2]==false)
local e=d(
e[1],
u(),
t
)
if t[2]then
return n(
O(a,{e})
)
else
return k()
end
end
if w(a,te)then
return o()
elseif w(a,je)then
return o()
elseif w(a,ge)then
return o()
elseif w(a,ae)then
j(#e==3)
j(t[2]==false)
local a=d(
e[1],
u(),
t
)
if t[2]then
return n(
O(ae,{a,e[2],e[3]})
)
else
return k()
end
end
return k()
elseif Y(e)then
return o()
elseif B(e)then
return o()
end
return k()
end
r[s]=true
l(a,e)
e=g(e)
end
return h(e)
end
function g(a)
local e=N(a)
local t
j(
not V(e)
)
if G(e)then
t=at(
Q(e),
X(e),
a
)
elseif Y(e)then
t=vt(
Oe(e),
_e(e),
Ee(e),
a
)
elseif K(e)then
t=wt(
me(e),
ce(e),
a
)
elseif B(e)then
t=yt(
Ae(e),
Ie(e),
a
)
else
t=e
end
t=N(t)
S(e,t)
return t
end
function r(e)
return d(e)
end
function be(e)
while p(e)or q(e)do
e=r(
ee(e)
)
end
return e
end
function ke(e)
while q(e)do
e=C(e)
end
e=g(e)
while q(e)do
e=C(e)
end
return e
end
function ht(e,u,d,r)
local h={}
local t={}
local e=N(e)
local o=true
while true do
if s(e)then
return r(t,h)
elseif q(e)then
l(
t,
ie(e)
)
e=C(e)
elseif a(e)then
l(
h,
i(e)
)
e=n(e)
elseif p(e)then
if o then
o=false
e=g(e)
else
return d()
end
else
return u()
end
end
end
function f(e)
if Z(e)then
e=ke(e)
end
if Z(e)then
return nil
end
if m(e)then
return true
end
if not u(e)then
return false
end
local e=x(e)
if Z(e)then
e=ke(e)
end
if Z(e)then
return nil
end
if not m(e)then
return false
end
return I(e,he)
end
function xe()
return{true,{},nil}
end
function Xe(e)
if e[1]then
return nt(e[2])
end
return false
end
function st(e,o,t)
e=be(e)
if m(e)then
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
elseif u(e)then
l(t,"#")
l(
o,
x(e),
A(e)
)
else
return k()
end
end
function Je(a)
local t={}
local e={}
for o,a in ipairs(a)do
st(a,t,e)
end
return{e,t}
end
function ye(a)
local t=Je(a[2])
local e=t[1]
local o=t[2]
local t={}
j(#e~=0)
t[e[#e]]={false,o,a[3]}
local a={true,t,nil}
do
local t=#e-2
while t>=0 do
local o={}
o[e[t+1]]=a
a={true,o,nil}
t=t-1
end
end
return a
end
function we(e)
return{
true,
ot(e[2]),
nil
}
end
function qe(a,h,o,t,i)
if#h==0 then
j(
Xe(a)or(a[1]==false and a[2].length==0)
)
t[1]=false
t[2]=h
t[3]=o
return P(i)
end
if a[1]then
local e=we(a)
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
local t=t
local e=Je(h)
local h=e[1]
local r=e[2]
local e=t
do
local a=0
while a<#h do
local s=h[a+1]
local t=nil
if e[2][s]~=nil then
local n=e[2][s]
if n[0]then
t=we(n)
else
if n[1].length==0 then
j(a==#h-1)
local t=xe()
e[2][s]=t
t[1]=false
t[2]=r
t[3]=o
return P(i)
end
t=ye(n)
end
else
t={true,{},nil}
end
j(t~=nil)
e[2][s]=t
e=t
a=a+1
end
end
if Xe(e)then
local e=e
e[1]=false
e[2]=r
e[3]=o
return P(i)
else
return R(
function()return qe(e,r,o,e,i)end
)
end
else
return R(
function()return qe(
ye(a),
h,
o,
t,
i
)end
)
end
return k()
end
function ve(a,o,i)
local t={}
do
local e=0
while e<#a do
if w(a[(e+0)+1],o)then
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
if w(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function it(t,a)
do
local e=0
while e<#t do
if w(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return k()
end
function D(o)
local a=y
do
local t=0
while t<#o do
a=h(
e(o[(t+0)+1],o[(t+1)+1]),
a
)
t=t+2
end
end
return _(
Pe,
e(a)
)
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
function at(h,t,d)
local o=g(t)
if p(o)then
return d
end
local function t()return b(
E,
e(
U,
e(
ge,
e(
D(h),
o
)
)
)
)end
if a(o)then
return ht(
o,
t,
function()return d end,
function(o,e)
if#o~=0 then
error("WIP")
end
if w(e[1],ue)then
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
return Ce(h,o,a)
elseif w(e[1],ct)then
if#e==1 then
return t()
end
local r=r(
H(h,e[2])
)
if not u(r)then
return t()
end
local o=g(
x(r)
)
if p(o)then
return d
end
if not m(o)then
return t()
end
if not I(o,z)then
return t()
end
local o=g(
A(r)
)
if p(o)then
return d
end
if not a(o)then
return t()
end
local i=i(o)
local a=g(
n(o)
)
if p(a)then
return d
end
if not s(a)then
return t()
end
local a={
D(h)
}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return M(i,a)
elseif w(e[1],U)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
l(
a,
H(h,e[t+1])
)
t=t+1
end
end
return O(o,a)
else
local o=H(h,e[1])
local a={}
do
local t=1
while t<#e do
l(
a,
H(h,e[t+1])
)
t=t+1
end
end
return M(o,a)
end
end
)
elseif s(o)then
return o
end
local e=f(o)
if e==nil then
return d
end
if e==true then
return Ge(
h,
o,
t()
)
end
return t()
end
function yt(o,l,c)
local function d()return b(
E,
e(
U,
e(
je,
e(
o,
T(l)
)
)
)
)end
o=g(o)
if p(o)then
return c
end
if not u(o)then
return d()
end
local e=r(
x(o)
)
if not(m(e)and I(e,t))then
return d()
end
local t=r(
A(o)
)
if not a(t)then
return d()
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
return d()
end
local r=i(t)
local o=Be
local t=0
while not s(e)do
local s=f(e)
if s==nil then
return c
end
if s==true then
local a=y
do
local e=#l-1
while e>=t do
a=h(l[e+1],a)
e=e-1
end
end
o=ve(o,e,a)
t=#l
e=y
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
o=ve(
o,
i(e),
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
return H(o,r)
end
function wt(i,t,o)
local function a()return b(
E,
e(
U,
e(
i,
T(t)
)
)
)end
for n,e in ipairs(pt)do
if w(i,e[1])then
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
function vt(i,o,t,a)
local function a()return b(
E,
e(
ue,
e(
D(i),
o,
T(t)
)
)
)end
if w(o,Te)then
if#t~=1 then
return a()
end
return t[1]
elseif w(o,dt)then
if#t~=2 then
return a()
end
return ft(i,t[1],t[2],a)
elseif w(o,rt)then
if#t~=2 then
return a()
end
return le(
t[1],
H(i,t[2])
)
end
return a()
end
function de(t)
return e(ue,Te,t)
end
function ft(c,r,m,p)
r=Re(r)
local d={}
local u=false
local o=r
while not s(o)do
local e=f(o)
j(e~=nil)
if e then
l(d,o)
u=true
o=y
elseif a(o)then
l(
d,
i(o)
)
o=n(o)
else
return p()
end
end
local o
if u then
o=T(d)
else
o=r
end
local a={}
He(
c,
function(t,e)
do
local e=0
while e<#d do
if w(d[e+1],t)then
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
de(
it(c,a[e+1])
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
de(
_(
t,
e(i,m)
)
),
o
)
)
)
end
function c(t,e)
if t==e then
return true
end
t=r(t)
e=r(e)
if t==e then
return true
end
local function o(t,e,a,o)
local i=c(
a(t),
a(e)
)
local a=c(
o(t),
o(e)
)
if i==true and a==true then
S(t,e)
return true
elseif i~=false and a~=false then
return nil
else
return false
end
end
if q(t)then
local t=ee(t)
local e=c(t,e)
if e==true then
e=nil
end
return e
elseif q(e)then
local e=ee(e)
local e=c(t,e)
if e==true then
e=nil
end
return e
elseif s(t)then
if not s(e)then
return false
end
S(t,e)
return true
elseif m(t)then
if not m(e)then
return false
end
return I(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif u(t)then
if not u(e)then
return false
end
return o(t,e,x,A)
end
return k()
end
function w(t,e)
return c(t,e)~=false
end
function v(e)
e=N(e)
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
e=N(
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
elseif u(e)then
return"#"..tostring(
v(
h(
x(e),
A(e)
)
)
)
elseif m(e)then
return L(e)
elseif q(e)then
return";("..tostring(
v(
ie(e)
)
).." "..tostring(
v(
C(e)
)
)..")"
elseif G(e)then
return"$("..tostring(
v(
D(
Q(e)
)
)
).." "..tostring(
v(
X(e)
)
)..")"
elseif K(e)then
return"%("..tostring(
v(
me(e)
)
).." "..tostring(
v(
T(
ce(e)
)
)
)..")"
elseif Y(e)then
return"@("..tostring(
v(
D(
Oe(e)
)
)
).." "..tostring(
v(
_e(e)
)
).." "..tostring(
v(
T(
Ee(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
v(
Ae(e)
)
).." "..tostring(
v(
T(
Ie(e)
)
)
)..")"
end
return k()
end
local function ye(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
F=0
re=1
se=2
fe=3
et=4
Ze=5
pe=6
J=7
Se=8
Ke=10
Qe=9
local function o(e)
return{F,e}
end
y={se}
local function we(e)
local t=be(e)
local function o(e)
e[2]=W(e[2])
e[3]=W(e[3])
if q(e[2])or q(e[3])then
local t=ut(e)
local a=e[2]
local o=e[3]
local e=we(a)
local a=we(o)
t[2]=e
t[3]=a
return t
else
return e
end
end
if u(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
Re=we
E=o("太始初核")
he=o("符名")
t=o("化滅")
z=o("式形")
local wt=o("等同")
local ft=o("解算")
local F=o("特定其物")
local f=o("省略一物")
Pe=o("映表")
local it=o("如若")
local c=o("一類何物")
local J=o("是非")
local fe=o("其子")
local et=o("爻陽")
local Ze=o("爻陰")
local st=o("引用")
local ut=o("應用")
local ht=o("間空")
local re=o("連頸")
local se=o("構物")
lt=o("謬誤")
local lt=o("詞素")
local Ke=o("列序")
local ot=o("首始")
local nt=o("尾末")
local Xe=o("之物")
local d=o("宇宙亡矣")
local Je=o("效應")
local Qe=o("註疏")
mt=b(
E,
e(d,f)
)
local function b(e)
return _(
he,
h(
E,
h(e,y)
)
)
end
local function Se(a)
return b(
e(
c,
e(t,f,a),
F
)
)
end
local function d(a,o)
return b(
e(
c,
e(
t,
e(a),
f
),
o
)
)
end
local function pe(a)
return b(
e(
c,
t,
e(
J,
e(c,a,f)
)
)
)
end
local tt=Se(se)
Me=d(se,he)
Ue=d(se,Ke)
We=pe(se)
local at=Se(re)
Ye=pe(re)
Ve=d(re,ot)
Le=d(re,nt)
Fe=pe(lt)
De=pe(ht)
te=b(
e(
c,
t,
e(J,wt)
)
)
je=b(
e(
c,
e(
t,
h(t,f),
f
),
ut
)
)
ge=b(
e(c,t,ft)
)
local Ke=d(
Ke,
e(c,Xe,f)
)
ae=b(
e(c,t,it)
)
Te=b(
e(c,z,st)
)
dt=b(
e(
c,
e(
z,
e(t,f,t)
),
F
)
)
U=b(
e(
z,
e(E,t)
)
)
ue=b(
e(
z,
e(E,z)
)
)
ct=b(
e(z,z)
)
local ot=b(
e(c,t,Qe)
)
rt=b(
e(c,z,Qe)
)
local d=_(
Ze,
e()
)
local ue=_(
et,
e()
)
local function Te(e,h,o)
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
return Te(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function nt(e)
while V(e)or q(e)do
e=N(
ee(e)
)
end
return e
end
local function Se(e)
if G(e)then
return e
elseif Y(e)then
error("WIP")
elseif K(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return k()
end
local function st(e)
return Q(
Se(e)
)
end
local function it(e)
return X(
Se(e)
)
end
local function Qe(e)
if q(e)then
return C(e)
else
return g(e)
end
end
local se=xe()
local function se(a,o,t)
local e=xe()
return ye(
qe(a,{o},t,e,e)
)
end
Be={}
local function se(t)
t=r(t)
if not u(t)then
return false
end
local e=r(
x(t)
)
if not m(e)then
return false
end
if not I(e,Pe)then
return false
end
e=r(
A(t)
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
local t={}
local o=r(
i(e)
)
while not s(o)do
if not a(o)then
return false
end
local e=r(
i(o)
)
o=r(
n(o)
)
if not a(e)then
return false
end
local o=i(e)
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
local i=true
do
local e=0
while e<#t do
if w(t[(e+0)+1],o)then
t[(e+1)+1]=a
i=false
break
end
e=e+2
end
end
if i then
l(t,o,a)
end
end
return t
end
local function qe(t,a)
return{
t,
1,
function(e)
e=g(e)
if p(e)then
return O(t,{e})
end
if a(e)then
return ue
end
return d
end
}
end
local function pe(t,a,o)
return{
t,
1,
function(e,i)
e=g(e)
if p(e)then
return O(t,{e})
end
if a(e)then
return o(e)
end
return i()
end
}
end
pt={
qe(We,u),
{tt,2,_},
pe(Me,u,x),
pe(Ue,u,A),
qe(De,s),
{at,2,h},
qe(Ye,a),
pe(Ve,a,i),
pe(Le,a,n),
{
te,
2,
function(e,t,o)
if e==t then
return ue
end
e=g(e)
t=g(t)
if p(e)or p(t)then
return O(te,{e,t})
end
if e==t then
return ue
end
local function o(t,a,e)
return O(ae,{t,a,e})
end
local function r(t,e)
return o(t,e,d)
end
j(
not p(e)
)
local function h(o,e,t,a)
return r(
O(
te,
{
t(o),
t(e)
}
),
O(
te,
{
a(o),
a(e)
}
)
)
end
if s(e)then
if not s(e)then
return d
end
return ue
elseif m(e)then
if not m(t)then
return d
end
if I(e,t)then
return ue
else
return d
end
elseif u(e)then
if not u(t)then
return d
end
return h(e,t,x,A)
elseif a(e)then
if not a(t)then
return d
end
return h(e,t,i,n)
end
return k()
end
},
{
je,
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
return M(h,t)
end
},
{
ge,
2,
function(e,t,a)
local e=se(e)
if e==false then
return a()
end
return H(e,t)
end
},
qe(Fe,m),
{
Ke,
1,
function(e,t)
e=g(e)
if p(e)then
return O(Ke,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
ae,
3,
function(e,a,o,t)
e=g(e)
if p(e)then
return O(ae,{e,a,o})
end
if not u(e)then
return t()
end
local e=r(
x(e)
)
if not m(e)then
return t()
end
if I(e,et)then
return a
end
if I(e,Ze)then
return o
end
return t()
end
},
{ot,2,le}
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
local function o(t,e,a,o)
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
if s(e)then
if not s(t)then
return false
end
S(e,y)
S(t,y)
return true
elseif m(e)then
if not m(t)then
return false
end
return I(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif u(e)then
if not u(t)then
return false
end
return o(e,t,x,A)
elseif ne(e)then
return false
end
return k()
end
local function te(K)
local D,v,u,d,w,r,x,A,P,g,Y,W,C,L,U,S,I,N,q,R,k,p,V,B,G
function u()
return#D==v
end
function d()
j(
not u()
)
local e=string.sub(D,v+1,v+1)
v=v+1
return e
end
function w(e)
j(
string.sub(D,v,v)==e
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
function x(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function A()
if u()then
return false
end
local e=d()
if not x(e)then
w(e)
return false
end
while x(e)and not u()do
e=d()
end
if not x(e)then
w(e)
end
return true
end
function P()
if u()then
return false
end
local e=d()
local t=""
if not I(e)then
w(e)
return false
end
while I(e)and not u()do
t=tostring(t)..tostring(e)
e=d()
end
if I(e)then
t=tostring(t)..tostring(e)
else
w(e)
end
return o(t)
end
function g()
if u()then
return false
end
local e=d()
if e~="("then
w(e)
return false
end
local t=ze()
local a=t
local function i(a)
local e=ze()
oe(
t,
h(a,e)
)
t=e
end
while true do
A()
if u()then
return r()
end
e=d()
if e==")"then
oe(t,y)
return a
end
if e=="."then
A()
local o=N()
oe(t,o)
A()
if u()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
w(e)
local e=N()
i(e)
end
end
function Y()
if u()then
return false
end
local e=d()
if e~="#"then
w(e)
return false
end
local e=g()
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
function I(e)
if x(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function N()
A()
local e={g,G,Y,W,C,L,U,S}
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
return not u()
end
function k(e)
q(
R()
)
q(
d()==e
)
end
function p(t)
if t==nil then
t=false
end
local function a()
k("[")
local e=p()
k("]")
return e
end
local e
if t then
e={g,P,a,Y,W,C,L,U,S}
else
e={g,B,Y,W,C,L,U,S}
end
for t,e in ipairs(e)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function V(a)
if u()then
return a
end
local o=d()
if o=="."then
local o=p()
return e(
c,
e(
t,
e(a),
f
),
o
)
elseif o==":"then
local t=p()
return e(c,t,a)
elseif o=="~"then
return e(J,a)
elseif o=="@"then
local o=p()
return e(
c,
e(
t,
h(a,f),
f
),
o
)
elseif o=="?"then
return e(
c,
t,
e(J,a)
)
elseif o=="/"then
local t={a}
while true do
local e=p(true)
l(t,e)
if u()then
break
end
local e=d()
if e~="/"then
w(e)
break
end
end
return e(
fe,
T(t)
)
else
w(o)
return a
end
end
function B()
if u()then
return false
end
local a=d()
if a=="&"then
q(
R()
)
local t=d()
if t=="+"then
local t=p()
return e(
z,
e(E,t)
)
else
w(t)
end
local t=p()
return e(z,t)
elseif a==":"then
q(
R()
)
local a=d()
if a=="&"then
k(">")
local a=p()
return e(
c,
e(
z,
e(t,f,a)
),
F
)
elseif a==">"then
local a=p()
return e(
c,
e(t,f,a),
F
)
else
w(a)
end
local t=p()
return e(c,t,F)
elseif a=="+"then
local t=p()
return e(E,t)
elseif a=="["then
local e=p()
k("]")
return V(e)
elseif a=="_"then
k(":")
local t=p()
return e(c,t,f)
else
w(a)
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
if m(e)then
return e
end
return b(e)
end
D=K
v=0
local function e(t,o)
return function()
if u()then
return false
end
local e=d()
if e~=t then
w(e)
return false
end
local e=g()
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
if u()then
return false
end
local e=d()
if e~=t then
w(e)
return false
end
local e=g()
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
W=e(
"$",
function(e,t)
local e=se(e)
if e==false then
return r()
end
return H(e,t)
end
)
C=e(
"%",
function(t,e)
local e=Te(
e,
function(e)return e end,
function(e,e)return r()end
)
return O(t,e)
end
)
L=l(
"@",
function(o,t,e)
local a=Te(
e,
function(e)return e end,
function(e,e)return r()end
)
local e=se(o)
if e==false then
return r()
end
return Ce(e,t,a)
end
)
U=e(
"^",
function(t,e)
local e=Te(
e,
function(e)return e end,
function(e,e)return r()end
)
return M(t,e)
end
)
S=e(
";",
function(t,e)return le(t,e)end
)
return N()
end
local function j(w)
local function o(r,l)
if m(r)then
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
if e~=false and#e==3 and d(e[1],c)then
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
elseif d(t,f)and d(e[3],F)then
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
if h~=false and#h==2 and d(e[3],F)and d(h[1],z)then
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
elseif d(e[3],F)then
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
if d(e[1],z)then
local t=U(e[2])
if t~=false and#t==2 and d(t[1],E)then
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
elseif d(e[1],E)then
return s(
"+"..tostring(
o(e[2],true)
)
)
elseif d(e[1],fe)then
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
b(r)
)
end
end
local e=te(
v(w)
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
j(
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
j(e)
)..")"
end
return t
elseif u(e)then
local a=x(e)
local t=A(e)
local e=U(t)
if e~=false and#e==2 and d(a,he)and d(e[1],E)then
return o(e[2],false)
end
return"#"..tostring(
j(
h(a,t)
)
)
elseif m(e)then
return L(e)
elseif q(e)then
return";("..tostring(
j(
ie(e)
)
).." "..tostring(
j(
C(e)
)
)..")"
elseif G(e)then
return"$("..tostring(
j(
D(
Q(e)
)
)
).." "..tostring(
j(
X(e)
)
)..")"
elseif K(e)then
return"%("..tostring(
j(
me(e)
)
).." "..tostring(
j(
T(
ce(e)
)
)
)..")"
elseif Y(e)then
return"@("..tostring(
j(
D(
Oe(e)
)
)
).." "..tostring(
j(
_e(e)
)
).." "..tostring(
j(
T(
Ee(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
j(
Ae(e)
)
).." "..tostring(
j(
T(
Ie(e)
)
)
)..")"
end
return k()
end
local function E(i)
local e,n,t
function n()
return e==0
end
function t()
return not n()
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
local function s(e)
if not e then
return a()
end
end
local function r()
s(
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
return Ne(
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
Ne(
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
local e=se(e)
if e==false then
return a()
else
return H(e,t)
end
end
)
elseif t=="_"then
Ne(e,y)
else
return a()
end
end
s(
n()
)
s(#e==1)
return e[1]
end
local function z(e)
local h={e}
local t=""
while#h~=0 do
local r={}
for o,e in ipairs(h)do
e=N(e)
local function o(e,a,o,i)
t=tostring(t)..tostring(a)
return l(
r,
o(e),
i(e)
)
end
if m(e)then
t=tostring(t)..tostring(
("^"..tostring(
L(e)
).."^")
)
elseif a(e)then
o(e,".",i,n)
elseif s(e)then
t=tostring(t)..tostring(("_"))
elseif u(e)then
o(e,"#",x,A)
elseif ne(e)then
local e=Se(e)
o(
e,
"$",
(function(e)return D(
Q(e)
)end),
X
)
else
return k()
end
end
h=r
end
return t
end
local k=b(
h(
fe,
h(
h(
Je,
h(
h(
c,
h(
Xe,
h(f,y)
)
),
y
)
),
y
)
)
)
local b=b(
h(
fe,
h(
h(
Je,
h(re,y)
),
y
)
)
)
local function S(a,t)
return _(
b,
e(a,t)
)
end
local function O(e)
return _(k,e)
end
local function f(c,y,l,m,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
l=r(l)
if u(l)then
local u=x(l)
local h=A(l)
if w(u,k)then
h=r(h)
if a(h)then
local t=i(h)
local e=r(
n(h)
)
if s(e)then
if d==false then
local e=t
local a=m
local function t()return c(e,a)end
return R(t)
else
local e
e=c
local a
a=y
local o=t
local i=m
local function t()return f(
e,
a,
M(d,o),
i
)end
return R(t)
end
end
end
elseif w(u,b)then
h=r(h)
if a(h)then
local l=i(h)
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
local t
t=c
local e
e=y
local o=l
local a=a
local n=m
local function i()return f(t,e,o,n,a)end
return R(i)
else
local i
i=c
local n
n=y
local r=l
local l=a
local h=m
local s=d
local a=o("序甲")
local function o()return f(
i,
n,
r,
h,
_(
t,
e(
e(a),
p(
e(
de(l),
a
),
de(s)
)
)
)
)end
return R(o)
end
end
end
end
end
end
if d==false then
return R(
function()return y(l,m,c)end
)
else
return R(
function()return y(
l,
m,
function(e,t)return R(
function()return f(
c,
y,
M(d,{e}),
t
)end
)end
)end
)
end
end
local function d(e,t,o,a)
return f(e,t,o,a)
end
local function l(a,n,o,i)
return ye(
f(
(function(t,e)return P(
a(t,e)
)end),
(function(e,t,a)return P(
n(
e,
t,
function(e,t)return ye(
a(e,t)
)end
)
)end),
o,
i
)
)
end
local t={}
t.trampoline_return=P
t.trampoline_delay=R
t.run_trampoline=ye
t.new_comment=le
t.comment_p=q
t.comment_comment=ie
t.comment_x=C
t.un_comment_all=ee
t.new_atom=o
t.atom_p=m
t.un_atom=L
t.atom_equal_p=I
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=y
t.null_p=s
t.new_data=_
t.data_p=u
t.data_name=x
t.data_list=A
t.just_p=V
t.evaluate=H
t.apply=M
t.force_all_rec=W
t.force_uncomment_all_rec=we
t.unlazy_all_rec=Re
t.jsArray_to_list=T
t.maybe_list_to_jsArray=U
t.new_list=e
t.un_just_all=N
t.un_just_comment_all=nt
t.delay_p=ne
t.delay_just_p=p
t.lazy_p=Z
t.delay_env=st
t.delay_x=it
t.force_all=r
t.force1=g
t.force_uncomment1=Qe
t.force_uncomment_all=be
t.unlazy1=ke
t.env_null_v=Be
t.env_set=ve
t.env_get=Ge
t.env2val=D
t.env_foreach=He
t.val2env=se
t.equal_p=w
t.simple_print=v
t.complex_parse=te
t.complex_print=j
t.machinetext_parse=E
t.machinetext_print=z
t.return_effect_systemName=k
t.bind_effect_systemName=b
t.new_effect_bind=S
t.new_effect_return=O
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
