function dx=rhs(t,x,u) %Wahadło matematyczne z silnikiem DC
    dx=zeros(2,1);
%     w0=9;
%     ksi=0.01;
%     tau=0.04;
%     k=250;
    dx(1)=x(2);
    dx(2)=-x(1)-x(2) + u;
end