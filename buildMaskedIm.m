function maskedIm = buildMaskedIm(im,targetColor)
    lRedThreshold = 0.45;
    hRedThreshold = 0.6;
    bgBlack = 0.35;
    bgWhite = 0.7;
    [r,c] = size(im);
    object = (im == targetColor);
    objectRedWeight = rand(r,c)*(hRedThreshold-lRedThreshold) + lRedThreshold;
    
    decideBGColor = randi([0,1],r,c);
    bgDarkWeight = rand(r,c)*bgBlack;
    bgBrightWeight = rand(r,c)*(1-bgWhite) + bgWhite;
    bgDarkWeight = bgDarkWeight.*decideBGColor;
    bgBrightWeight = bgBrightWeight.*(~decideBGColor);
    bgRedWeights = (bgDarkWeight + bgBrightWeight);
    bgRedWeights = bgRedWeights.*(~object);
    R = bgRedWeights*255 + (objectRedWeight*255).*object;
    %R =  (objectRedWeight*255).*object;
    G = randi([50,255],r,c);
    B = randi([50,255],r,c);
    %B = B.*(~object);
    %G = G.*(~object);
    maskedIm = zeros(r,c,3,'uint8');
    maskedIm(:,:,1) = R;
    maskedIm(:,:,2) = G;
    maskedIm(:,:,3) = B;
end