%load('AS.mat')
%load('DBS.mat')
indx = [2,4,6,5];
perf3 = zeros(4,1);

for i = 1:4
    DAT = AS{i,3+indx(i)};
    EXP = DBS{i,3};
    IND  = EXP>0 & EXP<7;
    EXP = EXP(IND);
    DAT = DAT(IND,:);
    I = eye(6);
    EXP2 = I(EXP,:);
    perf = train_and_cross_validate2(DAT',EXP2',20,3);
    perf2 = 1-mean(perf);
    perf3(i) = perf2;
end