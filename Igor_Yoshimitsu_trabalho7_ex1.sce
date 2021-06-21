function [I] = simpson13 (F, a, b, ns)
    
    if modulo(ns, 2) == 0 then
        h = (b-a)/ns;
    else
        error('ns não é par');
    end
    
    x = a;
    
    soma = F(a)+F(b);
    
    for i =1:ns-1
        x = x+h;
        if modulo(i, 2) == 0 then
            soma = soma+4*F(x);
        else
            soma = soma+2*F(x);
        end
    end
    I = (h/3)*soma;
endfunction
