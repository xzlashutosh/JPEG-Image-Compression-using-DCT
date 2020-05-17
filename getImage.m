function Z = getImage()
rgbImage = double(imread('cup.jpg'));
%imshow(rgbImage)
YCbCr = rgb2ycbcr(rgbImage);
Y=YCbCr(:,:,1);
%
Z = Y;
%imshow(uint8(Z))
end

