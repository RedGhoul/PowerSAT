close all
clear all

amp = rand()+1; % amplitude
num_shift = 500*3;
freq = [150,200,400]; % Hz
fs = 400*2; % Hz
Ts = 1/fs;
signal_length = 1024*2;
n_vec = [0: signal_length-1]; % signal indices
k_vec = 1+n_vec;
window_size = round(signal_length/6) ; %128;

TimeSignal = amp * (cos(2 * pi * freq(1) * n_vec * Ts)+cos(2 * pi * freq(2) * n_vec * Ts)+cos(2 * pi * freq(3) * n_vec * Ts));

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

freq_vec = [0:signal_length/2-1]/(signal_length)*fs;

freq_vec = [ [-signal_length/2:1:-1]/(signal_length)*fs freq_vec];

figure
plot(freq_vec, abs(X))  % you are ploting it in true Freq domain
ylabel('DFT Signal')
xlabel('Frequency (Hz)')



%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC 2449
TimeSignal = [zeros(1,150) TimeSignal(1:555), zeros(1,150) TimeSignal(700:end)]; % double sided zero padding
hanwin = length(TimeSignal);
freq_index = round(freq(1)/fs*window_size+1);
figure 
plot(TimeSignal)
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
    hanww = hamming(341)
for shift=0:num_shift-1;
    y(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    
    Y = fft(y(:, shift+1).*hanww);
    %figure
    %plot(abs(Y))
    energy(shift+1) = abs(Y(freq_index))^2; % we are trying to get the energy each time, we do the DFT shift window    
end
figure
plot(energy)

freq_index2 = round(freq(2)/fs*window_size+1);
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    
    y2(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    Y2 = fft(y2(:, shift+1));
    %figure
    %plot(abs(Y))
    energy2(shift+1) = abs(Y2(freq_index2))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end
figure
plot(energy2)
% questioning time
% so the hamming window handeles any iscontinuities ?
% are we supposed to see one big bump per digit ?
hanww = hamming(341) %256
freq_index3 = round(freq(3)/fs*window_size+1);
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    y3(:, shift+1) = TimeSignal(shift+1:shift+window_size);
    Y3 = fft(y3(:, shift+1).*hanww);
    %figure
    %plot(abs(Y))
    energy3(shift+1) = abs(Y3(freq_index3))^2; % we are trying to get the energy each time, we do the DFT shift window
end
figure
plot(energy3)