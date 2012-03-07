function comboImage = overlayImages( MEI, boxedImage )

    [H,W] = size(MEI);
    left = 1;
    top = 1;
    right = W;
    bottom = H;
    
    comboImage = zeros(540,960);
    
    for i = left : right
        for j = top : bottom
            
            comboImage(j,i) = MEI(j,i) || boxedImage(j,i);
            
        end
    end

end

