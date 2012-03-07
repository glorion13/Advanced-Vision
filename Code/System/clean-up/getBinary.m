% return a cleaned binary image from the initial parameter
% additional parameters specify figures for display (0 = no display)

% Code: Robert B. Fisher
% Additional comments: Toby P Breckon

function cleanimage = getBinary(image,fig3,fig4,fig5,fig6,fig7)

     hist = findHistogram(image,fig3);                 % histogram image (findHistogram.m)
     thresh = findThreshold(hist,4,fig4);          % find threshold (findThreshold.m)
     binimage = binarize(image,thresh/255);       % do thresholding

     if fig5 > 0
       figure(fig5)
       colormap(gray)
       imshow(binimage)
     end

     largestimage = getLargest(binimage,fig6);   % get biggest region (getLargest.m)
     
     cleanimage = cleanUp(largestimage,0,2,fig7); % clean up region (cleanUp.m)
                                                        
