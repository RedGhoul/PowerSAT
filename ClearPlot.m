function ClearPlot(hObject, eventdata, handles,TimeOrFreq)

    if TimeOrFreq % for the basic time protions
        axes(handles.OutputChart);
        handles.currentOutputTime = 0;
        plot(0,0);
    else % for the fre portions
        axes(handles.FreqPlotMag);
        handles.currentOutputFreq = [];
        plot(0,0);
        axes(handles.FreqPlotPhase);
        handles.currentOutputFreq = [];
        plot(0,0);
    end 

guidata(hObject, handles);

