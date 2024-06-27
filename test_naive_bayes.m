% load('AS.mat')
% load('DBS.mat')
DAT = AS{1,1};
EXP = DBS{1,3};
nbc_res = zeros(10,1);
for i = 1:10
    IND  = EXP>0 & EXP<7;
    EXP = EXP(IND);
    DAT = DAT(IND,:);
%     I = eye(6);
%     EXP2 = I(EXP,:);
    N = size(DAT,1);
    C = round(0.5*N);
    P = randperm(N);
    TRAIN_IN = DAT(P(1:C),:);
    TRAIN_OUT = EXP(P(1:C));
    TEST_IN = DAT(P(C+1:end),:);
    TEST_OUT = EXP(P(C+1:end));
    Mdl = fitlm(TRAIN_IN,TRAIN_OUT);
    %[isLabels1,~,cost] = predict(Mdl,DAT);
    ypred = predict(Mdl,DAT);
    MSE = sum((EXP-ypred).^2)/length(EXP);
    fprintf('MSE = %d',MSE);
end
