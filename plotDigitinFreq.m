function [] = plotSignalinFreq(hObject, eventdata, handles,samplingFreq)
%PLOTSIGNALINFREQ Summary of this function goes here
%   Detailed explanation goes here
     
        axes(handles.FreqPlotMag);
        
        sigLength = length(handles.currentOutputTime);
        
        posSection = [1:1:round(sigLength/2)]./(sigLength*samplingFreq);
        
        negSection = [-(round(sigLength/2)):1:-1]./(sigLength*samplingFreq);
        
        handles.XaxisFreq = [negSection,posSection];
        
        freqLength = length(handles.XaxisFreq);
        
        if freqLength > sigLength
           difference =  freqlength - sigLength;
           handles.XaxisFreq = horzcat(handles.XaxisFreq,zeros(1,difference));
        elseif freqLength < sigLength
           difference =  sigLength - freqlength;
           handles.XaxisFreq = horzcat(handles.XaxisFreq,zeros(1,difference));
        end 

        plot(handles.XaxisFreq,abs(handles.currentOutputFreq));
        title('Magnitude of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
        
        axes(handles.FreqPlotPhase);
        plot(handles.XaxisFreq,angle(handles.currentOutputFreq));
        title('Phase of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
  
end

