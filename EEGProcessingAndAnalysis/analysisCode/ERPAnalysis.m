%% WHAT DOES THIS CODE DO?

% Create the event related potential signal - ERP

% in stim.data -> 1st is envelope, maybe have second element which has the
% same length as the envolope, zeros with 1s where the stimulus onsets are
% do a find of stimulus.data{2,1} (first stimulus) and this will tell you 
% where there is a one (a word) - do your epoching here 

%% ADD LIBRARIES AND LOAD THE AUDIO ONSET FILES IN A CELL ARRAY FOR USE IN THE NEXT SECTION 

addpath libs/eeglab

disp('Loading in audio onset files and creating a cell array of tables');

% % EEG PARTICIPANT ONE DATA
load('./datasets/linguisticDecision_old/dataStim1.mat','stim')
% load('./datasets/linguisticDecision_old/dataSub1_1_10Hz.mat','eeg')
load('./datasets/linguisticDecision_old/dataSub1_0_10Hz.mat','eeg')

% % EEG PARTICIPANT THREE DATA
% load('./datasets/linguisticDecision_old/dataStim3.mat','stim')
% load('./datasets/linguisticDecision_old/dataSub3_1_10Hz.mat','eeg')
% load('./datasets/linguisticDecision_old/dataSub3_0.01_10Hz.mat','eeg')


% Add a second column to the stim cell array that contains the same number of zeros as the length of the audio file in samples.
columns = length(stim.data);
for colNum = 1:columns
    stim.data{2,colNum} = zeros(size(stim.data{1,colNum}));
    stim.data{3,colNum} = zeros(size(stim.data{1,colNum}));
end

% Participant one stimuli order
sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav'};

% Participant three stimuli order
% sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav'};

nTrials = length(sounds); % 272 
numAudiosInSeq = 8;
fsDown = 128; % Sampling frequency: 512Hz -> 128Hz 

audioOnsetFilepaths = {'./datasets/AudioOnsetTimings/AppleOrange_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/BedCouch_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/BeeWasp_AudioOnsetTiming.csv','./datasets/AudioOnsetTimings/BusTrain_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CarBus_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CarrotPotato_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CatDog_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/ChickenPork_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/FootballRugby_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/GoldSilver_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/HouseApartment_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/MovieBook_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/TshirtShirt_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/UniversitySchool_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/WaterMilk_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/RainSnow_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/TelevisionSmartphone_audioOnsetTiming.csv'};                                                                                                                                                                                                                                                                                                                                                                                                                                               

% Read in MATLAB audio files  
numFiles = length(audioOnsetFilepaths);
arrayOfTables = {1,length(audioOnsetFilepaths)};
for i = 1:numFiles
    
    arrayOfTables{i} = readtable(audioOnsetFilepaths{i}, 'ReadVariableNames', false);

end

disp('FINISHED SECTION I: Read in clean EEG data and processed audio onset files');

%% ******************************************* 1) BY WORD (NOT SENTENCE) ANALYSIS PRE-PROCESSING STEP ************************************************

%% Run this when not running sentence ERP. Section that ultimately creates a cell array contains the audio onset times in samples for each audio onset in each audio file

% Breaks the files names into 3 parts: acronym, meaning number and sequence number and stores them in arrays. Then using these arrays obtains the 
% audio onsets and stores them in the the second section of stim.data.

% Code to split up the sound names into acronym, meaning and sequence number

seqAcronym= cell(1,nTrials);
meaningNum= cell(1,nTrials);
sequenceNum= cell(1,nTrials);

for audioFileName = 1:nTrials
    
    
    brokenString = strsplit(sounds{audioFileName},'_'); % Break string on underscores - breaks 3 pieces
    
    upToAcronym = strsplit(brokenString{1}, '/'); % Breaks acronym string from .../AllRecordings/US by the forward slashes
    seqNoWav = strsplit(brokenString{3}, '.'); % Removes the .wav from seqNo.wav

    seqAcronym{audioFileName} = upToAcronym{end}; % Acronym e.g. US
    meaningNum{audioFileName} = brokenString{2}; % Meaning number e.g. M2
    sequenceNum{audioFileName} = seqNoWav{1}; % Sequence number e.g. 16
    
