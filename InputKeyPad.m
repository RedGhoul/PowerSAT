function varargout = InputKeyPad(varargin)
% INPUTKEYPAD MATLAB code for InputKeyPad.fig
%      INPUTKEYPAD, by itself, creates a new INPUTKEYPAD or raises the existing
%      singleton*.
%
%      H = INPUTKEYPAD returns the handle to a new INPUTKEYPAD or the handle to
%      the existing singleton*.
%
%      INPUTKEYPAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUTKEYPAD.M with the given input arguments.
%
%      INPUTKEYPAD('Property','Value',...) creates a new INPUTKEYPAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InputKeyPad_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InputKeyPad_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUsIHANDLES

% Edit the above text to modify the response to help InputKeyPad

% Last Modified by GUIDE v2.5 29-Nov-2016 16:10:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InputKeyPad_OpeningFcn, ...
                   'gui_OutputFcn',  @InputKeyPad_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InputKeyPad is made visible.
function InputKeyPad_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InputKeyPad (see VARARGIN)
handles.Viewable1 = get(handles.TDPanel,'position');
handles.Viewable2 = get(handles.FDPanel,'position');
handles.Viewable3 = get(handles.EnergyPanel,'position');
handles.Viewable4 = get(handles.DetectorWindow,'position');
%some global arrays
handles.currentOutputTime = [] % signal in time
handles.currentOutputFreq = [] % signal in Freq
handles.currentOutputEE = [] % signal in Energy 
handles.XaxisTime = []
handles.XaxisFreq = []
handles.samplingFreq = 400*2 %!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
handles.CCSval = false; % value for concatnating it or not
% Choose default command line output for InputKeyPad
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% Setting the Global Options
function CCSCB_Callback(hObject, eventdata, handles)
handles.CCSval = get(handles.CCSCB,'Value');
guidata(hObject, handles);

function varargout = InputKeyPad_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% all of the following functions are just button press events
function One_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 1,duration,handles.CCSval) % the change

function Two_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 2,duration,handles.CCSval)

function Seven_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 3,duration,handles.CCSval)

function Four_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 4,duration,handles.CCSval)

function Five_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 5,duration,handles.CCSval)

function Eight_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 6,duration,handles.CCSval)

function Three_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 7,duration,handles.CCSval)

function Six_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 8,duration,handles.CCSval)

function Nine_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 9,duration,handles.CCSval)

function Zero_Callback(hObject, eventdata, handles)
duration = str2num(get(handles.EnterDur,'String'));
plotDigitinTime(hObject, eventdata, handles, 0,duration,handles.CCSval)

% functionality Buttons

function Clear_Callback(hObject, eventdata, handles)
    ClearPlot(hObject, eventdata, handles);
    handles.currentOutputTime = 0;
    handles.currentOutputFreq = 0;
    handles.currentOutputEE = 0;
    handles.XaxisTime = 0;
    handles.XaxisFreq = 0;
guidata(hObject, handles);

% adds and plot noise to the signal
function AddNoise_Callback(hObject, eventdata, handles)
    ClearPlot(hObject, eventdata, handles);
    axes(handles.OutputChart);
    NoisePowerVal = str2num(get(handles.NoisePower,'String'));
    NoiseAlphaVal = str2num(get(handles.AlphaOfNoise,'String'));
    handles.currentOutputTime = startNoise(handles.currentOutputTime,NoisePowerVal, NoiseAlphaVal);
    plot(1:length(handles.currentOutputTime),handles.currentOutputTime);
guidata(hObject, handles);

%inserts delay into the signal
function InsertDelaybtn_Callback(hObject, eventdata, handles)
    ClearPlot(hObject, eventdata, handles);
    axes(handles.OutputChart);
    testVal = handles.currentOutputTime;
        if isempty(testVal) == false
            if (length(testVal) - 1) ~= 0 % this is just "!="
                InFront = get(handles.InFrontCB,'Value');
                InBack = get(handles.InBackCB,'Value');
                LengthOfDelay = str2num(get(handles.FirstSigDelay,'String'));
                [handles.XaxisTime,handles.currentOutputTime] = insertDelay(handles.currentOutputTime,LengthOfDelay,InFront,InBack);
                plot(handles.XaxisTime,handles.currentOutputTime);
            else
                set(handles.ErrorTD,'Visible','On');
            end
        else
            set(handles.ErrorTD,'Visible','On');
        end     
guidata(hObject, handles);

% --- Executes on button press in ViewAsFigureTime.
function ViewAsFigureTime_Callback(hObject, eventdata, handles)
    testVal = handles.currentOutputTime;
        if isempty(testVal) == false
            if (length(testVal) - 1) ~= 0 % this is just "!="
                figure('Name','Time Domain Signal');
                plot(1:length(handles.currentOutputTime),handles.currentOutputTime)
                ylabel('Amplitude')
                xlabel('Time Index n')
            else
                set(handles.ErrorTD,'Visible','On');
            end
        else
            set(handles.ErrorTD,'Visible','On');
        end     
