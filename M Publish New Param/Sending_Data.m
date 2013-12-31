function Sending_Data
%% Simple loading screen GUI for when User_Input_Data is being published

S.fh = figure('units','pixels',...
              'position',[500 100 630 410],...
              'menubar','none','Color','black',...
              'name','Sending_Data',...
              'numbertitle','off',...
              'resize','off');

S.title = uicontrol('style','text',...
                 'unit','pix',...
                 'position',[120 230 405 50],...
                 'fontsize',22,...
                 'string','Sending New Parameters.........',...
                 'Backgroundcolor','black','foregroundcolor','w');