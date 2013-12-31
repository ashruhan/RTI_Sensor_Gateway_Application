function timerCallback(~, ~, dp, dp15)

% bring in data from global workspace.  Should pass in via arg list.
pausePump = evalin('base','pausePump');
pumpstop = evalin('base','pumpstop');
User_Input_Data = evalin('base','User_Input_Data');
CompareIntputVitals = evalin('base','CompareIntputVitals');
zer = zeros(1,5);

% check for any available data from the data readers
[DIMT, ~]=dp.Subscribers(1).Readers(1).read();
[Capno, ~]=dp15.Subscribers(1).Readers(1).read();
[FastUserData, ~]=dp.Subscribers(1).Readers(2).read();
%% MAIN LOOP

    %% Checking User Input Data.....
    if isempty(FastUserData) == 0
        User_Input = FastUserData;                                          % Capturing User data while its on the bus
    else
        User_Input = User_Input_Data;                                       %if no data set to zero
    end
    %% Obtain values fast
    if (~isempty(DIMT))
        
        % Capturing User data while its on the bus
        for m = 1:length(DIMT)
            
            switch DIMT(1,m).value.metric_id;
                case 19384
                    CompareIntputVitals.SPO2.value = DIMT(1,m).value.value;
                    CompareIntputVitals.SPO2.dimhandle = DIMT(1,m).value. dimhandle;
                    CompareIntputVitals.SPO2.metric_id = DIMT(1,m).value.metric_id;
                    CompareIntputVitals.SPO2.state = DIMT(1,m).value.state;
                    CompareIntputVitals.SPO2.unit_code = DIMT(1,m).value.unit_code;
                case 18458
                    CompareIntputVitals.PULSE_RATE.value = DIMT(1,m).value.value;
                    CompareIntputVitals.PULSE_RATE.dimhandle = DIMT(1,m).value.dimhandle;
                    CompareIntputVitals.PULSE_RATE.metric_id = DIMT(1,m).value.metric_id;
                    CompareIntputVitals.PULSE_RATE.state = DIMT(1,m).value.state;
                    CompareIntputVitals.PULSE_RATE.unit_code = DIMT(1,m).value.unit_code;
%                 case 19376
%                     CompareIntputVitals.PERF_INDEX.value = DIMT(1,m).value.value;
%                     CompareIntputVitals.PERF_INDEX.dimhandle = DIMT(1,m).value.dimhandle;
%                     CompareIntputVitals.PERF_INDEX.metric_id = DIMT(1,m).value.metric_id;
%                     CompareIntputVitals.PERF_INDEX.state = DIMT(1,m).value.state;
%                     CompareIntputVitals.PERF_INDEX.unit_code = DIMT(1,m).value.unit_code;
            end
        end
        %% SPO2 Check
        %compare limits and values the return values indecating if the pump
        %needs to be paused
        if  CompareIntputVitals.SPO2.state ~= 36
            
            [StopPump,ReturnNumObsVal] = compareData_SPO2(CompareIntputVitals, User_Input(1),pausePump);
            
            pausePump = StopPump;
            
            CompareIntputVitals = ReturnNumObsVal;
            
        end
        %% bpm
        if  CompareIntputVitals.PULSE_RATE.state ~= 36
            
            [StopPump,ReturnNumObsVal] = compareData_PULSE_RATE(CompareIntputVitals,User_Input(1),pausePump);
            
            pausePump = StopPump;
            
            CompareIntputVitals = ReturnNumObsVal;
            
        end
        %% PI
        %compare limits and values the return values indecating if the pump
        %needs to be paused
%         if  CompareIntputVitals.PERF_INDEX.state ~= 36
%             
%             [StopPump,ReturnNumObsVal] = compareData_PERF_INDEX(CompareIntputVitals,User_Input(1),pausePump);
%             
%             pausePump = StopPump;
%             
%             CompareIntputVitals = ReturnNumObsVal;
%             
%         end
    end
    if (~isempty(Capno))
        
        for m = 1:length(Capno)
            
            switch Capno(1,m).name
                case 20490
                    CompareIntputVitals.RespRate.value = Capno(1,m).value;
                case 20660
                    CompareIntputVitals.ExpCO2.value = Capno(1,m).value;
            end
            
        end
        
        
        [StopPump,ReturnNumObsVal] = compareData_RespRate(CompareIntputVitals,User_Input(1),pausePump);
        
        pausePump = StopPump;
        
        CompareIntputVitals = ReturnNumObsVal;
        
        [StopPump,ReturnNumObsVal] = compareData_ExpCO2(CompareIntputVitals,User_Input(1),pausePump);
        
        pausePump = StopPump;
        
        CompareIntputVitals = ReturnNumObsVal;
        
    end
    %% STOP START PUMP
    % Comparing returned values from the vital compare functions
%     assignin('base','pausePump',pausePump);
%     assignin('base','InputVitals',InputVitals);
    
    if (isequal(zer,pausePump) == 0) && (pumpstop == false)
        
        Char_Pump_CommandStop();
        
        pumpstop = true;
        
    end
    
    if (isequal(zer,pausePump) == 1) && (pumpstop == true)
        
        Char_Pump_CommandRun();
        
        pumpstop = false;
        
    end
    
    % write all computed values back to workspace.  Can we return these
    % from function instead?
    assignin('base','pumpstop',pumpstop);                                   
    assignin('base','pausePump',pausePump);                                  
    assignin('base','CompareIntputVitals',CompareIntputVitals);                              
    
    PulseDisp;                                                               %Refreshing Main Gui with new values

end