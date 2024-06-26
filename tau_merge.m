function [tau,u] = tau_merge(tau1,tau2,u1,u2)
%TAU_MERGE Summary of this function goes here
%   Detailed explanation goes here

tau_lenght = length(tau1)+length(tau2)

tau = zeros(tau_lenght, 1);
u = zeros(tau_lenght, 2);
%     tau = {tau1;tau2};
    min_tau = tau1(end);
    for i = 1:tau_lenght
        
        min_u = 0;
        is_tau1 = 0;

        for k = 1:length(tau1)
            if(tau1(k)<min_tau)
                if(i>1)
                    if(tau(i-1)<tau1(k))
                        min_tau = tau1(k);
                        min_u = u1(k);
                        is_tau1 = 1;
                    end
                else
                   
                min_tau = tau1(k);
                min_u = u1(k);
                is_tau1 = 1;
                end
            end
        end

        for k = 1:length(tau2)
            if(tau2(k)<min_tau)
                min_tau = tau2(k);
                min_u = u2(k);
                is_tau1 = 0;
            end
        end

        tau(i)= min_tau;

        if(is_tau1 == 1)
            if(i==1)
                u(i,:) = [min_u , u2(1)];
            else
                u(i,:) = [min_u , u(i-1, 2)];
            end
        else
            if(i==1)
                u(i,:) = [u1(1),min_u];
            else
                u(i,:) = [u(i-1, 1),min_u];
            end

        end
        
    
    end

end

