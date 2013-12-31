classdef Vital_Param
    properties
        % Initials Set to Be -1 becasuse numeric zero is a possible input
        % Vital Params are used as innitializations for userinputdata. Each
        % vital will be assigned these four parameters to change the
        % existing
        upper_lim = double(-1);
        lower_lim = double(-1);
        duration = double(-1);
        percentC = double(-1);
    end
    
    methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [false, false, false, false];
        end
    end
    
end

