function varargout = project_main(varargin)

% PROJECT_MAIN MATLAB code for project_main.fig
%      PROJECT_MAIN, by itself, creates a new PROJECT_MAIN or raises the existing
%      singleton*.
%
%      H = PROJECT_MAIN returns the handle to a new PROJECT_MAIN or the handle to
%      the existing singleton*.
%
%      PROJECT_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_MAIN.M with the given input arguments.
%
%      PROJECT_MAIN('Property','Value',...) creates a new PROJECT_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_main

% Last Modified by GUIDE v2.5 12-Sep-2019 10:01:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @project_main_OpeningFcn, ...
    'gui_OutputFcn',  @project_main_OutputFcn, ...
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


% --- Executes just before project_main is made visible.
function project_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_main (see VARARGIN)
set(handles.r1_val,'string','');
set(handles.r2_val,'string','');
set(handles.lc1_val,'string','');
set(handles.lc2_val,'string','');
set(handles.v1_val,'string','');
set(handles.v2_val,'string','');
set(handles.freq_val,'string','');
grid on

global dat
dat.info=[];
set(handles.dc_check,'value',0);
set(handles.voltage_check,'value',0);

axes(handles.ckt_diagrm);
a=imread('blank.png');
imshow(a);


set(handles.data_table,'data','');
% Choose default command line output for project_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in enter_data.
function enter_data_Callback(hObject, eventdata, handles)
% hObject    handle to enter_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dat
time = get(handles.time_data,'String');
vc = get(handles.vc_data,'String');

dat.info= [dat.info; [ {time} {vc}]];

set(handles.data_table,'data',dat.info);

set(handles.time_data,'string','');
set(handles.vc_data,'string','');

function time_data_Callback(hObject, eventdata, handles)
% hObject    handle to time_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time_data as text
%        str2double(get(hObject,'String')) returns contents of time_data as a double

%time=str2double(get(hObject,'String'))
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function time_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function vc_data_Callback(hObject, eventdata, handles)
% hObject    handle to vc_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vc_data as text
%        str2double(get(hObject,'String')) returns contents of vc_data as a double

%vc=str2double(get(hObject,'String'))
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function vc_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vc_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ac_check.
function ac_check_Callback(hObject, eventdata, handles)
% hObject    handle to ac_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ac_check


% --- Executes on button press in dc_check.
function dc_check_Callback(hObject, eventdata, handles)
% hObject    handle to dc_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dc_check


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DATA=str2double(get(handles.data_table,'data'));
if(get(handles.time_mil,'value')==1)
    DATA(:,1)=DATA(:,1)*10^-3;
end
if(get(handles.vc_mil,'value')==1)
    DATA(:,2)=DATA(:,2)*10^-3;
end
axes(handles.transient_plot);
plot(DATA(:,1),DATA(:,2),'ro');
hold on;
source_type=get(handles.dc_check,'value');
input_type=get(handles.voltage_check,'value');
r_val=get(handles.resistor_value,'string');
r_check=get(handles.r_value,'value');
[t_out,vc_out,type,r1,r2,lc1,lc2,v1,v2,freq]=sorter(DATA,source_type,input_type,r_check,r_val);
plot(t_out,vc_out,'b'),grid on;
xlabel('Time');
if(input_type==1)
    ylabel('Voltage');
    legend('Data Points','Voltage');
    title('Voltage vs Time Graph');
else
    ylabel('Current');
    legend('Data points','Current');
    title('Current vs Time Graph');
