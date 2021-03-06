function [errormsg,sigLen,WindowSize,numberOfWindows,binNumber,outPutEnergySig] = computeEnergySig(incomingTimeSignal,samplingFreq,binNumber,numberOfWindows,windowSize)
%COMPUTEENERGYSIG Summary of this function goes here
%   Detailed explanation goes here
% need to make this dynamic
%~exist('param3','var')
    sigLength = length(incomingTimeSignal);
    error = '';
    
    if ~exist('windowSize','var')
        windowSize = round(sigLength/6);
    end
    
    if ~exist('numberofWindows','var')
        numberOfWindows = sigLength-windowSize;
    end 
    
    if ~exist('freqBinNumber','var')
        binNumber = round(400/samplingFreq*windowSize+1);
    end 
    
    hamWindow = hamming(windowSize);
    outPutEnergySig = [];
    
    if not(windowSize > sigLength) && not(windowSize < 0)
        try
            % can we hamming window every sub window we get ? yes we can :)
            for shift=0:numberOfWindows-1;
                Window(:, shift+1) = incomingTimeSignal(shift+1:shift+windowSize);
                fftWindow = fft(Window(:, shift+1).*hamWindow);
                outPutEnergySig(shift+1) = abs(fftWindow(binNumber))^2; % we are trying to get the energy each time, we do the DFT shift window
            end
        catch ex
            error = ex.identifier
        end
    else
        error = 'Window Size is much greater than signal length !';
    end 
    
    %outputs
    sigLen = sigLength
    WindowSize = windowSize
    numberOfWindows = numberOfWindows
    binNumber = binNumber
    outPutEnergySig = outPutEnergySig
    errormsg = error
end

