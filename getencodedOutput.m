function [OP] = getencodedOutput()
    clear all 
    close all 
    x = -pi:0.01:pi;
    amp = 10; % amplitude
    freq = 128; % Hz
    fs = 4096; % Hz
    Ts = 1/fs;
    signal_length = 1024;
    n = 1:signal_length;
    x = amp * cos(2 * pi * freq * n * Ts);
    plot(x)
end