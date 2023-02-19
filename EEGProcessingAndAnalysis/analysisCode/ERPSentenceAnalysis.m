%% ADD LIBRARIES AND LOAD THE AUDIO ONSET FILES IN A CELL ARRAY FOR USE IN THE NEXT SECTION 

addpath libs/eeglab

disp('Loading in audio onset files and creating a cell array of tables');

% Participant one
load('./datasets/linguisticDecision/dataStim1.mat','stimP1')
load('./datasets/linguisticDecision/dataSub1_0.01_10Hz.mat','eegP1')

% Participant two
load('./datasets/linguisticDecision/dataStim2.mat','stimP2')
load('./datasets/linguisticDecision/dataSub2_0.01_10Hz.mat','eegP2')

numParticipants = 2;
numAudiosInSeq = 8;
fsDown = 128; % Sampling frequency: 512Hz -> 128Hz 

stimulusEachParticipant = {stimP1, stimP2};
EEGDataEachParticipant_ShortTrial = {eegP1, eegP2};
EEGDataEachParticipant_LongTrial = {eegP1, eegP2};

% Participant one stimuli order
soundsP1 = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav'};
% Participant three stimuli order
soundsP2 = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav'};

stimuliOrder = {soundsP1, soundsP2};
nTrials = length(soundsP1); % 272 

% Add a second column to the stim cell array that contains the same number of zeros as the length of the audio file in samples.
columns = length(stimP1.data);

for participantNo = 1:numParticipants
    for colNum = 1:columns
        stimulusEachParticipant{participantNo}.data{2,colNum} = zeros(size(stimulusEachParticipant{participantNo}.data{1,colNum}));
        stimulusEachParticipant{participantNo}.data{3,colNum} = zeros(size(stimulusEachParticipant{participantNo}.data{1,colNum}));
    end
end

audioOnsetFilepaths = {'./datasets/AudioOnsetTimings/AppleOrange_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/BedCouch_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/BeeWasp_AudioOnsetTiming.csv','./datasets/AudioOnsetTimings/BusTrain_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CarBus_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CarrotPotato_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/CatDog_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/ChickenPork_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/FootballRugby_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/GoldSilver_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/HouseApartment_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/MovieBook_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/TshirtShirt_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/UniversitySchool_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/WaterMilk_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/RainSnow_AudioOnsetTiming.csv', './datasets/AudioOnsetTimings/TelevisionSmartphone_audioOnsetTiming.csv'};                                                                                                                                                                                                                                                                                                                                                                                                                                               

% Read in MATLAB audio files  
numFiles = length(audioOnsetFilepaths);
arrayOfTables = {1,length(audioOnsetFilepaths)};
for i = 1:numFiles
    
    arrayOfTables{i} = readtable(audioOnsetFilepaths{i}, 'ReadVariableNames', false);

end

disp('FINISHED SECTION I: Read in clean EEG data and processed audio onset files');

%% ************************************************* 3) BY SENTENCE ANALYSIS **************************************************************

%% METHOD ONE - CUTTING DATA OFF TRIALS THAT ARE TOO LONG (LONGER THAN SHORTEST TRIAL) 

%% 3.1) ERP of the sentence - method one - cutting off data from trials that are longer than the shorter trial

% Find the shortest trial for both participants and set the desired dimesions to be the size of the smallest trial
desiredDim_Short = cell(1, numParticipants);
for participantNo = 1:numParticipants
    shortestTrialData = EEGDataEachParticipant_ShortTrial{participantNo}.data{1};
    for trialNo = 2:nTrials
    
        shortestTrial = length(shortestTrialData);
        nextEEGData = length(EEGDataEachParticipant_ShortTrial{participantNo}.data{trialNo});

        if (nextEEGData < shortestTrial)
            shortestTrialData = EEGDataEachParticipant_ShortTrial{participantNo}.data{trialNo};
        end 
    end
    
    if (participantNo == 1)
        desiredDim_Short{participantNo} = size(shortestTrialData);
    elseif (participantNo == 2)
        desiredDim_Short{participantNo} = size(shortestTrialData);
    end
end

% Remove data from matrices so that they are all the same dimensions as the smallest 
for participantNo = 1:numParticipants
    for trialNo = 1:nTrials

        current_size = size(EEGDataEachParticipant_ShortTrial{participantNo}.data{trialNo});

        % Remove rows if necessary
        if current_size(1) > desiredDim_Short{participantNo}(1)
            EEGDataEachParticipant_ShortTrial{participantNo}.data{trialNo}(desiredDim_Short{participantNo}(1)+1:end,:) = [];
        end

    end
