function [len,SigOutputArray] = insertDelay(SigInputArray)
%do we need any varition in the delays ?
delay = zeros(1,40);
SigOutputArray = horzcat(horzcat(delay, SigInputArray),delay);
len = 1:length(SigOutputArray);
end

