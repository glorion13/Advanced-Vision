function boundaries = compareBoundingbox(boundaries, boundingBox)
           
            smallX = boundingBox(1);
            smallY = boundingBox(2);
            bigX = boundingBox(1)+boundingBox(3);
            bigY = boundingBox(2)+boundingBox(4);
            
            minX = boundaries(1);
            minY = boundaries(2);
            maxX = boundaries(3);
            maxY = boundaries(4);
            
            if smallX < minX
                minX = smallX;
            end
            if smallY < minY
                minY = smallY;
            end
            if bigX > maxX
                maxX = bigX;
            end
            if bigY > maxY
                maxY = bigY;
            end
            
            boundaries = [minX minY maxX maxY];