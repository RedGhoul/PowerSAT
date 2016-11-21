function PlotDigit(hObject, eventdata, handles, digitNum)
axes(handles.OutputChart);
[len,output] = getencodedOutput(150,200,300);
handles.currentOutput = randAmp(output);
handles.Xaxis = len;
plot(len,output);
guidata(hObject, handles);


