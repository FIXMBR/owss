function hu=get_hu(t,p,x,u)
%funkcja przelaczajaca,
%pochodna hamiltonianu wzgledem sterowania
g = 0.01;
hu=p(2)-g*u;