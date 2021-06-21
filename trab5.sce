function [z]= g1(X)
    z = X.^0
endfunction

function [z] = g2(X)
    z = X
endfunction

function [z] = g3(X)
    z = X.^2
endfunction

exec('quadrados_minimos.sci');

// definindo os pontos tabelados da função
X = [0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];
F = [-1.8, -1.2, -0.4, 0.4, 1.1, 2.1, 3.0, 3.9, 5.0] ;

GLista = list(g1,g2,g3)     
 
[a] = quadrados_minimos(X,F,GLista)
mprintf('parabola')
disp(a)

// gráfico
x = linspace(-1,2,101);
G = a(1) + a(2)*x + a(3)*x.^2;    
plot(x,G);
plot(X,F,'ro');

// calculo do erro 
GX = a(1) + a(2)*X + a(3)*X.^2;
Y = F - GX;
E = Y*Y'
mprintf('erro')
disp(E)

GLista = list(g1,g2)     
 
[a] = quadrados_minimos(X,F,GLista) 
mprintf('Reta')
disp(a)

L = a(1) + a(2)*x;
plot(x,L, 'r');
plot(X,F,'ro');


// calculo do erro 
LX = a(1) + a(2)*X;
Y = F - LX;
E = Y*Y'
mprintf('erro')
disp(E)






