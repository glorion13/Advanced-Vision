origin = 'Data/train';

d = dir(origin);
len = length(d);

for i = 3 : len
    folderName = strcat(origin,'/',d(i).name);
    folderDir = dir(folderName);
    imgCount = length(folderDir);
    
    for j = 3 : imgCount    
        imageDir = strcat(folderName,'/',folderDir(j).name);
        loadPath = imageDir(1:end-4);
        
        image = loadJPG('background1',loadPath,0);

        binImage = getBinary(image,0,0,0,0,0);

        [H,W] = size(binImage);
        [r,c] = find( bwperim(binImage,4) == 1 );

        Image = cleanUp(binImage, 3, 0, 0); % second cleanup ?

        [sr,sc] = removeSpurs(r,c,H,W,1);
        %[tr,tc] = boundaryTrack(sr,sc,H,W,1);

        %boundingBox(binImage,1);
    end
end