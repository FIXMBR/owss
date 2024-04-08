function dp=prhs(t,x,u,p)
    %Adjoint equations

    A = [0,1;-1,-1];

    dp=zeros(2,1);
    w0=9;ksi=0.01;tau=0.04;k=250;
    dp = -A'*p;
%     dp(1) = p(2);
%     dp(2) = -p(1) + p(2);
%     dp(1)=w0^2*cos(x(1))*p(2);
%     dp(2)=-p(1)+2*ksi*w0*p(2);
%     dp(3)=-k*p(2)+p(3)/tau;

end