% load('AS.mat')
% load('DBS.mat')
c = zeros(4,1);
cp = zeros(4,1);
cm = cell(4,1);
per = cell(4,1);

for i = 1:4
    DAT = AS{i,1};
    EXP = DBS{i,3};

    IND  = EXP>0 & EXP<7;
    EXP = EXP(IND);
    DAT = DAT(IND,:);
    %DATA = [DAT,EXP];

    I = eye(6);
    EXP2 = I(EXP,:);
    N = size(DAT,1);
    C = round(0.7*N);
    P = randperm(N);
    TRAIN_IN = DAT(P(1:C),:);
    TRAIN_OUT = EXP2(P(1:C),:);
    TEST_IN = DAT(P(C+1:end),:);
    TEST_OUT = EXP2(P(C+1:end),:);
    net = newrb(TRAIN_IN',TRAIN_OUT');
    Y = sim(net,DAT');
    [c(i),cm{i},~,per{i}] = confusion(EXP2',Y);
    cp(i) = crossentropy(net,EXP2',Y);
    disp((1-cp(i))*100)
end

save('RBF_RES.mat','c','cm','cp','per');
