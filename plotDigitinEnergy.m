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
    legend('Bin-1-(100Hz)','Bin-2-(150Hz)','Bin-3-(200Hz)','Bin-4-(250Hz)','Bin-5-(300Hz)','Bin-6-(350Hz)','Bin-7-(400Hz)')
end

