origin = 'Data/train';

d = dir(origin);
len = length(d);

for i = 3 : len
    folderName = strcat(origin,'/',d(i).name);
    folderDir = dir(folderName);
    imgCount = length(folderDir);
    
    minX = 960;
    minY = 540;
    maxX = 0;
    maxY = 0;
    
    boundaries = [minX minY maxX maxY];
    MEI = zeros(540,960);
    MHI = zeros(540,960);
    
    for j = 3 : imgCount    
        imageDir = strcat(folderName,'/',folderDir(j).name);
        loadPath = imageDir(1:end-4);
        
        image = loadJPG('background1',loadPath,0);

        binImage = getBinary(image,0,0,0,0,0);

        [H,W] = size(binImage);
        [r,c] = find(bwperim(binImage,4) == 1 );
        
        cleanImage = cleanUp(binImage, 2, 0, 0); % second cleanup ?
        
        [lImage, regions] = bwlabel(cleanImage, 4);
        data = regionprops(lImage, cleanImage, 'Area', 'BoundingBox');
        
        areas = [data.Area];
        maxAreaIndex = areas == max([data.Area]);
        if ~isempty(maxAreaIndex)
            boundingBox = data(maxAreaIndex).BoundingBox;
            
            boundaries = compareBoundingbox(boundaries, boundingBox);
            boxedImage = keepBoundingbox(lImage, boundingBox);
            
            time = (j-3)*(255/(imgCount-3));
            
            MEI = overlayImages(MEI, boxedImage);
            MHI = getMHI(MHI, boxedImage, time);
            
            
            %figure(i)
            %imshow(mat2gray(MHI))
            %newImage = ismember(lImage, maxAreaIndex); 
            %labeledDimeImage = bwlabel(newImage, 8);
            
            %TODO 
            % gia na katharisoume to noise yparxei to open kai to close
            % des episis erode kai delayed. 
            % erevna gia invariants & feature vectors
            % classifier
            % cross validation
            % check with & without each moment invariant
            
        end
    end
    
    muv = complexmoment(MHI,2,2)



end