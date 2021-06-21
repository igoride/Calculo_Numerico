function [I] = simpson13 (F, a, b, ns)
    
    if modulo(ns, 2) == 0 then
        h = (b-a)/ns;
    else
       ns = ns+1;
       h = (b-a)/ns;
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

Z = [0, 4, 8, 12, 16];
A = [9.8175, 5.1051, 1.9635, 0.3927, 0.000];
c = [10.2, 8.5, 7.4, 5.2, 4.1];

ns = 5;

ce = simpson13(c, 1, 5, ns);
disp(ce);
