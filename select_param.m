function select_param

%select_param
%  Choose parameter to set upper/lower limit, diff time and diff %
S.fh = figure('units','pixels',...
    'position',[500 100 630 410],...
    'menubar','none','Color','black',...
    'name','Select_Parameters',...
    'numbertitle','off',...
    'resize','off');

S.tx = uicontrol('style','text',...
    'unit','pix','HorizontalAlignment','left','foregroundcolor','w',...
    'Backgroundcolor','black',...
    'position',[10 330 590 50],...
    'fontsize',28,'string',...
    'Check vitals to change Alarm Limits');

S.c(1) = uicontrol('style','checkbox','units','pixels',...
    'position',[60,260,115,35],'Backgroundcolor','black','foregroundcolor','w','fontsize',25,'string','SPO2');
S.c(2) = uicontrol('style','checkbox','units','pixels',...
    'position',[60,210,70,35],'Backgroundcolor','black','foregroundcolor','w','fontsize',25,'string','HR');
% S.c(3) = uicontrol('style','checkbox','units','pixels',...
%     'position',[60,160,60,35],'Backgroundcolor','black','foregroundcolor','w','fontsize',25,...
%     'string','PI');

% Create OK pushbutton
S.p = uicontrol('style','push',...
    'units','pix',...
    'position',[480 20 120 30],...
    'HorizontalAlign','left',...
    'string','Next',...
    'fontsize',12,'fontweight','bold',...
    'callback',{@p_call,S});

% Pushbutton callback
function p_call(varargin)
S = varargin{3};  % Get the structure.
vals = get(S.c,'Value');
checked = find([vals{:}]);

spo2(1) = double(0);
spo2(2) = double(0);
spo2(3) = double(0);
spo2(4) = double(0); 
assignin('base','spo2',spo2);

Pulse(1) = double(0);
Pulse(2) = double(0);
Pulse(3) = double(0);
Pulse(4) = double(0); 
assignin('base','Pulse',Pulse);

%populating the workspace with variable needed in the functions
% loop checks the the returned vector from teh gui to see what boxes have
% been check. Then loops through to execute them in switch case.
% uiwait waites for the gui to be closed the continues execution of hte for
% loop

dp = DDS.DomainParticipant(...
    'dim_nu_obs_value_Library::dim_nu_obs_value_Profile', 0);
dp.addWriter('User_Input_Data', 'User_Input_Data_topic'); 
assignin('base','dp',dp);

for M = 1:length(checked)
    
    switch checked(M)
        case 1
            SPO2_param();
            uiwait()
        case 2
            PULSE_RATE_param();
            uiwait()
%         case 3            
%             PERF_INDEX_param();
    end
end
close('Select_Parameters');





