function [len,SigOutputArray] = insertDelay(SigInputArray,LengthOfDelay,Infront,InBack)
%do we need any varition in the delays ?
delay = zeros(1,LengthOfDelay);
if Infront == true
    SigOutputArray = horzcat(horzcat(delay, SigInputArray),delay);
    len = 1:length(SigOutputArray);
end

