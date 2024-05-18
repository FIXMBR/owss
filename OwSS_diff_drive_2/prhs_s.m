function dp=prhs_s(t,x,u,p)
% Adjoint equations
dp=zeros(5,1);
g = 0.01;
R = 1;
a = R/2;
dp(1)=0;
dp(2)=0;
if x(2) > exp(x(1))
    dp(1) = -exp(x(1));
    dp(2) = 1;
end
dp(3)=R/2*(u(1) + u(2)) * (p(1)*sin(x(3)) - p(2)*cos(x(3)));
dp(4) = p(1) * a * cos(x(3)) + p(2) * a * sin(x(3)) + p(3);
dp(5) = p(1) * a * cos(x(3)) + p(2) * a * sin(x(3)) - p(3);
