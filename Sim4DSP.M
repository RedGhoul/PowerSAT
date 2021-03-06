close all 
clear all

amp = 10; % amplitude
num_shift = 500;
freq = 128; % Hz
freq2 = 200; % Hz
freq3 = 600; % Hz
SamplingFreq = 12000; % Hz
Ts = 1/SamplingFreq;
signal_length = 1024;
n_vec = [0:signal_length-1 ]; % signal indices
k_vec = 1+n_vec
window_size = 320; %128;

x = amp *((cos(2 * pi * freq * n_vec * Ts) ) + ( cos(2 * pi * freq2 * n_vec * Ts)) + ( cos(2 * pi * freq3 * n_vec * Ts)));
plot(n_vec, x); % here you are just ploting it in TIMe domain
ylabel('Discrete-Time Signal')
xlabel('Time index n')

FFTOUT = fft(x);
figure 
plot(1:length(FFTOUT), abs(FFTOUT))
title('before the turning around')
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
lisa = [-signal_length/2:1:-1]./(signal_length*SamplingFreq) % for the negative Region
freq_vec = [ lisa , freq_vec];

figure
plot(freq_vec, abs(FFTOUT))  % you are ploting it in true Freq domain
title('yolo life')
ylabel('DFT Signal')
xlabel('Frequency (Hz)')
figure
plot(1:length(FFTOUT),FFTOUT);
% where is your peak, when you graph it normally 
% this is your freqs bin your looking at
% you want to the coeffinecnt that reps the freq
% to get back to the time thing
freq_index1 = round(freq/SamplingFreq*window_size+1);

freq_index2 = round(freq2/SamplingFreq*window_size+1);
% this is the MAGIC !!!!!!
%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC
figure
% zero padding the two ends
Part1 = [zeros(1,150) x(1:300)]
Part2 = [zeros(1,150) x(300:end)]
x = [Part1, Part2]; % double sided zero padding
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
% should make our own hanning= 
plot(x)
for shift=0:num_shift-1;
    % only working with rows here
    Valueiny = x(shift+1:shift+window_size);
    % yup that is infact a windowing thing going on
    % shift starts from zero
    y(:, shift+1) = x(shift+1:shift+window_size); % you look at these much of the signal
    valer = y(:, shift+1);
    FristBin = fft(y(:, shift+1));% pretty much going down a colunm one by one
    % take the FFT of that window
    %figure
    %plot(abs(Y)) the mans creating this thing on the fly 
    % your looking for your peak in each one ?
    energy1(shift+1) = abs(FristBin(freq_index1))^2; % we are trying to get the energy each time, we do the DFT shift window
    %energy2(shift+1) = abs(FristBin(freq_index2))^2;
    % if you only put one you get the index in a vertical colunm
    plot(energy1)
    pause(0.004)
end
title('sec sig at 128hz')
% figure
% window_size = 400
% num_shift = 400
% for shift=0:num_shift-1;
%     % only working with rows here
%     Valueiny2 = x(shift+1:shift+window_size);
%     % yup that is infact a windowing thing going on
%     % shift starts from zero
%     y2(:, shift+1) = x(shift+1:shift+window_size); % you look at these much of the signal
%     valer2 = y2(:, shift+1);
%     FristBin2 = fft(y2(:, shift+1));% pretty much going down a colunm one by one
%     % take the FFT of that window
%     %figure
%     %plot(abs(Y)) the mans creating this thing on the fly 
%     % your looking for your peak in each one ?
%     energy2(shift+1) = abs(FristBin2(freq_index2))^2; % we are trying to get the energy each time, we do the DFT shift window
%     %energy2(shift+1) = abs(FristBin(freq_index2))^2;
%     % if you only put one you get the index in a vertical colunm
% 
%     plot(energy2)
%     pause(0.004)
% end
% title('sec sig at 200hz')
% yeSS = hilbert(energy1);
% env = abs(yeSS);
% accc = tsmovavg(env,'s',4,2)
% figure
% plot(1:length(env),accc,'r','LineWidth',2)
% hold on
% plot(t,[-1;1]*env,'r','LineWidth',2)
% xlim([0 0.1])
% xlabel('Seconds')

