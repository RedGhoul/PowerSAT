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
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InputKeyPad

% Last Modified by GUIDE v2.5 21-Nov-2016 14:20:26

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
handles.posFD = get(handles.FDPanel,'position');
handles.posTD = get(handles.TDPanel,'position');
handles.posEnergy = get(handles.EnergyPanel,'position');
% Choose default command line output for InputKeyPad
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InputKeyPad wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InputKeyPad_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function One_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 1)

function Two_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 2)

function Seven_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 3)

function Four_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 4)

function Five_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 5)

function Eight_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 6)

function Three_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 7)

function Six_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 8)

function Nine_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 9)

function Zero_Callback(hObject, eventdata, handles)
PlotDigit(hObject, eventdata, handles, 9)

% functionality Buttons
function Clear_Callback(hObject, eventdata, handles)
ClearPlot(hObject, eventdata, handles);

function AddNoise_Callback(hObject, eventdata, handles)
ClearPlot(hObject, eventdata, handles);
axes(handles.OutputChart);
handles.currentOutput = startNoise(handles.currentOutput,1)
plot(handles.Xaxis,handles.currentOutput);
guidata(hObject, handles);

function InsertDelaybtn_Callback(hObject, eventdata, handles)
ClearPlot(hObject, eventdata, handles);
axes(handles.OutputChart);
[handles.Xaxis,handles.currentOutput] = insertDelay(handles.currentOutput);
plot(handles.Xaxis,handles.currentOutput);
guidata(hObject, handles);

% Transistion Buttons
function ToTimeFDPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToTimeFDPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.TDPanel,'position',handles.posTD);
set(handles.FDPanel,'position',handles.posFD);
guidata(hObject, handles);

% --- Executes on button press in ToFreqTDPanel.
function ToFreqTDPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToFreqTDPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.FDPanel,'position',handles.posTD);
set(handles.TDPanel,'position',handles.posFD);
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


% --------------------------------------------------------------------
function GENFFT_Callback(hObject, eventdata, handles)
% hObject    handle to GENFFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GenTimeOutput_Callback(hObject, eventdata, handles)
% hObject    handle to GenTimeOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ToTimeEnergyPanel.
function ToTimeEnergyPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToTimeEnergyPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in ToFreqEnergyPanel.
function ToFreqEnergyPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToFreqEnergyPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ToEnergyFDPanel.
function ToEnergyFDPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToEnergyFDPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ToEnergyTDPanel.
function ToEnergyTDPanel_Callback(hObject, eventdata, handles)
% hObject    handle to ToEnergyTDPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
