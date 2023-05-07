function equ=gen_reg(x,y,deg)

n=deg+1;
A=zeros(n,n);
B=zeros(n,1);

for i=1:n
    for j=1:n
        A(i,j)=sum(x.^(i+j-2));
    end
    
    B(i)=sum((x.^(i-1)).*y);
    
end
equ=flip(A\B);
end
