function [len,SigOutputArray] = insertDelay(SigInputArray,LengthOfDelay,Infront,InBack)
    
    if LengthOfDelay == 1
        delay = 1;
    else
        delay = zeros(1,LengthOfDelay);
    end
    
    outPut = SigInputArray;
    lengths = 0;
    
        if Infront == true
            outPut = horzcat(outPut, delay);
            lengths = 1:length(outPut);
        end 
        
        if InBack == true
            outPut = horzcat(delay, outPut);
            lengths = 1:length(outPut);
        end
        
    len = lengths;
    SigOutputArray = outPut;
end

