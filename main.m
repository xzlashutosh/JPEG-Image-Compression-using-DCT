InputImage = getImage();

BlockSize = 8;
img1 = InputImage;
rows = size(img1,1);
columns = size(img1,2);
TOTAL_BLOCKS = rows*columns / (BlockSize*BlockSize);
dividedImage = zeros([BlockSize BlockSize TOTAL_BLOCKS]);
row = 1;
col = 1;
inverseTransformedImage = zeros(rows, columns);
transformedImage = zeros(rows, columns);
    for count=1:TOTAL_BLOCKS
        dividedImage(:,:,count) = img1(row:row+BlockSize-1,col:col+BlockSize-1);
        
        col = col + BlockSize;
        if(col >= columns)
            col = 1;
            row = row + BlockSize;
            if(row >= rows)
                row = 1;
            end
        end
    
C = zeros([BlockSize BlockSize]);
N = zeros([BlockSize BlockSize]);
s = zeros([BlockSize BlockSize]);
    s(:,:) = dividedImage(:,:,count);
    C(:,:) = jpegImageCompression(s(:,:));
    N(:,:) = jpegImageDecompression(C(:,:));
        
    inverseTransformedImage(row:row+BlockSize-1,col:col+BlockSize-1) = N(:,:);
    transformedImage(row:row+BlockSize-1,col:col+BlockSize-1) = C(:,:);
    end
    
subplot(3,1,1);
imshow(uint8(InputImage))
title('Original Image');

subplot(3,1,2);
imshow(uint8(transformedImage))
title('Transformed Image');

subplot(3,1,3);
imshow(uint8(inverseTransformedImage))
title('Inverse Transformed Image');








