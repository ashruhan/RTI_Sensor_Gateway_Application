%% compareData_PULSE_RATE
function [StopPump,ReturnNumObsVal] = compareData_PULSE_RATE(CompareIntputVitals,User_Input_Data,pausePump)
%% New Value Check

if User_Input_Data.PULSE_RATE.upper_lim > 0                                %Check if time constriants have changed
    
    CompareIntputVitals.PULSE_RATE.upper_lim = User_Input_Data.PULSE_RATE.upper_lim;
    
end

if User_Input_Data.PULSE_RATE.lower_lim > 0                                %Check if Low constriants have changed
    
    CompareIntputVitals.PULSE_RATE.lower_lim = User_Input_Data.PULSE_RATE.lower_lim;
    
end
if User_Input_Data.PULSE_RATE.duration > 0                                 %Check if Low constriants have changed
    
    CompareIntputVitals.PULSE_RATE.duration = User_Input_Data.PULSE_RATE.duration;
    
end
%% Value, time, trigger check

clk = clock();

if ((CompareIntputVitals.PULSE_RATE.value <= ...
        CompareIntputVitals.PULSE_RATE.lower_lim)||(CompareIntputVitals.PULSE_RATE.value >= ...
        CompareIntputVitals.PULSE_RATE.upper_lim))
    
    if CompareIntputVitals.PULSE_RATE.timeTrig == 0
        
        CompareIntputVitals.PULSE_RATE.startTime = clk(6)+clk(5)*60;       %Get time and sav=e
        
        CompareIntputVitals.PULSE_RATE.timeTrig = 1;                       %Save trigger so that next time active it uses the old time
        
        pausePump(1,2) = 0;
    end
    if ((clk(6)+clk(5)*60)-CompareIntputVitals.PULSE_RATE.startTime) >...
            CompareIntputVitals.PULSE_RATE.duration
        
        pausePump(1,2) = 1;
    end
    
else CompareIntputVitals.PULSE_RATE.timeTrig  = 0; pausePump(1,2) = 0;
    
end

%% Percent change
%Used the last five samples and check to see if there is a five percent
%or greater change in data

ReturnNumObsVal = CompareIntputVitals;
StopPump = pausePump;
end