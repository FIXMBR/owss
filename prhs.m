function dp=prhs(t,x,u,p)
    %Adjoint equations

    %************** Scara robot ***************

% Równania stanu

I1=1;I2=1;m1=10;m2=5;d=0.7;xc2=0.35;yc2=0;s1=0.10;f1=0.01;s2=0.10;f2=0.01;kt=10.0;
d2=d*d;m2d=m2*d;m2d2=m2*d2;A=I1+I2+m2*d2;
c=cos(x(2));s=sin(x(2));
B=m2d*(xc2*c-yc2*s);
Bx2=-m2d*(xc2*s+yc2*c);
D=(A+2*B)*I2-B*B;D2=D*D;
MI11=I2/D;MI12=-B/D;MI22=(A+2*B)/D;
x3_2=x(3)*x(3);
E0=(2*x(3)+x(4))*x(4);
E=Bx2*E0;
F=Bx2*x3_2;

MI11_x2=2*I2*Bx2*(B-I2)/D2;
MI12_x2=-Bx2*(D+2*B*(B-I2))/D2;
MI22_x2=2*Bx2*(D+(B-I2)*(A+2*B))/D2;

MI11Bx2_x2 = MI11_x2*Bx2-MI11*B;
MI12Bx2_x2 = MI12_x2*Bx2-MI12*B;
MI22Bx2_x2 = MI22_x2*Bx2-MI22*B;


% Tarcie
T1=s1*tanh(kt*x(3))+f1*x(3);
T2=s2*tanh(kt*x(4))+f1*x(4);
T1_x3=s1*kt*(1-tanh(kt*x(3))^2)+f1;
T2_x4=s2*kt*(1-tanh(kt*x(4))^2)+f2;

% Jacobian

A=zeros(4,4);B1=zeros(4,1);B2=zeros(4,1);
A(1,3)=1;
A(2,4)=1;
A(3,2)=-MI11Bx2_x2*E0+MI12Bx2_x2*x3_2-MI11_x2*T1-MI12_x2*T2;
A(3,3)=(-2*MI11*x(4)+2*MI12*x(3))*Bx2-MI11*T1_x3;
A(3,4)=-MI11*Bx2*(2*x(3)+2*x(4))-MI12*T2_x4;
A(4,2)=-MI12Bx2_x2*E0+MI22Bx2_x2*x3_2-MI12_x2*T1-MI22_x2*T2;
A(4,3)=(-2*MI12*x(4)+2*MI22*x(3))*Bx2-MI12*T1_x3;
A(4,4)=-MI12*Bx2*(2*x(3)+2*x(4))-MI22*T2_x4;

% Conjugate equations

dp=-A'*p;

end