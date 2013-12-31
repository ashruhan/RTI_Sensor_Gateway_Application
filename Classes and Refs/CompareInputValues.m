classdef CompareInputValues
    properties
        %User defined data structer to be passed back and forth between
        %functions comparing the true data to initial limits. Limits in
        %structure store temp values if in a case limits due change from a
        %user. If this code goes beyond proof of conceptt this data
        %structure will be trimmed.
        dimhandle = uint16(0);
        metric_id = uint16(0);
        state = uint16(0);
        unit_code = uint16(0);
        value = double(0);
        upper_lim = double(0);
        lower_lim = double(0);
        duration = double(10);
        percentC = double(5);
        timeTrig = double(0);
        startTime = double(0);
        udi = int8(zeros(1,16));
        
    end
    
end