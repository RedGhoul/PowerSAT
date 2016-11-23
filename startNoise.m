function [sigArrayOut] = startNoise(sigArray,Alpha, NoiseSquare)
%NOISE Summary of this function goes here
%   Detailed explanation goes here
    signalSize = length(sigArray);
    noise = randn(1,signalSize); % should this be postive noise ?
    % since when you sqaure it will be postive anyways ?
    % when you add noise it's amp does not have to be between 1 and 2
    for index=1:NoiseSquare
        noise = noise.*(Alpha^2);
    end
    sigArrayOut = sigArray + noise;
end

