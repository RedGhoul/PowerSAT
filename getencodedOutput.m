function [sigLength,OP] = getencodedOutput(F1,F2,F3)
    % first digit
    sigLength = 1:1028;
    amp = 10; % amplitude
    SigOne = [F1,F2,F3]; % Hz
    fs = 4096; % Hz
    Ts = 1/fs;
    OutPut = zeros(1,1028);
    %n = 1:signal_length;
    for index=1:length(SigOne)
    OutPut = OutPut + (amp * cos(2 * pi * SigOne(index) * sigLength * Ts));   
    end
    %OP = {sigLength,OutPut};% cell array
    sigLength = sigLength;
    OP = OutPut;% cell array
end