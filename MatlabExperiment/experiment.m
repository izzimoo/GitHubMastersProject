
%% MATLAB EEG EXPERIMENT - Auditory stimuli decision making experiment with data recording and failure recovery

% % Clear the workspace and the screen
sca;
close all;     
clear;
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference','VisualDebugLevel', 0);
KbName('UnifyKeyNames'); 
HideCursor();
InitializePsychSound; 

% Create a new directory to store the participants results in
if ~exist('./ExperimentResults/EEGExperiment_Participant7', 'dir')
    mkdir('./ExperimentResults/EEGExperiment_Participant7')
end

% Assign keys of interest on keyboard, rest of the keys will be disabled
ctrlKey = KbName('Control'); 
rightArrow = KbName('RightArrow');
spaceKey = KbName('space');
escKey = KbName('escape');

% Activate keys of interest 
activeKeys = [ctrlKey, rightArrow];

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Create the welcoming scren for the experiment
Screen(window, 'TextFont', 'Arial');
Screen(window, 'TextSize', 40);
line1 = 'Welcome to the experiment';
line2 = '\n Press the space bar to continue';
DrawFormattedText(window, [line1 line2], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);

% Listen for a spacekey or esc key press. The space key is for participants, esc key is for researchers to exit from experiment
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

% Create the cross hair on screen
% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Set blend function for alpha blending
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% et the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% Make a vertical rectangle with height:90 and width:3
horizRect = [0 0 3 90];
% Make a horizontal rectangle with width:90 and height:3
verticalRect = [0 0 90 3];

% Screen X positions of our three rectangles
squareXpos = xCenter;
squareYpos = yCenter;
squareHXpos = xCenter;
squareHYpos = yCenter;

% Set the colors of the cross rectangle
allColors = [0.5, 0.5, 0.5; 0.5, 0.5, 0.5]';

% Make our rectangle coordinates - one vertical rectangle, one horizontal rectangle = cross hair
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

% Stimuli for the participants experiment - copied from the ArrayOfStimuliInRandomOrder.txt file in the stimuli folder of the participanrs
sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav'};

% Time out for the decision not being made
timedout= false; 
number_of_trials = length(sounds);

% Failure recovery code: If the code crashes, set the trialStopNum to the value in crashTrial, if the entire program crashes then find the 
% current trial number from one of the data files such as decisionsAndTiming.

% trialStopNum = ;
  
% Normal, non failure recovery initialisation of the arrays to store participant data
timeDecisionMade=zeros(1,number_of_trials);
itr = 1;
decisionLeftKey=zeros(1,number_of_trials);
itr2 = 1;
updatesToScore=zeros(1,number_of_trials);
itr4 = 1;
currentScoreEachTime=zeros(1,number_of_trials);
itr5 = 1;

% Failure recovery code: Opens up the participant data files and sets the new data to begin saving at the point where the program crashed so 
% no data is overwritten

% table1 = readtable('./ExperimentResults/EEGExperiment_Participant7/DecisionsAndTimings.txt');
% timeDecisionMade = (table2array(table1(1:(trialStopNum-1), 2)))';
% timeDecisionMade = [timeDecisionMade, zeros(1,number_of_trials-(trialStopNum-1))];
% itr = trialStopNum;
% 
% table2 = readtable('./ExperimentResults/EEGExperiment_Participant7/DecisionsAndTimings.txt');
% decisionLeftKey = (table2array(table2(1:(trialStopNum-1), 1)))';
% decisionLeftKey = [decisionLeftKey, zeros(1,number_of_trials-(trialStopNum-1))];
% itr2 = trialStopNum;
% 
% table3 = readtable('./ExperimentResults/EEGExperiment_Participant7/ScoreUpdateAndCurrentScore.txt');
% updatesToScore = (table2array(table3(1:(trialStopNum-1), 1)))';
% updatesToScore = [updatesToScore, zeros(1,number_of_trials-(trialStopNum-1))];
% itr4 = trialStopNum;
% 
% table4 = readtable('./ExperimentResults/EEGExperiment_Participant7/ScoreUpdateAndCurrentScore.txt');
% currentScoreEachTime = (table2array(table4(1:(trialStopNum-1), 2)))';
% currentScoreEachTime = [currentScoreEachTime, zeros(1,number_of_trials-(trialStopNum-1))];
% itr5 = trialStopNum;

% Failure recovery code: Change participant score to contain the score of the participant when the code crashed
% Participant score intialised to zero
participantScore = 0;      
   
