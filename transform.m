
function T = transform(N)
  
T = zeros(8,8);
for j = 1:1:8
    for i = 1:1:8
            if (i == 1)
            T(i,j) = 1/(N^0.5);
            else
            T(i,j) = ((2/N)^0.5) * cos((2*(j-1)+1)*(i-1)*pi/(2*N));
            end
    end
end
end