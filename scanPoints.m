function [PTS,EXP] = scanPoints(PATH)

    labels = {'AN','DI','FE','HA','SA','SU'};
    FILES = dir([PATH,'*.pts']);
    PTS = cell(length(FILES),1);
    EXP = zeros(length(FILES),1)*-1;
    h = waitbar(0,sprintf('Scanning %s ...',PATH));
    
    for i = 1:length(FILES)
        %disp(i)
        name = FILES(i).name;
        %get landmarks
        PTS{i} = round(dlmread([PATH,name]));
        
        for j = 1:length(labels)
            if contains(name,labels{j},'IgnoreCase',true)
                EXP(i) = j;
            end
        end
        waitbar(i / length(FILES))
        
    end
    close(h)
end