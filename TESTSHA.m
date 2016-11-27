close all
clear all

amp = 10; % amplitude
num_shift = 250;
freq = 150; % Hz
freq2 = 200;
freq3 = 300;
fs = 10096; %4096; % Hz
Ts = 1/fs;
signal_length = 1024; % need higher resulotuions to get the lower freqs
n_vec = [0: signal_length-1]; % signal indices
k_vec = 1+n_vec;
window_size = 125 ; %128;

x = (amp * cos(2 * pi * freq * n_vec * Ts)) + ((amp*2) * cos(2 * pi * freq2 * n_vec * Ts)) + ((amp*2.1) * cos(2 * pi * freq3 * n_vec * Ts)); 

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

freq_index = round(freq/fs*window_size+1);

%x = [zeros(1,200) x]; % zero padding
% we have to put that X(300:end) in since the shift has to be able to go
% through the VEC

% have to adjust the size of this thing to get proper output
x = [zeros(1,150) x(1:(353-151)), zeros(1,150)]; % double sided zero padding
figure
plot(x)
% the shifting/ for loop here  is to compute the enrgy in each window. 
% and then ploting it all
for shift=0:num_shift-1;
    tim = x(shift+1:shift+window_size);
    y(:, shift+1) = tim;
    Y = fft(y(:, shift+1));
    %figure
    %plot(abs(Y))
    energy(shift+1) = abs(Y(freq_index))^2; % we are trying to get the energy each time, we do the DFT shift window
    
end

figure
plot(energy)