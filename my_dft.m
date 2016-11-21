function [OP] = my_dft(inputVec)
    lengthOfVec = length(inputVec);
    plotLength = 1:length(inputVec);
    temp = 0;
    OP = zeros(1,lengthOfVec); % Creating the Output Vector
    for K=1:lengthOfVec % for the Ks
        
        for n=2:lengthOfVec+1 % for the ns
            temp =  temp + (inputVec(n-1) * exp((-1i*2*pi*K*(n-1))/lengthOfVec));
        end
        OP(K) = temp;
        temp = 0;
    end
     figure
     subplot(3,1,1)
     stem(plotLength,inputVec,'b')
     title('Original Signal')
     xlabel('n')
     ylabel('Value')
     hold on
     subplot(3,1,2)
     stem(plotLength,fliplr(abs(OP)))
     title('Absolute Value')
     xlabel('Frequency')
     ylabel('|X(w)|')
     hold on	
     subplot(3,1,3)
     stem(plotLength,fliplr(angle(OP)))
     xlabel('Frequency')
     ylabel('Phase')
     title('Phase Response') 
     hold on
end