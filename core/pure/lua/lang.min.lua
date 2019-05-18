function __TS__ArrayPush(e,...)
local t=({...})
for a=1,#t do
local t=t[a]
e[#e+1]=t
end
return#e
end
local t={}
local j,L,Oe,Ie,Qe,Pe,Ye,We,Ve,nt,Ke,Be,Ge,Ze,Ne,Je,ue,S,ke,oe,ge,tt,g,ce,at,i,le,h,a,o,n,b,r,E,m,T,A,R,q,M,W,J,pt,H,K,ae,ne,et,B,qe,ze,je,O,G,de,re,P,Q,_e,xe,F,ee,bt,I,V,xt,z,he,l,x,C,f,Xe,u,Z,pe,zt,p,Fe,Le,Re,De,Se,He,Ue,it,Me,Ce,ot,te,ve,ye,se,lt,ct,ie,we,qt,kt,Y,_,fe,D,e,U,Te,v,s,k,st,Ae,Ee,ht,_t,N,ut,me,jt,be,rt,yt,ft,wt,X,vt,c,d,w,dt,y,gt,mt
function j()
error("TheLanguage PANIC")
end
function L(e)
if not e then
return j()
end
end
function ue(e,t)
return{
Ne,
e,
t,
}
end
function S(e)
return e[0+1]==Ne
end
function ke(e)
return e[1+1]
end
function oe(e)
return e[2+1]
end
function ge(e)
while S(e)do
e=oe(e)
end
return e
end
function tt(e)
return{
Qe,
e,
}
end
function g(e)
return e[0+1]==Qe
end
function ce(e)
return e[1+1]
end
function at(e)
return Oe()[e]~=nil
end
function i(e)
return tt(Oe()[e])
end
function le(e)
return Ie()[ce(e)]
end
function h(e,t)
return{
Pe,
e,
t,
}
end
function a(e)
return e[0+1]==Pe
end
function o(e)
return e[1+1]
end
function n(e)
return e[2+1]
end
function r(e)
return e[0+1]==Ye
end
function E(t,e)
return{
We,
t,
e,
}
end
function m(e)
return e[0+1]==We
end
function T(e)
return e[1+1]
end
function A(e)
return e[2+1]
end
function R(t,e)
return{
Ve,
t,
e,
}
end
function q(e)
return e[0+1]==Ve
end
function M(e)
return e[1+1]
end
function W(e)
return e[2+1]
end
function J(e)
return e[0+1]==nt
end
function pt(e)
return e[1+1]
end
function H(t,e)
return{
Ke,
t,
e,
}
end
function K(e)
return e[0+1]==Ke
end
function ae(e)
return e[1+1]
end
function ne(e)
return e[2+1]
end
function et(a,t,e)
return{
Ge,
a,
t,
e,
}
end
function B(e)
return e[0+1]==Ge
end
function qe(e)
return e[1+1]
end
function ze(e)
return e[2+1]
end
function je(e)
return e[3+1]
end
function O(e,t)
return{
Be,
e,
t,
}
end
function G(e)
return e[0+1]==Be
end
function de(e)
return e[1+1]
end
function re(e)
return e[2+1]
end
function P(t,e)
return{
Ze,
t,
e,
}
end
function Q(e)
return e[0+1]==Ze
end
function _e(e)
return e[1+1]
end
function xe(e)
return e[2+1]
end
function F(e)
local e=s(e)
local function t(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
return e
end
if m(e)then
return t(e)
elseif q(e)then
return t(e)
elseif a(e)then
return t(e)
elseif S(e)then
return t(e)
end
return e
end
function ee()
return{Je}
end
function bt(e)
return e[0+1]==Je
end
function I(e,t)
if e==t then
return
end
e[0+1]=nt
e[1+1]=t
e[2+1]=false
e[3+1]=false
end
function V(e,a)
L(bt(e))
local t=e
local e=a
t[0+1]=e[0+1]
t[1+1]=e[1+1]
t[2+1]=e[2+1]
t[3+1]=e[3+1]
end
function xt(t)
local e=ee()
V(e,t)
return e
end
function p(e)
return E(he,h(z,h(e,b)))
end
function Y(t,e)
if t==e then
return true
end
if ce(t)==ce(e)then
I(t,e)
return true
else
return false
end
end
function _(a)
local t=b
do
local e=#a-1
while e>=0 do
t=h(a[e+1],t)
e=e-1
end
end
return t
end
function fe(e,i,s)
local t={}
while a(e)do
__TS__ArrayPush(t,o(e))
e=n(e)
end
if r(e)then
return i(t)
end
return s(t,e)
end
function D(e)
return fe(e,function(e)return e end,function(e,e)return false end)
end
function e(...)
local e=({...})
return _(e)
end
function U(e)
if not J(e)then
return e
end
local e=e
local t={}
while J(e)do
__TS__ArrayPush(t,e)
e=pt(e)
end
for a=1,#t do
local t=t[a]
I(t,e)
end
return e
end
function Te(e)
return K(e)or B(e)or G(e)or Q(e)
end
function v(e)
return J(e)or Te(e)
end
function s(o,i,t,a)
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
if v(t)then
__TS__ArrayPush(a,e)
return s(t,i,{
false,
false,
},a)
end
return t
end
local r={}
e=o
local function o()
t[1+1]=true
return n(zt)
end
local function d()
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
while v(e)and t<32 do
__TS__ArrayPush(a,e)
e=k(e)
t=t+1
end
end
while v(e)do
local h=w(e)
if i[h]==true then
return o()
end
if r[h]==true then
t[0+1]=true
if K(e)then
return o()
elseif G(e)then
local a=de(e)
local e=re(e)
local i={
Fe,
Le,
Re,
De,
Se,
He,
Ue,
it,
Me,
Ce,
ot,
}
local h=false
for e=1,#i do
local e=i[e]
if c(e,a)then
h=true
break
end
end
if h then
L(#e==1)
L(t[1+1]==false)
local e=s(e[0+1],d(),t)
if t[1+1]then
return n(O(a,{e}))
else
return j()
end
end
if c(a,te)then
return o()
elseif c(a,ve)then
return o()
elseif c(a,ye)then
return o()
elseif c(a,se)then
L(#e==3)
L(t[1+1]==false)
local a=s(e[0+1],d(),t)
if t[1+1]then
return n(O(se,{
a,
e[1+1],
e[2+1],
}))
else
return j()
end
end
return j()
elseif B(e)then
return o()
elseif Q(e)then
return o()
end
return j()
end
r[h]=true
__TS__ArrayPush(a,e)
e=k(e)
end
return h(e)
end
function k(a)
local e=U(a)
local t
L(not J(e))
if K(e)then
t=jt(ae(e),ne(e),a)
elseif B(e)then
t=wt(qe(e),ze(e),je(e),a)
elseif G(e)then
t=ft(de(e),re(e),a)
elseif Q(e)then
t=yt(_e(e),xe(e),a)
else
t=e
end
t=U(t)
I(e,t)
return t
end
function st(e)
while v(e)or S(e)do
e=s(ge(e))
end
return e
end
function Ee(a,o,i)
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
function ht(t,a,o)
do
local e=0
while e<#t do
if c(t[(e+0)+1],a)then
return t[(e+1)+1]
end
e=e+2
end
end
return o
end
function _t(t,a)
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
function N(o)
local a=b
do
local t=0
while t<#o do
a=h(e(o[(t+0)+1],o[(t+1)+1]),a)
t=t+2
end
end
return E(Xe,e(a))
end
function ut(t,a)
do
local e=0
while e<#t do
a(t[(e+0)+1],t[(e+1)+1])
e=e+2
end
end
end
function me(t)
t=s(t)
if not m(t)then
return false
end
local e=s(T(t))
if not g(e)then
return false
end
if not Y(e,Xe)then
return false
end
e=s(A(t))
if not a(e)then
return false
end
if not r(s(n(e)))then
return false
end
local t={}
local i=s(o(e))
while not r(i)do
if not a(i)then
return false
end
local e=s(o(i))
i=s(n(i))
if not a(e)then
return false
end
local i=o(e)
e=s(n(e))
if not a(e)then
return false
end
local a=o(e)
if not r(s(n(e)))then
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
__TS__ArrayPush(t,i)
__TS__ArrayPush(t,a)
end
end
return t
end
function jt(h,t,d)
local i=k(t)
if v(i)then
return d
end
local t=R(z,e(ie,e(ye,e(N(h),i))))
if a(i)then
local e={}
local i=i
while not r(i)do
if v(i)then
return d
elseif a(i)then
__TS__ArrayPush(e,o(i))
i=k(n(i))
else
return t
end
end
if c(e[0+1],we)then
if#e==1 then
return t
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return et(h,o,a)
elseif c(e[0+1],qt)then
if#e==1 then
return t
end
local s=s(H(h,e[1+1]))
if not m(s)then
return t
end
local i=k(T(s))
if v(i)then
return d
end
if not g(i)then
return t
end
if not Y(i,x)then
return t
end
local i=k(A(s))
if v(i)then
return d
end
if not a(i)then
return t
end
local o=o(i)
local a=k(n(i))
if v(a)then
return d
end
if not r(a)then
return t
end
local a={N(h)}
do
local t=2
while t<#e do
__TS__ArrayPush(a,e[t+1])
t=t+1
end
end
return P(o,a)
elseif c(e[0+1],ie)then
if#e==1 then
return t
end
local o=e[1+1]
local a={}
do
local t=2
while t<#e do
__TS__ArrayPush(a,H(h,e[t+1]))
t=t+1
end
end
return O(o,a)
else
local o=H(h,e[0+1])
local a={}
do
local t=1
while t<#e do
__TS__ArrayPush(a,H(h,e[t+1]))
t=t+1
end
end
return P(o,a)
end
elseif r(i)then
return i
elseif be(i)then
return ht(h,i,t)
elseif q(i)then
return t
end
return j()
end
function be(e)
return g(e)or m(e)
end
function yt(t,d,u)
local function i()
return R(z,e(ie,e(ve,e(t,_(d)))))
end
t=k(t)
if v(t)then
return u
end
if not m(t)then
return i()
end
local e=s(T(t))
if not(g(e)and Y(e,l))then
return i()
end
local t=s(A(t))
if not a(t)then
return i()
end
local e=F(o(t))
local t=s(n(t))
if not(a(t)and r(s(n(t))))then
return i()
end
local l=o(t)
local s=Ae
local t=0
while not r(e)do
if be(e)then
local a=b
do
local e=#d-1
while e>=t do
a=h(d[e+1],a)
e=e-1
end
end
s=Ee(s,e,a)
t=#d
e=b
elseif a(e)then
if t<#d then
local a=d[t+1]
t=t+1
s=Ee(s,o(e),a)
e=n(e)
else
return i()
end
else
return i()
end
end
if#d~=t then
return i()
end
return H(s,l)
end
function ft(i,t,o)
local a=R(z,e(ie,e(i,_(t))))
for e=1,#rt do
local e=rt[e]
if c(i,e[0+1])then
if#t~=e[1+1]then
return a
end
if e[1+1]==1 then
return e[2+1](t[0+1],a,o)
elseif e[1+1]==2 then
return e[2+1](t[0+1],t[1+1],a,o)
elseif e[1+1]==3 then
return e[2+1](t[0+1],t[1+1],t[2+1],a,o)
end
return j()
end
end
return a
end
function wt(o,a,t,i)
local e=R(z,e(we,e(N(o),a,_(t))))
if c(a,lt)then
if#t~=1 then
return e
end
return t[0+1]
elseif c(a,ct)then
if#t~=2 then
return e
end
return vt(o,t[0+1],t[1+1],e)
elseif c(a,kt)then
if#t~=2 then
return e
end
return ue(t[0+1],H(o,t[1+1]))
end
return e
end
function X(t)
return e(we,lt,t)
end
function vt(d,i,u,t)
if t==nil then
t=false
end
local function f()
if t==false then
return R(z,e(we,e(N(d),ct,_({
i,
u,
}))))
else
return t
end
end
i=F(i)
local s={}
local m=false
local t=i
while not r(t)do
if be(t)then
__TS__ArrayPush(s,t)
m=true
t=b
elseif a(t)then
__TS__ArrayPush(s,o(t))
t=n(t)
else
return f()
end
end
local a=i
if m then
a=_(s)
end
local t={}
ut(d,function(a,e)
do
local e=0
while e<#s do
if c(s[e+1],a)then
return
end
e=e+1
end
end
__TS__ArrayPush(t,a)
end)
local o=a
do
local e=#t-1
while e>=0 do
o=h(t[e+1],o)
e=e-1
end
end
local a=a
do
local e=#t-1
while e>=0 do
a=h(X(_t(d,t[e+1])),a)
e=e-1
end
end
return E(l,e(i,h(X(E(l,e(o,u))),a)))
end
function c(e,t)
if e==t then
return true
end
e=s(e)
t=s(t)
if e==t then
return true
end
local function i(t,e,a,o)
if c(a(t),a(e))and c(o(t),o(e))then
I(t,e)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
I(e,b)
I(t,b)
return true
elseif g(e)then
if not g(t)then
return false
end
return Y(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,M,W)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,T,A)
end
return j()
end
function d(e,t)
if e==t then
return true
end
e=U(e)
t=U(t)
if e==t then
return true
end
local function i(e,t,o,a)
if d(o(e),o(t))and d(a(e),a(t))then
I(e,t)
return true
else
return false
end
end
if r(e)then
if not r(t)then
return false
end
I(e,b)
I(t,b)
return true
elseif g(e)then
if not g(t)then
return false
end
return Y(e,t)
elseif a(e)then
if not a(t)then
return false
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return false
end
return i(e,t,M,W)
elseif m(e)then
if not m(t)then
return false
end
return i(e,t,T,A)
elseif K(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif B(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return j()
end
function w(e)
e=U(e)
local t=""
local i=""
if r(e)then
return"()"
elseif a(e)then
t="("
i=""
while a(e)do
t=tostring(t)..tostring(i)..tostring(w(o(e)))
i=" "
e=U(n(e))
end
if r(e)then
t=tostring(t)..")"
else
t=tostring(t).." . "..tostring(w(e))..")"
end
return t
elseif m(e)then
return"#"..tostring(w(h(T(e),A(e))))
elseif q(e)then
return"!"..tostring(w(h(M(e),W(e))))
elseif g(e)then
return le(e)
elseif K(e)then
return"$("..tostring(w(N(ae(e)))).." "..tostring(w(ne(e)))..")"
elseif G(e)then
return"%("..tostring(w(de(e))).." "..tostring(w(_(re(e))))..")"
elseif B(e)then
return"@("..tostring(w(N(qe(e)))).." "..tostring(w(ze(e))).." "..tostring(w(_(je(e))))..")"
elseif Q(e)then
return"^("..tostring(w(_e(e))).." "..tostring(w(_(xe(e))))..")"
elseif S(e)then
return";("..tostring(y(ke(e))).." "..tostring(y(oe(e)))..")"
end
return j()
end
function dt(J)
local T,w,d,s,c,t,q,k,B,y,A,I,M,F,U,N,S,D,W,j,Y,v,m,G,K,Q
function d()
return#T==w
end
function s()
L(not d())
local e=string.sub(T,w+1,w+1)
w=w+1
return e
end
function c(e)
L(string.sub(T,(w-1)+1,(w-1)+1)==e)
w=w-1
end
function t(e)
if e==nil then
e=""
end
error("TheLanguage parse ERROR!"..tostring(e))
end
function q(e)
return e==" "or e=="\n"or e=="\t"or e=="\r"
end
function k()
if d()then
return false
end
local e=s()
if not q(e)then
c(e)
return false
end
while q(e)and not d()do
e=s()
end
if not q(e)then
c(e)
end
return true
end
function B()
if d()then
return false
end
local e=s()
local a=""
if not D(e)then
c(e)
return false
end
while D(e)and not d()do
a=tostring(a)..tostring(e)
e=s()
end
if D(e)then
a=tostring(a)..tostring(e)
else
c(e)
end
if at(a)then
return i(a)
else
return t("Not Symbol"..tostring(a))
end
end
function y()
if d()then
return false
end
local e=s()
if e~="("then
c(e)
return false
end
local a=ee()
local o=a
local function n(t)
local e=ee()
V(a,h(t,e))
a=e
end
while true do
k()
if d()then
return t()
end
e=s()
if e==")"then
V(a,b)
return o
end
if e=="."then
k()
local i=W()
V(a,i)
k()
if d()then
return t()
end
e=s()
if e~=")"then
return t()
end
return o
end
c(e)
local e=W()
n(e)
end
end
function A()
if d()then
return false
end
local e=s()
if e~="#"then
c(e)
return false
end
local e=y()
if e==false then
return t()
end
if not a(e)then
return t()
end
return E(o(e),n(e))
end
function I()
if d()then
return false
end
local e=s()
if e~="!"then
c(e)
return false
end
local e=y()
if e==false then
return t()
end
if not a(e)then
return t()
end
return R(o(e),n(e))
end
function D(t)
if q(t)then
return false
end
local e={
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
}
for a=1,#e do
local e=e[a]
if e==t then
return false
end
end
return true
end
function W()
k()
local e={
y,
Q,
A,
I,
M,
F,
U,
N,
S,
}
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return t()
end
function j(e)
if e==false then
return t()
end
return e
end
function Y()
return not d()
end
function v(e)
j(Y())
j(s()==e)
end
function m(a)
if a==nil then
a=false
end
local function o()
v("[")
local e=m()
v("]")
return e
end
local e
if a then
e={
y,
B,
o,
A,
I,
M,
F,
U,
N,
S,
}
else
e={
y,
K,
A,
I,
M,
F,
U,
N,
S,
}
end
for t=1,#e do
local e=e[t]
local e=e()
if e~=false then
return e
end
end
return t()
end
function G(t)
if d()then
return t
end
local a=s()
if a=="."then
local a=m()
return e(u,e(l,e(t),f),a)
elseif a==":"then
local a=m()
return e(u,a,t)
elseif a=="~"then
return e(Z,t)
elseif a=="@"then
local a=m()
return e(u,e(l,h(t,f),f),a)
elseif a=="?"then
return e(u,l,e(Z,t))
elseif a=="/"then
local t={t}
while true do
local e=m(true)
__TS__ArrayPush(t,e)
if d()then
break
end
local e=s()
if e~="/"then
c(e)
break
end
end
return e(pe,_(t))
else
c(a)
return t
end
end
function K()
if d()then
return false
end
local t=s()
if t=="&"then
j(Y())
local t=s()
if t=="+"then
local t=m()
return e(x,e(z,t))
else
c(t)
end
local t=m()
return e(x,t)
elseif t==":"then
j(Y())
local t=s()
if t=="&"then
v(">")
local t=m()
return e(u,e(x,e(l,f,t)),C)
elseif t==">"then
local t=m()
return e(u,e(l,f,t),C)
else
c(t)
end
local t=m()
return e(u,t,C)
elseif t=="+"then
local t=m()
return e(z,t)
elseif t=="["then
local e=m()
v("]")
return G(e)
elseif t=="_"then
v(":")
local t=m()
return e(u,t,f)
else
c(t)
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
if g(e)then
return e
end
return p(e)
end
T=J
w=0
local function i(i,h)
return function()
if d()then
return false
end
local e=s()
if e~=i then
c(e)
return false
end
local e=y()
if e==false then
return t()
end
if not a(e)then
return t()
end
local i=n(e)
if not(a(i)and r(n(i)))then
return t()
end
return h(o(e),o(i))
end
end
local function l(i,h)
return function()
if d()then
return false
end
local e=s()
if e~=i then
c(e)
return false
end
local e=y()
if e==false then
return t()
end
if not a(e)then
return t()
end
local i=n(e)
if not a(i)then
return t()
end
local s=n(i)
if not(a(s)and r(n(s)))then
return t()
end
return h(o(e),o(i),o(s))
end
end
M=i("$",function(e,a)
local e=me(e)
if e==false then
return t()
end
return H(e,a)
end)
F=i("%",function(e,a)
local t=fe(a,function(e)return e end,function(e,e)return t()end)
return O(e,t)
end)
U=l("@",function(o,a,e)
local i=fe(e,function(e)return e end,function(e,e)return t()end)
local e=me(o)
if e==false then
return t()
end
return et(e,a,i)
end)
N=i("^",function(a,e)
local e=fe(e,function(e)return e end,function(e,e)return t()end)
return P(a,e)
end)
S=i(";",function(t,e)return ue(t,e)end)
return W()
end
function y(v)
local function t(h,c)
if g(h)then
return le(h)
end
local function i(e)
if c then
return"["..tostring(e).."]"
else
return e
end
end
local e=D(h)
if e~=false and#e==3 and d(e[0+1],u)then
local s=D(e[1+1])
if s~=false and#s==3 and d(s[0+1],l)then
local h=s[1+1]
local r=D(h)
if r~=false and#r==1 and d(s[2+1],f)then
return i(tostring(t(r[0+1],true)).."."..tostring(t(e[2+1],true)))
elseif a(h)and d(n(h),f)and d(s[2+1],f)then
return i(tostring(t(o(h),true)).."@"..tostring(t(e[2+1],true)))
elseif d(h,f)and d(e[2+1],C)then
return i(":>"..tostring(t(s[2+1],true)))
end
end
local a=D(e[2+1])
if d(e[1+1],l)and a~=false and#a==2 and d(a[0+1],Z)then
return i(tostring(t(a[1+1],true)).."?")
end
if s~=false and#s==2 and d(e[2+1],C)and d(s[0+1],x)then
local e=D(s[1+1])
if e~=false and#e==3 and d(e[0+1],l)and d(e[1+1],f)then
return i(":&>"..tostring(t(e[2+1],true)))
end
end
local a=d(e[2+1],f)and"_"or d(e[2+1],C)and""or t(e[2+1],true)
return i(tostring(a)..":"..tostring(t(e[1+1],true)))
elseif e~=false and#e==2 then
if d(e[0+1],x)then
local a=D(e[1+1])
if a~=false and#a==2 and d(a[0+1],z)then
return i("&+"..tostring(t(a[1+1],true)))
end
return i("&"..tostring(t(e[1+1],true)))
elseif d(e[0+1],Z)then
return i(tostring(t(e[1+1],true)).."~")
elseif d(e[0+1],z)then
return i("+"..tostring(t(e[1+1],true)))
elseif d(e[0+1],pe)then
local e=D(e[1+1])
if e~=false and#e>1 then
local o=t(e[0+1],true)
do
local a=1
while a<#e do
o=tostring(o).."/"..tostring(t(e[a+1],true))
a=a+1
end
end
return i(o)
end
end
end
if c then
return w(h)
else
return w(p(h))
end
end
local e=dt(w(v))
local i=""
local s=""
if r(e)then
return"()"
elseif a(e)then
i="("
s=""
while a(e)do
i=tostring(i)..tostring(s)..tostring(y(o(e)))
s=" "
e=n(e)
end
if r(e)then
i=tostring(i)..")"
else
i=tostring(i).." . "..tostring(y(e))..")"
end
return i
elseif m(e)then
local a=T(e)
local o=A(e)
local e=D(o)
if e~=false and#e==2 and d(a,he)and d(e[0+1],z)then
return t(e[1+1],false)
end
return"#"..tostring(y(h(a,o)))
elseif q(e)then
return"!"..tostring(y(h(M(e),W(e))))
elseif g(e)then
return le(e)
elseif K(e)then
return"$("..tostring(y(N(ae(e)))).." "..tostring(y(ne(e)))..")"
elseif G(e)then
return"%("..tostring(y(de(e))).." "..tostring(y(_(re(e))))..")"
elseif B(e)then
return"@("..tostring(y(N(qe(e)))).." "..tostring(y(ze(e))).." "..tostring(y(_(je(e))))..")"
elseif Q(e)then
return"^("..tostring(y(_e(e))).." "..tostring(y(_(xe(e))))..")"
elseif S(e)then
return";("..tostring(y(ke(e))).." "..tostring(y(oe(e)))..")"
end
return j()
end
function gt()
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
function mt()
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
Oe=function()
local e=gt()
Oe=function()return e end
return e
end
Ie=function()
local e=mt()
Ie=function()return e end
return e
end
Qe=0
Pe=1
Ye=2
We=3
Ve=4
nt=5
Ke=6
Be=7
Ge=8
Ze=9
Ne=11
Je=10
t.new_comment=ue
t.comment_p=S
t.comment_comment=ke
t.comment_x=oe
t.un_comment_all=ge
local function Oe(e)
return Ie()[e]~=nil
end
t.can_new_symbol_p=at
t.New_Symbol=New_Symbol
t.new_symbol=i
t.symbol_p=g
t.un_symbol=le
t.New_Construction=New_Construction
t.new_construction=h
t.construction_p=a
t.construction_head=o
t.construction_tail=n
b={Ye}
t.Null_V=Null_V
t.null_v=b
t.null_p=r
t.New_Data=New_Data
t.new_data=E
t.data_p=m
t.data_name=T
t.data_list=A
t.New_Error=New_Error
t.new_error=R
t.error_p=q
t.error_name=M
t.error_list=W
t.just_p=J
t.evaluate=H
t.apply=P
local function d(e)
local o=st(e)
local function i(e)
e[1+1]=F(e[1+1])
e[2+1]=F(e[2+1])
if S(e[1+1])or S(e[2+1])then
local t=xt(e)
local a=e[1+1]
local e=e[2+1]
local a=d(a)
local e=d(e)
t[1+1]=a
t[2+1]=e
return t
else
return e
end
end
if m(o)then
return i(o)
elseif q(o)then
return i(o)
elseif a(o)then
return i(o)
end
return o
end
t.force_all_rec=F
t.force_uncomment_all_rec=d
z=i("太始初核")
he=i("符名")
l=i("化滅")
x=i("式形")
local Ke=i("等同")
local Be=i("解算")
C=i("特定其物")
f=i("省略一物")
Xe=i("映表")
local Ge=i("如若")
u=i("一類何物")
Z=i("是非")
pe=i("其子")
local xe=i("爻陽")
local ze=i("爻陰")
local Ve=i("引用")
local Ne=i("應用")
local Ie=i("間空")
local re=i("連頸")
local le=i("構物")
local de=i("謬誤")
local We=i("詞素")
local fe=i("列序")
local Pe=i("首始")
local Ye=i("尾末")
local je=i("之物")
local d=i("宇宙亡矣")
local qe=i("效應")
local ke=i("註疏")
zt=R(z,e(d,f))
local function be(t)
return p(e(u,e(l,f,t),C))
end
local function d(a,t)
return p(e(u,e(l,e(a),f),t))
end
local function I(t)
return p(e(u,l,e(Z,e(u,t,f))))
end
local _e=be(le)
Fe=d(le,he)
Le=d(le,fe)
Re=I(le)
local le=be(de)
De=d(de,he)
Se=d(de,fe)
He=I(de)
local he=be(re)
Ue=I(re)
it=d(re,Pe)
Me=d(re,Ye)
Ce=I(We)
ot=I(Ie)
te=p(e(u,l,e(Z,Ke)))
ve=p(e(u,e(l,h(l,f),f),Ne))
ye=p(e(u,l,Be))
local Z=d(fe,e(u,je,f))
se=p(e(u,l,Ge))
lt=p(e(u,x,Ve))
ct=p(e(u,e(x,e(l,f,l)),C))
ie=p(e(x,e(z,l)))
we=p(e(x,e(z,x)))
qt=p(e(x,x))
local C=p(e(u,l,ke))
kt=p(e(u,x,ke))
local d=E(ze,e())
local I=E(xe,e())
t.jsArray_to_list=_
t.maybe_list_to_jsArray=D
t.new_list=e
local function x(e)
while J(e)or S(e)do
e=U(ge(e))
end
return e
end
t.un_just=U
t.un_just_comment_all=x
t.delay_p=Te
t.delay_just_p=v
local function _(e)
if K(e)then
return e
elseif B(e)then
error("WIP")
elseif G(e)then
error("WIP")
elseif Q(e)then
error("WIP")
end
return j()
end
local function x(e)
return ae(_(e))
end
local function z(e)
return ne(_(e))
end
t.delay_env=x
t.delay_x=z
local function z(e)
return s(e)
end
local function x(e)
if S(e)then
return oe(e)
else
return k(e)
end
end
t.force_all=z
t.force1=k
t.force_uncomment1=x
t.force_uncomment_all=st
Ae={}
t.env_null_v=Ae
t.env_set=Ee
t.env_get=ht
t.env2val=N
t.env_foreach=ut
t.val2env=me
local function z(t,a)
return{
t,
1,
function(e,o)
e=k(e)
if v(e)then
return O(t,{e})
end
if a(e)then
return I
end
return d
end,
}
end
local function x(t,o,i)
return{
t,
1,
function(e,a)
e=k(e)
if v(e)then
return O(t,{e})
end
if o(e)then
return i(e)
end
return a
end,
}
end
rt={
z(Re,m),
{
_e,
2,
E,
},
x(Fe,m,T),
x(Le,m,A),
z(He,q),
{
le,
2,
R,
},
x(De,q,M),
x(Se,q,W),
z(ot,r),
{
he,
2,
h,
},
z(Ue,a),
x(it,a,o),
x(Me,a,n),
{
te,
2,
function(e,t,i)
if e==t then
return I
end
e=k(e)
t=k(t)
if v(e)or v(t)then
return O(te,{
e,
t,
})
end
if e==t then
return I
end
local function i(t,e,a)
return O(se,{
t,
e,
a,
})
end
local function s(t,e)
return i(t,e,d)
end
L(not v(e))
local function i(a,t,e,o)
return s(O(te,{
e(a),
e(t),
}),O(te,{
o(a),
o(t),
}))
end
if r(e)then
if not r(e)then
return d
end
return I
elseif g(e)then
if not g(t)then
return d
end
if Y(e,t)then
return I
else
return d
end
elseif m(e)then
if not m(t)then
return d
end
return i(e,t,T,A)
elseif a(e)then
if not a(t)then
return d
end
return i(e,t,o,n)
elseif q(e)then
if not q(t)then
return d
end
return i(e,t,M,W)
end
return j()
end,
},
{
ve,
2,
function(h,e,i)
local t={}
local e=s(e)
while a(e)do
__TS__ArrayPush(t,o(e))
e=s(n(e))
end
if not r(e)then
return i
end
return P(h,t)
end,
},
{
ye,
2,
function(e,a,t)
local e=me(e)
if e==false then
return t
end
return H(e,a)
end,
},
z(Ce,g),
{
Z,
1,
function(e,t)
e=k(e)
if v(e)then
return O(Z,{e})
end
if not a(e)then
return t
end
return o(e)
end,
},
{
se,
3,
function(e,a,o,t)
e=k(e)
if v(e)then
return O(se,{
e,
a,
o,
})
end
if not m(e)then
return t
end
local e=s(T(e))
if not g(e)then
return t
end
if Y(e,xe)then
return a
end
if Y(e,ze)then
return o
end
return t
end,
},
{
C,
2,
ue,
},
}
t.equal_p=c
local function d(e)
return w(F(e))
end
t.simple_print=w
t.simple_print_force_all_rec=d
t.complex_parse=dt
t.complex_print=y
local function w(n)
local s=ee()
local o={s}
local a=0
local function i()
error("MT parse ERROR")
end
local function r(e)
if not e then
return i()
end
end
local function d()
r(#n>a)
local e=string.sub(n,a+1,a+1)
a=a+1
return e
end
while#o~=0 do
local n={}
for t=1,#o do
local o=o[t]
local t=d()
local a
a=function(a)
local t=ee()
local e=ee()
__TS__ArrayPush(n,t)
__TS__ArrayPush(n,e)
V(o,a(t,e))
end
if t=="^"then
local e=""
while true do
local t=d()
if t=="^"then
break
end
e=tostring(e)..tostring(t)
end
if Oe(e)then
V(o,tt(e))
else
return i()
end
elseif t=="."then
a(h)
elseif t=="#"then
a(E)
elseif t=="!"then
a(R)
elseif t=="$"then
a(function(a,t)return H(Ae,e(ie,ye,X(a),X(t)))end)
elseif t=="_"then
V(o,b)
else
return i()
end
end
o=n
end
r(a==#n)
return s
end
local function d(e)
local s={e}
local i=""
while#s~=0 do
local h={}
for e=1,#s do
local e=s[e]
e=U(e)
local t
t=function(e,t,a,o)
i=tostring(i)..tostring(t)
__TS__ArrayPush(h,a(e))
__TS__ArrayPush(h,o(e))
end
if g(e)then
i=tostring(i).."^"
i=tostring(i)..tostring(ce(e))
i=tostring(i).."^"
elseif a(e)then
t(e,".",o,n)
elseif r(e)then
i=tostring(i).."_"
elseif m(e)then
t(e,"#",T,A)
elseif q(e)then
t(e,"!",M,W)
elseif Te(e)then
local e=_(e)
t(e,"$",(function(e)return N(ae(e))end),ne)
else
return j()
end
end
s=h
end
return i
end
t.machinetext_parse=w
t.machinetext_print=d
local function g(e)
return function()return{
false,
e,
}end
end
local function d(e)
return function()return{
true,
e(),
}end
end
local function k(e)
local e=e()
while e[0+1]do
e=e[1+1]()
end
return e[1+1]
end
t.trampoline_return=g
t.trampoline_delay=d
t.run_trampoline=k
local v=p(h(pe,h(h(qe,h(h(u,h(je,h(f,b))),b)),b)))
local b=p(h(pe,h(h(qe,h(re,b)),b)))
local function q(a,t)
return E(b,e(a,t))
end
local function j(e)
return E(v,e)
end
local function y(f,w,u,p,h)
if h==nil then
h=false
end
local function g(e,e)
error("WIP")
end
u=s(u)
if m(u)then
local m=T(u)
local t=A(u)
if c(m,v)then
t=s(t)
if a(t)then
local o=o(t)
local e=s(n(t))
if r(e)then
if h==false then
local t=o
local a=p
local e
e=function()return f(t,a)end
return d(e)
else
local t
t=f
local a
a=w
local o=o
local i=p
local e
e=function()return y(t,a,P(h,o),i)end
return d(e)
end
end
end
elseif c(m,b)then
t=s(t)
if a(t)then
local u=o(t)
local t=s(n(t))
if a(t)then
local o=o(t)
local t=s(n(t))
if r(t)then
if h==false then
local a
a=f
local t
t=w
local i=u
local o=o
local n=p
local e
e=function()return y(a,t,i,n,o)end
return d(e)
else
local t
t=f
local a
a=w
local r=u
local s=o
local n=p
local h=h
local i=i("序甲")
local o
o=function()return y(t,a,r,n,E(l,e(e(i),g(e(X(s),i),X(h)))))end
return d(o)
end
end
end
end
end
end
if h==false then
return d(function()return w(u,p,f)end)
else
return d(function()return w(u,p,function(t,e)return d(function()return y(f,w,P(h,{t}),e)end)end)end)
end
end
local function e(t,e,a,o)
return y(t,e,a,o)
end
local function a(a,i,n,o)
return k(y((function(t,e)return g(a(t,e))end),(function(e,t,a)return g(i(e,t,function(e,t)return k(a(e,t))end))end),n,o))
end
t.Return_Effect_SystemName=Return_Effect_SystemName
t.return_effect_systemName=v
t.Bind_Effect_SystemName=Bind_Effect_SystemName
t.bind_effect_systemName=b
t.new_effect_bind=q
t.new_effect_return=j
t.run_monad_trampoline=e
t.run_monad_stackoverflow=a
return t