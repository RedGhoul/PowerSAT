function [sigArrayOut] = RandAmp(sigArray)
%RANDAMP Summary of this function goes here
%   Detailed explanation goes here
% need more clearifcation on this - does he want each and every point 
% to be between 1 and 2, or does he mean the amplutide for the 
% whole signal ? for now it just be a number
    sigArrayOut = sigArray.*(rand() + 1)
    return
%     ranArray = rand();
%     for indexOfArray=1:length(sigArray)
%         currentValue = sigArray(indexOfArray);
%         if (currentValue > 2) % case if it is greater then 2(currentValue < 1) 
%             
%     end
end

