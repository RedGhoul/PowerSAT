function [lenFreq,SigFreq] = plotDigitinFreq(hObject, eventdata, handles,samplingFreq)
%PLOTSIGNALINFREQ Summary of this function goes here
%   Detailed explanation goes here
        sigLength = length(handles.currentOutputTime);
        currentTimeSig = handles.currentOutputTime;
        XaxeFreq =  handles.XaxisFreq;
        
        freq_vec = [0:round(sigLength/2)-1]./(sigLength*samplingFreq);

        freq_vec = [ [-round(sigLength/2):1:-1]./(sigLength*samplingFreq), freq_vec];
%         posSection = [1:1:round(sigLength/2)]./(sigLength*samplingFreq);
%         
%         negSection = [-(round(sigLength/2)):1:-1]./(sigLength*samplingFreq);
%         
        XaxeFreq = freq_vec;%[negSection,posSection];
        
        freqLength = length(XaxeFreq);
        
       
        
        if freqLength > sigLength
           difference =  freqLength - sigLength;
           currentTimeSig = horzcat(currentTimeSig,zeros(1,difference));
        elseif freqLength < sigLength
           difference =  sigLength - freqLength;
           XaxeFreq = horzcat(XaxeFreq,zeros(1,difference));
        end 
        
        TempFFT = fft(currentTimeSig);
        
        half_k_vec = round(length(TempFFT)/2)+1:1:length(TempFFT);
        
        currentOutputFreq = [TempFFT(half_k_vec),TempFFT(1:round(length(TempFFT)/2))];
        
        axes(handles.FreqPlotMag);
        plot(XaxeFreq,abs(currentOutputFreq));
        title('Magnitude of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
        
        axes(handles.FreqPlotPhase);
        plot(XaxeFreq,angle(currentOutputFreq));
        title('Phase of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
        
        %outputs
        lenFreq = XaxeFreq;
        SigFreq = currentOutputFreq;
end

