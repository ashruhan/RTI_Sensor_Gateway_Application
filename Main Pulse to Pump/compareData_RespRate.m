%% compareData_RespRat
function [StopPump,ReturnNumObsVal] = compareData_RespRate(CompareIntputVitals,User_Input_Data,pausePump)
%% New Value Check

if User_Input_Data.RespRate.upper_lim > 0                                %Check if time constriants have changed
    
    CompareIntputVitals.RespRate.upper_lim = User_Input_Data.RespRate.upper_lim;
    
end

if User_Input_Data.RespRate.lower_lim > 0                                %Check if Low constriants have changed
    
    CompareIntputVitals.RespRate.lower_lim = User_Input_Data.RespRate.lower_lim;
    
end
if User_Input_Data.RespRate.duration > 0                                 %Check if Low constriants have changed
    
    CompareIntputVitals.RespRate.duration = User_Input_Data.RespRate.duration;
    
end
%% Value, time, trigger check

clk = clock();

if ((CompareIntputVitals.RespRate.value <=...
        CompareIntputVitals.RespRate.lower_lim)|| (CompareIntputVitals.RespRate.value >=...
        CompareIntputVitals.RespRate.upper_lim))
    
    if CompareIntputVitals.RespRate.timeTrig == 0
        
        CompareIntputVitals.RespRate.startTime = clk(6)+clk(5)*60;       %Get time and sav=e
        
        CompareIntputVitals.RespRate.timeTrig = 1;                       %Save trigger so that next time active it uses the old time
        
        pausePump(1,4) = 0;
        
    end
    
    if ((clk(6)+clk(5)*60)-CompareIntputVitals.RespRate.startTime) >...
            CompareIntputVitals.RespRate.duration
        
        pausePump(1,4) = 1;
        
    end
    
else CompareIntputVitals.RespRate.timeTrig  = 0; pausePump(1,4) = 0;
        
end

%% Percent change
%Used the last five samples and check to see if there is a five percent
%or greater change in data

ReturnNumObsVal = CompareIntputVitals;
StopPump = pausePump;
end