function ClearPlot(hObject, eventdata, handles)

    axes(handles.OutputChart);
    plot(0,0);
    title('Time Domain Signal')
    ylabel('Amplitude')
    xlabel('Time Index n')

    axes(handles.FreqPlotMag);
    plot(0,0);
    title('Magnitude of Signal')
    ylabel('Amplitude')
    xlabel('Frequency')

    axes(handles.FreqPlotPhase);
    plot(0,0);
    title('Phase of Signal')
    ylabel('Amplitude')
    xlabel('Frequency')
    
    axes(handles.EnergyPlot);
    plot(0,0);
    title('Energy of Signal')
    ylabel('Amplitude')
    xlabel('Index n')

    handles.currentOutputTime = 0;
    handles.currentOutputFreq = 0;
    handles.XaxisTime = 0;
    handles.XaxisFreq = 0;
    
guidata(hObject, handles);

