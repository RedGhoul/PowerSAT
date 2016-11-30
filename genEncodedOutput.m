function [sigLength,OP] = genEncodedOutput(F1,F2,F3,duration)
    multiplerForTime = 10;
    sigLength = 1:(duration*multiplerForTime);
    
    %10 units equals 1 milisec
    SigOne = [F1,F2,F3]; % Hz
    fs = 4651; % Sampling frequency
    Ts = 1/fs;
    OutPut = zeros(1,length(sigLength));
    %n = 1:signal_length;
    for index=1:length(SigOne)
        amp = rand() + 1; % amplitude For each tone, the amplitude is different.
        OutPut = OutPut + (amp * cos(2 * pi * SigOne(index) * sigLength * Ts));   
        amp = 0;
    end
    %OP = {sigLength,OutPut};% cell array
    sigLength = length(OutPut);
    OP = OutPut;% cell array
%     figure 
%     plot(sigLength,OP)
end