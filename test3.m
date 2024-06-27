cms = cell(4,1);
cms{1} = RESCM{1,3+2};
cms{2} = RESCM{2,3+4};
cms{3} = RESCM{3,2+6};
cms{4} = RESCM{4,2+5};

for i = 1:4
    cm = cms{i};
    sm = sum(cm,1);
    cm = (cm./sm)*100;
    cms{i} = cm;
end

vals = zeros(4,6);
for i = 1:4
    cm = cms{i};
    for j = 1:6
        vals(i,j) = cm(j,j);
    end
end