end

% Code for obtaining the audio onsets and then storing them in stim.data

for onsetAudioNum = 1:numAudiosInSeq
    for stringValue = 1:nTrials

        tableNumIndex = acronymToIndexNumber(seqAcronym{stringValue});
        columnNum = str2double(sequenceNum{stringValue}) + 1;
     
        onsetInSeconds = arrayOfTables{tableNumIndex}{onsetAudioNum, columnNum};
        onsetInSamples  = round(onsetInSeconds * fsDown);

        stim.data{2, stringValue}(onsetInSamples) = 1;
        
    end

end

% Check for errors 
for i = 1:nTrials
    assert(isequal( size(stim.data{1, i}), size((stim.data{2, i})) ));
end

disp('FINSIHED SECTION 1: Sectioned stimuli into meanings, sequence numbers and acroynms');

%% *********************************************** 2) WORD ONSET ANALYSIS ****************************************************************

%% 2.1) ERP of the word onset 

% Window of interest in samples = [13, 64] : round(0.1*fsDown), round(0.5*fsDown)
windowOfInterest = [0.1, 0.6];
preStimBaselineWindow = [0.1, 0.15];

onsetEEGdata_eachWord = {};
for eegDataNo = 1:nTrials
    
    sampleNumOnsets = find(stim.data{2, eegDataNo} > 0);
        
    for audioNum = 1:numAudiosInSeq
   
        preStimulus = round(sampleNumOnsets(audioNum) - (windowOfInterest(1) * fsDown));
        postStimulus = round(sampleNumOnsets(audioNum) + (windowOfInterest(2) * fsDown));
        
        % Baseline correction
        baselineStart = preStimulus;
        baselineEnd = round(sampleNumOnsets(audioNum) + (preStimBaselineWindow(2) * fsDown));
        % baselineEnd = sampleNumOnsets(audioNum); % With out baseline correction
        baselineData = eeg.data{eegDataNo}(baselineStart:baselineEnd, 1:64);
        baselineVoltage = mean(baselineData,1);
        
        onsetEEGdata_eachWord{eegDataNo, audioNum} = eeg.data{eegDataNo}(preStimulus:postStimulus, 1:64) - baselineVoltage;
        % onsetEEGdata_eachWord{eegDataNo, audioNum} = eeg.data{eegDataNo}(preStimulus:postStimulus, 1:64); % Without baseline correction
    end
end

clear mean
% figure(1)
sumEEGData = cat(3, onsetEEGdata_eachWord{:});
avgEEGData = mean(sumEEGData, 3);

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

% t1 = tiledlayout(8,2);
% t1.Title.String = 'Word Onset Figures';
% t1.Title.FontWeight = 'bold';
% nexttile([4 2]);

figure(1);
plot(time_axis, avgEEGData);
xlim([time_axis(1),time_axis(end)]);
xline(0);

title('ERP of Word Onset (avg)');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

disp('FINISHED SECTION 2: Calculated the ERP of the word onset (ERP of all word onsets for 272 trials)');

%% TOPOGRAPHY AND GFP OF THE WORD ONSET ERP

%% 2.2) Topography of the word onset ERP

gfp2 = sqrt(mean(avgEEGData.^2,2));
% t_axis2 = (0:size(avgEEGData,1)-1)/fsDown*1000;

clear max
[max_val2, maxGFP_idx2] = max(gfp2);

timeValue2 = t_axis(maxGFP_idx2);
timeValue_samples2 = round((timeValue2/1000) * fsDown);

nexttile([4 1]);
% plot(gfp2);
plot(time_axis, gfp2);
xlim([time_axis(1),time_axis(end)]);
xlabel('Time (ms)');
ylabel('Global Field Power (μV)');
title('Global field power for word onset ERP');

colorbar;
% topoplot(mean(avgEEGData(56:66,:)), chanlocs);
nexttile([4 1]);
topoplot(avgEEGData(56,:), chanlocs);
title('Topography of word onset ERP at 328ms');

