function boxedImage = keepBoundingbox( lImage, boundingBox )

    left = ceil(boundingBox(1));
    top = ceil(boundingBox(2));
    right = left+floor(boundingBox(3))-1;
    bottom = top+floor(boundingBox(4))-1;
    
    boxedImage = zeros(540,960);
    
    for i = left : right
        for j = top : bottom
            boxedImage(j,i) = lImage(j,i);
        end
    end

end

