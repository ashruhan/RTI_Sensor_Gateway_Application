clear; clc;          % Clear workspace and command window
%% INITIALIZATIONS
% Following vars are used to check if any vital triggered a pause command
zer = zeros(1,5);                                                          % vector of zeros for use in comparison with pausePump
pausePump = zeros(1,5);                                                    % initialize pausePump vector
pumpstop = false;                                                              % current state of the KDS Pump

% Class to log patient vitals from Pulse Ox. Passed into COMPARE functions
CompareIntputVitals = CompareIntputVitals();                               % create instance of class.
CompareIntputVitals.SPO2.upper_lim = 100;                                  % arbitrary initialized limits (nonzero)
CompareIntputVitals.SPO2.lower_lim = 90;
CompareIntputVitals.PULSE_RATE.upper_lim = 100;
CompareIntputVitals.PULSE_RATE.lower_lim = 60;
% InputVitals.PERF_INDEX.upper_lim = 20;
% InputVitals.PERF_INDEX.lower_lim = 0;
CompareIntputVitals.RespRate.upper_lim = 20;
CompareIntputVitals.RespRate.lower_lim = 0;
CompareIntputVitals.ExpCO2.upper_lim = 50;
CompareIntputVitals.ExpCO2.lower_lim = 0;
% save initial InputVitals to workspace

PltTemp(1,:)= ones(1,60)*75;
PltTemp(2,:)= ones(1,60)*75;

%%
MainDisp                            %Main GUI

%% create the DDS objects
%Reader for communication with Pulse Ox
dp = DDS.DomainParticipant(...
    'dim_nu_obs_value_Library::dim_nu_obs_value_Profile', 0);
dp15 = DDS.DomainParticipant(...
    'dim_nu_obs_value_Library::dim_nu_obs_value_Profile', 15);
%dim15_MDPnP_Profile
dp.addReader('DIMT_NumericObsVal', 'DIMT_NumericObsValTopic');             %Reading in for Pulse ox
dp.Subscribers(1).Readers(1).ReadTake = ReadMethodType.TAKE;

dp15.addReader('Numeric', 'ice::Numeric');                                   % Reading in for Capno
dp15.Subscribers(1).Readers(1).ReadTake = ReadMethodType.TAKE;

dp.addReader('User_Input_Data','User_Input_Data_topic');                         %made for reading data into pulseoxmain
dp.Subscribers(1).Readers(2).ReadTake = ReadMethodType.TAKE;

dp.addWriter('MatlabInterface', 'MATLAB_DD_COMMAND_TOPIC'); 
assignin('base','dp',dp); assignin('base','MatlabInterface',MatlabInterface);                                            %writer from select param to pulseox main
%% create and start timers
% Timer to read values from Pulse Ox Publisher
ValRead=timer('Period',1., 'ExecutionMode', 'fixedDelay', 'BusyMode', 'queue');
% place code that executes each time timer expires in a seperate callback
% function.
ValRead.TimerFcn = {@timerCallback, dp , dp15};

start(ValRead)  

