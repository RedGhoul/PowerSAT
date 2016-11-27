close all
clear all

amp = rand() + 1; % amplitude
num_shift = 500 * 2;
Freq1 = 150; % Hz
Freq2 = 200; % Hz
Freq3 = 300; % Hz
SamplingFreq = 2*Freq3; %4096; % Hz
Ts = 1/SamplingFreq;
signal_length = 1024 * 2;
n_vec = [0: signal_length-1]; % signal indices
k_vec = 1+n_vec;
window_size = 256 ; %128;

TimeSignal = amp * (cos(2 * pi * Freq1 * n_vec * Ts) + cos(2 * pi * Freq2 * n_vec * Ts) + cos(2 * pi * Freq3 * n_vec * Ts));

plot(n_vec, TimeSignal); % here you are just ploting it in TIMe domain
ylabel('Discrete-Time Signal')
xlabel('Time index n')

X = fft(TimeSignal);

half_k_vec = signal_length/2+1:1:signal_length;
X = [ X(half_k_vec), X(1:signal_length/2) ]; % here you are trying to find the X-axis freq doamin


figure
plot(k_vec, abs(X)) % you are ploting it in true Freq domain with "K" index
ylabel('DFT Signal')
xlabel('Frequency index k')

freq_vec = [0:signal_length/2-1]/(signal_length)*SamplingFreq;

freq_vec = [ [-signal_length/2:1:-1]/(signal_length)*SamplingFreq freq_vec];

figure
plot(freq_vec, abs(X))  % you are ploting it in true Freq domain
ylabel('DFT Signal')
xlabel('Frequency (Hz)')

freq_indexOne = round(Freq1/SamplingFreq*window_size+1);

%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC
TimeSignal = [zeros(1,150) TimeSignal(1:300), zeros(1,150) TimeSignal(300:end)]; % double sided zero padding
figure 
plot(TimeSignal)
title('time sig with the delays')
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    
    ShiftedTimeSigOne(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    ShiftedFreqSigOne = fft(ShiftedTimeSigOne(:, shift+1));
    %figure
    %plot(abs(Y))
    energySigOne(shift+1) = abs(ShiftedFreqSigOne(freq_indexOne))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end

figure
plot(energySigOne)
title('Freq at 150hz');


freq_indexTwo = round(Freq2/SamplingFreq*window_size+1);

% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    
    ShiftedTimeSigTwo(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    ShiftedFreqSigTwo = fft(ShiftedTimeSigTwo(:, shift+1));
    %figure
    %plot(abs(Y))
    energySigTwo(shift+1) = abs(ShiftedFreqSigTwo(freq_indexTwo))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end

figure
plot(energySigTwo)
title('Freq at 200hz');



freq_indexThree = round(Freq3/SamplingFreq*window_size+1);

% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    
    ShiftedTimeSigThree(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    ShiftedFreqSigThree = fft(ShiftedTimeSigTwo(:, shift+1));
    %figure
    %plot(abs(Y))
    energySigThree(shift+1) = abs(ShiftedFreqSigThree(freq_indexThree))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end

figure
plot(energySigThree)
title('Freq at 300hz');