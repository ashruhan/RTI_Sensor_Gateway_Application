classdef AbsoluteTime
   properties
       % This data structure is a part of the 11073 and will stay in all
       % code. The masimo rad 7 outputs a time stamp, the driver will parse
       % that data and format into this structure below
       century = uint8(0);
       year = uint8(0);
       month = uint8(0);
       day = uint8(0);
       hour = uint8(0);
       minute = uint8(0);
       second = uint8(0);
       sec_fractions = uint8(0);

      
   end
   
   methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [false,false,false,false,false,false,false,false];
        end
    end
   
end