guidata(hObject, handles);

% --- Executes on button press in ViewAsFigureFreq.
function ViewAsFigureFreq_Callback(hObject, eventdata, handles)
    if handles.currentOutputFreq ~= 0
        set(handles.FreqError,'Visible','Off');
        figure('Name','Freq Domain  - Magnitude Signal');
        freqAxe = handles.XaxisFreq;
        plot(handles.XaxisFreq,abs(handles.currentOutputFreq));
        ylabel('Amplitude')
        xlabel('Frequency')

        figure('Name','Freq Domain - Phase Signal');
        plot(handles.XaxisFreq,angle(handles.currentOutputFreq));
        ylabel('Amplitude')
        xlabel('Frequency')
    else
        set(handles.FreqError,'Visible','On');
        set(handles.FreqError,'String','There is nothing to plot');
    end 
guidata(hObject, handles);

% --- Executes on button press in ViewAsFigureEnergy.
function ViewAsFigureEnergy_Callback(hObject, eventdata, handles)
    if handles.currentOutputEE ~= 0
        set(handles.ErrorEnergy,'Visible','Off');
        figure('Name','Energy Signal Plot');
        plot(1:length(handles.currentOutputEE),handles.currentOutputEE);
        ylabel('Amplitude')
        xlabel('Index - n')
    else
        set(handles.ErrorEnergy,'Visible','On');
        set(handles.ErrorEnergy,'String','There is nothing to plot');
    end
guidata(hObject, handles);

% --- Executes on button press in RecalEnergy.
function RecalEnergy_Callback(hObject, eventdata, handles)
    samplingFreq  =  str2num(get(handles.SampFreqVal,'String'));
    freqBinNumber  =  str2num(get(handles.FBNValue,'String'));
    numberofWindows = str2num(get(handles.NumberofWindowsVal,'String'));
    windowSize = str2num(get(handles.WindowSizeVal,'String'));
    [error,sigLen,WindowSize,numberofWindows,binNumber,sig] = computeEnergySig(handles.currentOutputTime,samplingFreq,freqBinNumber,numberofWindows,windowSize)
    
    plotDigitinEnergy(hObject, eventdata, handles,sig)
 
    if not(isempty(error))
        set(handles.ErrorEnergy,'Visible','On');
        set(handles.ErrorEnergy,'String',error);
    else
        set(handles.ErrorEnergy,'Visible','Off');
    end
    
guidata(hObject, handles);

% --- Executes on button press in Detect.
function Detect_Callback(hObject, eventdata, handles)
        set(handles.DetectorWindow,'position',handles.Viewable1);
        set(handles.TDPanel,'position',handles.Viewable2);
        set(handles.EnergyPanel,'position',handles.Viewable3);
        set(handles.FDPanel,'position',handles.Viewable4);
        % do some stuff here to find the digits
guidata(hObject, handles);

% Transistion Buttons
% from time to Freq
function ToFreqTDPanel_Callback(hObject, eventdata, handles)
    if not(isempty(handles.currentOutputTime))
        set(handles.FDPanel,'position',handles.Viewable1);
        set(handles.TDPanel,'position',handles.Viewable2);
        set(handles.EnergyPanel,'position',handles.Viewable3);
        set(handles.DetectorWindow,'position',handles.Viewable4);
        [handles.XaxisFreq,handles.currentOutputFreq] = plotDigitinFreq(hObject, eventdata, handles,handles.samplingFreq)
    else 
        set(handles.ErrorTD,'Visible','On');
    end
guidata(hObject, handles);

