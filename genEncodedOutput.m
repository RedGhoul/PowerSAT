function [sigLength,OP] = genEncodedOutput(F1,F2,F3)

    sigLength = 1:50; 
    amp = rand() + 1; % amplitude For each tone, the amplitude is
             % different.
    SigOne = [F1,F2,F3]; % Hz
    fs = 4096; % Hz
    Ts = 1/fs;
    OutPut = zeros(1,50);
    %n = 1:signal_length;
    for index=1:length(SigOne)
    OutPut = OutPut + (amp * cos(2 * pi * SigOne(index) * sigLength * Ts));   
    end
    %OP = {sigLength,OutPut};% cell array
    sigLength = sigLength;
    OP = OutPut;% cell array
end