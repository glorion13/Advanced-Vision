function g = drawBoundingbox(image,show)
    [image1 num] = bwlabel(image);
    stats = regionprops(image1, 'BoundingBox');
    g = image;
    
    [H W] = size(stats); %[H, W]
    
    for k = 1:H
        iceiling = ceil(stats(k).BoundingBox(1));
        ifloor = floor(stats(k).BoundingBox(1))+stats(k).BoundingBox(3);
        for i = iceiling:ifloor
            jceiling = ceil(stats(k).BoundingBox(2));
            jfloor = floor(stats(k).BoundingBox(2))+stats(k).BoundingBox(4);
                        
            for j = jceiling:jfloor
                x1 = ceil(stats(k).BoundingBox(1));
                y1 = ceil(stats(k).BoundingBox(2));
                
                g(y1,i) = 1;
                g(y1 + stats(k).BoundingBox(4) - 1, i) = 1;
                g(j,x1) = 1;
                g(j, x1 + stats(k).BoundingBox(3) - 1) = 1;
            end
        end
    end