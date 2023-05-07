function res=euler_imp_val(fd,x,y0)

n=length(x);
h=abs(x(2)-x(1));
res=zeros(1,n);

res(1)=y0;

for i=2:n
    res(i)=res(i-1) + (h/2)* (fd(i-1) + fd(i));
end
