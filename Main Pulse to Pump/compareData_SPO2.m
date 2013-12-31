%% compareData_SPO2
function [StopPump,ReturnNumObsVal] = compareData_SPO2(CompareIntputVitals,User_Input_Data,pausePump)
%% New Value Check

if User_Input_Data.SPO2.upper_lim > 0                                      %Check if time constriants have changed
    
    CompareIntputVitals.SPO2.upper_lim = User_Input_Data.SPO2.upper_lim;
    
end

if User_Input_Data.SPO2.lower_lim > 0                                      %Check if Low constriants have changed
    
    CompareIntputVitals.SPO2.lower_lim = User_Input_Data.SPO2.lower_lim;
    
end

if User_Input_Data.SPO2.duration > 0                                       %Check if Low constriants have changed
    
    CompareIntputVitals.SPO2.duration = User_Input_Data.SPO2.duration;
    
end
%% Value, time, trigger chec

clk = clock();

if   ((CompareIntputVitals.SPO2.value <=...
        CompareIntputVitals.SPO2.lower_lim)||(CompareIntputVitals.SPO2.value >=...
        CompareIntputVitals.SPO2.upper_lim))   
    
    if CompareIntputVitals.SPO2.timeTrig == 0
        
        CompareIntputVitals.SPO2.startTime = clk(6)+clk(5)*60;             %Get time and sav=e
        
        CompareIntputVitals.SPO2.timeTrig = 1;                             %Save trigger so that next time active it uses the old time
        
        pausePump(1,1) = 0;
        
    end
    
    if ((clk(6)+clk(5)*60)-CompareIntputVitals.SPO2.startTime) >...
            CompareIntputVitals.SPO2.duration
        
        pausePump(1,1) = 1;
        
    end
    
else CompareIntputVitals.SPO2.timeTrig  = 0; pausePump(1,1) = 0;
    
end

%% Percent change
%Used the last five samples and check to see if there is a five percent
%or greater change in data

ReturnNumObsVal = CompareIntputVitals;
StopPump = pausePump;
end