end
hold off;
if(type==1)
    axes(handles.ckt_diagrm);
    a=imread('ac rc.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
    set(handles.freq_val,'string',['Freq = ' num2str(freq)]);
end
if(type==2)
    axes(handles.ckt_diagrm);
    a=imread('ac rl.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['L1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
    set(handles.freq_val,'string',['Freq = ' num2str(freq)]);
end
if(type==3)
    axes(handles.ckt_diagrm);
    a=imread('source free dc rc.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==4)
    axes(handles.ckt_diagrm);
    a=imread('source free dc rl.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['L1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==5)
    axes(handles.ckt_diagrm);
    a=imread('dc rc with source.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==6)
    axes(handles.ckt_diagrm);
    a=imread('dc rl with source.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['L1 = ' num2str(lc1)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==7)
    axes(handles.ckt_diagrm);
    a=imread('dc rlc series.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C = ' num2str(lc1)]);
    set(handles.lc2_val,'string',['L =' num2str(lc2)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==8)
    axes(handles.ckt_diagrm);
    a=imread('dc rlc series.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C = ' num2str(lc1)]);
    set(handles.lc2_val,'string',['L =' num2str(lc2)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==9)
    axes(handles.ckt_diagrm);
    a=imread('dc rlc series.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C = ' num2str(lc1)]);
    set(handles.lc2_val,'string',['L =' num2str(lc2)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==10)
    axes(handles.ckt_diagrm);
    a=imread('dc rc special.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1 = ' num2str(r1)]);
    set(handles.lc1_val,'string',['C1 = ' num2str(lc1)]);
    set(handles.lc2_val,'string',['Vc(0) =' num2str(v2)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end
if(type==11)
    axes(handles.ckt_diagrm);
    a=imread('dc rl special.jpg');
    imshow(a);
    set(handles.r1_val,'string',['R1` = ' num2str(r1)]);
    set(handles.lc1_val,'string',['L1 = ' num2str(lc1)]);
    set(handles.lc2_val,'string',['i(0) =' num2str(v2)]);
    set(handles.v1_val,'string',['V1 = ' num2str(v1)]);
end


% --- Executes on button press in voltage_check.
function voltage_check_Callback(hObject, eventdata, handles)
% hObject    handle to voltage_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.vc_input,'String','Voltage');
set(handles.data_table,'ColumnName',{'Time';'Voltage'});
% Hint: get(hObject,'Value') returns toggle state of voltage_check


% --- Executes on button press in current_check.
function current_check_Callback(hObject, eventdata, handles)
% hObject    handle to current_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.vc_input,'String','Current');
set(handles.data_table,'ColumnName',{'Time';'Current'});
% Hint: get(hObject,'Value') returns toggle state of current_check


% --- Executes during object creation, after setting all properties.
function choose_vc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choose_vc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function data_table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in r_value.
function r_value_Callback(hObject, eventdata, handles)
% hObject    handle to r_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of r_value



function resistor_value_Callback(hObject, eventdata, handles)
% hObject    handle to resistor_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resistor_value as text
%        str2double(get(hObject,'String')) returns contents of resistor_value as a double


% --- Executes during object creation, after setting all properties.
function resistor_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resistor_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in re_set.
function re_set_Callback(hObject, eventdata, handles)
% hObject    handle to re_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.r1_val,'string','');
set(handles.r2_val,'string','');
set(handles.lc1_val,'string','');
set(handles.lc2_val,'string','');
set(handles.v1_val,'string','');
set(handles.v2_val,'string','');
set(handles.freq_val,'string','');

set(handles.time_data,'string','');
set(handles.vc_data,'string','');
set(handles.resistor_value,'string','');
set(handles.data_table,'data','');
set(handles.r_value,'value',0);
set(handles.time_mil,'value',0);
set(handles.vc_mil,'value',0);
axes(handles.transient_plot);
plot([1 0],[0 1],'w');
grid on;
axes(handles.ckt_diagrm);
a=imread('blank.png');
imshow(a);
global dat
dat.info=[];


% --- Executes on button press in time_mil.
function time_mil_Callback(hObject, eventdata, handles)
% hObject    handle to time_mil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of time_mil


% --- Executes on button press in vc_mil.
function vc_mil_Callback(hObject, eventdata, handles)
% hObject    handle to vc_mil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of vc_mil


% --- Executes on button press in Browse_button.
function Browse_button_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dat
[filename pathname]=uigetfile({'*.txt'},'File Selector');
fullpathname=strcat(pathname,filename);
text=fileread(fullpathname);
file_value=strsplit(text);
for i=1:2:length(file_value)
    dat.info= [dat.info; [ file_value(i) file_value(i+1) ]];
    set(handles.data_table,'data',dat.info);
end
