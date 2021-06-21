frac = scanf("%f");//numero real

fracin = int(frac); // parte inteira
fracre = frac - fracin; // parte fracionaria
//printf("%f\n", fracin);
//printf("%f\n", fracre);

aux = fracin;

count = 0;

if aux == 0 then // caso a parte inteira seja 0 ... Ex 0.5
    v(1) = '0';
    count = 1;
else
    while aux > 0     // calcula o tamanho do numero
        
        aux = int(aux/2);
        count = count +1;
        
    end
    
     a = 0;
    
    for i=1:count // transforma a parte inteira em binaria
        
        resto = modulo(fracin, 2);
 
        if resto == 0
            v(count-a) = '0';
        else
            v(count-a) = '1';
        end
       
        fracin = int(fracin/2);
        
        a = a+1; 
        
    end

end

if fracre > 0  then
    count = count+1;
    v(count) = '.';
    
    i = 1;

    while fracre ~= 0
        
        fracre = fracre * 2;
        indice = int(fracre);
        fracre = fracre - indice;
        if indice == 0
            v(count+i) = '0';
        else
            v(count+i) = '1';
        end
    
        i=i+1;
    end
end
printf("Bin = ");
printf("%s ", v);


