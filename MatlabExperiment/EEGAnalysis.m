sca;
close all;     
clear;

% butterworth for low pass filterings
% filter before epoching

fileName = ['./ExperimentResults/EEGExperiment_Participant1/EEGDataResults/' , 'subject1_2.bdf'];
[EEG_raw, trigs] = read_bdf(fileName);
fsEEG = 512;

% Save the EEG data in one variable
EEG_raw = EEG_raw(1:66,:); % 64 elec + 2 mastoids

BUTTON_PRESS_TRIG = 3;
STIMULUS_ONSET_TRIG = 1;

% Save the triggers in another variable
trigs=trigs-min(trigs);
trigs(trigs>256) = trigs(trigs>256)-min(trigs(trigs>256));
dtrig = diff(trigs); 
dtrig(dtrig < 0) = 0; %remove any 0 triggers 
% To do: Chunk trials in cell or in a padded matrix by stimulus onset.
% Create variable that stores button click relative to the start of each epoch.
% Get the ERP to the word - for each epoch 

stimulusOnsets = find(dtrig == STIMULUS_ONSET_TRIG);
buttonPresses = find(dtrig == BUTTON_PRESS_TRIG);

nTrials = length(stimulusOnsets); % One stimulus onset per trial so this stimuluOnsets will contains the number of trials

% A trial length is defined as the length from when the audio beings
% (stimulus onset) to the end of the audio (audio length)

sounds = {'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/MB_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_11.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/RS_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/US_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSS_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/GS_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_12.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_14.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CB_M1_3.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/FR_M2_10.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_13.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/TSP_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M1_8.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_4.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CP_M1_5.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M2_16.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BT_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BW_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CHP_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M2_15.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/BC_M1_2.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/WM_M1_6.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/CD_M1_7.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M1_1.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/HA_M2_9.wav', './EEGExperimentData/CompletedRecordingsEEG/AllRecordings/AO_M2_16.wav'};

% Getting trial length and set up stimulus structure
clear stim
trialDurSec = zeros(1, nTrials);
for trialNo = 1:nTrials
    [audio, fsStimulus] = audioread(sounds{trialNo});
    trialDurSec(trialNo) = size(audio,1)/fsStimulus;
    stim.data{1,trialNo} = resample(abs(hilbert(audio(:,1))),fsDown,fsStimulus);
end
stim.fs = fsDown;

% Filtering EEG data
bandpassFilterRange = [0.01,40];
EEG_raw = EEG_raw';
hd = getLPFilt(fsEEG,bandpassFilterRange(2));
EEG_raw = filtfilthd(hd,EEG_raw(1:1000,:));
hd = getHPFilt(fsEEG,bandpassFilterRange(1));
EEG_raw = filtfilthd(hd,EEG_raw(1:1000,:));


% Set up EEG structure in CND format
clear eeg
eeg.data = {};
for trialNum = 1:nTrials    
    startTrial = stimulusOnsets(trialNum);
    endTrial = startTrial + round(trialDurSec(trialNum) * fsEEG) - 1;
    
    eeg.data{end+1} = EEG_raw(startTrial:endTrial,1:64);
    eeg.extChan{1}.data{end+1} = EEG_raw(startTrial:endTrial,65:66);
 
end



