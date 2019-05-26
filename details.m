function varargout = details(varargin)
% DETAILS MATLAB code for details.fig
%      DETAILS, by itself, creates a new DETAILS or raises the existing
%      singleton*.
%
%      H = DETAILS returns the handle to a new DETAILS or the handle to
%      the existing singleton*.
%
%      DETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETAILS.M with the given input arguments.
%
%      DETAILS('Property','Value',...) creates a new DETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before details_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to details_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help details

% Last Modified by GUIDE v2.5 11-Oct-2018 21:47:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @details_OpeningFcn, ...
                   'gui_OutputFcn',  @details_OutputFcn, ...
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


% --- Executes just before details is made visible.
function details_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to details (see VARARGIN)

% Choose default command line output for details
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes details wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% read from the Excel file

 [~,~,rawData] = xlsread('locationdetails.xlsx');

details= getappdata(0,'detailname');
% get the index of id in the first column of rawData

rowIndex =find(strcmp(rawData(:,1),details),1);
 if ~isempty(rowIndex)
     % get the name
     location = rawData(rowIndex,3);

     % set the name
     set(handles.locationvalue,'String',location);
 end
 details1 = getappdata(0,'detailname1');
% get the index of id in the first column of rawData
rowIndex2 = find(strcmp(rawData(:,1),details1),1);
 if ~isempty(rowIndex2)
     % get the name
     location2 = rawData(rowIndex2,3);

     % set the name
     set(handles.locationvalue2,'String',location2);
 end





% --- Outputs from this function are returned to the command line.
function varargout = details_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in locationvalue.
function locationvalue_Callback(hObject, eventdata, handles)
detailsloc= getappdata(0,'detailname');
setappdata(0,'locationid',detailsloc);


Discription; 

% hObject    handle to locationvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in locationvalue2.
function locationvalue2_Callback(hObject, eventdata, handles)
detailsloc1 = getappdata(0,'detailname1');
setappdata(0,'locationid',detailsloc1);

Discription; 
% hObject    handle to locationvalue2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnback.
function btnback_Callback(hObject, eventdata, handles)
close(details);
home; 
% hObject    handle to btnback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
