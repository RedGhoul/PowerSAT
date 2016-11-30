function [digitsDetected,errorPercentage] = detectDigits(energySignal)
%DETECTDIGITS Summary of this function goes here
%   Detailed explanation goes here
% do some magic
% use the hilbert function to make a nice clean envolope
% graph a couple of lines for the threshold values
% then find the intersections of between the lines and envolope
% then find the distances between the points
% to see if they are right
% based on the difference, classify it into a digit
        errorPercentage = 0;
        digitsDetected = 0;
end

