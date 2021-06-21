function[x, iter, ea] = gaussseidel(A, b, ea)

// Verifica se a matriz A é quadrada
[m,n] = size(A);
if m~=n, error('Matriz A deve ser quadrada'); end

for i=1:n
  bc(i) = b(i)/A(i, i);
end;

big = 0;
num = 0;

while p > ea & iter<=1000
  for i=1:n 
    num = 0;
    for j=1:n
      if j <> i then
        num = num + A(i,j)*x(j);
      end;
    end;
    x(i) = (1/A(i,i))*(b(i)-num);
  end;
  p = norm((A*x)-b');
  iter = iter+1;
end;

if(iter>999) then
  printf("Não converge nesse intervalo");
  abort;
else
  printf("Total de iteracoes %f", iter);
end
return
end



