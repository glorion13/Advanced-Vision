function comboImage = getMHI( MHI, boxedImage, time )

    [H,W] = size(MHI);
    left = 1;
    top = 1;
    right = W;
    bottom = H;
    
    comboImage = zeros(540,960);
    
    for i = left : right
        for j = top : bottom
            
            if boxedImage(j,i) == 1
                comboImage(j,i) = time;
            else
                comboImage(j,i) = max(MHI(j,i)-1, 0);
            end
            
        end
    end

end