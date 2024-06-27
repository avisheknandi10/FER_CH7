function [min_perf,c1,cm1,per1] = train5(INPUT,OUTPUT,netSize) 
    net = patternnet(netSize);

    min_perf = 1;
    counter = 0;
    
    
    for i = 1:6
        
        net = init(net);
        [ net, ~] = train(net,INPUT,OUTPUT);
        y = net(INPUT);
        perf = crossentropy(net,OUTPUT,y);

        if perf < min_perf
            min_perf = perf;
            bestNet = net;
            counter = 0;
        else
            counter = counter + 1;
        end
        disp((1-perf)*100)
    end
    
    % Total Accuracy
    y = bestNet(INPUT);
    [c1,cm1,~,per1] = confusion(OUTPUT,round(y));
    %a8 = perform(bestNet,OUTPUT(:,indx),round(y));
end

    