disp('FINISHED SECTION 3: Calculated the GFP and displayed areas of interest on a topograhy for the word onset ERP');

%% ************************************************* 3) BY SENTENCE ANALYSIS **************************************************************

%% METHOD ONE - CUTTING DATA OFF TRIALS THAT ARE TOO LONG (LONGER THAN SHORTEST TRIAL) 

%% 3.1) ERP of the sentence - method one - cutting off data from trials that are longer than the shorter trial

minimumLength = eeg.data{1};
for i = 2:nTrials
    
    compare = length(eeg.data{i});
    smallest = length(minimumLength);
    
    if (compare < smallest)
        minimumLength = eeg.data{i};
    end 
    
end
desiredDim = size(minimumLength);

% Remove data from matrices so that they are all the same dimensions as the smallest 
for i = 1:nTrials
    
    current_size = size(eeg.data{i});

    % Remove rows if necessary
    if current_size(1) > desiredDim(1)
        eeg.data{i}(desiredDim(1)+1:end,:) = [];
    end
   
end
   
preStimulus = 1;
postStimulus = 0.5 * fsDown;

sumEEGData_trial = cat(3, eeg.data{:});
avgEEGData_trial = mean(sumEEGData_trial, 3);

% baselineData = avgEEGData_trial(preStimulus:postStimulus, 1:64);
% baselineVoltage = mean(baselineData,1);
% 
% baselinedEEGData = avgEEGData_trial - baselineVoltage;

nexttile;
t_axis = ((1:length(avgEEGData_trial))/fsDown)*1000;
plot(t_axis, avgEEGData_trial);
title('ERP of Sentence (avg) - Matrix Reduction');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

disp('FINSIHED SECTION FOUR: Calculated the ERP for the sequence sentence - cut trial data which are longer than the shortest trial');

%% METHOD TWO - PADDING DATA WITH ZEROS FOR TRIALS THAT ARE TOO SHORT (SHORTER THAN LONGEST TRIAL).

%% 3.2) ERP of the sentence - method 2 - padding any trials that are shorter than the longest trial

maximumLength = eeg.data{1};
for i = 2:nTrials
    
    compare = length(eeg.data{i});
    largest = length(maximumLength);
    
    if (compare > largest)
        maximumLength = eeg.data{i};
    end 
    
end

% Add zero padding to the matrices so that they are all the same dimensions as the largest 
changeDim = size(maximumLength);
for i = 1:nTrials
    
    current_size = size(eeg.data{i});

    % Add passing to rows if necessary
    if current_size(1) < changeDim(1)
        eeg.data{i} = padarray(eeg.data{i},[changeDim(1)-current_size(1) 0],0,'post');
    end
   
end

sumEEGData_trialPad = cat(3, eeg.data{:});
avgEEGData_trialPad = mean(sumEEGData_trialPad, 3);

% figure(3);
nexttile;
t_axis = ((1:length(avgEEGData_trialPad))/fsDown)*1000;
plot(t_axis,avgEEGData_trialPad);
title('ERP of Sentence (avg) - Matrix Padding');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

% change x axis to ms from samples (fsDown = 128) = (1:length(x)/fs)*1000 =
% time axis

disp('FINISHED SECTION 5: Calculated the ERP for the sequence sentence - zero pad trial data that are shorter than the longest trial');

%% TOPOGRAPHY OF SENTENCE ERP

%% 3.3) Topography of the sentence ERP 

% Plot the ERP topohraphy - GFP global field power - get peak from the GFP and use it to plot the topography 

%  Switch out 'avgEEGData_trialPad' to 'avgEEGData_trial' for cut off data sentence ERP

gfp = sqrt(mean(avgEEGData_trialPad.^2,2)); 
t_axis = (0:size(avgEEGData_trialPad,1)-1)/fsDown*1000;

clear max
[max_val, maxGFP_idx] = max(gfp);

timeValue = t_axis(maxGFP_idx);
timeValue_samples = round((timeValue/1000) * fsDown);

