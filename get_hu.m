function hu=get_hu(t,p,x,u)
    %funkcja przelaczajaca,
    %pochodna hamiltonianu wzgledem sterowania
    gamma=0.08;
%     tau=0.04;hu=p(2)/tau;
    hu=p(2); %+(gamma*u);
%     tau=0.04;hu=p(3)/tau;
end