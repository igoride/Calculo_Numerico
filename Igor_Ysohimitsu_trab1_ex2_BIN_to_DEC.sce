frac = scanf("%f");//numero real

fracin = int(frac); // parte inteira
fracre = frac - fracin; // parte fracionaria

aux = fracin;
count = 0;
v1 = 0;
v2 = 0;

if aux == 0 then // caso a parte inteira seja 0 ... Ex 0.101
    v1 = 0;
else
    while aux > 0     // calcula o tamanho do numero
        
        aux = int(aux/10);
        count = count +1;
        
    end
    
    for i=1:count 
        
        x = int(fracin/10^(count-i));
        
        if i == 1
            vaux(i) = x;
        else
            if i == 2
            
                y = int(x/10^(i-1));
                y = y*10;
                vaux(i) = x - y;
          
            
             else
                 y = int(x/10);
                 y = y*10;
                 
                 vaux(i)= int(x-y);
             end
         end
        
    end
    
    
    for i=1:count //transforma o numero em um real
        
        x = vaux(count-(i-1));
        if x == 1
           
            v1 = v1 + (2^(i-1));
            
        end
    end
end

count = 0;

for i=1:8    // converte
    
    x = int(fracre*(10^i));
    if i == 1
        if x == 1
            v2 = v2 + 2^(-i);
        end
    else
        
        y = int(y*10);
        
        x = int(x-y);
        
        if x == 1
            v2 = v2 + 2^(-i);
        end
        
    end
end
    
v = v1+v2;

