classdef Numeric
    properties
       %Top level of the outoing data structure from User to ML
        %Remember that the data structure of MATlab must match exactly to
        %that of the output of the device. 
        universal_device_identifier =  char(zeros(1,256));
        name = int32(0);
        value = single(0);
    end
    methods (Static = true)
        % return a vector of booleans indicating which fields are key
        % fields.
        function keyFields = getKeyFields()
            keyFields = [true, true, false];
        end
        
        % optional function
        % return an XML string with IDL module info.  For example:
        % <module id="top"> <module id="middle"> <module id="inner"> </module> </module> </module>
        % or
        % <module id="top"/>
        % if no module specification, can return empty string or omit function. 
        function module = getIDLModule()
            module = '<module id="ice"/>';
        end
    end
end
