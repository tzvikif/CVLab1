function artifacts = addArtifacts(im)
    sigma = 2;
    [r,c] = size(im);
    l = 0.1;
    h = 0.33;
    num_artifacts = 20;
    [edges,thresholds] = edge(im,'Canny',[l h],sigma);
    [Gmag,Gdir] = imgradient(im);
    imshowpair(Gmag,Gdir,'montage');
    threshold = 2;
    artifacts = zeros(r,c);
    %create artifacts
    [rows,cols] = find(Gmag(10:end-10,10:end-10)>threshold);
    p = randperm(length(rows),num_artifacts);
    shape = ones(8,2);
    for i = p
        px = int32(rows(i));
        py = int32(cols(i));
        angle = Gdir(px,py);
        rshape = imrotate(shape,angle);
        [rs,cs] = size(rshape);
        artifacts(px-rs/2:px+rs/2-1,py-cs/2:py+cs/2-1) = rshape;
    end
    figure;
    imshow(im-artifacts);
end