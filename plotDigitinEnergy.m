function [] = plotDigitinEnergy(hObject, eventdata, handles,energySig)
%PLOTSIGNALINENERGY Summary of this function goes here
%   Detailed explanation goes here
    axes(handles.EnergyPlot);
    plot(energySig)
    title('Energy of Signal')
    ylabel('Amplitude')
    xlabel('Time')
end

