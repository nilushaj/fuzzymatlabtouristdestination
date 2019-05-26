function varargout = Discription(varargin)
% DISCRIPTION MATLAB code for Discription.fig
%      DISCRIPTION, by itself, creates a new DISCRIPTION or raises the existing
%      singleton*.
%
%      H = DISCRIPTION returns the handle to a new DISCRIPTION or the handle to
%      the existing singleton*.
%
%      DISCRIPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISCRIPTION.M with the given input arguments.
%
%      DISCRIPTION('Property','Value',...) creates a new DISCRIPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Discription_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Discription_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Discription

% Last Modified by GUIDE v2.5 11-Oct-2018 23:24:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Discription_OpeningFcn, ...
                   'gui_OutputFcn',  @Discription_OutputFcn, ...
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


% --- Executes just before Discription is made visible.
function Discription_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Discription (see VARARGIN)

% Choose default command line output for Discription
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Discription wait for user response (see UIRESUME)
% uiwait(handles.figure1);
[~,~,rawData] = xlsread('locationdetails.xlsx');

details= getappdata(0,'locationid');
% get the index of id in the first column of rawData

rowIndex =find(strcmp(rawData(:,1),details),1);
 if ~isempty(rowIndex)
     % get the name
     location = rawData(rowIndex,3);

     % set the name
     set(handles.locationvalue,'String',location);
     descript=rawData(rowIndex,2);
     set(handles.txtdescription,'String',descript);
     district=rawData(rowIndex,5);
     set(handles.districtvalue,'String',district);
     address=rawData(rowIndex,6);
     set(handles.addressvalue,'String',address);
     image1=rawData(rowIndex,4);
     
     path=num2str(cell2mat(image1));
     a=imread(path);
     imshow(a);
 end


% --- Outputs from this function are returned to the command line.
function varargout = Discription_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close(Discription);
 
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txtdescription_Callback(hObject, eventdata, handles)
% hObject    handle to txtdescription (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdescription as text
%        str2double(get(hObject,'String')) returns contents of txtdescription as a double


% --- Executes during object creation, after setting all properties.
function txtdescription_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdescription (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
