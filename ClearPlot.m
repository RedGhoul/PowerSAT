function ClearPlot(hObject, eventdata, handles,TimeOrFreq)
    % 1 for time
    % 2 for Freq
    if TimeOrFreq == 1 
        % for the basic time protions
        axes(handles.OutputChart);
        handles.currentOutputTime = 0;
        plot(0,0);
    else % for the fre portions
        axes(handles.FreqPlotMag);
        handles.currentOutputFreq = 0;
        plot(0,0);
        axes(handles.FreqPlotPhase);
        plot(0,0);
    end 

guidata(hObject, handles);

