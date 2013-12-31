% %% compareData_PERF_INDEX
% function [StopPump,ReturnNumObsVal] = compareData_PERF_INDEX(CompareIntputVitals,User_Input_Data,pausePump)
% %% New Value Check
% if User_Input_Data.PERF_INDEX.upper_lim > 0                                %Check if time constriants have changed
%     
%     CompareIntputVitals.PERF_INDEX.upper_lim = User_Input_Data.PERF_INDEX.upper_lim;
%     
% end
% 
% if User_Input_Data.PERF_INDEX.lower_lim > 0                                %Check if Low constriants have changed
%     
%     CompareIntputVitals.PERF_INDEX.lower_lim = User_Input_Data.PERF_INDEX.lower_lim;
%     
% end
% if User_Input_Data.PERF_INDEX.duration > 0                                 %Check if Low constriants have changed
%     
%     CompareIntputVitals.PERF_INDEX.duration = User_Input_Data.PERF_INDEX.duration;
%     
% end
% %% Value, time, trigger check
% vals = get(S.BG_Text,'Value');
% 
% clk = clock();
% 
% if ((CompareIntputVitals.PERF_INDEX.value <=...
%         CompareIntputVitals.PERF_INDEX.lower_lim)||(CompareIntputVitals.PERF_INDEX.value >=...
%         CompareIntputVitals.PERF_INDEX.upper_lim))
%     
%     if CompareIntputVitals.PERF_INDEX.timeTrig == 0
%         
%         CompareIntputVitals.PERF_INDEX.startTime = clk(6)+clk(5)*60;       %Get time and sav=e
%         
%         CompareIntputVitals.PERF_INDEX.timeTrig = 1;                       %Save trigger so that next time active it uses the old time
%         
%         pausePump(1,3) = 0;
%         
%     end
%     
%     if ((clk(6)+clk(5)*60)-CompareIntputVitals.PERF_INDEX.startTime) >...
%             CompareIntputVitals.PERF_INDEX.duration
%         
%         pausePump(1,3) = 1;
%         
%     end
%     
% else CompareIntputVitals.PERF_INDEX.timeTrig  = 0; pausePump(1,3) = 0;
%      
% end
% %% Percent change
% %Used the last five samples and check to see if there is a five percent
% %or greater change in data
% 
% ReturnNumObsVal = CompareIntputVitals;
% StopPump = pausePump;
% end