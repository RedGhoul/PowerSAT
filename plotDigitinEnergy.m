function [ output_args ] = plotDigitinEnergy(hObject, eventdata, handles,energySig)
%PLOTSIGNALINENERGY Summary of this function goes here
%   Detailed explanation goes here
    axes(handles.EnergyPlot);
    
    for signal=1:energySigs
        plot(energySig(1))
        on hold
    end 
    
    title('Magnitude of Signal')
    ylabel('Amplitude')
    xlabel('Frequency')
    guidata(hObject, handles);
end