figure(13);
plot(gfp);
% plot(t_axis, gfp);
xlabel('Time (ms)');
ylabel('Global Field Power (μV)');
title('Global field power for padded sentence ERP');

figure(14);
title('Topography of sentence ERP');
colorbar;
% 105:110 good stuff there, 51:55, 17:23 (first one)
topoplot(mean(avgEEGData_trialPad(17:23,:)), chanlocs);

disp('FINISHED SECTION 6: Calculated the GFP and displayed areas of interest on a topograhy for the sentence ERP');

%% ****************************** 4) ERPs OF INDIVIDUAL WORD ONSETS - WORD 1 ONSET, WORD 2 ONSET ETC... ********************************************

%% 4.1) ERP for word 1, word 2, word 3 etc. to examine how the response changes as the number of words heard increases

onsetWordEEGData = {};
windowOfInterest = [0.1, 0.6];
preStimBaselineWindow = [0.1, 0];

for audioNum = 1:numAudiosInSeq
    for eegDataNo = 1:nTrials
   
        sampleNumOnsets = find(stim.data{2, eegDataNo} > 0);
        
        preStimulus = round(sampleNumOnsets(audioNum) - (windowOfInterest(1) * fsDown));
        postStimulus = round(sampleNumOnsets(audioNum) + (windowOfInterest(2) * fsDown));

        baselineStart = preStimulus;
        baselineEnd = round(sampleNumOnsets(audioNum) + (preStimBaselineWindow(2) * fsDown));

        baselineData = eeg.data{eegDataNo}(baselineStart:baselineEnd, 1:64);
        baselineVoltage = mean(baselineData,1);
        
        onsetWordEEGData{eegDataNo, audioNum} = eeg.data{eegDataNo}(preStimulus:postStimulus, 1:64) - baselineVoltage;
 
    end  
end

wordOnsetAverages = {};
t2 = tiledlayout(4,4);
t2.Title.String = 'Onset ERP for each word 1-8';
t2.Title.FontWeight = 'bold';

for figureNum = 1:numAudiosInSeq
    
    sumEEGData_EachWord = cat(3, onsetWordEEGData{1:272, figureNum});
    avgEEGData_EachWord = mean(sumEEGData_EachWord, 3);
    
    wordOnsetAverages{figureNum} = avgEEGData_EachWord;

    time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

    nexttile([2 1]);
    plot(time_axis, avgEEGData_EachWord);
    xlim([time_axis(1),time_axis(end)]);
    xline(0);

    title(['ERP of Word ', num2str(figureNum), ' Onset (avg)']);
    xlabel('Time-latency (ms)')
    ylabel('Magnitude (a.u.)')
 
end

disp('FINISHED SECTION 7: Calculated the ERP for each individual word onset');

%% TOPOGRAPHY OF EACH WORD ONSET ERP

%% 4.2) Topography and GFP of each individual word onset

time_axis_WO = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

% Calculate GFPs for all word onsets
gfpForAllWords = {};
t3 = tiledlayout(4,4);
t3.Title.String = 'Global field power for each word onset ERP 1-8';
t3.Title.FontWeight = 'bold';
for wordNum = 1:numAudiosInSeq

%     figure(wordNum+16);
    
    gfp_WordOn = sqrt(mean(wordOnsetAverages{wordNum}.^2,2));
    
    gfpForAllWords{wordNum} = gfp_WordOn;

    nexttile([2, 1]);
    plot(time_axis_WO, gfp_WordOn);
    xline(0);
%     plot(gfp_WordOn);
    xlim([time_axis_WO(1),time_axis_WO(end)]);
    
    xlabel('Time (ms)');
    ylabel('Global Field Power (μV)');
    title(['Global field power for word ', num2str(wordNum), ' onset ERP']);
      
end

[max_val_wordOn, maxGFP_idx_wordOn] = max(gfpForAllWords{1});

% timeValue_wordOn = t_axis(maxGFP_idx_wordOn);
% timeValue_samples_wordOn = round((timeValue_wordOn/1000) * fsDown);

