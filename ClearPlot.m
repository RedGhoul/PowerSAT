function ClearPlot(hObject, eventdata, handles,TimeOrFreq)
    % 1 for time
    % 2 for Freq
    if TimeOrFreq == 1 
        % for the basic time protions
        axes(handles.OutputChart);
        handles.currentOutputTime = 0;
        plot(0,0);
        title('Time Domain Signal')
        ylabel('Discrete-Time Signal')
        xlabel('Time Index n')
    else % for the fre portions
        
        axes(handles.FreqPlotMag);
        handles.currentOutputFreq = 0;
        plot(0,0);
        title('Magnitude of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
        
        axes(handles.FreqPlotPhase);
        plot(0,0);
        title('Phase of Signal')
        ylabel('Amplitude')
        xlabel('Frequency')
    end 

guidata(hObject, handles);

