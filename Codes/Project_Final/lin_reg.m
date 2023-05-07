function equ=lin_reg(x,y)

A=[length(x), sum(x)
    sum(x) sum(x.^2)];
B=[sum(y);sum(x.*y)];

equ=flip(A\B);