local function l(e,...)
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
local q,z,dt,rt,ee,H,F,We,Ye,Me,Fe,Ce,xe,Te,Ne,Ue,Ve,le,k,ue,U,Q,f,C,R,h,a,i,n,y,s,x,u,j,A,B,lt,S,W,X,Z,Je,P,ze,Ae,Ee,O,Y,de,he,M,V,Oe,ke,G,Be,qe,o,N,se,wt,T,ne,t,_,Ze,yt,pt,et,Xe,Ge,Ke,Qe,Le,Pe,De,K,be,ve,te,je,mt,L,me,ct,ut,g,E,e,I,re,v,ae,d,b,r,fe,pe,ft,w,ie,ht,ye,J,oe,we,Re,ge,Se,tt,D,He,ot,at,_e,nt,it,ce,st,c,m,p
function q()
error("TheLanguage PANIC")
end
function z(e)
if not e then
return q()
end
end
function dt(e)
for e in pairs(e)do
return false
end
return true
end
function rt(a)
local e={}
for t in pairs(a)do
e[t]=a[t]
end
return e
end
function ee(e)
return function()return{false,e}end
end
function H(e)
return function()return{
true,
e()
}end
end
function le(t,e)
return{Ue,t,e}
end
function k(e)
return e[1]==Ue
end
function ue(e)
return e[2]
end
function U(e)
return e[3]
end
function Q(e)
while k(e)do
e=U(e)
end
return e
end
function f(e)
return e[1]==F
end
function C(e)
return e[2]
end
function R(e,t)
if e==t then
return true
end
if C(e)==C(t)then
N(e,t)
return true
else
return false
end
end
function h(t,e)
return{We,t,e}
end
function a(e)
return e[1]==We
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function s(e)
return e[1]==Ye
end
function x(e,t)
return{Me,e,t}
end
function u(e)
return e[1]==Me
end
function j(e)
return e[2]
end
function A(e)
return e[3]
end
function B(e)
return e[1]==Fe
end
function lt(e)
return e[2]
end
function S(e,t)
return{Ce,e,t}
end
function W(e)
return e[1]==Ce
end
function X(e)
return e[2]
end
function Z(e)
return e[3]
end
function Je(t,a,e)
return{Te,t,a,e}
end
function P(e)
return e[1]==Te
end
function ze(e)
return e[2]
end
function Ae(e)
return e[3]
end
function Ee(e)
return e[4]
end
function O(e,t)
return{xe,e,t}
end
function Y(e)
return e[1]==xe
end
function de(e)
return e[2]
end
function he(e)
return e[3]
end
function M(t,e)
return{Ne,t,e}
end
function V(e)
return e[1]==Ne
end
function Oe(e)
return e[2]
end
function ke(e)
return e[3]
end
function G(e)
local e=r(e)
local function t(e)
e[2]=G(e[2])
e[3]=G(e[3])
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
function qe()
return{Ve}
end
function o(e)
return e[1]==Ve
end
function N(e,t)
if e==t then
return
end
if e==y then
e=t
t=y
end
e[1]=Fe
e[2]=t
e[3]=false
e[4]=false
end
function se(e,a)
z(
o(e)
)
z(
not o(a)
)
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function wt(t)
local e=qe()
se(e,t)
return e
end
function g(e,t)
return x(
yt,
h(
e,
h(t,y)
)
)
end
function E(a)
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
return E(e)
end
function I(e)
if not B(e)then
return e
end
local e=e
local t={}
while B(e)do
l(t,e)
e=lt(e)
end
for a,t in ipairs(t)do
N(t,e)
end
return e
end
function re(e)
return W(e)or P(e)or Y(e)or V(e)
end
function v(e)
return B(e)or re(e)
end
function ae(e)
return v(e)or k(e)
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
return n(pt)
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
elseif Y(e)then
local a=de(e)
local e=he(e)
local s={et,Xe,Ge,Ke,Qe,Le,Pe,De}
local i=false
for t,e in ipairs(s)do
if m(e,a)then
i=true
break
end
end
if i then
z(#e==1)
z(t[2]==false)
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
return q()
end
end
if m(a,K)then
return o()
elseif m(a,be)then
return o()
elseif m(a,ve)then
return o()
elseif m(a,te)then
z(#e==3)
z(t[2]==false)
local a=d(
e[1],
u(),
t
)
if t[2]then
return n(
O(te,{a,e[2],e[3]})
)
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
l(a,e)
e=b(e)
end
return r(e)
end
function b(a)
local e=I(a)
local t
z(
not B(e)
)
if W(e)then
t=ot(
X(e),
Z(e),
a
)
elseif P(e)then
t=it(
ze(e),
Ae(e),
Ee(e),
a
)
elseif Y(e)then
t=nt(
de(e),
he(e),
a
)
elseif V(e)then
t=_e(
Oe(e),
ke(e),
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
function fe(e)
while v(e)or k(e)do
e=r(
Q(e)
)
end
return e
end
function pe(e)
while k(e)do
e=U(e)
end
e=b(e)
while k(e)do
e=U(e)
end
return e
end
function ft(e,r,d,u)
local h={}
local t={}
local e=I(e)
local o=true
while true do
if s(e)then
return u(t,h)
elseif k(e)then
l(
t,
ue(e)
)
e=U(e)
elseif a(e)then
l(
h,
i(e)
)
e=n(e)
elseif v(e)then
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
function w(e)
if ae(e)then
e=pe(e)
end
if ae(e)then
return nil
end
if f(e)then
return true
end
if not u(e)then
return false
end
local e=j(e)
if ae(e)then
e=pe(e)
end
if ae(e)then
return nil
end
if not f(e)then
return false
end
return R(e,ne)
end
function ie(e)
if e[1]then
return dt(e[2])
end
return false
end
function ht(e,o,t)
e=fe(e)
if f(e)then
l(
t,
"^",
C(e)
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
j(e),
A(e)
)
else
return q()
end
end
function ye(a)
local t={}
local e={}
for o,a in ipairs(a)do
ht(a,t,e)
end
return{e,t}
end
function J(a)
local t=ye(a[2])
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
function oe(e)
return{
true,
rt(e[2]),
nil
}
end
function we(a,n,i,e,o)
if#n==0 then
z(
ie(a)or(a[1]==false and a[2].length==0)
)
e[1]=false
e[2]=n
e[3]=i
return ee(o)
end
if a[1]then
local t=oe(a)
e[1]=t[1]
e[2]=t[2]
e[3]=t[3]
local t=e
local e=ye(n)
local a=e[1]
local n=e[2]
local e=t
for t,a in ipairs(a)do
local t=nil
if e[2][a]~=nil then
local e=e[2][a]
if e[0]then
t=oe(e)
else
t=J(e)
end
else
t={true,{},nil}
end
z(t~=nil)
e[2][a]=t
e=t
end
if ie(e)then
local e=e
e[1]=false
e[2]=n
e[3]=i
return ee(o)
else
return H(
function()return we(e,n,i,e,o)end
)
end
else
return H(
function()return we(
J(a),
n,
i,
e,
o
)end
)
end
return q()
end
function ge(a,o,i)
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
function Se(t,a,o)
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
function tt(t,a)
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
return x(
Ze,
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
function ot(o,t,d)
local h=b(t)
if v(h)then
return d
end
local function t()return g(
T,
e(
L,
e(
ve,
e(
D(o),
h
)
)
)
)end
if a(h)then
return ft(
h,
t,
function()return d end,
function(h,e)
if#h~=0 then
error("WIP")
end
if m(e[1],me)then
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
return Je(o,i,a)
elseif m(e[1],ct)then
if#e==1 then
return t()
end
local h=r(
S(o,e[2])
)
if not u(h)then
return t()
end
local r=b(
j(h)
)
if v(r)then
return d
end
if not f(r)then
return t()
end
if not R(r,_)then
return t()
end
local h=b(
A(h)
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
return M(i,a)
elseif m(e[1],L)then
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
S(o,e[t+1])
)
t=t+1
end
end
return O(i,a)
else
local i=S(o,e[1])
local a={}
do
local t=1
while t<#e do
l(
a,
S(o,e[t+1])
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
local e=w(h)
if e==nil then
return d
end
if e==true then
return Se(
o,
h,
t()
)
end
return t()
end
function _e(o,l,c)
local function d()return g(
T,
e(
L,
e(
be,
e(
o,
E(l)
)
)
)
)end
o=b(o)
if v(o)then
return c
end
if not u(o)then
return d()
end
local e=r(
j(o)
)
if not(f(e)and R(e,t))then
return d()
end
local t=r(
A(o)
)
if not a(t)then
return d()
end
local e=G(
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
local o=Re
local t=0
while not s(e)do
local s=w(e)
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
o=ge(o,e,a)
t=#l
e=y
elseif a(e)then
if t<#l then
local a=l[t+1]
t=t+1
o=ge(
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
return S(o,r)
end
function nt(i,t,o)
local function a()return g(
T,
e(
L,
e(
i,
E(t)
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
function it(i,o,t,a)
local function a()return g(
T,
e(
me,
e(
D(i),
o,
E(t)
)
)
)end
if m(o,je)then
if#t~=1 then
return a()
end
return t[1]
elseif m(o,mt)then
if#t~=2 then
return a()
end
return st(i,t[1],t[2],a)
elseif m(o,ut)then
if#t~=2 then
return a()
end
return le(
t[1],
S(i,t[2])
)
end
return a()
end
function ce(t)
return e(me,je,t)
end
function st(u,d,f,p)
d=Be(d)
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
return p()
end
end
local o
if c then
o=E(r)
else
o=d
end
local a={}
He(
u,
function(t,e)
do
local e=0
while e<#r do
if m(r[e+1],t)then
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
ce(
tt(u,a[e+1])
),
o
)
e=e-1
end
end
return x(
t,
e(
d,
h(
ce(
x(
t,
e(i,f)
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
local function h(e,t,o,a)
local o=c(
o(e),
o(t)
)
local a=c(
a(e),
a(t)
)
if o==true and a==true then
N(e,t)
return true
elseif o~=false and a~=false then
return nil
else
return false
end
end
if k(t)then
local t=Q(t)
local e=c(t,e)
if e==true then
e=nil
end
return e
elseif k(e)then
local e=Q(e)
local e=c(t,e)
if e==true then
e=nil
end
return e
elseif s(t)then
if not s(e)then
return false
end
N(t,e)
return true
elseif f(t)then
if not f(e)then
return false
end
return R(t,e)
elseif a(t)then
if not a(e)then
return false
end
return h(t,e,i,n)
elseif u(t)then
if not u(e)then
return false
end
return h(t,e,j,A)
end
return q()
end
function m(e,t)
return c(e,t)~=false
end
function p(e)
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
p(
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
p(e)
)..")"
end
return t
elseif u(e)then
return"#"..tostring(
p(
h(
j(e),
A(e)
)
)
)
elseif f(e)then
return C(e)
elseif k(e)then
return";("..tostring(
p(
ue(e)
)
).." "..tostring(
p(
U(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
p(
D(
X(e)
)
)
).." "..tostring(
p(
Z(e)
)
)..")"
elseif Y(e)then
return"%("..tostring(
p(
de(e)
)
).." "..tostring(
p(
E(
he(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
p(
D(
ze(e)
)
)
).." "..tostring(
p(
Ae(e)
)
).." "..tostring(
p(
E(
Ee(e)
)
)
)..")"
elseif V(e)then
return"^("..tostring(
p(
Oe(e)
)
).." "..tostring(
p(
E(
ke(e)
)
)
)..")"
end
return q()
end
local function _e(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
F=0
We=1
Ye=2
Me=3
Fe=4
Ce=5
xe=6
Te=7
Ne=8
Ue=10
Ve=9
local function o(e)
return{F,e}
end
y={Ye}
local function xe(e)
local t=fe(e)
local function o(e)
e[2]=G(e[2])
e[3]=G(e[3])
if k(e[2])or k(e[3])then
local t=wt(e)
local a=e[2]
local e=e[3]
local a=xe(a)
local e=xe(e)
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
Be=xe
T=o("太始初核")
ne=o("符名")
t=o("化滅")
_=o("式形")
local st=o("等同")
local nt=o("解算")
local F=o("特定其物")
local w=o("省略一物")
Ze=o("映表")
local ft=o("如若")
local c=o("一類何物")
local J=o("是非")
local Te=o("其子")
local Ye=o("爻陽")
local We=o("爻陰")
local Ve=o("引用")
local ot=o("應用")
local ht=o("間空")
local ie=o("連頸")
local ye=o("構物")
yt=o("謬誤")
local dt=o("詞素")
local Ce=o("列序")
local rt=o("首始")
local tt=o("尾末")
local Fe=o("之物")
local d=o("宇宙亡矣")
local Ue=o("效應")
local Me=o("註疏")
pt=g(
T,
e(d,w)
)
local function g(e)
return x(
ne,
h(
T,
h(e,y)
)
)
end
local function Ne(a)
return g(
e(
c,
e(t,w,a),
F
)
)
end
local function d(a,o)
return g(
e(
c,
e(
t,
e(a),
w
),
o
)
)
end
local function oe(a)
return g(
e(
c,
t,
e(
J,
e(c,a,w)
)
)
)
end
local it=Ne(ye)
et=d(ye,ne)
Xe=d(ye,Ce)
Ge=oe(ye)
local lt=Ne(ie)
Ke=oe(ie)
Qe=d(ie,rt)
Le=d(ie,tt)
Pe=oe(dt)
De=oe(ht)
K=g(
e(
c,
t,
e(J,st)
)
)
be=g(
e(
c,
e(
t,
h(t,w),
w
),
ot
)
)
ve=g(
e(c,t,nt)
)
local Ce=d(
Ce,
e(c,Fe,w)
)
te=g(
e(c,t,ft)
)
je=g(
e(c,_,Ve)
)
mt=g(
e(
c,
e(
_,
e(t,w,t)
),
F
)
)
L=g(
e(
_,
e(T,t)
)
)
me=g(
e(
_,
e(T,_)
)
)
ct=g(
e(_,_)
)
local nt=g(
e(c,t,Me)
)
ut=g(
e(c,_,Me)
)
local d=x(
We,
e()
)
local oe=x(
Ye,
e()
)
local function je(e,h,o)
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
local function L(e)
return je(
e,
function(e)return e end,
function(e,e)return false end
)
end
local function ot(e)
while B(e)or k(e)do
e=I(
Q(e)
)
end
return e
end
local function Ne(e)
if W(e)then
return e
elseif P(e)then
error("WIP")
elseif Y(e)then
error("WIP")
elseif V(e)then
error("WIP")
end
return q()
end
local function tt(e)
return X(
Ne(e)
)
end
local function Me(e)
return Z(
Ne(e)
)
end
local function Ve(e)
if k(e)then
return U(e)
else
return b(e)
end
end
local function me()
return{true,{},nil}
end
local ye=me()
local function ye(a,o,t)
local e=me()
return _e(
we(a,{o},t,e,e)
)
end
Re={}
local function me(t)
t=r(t)
if not u(t)then
return false
end
local e=r(
j(t)
)
if not f(e)then
return false
end
if not R(e,Ze)then
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
if m(t[(e+0)+1],o)then
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
local function ye(t,a)
return{
t,
1,
function(e)
e=b(e)
if v(e)then
return O(t,{e})
end
if a(e)then
return oe
end
return d
end
}
end
local function we(t,i,o)
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
at={
ye(Ge,u),
{it,2,x},
we(et,u,j),
we(Xe,u,A),
ye(De,s),
{lt,2,h},
ye(Ke,a),
we(Qe,a,i),
we(Le,a,n),
{
K,
2,
function(e,t,o)
if e==t then
return oe
end
e=b(e)
t=b(t)
if v(e)or v(t)then
return O(K,{e,t})
end
if e==t then
return oe
end
local function o(e,t,a)
return O(te,{e,t,a})
end
local function h(e,t)
return o(e,t,d)
end
z(
not v(e)
)
local function o(o,a,t,e)
return h(
O(
K,
{
t(o),
t(a)
}
),
O(
K,
{
e(o),
e(a)
}
)
)
end
if s(e)then
if not s(e)then
return d
end
return oe
elseif f(e)then
if not f(t)then
return d
end
if R(e,t)then
return oe
else
return d
end
elseif u(e)then
if not u(t)then
return d
end
return o(e,t,j,A)
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
be,
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
ve,
2,
function(e,t,a)
local e=me(e)
if e==false then
return a()
end
return S(e,t)
end
},
ye(Pe,f),
{
Ce,
1,
function(e,t)
e=b(e)
if v(e)then
return O(Ce,{e})
end
if not a(e)then
return t()
end
return i(e)
end
},
{
te,
3,
function(e,o,a,t)
e=b(e)
if v(e)then
return O(te,{e,o,a})
end
if not u(e)then
return t()
end
local e=r(
j(e)
)
if not f(e)then
return t()
end
if R(e,Ye)then
return o
end
if R(e,We)then
return a
end
return t()
end
},
{nt,2,le}
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
local function o(e,t,o,a)
if d(
o(e),
o(t)
)and d(
a(e),
a(t)
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
N(e,y)
N(t,y)
return true
elseif f(e)then
if not f(t)then
return false
end
return R(e,t)
elseif a(e)then
if not a(t)then
return false
end
return o(e,t,i,n)
elseif u(e)then
if not u(t)then
return false
end
return o(e,t,j,A)
elseif re(e)then
return false
end
return q()
end
local function K(K)
local U,v,u,d,m,r,A,j,V,b,Y,W,C,H,N,I,D,L,q,R,k,p,B,P,G
function u()
return#U==v
end
function d()
z(
not u()
)
local e=string.sub(U,v+1,v+1)
v=v+1
return e
end
function m(e)
z(
string.sub(U,v,v)==e
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
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function j()
if u()then
return false
end
local e=d()
if not A(e)then
m(e)
return false
end
while A(e)and not u()do
e=d()
end
if not A(e)then
m(e)
end
return true
end
function V()
if u()then
return false
end
local e=d()
local t=""
if not D(e)then
m(e)
return false
end
while D(e)and not u()do
t=tostring(t)..tostring(e)
e=d()
end
if D(e)then
t=tostring(t)..tostring(e)
else
m(e)
end
return o(t)
end
function b()
if u()then
return false
end
local e=d()
if e~="("then
m(e)
return false
end
local t=qe()
local a=t
local function i(a)
local e=qe()
se(
t,
h(a,e)
)
t=e
end
while true do
j()
if u()then
return r()
end
e=d()
if e==")"then
se(t,y)
return a
end
if e=="."then
j()
local o=L()
se(t,o)
j()
if u()then
return r()
end
e=d()
if e~=")"then
return r()
end
return a
end
m(e)
local e=L()
i(e)
end
end
function Y()
if u()then
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
return x(
i(e),
n(e)
)
end
function D(e)
if A(e)then
return false
end
for a,t in ipairs({"(",")","!","#",".","$","%","^","@","~","/","-",">","_",":","?","[","]","&",";"})do
if t==e then
return false
end
end
return true
end
function L()
j()
local e={b,G,Y,W,C,H,N,I}
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
t={b,V,a,Y,W,C,H,N,I}
else
t={b,P,Y,W,C,H,N,I}
end
for t,e in ipairs(t)do
local e=e()
if e~=false then
return e
end
end
return r()
end
function B(a)
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
w
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
h(a,w),
w
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
m(e)
break
end
end
return e(
Te,
E(t)
)
else
m(o)
return a
end
end
function P()
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
_,
e(T,t)
)
else
m(t)
end
local t=p()
return e(_,t)
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
_,
e(t,w,a)
),
F
)
elseif a==">"then
local a=p()
return e(
c,
e(t,w,a),
F
)
else
m(a)
end
local t=p()
return e(c,t,F)
elseif a=="+"then
local t=p()
return e(T,t)
elseif a=="["then
local e=p()
k("]")
return B(e)
elseif a=="_"then
k(":")
local t=p()
return e(c,t,w)
else
m(a)
local e=V()
if e==false then
return false
end
return B(e)
end
end
function G()
local e=P()
if e==false then
return false
end
if f(e)then
return e
end
return g(e)
end
U=K
v=0
local function t(t,o)
return function()
if u()then
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
local function h(t,h)
return function()
if u()then
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
W=t(
"$",
function(e,t)
local e=me(e)
if e==false then
return r()
end
return S(e,t)
end
)
C=t(
"%",
function(e,t)
local t=je(
t,
function(e)return e end,
function(e,e)return r()end
)
return O(e,t)
end
)
H=h(
"@",
function(e,t,a)
local a=je(
a,
function(e)return e end,
function(e,e)return r()end
)
local e=me(e)
if e==false then
return r()
end
return Je(e,t,a)
end
)
N=t(
"^",
function(t,e)
local e=je(
e,
function(e)return e end,
function(e,e)return r()end
)
return M(t,e)
end
)
I=t(
";",
function(t,e)return le(t,e)end
)
return L()
end
local function z(m)
local function o(r,l)
if f(r)then
return C(r)
end
local function s(e)
if l then
return"["..tostring(e).."]"
else
return e
end
end
local e=L(r)
if e~=false and#e==3 and d(e[1],c)then
local h=L(e[2])
if h~=false and#h==3 and d(h[1],t)then
local t=h[2]
local r=L(t)
if r~=false and#r==1 and d(h[3],w)then
return s(
tostring(
o(r[1],true)
).."."..tostring(
o(e[3],true)
)
)
elseif a(t)and d(
n(t),
w
)and d(h[3],w)then
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
elseif d(t,w)and d(e[3],F)then
return s(
":>"..tostring(
o(h[3],true)
)
)
end
end
local a=L(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],J)then
return s(
tostring(
o(a[2],true)
).."?"
)
end
if h~=false and#h==2 and d(e[3],F)and d(h[1],_)then
local e=L(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],w)then
return s(
":&>"..tostring(
o(e[3],true)
)
)
end
end
local t
if d(e[3],w)then
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
if d(e[1],_)then
local t=L(e[2])
if t~=false and#t==2 and d(t[1],T)then
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
elseif d(e[1],T)then
return s(
"+"..tostring(
o(e[2],true)
)
)
elseif d(e[1],Te)then
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
return s(a)
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
local e=K(
p(m)
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
elseif u(e)then
local a=j(e)
local t=A(e)
local e=L(t)
if e~=false and#e==2 and d(a,ne)and d(e[1],T)then
return o(e[2],false)
end
return"#"..tostring(
z(
h(a,t)
)
)
elseif f(e)then
return C(e)
elseif k(e)then
return";("..tostring(
z(
ue(e)
)
).." "..tostring(
z(
U(e)
)
)..")"
elseif W(e)then
return"$("..tostring(
z(
D(
X(e)
)
)
).." "..tostring(
z(
Z(e)
)
)..")"
elseif Y(e)then
return"%("..tostring(
z(
de(e)
)
).." "..tostring(
z(
E(
he(e)
)
)
)..")"
elseif P(e)then
return"@("..tostring(
z(
D(
ze(e)
)
)
).." "..tostring(
z(
Ae(e)
)
).." "..tostring(
z(
E(
Ee(e)
)
)
)..")"
elseif V(e)then
return"^("..tostring(
z(
Oe(e)
)
).." "..tostring(
z(
E(
ke(e)
)
)
)..")"
end
return q()
end
local function T(i)
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
return Ie(
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
Ie(
e,
o(t)
)
elseif t=="."then
i(h)
elseif t=="#"then
i(x)
elseif t=="$"then
i(
function(e,t)
local e=me(e)
if e==false then
return a()
else
return S(e,t)
end
end
)
elseif t=="_"then
Ie(e,y)
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
local function _(e)
local h={e}
local t=""
while#h~=0 do
local r={}
for o,e in ipairs(h)do
e=I(e)
local function o(e,i,o,a)
t=tostring(t)..tostring(i)
return l(
r,
o(e),
a(e)
)
end
if f(e)then
t=tostring(t)..tostring(
("^"..tostring(
C(e)
).."^")
)
elseif a(e)then
o(e,".",i,n)
elseif s(e)then
t=tostring(t)..tostring(("_"))
elseif u(e)then
o(e,"#",j,A)
elseif re(e)then
local e=Ne(e)
o(
e,
"$",
(function(e)return D(
X(e)
)end),
Z
)
else
return q()
end
end
h=r
end
return t
end
local q=g(
h(
Te,
h(
h(
Ue,
h(
h(
c,
h(
Fe,
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
Te,
h(
h(
Ue,
h(ie,y)
),
y
)
)
)
local function O(t,a)
return x(
g,
e(t,a)
)
end
local function N(e)
return x(q,e)
end
local function w(y,f,l,c,d)
if d==nil then
d=false
end
local function p(e,e)
error("WIP")
end
l=r(l)
if u(l)then
local u=j(l)
local h=A(l)
if m(u,q)then
h=r(h)
if a(h)then
local a=i(h)
local e=r(
n(h)
)
if s(e)then
if d==false then
local e=a
local t=c
local function a()return y(e,t)end
return H(a)
else
local t
t=y
local e
e=f
local i=a
local o=c
local function a()return w(
t,
e,
M(d,i),
o
)end
return H(a)
end
end
end
elseif m(u,g)then
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
t=y
local e
e=f
local o=l
local a=a
local n=c
local function i()return w(t,e,o,n,a)end
return H(i)
else
local i
i=y
local n
n=f
local r=l
local h=a
local s=c
local d=d
local a=o("序甲")
local function o()return w(
i,
n,
r,
s,
x(
t,
e(
e(a),
p(
e(
ce(h),
a
),
ce(d)
)
)
)
)end
return H(o)
end
end
end
end
end
end
if d==false then
return H(
function()return f(l,c,y)end
)
else
return H(
function()return f(
l,
c,
function(t,e)return H(
function()return w(
y,
f,
M(d,{t}),
e
)end
)end
)end
)
end
end
local function l(o,a,t,e)
return w(o,a,t,e)
end
local function d(e,t,o,a)
return _e(
w(
(function(t,a)return ee(
e(t,a)
)end),
(function(e,a,o)return ee(
t(
e,
a,
function(e,t)return _e(
o(e,t)
)end
)
)end),
o,
a
)
)
end
local t={}
t.trampoline_return=ee
t.trampoline_delay=H
t.run_trampoline=_e
t.new_comment=le
t.comment_p=k
t.comment_comment=ue
t.comment_x=U
t.un_comment_all=Q
t.new_atom=o
t.atom_p=f
t.un_atom=C
t.atom_equal_p=R
t.new_construction=h
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=y
t.null_p=s
t.new_data=x
t.data_p=u
t.data_name=j
t.data_list=A
t.just_p=B
t.evaluate=S
t.apply=M
t.force_all_rec=G
t.force_uncomment_all_rec=xe
t.unlazy_all_rec=Be
t.jsArray_to_list=E
t.maybe_list_to_jsArray=L
t.new_list=e
t.un_just_all=I
t.un_just_comment_all=ot
t.delay_p=re
t.delay_just_p=v
t.lazy_p=ae
t.delay_env=tt
t.delay_x=Me
t.force_all=r
t.force1=b
t.force_uncomment1=Ve
t.force_uncomment_all=fe
t.unlazy1=pe
t.env_null_v=Re
t.env_set=ge
t.env_get=Se
t.env2val=D
t.env_foreach=He
t.val2env=me
t.equal_p=m
t.simple_print=p
t.complex_parse=K
t.complex_print=z
t.machinetext_parse=T
t.machinetext_print=_
t.return_effect_systemName=q
t.bind_effect_systemName=g
t.new_effect_bind=O
t.new_effect_return=N
t.run_monad_trampoline=l
t.run_monad_stackoverflow=d
return t
