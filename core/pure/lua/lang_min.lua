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
local k,z,pt,yt,be,M,K,et,Ze,Je,xe,Ee,ue,ce,Xe,se,q,he,C,ee,m,U,S,h,a,i,n,y,s,_,c,j,E,Y,vt,R,W,te,X,Se,P,je,ke,ge,O,G,re,le,F,B,we,ye,V,He,ve,o,I,de,st,A,oe,t,x,Me,ht,rt,Re,Pe,Ye,Be,Ke,Ge,Qe,We,Z,_e,ze,J,Ve,at,L,qe,it,nt,g,T,e,H,ie,v,ae,d,b,r,Oe,pe,ot,w,Fe,tt,Le,Ie,Te,me,De,Ae,Ue,ft,D,Ce,wt,ut,lt,ct,mt,fe,dt,u,f,p,Q,N,ne
function k()
error("TheLanguage PANIC")
end
function z(e)
if not e then
return k()
end
end
function pt(e)
for e in pairs(e)do
return false
end
return true
end
function yt(e)
local t={}
for a in pairs(e)do
t[a]=e[a]
end
return t
end
function se(e,t)
return{ce,e,t}
end
function q(e)
return e[1]==ce
end
function he(e)
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
return e[1]==be
end
function U(e)
return e[2]
end
function S(t,e)
if t==e then
return true
end
if U(t)==U(e)then
I(t,e)
return true
else
return false
end
end
function h(t,e)
return{M,t,e}
end
function a(e)
return e[1]==M
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function s(e)
return e[1]==K
end
function _(t,e)
return{et,t,e}
end
function c(e)
return e[1]==et
end
function j(e)
return e[2]
end
function E(e)
return e[3]
end
function Y(e)
return e[1]==Ze
end
function vt(e)
return e[2]
end
function R(t,e)
return{Je,t,e}
end
function W(e)
return e[1]==Je
end
function te(e)
return e[2]
end
function X(e)
return e[3]
end
function Se(t,a,e)
return{Ee,t,a,e}
end
function P(e)
return e[1]==Ee
end
function je(e)
return e[2]
end
function ke(e)
return e[3]
end
function ge(e)
return e[4]
end
function O(t,e)
return{xe,t,e}
end
function G(e)
return e[1]==xe
end
function re(e)
return e[2]
end
function le(e)
return e[3]
end
function F(t,e)
return{ue,t,e}
end
function B(e)
return e[1]==ue
end
function we(e)
return e[2]
end
function ye(e)
return e[3]
end
function V(e)
local e=r(e)
local function t(e)
e[2]=V(e[2])
e[3]=V(e[3])
return e
end
if c(e)then
return t(e)
elseif a(e)then
return t(e)
elseif q(e)then
return t(e)
end
return e
end
function ve()
return{Xe}
end
function o(e)
return e[1]==Xe
end
function I(e,t)
if e==t then
return
end
if e==y then
e=t
t=y
end
e[1]=Ze
e[2]=t
e[3]=false
e[4]=false
end
function de(e,t)
z(
o(e)
)
z(
not o(t)
)
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function st(t)
local e=ve()
de(e,t)
return e
end
function g(e,t)
return _(
ht,
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
function H(e)
if not Y(e)then
return e
end
local e=e
local t={}
while Y(e)do
l(t,e)
e=vt(e)
end
for a,t in ipairs(t)do
I(t,e)
end
return e
end
function ie(e)
return W(e)or P(e)or G(e)or B(e)
end
function v(e)
return Y(e)or ie(e)
end
function ae(e)
return v(e)or q(e)
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
s(t)
if v(t)then
l(a,e)
return d(t,i,{false,false},a)
end
return t
end
local h={}
e=o
local function o()
t[2]=true
return n(rt)
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
while v(e)and t<32 do
l(a,e)
e=b(e)
t=t+1
end
end
while v(e)do
local s=p(e)
if i[s]==true then
return o()
end
if h[s]==true then
t[1]=true
if W(e)then
return o()
elseif G(e)then
local a=re(e)
local e=le(e)
local s={Re,Pe,Ye,Be,Ke,Ge,Qe,We}
local i=false
for t,e in ipairs(s)do
if f(e,a)then
i=true
break
end
end
if i then
z(#e==1)
z(t[2]==false)
local e=d(
e[1],
r(),
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
if f(a,Z)then
return o()
elseif f(a,_e)then
return o()
elseif f(a,ze)then
return o()
elseif f(a,J)then
z(#e==3)
z(t[2]==false)
local a=d(
e[1],
r(),
t
)
if t[2]then
return n(
O(J,{a,e[2],e[3]})
)
else
return k()
end
end
return k()
elseif P(e)then
return o()
elseif B(e)then
return o()
end
return k()
end
h[s]=true
l(a,e)
e=b(e)
end
return s(e)
end
function b(a)
local e=H(a)
local t
z(
not Y(e)
)
if W(e)then
t=wt(
te(e),
X(e),
a
)
elseif P(e)then
t=mt(
je(e),
ke(e),
ge(e),
a
)
elseif G(e)then
t=ct(
re(e),
le(e),
a
)
elseif B(e)then
t=lt(
we(e),
ye(e),
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
function Oe(e)
while v(e)or q(e)do
e=r(
ee(e)
)
end
return e
end
function pe(e)
while q(e)do
e=C(e)
end
e=b(e)
while q(e)do
e=C(e)
end
return e
end
function ot(e,r,d,u)
local h={}
local o={}
local e=H(e)
local t=true
while true do
if s(e)then
return u(o,h)
elseif q(e)then
l(
o,
he(e)
)
e=C(e)
elseif a(e)then
l(
h,
i(e)
)
e=n(e)
elseif v(e)then
if t then
t=false
e=b(e)
else
return d()
end
else
return r()
end
end
end
function w(e)
if ae(e)then
e=pe(e)
end
if ae(e)then
return nil
end
if m(e)then
return true
end
if not c(e)then
return false
end
local e=j(e)
if ae(e)then
e=pe(e)
end
if ae(e)then
return nil
end
if not m(e)then
return false
end
return S(e,oe)
end
function Fe(e)
if e[1]then
return pt(e[2])
end
return false
end
function tt(e,o,t)
e=Oe(e)
if m(e)then
l(
t,
"^",
U(e)
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
return k()
end
end
function Le(a)
local t={}
local e={}
for o,a in ipairs(a)do
tt(a,t,e)
end
return{e,t}
end
function Ie(a)
local t=Le(a[2])
local e=t[1]
local o=t[2]
local t={}
z(#e~=0)
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
function Te(e)
return{
true,
yt(e[2]),
nil
}
end
function me(t,a,o,e,i)
if#a==0 then
z(
Fe(t)or(t[1]==false and t[2].length==0)
)
e[1]=false
e[2]=a
e[3]=o
return Q(i)
end
if t[1]then
local t=Te(t)
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
local s=e
local e=Le(a)
local t=e[1]
local n=e[2]
local e=s
for t,a in ipairs(t)do
local t=nil
if e[2][a]~=nil then
local e=e[2][a]
if e[0]then
t=Te(e)
else
t=Ie(e)
end
else
t={true,{},nil}
end
z(t~=nil)
e[2][a]=t
e=t
end
if Fe(e)then
local e=e
e[1]=false
e[2]=n
e[3]=o
return Q(i)
else
return N(
function()return me(e,n,o,e,i)end
)
end
else
return N(
function()return me(
Ie(t),
a,
o,
e,
i
)end
)
end
return k()
end
function Ae(a,o,i)
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
function ft(t,a)
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
Me,
e(a)
)
end
function Ce(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function wt(o,t,d)
local h=b(t)
if v(h)then
return d
end
local function t()return g(
A,
e(
L,
e(
ze,
e(
D(o),
h
)
)
)
)end
if a(h)then
return ot(
h,
t,
function()return d end,
function(h,e)
if#h~=0 then
error("WIP")
end
if f(e[1],qe)then
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
return Se(o,i,a)
elseif f(e[1],it)then
if#e==1 then
return t()
end
local r=r(
R(o,e[2])
)
if not c(r)then
return t()
end
local h=b(
j(r)
)
if v(h)then
return d
end
if not m(h)then
return t()
end
if not S(h,x)then
return t()
end
local h=b(
E(r)
)
if v(h)then
return d
end
if not a(h)then
return t()
end
local i=i(h)
local a=b(
n(h)
)
if v(a)then
return d
end
if not s(a)then
return t()
end
local a={
D(o)
}
do
local t=2
while t<#e do
l(a,e[t+1])
t=t+1
end
end
return F(i,a)
elseif f(e[1],L)then
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
R(o,e[t+1])
)
t=t+1
end
end
return O(i,a)
else
local i=R(o,e[1])
local a={}
do
local t=1
while t<#e do
l(
a,
R(o,e[t+1])
)
t=t+1
end
end
return F(i,a)
end
end
)
elseif s(h)then
return h
end
local e=w(h)
if e==nil then
return d
end
if e==true then
return Ue(
o,
h,
t()
)
end
return t()
end
function lt(d,o,u)
local function l()return g(
A,
e(
L,
e(
_e,
e(
d,
T(o)
)
)
)
)end
d=b(d)
if v(d)then
return u
end
if not c(d)then
return l()
end
local e=r(
j(d)
)
if not(m(e)and S(e,t))then
return l()
end
local t=r(
E(d)
)
if not a(t)then
return l()
end
local e=V(
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
return l()
end
local d=i(t)
local r=De
local t=0
while not s(e)do
local s=w(e)
if s==nil then
return u
end
if s==true then
local a=y
do
local e=#o-1
while e>=t do
a=h(o[e+1],a)
e=e-1
end
end
r=Ae(r,e,a)
t=#o
e=y
elseif a(e)then
if t<#o then
local a=o[t+1]
t=t+1
r=Ae(
r,
i(e),
a
)
e=n(e)
else
return l()
end
else
return l()
end
end
if#o~=t then
return l()
end
return R(r,d)
end
function ct(i,t,o)
local function a()return g(
A,
e(
L,
e(
i,
T(t)
)
)
)end
for n,e in ipairs(ut)do
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
function mt(i,o,t,a)
local function a()return g(
A,
e(
qe,
e(
D(i),
o,
T(t)
)
)
)end
if f(o,Ve)then
if#t~=1 then
return a()
end
return t[1]
elseif f(o,at)then
if#t~=2 then
return a()
end
return dt(i,t[1],t[2],a)
elseif f(o,nt)then
if#t~=2 then
return a()
end
return se(
t[1],
R(i,t[2])
)
end
return a()
end
function fe(t)
return e(qe,Ve,t)
end
function dt(u,d,p,m)
d=He(d)
local r={}
local c=false
local o=d
while not s(o)do
local e=w(o)
z(e~=nil)
if e then
l(r,o)
c=true
o=y
elseif a(o)then
l(
r,
i(o)
)
o=n(o)
else
return m()
end
end
local o
if c then
o=T(r)
else
o=d
end
local a={}
Ce(
u,
function(t,e)
do
local e=0
while e<#r do
if f(r[e+1],t)then
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
fe(
ft(u,a[e+1])
),
o
)
e=e-1
end
end
return _(
t,
e(
d,
h(
fe(
_(
t,
e(i,p)
)
),
o
)
)
)
end
function u(e,t)
if e==t then
return true
end
e=r(e)
t=r(t)
if e==t then
return true
end
local function h(t,e,a,o)
local a=u(
a(t),
a(e)
)
local o=u(
o(t),
o(e)
)
if a==true and o==true then
I(t,e)
return true
elseif a~=false and o~=false then
return nil
else
return false
end
end
if q(e)then
local e=ee(e)
local e=u(e,t)
if e==true then
e=nil
end
return e
elseif q(t)then
local t=ee(t)
local e=u(e,t)
if e==true then
e=nil
end
return e
elseif s(e)then
if not s(t)then
return false
end
I(e,t)
return true
elseif m(e)then
if not m(t)then
return false
end
return S(e,t)
elseif a(e)then
if not a(t)then
return false
end
return h(e,t,i,n)
elseif c(e)then
if not c(t)then
return false
end
return h(e,t,j,E)
end
return k()
end
function f(e,t)
return u(e,t)~=false
end
function p(e)
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
p(
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
p(e)
)..")"
end
return t
elseif c(e)then
return"#"..tostring(
p(
h(
j(e),
E(e)
)
)
)
elseif m(e)then
return U(e)
elseif q(e)then
return";("..tostring(
p(
he(e)
)
).." "..tostring(
p(
C(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
p(
D(
te(e)
)
)
).." "..tostring(
p(
X(e)
)
)..")"
elseif G(e)then
return"%("..tostring(
p(
re(e)
)
).." "..tostring(
p(
T(
le(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
p(
D(
je(e)
)
)
).." "..tostring(
p(
ke(e)
)
).." "..tostring(
p(
T(
ge(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
p(
we(e)
)
).." "..tostring(
p(
T(
ye(e)
)
)
)..")"
end
return k()
end
function Q(e)
return function()return{false,e}end
end
function N(e)
return function()return{
true,
e()
}end
end
function ne(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
be=0
M=1
K=2
et=3
Ze=4
Je=5
xe=6
Ee=7
ue=8
ce=10
Xe=9
local function o(e)
return{be,e}
end
y={K}
local function Te(e)
local t=Oe(e)
local function o(e)
e[2]=V(e[2])
e[3]=V(e[3])
if q(e[2])or q(e[3])then
local t=st(e)
local o=e[2]
local a=e[3]
local e=Te(o)
local a=Te(a)
t[2]=e
t[3]=a
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
He=Te
A=o("太始初核")
oe=o("符名")
t=o("化滅")
x=o("式形")
local ft=o("等同")
local ct=o("解算")
local M=o("特定其物")
local w=o("省略一物")
Me=o("映表")
local ot=o("如若")
local u=o("一類何物")
local K=o("是非")
local Ee=o("其子")
local Je=o("爻陽")
local Xe=o("爻陰")
local tt=o("引用")
local dt=o("應用")
local lt=o("間空")
local ue=o("連頸")
local be=o("構物")
ht=o("謬誤")
local ht=o("詞素")
local Le=o("列序")
local et=o("首始")
local st=o("尾末")
local Ze=o("之物")
local d=o("宇宙亡矣")
local Fe=o("效應")
local Ie=o("註疏")
rt=g(
A,
e(d,w)
)
local function g(e)
return _(
oe,
h(
A,
h(e,y)
)
)
end
local function xe(a)
return g(
e(
u,
e(t,w,a),
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
w
),
o
)
)
end
local function ce(a)
return g(
e(
u,
t,
e(
K,
e(u,a,w)
)
)
)
end
local rt=xe(be)
Re=d(be,oe)
Pe=d(be,Le)
Ye=ce(be)
local mt=xe(ue)
Be=ce(ue)
Ke=d(ue,et)
Ge=d(ue,st)
Qe=ce(ht)
We=ce(lt)
Z=g(
e(
u,
t,
e(K,ft)
)
)
_e=g(
e(
u,
e(
t,
h(t,w),
w
),
dt
)
)
ze=g(
e(u,t,ct)
)
local Le=d(
Le,
e(u,Ze,w)
)
J=g(
e(u,t,ot)
)
Ve=g(
e(u,x,tt)
)
at=g(
e(
u,
e(
x,
e(t,w,t)
),
M
)
)
L=g(
e(
x,
e(A,t)
)
)
qe=g(
e(
x,
e(A,x)
)
)
it=g(
e(x,x)
)
local ot=g(
e(u,t,Ie)
)
nt=g(
e(u,x,Ie)
)
local d=_(
Xe,
e()
)
local ce=_(
Je,
e()
)
local function be(e,o,h)
local t={}
while a(e)do
l(
t,
i(e)
)
e=n(e)
end
if s(e)then
return o(t)
end
return h(t,e)
end
local function L(e)
return be(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function at(e)
while Y(e)or q(e)do
e=H(
ee(e)
)
end
return e
end
local function Ie(e)
if W(e)then
return e
elseif P(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return k()
end
local function Ve(e)
return te(
Ie(e)
)
end
local function et(e)
return X(
Ie(e)
)
end
local function tt(e)
if q(e)then
return C(e)
else
return b(e)
end
end
local function qe()
return{true,{},nil}
end
local xe=qe()
local function xe(o,t,a)
local e=qe()
return ne(
me(o,{t},a,e,e)
)
end
De={}
local function me(t)
t=r(t)
if not c(t)then
return false
end
local e=r(
j(t)
)
if not m(e)then
return false
end
if not S(e,Me)then
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
local t=i(e)
if not s(
r(
n(e)
)
)then
return false
end
local a=true
do
local e=0
while e<#o do
if f(o[(e+0)+1],h)then
o[(e+1)+1]=t
a=false
break
end
e=e+2
end
end
if a then
l(o,h,t)
end
end
return o
end
local function xe(t,a)
return{
t,
1,
function(e)
e=b(e)
if v(e)then
return O(t,{e})
end
if a(e)then
return ce
end
return d
end
}
end
local function qe(t,i,o)
return{
t,
1,
function(e,a)
e=b(e)
if v(e)then
return O(t,{e})
end
if i(e)then
return o(e)
end
return a()
end
}
end
ut={
xe(Ye,c),
{rt,2,_},
qe(Re,c,j),
qe(Pe,c,E),
xe(We,s),
{mt,2,h},
xe(Be,a),
qe(Ke,a,i),
qe(Ge,a,n),
{
Z,
2,
function(e,t,o)
if e==t then
return ce
end
e=b(e)
t=b(t)
if v(e)or v(t)then
return O(Z,{e,t})
end
if e==t then
return ce
end
local function o(e,a,t)
return O(J,{e,a,t})
end
local function h(e,t)
return o(e,t,d)
end
z(
not v(e)
)
local function o(a,o,t,e)
return h(
O(
Z,
{
t(a),
t(o)
}
),
O(
Z,
{
e(a),
e(o)
}
)
)
end
if s(e)then
if not s(e)then
return d
end
return ce
elseif m(e)then
if not m(t)then
return d
end
if S(e,t)then
return ce
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
return k()
end
},
{
_e,
2,
function(o,e,h)
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
return h()
end
return F(o,t)
end
},
{
ze,
2,
function(e,t,a)
local e=me(e)
if e==false then
return a()
end
return R(e,t)
end
},
xe(Qe,m),
{
Le,
1,
function(e,t)
e=b(e)
if v(e)then
return O(Le,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
J,
3,
function(e,a,o,t)
e=b(e)
if v(e)then
return O(J,{e,a,o})
end
if not c(e)then
return t()
end
local e=r(
j(e)
)
if not m(e)then
return t()
end
if S(e,Je)then
return a
end
if S(e,Xe)then
return o
end
return t()
end
},
{ot,2,se}
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
local function o(e,t,o,a)
if d(
o(e),
o(t)
)and d(
a(e),
a(t)
)then
I(e,t)
return true
else
return false
end
end
if s(e)then
if not s(t)then
return false
end
I(e,y)
I(t,y)
return true
elseif m(e)then
if not m(t)then
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
elseif ie(e)then
return false
end
return k()
end
local function J(Q)
local Y,v,c,d,f,r,j,E,V,b,S,C,U,L,D,W,H,N,q,I,k,p,P,B,G
function c()
return#Y==v
end
function d()
z(
not c()
)
local e=string.sub(Y,v+1,v+1)
v=v+1
return e
end
function f(e)
z(
string.sub(Y,v,v)==e
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
function E()
if c()then
return false
end
local e=d()
if not j(e)then
f(e)
return false
end
while j(e)and not c()do
e=d()
end
if not j(e)then
f(e)
end
return true
end
function V()
if c()then
return false
end
local e=d()
local t=""
if not H(e)then
f(e)
return false
end
while H(e)and not c()do
t=tostring(t)..tostring(e)
e=d()
end
if H(e)then
t=tostring(t)..tostring(e)
else
f(e)
end
return o(t)
end
function b()
if c()then
return false
end
local e=d()
if e~="("then
f(e)
return false
end
local t=ve()
local a=t
local function i(a)
local e=ve()
de(
t,
h(a,e)
)
t=e
end
while true do
E()
if c()then
return r()
end
e=d()
if e==")"then
de(t,y)
return a
end
if e=="."then
E()
local o=N()
de(t,o)
E()
if c()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
f(e)
local e=N()
i(e)
end
end
function S()
if c()then
return false
end
local e=d()
if e~="#"then
f(e)
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
function H(e)
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
function N()
E()
local e={b,G,S,C,U,L,D,W}
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
function I()
return not c()
end
function k(e)
q(
I()
)
q(
d()==e
)
end
function p(e)
if e==nil then
e=false
end
local function a()
k("[")
local e=p()
k("]")
return e
end
local t
if e then
t={b,V,a,S,C,U,L,D,W}
else
t={b,B,S,C,U,L,D,W}
end
for t,e in ipairs(t)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function P(a)
if c()then
return a
end
local o=d()
if o=="."then
local o=p()
return e(
u,
e(
t,
e(a),
w
),
o
)
elseif o==":"then
local t=p()
return e(u,t,a)
elseif o=="~"then
return e(K,a)
elseif o=="@"then
local o=p()
return e(
u,
e(
t,
h(a,w),
w
),
o
)
elseif o=="?"then
return e(
u,
t,
e(K,a)
)
elseif o=="/"then
local t={a}
while true do
local e=p(true)
l(t,e)
if c()then
break
end
local e=d()
if e~="/"then
f(e)
break
end
end
return e(
Ee,
T(t)
)
else
f(o)
return a
end
end
function B()
if c()then
return false
end
local a=d()
if a=="&"then
q(
I()
)
local t=d()
if t=="+"then
local t=p()
return e(
x,
e(A,t)
)
else
f(t)
end
local t=p()
return e(x,t)
elseif a==":"then
q(
I()
)
local a=d()
if a=="&"then
k(">")
local a=p()
return e(
u,
e(
x,
e(t,w,a)
),
M
)
elseif a==">"then
local a=p()
return e(
u,
e(t,w,a),
M
)
else
f(a)
end
local t=p()
return e(u,t,M)
elseif a=="+"then
local t=p()
return e(A,t)
elseif a=="["then
local e=p()
k("]")
return P(e)
elseif a=="_"then
k(":")
local t=p()
return e(u,t,w)
else
f(a)
local e=V()
if e==false then
return false
end
return P(e)
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
return g(e)
end
Y=Q
v=0
local function t(t,o)
return function()
if c()then
return false
end
local e=d()
if e~=t then
f(e)
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
local function h(t,h)
return function()
if c()then
return false
end
local e=d()
if e~=t then
f(e)
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
C=t(
"$",
function(e,t)
local e=me(e)
if e==false then
return r()
end
return R(e,t)
end
)
U=t(
"%",
function(e,t)
local t=be(
t,
function(e)return e end,
function(e,e)return r()end
)
return O(e,t)
end
)
L=h(
"@",
function(a,o,e)
local t=be(
e,
function(e)return e end,
function(e,e)return r()end
)
local e=me(a)
if e==false then
return r()
end
return Se(e,o,t)
end
)
D=t(
"^",
function(t,e)
local e=be(
e,
function(e)return e end,
function(e,e)return r()end
)
return F(t,e)
end
)
W=t(
";",
function(t,e)return se(t,e)end
)
return N()
end
local function z(f)
local function o(r,l)
if m(r)then
return U(r)
end
local function h(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(r)
if e~=false and#e==3 and d(e[1],u)then
local s=L(e[2])
if s~=false and#s==3 and d(s[1],t)then
local t=s[2]
local r=L(t)
if r~=false and#r==1 and d(s[3],w)then
return h(
tostring(
o(r[1],true)
).."."..tostring(
o(e[3],true)
)
)
elseif a(t)and d(
n(t),
w
)and d(s[3],w)then
return h(
tostring(
o(
i(t),
true
)
).."@"..tostring(
o(e[3],true)
)
)
elseif d(t,w)and d(e[3],M)then
return h(
":>"..tostring(
o(s[3],true)
)
)
end
end
local a=L(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],K)then
return h(
tostring(
o(a[2],true)
).."?"
)
end
if s~=false and#s==2 and d(e[3],M)and d(s[1],x)then
local e=L(s[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],w)then
return h(
":&>"..tostring(
o(e[3],true)
)
)
end
end
local t
if d(e[3],w)then
t="_"
elseif d(e[3],M)then
t=""
else
t=o(e[3],true)
end
return h(
tostring(t)..":"..tostring(
o(e[2],true)
)
)
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=L(e[2])
if t~=false and#t==2 and d(t[1],A)then
return h(
"&+"..tostring(
o(t[2],true)
)
)
end
return h(
"&"..tostring(
o(e[2],true)
)
)
elseif d(e[1],K)then
return h(
tostring(
o(e[2],true)
).."~"
)
elseif d(e[1],A)then
return h(
"+"..tostring(
o(e[2],true)
)
)
elseif d(e[1],Ee)then
local e=L(e[2])
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
return h(a)
end
end
end
if l then
return p(r)
else
return p(
g(r)
)
end
end
local e=J(
p(f)
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
local e=L(a)
if e~=false and#e==2 and d(t,oe)and d(e[1],A)then
return o(e[2],false)
end
return"#"..tostring(
z(
h(t,a)
)
)
elseif m(e)then
return U(e)
elseif q(e)then
return";("..tostring(
z(
he(e)
)
).." "..tostring(
z(
C(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
z(
D(
te(e)
)
)
).." "..tostring(
z(
X(e)
)
)..")"
elseif G(e)then
return"%("..tostring(
z(
re(e)
)
).." "..tostring(
z(
T(
le(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
z(
D(
je(e)
)
)
).." "..tostring(
z(
ke(e)
)
).." "..tostring(
z(
T(
ge(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
z(
we(e)
)
).." "..tostring(
z(
T(
ye(e)
)
)
)..")"
end
return k()
end
local function A(i)
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
local o=table.remove(e)
local t=table.remove(e)
if t==nil or o==nil then
return a()
else
return Ne(
e,
i(t,o)
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
local e=me(e)
if e==false then
return a()
else
return R(e,t)
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
local function x(e)
local h={e}
local t=""
while#h~=0 do
local r={}
for o,e in ipairs(h)do
e=H(e)
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
U(e)
).."^")
)
elseif a(e)then
o(e,".",i,n)
elseif s(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
o(e,"#",j,E)
elseif ie(e)then
local e=Ie(e)
o(
e,
"$",
(function(e)return D(
te(e)
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
local k=g(
h(
Ee,
h(
h(
Fe,
h(
h(
u,
h(
Ze,
h(w,y)
)
),
y
)
),
y
)
)
)
local g=g(
h(
Ee,
h(
h(
Fe,
h(ue,y)
),
y
)
)
)
local function I(a,t)
return _(
g,
e(a,t)
)
end
local function O(e)
return _(k,e)
end
local function u(y,w,l,m,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
l=r(l)
if c(l)then
local c=j(l)
local h=E(l)
if f(c,k)then
h=r(h)
if a(h)then
local a=i(h)
local e=r(
n(h)
)
if s(e)then
if d==false then
local a=a
local e=m
local function t()return y(a,e)end
return N(t)
else
local t
t=y
local e
e=w
local i=a
local a=m
local function o()return u(
t,
e,
F(d,i),
a
)end
return N(o)
end
end
end
elseif f(c,g)then
h=r(h)
if a(h)then
local c=i(h)
local h=r(
n(h)
)
if a(h)then
local l=i(h)
local a=r(
n(h)
)
if s(a)then
if d==false then
local e
e=y
local t
t=w
local a=c
local o=l
local n=m
local function i()return u(e,t,a,n,o)end
return N(i)
else
local i
i=y
local a
a=w
local s=c
local n=l
local r=m
local h=d
local o=o("序甲")
local function d()return u(
i,
a,
s,
r,
_(
t,
e(
e(o),
p(
e(
fe(n),
o
),
fe(h)
)
)
)
)end
return N(d)
end
end
end
end
end
end
if d==false then
return N(
function()return w(l,m,y)end
)
else
return N(
function()return w(
l,
m,
function(t,e)return N(
function()return u(
y,
w,
F(d,{t}),
e
)end
)end
)end
)
end
end
local function l(a,o,t,e)
return u(a,o,t,e)
end
local function d(o,e,t,a)
return ne(
u(
(function(e,t)return Q(
o(e,t)
)end),
(function(t,a,o)return Q(
e(
t,
a,
function(e,t)return ne(
o(e,t)
)end
)
)end),
t,
a
)
)
end
local t={}
t.new_comment=se
t.comment_p=q
t.comment_comment=he
t.comment_x=C
t.un_comment_all=ee
t.new_atom=o
t.atom_p=m
t.un_atom=U
t.atom_equal_p=S
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=y
t.null_p=s
t.new_data=_
t.data_p=c
t.data_name=j
t.data_list=E
t.just_p=Y
t.evaluate=R
t.apply=F
t.force_all_rec=V
t.force_uncomment_all_rec=Te
t.unlazy_all_rec=He
t.jsArray_to_list=T
t.maybe_list_to_jsArray=L
t.new_list=e
t.un_just_all=H
t.un_just_comment_all=at
t.delay_p=ie
t.delay_just_p=v
t.lazy_p=ae
t.delay_env=Ve
t.delay_x=et
t.force_all=r
t.force1=b
t.force_uncomment1=tt
t.force_uncomment_all=Oe
t.unlazy1=pe
t.env_null_v=De
t.env_set=Ae
t.env_get=Ue
t.env2val=D
t.env_foreach=Ce
t.val2env=me
t.equal_p=f
t.simple_print=p
t.complex_parse=J
t.complex_print=z
t.machinetext_parse=A
t.machinetext_print=x
t.trampoline_return=Q
t.trampoline_delay=N
t.run_trampoline=ne
t.return_effect_systemName=k
t.bind_effect_systemName=g
t.new_effect_bind=I
t.new_effect_return=O
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
