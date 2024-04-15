function g=get_grad(tau,u1,u2,x0,xf,W,MDNS)
    %solve state equation, forward
    [t,x,uk,nseg]=get_tx(tau,u1,u2,x0,MDNS);
    %final cond. psi
    pf=-W*(x(end,:)'-xf);
    %solve adjoint equation, backward
    tau
    p=rk4p(pf,t,x,uk);
    ng=length(tau);g=zeros(ng,2);
    for k=1:ng-1
        hu=get_hu(tau(k),p(nseg(k),:)',x(nseg(k),:)',u1(k+1,:)',u2(k+1,:)');
        %derrivative w.r.t. switching time
        g(k,1)=hu*(u1(k+1)-u1(k));
        g(k,2)=hu*(u2(k+1)-u2(k));
    end
    %derrivative w.r.t final time
    g(end)=1-pf'*rhs(tau(end),x(end,:)',u1(end,:)',u2(end,:)');
end