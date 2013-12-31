function PulseDisp(varargin)
%%  Main Gui

global S

%Reading in the limits and setting handle to the GUI

temp(1) ={num2str(evalin('base','CompareIntputVitals.SPO2.lower_lim'))};
set(S.SPO2(4),'str',{temp{1}}); %#ok<*CCAT1>
temp(2) ={num2str(evalin('base','CompareIntputVitals.PULSE_RATE.upper_lim'))};
set(S.HR(3),'str',{temp{2}});
temp(3) ={num2str(evalin('base','CompareIntputVitals.PULSE_RATE.lower_lim'))};
set(S.HR(4),'str',{temp{3}});
temp(4) ={num2str(evalin('base','CompareIntputVitals.PERF_INDEX.upper_lim'))};
% set(S.PI(3),'str',{temp{4}});
% temp(5) ={num2str(evalin('base','CompareIntputVitals.PERF_INDEX.lower_lim'))};
% set(S.PI(4),'str',{temp{5}});
temp(6) ={num2str(evalin('base','CompareIntputVitals.RespRate.upper_lim'))};
set(S.RR(3),'str',{temp{6}});
temp(7) ={num2str(evalin('base','CompareIntputVitals.RespRate.lower_lim'))};
set(S.RR(4),'str',{temp{7}});
temp(8) ={num2str(evalin('base','CompareIntputVitals.ExpCO2.upper_lim'))};
set(S.EXP(3),'str',{temp{8}});
temp(9) ={num2str(evalin('base','CompareIntputVitals.ExpCO2.lower_lim'))};
set(S.EXP(4),'str',{temp{9}});

%% Pulse
CompareIntputVitals = evalin('base','CompareIntputVitals');

if  (CompareIntputVitals.SPO2.state == 36)&&...
        (CompareIntputVitals.PULSE_RATE.state == 36)
    
    set(S.Devices(2),'str','Sensor Off','ForegroundColor','red');
    
else
    set(S.Devices(2),'str','Sensor On','ForegroundColor','white');
    
    temp{1} = evalin('base','CompareIntputVitals.SPO2.value');
    temp{2} = evalin('base','CompareIntputVitals.PULSE_RATE.value');
%   temp{3} = evalin('base','CompareIntputVitals.PERF_INDEX.value');
    temp{4} = evalin('base','CompareIntputVitals.RespRate.value');
    temp{5} = evalin('base','CompareIntputVitals.ExpCO2.value');
    
   

    if (CompareIntputVitals.SPO2.value >...
            CompareIntputVitals.SPO2.upper_lim)                           % Comparing if Sp02 is within the high low limits
        set(S.SPO2(1),'str','H','ForegroundColor','red');
        set(S.SPO2(2),'str',{temp{1}},'ForegroundColor','red');
    elseif (CompareIntputVitals.SPO2.value <...
            CompareIntputVitals.SPO2.lower_lim)   
        set(S.SPO2(1),'str','L','ForegroundColor','red');
        set(S.SPO2(2),'str',{temp{1}},'ForegroundColor','red');
    else
        set(S.SPO2(1),'str','','ForegroundColor','w');
        set(S.SPO2(2),'str',{temp{1}},'ForegroundColor','white');
    end
    
    if CompareIntputVitals.SPO2.state == 36
        set(S.SPO2(2),'str','N/A','ForegroundColor','white');
        set(S.SPO2(1),'str','','ForegroundColor','w')
    end
    
    if (CompareIntputVitals.PULSE_RATE.value >...
            CompareIntputVitals.PULSE_RATE.upper_lim)                       % Comparing if PULSE_RATE is within the high low limits
        set(S.HR(1),'str','H','ForegroundColor','red');
        set(S.HR(2),'str',{temp{2}},'ForegroundColor','red');
    elseif (CompareIntputVitals.PULSE_RATE.value <...
            CompareIntputVitals.PULSE_RATE.lower_lim)   
        set(S.HR(1),'str','L','ForegroundColor','red');
        set(S.HR(2),'str',{temp{2}},'ForegroundColor','red');
    else
        set(S.HR(1),'str','','ForegroundColor','white');
        set(S.HR(2),'str',{temp{2}},'ForegroundColor','white');
    end
    
    if CompareIntputVitals.PULSE_RATE.state == 36
        set(S.HR(2),'str','N/A','ForegroundColor','white');
        set(S.HR(1),'str','','ForegroundColor','white');
        
    end
