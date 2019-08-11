local function l(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function Ae(t,...)
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
local k,O,Ye,Ee,ce,C,K,We,Te,me,ie,ne,de,ae,q,te,U,Q,f,L,S,h,a,i,n,p,s,z,c,j,T,W,Ke,H,F,G,Z,Ve,P,qe,ge,ke,_,V,le,se,M,B,je,ze,Y,Pe,xe,o,N,oe,Ge,A,ue,t,x,Fe,Qe,Je,Ce,Ie,Se,Re,He,Me,Ne,Oe,J,ye,we,X,_e,Xe,D,fe,Ze,et,b,E,e,I,he,y,ee,d,g,r,ve,pe,ot,m,De,be,Le,Be,R,Ue,it,st,nt,ht,at,re,tt,u,w,v
function k()
error("TheLanguage PANIC")
end
function O(e)
if not e then
return k()
end
end
function ae(t,e)
return{ne,t,e}
end
function q(e)
return e[1]==ne
end
function te(e)
return e[2]
end
function U(e)
return e[3]
end
function Q(e)
while q(e)do
e=U(e)
end
return e
end
function f(e)
return e[1]==Ye
end
function L(e)
return e[2]
end
function S(t,e)
if t==e then
return true
end
if L(t)==L(e)then
N(t,e)
return true
else
return false
end
end
function h(t,e)
return{Ee,t,e}
end
function a(e)
return e[1]==Ee
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function s(e)
return e[1]==ce
end
function z(e,t)
return{C,e,t}
end
function c(e)
return e[1]==C
end
function j(e)
return e[2]
end
function T(e)
return e[3]
end
function W(e)
return e[1]==K
end
function Ke(e)
return e[2]
end
function H(e,t)
return{We,e,t}
end
function F(e)
return e[1]==We
end
function G(e)
return e[2]
end
function Z(e)
return e[3]
end
function Ve(t,e,a)
return{me,t,e,a}
end
function P(e)
return e[1]==me
end
function qe(e)
return e[2]
end
function ge(e)
return e[3]
end
function ke(e)
return e[4]
end
function _(t,e)
return{Te,t,e}
end
function V(e)
return e[1]==Te
end
function le(e)
return e[2]
end
function se(e)
return e[3]
end
function M(e,t)
return{ie,e,t}
end
function B(e)
return e[1]==ie
end
function je(e)
return e[2]
end
function ze(e)
return e[3]
end
function Y(e)
local e=r(e)
local function t(e)
e[2]=Y(e[2])
e[3]=Y(e[3])
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
function xe()
return{de}
end
function o(e)
return e[1]==de
end
function N(e,t)
if e==t then
return
end
if e==p then
e=t
t=p
end
e[1]=K
e[2]=t
e[3]=false
e[4]=false
end
function oe(t,e)
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
function Ge(t)
local e=xe()
oe(e,t)
return e
end
function b(e,t)
return z(
Qe,
h(
e,
h(t,p)
)
)
end
function E(a)
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
return E(e)
end
function I(e)
if not W(e)then
return e
end
local e=e
local t={}
while W(e)do
l(t,e)
e=Ke(e)
end
for a,t in ipairs(t)do
N(t,e)
end
return e
end
function he(e)
return F(e)or P(e)or V(e)or B(e)
end
function y(e)
return W(e)or he(e)
end
function ee(e)
return y(e)or q(e)
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
if y(t)then
l(a,e)
return d(t,i,{false,false},a)
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
e=g(e)
t=t+1
end
end
while y(e)do
local s=v(e)
if i[s]==true then
return o()
end
if h[s]==true then
t[1]=true
if F(e)then
return o()
elseif V(e)then
local a=le(e)
local e=se(e)
local s={Ce,Ie,Se,Re,He,Me,Ne,Oe}
local i=false
for t,e in ipairs(s)do
if w(e,a)then
i=true
break
end
end
if i then
O(#e==1)
O(t[2]==false)
local e=d(
e[1],
u(),
t
)
if t[2]then
return n(
_(a,{e})
)
else
return k()
end
end
if w(a,J)then
return o()
elseif w(a,ye)then
return o()
elseif w(a,we)then
return o()
elseif w(a,X)then
O(#e==3)
O(t[2]==false)
local a=d(
e[1],
u(),
t
)
if t[2]then
return n(
_(X,{a,e[2],e[3]})
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
e=g(e)
end
return r(e)
end
function g(a)
local e=I(a)
local t
O(
not W(e)
)
if F(e)then
t=it(
G(e),
Z(e),
a
)
elseif P(e)then
t=at(
qe(e),
ge(e),
ke(e),
a
)
elseif V(e)then
t=ht(
le(e),
se(e),
a
)
elseif B(e)then
t=nt(
je(e),
ze(e),
a
)
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
function ve(e)
while y(e)or q(e)do
e=r(
Q(e)
)
end
return e
end
function pe(e)
while q(e)do
e=U(e)
end
e=g(e)
while q(e)do
e=U(e)
end
return e
end
function ot(e,d,r,u)
local t={}
local o={}
local e=I(e)
local h=true
while true do
if s(e)then
return u(o,t)
elseif q(e)then
l(
o,
te(e)
)
e=U(e)
elseif a(e)then
l(
t,
i(e)
)
e=n(e)
elseif y(e)then
if h then
h=false
e=g(e)
else
return r()
end
else
return d()
end
end
end
function m(e)
if ee(e)then
e=pe(e)
end
if ee(e)then
return nil
end
if f(e)then
return true
end
if not c(e)then
return false
end
local e=j(e)
if ee(e)then
e=pe(e)
end
if ee(e)then
return nil
end
if not f(e)then
return false
end
return S(e,ue)
end
function be(a,o,i)
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
function Le(t,a,o)
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
function Be(t,a)
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
return z(
Fe,
e(o)
)
end
function Ue(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function it(o,t,d)
local h=g(t)
if y(h)then
return d
end
local function t()return b(
A,
e(
D,
e(
we,
e(
R(o),
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
if w(e[1],fe)then
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
return Ve(o,i,a)
elseif w(e[1],Ze)then
if#e==1 then
return t()
end
local h=r(
H(o,e[2])
)
if not c(h)then
return t()
end
local r=g(
j(h)
)
if y(r)then
return d
end
if not f(r)then
return t()
end
if not S(r,x)then
return t()
end
local h=g(
T(h)
)
if y(h)then
return d
end
if not a(h)then
return t()
end
local i=i(h)
local a=g(
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
return M(i,a)
elseif w(e[1],D)then
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
H(o,e[t+1])
)
t=t+1
end
end
return _(i,a)
else
local i=H(o,e[1])
local a={}
do
local t=1
while t<#e do
l(
a,
H(o,e[t+1])
)
t=t+1
end
end
return M(i,a)
end
end
)
elseif s(h)then
return h
end
local e=m(h)
if e==nil then
return d
end
if e==true then
return Le(
o,
h,
t()
)
end
return t()
end
function nt(d,l,u)
local function o()return b(
A,
e(
D,
e(
ye,
e(
d,
E(l)
)
)
)
)end
d=g(d)
if y(d)then
return u
end
if not c(d)then
return o()
end
local e=r(
j(d)
)
if not(f(e)and S(e,t))then
return o()
end
local t=r(
T(d)
)
if not a(t)then
return o()
end
local e=Y(
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
local d=i(t)
local r=De
local t=0
while not s(e)do
local s=m(e)
if s==nil then
return u
end
if s==true then
local a=p
do
local e=#l-1
while e>=t do
a=h(l[e+1],a)
e=e-1
end
end
r=be(r,e,a)
t=#l
e=p
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
r=be(
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
if#l~=t then
return o()
end
return H(r,d)
end
function ht(i,t,o)
local function a()return b(
A,
e(
D,
e(
i,
E(t)
)
)
)end
for n,e in ipairs(st)do
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
function at(i,o,t,a)
local function a()return b(
A,
e(
fe,
e(
R(i),
o,
E(t)
)
)
)end
if w(o,_e)then
if#t~=1 then
return a()
end
return t[1]
elseif w(o,Xe)then
if#t~=2 then
return a()
end
return tt(i,t[1],t[2],a)
elseif w(o,et)then
if#t~=2 then
return a()
end
return ae(
t[1],
H(i,t[2])
)
end
return a()
end
function re(t)
return e(fe,_e,t)
end
function tt(c,r,y,f)
r=Pe(r)
local d={}
local u=false
local o=r
while not s(o)do
local e=m(o)
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
return f()
end
end
local o
if u then
o=E(d)
else
o=r
end
local a={}
Ue(
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
re(
Be(c,a[e+1])
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
h(
re(
z(
t,
e(i,y)
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
local function h(e,t,a,o)
local a=u(
a(e),
a(t)
)
local o=u(
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
if q(e)then
local e=Q(e)
local e=u(e,t)
if e==true then
e=nil
end
return e
elseif q(t)then
local t=Q(t)
local e=u(e,t)
if e==true then
e=nil
end
return e
elseif s(e)then
if not s(t)then
return false
end
N(e,t)
return true
elseif f(e)then
if not f(t)then
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
return h(e,t,j,T)
end
return k()
end
function w(t,e)
return u(t,e)~=false
end
function v(e)
e=I(e)
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
e=I(
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
T(e)
)
)
)
elseif f(e)then
return L(e)
elseif q(e)then
return";("..tostring(
v(
te(e)
)
).." "..tostring(
v(
U(e)
)
)..")"
elseif F(e)then
return"$("..tostring(
v(
R(
G(e)
)
)
).." "..tostring(
v(
Z(e)
)
)..")"
elseif V(e)then
return"%("..tostring(
v(
le(e)
)
).." "..tostring(
v(
E(
se(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
v(
R(
qe(e)
)
)
).." "..tostring(
v(
ge(e)
)
).." "..tostring(
v(
E(
ke(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
v(
je(e)
)
).." "..tostring(
v(
E(
ze(e)
)
)
)..")"
end
return k()
end
local function tt(e)
for e in pairs(e)do
return false
end
return true
end
local function at(e)
local t={}
for a in pairs(e)do
t[a]=e[a]
end
return t
end
Ye=0
Ee=1
ce=2
C=3
K=4
We=5
Te=6
me=7
ie=8
ne=10
de=9
local function o(e)
return{Ye,e}
end
p={ce}
local function ce(e)
local t=ve(e)
local function o(e)
e[2]=Y(e[2])
e[3]=Y(e[3])
if q(e[2])or q(e[3])then
local t=Ge(e)
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
if c(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
Pe=ce
A=o("太始初核")
ue=o("符名")
t=o("化滅")
x=o("式形")
local ht=o("等同")
local ct=o("解算")
local C=o("特定其物")
local m=o("省略一物")
Fe=o("映表")
local ut=o("如若")
local u=o("一類何物")
local K=o("是非")
local me=o("其子")
local Be=o("爻陽")
local Ge=o("爻陰")
local lt=o("引用")
local it=o("應用")
local Ye=o("間空")
local ne=o("連頸")
local ie=o("構物")
Qe=o("謬誤")
local ot=o("詞素")
local Ee=o("列序")
local dt=o("首始")
local rt=o("尾末")
local Ke=o("之物")
local d=o("宇宙亡矣")
local Qe=o("效應")
local We=o("註疏")
Je=b(
A,
e(d,m)
)
local function b(e)
return z(
ue,
h(
A,
h(e,p)
)
)
end
local function Te(a)
return b(
e(
u,
e(t,m,a),
C
)
)
end
local function d(o,a)
return b(
e(
u,
e(
t,
e(o),
m
),
a
)
)
end
local function de(a)
return b(
e(
u,
t,
e(
K,
e(u,a,m)
)
)
)
end
local Je=Te(ie)
Ce=d(ie,ue)
Ie=d(ie,Ee)
Se=de(ie)
local nt=Te(ne)
Re=de(ne)
He=d(ne,dt)
Me=d(ne,rt)
Ne=de(ot)
Oe=de(Ye)
J=b(
e(
u,
t,
e(K,ht)
)
)
ye=b(
e(
u,
e(
t,
h(t,m),
m
),
it
)
)
we=b(
e(u,t,ct)
)
local Ye=d(
Ee,
e(u,Ke,m)
)
X=b(
e(u,t,ut)
)
_e=b(
e(u,x,lt)
)
Xe=b(
e(
u,
e(
x,
e(t,m,t)
),
C
)
)
D=b(
e(
x,
e(A,t)
)
)
fe=b(
e(
x,
e(A,x)
)
)
Ze=b(
e(x,x)
)
local ot=b(
e(u,t,We)
)
et=b(
e(u,x,We)
)
local d=z(
Ge,
e()
)
local ie=z(
Be,
e()
)
local function _e(e,h,o)
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
local function D(e)
return _e(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function Xe(e)
while W(e)or q(e)do
e=I(
Q(e)
)
end
return e
end
local function Te(e)
if F(e)then
return e
elseif P(e)then
error("WIP")
elseif V(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return k()
end
local function et(e)
return G(
Te(e)
)
end
local function ht(e)
return Z(
Te(e)
)
end
local function it(e)
if q(e)then
return U(e)
else
return g(e)
end
end
local de={true,{},nil}
local function Ze(e)
if e[1]==true then
return tt(e[2])
end
return false
end
local function de(e,o,t)
e=ve(e)
if f(e)then
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
T(e)
)
else
return k()
end
end
local function We(a)
local t={}
local e={}
for o,a in ipairs(a)do
de(a,t,e)
end
return{e,t}
end
local function de(t)
local a=We(t[2])
local e=a[1]
local o=a[2]
local a={}
a[e[#e]]={false,o,t[3]}
local a={true,a,nil}
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
local function fe(e)
return{
true,
at(e[2]),
nil
}
end
local function Ee(i,h,n,o,s)
if i[1]then
local a=fe(i)
local e=We(h)
local t=e[1]
local i=e[2]
local e=a
for t,a in ipairs(t)do
local t=nil
if e[2][a]~=nil then
local e=e[2][a]
if e[0]then
t=fe(e)
else
t=de(e)
end
else
t={true,{},nil}
end
O(t~=nil)
e[2][a]=t
e=t
end
if Ze(e)then
local e=e
e[1]=false
e[2]=i
e[3]=n
o[1]=a[1]
o[2]=a[2]
o[3]=a[3]
return s
else
return Ee(e,i,n,e,a)
end
else
return Ee(
de(i),
h,
n,
o,
s
)
end
return k()
end
De={}
local function de(t)
t=r(t)
if not c(t)then
return false
end
local e=r(
j(t)
)
if not f(e)then
return false
end
if not S(e,Fe)then
return false
end
e=r(
T(t)
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
local h=i(e)
e=r(
n(e)
)
if not a(e)then
return false
end
local o=i(e)
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
while e<#t do
if w(t[(e+0)+1],h)then
t[(e+1)+1]=o
a=false
break
end
e=e+2
end
end
if a then
l(t,h,o)
end
end
return t
end
local function Ee(t,a)
return{
t,
1,
function(e)
e=g(e)
if y(e)then
return _(t,{e})
end
if a(e)then
return ie
end
return d
end
}
end
local function fe(t,o,i)
return{
t,
1,
function(e,a)
e=g(e)
if y(e)then
return _(t,{e})
end
if o(e)then
return i(e)
end
return a()
end
}
end
st={
Ee(Se,c),
{Je,2,z},
fe(Ce,c,j),
fe(Ie,c,T),
Ee(Oe,s),
{nt,2,h},
Ee(Re,a),
fe(He,a,i),
fe(Me,a,n),
{
J,
2,
function(e,t,o)
if e==t then
return ie
end
e=g(e)
t=g(t)
if y(e)or y(t)then
return _(J,{e,t})
end
if e==t then
return ie
end
local function o(a,t,e)
return _(X,{a,t,e})
end
local function h(t,e)
return o(t,e,d)
end
O(
not y(e)
)
local function o(e,a,o,t)
return h(
_(
J,
{
o(e),
o(a)
}
),
_(
J,
{
t(e),
t(a)
}
)
)
end
if s(e)then
if not s(e)then
return d
end
return ie
elseif f(e)then
if not f(t)then
return d
end
if S(e,t)then
return ie
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return o(e,t,j,T)
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
ye,
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
return M(o,t)
end
},
{
we,
2,
function(e,t,a)
local e=de(e)
if e==false then
return a()
end
return H(e,t)
end
},
Ee(Ne,f),
{
Ye,
1,
function(e,t)
e=g(e)
if y(e)then
return _(Ye,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
X,
3,
function(e,a,o,t)
e=g(e)
if y(e)then
return _(X,{e,a,o})
end
if not c(e)then
return t()
end
local e=r(
j(e)
)
if not f(e)then
return t()
end
if S(e,Be)then
return a
end
if S(e,Ge)then
return o
end
return t()
end
},
{ot,2,ae}
}
local function d(e,t)
if e==t then
return true
end
e=I(e)
t=I(t)
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
N(e,t)
return true
else
return false
end
end
if s(e)then
if not s(t)then
return false
end
N(e,p)
N(t,p)
return true
elseif f(e)then
if not f(t)then
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
return o(e,t,j,T)
elseif he(e)then
return false
end
return k()
end
local function J(Q)
local Y,v,c,d,w,r,T,j,B,g,D,N,I,S,R,L,F,U,q,W,k,y,P,V,G
function c()
return#Y==v
end
function d()
O(
not c()
)
local e=string.sub(Y,v+1,v+1)
v=v+1
return e
end
function w(e)
O(
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
function T(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function j()
if c()then
return false
end
local e=d()
if not T(e)then
w(e)
return false
end
while T(e)and not c()do
e=d()
end
if not T(e)then
w(e)
end
return true
end
function B()
if c()then
return false
end
local e=d()
local t=""
if not F(e)then
w(e)
return false
end
while F(e)and not c()do
t=tostring(t)..tostring(e)
e=d()
end
if F(e)then
t=tostring(t)..tostring(e)
else
w(e)
end
return o(t)
end
function g()
if c()then
return false
end
local e=d()
if e~="("then
w(e)
return false
end
local t=xe()
local a=t
local function i(a)
local e=xe()
oe(
t,
h(a,e)
)
t=e
end
while true do
j()
if c()then
return r()
end
e=d()
if e==")"then
oe(t,p)
return a
end
if e=="."then
j()
local o=U()
oe(t,o)
j()
if c()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
w(e)
local e=U()
i(e)
end
end
function D()
if c()then
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
return z(
i(e),
n(e)
)
end
function F(e)
if T(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function U()
j()
local e={g,G,D,N,I,S,R,L}
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
function W()
return not c()
end
function k(e)
q(
W()
)
q(
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
t={g,B,a,D,N,I,S,R,L}
else
t={g,V,D,N,I,S,R,L}
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
local o=y()
return e(
u,
e(
t,
e(a),
m
),
o
)
elseif o==":"then
local t=y()
return e(u,t,a)
elseif o=="~"then
return e(K,a)
elseif o=="@"then
local o=y()
return e(
u,
e(
t,
h(a,m),
m
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
local e=y(true)
l(t,e)
if c()then
break
end
local e=d()
if e~="/"then
w(e)
break
end
end
return e(
me,
E(t)
)
else
w(o)
return a
end
end
function V()
if c()then
return false
end
local a=d()
if a=="&"then
q(
W()
)
local t=d()
if t=="+"then
local t=y()
return e(
x,
e(A,t)
)
else
w(t)
end
local t=y()
return e(x,t)
elseif a==":"then
q(
W()
)
local a=d()
if a=="&"then
k(">")
local a=y()
return e(
u,
e(
x,
e(t,m,a)
),
C
)
elseif a==">"then
local a=y()
return e(
u,
e(t,m,a),
C
)
else
w(a)
end
local t=y()
return e(u,t,C)
elseif a=="+"then
local t=y()
return e(A,t)
elseif a=="["then
local e=y()
k("]")
return P(e)
elseif a=="_"then
k(":")
local t=y()
return e(u,t,m)
else
w(a)
local e=B()
if e==false then
return false
end
return P(e)
end
end
function G()
local e=V()
if e==false then
return false
end
if f(e)then
return e
end
return b(e)
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
local function h(t,h)
return function()
if c()then
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
local o=n(e)
if not a(o)then
return r()
end
local t=n(o)
if not(a(t)and s(
n(t)
))then
return r()
end
return h(
i(e),
i(o),
i(t)
)
end
end
N=t(
"$",
function(e,t)
local e=de(e)
if e==false then
return r()
end
return H(e,t)
end
)
I=t(
"%",
function(t,e)
local e=_e(
e,
function(e)return e end,
function(e,e)return r()end
)
return _(t,e)
end
)
S=h(
"@",
function(o,a,e)
local t=_e(
e,
function(e)return e end,
function(e,e)return r()end
)
local e=de(o)
if e==false then
return r()
end
return Ve(e,a,t)
end
)
R=t(
"^",
function(e,t)
local t=_e(
t,
function(e)return e end,
function(e,e)return r()end
)
return M(e,t)
end
)
L=t(
";",
function(e,t)return ae(e,t)end
)
return U()
end
local function _(w)
local function o(r,l)
if f(r)then
return L(r)
end
local function h(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(r)
if e~=false and#e==3 and d(e[1],u)then
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
elseif d(t,m)and d(e[3],C)then
return h(
":>"..tostring(
o(s[3],true)
)
)
end
end
local a=D(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],K)then
return h(
tostring(
o(a[2],true)
).."?"
)
end
if s~=false and#s==2 and d(e[3],C)and d(s[1],x)then
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
elseif d(e[3],C)then
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
local t=D(e[2])
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
elseif d(e[1],me)then
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
if l then
return v(r)
else
return v(
b(r)
)
end
end
local e=J(
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
_(
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
_(e)
)..")"
end
return t
elseif c(e)then
local t=j(e)
local a=T(e)
local e=D(a)
if e~=false and#e==2 and d(t,ue)and d(e[1],A)then
return o(e[2],false)
end
return"#"..tostring(
_(
h(t,a)
)
)
elseif f(e)then
return L(e)
elseif q(e)then
return";("..tostring(
_(
te(e)
)
).." "..tostring(
_(
U(e)
)
)..")"
elseif F(e)then
return"$("..tostring(
_(
R(
G(e)
)
)
).." "..tostring(
_(
Z(e)
)
)..")"
elseif V(e)then
return"%("..tostring(
_(
le(e)
)
).." "..tostring(
_(
E(
se(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
_(
R(
qe(e)
)
)
).." "..tostring(
_(
ge(e)
)
).." "..tostring(
_(
E(
ke(e)
)
)
)..")"
elseif B(e)then
return"^("..tostring(
_(
je(e)
)
).." "..tostring(
_(
E(
ze(e)
)
)
)..")"
end
return k()
end
local function C(n)
local e,s,t
function s()
return e==0
end
function t()
return not s()
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
n(h)
elseif t=="#"then
n(z)
elseif t=="$"then
n(
function(e,t)
local e=de(e)
if e==false then
return a()
else
return H(e,t)
end
end
)
elseif t=="_"then
Ae(e,p)
else
return a()
end
end
i(
s()
)
i(#e==1)
return e[1]
end
local function N(e)
local o={e}
local t=""
while#o~=0 do
local h={}
for r,e in ipairs(o)do
e=I(e)
local function o(e,o,i,a)
t=tostring(t)..tostring(o)
return l(
h,
i(e),
a(e)
)
end
if f(e)then
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
o(e,"#",j,T)
elseif he(e)then
local e=Te(e)
o(
e,
"$",
(function(e)return R(
G(e)
)end),
Z
)
else
return k()
end
end
o=h
end
return t
end
local function k(e)
return function()return{false,e}end
end
local function d(e)
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
local O=b(
h(
me,
h(
h(
Qe,
h(
h(
u,
h(
Ke,
h(m,p)
)
),
p
)
),
p
)
)
)
local A=b(
h(
me,
h(
h(
Qe,
h(ne,p)
),
p
)
)
)
local function F(t,a)
return z(
A,
e(t,a)
)
end
local function P(e)
return z(O,e)
end
local function b(f,m,u,y,l)
if l==nil then
l=false
end
local function p(e,e)
error("WIP")
end
u=r(u)
if c(u)then
local c=j(u)
local h=T(u)
if w(c,O)then
h=r(h)
if a(h)then
local a=i(h)
local e=r(
n(h)
)
if s(e)then
if l==false then
local e=a
local t=y
local function a()return f(e,t)end
return d(a)
else
local e
e=f
local t
t=m
local i=a
local o=y
local function a()return b(
e,
t,
M(l,i),
o
)end
return d(a)
end
end
end
elseif w(c,A)then
h=r(h)
if a(h)then
local c=i(h)
local h=r(
n(h)
)
if a(h)then
local u=i(h)
local a=r(
n(h)
)
if s(a)then
if l==false then
local e
e=f
local t
t=m
local n=c
local i=u
local o=y
local function a()return b(e,t,n,o,i)end
return d(a)
else
local a
a=f
local i
i=m
local n=c
local h=u
local s=y
local r=l
local o=o("序甲")
local function l()return b(
a,
i,
n,
s,
z(
t,
e(
e(o),
p(
e(
re(h),
o
),
re(r)
)
)
)
)end
return d(l)
end
end
end
end
end
end
if l==false then
return d(
function()return m(u,y,f)end
)
else
return d(
function()return m(
u,
y,
function(t,e)return d(
function()return b(
f,
m,
M(l,{t}),
e
)end
)end
)end
)
end
end
local function l(t,e,o,a)
return b(t,e,o,a)
end
local function u(o,i,a,t)
return x(
b(
(function(t,e)return k(
o(t,e)
)end),
(function(e,t,a)return k(
i(
e,
t,
function(e,t)return x(
a(e,t)
)end
)
)end),
a,
t
)
)
end
local t={}
t.new_comment=ae
t.comment_p=q
t.comment_comment=te
t.comment_x=U
t.un_comment_all=Q
t.new_atom=o
t.atom_p=f
t.un_atom=L
t.atom_equal_p=S
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=p
t.null_p=s
t.new_data=z
t.data_p=c
t.data_name=j
t.data_list=T
t.just_p=W
t.evaluate=H
t.apply=M
t.force_all_rec=Y
t.force_uncomment_all_rec=ce
t.unlazy_all_rec=Pe
t.jsArray_to_list=E
t.maybe_list_to_jsArray=D
t.new_list=e
t.un_just_all=I
t.un_just_comment_all=Xe
t.delay_p=he
t.delay_just_p=y
t.lazy_p=ee
t.delay_env=et
t.delay_x=ht
t.force_all=r
t.force1=g
t.force_uncomment1=it
t.force_uncomment_all=ve
t.unlazy1=pe
t.env_null_v=De
t.env_set=be
t.env_get=Le
t.env2val=R
t.env_foreach=Ue
t.val2env=de
t.equal_p=w
t.simple_print=v
t.complex_parse=J
t.complex_print=_
t.machinetext_parse=C
t.machinetext_print=N
t.trampoline_return=k
t.trampoline_delay=d
t.run_trampoline=x
t.return_effect_systemName=O
t.bind_effect_systemName=A
t.new_effect_bind=F
t.new_effect_return=P
t.run_monad_trampoline=l
t.run_monad_stackoverflow=u
return t
