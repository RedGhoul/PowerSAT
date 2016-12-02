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
    stdOfsig = std(energySignal)
    
    lag = round(length(energySignal)*0.05);
    MODenergySignal = tsmovavg(energySignal,'s',lag,1)
    % Have to find the peak values then set the highest one to the largest
    % digit
    %envelope
    lines6 = ones(1,length(envelope)) .* 6; % 800
    lines2 = ones(1,length(envelope)) .* 2; % 700
    lines4 = ones(1,length(envelope)) .* 4; % 700
    lines9 = ones(1,length(envelope)) .* 9; % 700
    lines3 = ones(1,length(envelope)) .* 3; % 750
    lines5 = ones(1,length(envelope)) .* 5; % 750
    lines8 = ones(1,length(envelope)) .* 8; % 650
    lines1 = ones(1,length(envelope)) .* (2.5*10^4); % 650
    lines0 = ones(1,length(envelope)) .* 0; % 650
    lines7 = ones(1,length(envelope)) .* 7; % 600
    lines = [lines0,lines1,lines2,lines3,lines4,lines5,lines6,lines7,lines8,lines9];
    incFail = 0;
    cannotFind = false;
    foundPoints = [];
    errorPercentage = '';
    % diffs = abs(envelope - lines(0));
    % minDiff = min(diffs);
    % intersectionDiffs = find(diffs == minDiff);
    for index=1:length(lines)
        % you start by trying to find the first lope that corsponds to the
        % the first digit 0
        diffs = abs(envelope - lines(index)); % you get a massive array of differences
        minDiff = min(diffs); % The min diff counts as a place of most likely intersection
        intersectionDiffs = find(diffs == minDiff); % finds the index where this min difference occurs
        
        while intersectionDiffs == 0 || length(intersectionDiffs) ~= 2
            minDiff = minDiff + 0.5;
            intersectionDiffs = find(diffs<minDiff);
            foundPoints(index) = intersectionDiffs;
            if minDiff > max(intersectionDiffs)
                incFail = true;
                break
            end     
        end
        
        if incFail == true
            while intersectionDiffs == 0 || length(intersectionDiffs) ~= 2
                minDiff = minDiff - 0.5;
                intersectionDiffs = find(diffs<minDiff);
                foundPoints(index) = intersectionDiffs;
                if minDiff < 0
                    cannotFind = true;
                    break
                end     
            end
        end
        
        % The thing below is just to verify that it is infact a legit digit
        % If ever digit is 50 units long, and the delay is another 50 units
        % long, then we say that each tolrance needs to 50 units long for it
        % be a valid digit
        if length(foundPoints(index)) == 2
            diffoundPoint = abs(foundPoints(1) - foundPoints(2));
            if diffoundPoint <= 55 && diffoundPoint >= 50
                digitsDetected = strcat(strcat(digitsDetected,','),num2str(index));
            end
        end
        
    end 
        if cannotFind == true
            errorPercentage = '';
            digitsDetected = '';
        else
            %digits actually found
            errorPercentage = errorPercentage;
            digitsDetected = digitsDetected; 
        end
end

