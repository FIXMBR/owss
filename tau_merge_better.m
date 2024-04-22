function [tau,u] = tau_merge_better(tau1,tau2,u1,u2)
%TAU_MERGE Summary of this function goes here
%   Detailed explanation goes here

tau_lenght = length(tau1)+length(tau2)

tau = zeros(1, 1);
u = zeros(1, 2);
%     tau = {tau1;tau2};
min_tau = tau1(end);
i=1;

i1=1;

i2=1;

while(i1+i2 <= tau_lenght)
tau1(i1);
tau2(i2);

if(tau1(i1)<tau2(i2))
    tau(i)=tau1(i1);
    u(i,:)=[u1(i1),u2(i2)];
    i= i+1;
    i1 = i1+1;
    
elseif (tau1(i1)>tau2(i2))
    tau(i)=tau2(i2);
    u(i,:)=[u1(i1),u2(i2)];
    i= i+1;
    i2 = i2+1;

elseif (tau1(i1) == tau2(i2))

    tau(i)=tau2(i2);
    u(i,:)=[u1(i1),u2(i2)];
    i= i+1;
    i1 = i1+1;
    i2 = i2+1;
end

end


end

