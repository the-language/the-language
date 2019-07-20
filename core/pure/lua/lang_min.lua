local function v(e,...)
local t=({...})
for a,t in ipairs(t)do
e[#e+1]=t
end
return#e
end
local function He(t,...)
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
local q,N,le,he,ee,_e,Te,b,te,xe,je,se,f,F,me,O,de,V,ye,p,P,D,s,a,i,n,w,h,_,c,T,A,L,k,C,U,Q,Je,H,K,X,Z,Ce,G,ze,qe,ke,j,J,fe,ce,W,B,be,ge,Y,ve,o,S,ne,ht,z,t,x,Re,st,Ne,Se,Ie,Ae,Fe,Ge,We,Be,Ve,Ye,Ke,ae,pe,we,oe,Pe,Xe,M,ie,et,Ze,E,e,I,re,y,d,g,r,De,Le,Ee,Me,Oe,R,Ue,nt,tt,u,at,ot,it,rt,ue,Qe,l,m
function q()
error("TheLanguage PANIC")
end
function N(e)
if not e then
return q()
end
end
function me(t,e)
return{
f,
t,
e,
}
end
function O(e)
return e[1]==f
end
function de(e)
return e[2]
end
function V(e)
return e[3]
end
function ye(e)
while O(e)do
e=V(e)
end
return e
end
function p(e)
return e[1]==le
end
function P(e)
return e[2]
end
function D(e,t)
if e==t then
return true
end
if P(e)==P(t)then
S(e,t)
return true
else
return false
end
end
function s(t,e)
return{
he,
t,
e,
}
end
function a(e)
return e[1]==he
end
function i(e)
return e[2]
end
function n(e)
return e[3]
end
function h(e)
return e[1]==ee
end
function _(e,t)
return{
_e,
e,
t,
}
end
function c(e)
return e[1]==_e
end
function T(e)
return e[2]
end
function A(e)
return e[3]
end
function L(e,t)
return{
Te,
e,
t,
}
end
function k(e)
return e[1]==Te
end
function C(e)
return e[2]
end
function U(e)
return e[3]
end
function Q(e)
return e[1]==b
end
function Je(e)
return e[2]
end
function H(e,t)
return{
te,
e,
t,
}
end
function K(e)
return e[1]==te
end
function X(e)
return e[2]
end
function Z(e)
return e[3]
end
function Ce(e,a,t)
return{
je,
e,
a,
t,
}
end
function G(e)
return e[1]==je
end
function ze(e)
return e[2]
end
function qe(e)
return e[3]
end
function ke(e)
return e[4]
end
function j(t,e)
return{
xe,
t,
e,
}
end
function J(e)
return e[1]==xe
end
function fe(e)
return e[2]
end
function ce(e)
return e[3]
end
function W(t,e)
return{
se,
t,
e,
}
end
function B(e)
return e[1]==se
end
function be(e)
return e[2]
end
function ge(e)
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
elseif k(e)then
return t(e)
elseif a(e)then
return t(e)
elseif O(e)then
return t(e)
end
return e
end
function ve()
return{F}
end
function o(e)
return e[1]==F
end
function S(e,t)
if e==t then
return
end
if e==w then
e=t
t=w
end
e[1]=b
e[2]=t
e[3]=false
e[4]=false
end
function ne(e,a)
N(o(e))
N(not o(a))
local t=e
local e=a
t[1]=e[1]
t[2]=e[2]
t[3]=e[3]
t[4]=e[4]
end
function ht(t)
local e=ve()
ne(e,t)
return e
end
function E(a)
local t=w
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
function I(e)
if not Q(e)then
return e
end
local e=e
local t={}
while Q(e)do
v(t,e)
e=Je(e)
end
for a,t in ipairs(t)do
S(t,e)
end
return e
end
function re(e)
return K(e)or G(e)or J(e)or B(e)
end
function y(e)
return Q(e)or re(e)
end
function d(o,i,t,a)
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
return d(t,i,{
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
return n(st)
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
e=g(e)
t=t+1
end
end
while y(e)do
local s=m(e)
if i[s]==true then
return o()
end
if h[s]==true then
t[1]=true
if K(e)then
return o()
elseif J(e)then
local a=fe(e)
local e=ce(e)
local s={
Ne,
Se,
Ie,
Ae,
Fe,
Ge,
We,
Be,
Ve,
Ye,
Ke,
}
local i=false
for t,e in ipairs(s)do
if l(e,a)then
i=true
break
end
end
if i then
N(#e==1)
N(t[2]==false)
local e=d(e[1],r(),t)
if t[2]then
return n(j(a,{e}))
else
return q()
end
end
if l(a,ae)then
return o()
elseif l(a,pe)then
return o()
elseif l(a,we)then
return o()
elseif l(a,oe)then
N(#e==3)
N(t[2]==false)
local a=d(e[1],r(),t)
if t[2]then
return n(j(oe,{
a,
e[2],
e[3],
}))
else
return q()
end
end
return q()
elseif G(e)then
return o()
elseif B(e)then
return o()
end
return q()
end
h[s]=true
v(a,e)
e=g(e)
end
return s(e)
end
function g(a)
local e=I(a)
local t
N(not Q(e))
if K(e)then
t=tt(X(e),Z(e),a)
elseif G(e)then
t=rt(ze(e),qe(e),ke(e),a)
elseif J(e)then
t=it(fe(e),ce(e),a)
elseif B(e)then
t=ot(be(e),ge(e),a)
else
t=e
end
t=I(t)
S(e,t)
return t
end
function r(e)
return d(e)
end
function De(e)
while y(e)or O(e)do
e=r(ye(e))
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
function Me(t,a,o)
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
function Oe(t,a)
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
local o=w
do
local t=0
while t<#a do
o=s(e(a[(t+0)+1],a[(t+1)+1]),o)
t=t+2
end
end
return _(Re,e(o))
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
function nt(e,d,l,r)
local o={}
local s={}
local e=I(e)
local t=true
while true do
if h(e)then
return r(s,o)
elseif O(e)then
v(s,de(e))
e=V(e)
elseif a(e)then
v(o,i(e))
e=n(e)
elseif y(e)then
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
function tt(s,t,d)
local o=g(t)
if y(o)then
return d
end
local function t()return L(z,e(M,e(we,e(R(s),o))))end
if a(o)then
return nt(o,t,function()return d end,function(o,e)
if#o~=0 then
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
return Ce(s,o,a)
elseif l(e[1],et)then
if#e==1 then
return t()
end
local o=r(H(s,e[2]))
if not c(o)then
return t()
end
local r=g(T(o))
if y(r)then
return d
end
if not p(r)then
return t()
end
if not D(r,x)then
return t()
end
local o=g(A(o))
if y(o)then
return d
end
if not a(o)then
return t()
end
local i=i(o)
local a=g(n(o))
if y(a)then
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
return W(i,a)
elseif l(e[1],M)then
if#e==1 then
return t()
end
local o=e[2]
local a={}
do
local t=2
while t<#e do
v(a,H(s,e[t+1]))
t=t+1
end
end
return j(o,a)
else
local o=H(s,e[1])
local a={}
do
local t=1
while t<#e do
v(a,H(s,e[t+1]))
t=t+1
end
end
return W(o,a)
end
end)
elseif h(o)then
return o
elseif u(o)then
return Me(s,o,t())
elseif k(o)then
return t()
end
return q()
end
function u(e)
return p(e)or c(e)
end
function ot(l,d,m)
local function o()return L(z,e(M,e(pe,e(l,E(d)))))end
l=g(l)
if y(l)then
return m
end
if not c(l)then
return o()
end
local e=r(T(l))
if not(p(e)and D(e,t))then
return o()
end
local t=r(A(l))
if not a(t)then
return o()
end
local e=Y(i(t))
local t=r(n(t))
if not(a(t)and h(r(n(t))))then
return o()
end
local l=i(t)
local r=Le
local t=0
while not h(e)do
if u(e)then
local a=w
do
local e=#d-1
while e>=t do
a=s(d[e+1],a)
e=e-1
end
end
r=Ee(r,e,a)
t=#d
e=w
elseif a(e)then
if t<#d then
local a=d[t+1]
t=t+1
r=Ee(r,i(e),a)
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
return H(r,l)
end
function it(i,t,o)
local function a()return L(z,e(M,e(i,E(t))))end
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
return q()
end
end
return a()
end
function rt(i,o,t,a)
local function a()return L(z,e(ie,e(R(i),o,E(t))))end
if l(o,Pe)then
if#t~=1 then
return a()
end
return t[1]
elseif l(o,Xe)then
if#t~=2 then
return a()
end
return Qe(i,t[1],t[2],a)
elseif l(o,Ze)then
if#t~=2 then
return a()
end
return me(t[1],H(i,t[2]))
end
return a()
end
function ue(t)
return e(ie,Pe,t)
end
function Qe(c,r,y,f)
r=Y(r)
local d={}
local m=false
local o=r
while not h(o)do
if u(o)then
v(d,o)
m=true
o=w
elseif a(o)then
v(d,i(o))
o=n(o)
else
return f()
end
end
local o
if m then
o=E(d)
else
o=r
end
local a={}
Ue(c,function(t,e)
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
o=s(ue(Oe(c,a[e+1])),o)
e=e-1
end
end
return _(t,e(r,s(ue(_(t,e(i,y))),o)))
end
function l(t,e)
if t==e then
return true
end
t=r(t)
e=r(e)
if t==e then
return true
end
local function o(e,t,a,o)
if l(a(e),a(t))and l(o(e),o(t))then
S(e,t)
return true
else
return false
end
end
if h(t)then
if not h(e)then
return false
end
S(t,e)
return true
elseif p(t)then
if not p(e)then
return false
end
return D(t,e)
elseif a(t)then
if not a(e)then
return false
end
return o(t,e,i,n)
elseif k(t)then
if not k(e)then
return false
end
return o(t,e,C,U)
elseif c(t)then
if not c(e)then
return false
end
return o(t,e,T,A)
end
return q()
end
function m(e)
e=I(e)
local t=""
local o=""
if h(e)then
return"()"
elseif a(e)then
t="("
o=""
while a(e)do
t=tostring(t)..tostring(o)..tostring(m(i(e)))
o=" "
e=I(n(e))
end
if h(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(m(e))..")"
end
return t
elseif c(e)then
return"#"..tostring(m(s(T(e),A(e))))
elseif k(e)then
return"!"..tostring(m(s(C(e),U(e))))
elseif p(e)then
return P(e)
elseif O(e)then
return";("..tostring(m(de(e))).." "..tostring(m(V(e)))..")"
elseif K(e)then
return"$("..tostring(m(R(X(e)))).." "..tostring(m(Z(e)))..")"
elseif J(e)then
return"%("..tostring(m(fe(e))).." "..tostring(m(E(ce(e))))..")"
elseif G(e)then
return"@("..tostring(m(R(ze(e)))).." "..tostring(m(qe(e))).." "..tostring(m(E(ke(e))))..")"
elseif B(e)then
return"^("..tostring(m(be(e))).." "..tostring(m(E(ge(e))))..")"
end
return q()
end
le=0
he=1
ee=2
_e=3
Te=4
b=5
te=6
xe=7
je=8
se=9
f=11
F=10
local function o(e)
return{
le,
e,
}
end
w={ee}
local function Te(e)
local t=De(e)
local function o(e)
e[2]=Y(e[2])
e[3]=Y(e[3])
if O(e[2])or O(e[3])then
local t=ht(e)
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
elseif k(t)then
return o(t)
elseif a(t)then
return o(t)
end
return t
end
z=o("太始初核")
local xe=o("符名")
t=o("化滅")
x=o("式形")
local wt=o("等同")
local ft=o("解算")
local F=o("特定其物")
local f=o("省略一物")
Re=o("映表")
local yt=o("如若")
local u=o("一類何物")
local ee=o("是非")
local je=o("其子")
local nt=o("爻陽")
local it=o("爻陰")
local ct=o("引用")
local mt=o("應用")
local ut=o("間空")
local se=o("連頸")
local he=o("構物")
local le=o("謬誤")
local tt=o("詞素")
local Oe=o("列序")
local dt=o("首始")
local lt=o("尾末")
local ot=o("之物")
local d=o("宇宙亡矣")
local Je=o("效應")
local Qe=o("註疏")
st=L(z,e(d,f))
local function b(e)
return _(xe,s(z,s(e,w)))
end
local function _e(a)
return b(e(u,e(t,f,a),F))
end
local function d(o,a)
return b(e(u,e(t,e(o),f),a))
end
local function te(a)
return b(e(u,t,e(ee,e(u,a,f))))
end
local st=_e(he)
Ne=d(he,xe)
Se=d(he,Oe)
Ie=te(he)
local ht=_e(le)
Ae=d(le,xe)
Fe=d(le,Oe)
Ge=te(le)
local rt=_e(se)
We=te(se)
Be=d(se,dt)
Ve=d(se,lt)
Ye=te(tt)
Ke=te(ut)
ae=b(e(u,t,e(ee,wt)))
pe=b(e(u,e(t,s(t,f),f),mt))
we=b(e(u,t,ft))
local tt=d(Oe,e(u,ot,f))
oe=b(e(u,t,yt))
Pe=b(e(u,x,ct))
Xe=b(e(u,e(x,e(t,f,t)),F))
M=b(e(x,e(z,t)))
ie=b(e(x,e(z,x)))
et=b(e(x,x))
local Pe=b(e(u,t,Qe))
Ze=b(e(u,x,Qe))
local d=_(it,e())
local he=_(nt,e())
local function _e(e,o,s)
local t={}
while a(e)do
v(t,i(e))
e=n(e)
end
if h(e)then
return o(t)
end
return s(t,e)
end
local function M(e)
return _e(e,function(e)return e end,function(e,e)return false end)
end
local function Qe(e)
while Q(e)or O(e)do
e=I(ye(e))
end
return e
end
local function Oe(e)
if K(e)then
return e
elseif G(e)then
error("WIP")
elseif J(e)then
error("WIP")
elseif B(e)then
error("WIP")
end
return q()
end
local function Xe(e)
return X(Oe(e))
end
local function Ze(e)
return Z(Oe(e))
end
local function et(e)
if O(e)then
return V(e)
else
return g(e)
end
end
Le={}
local function ie(t)
t=r(t)
if not c(t)then
return false
end
local e=r(T(t))
if not p(e)then
return false
end
if not D(e,Re)then
return false
end
e=r(A(t))
if not a(e)then
return false
end
if not h(r(n(e)))then
return false
end
local t={}
local o=r(i(e))
while not h(o)do
if not a(o)then
return false
end
local e=r(i(o))
o=r(n(o))
if not a(e)then
return false
end
local o=i(e)
e=r(n(e))
if not a(e)then
return false
end
local i=i(e)
if not h(r(n(e)))then
return false
end
local a=true
do
local e=0
while e<#t do
if l(t[(e+0)+1],o)then
t[(e+1)+1]=i
a=false
break
end
e=e+2
end
end
if a then
v(t,o)
v(t,i)
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
if y(e)then
return j(t,{e})
end
if a(e)then
return he
end
return d
end,
}
end
local function te(t,i,o)
return{
t,
1,
function(e,a)
e=g(e)
if y(e)then
return j(t,{e})
end
if i(e)then
return o(e)
end
return a()
end,
}
end
at={
le(Ie,c),
{
st,
2,
_,
},
te(Ne,c,T),
te(Se,c,A),
le(Ge,k),
{
ht,
2,
L,
},
te(Ae,k,C),
te(Fe,k,U),
le(Ke,h),
{
rt,
2,
s,
},
le(We,a),
te(Be,a,i),
te(Ve,a,n),
{
ae,
2,
function(e,t,o)
if e==t then
return he
end
e=g(e)
t=g(t)
if y(e)or y(t)then
return j(ae,{
e,
t,
})
end
if e==t then
return he
end
local function o(t,e,a)
return j(oe,{
t,
e,
a,
})
end
local function s(e,t)
return o(e,t,d)
end
N(not y(e))
local function o(o,e,a,t)
return s(j(ae,{
a(o),
a(e),
}),j(ae,{
t(o),
t(e),
}))
end
if h(e)then
if not h(e)then
return d
end
return he
elseif p(e)then
if not p(t)then
return d
end
if D(e,t)then
return he
else
return d
end
elseif c(e)then
if not c(t)then
return d
end
return o(e,t,T,A)
elseif a(e)then
if not a(t)then
return d
end
return o(e,t,i,n)
elseif k(e)then
if not k(t)then
return d
end
return o(e,t,C,U)
end
return q()
end,
},
{
pe,
2,
function(o,e,s)
local t={}
local e=r(e)
while a(e)do
v(t,i(e))
e=r(n(e))
end
if not h(e)then
return s()
end
return W(o,t)
end,
},
{
we,
2,
function(e,a,t)
local e=ie(e)
if e==false then
return t()
end
return H(e,a)
end,
},
le(Ye,p),
{
tt,
1,
function(e,t)
e=g(e)
if y(e)then
return j(tt,{e})
end
if not a(e)then
return t()
end
return i(e)
end,
},
{
oe,
3,
function(e,a,o,t)
e=g(e)
if y(e)then
return j(oe,{
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
if D(e,nt)then
return a
end
if D(e,it)then
return o
end
return t()
end,
},
{
Pe,
2,
me,
},
}
local te
te=l
local function d(e,t)
if e==t then
return true
end
e=I(e)
t=I(t)
if e==t then
return true
end
local function o(t,e,a,o)
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
S(e,w)
S(t,w)
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
return o(e,t,i,n)
elseif k(e)then
if not k(t)then
return false
end
return o(e,t,C,U)
elseif c(e)then
if not c(t)then
return false
end
return o(e,t,T,A)
elseif re(e)then
return false
end
return q()
end
local function ae(J)
local V,y,l,d,c,r,A,T,K,g,M,C,I,O,S,D,R,U,Y,q,P,k,m,B,G,Q
function l()
return#V==y
end
function d()
N(not l())
local e=string.sub(V,y+1,y+1)
y=y+1
return e
end
function c(e)
N(string.sub(V,y,y)==e)
y=y-1
end
function r(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function A(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function T()
if l()then
return false
end
local e=d()
if not A(e)then
c(e)
return false
end
while A(e)and not l()do
e=d()
end
if not A(e)then
c(e)
end
return true
end
function K()
if l()then
return false
end
local e=d()
local t=""
if not U(e)then
c(e)
return false
end
while U(e)and not l()do
t=tostring(t)..tostring(e)
e=d()
end
if U(e)then
t=tostring(t)..tostring(e)
else
c(e)
end
return o(t)
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
local t=ve()
local a=t
local function i(a)
local e=ve()
ne(t,s(a,e))
t=e
end
while true do
T()
if l()then
return r()
end
e=d()
if e==")"then
ne(t,w)
return a
end
if e=="."then
T()
local o=Y()
ne(t,o)
T()
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
local e=Y()
i(e)
end
end
function M()
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
return _(i(e),n(e))
end
function C()
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
return L(i(e),n(e))
end
function U(e)
if A(e)then
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
function Y()
T()
local e={
g,
Q,
M,
C,
I,
O,
S,
D,
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
function q(e)
if e==false then
return r()
end
return e
end
function P()
return not l()
end
function k(e)
q(P())
q(d()==e)
end
function m(e)
if e==nil then
e=false
end
local function a()
k("[")
local e=m()
k("]")
return e
end
local t
if e then
t={
g,
K,
a,
M,
C,
I,
O,
S,
D,
R,
}
else
t={
g,
G,
M,
C,
I,
O,
S,
D,
R,
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
function B(a)
if l()then
return a
end
local o=d()
if o=="."then
local o=m()
return e(u,e(t,e(a),f),o)
elseif o==":"then
local t=m()
return e(u,t,a)
elseif o=="~"then
return e(ee,a)
elseif o=="@"then
local o=m()
return e(u,e(t,s(a,f),f),o)
elseif o=="?"then
return e(u,t,e(ee,a))
elseif o=="/"then
local t={a}
while true do
local e=m(true)
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
return e(je,E(t))
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
q(P())
local t=d()
if t=="+"then
local t=m()
return e(x,e(z,t))
else
c(t)
end
local t=m()
return e(x,t)
elseif a==":"then
q(P())
local a=d()
if a=="&"then
k(">")
local a=m()
return e(u,e(x,e(t,f,a)),F)
elseif a==">"then
local a=m()
return e(u,e(t,f,a),F)
else
c(a)
end
local t=m()
return e(u,t,F)
elseif a=="+"then
local t=m()
return e(z,t)
elseif a=="["then
local e=m()
k("]")
return B(e)
elseif a=="_"then
k(":")
local t=m()
return e(u,t,f)
else
c(a)
local e=K()
if e==false then
return false
end
return B(e)
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
V=J
y=0
local function t(t,o)
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
local t=n(e)
if not(a(t)and h(n(t)))then
return r()
end
return o(i(e),i(t))
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
local t=n(e)
if not a(t)then
return r()
end
local o=n(t)
if not(a(o)and h(n(o)))then
return r()
end
return s(i(e),i(t),i(o))
end
end
I=t("$",function(e,t)
local e=ie(e)
if e==false then
return r()
end
return H(e,t)
end)
O=t("%",function(t,e)
local e=_e(e,function(e)return e end,function(e,e)return r()end)
return j(t,e)
end)
S=s("@",function(o,a,e)
local t=_e(e,function(e)return e end,function(e,e)return r()end)
local e=ie(o)
if e==false then
return r()
end
return Ce(e,a,t)
end)
D=t("^",function(t,e)
local e=_e(e,function(e)return e end,function(e,e)return r()end)
return W(t,e)
end)
R=t(";",function(t,e)return me(t,e)end)
return Y()
end
local function j(w)
local function o(r,l)
if p(r)then
return P(r)
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
if r~=false and#r==1 and d(h[3],f)then
return s(tostring(o(r[1],true)).."."..tostring(o(e[3],true)))
elseif a(t)and d(n(t),f)and d(h[3],f)then
return s(tostring(o(i(t),true)).."@"..tostring(o(e[3],true)))
elseif d(t,f)and d(e[3],F)then
return s(":>"..tostring(o(h[3],true)))
end
end
local a=M(e[3])
if d(e[2],t)and a~=false and#a==2 and d(a[1],ee)then
return s(tostring(o(a[2],true)).."?")
end
if h~=false and#h==2 and d(e[3],F)and d(h[1],x)then
local e=M(h[2])
if e~=false and#e==3 and d(e[1],t)and d(e[2],f)then
return s(":&>"..tostring(o(e[3],true)))
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
return s(tostring(t)..":"..tostring(o(e[2],true)))
elseif e~=false and#e==2 then
if d(e[1],x)then
local t=M(e[2])
if t~=false and#t==2 and d(t[1],z)then
return s("&+"..tostring(o(t[2],true)))
end
return s("&"..tostring(o(e[2],true)))
elseif d(e[1],ee)then
return s(tostring(o(e[2],true)).."~")
elseif d(e[1],z)then
return s("+"..tostring(o(e[2],true)))
elseif d(e[1],je)then
local e=M(e[2])
if e~=false and#e>1 then
local a=o(e[1],true)
do
local t=1
while t<#e do
a=tostring(a).."/"..tostring(o(e[t+1],true))
t=t+1
end
end
return s(a)
end
end
end
if l then
return m(r)
else
return m(b(r))
end
end
local e=ae(m(w))
local t=""
local r=""
if h(e)then
return"()"
elseif a(e)then
t="("
r=""
while a(e)do
t=tostring(t)..tostring(r)..tostring(j(i(e)))
r=" "
e=n(e)
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
local e=M(t)
if e~=false and#e==2 and d(a,xe)and d(e[1],z)then
return o(e[2],false)
end
return"#"..tostring(j(s(a,t)))
elseif k(e)then
return"!"..tostring(j(s(C(e),U(e))))
elseif p(e)then
return P(e)
elseif O(e)then
return";("..tostring(j(de(e))).." "..tostring(j(V(e)))..")"
elseif K(e)then
return"$("..tostring(j(R(X(e)))).." "..tostring(j(Z(e)))..")"
elseif J(e)then
return"%("..tostring(j(fe(e))).." "..tostring(j(E(ce(e))))..")"
elseif G(e)then
return"@("..tostring(j(R(ze(e)))).." "..tostring(j(qe(e))).." "..tostring(j(E(ke(e))))..")"
elseif B(e)then
return"^("..tostring(j(be(e))).." "..tostring(j(E(ge(e))))..")"
end
return q()
end
local function B(a)
local e,n,t
function n()
return e==0
end
function t()
return not n()
end
e=#a
local function i(e)
if e==nil then
e=""
end
error("MT parse ERROR "..tostring(e))
end
local function h(e)
if not e then
return i()
end
end
local function r()
h(t())
e=e-1
return string.sub(a,e+1,e+1)
end
local e={}
local function a(o)
local a=table.remove(e)
local t=table.remove(e)
if t==nil or a==nil then
return i()
else
return He(e,o(t,a))
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
He(e,o(t))
elseif t=="."then
a(s)
elseif t=="#"then
a(_)
elseif t=="!"then
a(L)
elseif t=="$"then
a(function(e,t)
local e=ie(e)
if e==false then
return i()
else
return H(e,t)
end
end)
elseif t=="_"then
He(e,w)
else
return i()
end
end
h(n())
h(#e==1)
return e[1]
end
local function S(e)
local s={e}
local t=""
while#s~=0 do
local r={}
for o,e in ipairs(s)do
e=I(e)
local function o(e,i,o,a)
t=tostring(t)..tostring(i)
return v(r,o(e),a(e))
end
if p(e)then
t=tostring(t)..tostring(("^"..tostring(P(e)).."^"))
elseif a(e)then
o(e,".",i,n)
elseif h(e)then
t=tostring(t)..tostring(("_"))
elseif c(e)then
o(e,"#",T,A)
elseif k(e)then
o(e,"!",C,U)
elseif re(e)then
local e=Oe(e)
o(e,"$",(function(e)return R(X(e))end),Z)
else
return q()
end
end
s=r
end
return t
end
local function x(e)
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
local function z(e)
local e=e()
while e[1]do
e=e[2]()
end
return e[2]
end
local q=b(s(je,s(s(Je,s(s(u,s(ot,s(f,w))),w)),w)))
local b=b(s(je,s(s(Je,s(se,w)),w)))
local function N(t,a)
return _(b,e(t,a))
end
local function F(e)
return _(q,e)
end
local function f(w,y,u,m,d)
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
if l(c,q)then
s=r(s)
if a(s)then
local e=i(s)
local t=r(n(s))
if h(t)then
if d==false then
local a=e
local t=m
local function e()return w(a,t)end
return v(e)
else
local a
a=w
local t
t=y
local e=e
local o=m
local function i()return f(a,t,W(d,e),o)end
return v(i)
end
end
end
elseif l(c,b)then
s=r(s)
if a(s)then
local l=i(s)
local s=r(n(s))
if a(s)then
local i=i(s)
local a=r(n(s))
if h(a)then
if d==false then
local t
t=w
local e
e=y
local o=l
local i=i
local a=m
local function n()return f(t,e,o,a,i)end
return v(n)
else
local a
a=w
local n
n=y
local r=l
local l=i
local s=m
local i=d
local o=o("序甲")
local function h()return f(a,n,r,s,_(t,e(e(o),p(e(ue(l),o),ue(i)))))end
return v(h)
end
end
end
end
end
end
if d==false then
return v(function()return y(u,m,w)end)
else
return v(function()return y(u,m,function(e,t)return v(function()return f(w,y,W(d,{e}),t)end)end)end)
end
end
local function d(e,t,a,o)
return f(e,t,a,o)
end
local function l(a,n,o,i)
return z(f((function(t,e)return x(a(t,e))end),(function(a,e,t)return x(n(a,e,function(e,a)return z(t(e,a))end))end),o,i))
end
local t={}
t.new_comment=me
t.comment_p=O
t.comment_comment=de
t.comment_x=V
t.un_comment_all=ye
t.new_atom=o
t.atom_p=p
t.un_atom=P
t.atom_equal_p=D
t.new_construction=s
t.construction_p=a
t.construction_head=i
t.construction_tail=n
t.null_v=w
t.null_p=h
t.new_data=_
t.data_p=c
t.data_name=T
t.data_list=A
t.new_error=L
t.error_p=k
t.error_name=C
t.error_list=U
t.just_p=Q
t.evaluate=H
t.apply=W
t.force_all_rec=Y
t.force_uncomment_all_rec=Te
t.jsArray_to_list=E
t.maybe_list_to_jsArray=M
t.new_list=e
t.un_just_all=I
t.un_just_comment_all=Qe
t.delay_p=re
t.delay_just_p=y
t.delay_env=Xe
t.delay_x=Ze
t.force_all=r
t.force1=g
t.force_uncomment1=et
t.force_uncomment_all=De
t.env_null_v=Le
t.env_set=Ee
t.env_get=Me
t.env2val=R
t.env_foreach=Ue
t.val2env=ie
t.equal_p=te
t.simple_print=m
t.complex_parse=ae
t.complex_print=j
t.machinetext_parse=B
t.machinetext_print=S
t.trampoline_return=x
t.trampoline_delay=v
t.run_trampoline=z
t.return_effect_systemName=q
t.bind_effect_systemName=b
t.new_effect_bind=N
t.new_effect_return=F
t.run_monad_trampoline=d
t.run_monad_stackoverflow=l
return t
