POINT_SEL = [18,20,22,23,25,27,37,38,40,42,43,45,...
    46,48,32,34,36,49,52,55,58];
PATH1 = 'C:\DB\CKPlusTop\';
PATH2 = 'C:\DB\JAFFE\';
PATH3 = 'C:\DB\MMI\';
PATH4 = 'C:\DB\MUG\';
PATHS = {PATH1,PATH2,PATH3,PATH4};
DBS = cell(4,3);

for i = 1:4
    DBS{i,1} = PATHS{i};
    [DBS{i,2},DBS{i,3}] = scanPoints(PATHS{i});
end
save('DBS.mat','DBS');

AS = cell(4,10);
% Compute Databases
for i = 1:4
    DATASET = computeDatabase(DBS{i,2},POINT_SEL);
    DATASET = abs(DATASET);
    % Reduce normalize databases
    for j = 1:10
        DATASETA = DATASET(:,abs(sum(DATASET(:,:,j))) > 0,j);
        MX = max(DATASETA,[],2);
        MN = min(DATASETA,[],2);
        AS{i,j} = (DATASETA-MN)./(MX-MN);
    end
end
save('AS.mat','AS');




netSize = 20;
RES = zeros(4,10);
RES1 = zeros(4,10);
RESCM = cell(4,10);
RESPER = cell(4,10);



for j = 1:10
    for i = 2:2
        EXP = DBS{i,3};
        
        DATASETA = AS{i,j};
        IND  = EXP>0 & EXP<7;
        EXP = EXP(IND);
        DATASETA = DATASETA(IND,:);
        fprintf('EXP length = %d',length(EXP));
        fprintf('DATASET size = %d',size(DATASETA,1));
        I = eye(6);
        EXP2 = I(EXP,:);
        [RES(i,j),RES1(i,j),RESCM{i,j},RESPER{i,j}] = train5(DATASETA',EXP2',netSize);
     end
end

save('RESTrue1.mat','RES','RES1','RESCM','RESPER');
