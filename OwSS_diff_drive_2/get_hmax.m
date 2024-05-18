function u=get_hmax(t,p,x,u)
    %Hamiltonian maximizer
    %the solution of H_u(t, p, x,u)=0
    g = 0.01;
    u=p(:,2)/g;