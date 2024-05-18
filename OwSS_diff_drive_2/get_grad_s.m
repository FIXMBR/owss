function g=get_grad_s(tau,u,x0,xf,W,MDNS)
%solve state equation, forward
[t,x,uk,nseg]=get_tx_s(tau,u,x0,MDNS);
%final cond. psi
pf=[-W*(x(end,1:end-1)'-xf);0;0];
%solve adjoint equation, backward
ps=rk4p_s(pf,t,x,uk);
phi_int_1=ps(:,end-1);
phi_int_2=ps(:,end);

ng=length(u);
g=zeros(ng,2);
nseg=[1;nseg];
for k=1:ng
%derrivative w.r.t. u_k
    g(k,:)=[phi_int_1(nseg(k))-phi_int_1(nseg(k+1)),phi_int_2(nseg(k))-phi_int_2(nseg(k+1))];
end