% figure(wordNum+24);
figure(17);
title(['Topography of word ', num2str(wordNum), ' onset ERP']);
colorbar;
% topoplot(mean(wordOnsetAverages{1}(71:80,:)), chanlocs);
topoplot(wordOnsetAverages{7}(39,:), chanlocs);

disp('FINISHED SECTION 8: Calculated the GFP and displayed areas of interest on a topograhy for the individual word onset ERPs');


%% **************************************** 5) RESPONSE LOCKED ERP ANALYSIS *************************************************

%% 5.1) Run this section once - Add a 1 to stim.data{3, trialNumber) at the sample at which there is a button press and pre-process the data for response locked ERP analysis 

% Fill data.stim{3, x} with button press occurances

for trialNo = 1:nTrials
    
   buttonPressInSamples = eeg.buttonpress{trialNo};
   stim.data{3, trialNo}(buttonPressInSamples) = 1;
 
end

%%

windowOfInterest = [3, 0.1];
baselineWindow = [3, 0.1];

reponseEEGData_eachWord = {};
for eegDataNo = 1:nTrials
        
    buttonPressSamp = find(stim.data{3, eegDataNo} > 0);
        
    preResponse_1 = round(buttonPressSamp - (windowOfInterest(1) * fsDown));
    preResponse_2 = round(buttonPressSamp + (windowOfInterest(2) * fsDown));
    
    if (preResponse_1 < 0)

        eeg.data{eegDataNo} = padarray(eeg.data{eegDataNo}, (preResponse_1*-1), 0,'pre');
        preResponse_2 = preResponse_2 + (preResponse_1*-1)+1;
        preResponse_1 = 1;
        
    end
    
    baselineStart = preResponse_1;
    baselineEnd = preResponse_2;
    
    baselineData = eeg.data{eegDataNo}(baselineStart:baselineEnd, 1:64);
    baselineVoltage = mean(baselineData,1);

    reponseEEGData_eachWord{eegDataNo} = eeg.data{eegDataNo}(preResponse_1:preResponse_2, 1:64) - baselineVoltage; % Without baseline correction
    
end

disp('FINISHED SECTION 9: Added button presses to stim.data and calculated the ERP with the data epoched based on the button press timing instead of stimulus onset');

%% TOPOGRAPHY AND GFP OF THE RESPONSE LOCKED ERP

%% 5.2) Plot the GFP and topography for the response locked ERP

clear mean
figure(1);
sumEEGData = cat(3, reponseEEGData_eachWord{:});
avgEEGData = mean(sumEEGData, 3);

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

plot(time_axis, avgEEGData);
xlim([time_axis(1),time_axis(end)]);
xline(0);

title('ERP of response locked EEG data (avg)');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

figure(2);
gfp_responseLocked = sqrt(mean(avgEEGData.^2,2));
plot(time_axis, gfp_responseLocked);
xlim([time_axis(1),time_axis(end)]);
xline(0);
xlabel('Time (ms)');
ylabel('Global Field Power (μV)');
title('Global Field Power of response locked ERP');

figure(3);
gfp_responseLocked = sqrt(mean(avgEEGData.^2,2));
plot(gfp_responseLocked);
xline(0);
xlabel('Time (samples)');
ylabel('Global Field Power (μV)');
title('Global Field Power of response locked ERP');

figure(4);
title('Topography of response locked ERP at 740ms before response');
colorbar;
topoplot(mean(avgEEGData(287:290,:)), chanlocs);

figure(5);
title('Topography of response locked ERP from 484ms before response');
colorbar;
topoplot(avgEEGData(322,:), chanlocs);

figure(6);
title('Topography of response locked ERP from 617ms before response');
colorbar;
topoplot(mean(avgEEGData(304:306,:)), chanlocs);

figure(7);
title('Topography of response locked ERP from 62ms before response');
colorbar;
topoplot(avgEEGData(288,:), chanlocs);

disp ('FINISHED SECTION 10: Calculated the GFP and displayed areas of interest on a topograhy for the response locked ERP');

