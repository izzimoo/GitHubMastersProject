% % Experiment that displays a white fixation cross on screen

% % Clear the workspace and the screen
sca;
close all;     
clear;
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference','VisualDebugLevel', 0);
KbName('UnifyKeyNames'); 
% HideCursor();
InitializePsychSound; 

mkdir ExperimentResults 
mkdir ExperimentResults Experiment1

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
    
% % port = hex2dec('2010');
% % lptwrite(port,0);

sounds = {'./CompletedRecordings/CarBus/CB_M1_1.wav', './CompletedRecordings/ApartmentHouse/AH_M1_1.wav'};

timedout= false;
number_of_trials = 2;


timeDecisionMade=zeros(1,number_of_trials);
itr = 1;
decisionLeftKey=zeros(1,number_of_trials);
itr2 = 1;
decisionRightKey=zeros(1,number_of_trials);
itr3 = 1;

participantScore = 0;

for trial_counter = 1:number_of_trials
    
    % set key to 0
    
    KbReleaseWait;
    line1 = ['This is trial ', num2str(trial_counter), ' of 5 trials']; 
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
            crossAwayL = 270;
        else
            crossAwayL  = 150; 
        end
        
        if (length(meaning2) > 5) 
            crossAwayR = 180;
        else 
            crossAwayR = 100;
        end
     
        DrawFormattedText(window, meaning1, (1440+(length(meaning1))-crossAwayL), 810 , [0.6 0.6 0.6],[],[],[],2);
        DrawFormattedText(window, meaning2, (1440-(length(meaning2))+crossAwayR), 810 , [0.6 0.6 0.6],[],[],[],2);
        Screen('Flip', window, [], 1);

        [soundCorrect, freq] = audioread(sounds{trial_counter});

        wave = soundCorrect';
        nrchannels = size(wave,1);
        
        audioBuff = PsychPortAudio('Open', [], [], 0, freq, nrchannels); 
        PsychPortAudio('FillBuffer', audioBuff, wave);

        keyIsDown = 0; 
        
        PsychPortAudio('Start', audioBuff); %start audio
         
        tic
        while(~keyIsDown)
            
            RestrictKeysForKbCheck(activeKeys);
            [keyIsDown,when,keyCode] = KbCheck(); %checking if key is pressed
            WaitSecs(0.05); 

            decisionText = 'Please choose a meaning';
            if (toc >= 15)
                DrawFormattedText(window, decisionText, 'center', 1000, [0.6 0.6 0.6],[],[],[],2);
                Screen('Flip', window, []);
                while(~keyIsDown)
                    RestrictKeysForKbCheck(activeKeys);
                    [keyIsDown,when,keyCode] = KbCheck(); %checking if key is pressed
                    WaitSecs(0.05);
                end
             
            end 
            
        end 
        
        Screen('Flip', window, []);
        
        decisionTime = toc;
        timeDecisionMade(itr) = decisionTime; 
        itr=itr+1;
   
        if keyCode(ctrlKey) == 1
           keyPressed = 1;
           decisionLeftKey(itr2) = 1;
        end
        if keyCode(rightArrow) == 1
           keyPressed = 2;
           decisionRightKey(itr2) = 1;
        end
        
        itr2 = itr2 + 1;
        
        PsychPortAudio('Close', audioBuff);
        PsychPortAudio('Close');

        RestrictKeysForKbCheck([]);
        
        % Get score 
         
        % call getScore and pass in trialNo, toc, key, participantScore
        % get back scorechange and newscore and print it up top before
        % resetting variables
        
        [scoreChange , newScore, approxWord] = getScore(trial_counter, decisionTime, keyPressed, participantScore);
        participantScore = newScore;
%         disp(scoreChange) % pass this into the next window: score changed by:
%         disp(participantScore) % pass this into the next window: current score:
%         disp(approxWord);
%         disp(round(approxWord));
        
        line = ['End of trial number ', num2str(trial_counter), ' of 5 trials'];
        DrawFormattedText(window, line, 'center', 810-200, [0.6 0.6 0.6],[],[],[],2);
        DrawFormattedText(window, sprintf('Change in score: %d Current score: %d\n', scoreChange, participantScore), 'center'  , 810); %value gotten from windowRect on line 35 
        next = '\n Press the space bar to continue';
        DrawFormattedText(window, next, 'center', 810+120, [0.6 0.6 0.6],[],[],[],2);
        Screen('Flip', window); 
        while 1
            [~, secs, keyCode] = KbCheck; 
            if keyCode(spaceKey) == 1
                break;
            end
        end 
        
        timedout = true; %start the next trial
    end  

end
 
isLeftKeyPress = decisionLeftKey';
keyPressTime  = timeDecisionMade';

T = table(isLeftKeyPress, keyPressTime);
writetable(T, './ExperimentResults/Experiment1/DecisionsAndTimings.txt'); 
 
Screen('Close')

% %  Clear the screen
sca;
