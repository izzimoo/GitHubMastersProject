
%% Calculate one forward mTRF for all participants  

% % Participant one
load('./datasets/linguisticDecision/Subject1/MastoidReRef/dataStim1.mat','stimP1')
load('./datasets/linguisticDecision/Subject1/MastoidReRef/dataSub1_1_10Hz.mat','eegP1')

% Participant two
load('./datasets/linguisticDecision/Subject2/MastoidReRef/dataStim2.mat','stimP2')
load('./datasets/linguisticDecision/Subject2/MastoidReRef/dataSub2_1_10Hz.mat','eegP2')

% Participant three
load('./datasets/linguisticDecision/Subject3/MastoidReRef/dataStim3.mat','stimP3')
load('./datasets/linguisticDecision/Subject3/MastoidReRef/dataSub3_1_10Hz.mat','eegP3')

% Participant four
load('./datasets/linguisticDecision/Subject4/MastoidReRef/dataStim4.mat','stimP4')
load('./datasets/linguisticDecision/Subject4/MastoidReRef/dataSub4_1_10Hz.mat','eegP4')

% Participant five
load('./datasets/linguisticDecision/Subject5/MastoidReRef/dataStim5.mat','stimP5')
load('./datasets/linguisticDecision/Subject5/MastoidReRef/dataSub5_1_10Hz.mat','eegP5')

% Participant six
load('./datasets/linguisticDecision/Subject6/MastoidReRef/dataStim6.mat','stimP6')
load('./datasets/linguisticDecision/Subject6/MastoidReRef/dataSub6_1_10Hz.mat','eegP6')

% TRF hyperparameters
tmin = -100;
tmax = 600;
lambdas = [1e-2,1e0,1e1,1e2,1e4]; % small set of lambdas (quick)
dirTRF = 1; % Forward TRF model
stimIdx = 1; % 1: env; 2: 

figure('Position',[100,100,600,600]);

eegP1 = cndNewOp(eegP1,'Load'); % Saving the processing pipeline in the eeg struct
eegP2 = cndNewOp(eegP2,'Load'); % Saving the processing pipeline in the eeg struct
eegP3 = cndNewOp(eegP3,'Load'); % Saving the processing pipeline in the eeg struct
eegP4 = cndNewOp(eegP4,'Load'); % Saving the processing pipeline in the eeg struct
eegP5 = cndNewOp(eegP5,'Load'); % Saving the processing pipeline in the eeg struct
eegP6 = cndNewOp(eegP6,'Load'); % Saving the processing pipeline in the eeg struct


stimFeature = stimP1;
stimFeature.names = stimFeature.names{stimIdx};
stimFeature.data = stimFeature.data(stimIdx,:); 

stimFeature2 = stimP2;
stimFeature2.names = stimFeature2.names{stimIdx};
stimFeature2.data = stimFeature2.data(stimIdx,:); 

stimFeature3 = stimP3;
stimFeature3.names = stimFeature3.names{stimIdx};
stimFeature3.data = stimFeature3.data(stimIdx,:); 

stimFeature4 = stimP4;
stimFeature4.names = stimFeature4.names{stimIdx};
stimFeature4.data = stimFeature4.data(stimIdx,:); 

stimFeature5 = stimP5;
stimFeature5.names = stimFeature5.names{stimIdx};
stimFeature5.data = stimFeature5.data(stimIdx,:);

stimFeature6 = stimP6;
stimFeature6.names = stimFeature6.names{stimIdx};
stimFeature6.data = stimFeature6.data(stimIdx,:); 

% Making sure that stim and neural data have the same length
[stimFeature,eegP1] = cndCheckStimNeural(stimFeature,eegP1);
[stimFeature2,eegP2] = cndCheckStimNeural(stimFeature2,eegP2);
[stimFeature3,eegP3] = cndCheckStimNeural(stimFeature3,eegP3);
[stimFeature4,eegP4] = cndCheckStimNeural(stimFeature4,eegP4);
[stimFeature5,eegP5] = cndCheckStimNeural(stimFeature5,eegP5);
[stimFeature6,eegP6] = cndCheckStimNeural(stimFeature6,eegP6);

