function varargout = HistoryQuestions(varargin)
% HISTORYQUESTIONS MATLAB code for HistoryQuestions.fig
%      HISTORYQUESTIONS, by itself, creates a new HISTORYQUESTIONS or raises the existing
%      singleton*.
%
%      H = HISTORYQUESTIONS returns the handle to a new HISTORYQUESTIONS or the handle to
%      the existing singleton*.
%
%      HISTORYQUESTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTORYQUESTIONS.M with the given input arguments.
%
%      HISTORYQUESTIONS('Property','Value',...) creates a new HISTORYQUESTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HistoryQuestions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HistoryQuestions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HistoryQuestions

% Last Modified by GUIDE v2.5 11-Oct-2018 18:09:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HistoryQuestions_OpeningFcn, ...
                   'gui_OutputFcn',  @HistoryQuestions_OutputFcn, ...
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


% --- Executes just before HistoryQuestions is made visible.
function HistoryQuestions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HistoryQuestions (see VARARGIN)

% Choose default command line output for HistoryQuestions
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HistoryQuestions wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HistoryQuestions_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function templeslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.templeslider,'Value');

 set(handles.templevalue,'String',num2str(sliderValue));
% hObject    handle to templeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function templeslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to templeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnproceed.
function btnproceed_Callback(hObject, eventdata, handles)
fis=readfis('history.fis');

      temples=  get(handles.templevalue,'string');
      archil=get(handles.archilogicalvalue,'string');
      arch=get(handles.architecturevalue,'string');
      art=get(handles.artvalue,'string');
      crowd=get(handles.crowdvalue,'string');
     
      
      x=evalfis([str2double(temples) str2double(archil) str2double(arch) str2double(art) str2double(crowd)],fis);

      [val, idx] = max(x);
      x(idx)      = -Inf;
      [val2, idx2] = max(x);
    
    range1 =getfis(fis,'output',idx,'Name');
range1
range2 =getfis(fis,'output',idx2,'Name');
range2  
      max1 =getfis(fis,'output',idx,'Name');
      max2=getfis(fis,'output',idx2,'Name');
      setappdata(0,'detailname',max1);
      setappdata(0,'detailname1',max2);
      close(HistoryQuestions);
      details; 

% hObject    handle to btnproceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function archilogicalslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.archilogicalslider,'Value');

 set(handles.archilogicalvalue,'String',num2str(sliderValue));
% hObject    handle to archilogicalslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function archilogicalslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to archilogicalslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function architectureslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.architectureslider,'Value');

 set(handles.architecturevalue,'String',num2str(sliderValue));
% hObject    handle to architectureslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function architectureslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to architectureslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function artslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.artslider,'Value');

 set(handles.artvalue,'String',num2str(sliderValue));
% hObject    handle to artslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function artslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to artslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function crowdslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.crowdslider,'Value');

 set(handles.crowdvalue,'String',num2str(sliderValue));
% hObject    handle to crowdslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function crowdslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to crowdslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
close(HistoryQuestions);
home; 
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
