
%% Stimuli for each pair of target words are read in and their word onsets are calculated 

% Need to swtich out the 16 sequences each time you want to get the audio onsets of a different pair of target words
sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav'};
nTrials = length(sounds);

% Getting trial length and set up stimulus structure
trialDurSec = zeros(1, nTrials);
fsDown = 128;
clear stimInOrder
for trialNo = 1:nTrials
    [audio, fsStimulus] = audioread(sounds{trialNo});
    trialDurSec(trialNo) = size(audio,1)/fsStimulus;
    stimInOrder.data{1,trialNo} = resample(abs(hilbert(audio(:,1))),fsDown,fsStimulus);
end
stimInOrder.names = {'Envelope'};
stimInOrder.fs = fsDown;

save('./dataStimInOrder.mat','stimInOrder')

% Load in stimulus data
load('./dataStimInOrder.mat', 'stimInOrder');
disp(stimInOrder.data);

%% ********************* CALCULATE THE AUDIO ONSET TIMES USING A THRESHOLD ALGORITHM **************************

numStimFiles = length(stimInOrder.data);
audioOnsets = {1, numStimFiles};

for stimNum = 1:numStimFiles
    
    maxSoundLen_Samples = round(0.99 * 128); % Max length of a word in the audios, this sometimes needs to be manually adjusted
    
    % Get the envelope of each stimulus
    envelopeSound = stimInOrder.data{stimNum};
    maxAmp = max(envelopeSound);

    % Get the low threshold value, where each peak in the envelope begins to go from 0 to non-zero
    lowThreshold = maxAmp * 0.02;

    sampNum = 1;
    itr = 1;

    while (sampNum <= length(envelopeSound))
        if (envelopeSound(sampNum) > lowThreshold) 
            audioOnsets{stimNum}(itr) = sampNum; % Save the sample number of the threshold crossing as this is the audio onset 
            itr = itr + 1;
            if (itr == 9)
                audioOnsets{stimNum}(9) = length(envelopeSound); % Length of the stimulus is also saved
                break
            end
            sampNum = sampNum + maxSoundLen_Samples; % Skip onto the next word but adding the typical length of a word in sample to the sample number
        else
            sampNum = sampNum + 1; % Else move to the next sample 
        end
    end
    
    % Plot a figure for each stimulus to examine visually how accurately the audio onset is being determined.
    % Manual intervention may be needed for some sequences that do not accurately track the audio onsets using this method.
    figure(stimNum);
    plot(envelopeSound, 'LineWidth', 1.0);
    hold on;
    for i = 1:length(audioOnsets{stimNum})
        line([audioOnsets{stimNum}(i) audioOnsets{stimNum}(i)], ylim, 'Color', 'r', 'LineWidth', 1.5);
    end
    hold off;
    
    legend('Audio Envelope', 'Word Onset');
    xlabel('Samples (a.u.)');
    ylabel('Amplitude (a.u.)');
    set(gca, 'FontSize', 14);
    set(gcf, 'Color', 'white');
    xlim([0, 2000]);
    ylim([-0.01, 0.18]);
    set(legend, 'FontSize', 12);
    
end


%% ****************** WRITE THE NEW ONSET TIMES IN SAMPLES TO A CSV THAT CAN BE READ IN LATER ************************

rownames = {'Audio1';'Audio2';'Audio3';'Audio4';'Audio5';'Audio6';'Audio7';'Audio8';'AudioLength'};

Sequence1 = audioOnsets{1}';
Sequence2 = audioOnsets{2}';
Sequence3 = audioOnsets{3}';
Sequence4 = audioOnsets{4}';
Sequence5 = audioOnsets{5}';
Sequence6 = audioOnsets{6}';
Sequence7 = audioOnsets{7}';
Sequence8 = audioOnsets{8}';
Sequence9 = audioOnsets{9}';
Sequence10 = audioOnsets{10}';
Sequence11 = audioOnsets{11}';
Sequence12 = audioOnsets{12}';
Sequence13 = audioOnsets{13}';
Sequence14 = audioOnsets{14}';
Sequence15 = audioOnsets{15}';
Sequence16 = audioOnsets{16}';

T = table(Sequence1, Sequence2, Sequence3, Sequence4, Sequence5, Sequence6, Sequence7, Sequence8,... 
     Sequence9, Sequence10, Sequence11, Sequence12, Sequence13, Sequence14, Sequence15, Sequence16, 'RowNames', rownames);

% write the table to a CSV file named 'example2.csv'
writetable(T, './US.csv', 'WriteRowNames', true);

disp('FINISHED SCRIPT');








