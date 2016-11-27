clear all
close all
fs = 1000;
t = 0:1/fs:1-1/fs;
f1 = 3;
time_domain= 0.5*cos(2*pi*f1*t+0.2);
figure
plot (time_domain)
freq_domain=fft(time_domain)
figure
freX = [0:length(freq_domain)-1]
plot(freX, abs(freq_domain))
