function [ yint, b ] = newton_interp( x,y,xx )
 
n=length(x);  

b=zeros(n,n);  
b(:,1)=y(:);

 
for j= 2:n   
    for i=1:n-j+1  
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end

// Usa a tabela para fazer a interpolação em xx
xt=1;
yint=b(1,1);

for j=1:n-1 
    xt=xt*(xx-x(j));
    yint=yint+b(1,j+1)*xt;
end

endfunction
