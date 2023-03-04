
% Load in stimulus data
load('./datasets/linguisticDecision/dataStimInOrder.mat', 'stimInOrder');
disp(stimInOrder.data);

%% Initial calculations - TO DO: Create a new stim with the in order trials 

numStimFiles = length(stimInOrder.data);

audioOnsets = {1, numStimFiles};
for stimNum = 1:numStimFiles
    
    maxSoundLen_Samples = round(0.99 * 128);

    if (stimNum == 16)
          maxSoundLen_Samples = round(0.7 * 128);
%     if (stimNum == 2 || stimNum == 5 || stimNum == 7 || stimNum == 8 || stimNum == 9 || stimNum == 10 || stimNum == 11 || stimNum == 12 || stimNum == 13 || stimNum == 14 || stimNum == 15 || stimNum == 16)
%         maxSoundLen_Samples = round(0.9 * 128);
    end
    
    envelopeSound = stimInOrder.data{stimNum};
    maxAmp = max(envelopeSound);

    lowThreshold = maxAmp * 0.02;

    sampNum = 1;
    itr = 1;

    while (sampNum <= length(envelopeSound))
        if (envelopeSound(sampNum) > lowThreshold)
            audioOnsets{stimNum}(itr) = sampNum;
            itr = itr + 1;
            if (itr == 9)
                audioOnsets{stimNum}(9) = length(envelopeSound);
                break
            end
            sampNum = sampNum + maxSoundLen_Samples;
        else
            sampNum = sampNum + 1;
        end
    end
    
    figure(stimNum);
    plot(envelopeSound);
    hold on;
    for i = 1:length(audioOnsets{stimNum})
        line([audioOnsets{stimNum}(i) audioOnsets{stimNum}(i)], ylim, 'Color', 'r');
    end
    legend('Audio Envelope', 'Onset Values');
    hold off;
    
end

disp('hi');


%% Add to a new CSV file

audioOnsets{12}(3) = 316;

audioOnsets{9}(3) = 497;
audioOnsets{9}(4) = 601;
audioOnsets{9}(5) = 760;
audioOnsets{9}(6) = 860;

audioOnsets{6}(4) = 535;
audioOnsets{6}(6) = 847;

audioOnsets{5}(3) = 519;
audioOnsets{5}(4) = 645;
audioOnsets{5}(5) = 749;
audioOnsets{5}(6) = 911;

audioOnsets{3}(7) = 1509;

audioOnsets{2}(3) = 474;

for stimNum = 1:numStimFiles

    figure(stimNum);
    envelopeSound = stimInOrder.data{stimNum};
    plot(envelopeSound);
    hold on;
    for i = 1:length(audioOnsets{stimNum})
        line([audioOnsets{stimNum}(i) audioOnsets{stimNum}(i)], ylim, 'Color', 'r');
    end
    legend('Audio Envelope', 'Onset Values');
    hold off;

end

%%
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

disp('done');








