function AS = angle_signature(PTS)
    L = length(PTS);
    AS = zeros(nchoosek(L,3),10);
    
    m = 1;
    
    for i = 1:L
        for j = i+1:L
            for k = j+1:L
                x1 = PTS(i,:);
                x2 = PTS(j,:);
                x3 = PTS(k,:);
                a = sum((x1-x2).^2);
                b = sum((x2-x3).^2);
                c = sum((x3-x1).^2);
                A = acos((b^2+c^2-a^2)/(2*b*c));
                B = acos((a^2+c^2-b^2)/(2*a*c));
                C = acos((a^2+b^2-c^2)/(2*a*b));
                
                if abs(A+B+C-pi) < 0.001
                    %AS(m,:) = [A,B,C];
                    D = [A,B,C];
                    %S = sum(D);
                    MX = max(D);
                    MN = min(D);
                    d1 = MX/pi;
                    d2 = MN/pi;
                    d3 = (MX-MN)/pi;
                    d4 = (MX-MN)/pi;
                    d5 = (MX+MN)/pi;
                    d6 = (MX-MN)/MX;
                    d7 = (MX+MN)/MX;
                    AS(m,:) = [A,B,C,d1,d2,d3,d4,d5,d6,d7];
                else
                    AS(m,:) = zeros(1,10);
                end
                m = m + 1;
            end
        end
    end
end