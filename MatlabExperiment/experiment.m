% % Experiment that displays a white fixation cross on screen

% % Clear the workspace and the screen
sca;
close all;     
clear;
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference','VisualDebugLevel', 0);
KbName('UnifyKeyNames'); 
HideCursor();
InitializePsychSound; 

if ~exist('./ExperimentResults/EEGExperiment_Participant1', 'dir')
    mkdir('./ExperimentResults/EEGExperiment_Participant1')
end


ctrlKey = KbName('Control'); 
rightArrow = KbName('RightArrow');
spaceKey = KbName('space');
escKey = KbName('escape');

activeKeys = [ctrlKey, rightArrow];
% ListenChar(2);

% % Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% % Get the screen numbers
screens = Screen('Screens');

% % Draw to the external screen if avaliable
screenNumber = max(screens);

% % Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% % Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

Screen(window, 'TextFont', 'Arial');
Screen(window, 'TextSize', 40);
line1 = 'Welcome to the experiment';
line2 = '\n Press the space bar to continue';
DrawFormattedText(window, [line1 line2], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
Screen('Flip',window);
while 1
    [keyIsDown, secs, keyCode] = KbCheck; 
    if keyCode(spaceKey) == 1
        break;
    end
    if keyCode(escKey) == 1
        Screen('CloseAll')
        break;
    end
end 
% WaitSecs(2)

% % Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% % Set blend function for alpha blending
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% % Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% % Make a vertical rectangle with height:90 and width:3
horizRect = [0 0 3 90];
% % Make a horizontal rectangle with width:90 and height:3
verticalRect = [0 0 90 3];

% % Screen X positions of our three rectangles
squareXpos = xCenter;
squareYpos = yCenter;
squareHXpos = xCenter;
squareHYpos = yCenter;

% % Set the colors of the cross rectangle
allColors = [0.5, 0.5, 0.5; 0.5, 0.5, 0.5]';

% % Make our rectangle coordinates
allRects = nan(4, 2);

allRects(:, 1) = CenterRectOnPointd(horizRect,...
        squareXpos, squareYpos);
       
allRects(:, 2) = CenterRectOnPointd(verticalRect,...
        squareHXpos, squareHYpos);
 
% Setup trigger for booth 3
% addpath('C:\Windows\3SysWOW64');    
% ioObj = io64();
% status = io64(ioObj);
% port = hex2dec('3FB8');
% WaitSecs(0.05);
% io64(ioObj,port,0);

sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav'};
% sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav'};

timedout= false;              
number_of_trials = 272;

timeDecisionMade=zeros(1,number_of_trials);
itr = 1;
decisionLeftKey=zeros(1,number_of_trials);
itr2 = 1;
decisionRightKey=zeros(1,number_of_trials); 
itr3 = 1;
updatesToScore=zeros(1,number_of_trials);
itr4 = 1;
currentScoreEachTime=zeros(1,number_of_trials);
itr5 = 1;


participantScore = 0;

for trial_counter = 1:number_of_trials
    
    KbReleaseWait;
    line1 = ['This is trial ', num2str(trial_counter), ' of 272 trials']; 
    line2 = '\n Press the space bar to continue';
    DrawFormattedText(window, [line1 line2], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
    Screen('Flip', window);
    while 1
        [~, secs, keyCode] = KbCheck; 
        if keyCode(spaceKey) == 1
            break;
        end
        if keyCode(escKey) == 1
            Screen('CloseAll')
            sca;
            break;
        end
    end 
   
    timedout = false;   
    while ~timedout

        [meaning1, meaning2] = returnMeanings(trial_counter);    
 
        Screen('FillRect', window, allColors, allRects);
        
        if (length(meaning1) > 5) 
            crossAwayL = 220;
        else
            crossAwayL  = 200; 
        end
        
        if (length(meaning2) > 5) 
            crossAwayR = 120;
        else 
            crossAwayR = 100;
        end
        
        if (length(meaning1) > 7) 
            crossAwayL = 270;
        end
             
        DrawFormattedText(window, meaning1, (1280+(length(meaning1))-crossAwayL), 720 , [0.6 0.6 0.6],[],[],[],2); %monitor 1440, 810 % width-1280 height-720 for booth 3
        DrawFormattedText(window, meaning2, (1280-(length(meaning2))+crossAwayR), 720 , [0.6 0.6 0.6],[],[],[],2); %laptop 960, 540
        Screen('Flip', window, [], 1);

        [soundCorrect, freq] = audioread(sounds{trial_counter});

        wave = soundCorrect';
        nrchannels = size(wave,1);
        
        audioBuff = PsychPortAudio('Open', [], [], 0, freq, nrchannels); 
        PsychPortAudio('FillBuffer', audioBuff, wave);

        keyIsDown = 0; 
        
%         Set trigger high for audio start
%         io64(ioObj, port,1)
        PsychPortAudio('Start', audioBuff); %start audio
        tic
        
%         WaitSecs(0.05)
%         io64(ioObj, port,0)
         
        while(~keyIsDown)
            
            RestrictKeysForKbCheck(activeKeys);
            [keyIsDown,when,keyCode] = KbCheck(); %checking if key is pressed
            WaitSecs(0.05); 

            decisionText = 'Please choose a meaning';
            if (toc >= 15)
                DrawFormattedText(window, decisionText, 'center', 720+120, [0.6 0.6 0.6],[],[],[],2); %1000 for monitor
                Screen('Flip', window, []);
                while(~keyIsDown)
                    RestrictKeysForKbCheck(activeKeys);
                    [keyIsDown,when,keyCode] = KbCheck(); %checking if key is pressed
                    WaitSecs(0.05);
                end
             
            end 
            
        end 
        
        decisionTime = toc;
        
%         Set trigger high for key press 
%         io64(ioObj, port,3)
%         WaitSecs(0.05); 
%         io64(ioObj, port,0)
        
        timeDecisionMade(itr) = decisionTime;
        keyPressTime  = timeDecisionMade';

        itr=itr+1;
        
        Screen('Flip', window, []);
           
        if keyCode(ctrlKey) == 1
           keyPressed = 1;
           decisionLeftKey(itr2) = 1;
        end
        if keyCode(rightArrow) == 1
           keyPressed = 2;
           decisionRightKey(itr2) = 1;
        end
        
        isLeftKeyPress  = decisionLeftKey';

        T = table(isLeftKeyPress, keyPressTime);
        writetable(T, './ExperimentResults/EEGExperiment_Participant1/DecisionsAndTimings.txt');
        
        
        itr2 = itr2 + 1;
        
        PsychPortAudio('Close', audioBuff);
        PsychPortAudio('Close');

        RestrictKeysForKbCheck([]);
        
        % Get score 
         
        % call getScore and pass in trialNo, toc, key, participantScore
        % get back scorechange and newscore and print it up top before
        % resetting variables
        
        [scoreChange , newScore, approxWord] = getScore(trial_counter, decisionTime, keyPressed, participantScore);
        
        updatesToScore(itr4) = scoreChange;
        itr4 = itr4 + 1;
        currentScoreEachTime(itr5) = newScore;
        itr5 = itr5 + 1;
        
        participantScore = newScore;
%         disp(scoreChange) % pass this into the next window: score changed by:
%         disp(participantScore) % pass this into the next window: current score:
%         disp(approxWord);
%         disp(round(approxWord)); 
        
        line3 = ['End of trial number ', num2str(trial_counter), ' of 136 trials'];
        line4 = '\n Press the space bar to continue';
        DrawFormattedText(window, [line3 line4], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
        Screen('Flip', window);
        while 1
            [~, secs, keyCode] = KbCheck; 
            if keyCode(spaceKey) == 1
                break;
            end
        end
        
        while KbCheck; end % Makes sure all keys are released before moving on
         
        if ((mod(trial_counter, 50)) == 0) 
            
            DrawFormattedText(window, sprintf('Well done! You have completed the first %d trials', trial_counter), 'center'  , 720); %810 on monitor, 540 on laptop
            DrawFormattedText(window, sprintf('Your score to beat in the next 50 trials is: %d', participantScore), 'center'  , 720+100); %810 on monitor, 540 on laptop
            DrawFormattedText(window, 'Your score is now reset to 0', 'center'  , 720+160); %810 on monitor, 540 on laptop
            next = '\n Press the space bar to continue';
            DrawFormattedText(window, next, 'center', 720+190, [0.6 0.6 0.6],[],[],[],2);
            Screen('Flip', window);  
            
            participantScore = 0; 
            
            updatesToScore(itr4) = 0;
            itr4 = itr4 + 1;
            currentScoreEachTime(itr5) = 0;
            itr5 = itr5 + 1;
            
            while 1
                [~, secs, keyCode] = KbCheck; 
                if keyCode(spaceKey) == 1
                    break;
                end
            end 

        else
              if ((mod(trial_counter, 5)) == 0)
                  line7 = ['Your current score: ', num2str(participantScore)]; 
                  line8 = '\n Press the space bar to continue';
                  DrawFormattedText(window, [line7 line8], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
                  Screen('Flip', window);
                  
              else
                  line9 = ['Change in score: ', num2str(scoreChange)]; 
                  line10 = '\n Press the space bar to continue';
                  DrawFormattedText(window, [line9 line10], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
                  Screen('Flip', window);
              end
            
            
            while 1
                [~, secs, keyCode] = KbCheck; 
                if keyCode(spaceKey) == 1
                    break;
                end
            end 
            
        end
        
        scoreUpdatePerTrial = updatesToScore';
        scoreAtEveryTrial  = currentScoreEachTime';

        T2 = table(scoreUpdatePerTrial, scoreAtEveryTrial);
        writetable(T2, './ExperimentResults/EEGExperiment_Participant1/ScoreUpdateAndCurrentScore.txt'); 

        timedout = true; %start the next trial
    end  

end
 
% isLeftKeyPress  = decisionLeftKey';
% keyPressTime  = timeDecisionMade';
% 
% T = table(isLeftKeyPress, keyPressTime);
% writetable(T, './ExperimentResults/EEGExperiment_Participant1/DecisionsAndTimings.txt'); 

DrawFormattedText(window, sprintf('Your final score: %d ', participantScore), 'center'  , 720-200); %810 on monitor, 540 on laptop
line = 'The experiment is over, thank you for participating';
DrawFormattedText(window, line, 'center', 720, [0.6 0.6 0.6],[],[],[],2);
next = 'Please inform the researcher that you have finished';
DrawFormattedText(window, next, 'center', 720+120, [0.6 0.6 0.6],[],[],[],2);
Screen('Flip', window); 
while 1
    [~, secs, keyCode] = KbCheck; 
    if keyCode(escKey) == 1
        break;
    end
end
  
Screen('Close')

% %  Clear the screen
sca;
