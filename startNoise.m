function [sigArrayOut] = startNoise(sigArray,Alpha,NoiseSquare)
%NOISE Summary of this function goes here
%   Detailed explanation goes here
    signalSize = length(sigArray);
    noise = randn(1,signalSize).*sqrt(Alpha); % should this be postive noise ?
    
    sigArrayOut = sigArray + noise;
end

