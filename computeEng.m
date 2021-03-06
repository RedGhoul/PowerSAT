function [energys] = computeEng(incomingTimeSignal,freqs,samplingFreq)
%COMPUTEENERGYSIG Summary of this function goes here
%   Detailed explanation goes here
    % samplingFreq = 2048;
    sigLength = length(incomingTimeSignal);
    windowSize = round(sigLength/6);
    numberOfWindows = sigLength-windowSize;
    hamWindow = hamming(windowSize);
    for freqNumber=1:length(freqs)
        binNumber = round(freqs(freqNumber)/samplingFreq*windowSize+1);
        for shift=0:numberOfWindows-1;
            Window(:, shift+1) = incomingTimeSignal(shift+1:shift+windowSize);
            fftWindow = fft(Window(:, shift+1).*hamWindow);
            outPutEnergySig(shift+1) = abs(fftWindow(binNumber))^2; % we are trying to get the energy each time, we do the DFT shift window
        end
        Energys(freqNumber,:) = outPutEnergySig;
        outPutEnergySig = 0;
    end
    energys = Energys;
end

