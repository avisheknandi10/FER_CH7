function [min_perf,c1,cm1,per1] = train6(TINPUT,TOUTPUT,VINPUT,VOUTPUT,netSize) 

    net = patternnet(netSize);

    min_perf = 10;
    
    for i = 1:5
        
        net = init(net);
        [ net, ~] = train(net,TINPUT,TOUTPUT);
        y = net(VINPUT);
        perf = crossentropy(net,VOUTPUT,y);

        if perf < min_perf
            min_perf = perf;
            bestNet = net;
            counter = 0;
        else
            counter = counter + 1;
        end
        disp((1-perf)*100)
    end
    
    y = bestNet(VINPUT);
    [c1,cm1,~,per1] = confusion(VOUTPUT,round(y));
   
end

    