%% ********************************************* 6) Prior word to button press ERP ***********************************************

%% 6.1) Dividing EEG data into arrays based on the word last hear before a decision was made 

leaveFlag = 0;

firstWordResponse = {};
secondWordResponse = {};
thirdWordResponse = {};
fourthWordResponse = {};
fifthWordResponse = {};
sixthWordResponse = {};
seventhWordResponse = {};
eighthWordResponse = {};

for trialNum = 1:nTrials
               
    buttonPressOccur = find(stim.data{3, trialNum} > 0);
    stimOnsetOccur = find(stim.data{2, trialNum} > 0);
    leaveFlag = 0;
    
    for onsetNum = 1:numAudiosInSeq
      
        if (buttonPressOccur < stimOnsetOccur(onsetNum))
            wordBeforePress = onsetNum - 1;
            break
        end
        
        if (buttonPressOccur > stimOnsetOccur(8))
            wordBeforePress = 8;
            break
        end
        
        if (buttonPressOccur) == stimOnsetOccur(onsetNum)
            wordBeforePress = onsetNum - 1;
            break
        end
    end

    if (wordBeforePress == 1)
        index1 = length(firstWordResponse) + 1;
        firstWordResponse{index1} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 2)
        index2 = length(secondWordResponse) + 1;
        secondWordResponse{index2} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 3)
        index3 = length(thirdWordResponse) + 1;
        thirdWordResponse {index3} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 4)
        index4 = length(fourthWordResponse) + 1;
        fourthWordResponse {index4} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 5)
        index5 = length(fifthWordResponse) + 1;
        fifthWordResponse{index5} = reponseEEGData_eachWord{trialNum};
        
    end

    if (wordBeforePress == 6)
        index6 = length(sixthWordResponse) + 1;
        sixthWordResponse{index6} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 7)
        index7 = length(seventhWordResponse) + 1;
        seventhWordResponse{index7} = reponseEEGData_eachWord{trialNum};
    end

    if (wordBeforePress == 8)
        index8 = length(eighthWordResponse) + 1;
        eighthWordResponse{index8} = reponseEEGData_eachWord{trialNum};
    end
end

disp ('FINISHED SECTION 11: TBD');

%% Run this one

firstWordResponse = {};

secondWordResponse = {};
firstWordResponse_prev = {};

thirdWordResponse = {};
secondWordResponse_prev = {};

fourthWordResponse = {};
thirdWordResponse_prev = {};

fifthWordResponse = {};
fourthWordResponse_prev = {};

sixthWordResponse = {};
fifthWordResponse_prev = {};

seventhWordResponse = {};
sixthWordResponse_prev = {};

eighthWordResponse = {};
seventhWordResponse_prev = {};

for trialNum = 1:nTrials
               
    buttonPressOccur = find(stim.data{3, trialNum} > 0);
    stimOnsetOccur = find(stim.data{2, trialNum} > 0);
    leaveFlag = 0;
    
    for onsetNum = 1:numAudiosInSeq
      
        if (buttonPressOccur <= stimOnsetOccur(onsetNum))
            wordBeforePress = onsetNum - 1;
            break
        end
        
        if (buttonPressOccur > stimOnsetOccur(8))
            wordBeforePress = 8;
            break
        end
       
    end

    if (wordBeforePress == 1)
        index1 = length(firstWordResponse) + 1;
        firstWordResponse{index1} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
    end

    if (wordBeforePress == 2)
        index2 = length(secondWordResponse) + 1;
        secondWordResponse{index2} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        firstWordResponse_prev{index2} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
    end

    if (wordBeforePress == 3)
        index3 = length(thirdWordResponse) + 1;
        thirdWordResponse{index3} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        secondWordResponse_prev{index3} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
    end

    if (wordBeforePress == 4)
        index4 = length(fourthWordResponse) + 1;
        fourthWordResponse{index4} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        thirdWordResponse_prev{index4} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};

    end

    if (wordBeforePress == 5)
        index5 = length(fifthWordResponse) + 1;
        fifthWordResponse{index5} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        fourthWordResponse_prev{index5} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
        
    end

    if (wordBeforePress == 6)
        index6 = length(sixthWordResponse) + 1;
        sixthWordResponse{index6} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        fifthWordResponse_prev{index6} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
    end

    if (wordBeforePress == 7)
        index7 = length(seventhWordResponse) + 1;
        seventhWordResponse{index7} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        sixthWordResponse_prev{index7} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
    end

    if (wordBeforePress == 8)
        index8 = length(eighthWordResponse) + 1;
        eighthWordResponse{index8} = onsetEEGdata_eachWord{trialNum, wordBeforePress};
        seventhWordResponse_prev{index8} = onsetEEGdata_eachWord{trialNum, wordBeforePress-1};
    end
