function C = jpegImageCompression(I)
%{
JPEG is lossy image compression that used DCT
---quantization
%}
% Image taken is black and white.

% The image is broken into 8X8 blocks of pixels.
% Working from left to right, top to bottom, the DCT is applied to each
% block.
% Each block is compressed through quantization.
% When required,the image is reconstructed through decompression using IDCT

% the dct equation is given in the document
%DCT transfrom in matrix form
T = (transform(8));

% I = 8X8 block of pixel in an image
%I  = ImageToPixel8X8;

% levelling off the pixel block by subtracting 128 from each entry.
M = I - 128;

% D = transformed matrix of image
D = T * M * T';

%human eye is more sensitive to low frequencies

%-------------------------------------------------------------
%Compression by Quantization 
% using Quantization matrix with a quality level of 50.

Q50 = [16,11,10,16,24,40,51,61;
       12,12,14,19,26,58,60,55;
       14,13,16,24,40,57,69,56;
       14,17,22,29,51,87,80,62;
       18,22,37,56,68,109,103,77;
       24,33,55,64,81,104,113,92;
       49,64,78,87,103,121,120,101;
       72,92,95,98,112,100,103,99];
   
 Q10 = Q50.*50/10;
   
% for quality level more than 50 --- multiply(Q50,(100-requiredQualitylevel)/50)
% for quality level less than 50(more compression, less quality) -----
% multiply(Q50, 50/requiredQuality level)

% C = quantized matrix of image data

C = round(D./Q10);



end






















