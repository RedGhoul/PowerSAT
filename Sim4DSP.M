close all
clear all

amp = 10; % amplitude
num_shift = 500;
freq = 128; % Hz
SamplingFreq = 4096; % Hz
Ts = 1/SamplingFreq;
signal_length = 1024;
n_vec = [0: signal_length-1]; % signal indices
k_vec = 1+n_vec;
window_size = 256 ; %128;

x = amp * cos(2 * pi * freq * n_vec * Ts);

plot(n_vec, x); % here you are just ploting it in TIMe domain
ylabel('Discrete-Time Signal')
xlabel('Time index n')

FFTOUT = fft(x);
figure 
title('before the turning around')
plot(k_vec, abs(FFTOUT))
% basically sperating all the values
% taking half of the actual values
half_k_vec = signal_length/2+1:1:signal_length; %512 to 1024
valOne = FFTOUT(half_k_vec) % getting the sec half of outputVec 
valTwo = FFTOUT(1:signal_length/2)% getting the first half of outputVec % 0 to 512
% your turning these things around
FFTOUT = [valOne, valTwo];

% still in K domain
figure
plot(k_vec, abs(FFTOUT)) % you are ploting it in true Freq domain with "K" index
ylabel('DFT Signal')
xlabel('Frequency index k')

signalLengthEndFreq = signal_length/2-1

% your doing the same thing you did to the K domain above
% but in here you are dividing each thing in the array by the (signal_length*SamplingFreq)
freq_vec = [0:signalLengthEndFreq]./(signal_length*SamplingFreq); % for the pos Region
lisa = [-signal_length/2:1:-1]/(signal_length)*SamplingFreq % for the negative Region
freq_vec = [ lisa , freq_vec];

figure
plot(freq_vec, abs(FFTOUT))  % you are ploting it in true Freq domain
ylabel('DFT Signal')
xlabel('Frequency (Hz)')

% where is your peak, when you graph it normally
% this is your freqs bin , yes they are
freq_index = freq/SamplingFreq*window_size+1;

% this is the MAGIC !!!!!!
%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC

% zero padding the two ends
Part1 = [zeros(1,150) x(1:300)]
Part2 = [zeros(1,150) x(300:end)]
x = [Part1, Part2]; % double sided zero padding

% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    % only working with rows here
    Valueiny = x(shift+1:shift+window_size);
    % yup that is infact a windowing thing going on
    % shift starts from zero
    y(:, shift+1) = x(shift+1:shift+window_size); % you look at these much of the signal
    valer = y(:, shift+1)
    Y = fft(y(:, shift+1));% pretty much going down a colunm one by one
    % take the FFT of that window
    %figure
    %plot(abs(Y)) the mans creating this thing on the fly 
    % your looking for your peak in each one ?
    energy(shift+1) = abs(Y(freq_index))^2; % we are trying to get the energy each time, we do the DFT shift window
    % if you only put one you get the index in a vertical colunm
    plot(energy)
    pause(0.004)
end



