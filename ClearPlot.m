function ClearPlot(hObject, eventdata, handles)
axes(handles.OutputChart);
handles.currentOutput = 0;
plot(0,0);
guidata(hObject, handles);

