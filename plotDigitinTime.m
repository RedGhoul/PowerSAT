function plotDigitinTime(hObject, eventdata, handles, digitNum,duration,CCS)
    axes(handles.OutputChart);
    
    switch digitNum
        case 1
            [len,output] = genEncodedOutput(150,200,300,duration);
        case 2
            [len,output] = genEncodedOutput(150,200,350,duration);
        case 3
            [len,output] = genEncodedOutput(150,200,400,duration);
        case 4
            [len,output] = genEncodedOutput(150,250,400,duration);
        case 5
            [len,output] = genEncodedOutput(150,250,350,duration);
        case 6
            [len,output] = genEncodedOutput(150,250,400,duration);
        case 7
            [len,output] = genEncodedOutput(100,200,300,duration);
        case 8
            [len,output] = genEncodedOutput(100,200,350,duration);
        case 9 
            [len,output] = genEncodedOutput(100,200,400,duration);
        case 0
            [len,output] = genEncodedOutput(100,250,300,duration);
        otherwise
            [len,output] = genEncodedOutput(100,250,300,duration);
    end 
    
    isErrorOn  =  get(handles.ErrorTD,'Visible');
    if isErrorOn
        set(handles.ErrorTD,'Visible','Off');
    end 
    
    if CCS == 1
        % this is for when your concating it
        handles.currentOutputTime = horzcat(handles.currentOutputTime,output);
        handles.XaxisTime = horzcat(handles.XaxisTime,len);
    else 
        handles.currentOutputTime = output;
        handles.XaxisTime = len;
    end
    
    if handles.XaxisTime == 1
        stem(1:handles.XaxisTime,handles.currentOutputTime);
    else
        plot(1:length(handles.currentOutputTime),handles.currentOutputTime);
    end 
    
    title('Time Domain Signal')
    ylabel('Amplitude')
    xlabel('Time [10 Units = 1 milisec]')
guidata(hObject, handles);


