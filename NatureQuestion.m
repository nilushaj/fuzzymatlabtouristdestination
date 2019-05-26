function varargout = NatureQuestion(varargin)
% NATUREQUESTION MATLAB code for NatureQuestion.fig
%      NATUREQUESTION, by itself, creates a new NATUREQUESTION or raises the existing
%      singleton*.
%
%      H = NATUREQUESTION returns the handle to a new NATUREQUESTION or the handle to
%      the existing singleton*.
%
%      NATUREQUESTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NATUREQUESTION.M with the given input arguments.
%
%      NATUREQUESTION('Property','Value',...) creates a new NATUREQUESTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NatureQuestion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NatureQuestion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NatureQuestion

% Last Modified by GUIDE v2.5 11-Oct-2018 18:26:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NatureQuestion_OpeningFcn, ...
                   'gui_OutputFcn',  @NatureQuestion_OutputFcn, ...
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


% --- Executes just before NatureQuestion is made visible.
function NatureQuestion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NatureQuestion (see VARARGIN)

% Choose default command line output for NatureQuestion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NatureQuestion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NatureQuestion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function wildlifeslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.wildlifeslider,'Value');

 set(handles.wildlifevalue,'String',num2str(sliderValue));
 
% hObject    handle to wildlifeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function wildlifeslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wildlifeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnproceed.
function btnproceed_Callback(hObject, eventdata, handles)

      fis=readfis('nature.fis');
      wildlife=  get(handles.wildlifevalue,'string');
      bird=get(handles.birdvalue,'string');
      camping=get(handles.campingvalue,'string');
      waterfall=get(handles.waterfallvalue,'string');
      garden=get(handles.gardenvalue,'string');
      climate=get(handles.climatevalue,'string');
      accomadation=get(handles.accomadationvalue,'string');
      x=evalfis([str2double(wildlife) str2double(bird) str2double(camping) str2double(waterfall) str2double(garden) str2double(climate) str2double(accomadation)],fis);

      [val, idx] = max(x);
      x(idx)      = -Inf;
      [val2, idx2] = max(x);
       x(idx2)      = -Inf;
      [val3, idx3] = max(x);
 
 A=[idx2,idx3];
 if val2==val3
     pos =randi(length(A));
     idx2 = A(pos);
     disp(['Output val11     ', num2str(idx2)]);
     
 end   
     
      
      
      max1 =getfis(fis,'output',idx,'Name');
      max2=getfis(fis,'output',idx2,'Name');
      disp(['Output val1     ', max1]);
      disp(['Output val2     ', max2]);
      setappdata(0,'detailname',max1);
      setappdata(0,'detailname1',max2);
      

      close(NatureQuestion);
      details; 
% hObject    handle to btnproceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function birdslider_Callback(hObject, eventdata, handles)

sliderValue = get(handles.birdslider,'Value');

 set(handles.birdvalue,'String',num2str(sliderValue));
% hObject    handle to birdslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function birdslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to birdslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function campingslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.campingslider,'Value');
 set(handles.campingvalue,'String',num2str(sliderValue));
% hObject    handle to campingslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function campingslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campingslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function waterfallslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.waterfallslider,'Value');
 set(handles.waterfallvalue,'String',num2str(sliderValue));
% hObject    handle to waterfallslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function waterfallslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waterfallslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function gardenslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.gardenslider,'Value');
 set(handles.gardenvalue,'String',num2str(sliderValue));
% hObject    handle to gardenslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function gardenslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gardenslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function climateslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.climateslider,'Value');
 set(handles.climatevalue,'String',num2str(sliderValue));
% hObject    handle to climateslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function climateslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to climateslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function accomadationslider_Callback(hObject, eventdata, handles)
sliderValue = get(handles.accomadationslider,'Value');
 set(handles.accomadationvalue,'String',num2str(sliderValue));
% hObject    handle to accomadationslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function accomadationslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to accomadationslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txtwild_Callback(hObject, eventdata, handles)
% hObject    handle to txtwild (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtwild as text
%        str2double(get(hObject,'String')) returns contents of txtwild as a double


% --- Executes during object creation, after setting all properties.
function txtwild_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtwild (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(NatureQuestion);
home; 

