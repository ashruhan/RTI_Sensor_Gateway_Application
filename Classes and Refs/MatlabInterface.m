classdef MatlabInterface
    properties
        %MatlabInterface is an output data structure from MATlab to the
        %Infusion Pump. Remember Key field is Keyed and QOS of the Infusion
        %pump may varry on enviornment
        value = uint8(zeros(1,32));
        key = uint8(zeros(1,32));
    end
    
    methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [false, true];
        end
    end
end