end
   
preStimulus = 1;
postStimulus = 0.5 * fsDown;

% Particpant one
sumEEGDataShort_P1 = cat(3, EEGDataEachParticipant_ShortTrial{1}.data{:});
avgEEGDataShort_P1 = mean(sumEEGDataShort_P1, 3);

% Plots go crazy w/ baselining
% baselineData_P1 = avgEEGDataShort_P1(preStimulus:postStimulus, 1:64);
% baselineVoltage_P1 = mean(baselineData_P1, 1);
% 
% baselinedEEGData_P1 = avgEEGDataShort_P1 - baselineVoltage_P1;

% Participant two
sumEEGDataShort_P2 = cat(3, EEGDataEachParticipant_ShortTrial{2}.data{:});
avgEEGDataShort_P2 = mean(sumEEGDataShort_P2, 3);

% Plots go crazy w/ baselining
% baselineData_P2 = avgEEGDataShort_P2(preStimulus:postStimulus, 1:64);
% baselineVoltage_P2 = mean(baselineData_P2, 1);
% 
% baselinedEEGData_P2 = avgEEGDataShort_P2 - baselineVoltage_P2;

allParticipant_ERP_ShortTrial = (avgEEGDataShort_P1 + avgEEGDataShort_P2)/2;

disp('FINISHED SECTION 1: Shortened trials that are longer than the shortest trial and calculated ERP');

%% METHOD TWO - PADDING DATA WITH ZEROS FOR TRIALS THAT ARE TOO SHORT (SHORTER THAN LONGEST TRIAL).

%% 3.2) ERP of the sentence - method 2 - padding any trials that are shorter than the longest trial

desiredDim_Long = cell(1, numParticipants);
for participantNo = 1:numParticipants
    longestTrialData = EEGDataEachParticipant_LongTrial{participantNo}.data{1};
    for trialNo = 2:nTrials
    
        longestTrial = length(longestTrialData);
        nextEEGData = length(EEGDataEachParticipant_LongTrial{participantNo}.data{trialNo}); 

        if (nextEEGData > longestTrial)
            longestTrialData = EEGDataEachParticipant_LongTrial{participantNo}.data{trialNo};
        end 
    end
    
    if (participantNo == 1)
        desiredDim_Long{participantNo} = size(longestTrialData);
    elseif (participantNo == 2)
        desiredDim_Long{participantNo} = size(longestTrialData);
    end
end

% Add zero padding to the matrices so that they are all the same dimensions as the largest 
for participantNo = 1:numParticipants
    for trialNo = 1:nTrials

        current_size = size(EEGDataEachParticipant_LongTrial{participantNo}.data{trialNo});

        % Add zero padding to rows if necessary
        if current_size(1) < desiredDim_Long{participantNo}(1)
            EEGDataEachParticipant_LongTrial{participantNo}.data{trialNo} = padarray(EEGDataEachParticipant_LongTrial{participantNo}.data{trialNo},...
            [desiredDim_Long{participantNo}(1)-current_size(1) 0],0,'post');
        end
    end
end

% Participant one
sumEEGDataLong_P1 = cat(3, EEGDataEachParticipant_LongTrial{1}.data{:});
avgEEGDataLong_P1 = mean(sumEEGDataLong_P1, 3);

% Plots go crazy w/ baselining
% baselineData_P1 = avgEEGDataLong_P1(preStimulus:postStimulus, 1:64);
% baselineVoltage_P1 = mean(baselineData_P1, 1);
% 
% baselinedEEGData_P1 = avgEEGDataLong_P1 - baselineVoltage_P1;

% Participant two
sumEEGDataLong_P2 = cat(3, EEGDataEachParticipant_LongTrial{2}.data{:});
avgEEGDataLong_P2 = mean(sumEEGDataLong_P2, 3);

% Plots go crazy w/ baselining
% baselineData_P2 = avgEEGDataLong_P2(preStimulus:postStimulus, 1:64);
% baselineVoltage_P2 = mean(baselineData_P2, 1);
% 
% baselinedEEGData_P2 = avgEEGDataLong_P2 - baselineVoltage_P2;

