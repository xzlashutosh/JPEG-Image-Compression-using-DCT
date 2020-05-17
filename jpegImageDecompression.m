function N = jpegImageDecompression(C)

Q50 = [16,11,10,16,24,40,51,61;
       12,12,14,19,26,58,60,55;
       14,13,16,24,40,57,69,56;
       14,17,22,29,51,87,80,62;
       18,22,37,56,68,109,103,77;
       24,33,55,64,81,104,113,92;
       49,64,78,87,103,121,120,101;
       72,92,95,98,112,100,103,99];
   
 Q10 = Q50.*50/10;
   
 % R = Reconstruction Matrix
   R = Q10 .* C;
  T = transform(8);
% Applying IDCT using idct = T'*R*T

N = round(T'*R*T);

% bringing image again in the range of 0-255, adding 128

N = N + 128;
end