end

disp ('FINISHED SECTION 11: TBD');


%% 6.2) Calculating the ERP based on the above division

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

% ******************************************* ERP for word N when response occurs on word N ***************************************************** %

figure(1);
t4 = tiledlayout(2,4);
t4.Title.String = 'Event related potential for word N when response occured on word N';
t4.Title.FontWeight = 'bold';

plotTitles = {'ERP for word 1 when response occurred on word 1', 'ERP for word 2 when response occurred on word 2',... 
              'ERP for word 3 when response occurred on word 3', 'ERP for word 4 when response occurred on word 4',... 
              'ERP for word 5 when response occurred on word 5', 'ERP for word 6 when response occurred on word 6',...
              'ERP for word 7 when response occurred on word 7', 'ERP for word 8 when response occurred on word 8' };
          
sumEEGData_WN_response = { cat(3, firstWordResponse{:}), cat(3, secondWordResponse{:}),...
                           cat(3, thirdWordResponse{:}), cat(3, fourthWordResponse{:}),...
                           cat(3, fifthWordResponse{:}), cat(3, sixthWordResponse{:}),...
                           cat(3, seventhWordResponse{:}), cat(3, eighthWordResponse{:}) };

% Plot for all words when the response occurred on that word
for plotNum = 1:numAudiosInSeq
 
    nexttile;
    avgEEGData_WN_response = mean(sumEEGData_WN_response{plotNum}, 3);
    plotERP_WordN(time_axis, avgEEGData_WN_response, plotTitles{plotNum});
    
end

% ******************************************* ERP for word N-1 when response occurs on word N ***************************************************** %

figure(2);
t5 = tiledlayout(2,4);
t5.Title.String = 'Event related potential for word N-1 when response occured on word N';
t5.Title.FontWeight = 'bold';

plotTitles = {'ERP for word 1 when response occurred on word 2', 'ERP for word 2 when response occurred on word 3',...
              'ERP for word 3 when response occurred on word 4', 'ERP for word 4 when response occurred on word 5',...
              'ERP for word 5 when response occurred on word 6', 'ERP for word 6 when response occurred on word 7',...
              'ERP for word 7 when response occurred on word 8' };
          
sumEEGData_WNMin1_response = { cat(3, firstWordResponse_prev{:}), cat(3, secondWordResponse_prev{:}),...
                               cat(3, thirdWordResponse_prev{:}), cat(3, fourthWordResponse_prev{:}),...
                               cat(3, fifthWordResponse_prev{:}), cat(3, sixthWordResponse_prev{:}),...
                               cat(3, seventhWordResponse_prev{:}) };

% Plot for all words previous to the response being made
for plotNum = 1:numAudiosInSeq-1
 
    nexttile;
    avgEEGData_WNMin1_response = mean(sumEEGData_WNMin1_response{plotNum}, 3);
    plotERP_WordN(time_axis, avgEEGData_WNMin1_response, plotTitles{plotNum});
    
end

%%

figure(4);

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

t6 = tiledlayout(2,4);
t6.Title.String = 'ERP, GFP and topographies for word 2 when response occured on word 3';
t6.Title.FontWeight = 'bold';

nexttile;
avgERP =  mean(cat(3, fourthWordResponse_prev{:}), 3);
plot(time_axis, avgERP);
xlim([time_axis(1),time_axis(end)]);
xlabel('Time-latency (ms)'); ylabel('Magnitude (a.u.)');
title('ERP for word 2 when response occured on word 3');

