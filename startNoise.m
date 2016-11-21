function [sigArrayOut] = Noise(sigArray,NoiseSquare)
%NOISE Summary of this function goes here
%   Detailed explanation goes here
    signalSize = length(sigArray);
    noise = randn(1,signalSize) .* -1; % should this be postive noise ?
    % since when you sqaure it will be postive anyways ?
    for index=1:NoiseSquare
        noise = noise.^2;
    end
    sigArrayOut = sigArray + noise;
end