% Standardise stim data (preserving the ratio between features)
% This is thought for continuous signals e.g., speech envelope, eeg
stimFeature = cndNormalise(stimFeature);
stimFeature2 = cndNormalise(stimFeature2);
stimFeature3 = cndNormalise(stimFeature3);
stimFeature4 = cndNormalise(stimFeature4);
stimFeature5 = cndNormalise(stimFeature5);
stimFeature6 = cndNormalise(stimFeature6);

% Standardise neural data (preserving the ratio between channels)
eegP1 = cndNormalise(eegP1);
eegP2 = cndNormalise(eegP2);
eegP3 = cndNormalise(eegP3);
eegP4 = cndNormalise(eegP4);
eegP5 = cndNormalise(eegP5);
eegP6 = cndNormalise(eegP6);

% TRF crossvalidation - determining optimal regularisation parameter
disp('Running mTRFcrossval')
[stats,t] = mTRFcrossval(stimFeature.data, eegP1.data, eegP1.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);
[stats2,t2] = mTRFcrossval(stimFeature2.data, eegP2.data, eegP2.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);
[stats3,t3] = mTRFcrossval(stimFeature3.data, eegP3.data, eegP3.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);
[stats4,t4] = mTRFcrossval(stimFeature4.data, eegP4.data, eegP4.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);
[stats5,t5] = mTRFcrossval(stimFeature5.data, eegP5.data, eegP5.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);
[stats6,t6] = mTRFcrossval(stimFeature6.data, eegP6.data, eegP6.fs, dirTRF, tmin, tmax, lambdas, 'verbose',0);

% Calculating optimal lambda. Display and store results
[maxR,bestLambda] = max(squeeze(mean(mean(stats.r,1),3)));
disp(['r = ', num2str(maxR)])

[maxR_2,bestLambda_2] = max(squeeze(mean(mean(stats2.r,1),3)));
disp(['r = ', num2str(maxR_2)])

[maxR_3,bestLambda_3] = max(squeeze(mean(mean(stats3.r,1),3)));
disp(['r = ', num2str(maxR_3)])

[maxR_4,bestLambda_4] = max(squeeze(mean(mean(stats4.r,1),3)));
disp(['r = ', num2str(maxR_4)])

[maxR_5,bestLambda_5] = max(squeeze(mean(mean(stats5.r,1),3)));
disp(['r = ', num2str(maxR_5)])

[maxR_6,bestLambda_6] = max(squeeze(mean(mean(stats6.r,1),3)));
disp(['r = ', num2str(maxR_6)])

% Fit TRF model with optimal regularisation parameter
disp('Running mTRFtrain')
model = mTRFtrain(stimFeature.data, eegP1.data, eegP1.fs, dirTRF, tmin, tmax, lambdas(bestLambda), 'verbose',0);
model2 = mTRFtrain(stimFeature2.data, eegP2.data, eegP2.fs, dirTRF, tmin, tmax, lambdas(bestLambda_2), 'verbose',0);
model3 = mTRFtrain(stimFeature3.data, eegP3.data, eegP3.fs, dirTRF, tmin, tmax, lambdas(bestLambda_3), 'verbose',0);
model4 = mTRFtrain(stimFeature4.data, eegP4.data, eegP4.fs, dirTRF, tmin, tmax, lambdas(bestLambda_3), 'verbose',0);
model5 = mTRFtrain(stimFeature5.data, eegP5.data, eegP5.fs, dirTRF, tmin, tmax, lambdas(bestLambda_3), 'verbose',0);
model6 = mTRFtrain(stimFeature6.data, eegP6.data, eegP6.fs, dirTRF, tmin, tmax, lambdas(bestLambda_3), 'verbose',0);

% Store TRF model
modelTRF = [model, model2, model3, model4, model5, model6];

% Forward TRF
mTRF_plotForwardTRF(modelTRF);
drawnow;

disp('End of section three');



