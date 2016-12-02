function [] = plotDigitinEnergy(hObject, eventdata, handles,energySig,freqs)
%PLOTSIGNALINENERGY Summary of this function goes here
%   Detailed explanation goes here
    axes(handles.EnergyPlot);
    for cows=1:length(freqs)
        plot(energySig(cows,:))
        hold on
    end
    title('Energy of Signal')
    ylabel('Amplitude')
    xlabel('Time')
end

