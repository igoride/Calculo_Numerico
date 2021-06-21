
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