%     if (CompareIntputVitals.PERF_INDEX.value >...
%             CompareIntputVitals.PERF_INDEX.upper_lim)                          % Comparing if PERF_INDEX is within the high low limits
%         set(S.PI(1),'str','H','ForegroundColor','red');
%         set(S.PI(2),'str',{temp{3}},'ForegroundColor','red');
%     elseif (CompareIntputVitals.PERF_INDEX.value <...
%             CompareIntputVitals.PERF_INDEX.lower_lim) 
%         set(S.PI(1),'str','L','ForegroundColor','red');
%         set(S.PI(2),'str',{temp{3}},'ForegroundColor','red');
%     else
%         set(S.PI(1),'str','','ForegroundColor','white');
%         set(S.PI(2),'str',{temp{3}},'ForegroundColor','white');
%     end
%     
%     
%     if CompareIntputVitals.PERF_INDEX.state == 36
%         set(S.PI(2),'str','N/A','ForegroundColor','white');
%         set(S.PI(1),'str','','ForegroundColor','white');
%     end
    
    if (CompareIntputVitals.RespRate.value >...
            CompareIntputVitals.RespRate.upper_lim)                          % Comparing if PERF_INDEX is within the high low limits
        set(S.RR(1),'str','H','ForegroundColor','red');
        set(S.RR(2),'str',{temp{4}},'ForegroundColor','red');
    elseif (CompareIntputVitals.RespRate.value <...
            CompareIntputVitals.RespRate.lower_lim)   
        set(S.RR(1),'str','L','ForegroundColor','red');
        set(S.RR(2),'str',{temp{4}},'ForegroundColor','red');
    else
        set(S.RR(1),'str','','ForegroundColor','white');
        set(S.RR(2),'str',{temp{4}},'ForegroundColor','white');
    end
    
    if (CompareIntputVitals.ExpCO2.value >...
            CompareIntputVitals.ExpCO2.upper_lim)                         % Comparing if PERF_INDEX is within the high low limits
        set(S.EXP(1),'str','H','ForegroundColor','red');
        set(S.EXP(2),'str',{temp{5}},'ForegroundColor','red');
    elseif (CompareIntputVitals.ExpCO2.value <...
            CompareIntputVitals.ExpCO2.lower_lim)   
        set(S.EXP(1),'str','L','ForegroundColor','red');
        set(S.EXP(2),'str',{temp{5}},'ForegroundColor','red');
    else
        set(S.EXP(1),'str','','ForegroundColor','white');
        set(S.EXP(2),'str',{temp{5}},'ForegroundColor','white');
    end    
end
%% Clock Updata
clk = clock;
if clk(4)>= 12;
    clk = strcat(num2str(clk(4)),':',num2str(clk(5)),':',num2str(round(clk(6))),' PM');
else clk = strcat(num2str(clk(4)),':',num2str(clk(5)),':',num2str(round(clk(6))),' AM');
end
set(S.clock,'str',clk);

%% InfusionPump Status
pumpstatus = evalin('base','pumpstop');                                    %Reading in the infusion Pump status, setting the handle and displaying on the GUI

if  pumpstatus == true
    set(S.Devices(4),'str','STOPPED','ForegroundColor','red');
else
    set(S.Devices(4),'str','RUNNING...','ForegroundColor','white');
end

%% Figure Time

PltTemp = evalin('base','PltTemp');

for m = 1:(length(PltTemp)-1);
    PltTemp(1,m) = PltTemp(1,m+1);
    PltTemp(2,m) = PltTemp(2,m+1);
end

PltTemp(1,length(PltTemp)) = evalin('base','CompareIntputVitals.SPO2.value');
PltTemp(2,length(PltTemp)) = evalin('base','CompareIntputVitals.PULSE_RATE.value');
figure(S.fh);
axes('position', [0,.11,.839,.3])
plot(PltTemp(1,:),'g')
hold on;
plot(PltTemp(2,:),'b')
hold off
set(gca,'Color','black');
axis on
%cla(findall(S.fh,'type','axes'));
assignin('base','PltTemp',PltTemp);
pause(.5)