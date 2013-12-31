%Pulse and spos param are GUIs to read in new data from the user to execute
%this code and send new limits to the main program Run the select_Param
%function in the top level file tree. Pulse and spo2 param functions use
%DDS to send data to the Main Program using a topic type and same
%datastructure. 
%!!!!!!!!!!!
%What is important to notice is that this is not running in the same
%workspace, and is not using the same local variables. TO prove DDS run
%program in a seperate workspace.
%!!!!!!!!!!!