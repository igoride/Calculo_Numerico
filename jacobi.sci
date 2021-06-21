function [x, iter, ea] = jacobi(A,b,x0,tol,imax)
    
// Verifica se a matriz A é quadrada
[m,n] = size(A);
if m~=n, error('Matriz A deve ser quadrada'); end

// iteracao de Jacobi
iter=1;
while iter <= imax
    for i=1:n
        soma = 0;
        for j=1:n
            if j ~= i then
                soma = soma + A(i,j)*x0(j);
            end
        end
        x(i)=(b(i) - soma)/A(i,i);
    end
//      ea(iter)=norm(x-x0,'inf')/norm(x,'inf');
//   ou ea(iter)=norm(x-x0,'inf');
    ea(iter)=norm(x-x0);
    if ea(iter) <= tol then
        return
    end
    iter=iter+1;
    x0=x;
end

// A rigor este teste não é necessário
if(iter > imax) then // se excedeu num. maximo de iteracoes, FIM
    error('Número Máximo de Iterações Alcançado');
end;

endfunction

