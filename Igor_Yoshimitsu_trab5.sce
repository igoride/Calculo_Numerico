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
X = [0, 1, 2, 3];
F = [3, 5, 8, 13] ;

GLista = list(g1,g2,g3)     
 
[a] = quadrados_minimos(X,F,GLista)
mprintf('parabola');
printf("\nG(x) = %f + %f * X + %f * X^2\n", a(1), a(2), a(3));
//disp(a)

// gráfico
x = linspace(-1,3,101);
G = a(1) + a(2)*x + a(3)*x.^2;    
plot(x,G);

// calculo do erro 1
GX = a(1) + a(2)*X + a(3)*X.^2;
Y = F - GX;
E = Y*Y'
mprintf('erro');
disp(E)

GLista = list(g1,g2)     
 
[a] = quadrados_minimos(X,F,GLista) 
mprintf('Reta')
printf("\nG(x) = %f + %f * X\n", a(1), a(2));
//disp(a)

L = a(1) + a(2)*x;
plot(x,L, 'r');
plot(X,F,'ro');

// calculo do erro 2
LX = a(1) + a(2)*X;
Y = F - LX;
E = Y*Y'
mprintf('erro')
disp(E)






