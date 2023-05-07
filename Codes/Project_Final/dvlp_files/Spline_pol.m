function mat=Spline_pol(x,y,x1)

n=length(x)-1;

A=zeros(n,1);
B=zeros(n,1);
C=zeros(n,1);

A(1)=0;
B(1)=(y(1)-y(2))/(x(1)-x(2));
C(1)=y(1)-(x(1)*(y(1)-y(2))/(x(1)-x(2)));

for i=2:n
    X=[x(i)^2 x(i) 1;x(i+1)^2 x(i+1) 1;2*x(i) 1 0];
    Y=[y(i);y(i+1);(2*A(i-1)*x(i))+B(i-1)];
    
    K=X\Y;
    
    A(i)=K(1);
    B(i)=K(2);
    C(i)=K(3);
end

i=1;
mat=zeros(1,length(x1));

for j=1:n
    for i=i:length(x1)
        mat(i)=(A(j)*(x1(i)^2))+(B(j)*x1(i))+C(j);
        if x1(i)>=x(j+1)
            break;
        end
    end
end

end