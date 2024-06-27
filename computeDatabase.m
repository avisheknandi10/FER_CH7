function AS = computeDatabase(PTS,POINT_SEL)

    h = waitbar(0,'Please wait computing Signatures ...');
    AS = zeros(length(PTS),nchoosek(length(POINT_SEL),3),10);
    
    for j = 1:length(PTS)
        disp(j)
        pts = PTS{j};
        pts2 = pts(POINT_SEL,:);
        AS(j,:,:) = angle_signature(pts2);
        
        waitbar(j / length(PTS))
    end
    
    close(h)
    AS(isnan(AS)) = 0;
    AS(isinf(AS)) = 0;
end

        
        