%% compareData_ExpCO2
function [StopPump,ReturnNumObsVal] = compareData_ExpCO2(CompareIntputVitals,User_Input_Data,pausePump)
%% New Value Check

if User_Input_Data.ExpCO2.upper_lim > 0                                %Check if time constriants have changed
    
    CompareIntputVitals.ExpCO2.upper_lim = User_Input_Data.ExpCO2.upper_lim;
    
end

if User_Input_Data.ExpCO2.lower_lim > 0                                %Check if Low constriants have changed
    
    CompareIntputVitals.ExpCO2.lower_lim = User_Input_Data.ExpCO2.lower_lim;
    
end
if User_Input_Data.ExpCO2.duration > 0                                 %Check if Low constriants have changed
    
    CompareIntputVitals.ExpCO2.duration = User_Input_Data.ExpCO2.duration;
    
end
%% Value, time, trigger check

clk = clock();

if ((CompareIntputVitals.ExpCO2.value <= ...
        CompareIntputVitals.ExpCO2.lower_lim)||(CompareIntputVitals.ExpCO2.value >= ...
        CompareIntputVitals.ExpCO2.upper_lim))
    
    if CompareIntputVitals.ExpCO2.timeTrig == 0
        
        CompareIntputVitals.ExpCO2.startTime = clk(6)+clk(5)*60;       %Get time and sav=e
        
        CompareIntputVitals.ExpCO2.timeTrig = 1;                       %Save trigger so that next time active it uses the old time
        
        pausePump(1,5) = 0;
    end
    if ((clk(6)+clk(5)*60)-CompareIntputVitals.ExpCO2.startTime) >...
            CompareIntputVitals.ExpCO2.duration
        
        pausePump(1,5) = 1;
    end
    
else CompareIntputVitals.ExpCO2.timeTrig  = 0; pausePump(1,5) = 0;
    
end
%% Percent change
%Used the last five samples and check to see if there is a five percent
%or greater change in data

ReturnNumObsVal = CompareIntputVitals;
StopPump = pausePump;
end