% Failure recording code: Use this for loop instead of the default so that the program continues from the trial that it crashed on.
% for trial_counter = trialStopNum:number_of_trials
for trial_counter = 1:number_of_trials
   
    % keep track of current trial
    crashTrial = trial_counter;
    
    % Wait for participant to release the spacebar from the welcome screen
    KbReleaseWait;
    % Display the pre-trial screen and wait for spacebar press, researcher can press escape key here to exit experiment
    line1 = ['This is trial ', num2str(trial_counter), ' of ', num2str(number_of_trials), ' trials']; 
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
    % While the participant has not succeeded the time to make a decision i.e. the stimuli is still playings
    while ~timedout

        % Return the two target words for the trial
        [meaning1, meaning2] = returnMeanings(trial_counter);    

        Screen('FillRect', window, allColors, allRects);
        
        % Align the words to either side of the cross hair, needs to manually adjusted for different screen sizes
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
    
        % Align the words to either side of the cross hair, needs to manually adjusted for different screen sizes
        DrawFormattedText(window, meaning1, (1280+(length(meaning1))-crossAwayL), 720 , [0.6 0.6 0.6],[],[],[],2); %monitor (1440, 810) %booth 3 monitor (1280 720)
        DrawFormattedText(window, meaning2, (1280-(length(meaning2))+crossAwayR), 720 , [0.6 0.6 0.6],[],[],[],2); %laptop (960, 540)
        Screen('Flip', window, [], 1);

        % Read in the first audio in the stimuli
        [soundCorrect, freq] = audioread(sounds{trial_counter});
        
        % Load and store the WAV file so that it plays instantly when requested
        wave = soundCorrect';
        nrchannels = size(wave,1);

        audioBuff = PsychPortAudio('Open', [], [], 0, freq, nrchannels); 
        PsychPortAudio('FillBuffer', audioBuff, wave);

        keyIsDown = 0; 

%         Set trigger to 1 for audio onset
%         io64(ioObj, port,1)

        % Play the sound to the participant
        PsychPortAudio('Start', audioBuff); %start audio
        tic

%         WaitSecs(0.05)
%         io64(ioObj, port,0)

        while(~keyIsDown)
            
            % Disable all keys on keyboard apart from the keys of interest 
            RestrictKeysForKbCheck(activeKeys);
            [keyIsDown,when,keyCode] = KbCheck(); % checking if the participant has made a decision yet by pressing either the control or right arrow key
            WaitSecs(0.05); 
            
            % Time out code where participant has listened to the entire stimulus but has not made a decision
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
        
        % Stop the clock to record the decision time
        decisionTime = toc;

%         Set trigger to 3 for time of response 
%         io64(ioObj, port,3)
%         WaitSecs(0.05); 
%         io64(ioObj, port,0)

        % Iteratively save the decision time to ensure no data is lost in case of a failure 
        timeDecisionMade(itr) = decisionTime;
        keyPressTime  = timeDecisionMade';

        itr=itr+1;

        Screen('Flip', window, []);
        
        % Iteratively save the key press for each trial to ensure no data is lost in case of a failure
        if keyCode(ctrlKey) == 1
           keyPressed = 1;
           decisionLeftKey(itr2) = 1;
        end
        if keyCode(rightArrow) == 1
           keyPressed = 2;
        end

        isLeftKeyPress  = decisionLeftKey';

        T = table(isLeftKeyPress, keyPressTime);
        writetable(T, './ExperimentResults/EEGExperiment_Participant7/DecisionsAndTimings.txt');

        itr2 = itr2 + 1;

        PsychPortAudio('Close', audioBuff);
        PsychPortAudio('Close');
        
        % Unrestrict keyboard keys 
        RestrictKeysForKbCheck([]);

        % Get the participant change in score and new score
        [scoreChange , newScore] = getScore(trial_counter, decisionTime, keyPressed, participantScore);

        updatesToScore(itr4) = scoreChange;
        itr4 = itr4 + 1;
        currentScoreEachTime(itr5) = newScore;
        itr5 = itr5 + 1;

        participantScore = newScore;

        % End of trial screen and wait for participant to press the space bar
        line3 = ['End of trial number ', num2str(trial_counter), ' of ', num2str(number_of_trials), ' trials'];
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
        
        % If the trial number is a factor 50 then display the screen indicating to participants that their score is reset and that they should
        % try to beat it in the next 50 trials
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
        % Display the current score every five trials
        else
              if ((mod(trial_counter, 5)) == 0)
                  line7 = ['Your current score: ', num2str(participantScore)]; 
                  line8 = '\n Press the space bar to continue';
                  DrawFormattedText(window, [line7 line8], 'center', 'center', [0.6 0.6 0.6],[],[],[],2);
                  Screen('Flip', window);
        % Display the change in score after every trial
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
        
        % Iteratively save the socre changes for each trial to ensure no data is lost in case of a failure
        scoreUpdatePerTrial = updatesToScore';
        scoreAtEveryTrial  = currentScoreEachTime';

        T2 = table(scoreUpdatePerTrial, scoreAtEveryTrial);
        writetable(T2, './ExperimentResults/EEGExperiment_Participant7/ScoreUpdateAndCurrentScore.txt'); 

        crashTrial = trial_counter;
        timedout = true; % Start the next trial
    end  

end

% Show participant final screen thanking them for taking part in the experiment. All keys are disabled on the keyboard
% Researcher presses escape key at this point to exit and end the experiment
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
  
% Clear and close the experiment screen
Screen('Close')
sca;
