local function v(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ie(t,...)
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
local x,O,G,te,pe,ce,oe,be,Pe,Ve,Be,Ee,ze,de,k,ie,L,Z,p,C,I,s,a,i,n,f,h,z,u,_,A,B,ht,H,W,X,ee,He,P,ge,je,ke,q,Y,se,ue,M,F,qe,_e,V,Oe,xe,o,S,ne,tt,T,re,t,j,Fe,Qe,et,Me,We,Ce,Ue,Re,De,Le,Ye,J,fe,we,Q,ve,Je,D,ae,at,Ge,g,E,e,N,le,y,K,d,b,r,Ne,ye,Xe,U,Ae,me,Te,Ze,R,Se,l,Ke,it,ot,nt,he,st,m,c,w
function x()
error("TheLanguage PANIC")
end
function O(e)
if not e then
return x()
end
end
function de(t,e)
return{Ee,t,e}
end
function k(e)
return e[1]==Ee
end
function ie(e)
return e[2]
end
function L(e)
return e[3]
end
function Z(e)
while k(e)do
e=L(e)
end
return e
end
function p(e)
return e[1]==G
end
function C(e)
return e[2]
end
function I(e,t)
if e==t then
return true
end
if C(e)==C(t)then
S(e,t)
return true
else
return false
end
end
function s(t,e)
return{te,t,e}
end
function a(e)
return e[1]==te
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function h(e)
return e[1]==pe
end
function z(t,e)
return{ce,t,e}
end
function u(e)
return e[1]==ce
end
function _(e)
return e[2]
end
function A(e)
return e[3]
end
function B(e)
return e[1]==oe
end
function ht(e)
return e[2]
end
function H(e,t)
return{be,e,t}
end
function W(e)
return e[1]==be
end
function X(e)
return e[2]
end
function ee(e)
return e[3]
end
function He(t,a,e)
return{Ve,t,a,e}
end
function P(e)
return e[1]==Ve
end
function ge(e)
return e[2]
end
function je(e)
return e[3]
end
function ke(e)
return e[4]
end
function q(t,e)
return{Pe,t,e}
end
function Y(e)
return e[1]==Pe
end
function se(e)
return e[2]
end
function ue(e)
return e[3]
end
function M(t,e)
return{Be,t,e}
end
function F(e)
return e[1]==Be
end
function qe(e)
return e[2]
end
function _e(e)
return e[3]
end
function V(e)
local e=r(e)
local function t(e)
e[2]=V(e[2])
e[3]=V(e[3])
return e
end
if u(e)then
return t(e)
elseif a(e)then
return t(e)
elseif k(e)then
return t(e)
end
return e
end
function xe()
return{ze}
end
function o(e)
return e[1]==ze
end
function S(e,t)
if e==t then
return
end
if e==f then
e=t
t=f
end
e[1]=oe
e[2]=t
e[3]=false
e[4]=false
end
function ne(e,t)
O(
o(e)
)
O(
not o(t)
)
local e=e
local t=t
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
e[4]=t[4]
end
function tt(t)
local e=xe()
ne(e,t)
return e
end
function g(t,e)
return z(
Qe,
s(
t,
s(e,f)
)
)
end
function E(a)
local t=f
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
function N(e)
if not B(e)then
return e
end
local e=e
local t={}
while B(e)do
v(t,e)
e=ht(e)
end
for a,t in ipairs(t)do
S(t,e)
end
return e
end
function le(e)
return W(e)or P(e)or Y(e)or F(e)
end
function y(e)
return B(e)or le(e)
end
function K(e)
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
if y(t)then
v(a,e)
return d(t,i,{false,false},a)
end
return t
end
local h={}
e=o
local function o()
t[2]=true
return n(et)
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
while y(e)and t<32 do
v(a,e)
e=b(e)
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
if W(e)then
return o()
elseif Y(e)then
local a=se(e)
local e=ue(e)
local s={Me,We,Ce,Ue,Re,De,Le,Ye}
local i=false
for t,e in ipairs(s)do
if c(e,a)then
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
q(a,{e})
)
else
return x()
end
end
if c(a,J)then
return o()
elseif c(a,fe)then
return o()
elseif c(a,we)then
return o()
elseif c(a,Q)then
O(#e==3)
O(t[2]==false)
local a=d(
e[1],
r(),
t
)
if t[2]then
return n(
q(Q,{a,e[2],e[3]})
)
else
return x()
end
end
return x()
elseif P(e)then
return o()
elseif F(e)then
return o()
end
return x()
end
h[s]=true
v(a,e)
e=b(e)
end
return s(e)
end
function b(a)
local e=N(a)
local t
O(
not B(e)
)
if W(e)then
t=l(
X(e),
ee(e),
a
)
elseif P(e)then
t=nt(
ge(e),
je(e),
ke(e),
a
)
elseif Y(e)then
t=ot(
se(e),
ue(e),
a
)
elseif F(e)then
t=it(
qe(e),
_e(e),
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
function Ne(e)
while y(e)or k(e)do
e=r(
Z(e)
)
end
return e
end
function ye(e)
while k(e)do
e=L(e)
end
e=b(e)
while k(e)do
e=L(e)
end
return e
end
function Xe(e,r,d,l)
local t={}
local s={}
local e=N(e)
local o=true
while true do
if h(e)then
return l(s,t)
elseif k(e)then
v(
s,
ie(e)
)
e=L(e)
elseif a(e)then
v(
t,
i(e)
)
e=n(e)
elseif y(e)then
if o then
o=false
e=b(e)
else
return d()
end
else
return r()
end
end
end
function U(e)
if K(e)then
e=ye(e)
end
if K(e)then
return nil
end
if p(e)then
return true
end
if not u(e)then
return false
end
local e=_(e)
if K(e)then
e=ye(e)
end
if K(e)then
return nil
end
if not p(e)then
return false
end
return I(e,re)
end
function me(a,o,i)
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
function Te(t,o,a)
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
function Ze(t,a)
do
local e=0
while e<#t do
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return x()
end
function R(a)
local o=f
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
return z(
Fe,
e(o)
)
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
function l(s,t,d)
local o=b(t)
if y(o)then
return d
end
local function t()return g(
T,
e(
D,
e(
we,
e(
R(s),
o
)
)
)
)end
if a(o)then
return Xe(
o,
t,
function()return d end,
function(o,e)
if#o~=0 then
error("WIP")
end
if c(e[1],ae)then
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
return He(s,o,a)
elseif c(e[1],at)then
if#e==1 then
return t()
end
local o=r(
H(s,e[2])
)
if not u(o)then
return t()
end
local r=b(
_(o)
)
if y(r)then
return d
end
if not p(r)then
return t()
end
if not I(r,j)then
return t()
end
local o=b(
A(o)
)
if y(o)then
return d
end
if not a(o)then
return t()
end
local i=i(o)
local a=b(
n(o)
)
if y(a)then
return d
end
if not h(a)then
return t()
end
local a={
R(s)
}
do
local t=2
while t<#e do
v(a,e[t+1])
t=t+1
end
end
return M(i,a)
elseif c(e[1],D)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
v(
a,
H(s,e[t+1])
)
t=t+1
end
end
return q(o,a)
else
local o=H(s,e[1])
local a={}
do
local t=1
while t<#e do
v(
a,
H(s,e[t+1])
)
t=t+1
end
end
return M(o,a)
end
end
)
elseif h(o)then
return o
end
local e=U(o)
if e==nil then
return d
end
if e==true then
return Te(
s,
o,
t()
)
end
return t()
end
function it(o,d,c)
local function l()return g(
T,
e(
D,
e(
fe,
e(
o,
E(d)
)
)
)
)end
o=b(o)
if y(o)then
return c
end
if not u(o)then
return l()
end
local e=r(
_(o)
)
if not(p(e)and I(e,t))then
return l()
end
local t=r(
A(o)
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
if not(a(t)and h(
r(
n(t)
)
))then
return l()
end
local r=i(t)
local o=Ae
local t=0
while not h(e)do
local h=U(e)
if h==nil then
return c
end
if h==true then
local a=f
do
local e=#d-1
while e>=t do
a=s(d[e+1],a)
e=e-1
end
end
o=me(o,e,a)
t=#d
e=f
elseif a(e)then
if t<#d then
local a=d[t+1]
t=t+1
o=me(
o,
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
if#d~=t then
return l()
end
return H(o,r)
end
function ot(i,t,o)
local function a()return g(
T,
e(
D,
e(
i,
E(t)
)
)
)end
for n,e in ipairs(Ke)do
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
return x()
end
end
return a()
end
function nt(i,o,t,a)
local function a()return g(
T,
e(
ae,
e(
R(i),
o,
E(t)
)
)
)end
if c(o,ve)then
if#t~=1 then
return a()
end
return t[1]
elseif c(o,Je)then
if#t~=2 then
return a()
end
return st(i,t[1],t[2],a)
elseif c(o,Ge)then
if#t~=2 then
return a()
end
return de(
t[1],
H(i,t[2])
)
end
return a()
end
function he(t)
return e(ae,ve,t)
end
function st(l,r,w,m)
r=Oe(r)
local d={}
local u=false
local o=r
while not h(o)do
local e=U(o)
O(e~=nil)
if e then
v(d,o)
u=true
o=f
elseif a(o)then
v(
d,
i(o)
)
o=n(o)
else
return m()
end
end
local o
if u then
o=E(d)
else
o=r
end
local a={}
Se(
l,
function(t,e)
do
local e=0
while e<#d do
if c(d[e+1],t)then
return
end
e=e+1
end
end
v(a,t)
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
he(
Ze(l,a[e+1])
),
o
)
e=e-1
end
end
return z(
t,
e(
r,
s(
he(
z(
t,
e(i,w)
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
t=r(t)
e=r(e)
if t==e then
return true
end
local function o(e,t,a,o)
local i=m(
a(e),
a(t)
)
local a=m(
o(e),
o(t)
)
if i==true and a==true then
S(e,t)
return true
elseif i~=false and a~=false then
return nil
else
return false
end
end
if k(t)then
local t=Z(t)
local e=m(t,e)
if e==true then
e=nil
end
return e
elseif k(e)then
local e=Z(e)
local e=m(t,e)
if e==true then
e=nil
end
return e
elseif h(t)then
if not h(e)then
return false
end
S(t,e)
return true
elseif p(t)then
if not p(e)then
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
return o(t,e,_,A)
end
return x()
end
function c(t,e)
return m(t,e)~=false
end
function w(e)
e=N(e)
local t=""
local o=""
if h(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(
w(
i(e)
)
)
o=" "
e=N(
n(e)
)
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
w(e)
)..")"
end
return t
elseif u(e)then
return"#"..tostring(
w(
s(
_(e),
A(e)
)
)
)
elseif p(e)then
return C(e)
elseif k(e)then
return";("..tostring(
w(
ie(e)
)
).." "..tostring(
w(
L(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
w(
R(
X(e)
)
)
).." "..tostring(
w(
ee(e)
)
)..")"
elseif Y(e)then
return"%("..tostring(
w(
se(e)
)
).." "..tostring(
w(
E(
ue(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
w(
R(
ge(e)
)
)
).." "..tostring(
w(
je(e)
)
).." "..tostring(
w(
E(
ke(e)
)
)
)..")"
elseif F(e)then
return"^("..tostring(
w(
qe(e)
)
).." "..tostring(
w(
E(
_e(e)
)
)
)..")"
end
return x()
end
G=0
te=1
pe=2
ce=3
oe=4
be=5
Pe=6
Ve=7
Be=8
Ee=10
ze=9
local function o(e)
return{G,e}
end
f={pe}
local function ce(e)
local t=Ne(e)
local function o(e)
e[2]=V(e[2])
e[3]=V(e[3])
if k(e[2])or k(e[3])then
local t=tt(e)
local a=e[2]
local e=e[3]
local a=ce(a)
local e=ce(e)
t[2]=a
t[3]=e
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
Oe=ce
T=o("太始初核")
re=o("符名")
t=o("化滅")
j=o("式形")
local Ze=o("等同")
local tt=o("解算")
local U=o("特定其物")
local m=o("省略一物")
Fe=o("映表")
local ot=o("如若")
local l=o("一類何物")
local G=o("是非")
local ze=o("其子")
local Ve=o("爻陽")
local Pe=o("爻陰")
local rt=o("引用")
local ht=o("應用")
local st=o("間空")
local te=o("連頸")
local pe=o("構物")
Qe=o("謬誤")
local it=o("詞素")
local be=o("列序")
local lt=o("首始")
local dt=o("尾末")
local Be=o("之物")
local d=o("宇宙亡矣")
local Xe=o("效應")
local Ee=o("註疏")
et=g(
T,
e(d,m)
)
local function g(e)
return z(
re,
s(
T,
s(e,f)
)
)
end
local function Qe(a)
return g(
e(
l,
e(t,m,a),
U
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
m
),
o
)
)
end
local function oe(a)
return g(
e(
l,
t,
e(
G,
e(l,a,m)
)
)
)
end
local et=Qe(pe)
Me=d(pe,re)
We=d(pe,be)
Ce=oe(pe)
local nt=Qe(te)
Ue=oe(te)
Re=d(te,lt)
De=d(te,dt)
Le=oe(it)
Ye=oe(st)
J=g(
e(
l,
t,
e(G,Ze)
)
)
fe=g(
e(
l,
e(
t,
s(t,m),
m
),
ht
)
)
we=g(
e(l,t,tt)
)
local Qe=d(
be,
e(l,Be,m)
)
Q=g(
e(l,t,ot)
)
ve=g(
e(l,j,rt)
)
Je=g(
e(
l,
e(
j,
e(t,m,t)
),
U
)
)
D=g(
e(
j,
e(T,t)
)
)
ae=g(
e(
j,
e(T,j)
)
)
at=g(
e(j,j)
)
local Ze=g(
e(l,t,Ee)
)
Ge=g(
e(l,j,Ee)
)
local d=z(
Pe,
e()
)
local oe=z(
Ve,
e()
)
local function be(e,o,s)
local t={}
while a(e)do
v(
t,
i(e)
)
e=n(e)
end
if h(e)then
return o(t)
end
return s(t,e)
end
local function D(e)
return be(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function Je(e)
while B(e)or k(e)do
e=N(
Z(e)
)
end
return e
end
local function Ee(e)
if W(e)then
return e
elseif P(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif F(e)then
error("WIP")
end
return x()
end
local function Ge(e)
return X(
Ee(e)
)
end
local function tt(e)
return ee(
Ee(e)
)
end
local function at(e)
if k(e)then
return L(e)
else
return b(e)
end
end
local ae={nil}
local function ae(e,e)
error("WIP")
end
local function pe(a)
local t={}
local e={}
for o,a in ipairs(a)do
local t=ae(a,t)
v(e,t)
end
return{e,t}
end
local function ae(e,e,e)
error("WIP")
end
Ae={}
local function ae(t)
t=r(t)
if not u(t)then
return false
end
local e=r(
_(t)
)
if not p(e)then
return false
end
if not I(e,Fe)then
return false
end
e=r(
A(t)
)
if not a(e)then
return false
end
if not h(
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
while not h(o)do
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
if not h(
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
if c(t[(e+0)+1],o)then
t[(e+1)+1]=a
i=false
break
end
e=e+2
end
end
if i then
v(t,o)
v(t,a)
end
end
return t
end
local function pe(t,a)
return{
t,
1,
function(e)
e=b(e)
if y(e)then
return q(t,{e})
end
if a(e)then
return oe
end
return d
end
}
end
local function ve(t,o,a)
return{
t,
1,
function(e,i)
e=b(e)
if y(e)then
return q(t,{e})
end
if o(e)then
return a(e)
end
return i()
end
}
end
Ke={
pe(Ce,u),
{et,2,z},
ve(Me,u,_),
ve(We,u,A),
pe(Ye,h),
{nt,2,s},
pe(Ue,a),
ve(Re,a,i),
ve(De,a,n),
{
J,
2,
function(e,t,o)
if e==t then
return oe
end
e=b(e)
t=b(t)
if y(e)or y(t)then
return q(J,{e,t})
end
if e==t then
return oe
end
local function o(a,t,e)
return q(Q,{a,t,e})
end
local function r(t,e)
return o(t,e,d)
end
O(
not y(e)
)
local function s(a,e,t,o)
return r(
q(
J,
{
t(a),
t(e)
}
),
q(
J,
{
o(a),
o(e)
}
)
)
end
if h(e)then
if not h(e)then
return d
end
return oe
elseif p(e)then
if not p(t)then
return d
end
if I(e,t)then
return oe
else
return d
end
elseif u(e)then
if not u(t)then
return d
end
return s(e,t,_,A)
elseif a(e)then
if not a(t)then
return d
end
return s(e,t,i,n)
end
return x()
end
},
{
fe,
2,
function(o,e,s)
local t={}
local e=r(e)
while a(e)do
v(
t,
i(e)
)
e=r(
n(e)
)
end
if not h(e)then
return s()
end
return M(o,t)
end
},
{
we,
2,
function(e,t,a)
local e=ae(e)
if e==false then
return a()
end
return H(e,t)
end
},
pe(Le,p),
{
Qe,
1,
function(e,t)
e=b(e)
if y(e)then
return q(Qe,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
Q,
3,
function(e,o,a,t)
e=b(e)
if y(e)then
return q(Q,{e,o,a})
end
if not u(e)then
return t()
end
local e=r(
_(e)
)
if not p(e)then
return t()
end
if I(e,Ve)then
return o
end
if I(e,Pe)then
return a
end
return t()
end
},
{Ze,2,de}
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
local function o(e,t,a,o)
if d(
a(e),
a(t)
)and d(
o(e),
o(t)
)then
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
S(e,f)
S(t,f)
return true
elseif p(e)then
if not p(t)then
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
return o(e,t,_,A)
elseif le(e)then
return false
end
return x()
end
local function Q(Q)
local W,y,u,d,c,r,_,x,B,b,I,N,Y,S,C,F,L,R,A,D,k,w,V,P,K
function u()
return#W==y
end
function d()
O(
not u()
)
local e=string.sub(W,y+1,y+1)
y=y+1
return e
end
function c(e)
O(
string.sub(W,y,y)==e
)
y=y-1
end
function r(e)
if e==nil then
e=""
end
error(
"TheLanguage parse ERROR!"..tostring(e)
)
end
function _(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function x()
if u()then
return false
end
local e=d()
if not _(e)then
c(e)
return false
end
while _(e)and not u()do
e=d()
end
if not _(e)then
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
if not L(e)then
c(e)
return false
end
while L(e)and not u()do
t=tostring(t)..tostring(e)
e=d()
end
if L(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
return o(t)
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
local t=xe()
local a=t
local function i(a)
local e=xe()
ne(
t,
s(a,e)
)
t=e
end
while true do
x()
if u()then
return r()
end
e=d()
if e==")"then
ne(t,f)
return a
end
if e=="."then
x()
local o=R()
ne(t,o)
x()
if u()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
c(e)
local e=R()
i(e)
end
end
function I()
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
return r()
end
if not a(e)then
return r()
end
return z(
i(e),
n(e)
)
end
function L(e)
if _(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function R()
x()
local e={b,K,I,N,Y,S,C,F}
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
function D()
return not u()
end
function k(e)
A(
D()
)
A(
d()==e
)
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
e={b,B,a,I,N,Y,S,C,F}
else
e={b,P,I,N,Y,S,C,F}
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
local o=w()
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
local t=w()
return e(l,t,a)
elseif o=="~"then
return e(G,a)
elseif o=="@"then
local o=w()
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
e(G,a)
)
elseif o=="/"then
local t={a}
while true do
local e=w(true)
v(t,e)
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
ze,
E(t)
)
else
c(o)
return a
end
end
function P()
if u()then
return false
end
local a=d()
if a=="&"then
A(
D()
)
local t=d()
if t=="+"then
local t=w()
return e(
j,
e(T,t)
)
else
c(t)
end
local t=w()
return e(j,t)
elseif a==":"then
A(
D()
)
local a=d()
if a=="&"then
k(">")
local a=w()
return e(
l,
e(
j,
e(t,m,a)
),
U
)
elseif a==">"then
local a=w()
return e(
l,
e(t,m,a),
U
)
else
c(a)
end
local t=w()
return e(l,t,U)
elseif a=="+"then
local t=w()
return e(T,t)
elseif a=="["then
local e=w()
k("]")
return V(e)
elseif a=="_"then
k(":")
local t=w()
return e(l,t,m)
else
c(a)
local e=B()
if e==false then
return false
end
return V(e)
end
end
function K()
local e=P()
if e==false then
return false
end
if p(e)then
return e
end
return g(e)
end
W=Q
y=0
local function t(t,o)
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
return r()
end
if not a(e)then
return r()
end
local t=n(e)
if not(a(t)and h(
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
if not(a(o)and h(
n(o)
))then
return r()
end
return s(
i(e),
i(t),
i(o)
)
end
end
N=t(
"$",
function(e,t)
local e=ae(e)
if e==false then
return r()
end
return H(e,t)
end
)
Y=t(
"%",
function(t,e)
local e=be(
e,
function(e)return e end,
function(e,e)return r()end
)
return q(t,e)
end
)
S=l(
"@",
function(e,t,a)
local a=be(
a,
function(e)return e end,
function(e,e)return r()end
)
local e=ae(e)
if e==false then
return r()
end
return He(e,t,a)
end
)
C=t(
"^",
function(e,t)
local t=be(
t,
function(e)return e end,
function(e,e)return r()end
)
return M(e,t)
end
)
F=t(
";",
function(e,t)return de(e,t)end
)
return R()
end
local function q(c)
local function o(r,u)
if p(r)then
return C(r)
end
local function h(e)
if u then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and d(e[1],l)then
local s=D(e[2])
if s~=false and#s==3 and d(s[1],t)then
local t=s[2]
local r=D(t)
if r~=false and#r==1 and d(s[3],m)then
return h(
tostring(
o(r[1],true)
).."."..tostring(
o(e[3],true)
)
)
elseif a(t)and d(
n(t),
m
)and d(s[3],m)then
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
elseif d(t,m)and d(e[3],U)then
return h(
":>"..tostring(
o(s[3],true)
)
)
end
end
local a=D(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],G)then
return h(
tostring(
o(a[2],true)
).."?"
)
end
if s~=false and#s==2 and d(e[3],U)and d(s[1],j)then
local e=D(s[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],m)then
return h(
":&>"..tostring(
o(e[3],true)
)
)
end
end
local t
if d(e[3],m)then
t="_"
elseif d(e[3],U)then
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
if d(e[1],j)then
local t=D(e[2])
if t~=false and#t==2 and d(t[1],T)then
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
elseif d(e[1],G)then
return h(
tostring(
o(e[2],true)
).."~"
)
elseif d(e[1],T)then
return h(
"+"..tostring(
o(e[2],true)
)
)
elseif d(e[1],ze)then
local e=D(e[2])
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
if u then
return w(r)
else
return w(
g(r)
)
end
end
local e=Q(
w(c)
)
local t=""
local r=""
if h(e)then
return"()"
elseif a(e)then
t="("
r=""
while a(e)do
t=tostring(t)..tostring(r)..tostring(
q(
i(e)
)
)
r=" "
e=n(e)
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(
q(e)
)..")"
end
return t
elseif u(e)then
local t=_(e)
local a=A(e)
local e=D(a)
if e~=false and#e==2 and d(t,re)and d(e[1],T)then
return o(e[2],false)
end
return"#"..tostring(
q(
s(t,a)
)
)
elseif p(e)then
return C(e)
elseif k(e)then
return";("..tostring(
q(
ie(e)
)
).." "..tostring(
q(
L(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
q(
R(
X(e)
)
)
).." "..tostring(
q(
ee(e)
)
)..")"
elseif Y(e)then
return"%("..tostring(
q(
se(e)
)
).." "..tostring(
q(
E(
ue(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
q(
R(
ge(e)
)
)
).." "..tostring(
q(
je(e)
)
).." "..tostring(
q(
E(
ke(e)
)
)
)..")"
elseif F(e)then
return"^("..tostring(
q(
qe(e)
)
).." "..tostring(
q(
E(
_e(e)
)
)
)..")"
end
return x()
end
local function O(n)
local e,h,t
function h()
return e==0
end
function t()
return not h()
end
e=#n
local function a(e)
if e==nil then
e=""
end
error(
"MT parse ERROR "..tostring(e)
)
end
local function i(e)
if not e then
return a()
end
end
local function r()
i(
t()
)
e=e-1
return string.sub(n,e+1,e+1)
end
local e={}
local function n(i)
local o=table.remove(e)
local t=table.remove(e)
if t==nil or o==nil then
return a()
else
return Ie(
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
Ie(
e,
o(t)
)
elseif t=="."then
n(s)
elseif t=="#"then
n(z)
elseif t=="$"then
n(
function(e,t)
local e=ae(e)
if e==false then
return a()
else
return H(e,t)
end
end
)
elseif t=="_"then
Ie(e,f)
else
return a()
end
end
i(
h()
)
i(#e==1)
return e[1]
end
local function S(e)
local s={e}
local t=""
while#s~=0 do
local r={}
for o,e in ipairs(s)do
e=N(e)
local function o(e,a,i,o)
t=tostring(t)..tostring(a)
return v(
r,
i(e),
o(e)
)
end
if p(e)then
t=tostring(t)..tostring(
("^"..tostring(
C(e)
).."^")
)
elseif a(e)then
o(e,".",i,n)
elseif h(e)then
t=tostring(t)..tostring(("_"))
elseif u(e)then
o(e,"#",_,A)
elseif le(e)then
local e=Ee(e)
o(
e,
"$",
(function(e)return R(
X(e)
)end),
ee
)
else
return x()
end
end
s=r
end
return t
end
local function T(e)
return function()return{false,e}end
end
local function v(e)
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
local j=g(
s(
ze,
s(
s(
Xe,
s(
s(
l,
s(
Be,
s(m,f)
)
),
f
)
),
f
)
)
)
local g=g(
s(
ze,
s(
s(
Xe,
s(te,f)
),
f
)
)
)
local function F(a,t)
return z(
g,
e(a,t)
)
end
local function U(e)
return z(j,e)
end
local function m(y,w,l,f,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
l=r(l)
if u(l)then
local u=_(l)
local s=A(l)
if c(u,j)then
s=r(s)
if a(s)then
local e=i(s)
local t=r(
n(s)
)
if h(t)then
if d==false then
local e=e
local t=f
local function a()return y(e,t)end
return v(a)
else
local t
t=y
local a
a=w
local o=e
local i=f
local function e()return m(
t,
a,
M(d,o),
i
)end
return v(e)
end
end
end
elseif c(u,g)then
s=r(s)
if a(s)then
local l=i(s)
local s=r(
n(s)
)
if a(s)then
local a=i(s)
local i=r(
n(s)
)
if h(i)then
if d==false then
local e
e=y
local t
t=w
local n=l
local i=a
local o=f
local function a()return m(e,t,n,o,i)end
return v(a)
else
local n
n=y
local i
i=w
local h=l
local s=a
local r=f
local d=d
local a=o("序甲")
local function o()return m(
n,
i,
h,
r,
z(
t,
e(
e(a),
p(
e(
he(s),
a
),
he(d)
)
)
)
)end
return v(o)
end
end
end
end
end
end
if d==false then
return v(
function()return w(l,f,y)end
)
else
return v(
function()return w(
l,
f,
function(t,e)return v(
function()return m(
y,
w,
M(d,{t}),
e
)end
)end
)end
)
end
end
local function d(e,t,a,o)
return m(e,t,a,o)
end
local function l(e,t,n,i)
return x(
m(
(function(a,t)return T(
e(a,t)
)end),
(function(e,a,o)return T(
t(
e,
a,
function(e,t)return x(
o(e,t)
)end
)
)end),
n,
i
)
)
end
local t={}
t.new_comment=de
t.comment_p=k
t.comment_comment=ie
t.comment_x=L
t.un_comment_all=Z
t.new_atom=o
t.atom_p=p
t.un_atom=C
t.atom_equal_p=I
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=f
t.null_p=h
t.new_data=z
t.data_p=u
t.data_name=_
t.data_list=A
t.just_p=B
t.evaluate=H
t.apply=M
t.force_all_rec=V
t.force_uncomment_all_rec=ce
t.unlazy_all_rec=Oe
t.jsArray_to_list=E
t.maybe_list_to_jsArray=D
t.new_list=e
t.un_just_all=N
t.un_just_comment_all=Je
t.delay_p=le
t.delay_just_p=y
t.lazy_p=K
t.delay_env=Ge
t.delay_x=tt
t.force_all=r
t.force1=b
t.force_uncomment1=at
t.force_uncomment_all=Ne
t.unlazy1=ye
t.env_null_v=Ae
t.env_set=me
t.env_get=Te
t.env2val=R
t.env_foreach=Se
t.val2env=ae
t.equal_p=c
t.simple_print=w
t.complex_parse=Q
t.complex_print=q
t.machinetext_parse=O
t.machinetext_print=S
t.trampoline_return=T
t.trampoline_delay=v
t.run_trampoline=x
t.return_effect_systemName=j
t.bind_effect_systemName=g
t.new_effect_bind=F
t.new_effect_return=U
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
