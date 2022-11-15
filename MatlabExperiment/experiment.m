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

leftArrow = KbName('LeftArrow');
rightArrow = KbName('RightArrow');
spaceKey = KbName('space');
escKey = KbName('escape');

activeKeys = [leftArrow, rightArrow];
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

sounds = ["./CompletedRecordings/CarBus_Recording.wav", "./CompletedRecordings/ApartmentHouse_Recording.wav", "./CompletedRecordings/LakeSea_Recording.wav"];

timeDecisionMade=zeros(1,3);
itr = 1;
decisionLeftKey=zeros(1,3);
itr2 = 1;
decisionRightKey=zeros(1,3);
itr3 = 1;

timedout= false;
number_of_trials = 3;
for trial_counter = 1:number_of_trials
    
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
%         if keyCode(escKey) == 1
%             Screen('Close')
%             sca;
%             break;
%         end
    end 
   
    timedout = false;   
    while ~timedout

        [meaning1, meaning2] = returnMeanings(trial_counter);    

        Screen('FillRect', window, allColors, allRects);
        DrawFormattedText(window, meaning1, 690 , 550 , [0.6 0.6 0.6],[],[],[],2);
        DrawFormattedText(window, meaning2, 1150 , 550 , [0.6 0.6 0.6],[],[],[],2);
        Screen('Flip', window);

        [soundCorrect, freq] = audioread(sounds(trial_counter));

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

            if (toc >= 14)
                keyIsDown = 1;
            end   
        end 
        
        timeDecisionMade(itr) = toc;
        itr=itr+1;
        
        if keyCode(leftArrow) == 1
           decisionLeftKey(itr2) = 1;
        end
        if keyCode(rightArrow) == 1
           decisionRightKey(itr2) = 1;
        end
        
        itr2 = itr2 + 1;
        
        PsychPortAudio('Close', audioBuff);
        PsychPortAudio('Close');
        
        RestrictKeysForKbCheck([]); 
        timedout = true; %start the next trial
    end  

end

% ListenChar(1)
Screen('Close')

% %  Clear the screen
sca;
