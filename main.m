clear;close all;

% tauopt = [1 0.5 2]';

tauopt1=[2.8 5]';
tauopt2=[1.4 3.9 5]';

tauopt = [tauopt1(1:end-1,1);tauopt2];

u1=1.0*[-1;1];
u2=1.0*[1;-1;1];
x0=[1.5708;-0.5236;0;0];
xf=[0;0;0;0];
W=100*eye(4);
MDNS=300;

qh=@(tauopt) cost_fun(tauopt,u1,u2 ,x0,xf,W,MDNS);

nb=length(tauopt);
b=0.0*ones(nb+1,1);



A1=-eye(length(tauopt1)-1);

for k=2:length(tauopt1)-1,
    A1(k,k-1)=1;
end %ograniczenia
A1 = [A1;zeros(length(tauopt1)-1,1)];
A1(end,end)=1;

A2=-eye(length(tauopt2));

for k=2:length(tauopt2),
    A2(k,k-1)=1;
end %ograniczenia

% A1
% A2

A =blkdiag(A1,A2);

A(length(tauopt1),end)=-1


% B1 = zeros(length(tauopt1)-1)
% B2 = zeros(length(tauopt2))



options=optimoptions('fmincon');
options.SpecifyObjectiveGradient=true;
options.Display='iter';
options.Algorithm='interior-point';

A

tauopt=fmincon(qh,tauopt,A,b,[],[],[],[],[],options);

u_len = length(u1);

tau1 = tauopt(1:u_len-1);
tau2 = tauopt(u_len:end);

tau1 = [tau1;tau2(end)];
tauopt
tau1
tau2

[tau, u] = tau_merge_better(tau1,tau2,u1,u2)

[t,x,uk,nseg]=get_tx(tau,u,x0,MDNS);

pf=-W*(x(end,:)'-xf);
p=rk4p(pf,t,x,uk);
nt=length(t);
hu=zeros(nt,1);

for k=1:nt
    hu(k)=get_hu(t(k),p(k,:)',x(k,:)',uk(k,:)');
end

hu=hu/max(abs(hu));
subplot(211);
h=plot(t,x);
set(h,'linewidth',2);

subplot(212);
h=stairs(t,uk);
set(h,'linewidth',2);

%hold on;
%h=plot(t,hu);
%grid;
%set(h,'linewidth',2);

axis([0 t(end) -1.1 1.1]);hold off

% sterowanie czasooptymalne

