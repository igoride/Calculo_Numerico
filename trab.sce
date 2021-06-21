
function [yin] = lagrange (X , F , z)

n=length(X) ;
soma = 0;

for i = 1: n ,
    produto = F(i);
    for j = 1: n ,
        if j ~= i ,
            produto = produto * (z - X( j ))/(X( i ) - X( j ));
        end
        soma = soma + produto;
    end
end

yin  = soma;

endfunction

X = [0, 1, 2, 3, 4];
F = [17.8, -1.75, 3.7, 1.75, 8.0];
z = 2.5;
 
interpol = lagrange(X, F, z);

disp(interpol);

plot(X,F,'ro');
plot(z, interpol, 'o');

