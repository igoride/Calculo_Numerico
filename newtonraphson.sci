function[f] = f1(x)
    f = cos(3.14*(x+1)/8)+0.148*x-0.9062
endfunction

function[f] = f2(x)
    g = sin(0.3925*(x+1))+0.5405 
endfunction

function [raiz, x, iter, ea]=newtonraphson(x0,f,fp,tol,imax)
iter = 0; // inicializa numero de iteracoes
xr = x0; // inicializa raiz aproximada com a inicial
x(iter+1)=x0; // insere raiz inicial no vetor de raizes
while (ea>tol && iter<imax)
    xrold = xr; 
    xr = xrold - f(xrold)/fp(xrold); // aplica formula de Newton
    iter = iter+1; // incrementa numero de iteracoes
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

g(1) = newtonraphson(-0.53125,f1,f2,0.1,10)
