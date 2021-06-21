function[f] = f1(x)
    f = 2*x*sin(x)-1
endfunction

count = 1;

for i=-2:50
    //printf("%f = %f\n", i, f1(i));
    if f1(i)<0 && f1(i+1)>0 then
        
        vaux(count)=i;
        count = count + 1;
        vaux(count)=i+1;
        count = count + 1;
    else if f1(i)>0 && f1(i+1)<0 then
         
         vaux(count)=i;
        count = count + 1;
        vaux(count)=i+1;
        count = count + 1;
        end
    end   
end

function [raiz, x, iter, ea]=bisseccao(xl,xu,f,tol,imax)
if(f(xl)*f(xu)>0) then
    error('Nenhuma raiz no intervalo f(xl)*f(xu) > 0');
    abort;
end;
iter=0;
// acha primeira aproximacao e verifica se já é a raiz
xr = (xl+xu)/2;
x(iter+1)=xr;
test=f(xl)*f(xr);
if(test<0) then
    xu = xr;
elseif test>0 then
    xl = xr;
else
    raiz=xr;
    ea(iter+1)=0;
    return
end    
while(%t)
    xrold = xr;
    xr = (xl+xu)/2;
    iter = iter+1;
    x(iter+1)=xr;
    if(xr ~= 0) then
        ea(iter)=abs((xr-xrold)/xr);
    end;
    test=f(xl)*f(xr);
    if(test<0) then
        xu = xr;
    elseif test > 0 then
        xl = xr;
    else
        ea(iter) = 0;
    end;
    if (ea(iter) <= tol) then
        raiz = xr;
        return;
    end;
    if(iter >= imax) then
        error('Número Máximo de Iterações Alcançado');        
    end;
end;
endfunction

teste1(1) = bisseccao(vaux(1),vaux(2),f1,0.05,10);
teste1(2) = bisseccao(vaux(3),vaux(4),f1,0.05,10);
teste1(3) = bisseccao(vaux(5),vaux(6),f1,0.05,2);

function[f] = f2(x)
    f = 2*x*cos(x)+sin(x) 
endfunction

coun = 1;

function [raiz, x, iter, ea] = newtonraphson(x0,f,fp,tol,imax)
iter = 0; // inicializa numero de iteracoes
xr = x0; // inicializa raiz aproximada com a inicial
x(iter+1)=x0; // insere raiz inicial no vetor de raizes
while (1)
    xrold = xr;  
    xr = xrold - f(xrold)/fp(xrold); // aplica formula de Newton
    iter = iter+1; // incrementa numero de iteracoes
    printf("%f", iter);
    x(iter+1) = xr; // insere raiz aproximada no respectivo vetor
    if(xr ~= 0) then // calcula erro relativo
        ea(iter)=abs((xr-xrold)/xr);
    end;
    if(ea(iter) <= tol) then // se erro relativo menor que tol, FIM
        raiz = xr;
        return;
    end;
    if(iter >= imax) then // se excedeu num. maximo de iteracoes, FIM
        error('Número Máximo de Iterações Alcançado');
    end;
end
endfunction

//raiz(1) = newtonraphson(teste1(1),f1,f2,0.01,100000);
//raiz(2) = newtonraphson(teste1(2),f1,f2,0.05,10);
raiz(3) = newtonraphson(teste1(3),f1,f2,0.001,10000000000000);