% nexttile;
% avgERP =  mean(cat(3, secondWordResponse_prev{:}), 3);
% plot(avgERP);
% xlabel('Time-latency (ms)'); ylabel('Magnitude (a.u.)');
% title('ERP for word 2 when response occured on word 3');

nexttile;
gfpAvg = sqrt(mean(avgERP.^2,2)); 
plot(gfpAvg);
% plot(time_axis, gfpAvg);
% xlim([time_axis(1),time_axis(end)]);
xlabel('Time-latency (ms)'); ylabel('Global Field Power (μV)');
title('Global Field Power of the ERP');

nexttile;
title('Topography at 312ms');
colorbar; 
topoplot(avgERP(54,:), chanlocs);

nexttile;
title('Topography at 328ms');
colorbar; 
topoplot(avgERP(55,:), chanlocs);

nexttile;
title('Topography at 343ms');
colorbar; 
topoplot(avgERP(56,:), chanlocs);

nexttile;
title('Topography at 367ms');
colorbar; 
topoplot(avgERP(57,:), chanlocs);

nexttile;
title('Topography at 390ms');
colorbar; 
topoplot(avgERP(64,:), chanlocs);

nexttile;
title('Topography at 280ms-390ms');
colorbar; 
topoplot(mean(avgERP(64:70,:)), chanlocs);

% topoplot(mean(avgERP(49:68,:)), chanlocs);

%%

figure(5);

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

t7 = tiledlayout(2,4);
t7.Title.String = 'ERP, GFP and topographies for word 3 when response occured on word 3';
t7.Title.FontWeight = 'bold';

nexttile;
avgERP2 =  mean(cat(3, thirdWordResponse_prev{:}), 3);
plot(avgERP2);
% plot(time_axis, avgERP2);
% xlim([time_axis(1),time_axis(end)]);
xlabel('Time-latency (ms)'); ylabel('Magnitude (a.u.)');
title('ERP for word 2 when response occured on word 3');

nexttile;
title('Topography at 312ms');
colorbar; 
topoplot(avgERP2(83,:), chanlocs);

%%

time_axis = (round(-windowOfInterest(1) * fsDown):round(windowOfInterest(2) * fsDown))/fsDown*1000;

figure(3);
t6 = tiledlayout(2,2);
t6.Title.String = 'Topography - word 1 - at ';
t6.Title.FontWeight = 'bold';

nexttile;
gfp_W8_response = sqrt(mean(avgEEGData_W1_response.^2,2));
plot(gfp_W8_response);
plot(time_axis, gfp_W8_response);
xlabel('Time (samples)');
ylabel('Global Field Power (μV)');
title('Global Field Power of response locked ERP');


nexttile
title('Single topography');
colorbar;
topoplot(avgEEGData_W1_response(56,:), chanlocs);

nexttile
title('Single topography');
colorbar;
topoplot(avgEEGData_W1_response(56,:), chanlocs);

disp ('FINISHED SECTION 12: TBD2');


% if you know where the stimulus onset is then you need to take a window of
% samples around the stimulus to get an ERP = one epoch for one word
% presentation - one epoch for each word in a stimulus and average them at
% the end 

% Need to take epochs around each word - 1000s of words - put in matrix
% where you have all the epochs and then average them

% Other option is you sum the epochs together and divide by the amount of
% epoches you have to gey your average - produces the ERP

% 3 ERPs in total: ERP to each word, ERP to the sentence, ERP to response 
% locked epochs

% define a tmin and tmax - 200ms before 0, 600ms after 0 - figure that out
% in terms of samples (tmin * fs (sampling frequency)) (multiply time (tmin) 
% in seconds not milliseconds)

%  for loop - chunk for each word onset - average them = ERP.
%  ERP usually starts from small number and goes up - force pre onset EEG
%  to be zero and then normalise the rest of the signal based on this -
%  before averaging 

% To check if its been done right - plot on top of the TRF

% Next step is the response locked 



