function plotDigitinTime(hObject, eventdata, handles, digitNum)
axes(handles.OutputChart);
    switch digitNum
        case 1
            [len,output] = genEncodedOutput(150,200,300);
        case 2
            [len,output] = genEncodedOutput(150,200,350);
        case 3
            [len,output] = genEncodedOutput(150,200,400);
        case 4
            [len,output] = genEncodedOutput(150,250,400);
        case 5
            [len,output] = genEncodedOutput(150,250,350);
        case 6
            [len,output] = genEncodedOutput(150,250,400);
        case 7
            [len,output] = genEncodedOutput(100,200,300);
        case 8
            [len,output] = genEncodedOutput(100,200,350);
        case 9 
            [len,output] = genEncodedOutput(100,200,400);
        case 0
            [len,output] = genEncodedOutput(100,250,300);
        otherwise
            [len,output] = genEncodedOutput(100,250,300);
    end 
    
    isErrorOn  =  get(handles.ErrorTD,'Visible');
    if isErrorOn
        set(handles.ErrorTD,'Visible','Off');
    end 
    
handles.currentOutputTime = output;
handles.XaxisTime = len;
plot(len,output);
title('Time Domain Signal')
ylabel('Discrete-Time Signal')
xlabel('Time Index n')
guidata(hObject, handles);