allParticipant_ERP_LongTrial = (avgEEGDataLong_P1 + avgEEGDataLong_P2)/numParticipants;

disp('FINISHED SECTION 2: Lengthening trials that are shorter than the longest trial by zero padding and calculating ERP');

%% ******************* 3) PLOT ALL DATA TOGETHER IN TWO FIGURES - ONE FOR TRIAL CUTTING, ONE FOR TRIAL PADDING *************************

% ------------------------- SHORT TRIAL PLOTS ---------------------

time_axis_short = (0:size(allParticipant_ERP_ShortTrial,1)-1)/fsDown*1000;

% Setup figure grid layout
figure(1);
t1 = tiledlayout(2,4);
t1.Title.String = 'Figures: ERP, GFP and topographies of the word onset for trial reduction';
t1.Title.FontWeight = 'bold';

% ERP
nexttile;
plot(time_axis_short, allParticipant_ERP_ShortTrial);
xlim([time_axis_short(1),time_axis_short(end)]);
title('ERP of Sentence (avg) - Trial Reduction');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

% GFP
nexttile;
gfp_shortTrials = sqrt(mean(allParticipant_ERP_ShortTrial.^2,2));
% plot(gfp_shortTrials);
plot(time_axis_short, gfp_shortTrials);
xlim([time_axis_short(1),time_axis_short(end)]);
xlabel('Time (ms)');
ylabel('Global Field Power (μV)');
title('Global field power for reduced trial length sentence ERP');

% Topographies
[peaks, peakLocations] = findpeaks(gfp_shortTrials);

nexttile;
topoplot(allParticipant_ERP_ShortTrial(21,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_short(21))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_ShortTrial(58,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_short(58))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_ShortTrial(80,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_short(80))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_ShortTrial(105,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_short(105))), 'ms']);

nexttile;
topoplot(mean(allParticipant_ERP_ShortTrial(618:738,:)), chanlocs);
title(['Topography word onset ERP from ', num2str(round(time_axis_short(618))), 'ms - ', num2str(round(time_axis_short(738))), 'ms']);

nexttile;
topoplot(mean(allParticipant_ERP_ShortTrial(930:1142,:)), chanlocs);
title(['Topography word onset ERP from ', num2str(round(time_axis_short(930))), 'ms - ', num2str(round(time_axis_short(1142))), 'ms']);

% ------------------------- LONG TRIAL PLOTS ---------------------------

time_axis_long = (0:size(allParticipant_ERP_LongTrial,1)-1)/fsDown*1000;

figure(2);
t2 = tiledlayout(2,4);
t2.Title.String = 'Figures: ERP, GFP and topographies of the word onset for trial lengthen';
t2.Title.FontWeight = 'bold';

% ERP
nexttile;
plot(time_axis_long, allParticipant_ERP_LongTrial);
xlim([time_axis_long(1),time_axis_long(end)]);
title('ERP of Sentence (avg) - Trial Lengthen');
xlabel('Time-latency (ms)')
ylabel('Magnitude (a.u.)')

% GFP
nexttile;
gfp_longTrials = sqrt(mean(allParticipant_ERP_LongTrial.^2,2)); 
plot(time_axis_long, gfp_longTrials);
% plot(gfp_longTrials);
xlim([time_axis_long(1),time_axis_long(end)]);
xlabel('Time (ms)');
ylabel('Global Field Power (μV)');
title('Global field power for lengthened trial length sentence ERP');

% Topographies
nexttile;
topoplot(allParticipant_ERP_LongTrial(21,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_long(21))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_LongTrial(103,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_long(103))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_LongTrial(170,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_long(170))), 'ms']);

nexttile;
topoplot(allParticipant_ERP_LongTrial(590,:), chanlocs);
title(['Topography of word onset ERP at ', num2str(round(time_axis_long(590))), 'ms']);

nexttile;
topoplot(mean(allParticipant_ERP_LongTrial(1098:1142,:)), chanlocs);
title(['Topography word onset ERP from ', num2str(round(time_axis_long(1098))), 'ms - ', num2str(round(time_axis_long(1142))), 'ms']);

nexttile;
topoplot(mean(allParticipant_ERP_LongTrial(993:1142,:)), chanlocs);
title(['Topography word onset ERP from ', num2str(round(time_axis_long(993))), 'ms - ', num2str(round(time_axis_long(1142))), 'ms']);

disp('FINISHED SCRIPT');


