function [sigLength,OP] = genEncodedOutput(F1,F2,F3)
    % one N = 1 millisec ?
    %The duration of each digit is 50 milliseconds, 
    %with 50 milliseconds silence between subsequent
    %digits.
    
    sigLength = 1:50; % ???? WTF
    amp = rand() + 1; % amplitude For each tone, the amplitude is
             % different.
    SigOne = [F1,F2,F3]; % Hz
    fs = 4096; % Hz
    Ts = 1/fs;
    OutPut = zeros(1,50); % ???? WTF
    %n = 1:signal_length;
    for index=1:length(SigOne)
    OutPut = OutPut + (amp * cos(2 * pi * SigOne(index) * sigLength * Ts));   
    end
    %OP = {sigLength,OutPut};% cell array
    sigLength = sigLength;
    OP = OutPut;% cell array
end