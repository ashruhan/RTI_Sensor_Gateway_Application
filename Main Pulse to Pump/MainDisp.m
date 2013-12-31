function MainDisp
%% Main Mfile Gui
% creating Global handle to be set in PulseMain
clear global S
global S

S.fh = figure('units','pixels',...                                          %Creating Main Disp Figure
    'position',[400 200 900 480],...
    'Color','black',...
    'name','MainDisp',...
    'numbertitle','off',...
    'resize','off');

S.SPO2(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[20 360 40 50],...
    'fontsize',36,'HorizontalAlignment','right',...
    'backgroundColor','black','ForegroundColor','w',...
    'string','H');

S.SPO2(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[60 360 124 75],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',55,'HorizontalAlignment','center',...
    'string','000');

S.SPO2(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[183 410 40 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','---');

S.SPO2(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[180 380 30 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.SPO2(5) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[180 350 90 30],...
    'backgroundColor','black','ForegroundColor','g',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','%Spo2');


S.HR(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[20 220 40 50],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',36,'HorizontalAlignment','right',...
    'string','H');

S.HR(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[60 220 124 75],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',55,'HorizontalAlignment','center',...
    'string','00');

S.HR(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[183 270 40 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.HR(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[180 240 30 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.HR(5) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[180 210 50 30],...
    'backgroundColor','black','ForegroundColor','blue',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','HR');


% S.PI(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
%     'unit','pix',...
%     'position',[320 360 40 50],...
%     'backgroundColor','black','ForegroundColor','w',...
%     'fontsize',36,'HorizontalAlignment','right',...
%     'string','H');
% 
% S.PI(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
%     'unit','pix',...
%     'position',[360 360 124 75],...
%     'backgroundColor','black','ForegroundColor','w',...
%     'fontsize',55,'HorizontalAlignment','center',...
%     'string','00');
% 
% S.PI(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
%     'unit','pix',...
%     'position',[483 410 40 30],...
%     'backgroundColor','black','ForegroundColor','w',...
%     'fontsize',18,'HorizontalAlignment','left',...
%     'string','00');
% 
% S.PI(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
%     'unit','pix',...
%     'position',[480 380 30 30],...
%     'backgroundColor','black','ForegroundColor','w',...
%     'fontsize',18,'HorizontalAlignment','left',...
%     'string','00');
% 
% S.PI(5) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
%     'unit','pix',...
%     'position',[480 350 30 30],...
%     'backgroundColor','black','ForegroundColor','w',...
%     'fontsize',18,'HorizontalAlignment','left',...
%     'string','PI');


S.RR(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[320 220 40 50],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',36,'HorizontalAlignment','right',...
    'string','H');

S.RR(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[360 220 124 75],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',55,'HorizontalAlignment','center',...
    'string','00');

S.RR(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[483 270 40 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.RR(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[480 240 30 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.RR(5) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[480 210 50 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','RR');

S.EXP(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[320 360 40 50],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',36,'HorizontalAlignment','right',...
    'string','H');

S.EXP(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[360 360 124 75],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',55,'HorizontalAlignment','center',...
    'string','00');

S.EXP(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[483 410 40 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.EXP(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[480 380 30 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','00');

S.EXP(5) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[480 350 100 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','ET_CO2');

S.Devices(1) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[190 450 120 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Radical 7:');

S.Devices(2) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[300 450 120 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Sensor Off');

S.Devices(3) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[450 450 170 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','Infusion Pump:');
S.Devices(4) = uicontrol('style','text',...                                          %Creating Pulse Ox Title
    'unit','pix',...
    'position',[620 450 120 30],...
    'backgroundColor','black','ForegroundColor','w',...
    'fontsize',18,'HorizontalAlignment','left',...
    'string','STOPPED');

S.Stop = uicontrol('style','push',...
    'units','pix',...
    'position',[700 10 180 40],...
    'HorizontalAlign','left',...
    'string','Stop and Close',...
    'fontsize',10,'fontweight','bold',...
    'callback',{@stopandclose,S});

S.clock = uicontrol('style','text',...
    'backgroundColor','black','ForegroundColor','w',...
    'unit','pix',...
    'position',[750 450 140 30],...
    'fontsize',18,...
    'fontweight','bold');

function stopandclose(varargin)                                             %close the MainDisp Gui
evalin('base','stop(ValRead)');
evalin('base','clear dp');
close('MainDisp');













