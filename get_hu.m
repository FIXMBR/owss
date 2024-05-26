function hu=get_hu(t,p,x,u)
    %funkcja przelaczajaca,
    %pochodna hamiltonianu wzgledem sterowania
    gamma=0.08;
%     tau=0.04;hu=p(2)/tau;
    hu=p(2); %+(gamma*u);
%     tau=0.04;hu=p(3)/tau;

end


% function hu=get_hu(t,p,x,u)
%     funkcja przelaczajaca,
%     pochodna hamiltonianu wzgledem sterowania
%    I1=1;I2=1;m1=10;m2=5;d=0.7;xc2=0.35;yc2=0;s1=0.10;f1=0.01;s2=0.10;f2=0.01;kt=10.0;
% d2=d*d;m2d=m2*d;m2d2=m2*d2;A=I1+I2+m2*d2;
% c=cos(x(2));s=sin(x(2));
% B=m2d*(xc2*c-yc2*s);
% Bx2=-m2d*(xc2*s+yc2*c);
% D=(A+2*B)*I2-B*B;D2=D*D;
% MI11=I2/D;MI12=-B/D;MI22=(A+2*B)/D;
% 
% hu(1) = p(3)*MI11 + p(4)*MI12;
% hu(2) = p(3)*MI12 + p(4)*MI22;
% 
% end