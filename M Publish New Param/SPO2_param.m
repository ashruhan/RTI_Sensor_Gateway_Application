function SPO2_param

S.fh = figure('units','pixels',...
    'position',[500 100 630 410],...
    'menubar','none','Color','black',...
    'name','SpO2_param',...
    'numbertitle','off',...
    'resize','off');

S.title = uicontrol('style','text',...
    'unit','pix',...
    'position',[10 330 405 40],...
    'fontsize',22,'HorizontalAlignment','left',...
    'string','SPO2 Alarm Conditions',...
    'Backgroundcolor','black','foregroundcolor','w');

S.UpperlimExp = uicontrol('style','text',...
    'unit','pix',...
    'position',[10 200 600 100],...
    'fontsize',11.5,'Backgroundcolor','black','foregroundcolor','w','HorizontalAlignment','left',...
    'string',{'Duration: Time period for a limit to remain out of range before activating an alarm' ;...
    'Percent Change: The total change of the given value that will activate an alarm';...
    'Upper Limit: The upper bound that a value can reach before activating alarm algorithms';...
    'Lower Limit: The lower bound that a value can reach before activating alarm algorithms'});

S.ulim_t = uicontrol('style','text',...
    'unit','pix',...
    'position',[370 150 140 30],...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Upper Limit','Backgroundcolor','black','foregroundcolor','w');

S.data(1) = uicontrol('style','edit',...
    'units','pix','string','--',...
    'position',[520 150 40 30],...
    'Backgroundcolor','black','foregroundcolor','w');

S.llim_t = uicontrol('style','text',...
    'unit','pix',...
    'position',[370 90 140 30],...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Lower Limit' ,'Backgroundcolor','black','foregroundcolor','w');

S.data(2) = uicontrol('style','edit',...
    'units','pix',...
    'position',[520 90 40 30],...
    'Backgroundcolor','black','foregroundcolor','w');

S.chk_period_t = uicontrol('style','text',...
    'unit','pix',...
    'position',[10 150 205 30],...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Duration (seconds)','Backgroundcolor','black','foregroundcolor','w');

S.data(3) = uicontrol('style','edit',...
    'units','pix',...
    'position',[235 150 40 30],...
    'Backgroundcolor','black','foregroundcolor','w');

S.percent_change_t = uicontrol('style','text',...
    'unit','pix',...
    'position',[10 90 200 30],...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Percent Change','Backgroundcolor','black','foregroundcolor','w');

S.data(4) = uicontrol('style','edit',...
    'units','pix',...
    'position',[235 90 40 30],...
    'Backgroundcolor','black','foregroundcolor','w');

S.next = uicontrol('style','push',...
    'units','pix',...
    'position',[480 20 120 30],...
    'HorizontalAlign','left',...
    'string','Next',...
    'fontsize',12,'fontweight','bold',...
    'callback',{@SPO2_next,S});

function SPO2_next(varargin)

Static = varargin{3};  % Get the structure.
spo2 = zeros(1,4);
dp = evalin('base','dp');
for m  = 1:4
    if isnan(str2double(get(Static.data(m),'string')))
        spo2(m) = -1;
    else
        spo2(m) = str2double(get(Static.data(m),'string'));
    end
end

if (spo2(1)<spo2(2))&&(spo2(1)~= -1)
    LowOverHigh
    uiwait()
    SPO2_param
else
    Structure  = User_Input_Data();
    Structure.SPO2.upper_lim = spo2(1);
    Structure.SPO2.lower_lim = spo2(2);
    Structure.SPO2.duration = spo2(3);
    Structure.SPO2.percentC = spo2(4);
    
    Sending_Data();
 
    % For loop needed to write successfully
    for loop = 1:2
        dp.write(Structure);
        pause(.5);
    end
    
    close('SpO2_param');
    close('Sending_Data');
    uiresume()
end


