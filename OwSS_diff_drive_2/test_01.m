clc;
clear all;
close all;
nu=15;
tf=20;
umax=1;
umin=-1;
tau=(tf/nu)*[1:nu]';
uopt=zeros(nu,2);
x0=[3.2;18;1;0];
xf=[0;0;0];
W=1000*eye(3);
MDNS=100;
qh=@(uopt) cost_fun_s(uopt,tau,x0,xf,W,MDNS);
nu=length(uopt);
LB=-ones(nu,2);
UB=ones(nu,2);%ograniczenia
options=optimoptions('fmincon');
options.SpecifyObjectiveGradient=true;
options.Display='iter';
options.Algorithm='interior-point';
uopt=fmincon(qh,uopt,[],[],[],[],LB,UB,[],options); %* -1;
[t,x,uk,nseg]=get_tx_s(tau,uopt,x0,MDNS);
pf=[-W*(x(end,1:end-1)'-xf);0;0];
p=rk4p_s(pf,t,x,uk);
%% 

figure
hold on
title("Robot's trajectory")
plot(x(:,1), x(:,2),'b-','DisplayName','Optimal Trajectory','LineWidth',2)
plot(xf(1),xf(2),'r*','DisplayName','Goal')
plot(x0(1),x0(2),'b*','DisplayName','Start')
%fplot(@exp,[-1,3.5],'r--', 'DisplayName', 'Obstacle')
legend()
xlabel("x[m]");
ylabel("y[m]");
hold off

figure
title("State variables");
subplot(3,1,1);
plot(x(:,1))
title("X position");
ylabel("x [m]");
subplot(3,1,2);
plot(x(:,2))
title("Y position");
ylabel("y [m]");
subplot(3,1,3);
plot(x(:,3))
title("Yaw");
ylabel("thata [rad]");
%hold off

figure
title("Control variables");
subplot(2,1,1);
stairs(uopt(:,1));
title("Right wheel control");
ylabel("angular velocity [rad/s]");
subplot(2,1,2);
stairs(uopt(:,2));
title("Left wheel control");
ylabel("angular velocity [rad/s]");