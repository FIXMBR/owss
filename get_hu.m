function hu=get_hu(t,p,x,u1,u2)
    %funkcja przelaczajaca,
    %pochodna hamiltonianu wzgledem sterowania
    gamma=0.08;
%     tau=0.04;hu=p(2)/tau;
    hu=p(2); %+(gamma*u);
end