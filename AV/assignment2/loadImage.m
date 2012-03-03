function newImage = loadImage(name,show)
  loaded = importdata(name,'jpg');
  newImage = myrgb2gray(loaded);
  if show > 0
      figure(show)
      colormap(gray)
      imagesc(newImage)
  end