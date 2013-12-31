classdef User_Input_Data
    properties
        % this class will change as more sensors are attached to this
        % matlab program. User Input Data was created to prove that a
        % running matlab program can use dynamic data using DDS. Most
        % likely will not be used in test enviornment.
        SPO2 = Vital_Param;
        PULSE_RATE = Vital_Param;
        PERF_INDEX = Vital_Param;
        RespRate = Vital_Param
        ExpCO2 = Vital_Param 

    end
    
    methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [false, false, false,false,false];
        end
    end
    
end

