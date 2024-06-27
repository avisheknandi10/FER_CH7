load('AS.mat')
load('DBS.mat')
STR = {'CK+','JAFFE','MMI','MUG'};
RES1 = zeros(4,4);
RES2 = zeros(4,4);
RES3 = cell(4,4);
RES4 = cell(4,4);
for i = 1:4
    for j = 1:4
    fprintf('TRAINING DB = %s, TESTING DB = %s\n',STR{i},STR{j}); 
    TDAT = AS{i,1};
    TEXP = DBS{i,3};

    VDAT = AS{j,1};
    VEXP = DBS{j,3};

    TIND  = TEXP>0 & TEXP<7;
    TEXP = TEXP(TIND,:);
    TDAT = TDAT(TIND,:);

    VIND  = VEXP>0 & VEXP<7;
    VEXP = VEXP(VIND,:);
    VDAT = VDAT(VIND,:);

    I = eye(6);
    TEXP2 = I(TEXP,:);
    VEXP2 = I(VEXP,:);

    [RES1(i,j),RES2(i,j),RES3{i,j},RES4{i,j}] = train6(TDAT',TEXP2',VDAT',VEXP2',20);
    cet = (1-RES1(i,j))*100;
    mse = (1-RES2(i,j))*100;
    fprintf('CET ACC = %s, MSE = %s\n',cet,mse);
    end
end

save('CrossDB.mat','RES1','RES2','RES3','RES4');