%from Back to time from Freq
function ToTimeFDPanel_Callback(hObject, eventdata, handles)
    set(handles.TDPanel,'position',handles.Viewable1);
    set(handles.FDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
guidata(hObject, handles);

%from freq to Energy
function ToEnergyFDPanel_Callback(hObject, eventdata, handles)
    % changing postions
    set(handles.EnergyPanel,'position',handles.Viewable1);
    set(handles.FDPanel,'position',handles.Viewable2);
    set(handles.TDPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
    
    [error,sigLen,WindowSize,numberofWindows,binNumber,sig] = computeEnergySig(handles.currentOutputTime,handles.samplingFreq)
    plotDigitinEnergy(hObject, eventdata, handles,sig)
    set(handles.SampFreqVal,'String',num2str(handles.samplingFreq));
    set(handles.FBNValue,'String',num2str(binNumber));
    set(handles.NumberofWindowsVal,'String',num2str(numberofWindows));
    set(handles.WindowSizeVal,'String',num2str(WindowSize));
    set(handles.SigLengthVal,'String',num2str(sigLen));
guidata(hObject, handles);


% from energy to time
function ToTimeEnergyPanel_Callback(hObject, eventdata, handles)
    set(handles.TDPanel,'position',handles.Viewable1);
    set(handles.FDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
guidata(hObject, handles);

% from energy to freq
function ToFreqEnergyPanel_Callback(hObject, eventdata, handles)
    set(handles.FDPanel,'position',handles.Viewable1);
    set(handles.TDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
guidata(hObject, handles);


% from detector to freq
function ToFreqDectetor_Callback(hObject, eventdata, handles)
    set(handles.FDPanel,'position',handles.Viewable1);
    set(handles.TDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
guidata(hObject, handles);


% from detector to time
function ToTimeDectetor_Callback(hObject, eventdata, handles)
    set(handles.TDPanel,'position',handles.Viewable1);
    set(handles.FDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.DetectorWindow,'position',handles.Viewable4);
guidata(hObject, handles);


% from detector to energy
function ToEnergyDectetor_Callback(hObject, eventdata, handles)
    set(handles.DetectorWindow,'position',handles.Viewable1);
    set(handles.FDPanel,'position',handles.Viewable2);
    set(handles.EnergyPanel,'position',handles.Viewable3);
    set(handles.TDPanel,'position',handles.Viewable4);
guidata(hObject, handles);


%for the sub menu options
% --------------------------------------------------------------------
function GenTimeOutput_Callback(hObject, eventdata, handles)
assignin('base', 'OutputTimeSignal',handles.currentOutputTime);
guidata(hObject, handles);

% --------------------------------------------------------------------
function GenfftOutput_Callback(hObject, eventdata, handles)
assignin('base', 'OutputFreqSignal',handles.currentOutputFreq);
guidata(hObject, handles);

% --------------------------------------------------------------------
function GenEsigOutPut_Callback(hObject, eventdata, handles)
assignin('base', 'OutputEnergySignal',handles.currentOutputEE);
guidata(hObject, handles);

% --------------------------------------------------------------------
function TD_Callback(hObject, eventdata, handles)
% hObject    handle to TD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FD_Callback(hObject, eventdata, handles)
% hObject    handle to FD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Energy.

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function ToJpeg_Callback(hObject, eventdata, handles)
% hObject    handle to ToJpeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function NoisePower_Callback(hObject, eventdata, handles)
% hObject    handle to NoisePower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NoisePower as text
%        str2double(get(hObject,'String')) returns contents of NoisePower as a double

% --------------------------------------------------------------------
function Energy_Callback(hObject, eventdata, handles)
% hObject    handle to Energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function AlphaOfNoise_Callback(hObject, eventdata, handles)
% hObject    handle to AlphaOfNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AlphaOfNoise as text
%        str2double(get(hObject,'String')) returns contents of AlphaOfNoise as a double


% --- Executes during object creation, after setting all properties.
function AlphaOfNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AlphaOfNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddSignalbtn.
function AddSignalbtn_Callback(hObject, eventdata, handles)
% hObject    handle to AddSignalbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AddSignalbtn



function FirstSigDelay_Callback(hObject, eventdata, handles)
% hObject    handle to FirstSigDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FirstSigDelay as text
%        str2double(get(hObject,'String')) returns contents of FirstSigDelay as a double


% --- Executes during object creation, after setting all properties.
function FirstSigDelay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FirstSigDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SecSigDelay_Callback(hObject, eventdata, handles)
% hObject    handle to SecSigDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecSigDelay as text
%        str2double(get(hObject,'String')) returns contents of SecSigDelay as a double


% --- Executes during object creation, after setting all properties.
function SecSigDelay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecSigDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EnterDur_Callback(hObject, eventdata, handles)
% hObject    handle to EnterDur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EnterDur as text
%        str2double(get(hObject,'String')) returns contents of EnterDur as a double


% --- Executes during object creation, after setting all properties.
function EnterDur_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnterDur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function SampFreqVal_Callback(hObject, eventdata, handles)
% hObject    handle to SampFreqVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampFreqVal as text
%        str2double(get(hObject,'String')) returns contents of SampFreqVal as a double


% --- Executes during object creation, after setting all properties.
function SampFreqVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampFreqVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FBNValue_Callback(hObject, eventdata, handles)
% hObject    handle to FBNValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FBNValue as text
%        str2double(get(hObject,'String')) returns contents of FBNValue as a double


% --- Executes during object creation, after setting all properties.
function FBNValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FBNValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WindowSizeVal_Callback(hObject, eventdata, handles)
% hObject    handle to WindowSizeVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindowSizeVal as text
%        str2double(get(hObject,'String')) returns contents of WindowSizeVal as a double


% --- Executes during object creation, after setting all properties.
function WindowSizeVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowSizeVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumberofWindowsVal_Callback(hObject, eventdata, handles)
% hObject    handle to NumberofWindowsVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberofWindowsVal as text
%        str2double(get(hObject,'String')) returns contents of NumberofWindowsVal as a double


% --- Executes during object creation, after setting all properties.
function NumberofWindowsVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberofWindowsVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
