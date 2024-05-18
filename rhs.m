function dx=rhs(t,x, u) %Wahadło matematyczne z silnikiem DC

% Równania stanu

u1 = u(1,:);
u2 = u(2,:);

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

% State equations


dx=zeros(4,1);

dx(1)=x(3);
dx(2)=x(4);
dx(3)=-MI11*E+MI12*F-MI11*T1-MI12*T2+MI11*u1+MI12*u2;
dx(4)=-MI12*E+MI22*F-MI12*T1-MI22*T2+MI12*u1+MI22*u2;

end