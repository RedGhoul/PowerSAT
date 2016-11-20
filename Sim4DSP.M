close all
clear all

amp = 10; % amplitude
num_shift = 500;
freq = 128; % Hz
fs = 4096; % Hz
Ts = 1/fs;
signal_length = 1024;
n_vec = [0: signal_length-1]; % signal indices
k_vec = 1+n_vec;
window_size = 256 ; %128;

x = amp * cos(2 * pi * freq * n_vec * Ts);

plot(n_vec, x); % here you are just ploting it in TIMe domain
ylabel('Discrete-Time Signal')
xlabel('Time index n')

X = fft(x);

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

freq_index = freq/fs*window_size+1;

%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC
x = [zeros(1,150) x(1:300), zeros(1,150) x(300:end)]; % double sided zero padding

% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    
    y(:, shift+1) = x(shift+1:shift+window_size);
    Y = fft(y(:, shift+1));
    %figure
    %plot(abs(Y))
    energy(shift+1) = abs(Y(freq_index))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end

figure
plot(energy)
