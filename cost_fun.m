function [q,g]=cost_fun(tau, u1, u2, x0,xf,W,MDNS) %Funkcja celu
    % xf - stan docelowy, W=W^T>0 - macierz wag
    %calkowanie rownania stanu
    %tu
    u_len = length(u1);

    tau1 = tau(1:u_len-1);
    tau2 = tau(u_len:end);

    tau1 = [tau1;tau2(end)];

    [tau, u] = tau_merge_better(tau1,tau2,u1,u2);

    [~,x]=get_tx(tau, u,x0,MDNS);
    % roznica pomiedzy stanem koncowym i docelowym
    dxend=x(end,:)'-xf;

    ro = 500;

    % funkcja celu
%     q=tau(end)+0.5*ro*(dxend(1)^2+dxend(2)^2);
    q=tau(end)+0.5*dxend'*W*dxend;
    if nargout>1
        %opcjonalne obliczenie gradientu
        g=get_grad(tau,u1,u2,x0,xf,W,MDNS);
    end
end