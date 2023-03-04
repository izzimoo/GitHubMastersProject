import re
import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter
import numpy as np 

# # --------------------- FUNCTIONS ---------------------------------------- #

def indexGivenValue(value, array):
    for idx, val in enumerate(array):
        if(value == val):           
            return(idx)

# ------------------------------------------------------------------------ #

# ------------ READ IN DATA GOTTEN FROM PARTICIPANTS --------------------- #

#resultsBehavioural1 = pd.read_csv('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/John/DecisionsAndTimings.csv')
#resultsBehavioural2 = pd.read_csv('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Charbel/DecisionsAndTimings.csv')
resultsBehavioural3 = pd.read_csv('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/DecisionsAndTimings.csv')

#resultsEEG1 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant1Results/DecisionsAndTimings.csv')
#resultsEEG2 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/DecisionsAndTimings.csv')
#resultsEEG3 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/DecisionsAndTimings.csv')
#resultsEEG4 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/DecisionsAndTimings.csv')
#resultsEEG5 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/DecisionsAndTimings.csv')
resultsEEG6 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/DecisionsAndTimings.csv')

participantNum = 6

print(len(resultsEEG6))

participantButtonClickTiming = resultsEEG6.iloc[:,1] 
participantLeftButtonClicks = resultsEEG6.iloc[:,0]

# ---------------------------------------------------------------------------- #

#Setup the number of trials in the experiment, change out this number as the number of trials changes in Matlab code

trialNumber = range(1, 273, 1)

# ------------------- CREATE REACTION TIME PER TRIAL PLOT ---------------------- #
fig, ax = plt.subplots()

ax.bar(trialNumber, participantButtonClickTiming) #marker='o')

ax.set_xlabel("Trial Number")
ax.set_ylabel("Reaction Time (Seconds)")
ax.set_title("Time of reaction for each trial")

# Choose a saving location depending on the participant
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/ResultsFigures/fig1.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Charbel/ResultsFigures/fig1.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/John/ResultsFigures/fig1.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/ResultsFigures/fig1.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/ResultsFigures/fig1.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/ResultsFigures/fig1.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/ResultsFigures/fig1.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/ResultsFigures/fig1.png')
plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/ResultsFigures/fig1.png')

# ---------------------------- CODE TO CREATE THE AUDIO ONSET FILES ---------------------------------#

# AudioOnset files = This code reads in the audio length and silence length files generated in Matlab.
# It then iterates over these values and multiplies them by 48000 which is the frequency value of the files
# (FS) used in Matlab to turn the integer values between the audios into seconds - this gives back files that
# details the exact time in seconds that each word starts in each audio taking into account the length of the 
# word and the silence inbetween words.

# Read in the audio values to a dataframe
AO_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/AppleOrange_AudioLength.csv')
BC_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/BedCouch_AudioLength.csv')
BW_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/BeeWasp_AudioLength.csv')
BT_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/BusTrain_AudioLength.csv')
CB_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/CarBus_AudioLength.csv')
CP_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/CarrotPotato_AudioLength.csv')
CD_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/CatDog_AudioLength.csv')
CHP_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/ChickenPork_AudioLength.csv')
#COP_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/CowPig_AudioLength.csv')
#FG_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/FlowerGrass_AudioLength.csv')
FR_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/FootballRugby_AudioLength.csv')
GS_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/GoldSilver_AudioLength.csv')
HA_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/HouseApartment_AudioLength.csv')
MB_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/MovieBook_AudioLength.csv')
TSS_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/TshirtShirt_AudioLength.csv')
US_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/UniversitySchool_AudioLength.csv')
WM_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/WaterMilk_AudioLength.csv')
RS_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/RainSnow_AudioLength.csv')
TSP_seqAudio = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Audios/TelevisionSmartphone_AudioLength.csv')

# Read in the silence variables to a dataframe 
AO_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/AppleOrange_SilenceLength.csv')
BC_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/BedCouch_SilenceLength.csv')
BW_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/BeeWasp_SilenceLength.csv')
BT_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/BusTrain_SilenceLength.csv')
CB_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/CarBus_SilenceLength.csv')
CP_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/CarrotPotato_SilenceLength.csv')
CD_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/CatDog_SilenceLength.csv')
CHP_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/ChickenPork_SilenceLength.csv')
#COP_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/CowPig_SilenceLength.csv')
#FG_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/FlowerGrass_SilenceLength.csv')
FR_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/FootballRugby_SilenceLength.csv')
GS_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/GoldSilver_SilenceLength.csv')
HA_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/HouseApartment_SilenceLength.csv')
MB_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/MovieBook_SilenceLength.csv')
TSS_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/TshirtShirt_SilenceLength.csv')
US_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/UniversitySchool_SilenceLength.csv')
WM_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/WaterMilk_SilenceLength.csv')
RS_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/RainSnow_SilenceLength.csv')
TSP_seqSilence = pd.read_csv('./ExperimentData-ForEEG/LengthSequencesEEG/Silences/TelevisionSmartphone_SilenceLength.csv')

# FS = 48000 to multiply by silence like in Matlab code: (round(fs*randNo(1)),size(f1,2)) where randNo is the silences_seq(x) column

Fs = 48000
audioOnsetSeq1=[]; audioOnsetSeq2=[]; audioOnsetSeq3=[]; audioOnsetSeq4=[]; audioOnsetSeq5=[]; audioOnsetSeq6=[]; audioOnsetSeq7=[]; audioOnsetSeq8=[]
audioOnsetSeq9=[]; audioOnsetSeq10=[]; audioOnsetSeq11=[]; audioOnsetSeq12=[]; audioOnsetSeq13=[]; audioOnsetSeq14=[]; audioOnsetSeq15=[]; audioOnsetSeq16=[]
audioOnsets = []

for i, array in (zip(range(16), [audioOnsetSeq1, audioOnsetSeq2, audioOnsetSeq3, audioOnsetSeq4, audioOnsetSeq5, audioOnsetSeq6, audioOnsetSeq7, audioOnsetSeq8,
              audioOnsetSeq9, audioOnsetSeq10, audioOnsetSeq11, audioOnsetSeq12, audioOnsetSeq13, audioOnsetSeq14, audioOnsetSeq15, audioOnsetSeq16])):
   
    # Change out the dataframe when you want to make audio onset file for different sequences 
    audio = TSP_seqAudio.iloc[i]
    randNo = TSP_seqSilence.iloc[i]

    audioOneOnset = 0.5*Fs
    audioTwoOnset = audioOneOnset + audio[0]*Fs + (randNo[0]*Fs)
    audioThreeOnset = audioTwoOnset + audio[1]*Fs + (randNo[1]*Fs)
    audioFourOnset = audioThreeOnset + audio[2]*Fs + (randNo[2]*Fs)
    audioFiveOnset = audioFourOnset + audio[3]*Fs + (randNo[3]*Fs)
    audioSixOnset = audioFiveOnset + audio[4]*Fs + (randNo[4]*Fs)
    audioSevenOnset = audioSixOnset + audio[5]*Fs + (randNo[5]*Fs)
    audioEightOnset = audioSevenOnset + audio[6]*Fs + (randNo[6]*Fs)
    endOfAudio = audioEightOnset + audio[7]*Fs + (randNo[7]*Fs)

    array.append(audioOneOnset/Fs)
    array.append(audioTwoOnset/Fs)
    array.append(audioThreeOnset/Fs) 
    array.append(audioFourOnset/Fs)
    array.append(audioFiveOnset/Fs)
    array.append(audioSixOnset/Fs)
    array.append(audioSevenOnset/Fs)
    array.append(audioEightOnset/Fs)
    array.append(endOfAudio/Fs)

# Put these audio onset values into a CSV file for easy reading 
array_toDict = {'Sequence1 Audio Onsets': audioOnsetSeq1, 'Sequence2 Audio Onsets': audioOnsetSeq2, 'Sequence3 Audio Onset': audioOnsetSeq3, 'Sequence4 Audio Onsets': audioOnsetSeq4,
        'Sequence5 Audio Onsets': audioOnsetSeq5, 'Sequence6 Audio Onsets': audioOnsetSeq6, 'Sequence7 Audio Onset': audioOnsetSeq7, 'Sequence8 Audio Onsets': audioOnsetSeq8,
        'Sequence9 Audio Onsets': audioOnsetSeq9, 'Sequence10 Audio Onsets': audioOnsetSeq10, 'Sequence11 Audio Onset': audioOnsetSeq11, 'Sequence12 Audio Onsets': audioOnsetSeq12,
        'Sequence13 Audio Onsets': audioOnsetSeq13, 'Sequence14 Audio Onsets': audioOnsetSeq14, 'Sequence15 Audio Onset': audioOnsetSeq15, 'Sequence16 Audio Onsets': audioOnsetSeq16 }

df = pd.DataFrame(array_toDict, index=['Audio1 Onset', 'Audio2 Onset', 'Audio3 Onset', 'Audio4 Onset', 'Audio5 Onset', 'Audio6 Onset', 'Audio7 Onset', 'Audio8 Onset', 'Audio Length']) 

# Change files name when you want to make audio onset files for different sequences 
#df.to_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/TelevisionSmartphone_AudioOnsetTiming.csv')

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- #

# ----------------------- ANALYSIS CODE BEGINS FOR EACH PARTICIPANTS DATA ---------------------------------------

# Change file when wanting different participants results
#file = open("BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
#file = open("BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")

# Participant 1
# file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
#Participant 2
#file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
# Participant 3
#file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
# Participant 4
#file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
# Participant 5
#file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")
# Participant 6
file = open("ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/Stimuli/ArrayOfStimuliInRandomOrder.txt", "r")

# Break string from txt file up using comma delimeter
contents = file.read(); contentsToList = contents.split(","); file.close() 

orderOfAudios=[]
for audioName in contentsToList: 
    # Turn the string txt file into a list for easy manipulation
    orderOfAudios.append(re.sub("'", "", audioName)) # Remove the double quotation marks from the string

# Make a copy of the order of audios list to have after the above one is edited to remove the missed sequences 
orderOfAudiosCopy=[]
for audioNameCopy in contentsToList: 
    orderOfAudiosCopy.append(re.sub("'", "", audioNameCopy)) 

sequenceName=[]; sequenceNum=[]; meaningNum=[]
for entry in orderOfAudios:
    
    withPath = str(entry).split(('_'))[0] # Audio is in the form './CompletedRecordings/CarBus/CB_M1_3.wav'
    
    # Use this for EEG analysis
    seqNameTemp = withPath.split('/', 3)[3]
    sequenceName.append((seqNameTemp).split('/')[1]) # Splits the above string to obtain 'CB' and appends it to a list 

    #Use this for behavioural analysis
    #sequenceName.append((withPath).split('/', 3)[3]) # Splits the above string to obtain 'CB' and appends it to a list 

    seqNoWithWav = str(entry).split('_', 2)[2] # Splits the ./Completed... string to obtain '3.wav'
    seqNo = str(seqNoWithWav).split('.')[0] # Removes the .wav to obtain sequence number '3'
    sequenceNum.append(seqNo) # Appened sequence numbers to a list 

    meaningNum.append(str(entry).split('_', 2)[1]) # Splits the ./Completed... string to obtain the meaning 'M1' and appends to list

# READ IN THE AUDIO ONSET FILES FOR USE IN DATA ANALYSIS 

# AO_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/AppleOrange_AudioOnsetTiming.csv')
# BC_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/BedCouch_AudioOnsetTiming.csv')
# BW_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/BeeWasp_AudioOnsetTiming.csv')
# BT_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/BusTrain_AudioOnsetTiming.csv')
# CB_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/CarBus_AudioOnsetTiming.csv')
# CP_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/CarrotPotato_AudioOnsetTiming.csv')
# CD_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/CatDog_AudioOnsetTiming.csv')
# CHP_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/ChickenPork_AudioOnsetTiming.csv')
# COP_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/CowPig_AudioOnsetTiming.csv')
# FG_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/FlowerGrass_AudioOnsetTiming.csv')
# FR_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/FootballRugby_AudioOnsetTiming.csv')
# GS_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/GoldSilver_AudioOnsetTiming.csv')
# HA_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/HouseApartment_AudioOnsetTiming.csv')
# MB_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/MovieBook_AudioOnsetTiming.csv')
# TSS_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/TshirtShirt_AudioOnsetTiming.csv')
# US_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/UniversitySchool_AudioOnsetTiming.csv')
# WM_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/WaterMilk_AudioOnsetTiming.csv')
# RS_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/RainSnow_AudioOnsetTiming.csv')
# TSP_audioOnsets = pd.read_csv('./BehaviouralExperimentData-PreEEG/AudioOnsetTimings/TelevisionSmartphone_AudioOnsetTiming.csv')

AO_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/AppleOrange_AudioOnsetTiming.csv')
BC_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/BedCouch_AudioOnsetTiming.csv')
BW_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/BeeWasp_AudioOnsetTiming.csv')
BT_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/BusTrain_AudioOnsetTiming.csv')
CB_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/CarBus_AudioOnsetTiming.csv')
CP_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/CarrotPotato_AudioOnsetTiming.csv')
CD_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/CatDog_AudioOnsetTiming.csv')
CHP_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/ChickenPork_AudioOnsetTiming.csv')
#COP_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimings/CowPig_AudioOnsetTiming.csv')
#FG_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimings/FlowerGrass_AudioOnsetTiming.csv')
FR_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/FootballRugby_AudioOnsetTiming.csv')
GS_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/GoldSilver_AudioOnsetTiming.csv')
HA_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/HouseApartment_AudioOnsetTiming.csv')
MB_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/MovieBook_AudioOnsetTiming.csv')
TSS_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/TshirtShirt_AudioOnsetTiming.csv')
US_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/UniversitySchool_AudioOnsetTiming.csv')
WM_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/WaterMilk_AudioOnsetTiming.csv')
RS_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/RainSnow_AudioOnsetTiming.csv')
TSP_audioOnsets = pd.read_csv('./ExperimentData-ForEEG/AudioOnsetTimingsEEG/TelevisionSmartphone_AudioOnsetTiming.csv')


# FUNCTION THAT TAKES IN THE AUDIO ACRONYM AND RETURNS THE AUDIO ONSET DATAFRAME TO USE e.g. input = AO, output = AO audio onset file
def returnDF(audioVal):
    if (audioVal == 'HA'):
        dataframe = HA_audioOnsets
    if (audioVal == 'AO'):
        dataframe = AO_audioOnsets
    if (audioVal == 'BC'):
        dataframe = BC_audioOnsets
    if (audioVal == 'BT'):
        dataframe = BT_audioOnsets
    if (audioVal == 'BW'):
        dataframe = BW_audioOnsets
    if (audioVal == 'CB'):
        dataframe = CB_audioOnsets
    if (audioVal == 'CD'):
        dataframe = CD_audioOnsets
    if (audioVal == 'CHP'):
        dataframe = CHP_audioOnsets
#     if (audioVal == 'COP'):
#         dataframe = COP_audioOnsets
    if (audioVal == 'CP'):
        dataframe = CP_audioOnsets
#     if (audioVal == 'FG'):
#         dataframe = FG_audioOnsets
    if (audioVal == 'FR'):
        dataframe = FR_audioOnsets
    if (audioVal == 'GS'):
        dataframe = GS_audioOnsets
    if (audioVal == 'MB'):
        dataframe = MB_audioOnsets
    if (audioVal == 'TSS'):
        dataframe = TSS_audioOnsets
    if (audioVal == 'US'):
        dataframe = US_audioOnsets
    if (audioVal == 'WM'):
        dataframe = WM_audioOnsets
    if (audioVal == 'RS'):
        dataframe = RS_audioOnsets
    if (audioVal == 'TSP'):
        dataframe = TSP_audioOnsets

    return dataframe


# -------- PREPPING DATA TO DETERMINE HOW ACCURATE A PARTICIPANT IS - OBTAINING CORRECT ANSWER TO EACH SEQUENCE FOR COMPARISON ---------- #

lines=[]

# Choose a file depending on the participant data you are analysing
#with open('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Stimuli/CorrectAnswersSwitch.txt') as myFile:
#with open('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/Stimuli/CorrectAnswersSwitch.txt') as myFile: 

# Participant 1
#with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/Stimuli/CorrectAnswersSwitch.txt') as myFile: 
# Participant 2 
#with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/Stimuli/CorrectAnswersSwitch.txt') as myFile: 
# Participant 3
#with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/Stimuli/CorrectAnswersSwitch.txt') as myFile: 
# Participant 4
#with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/Stimuli/CorrectAnswersSwitch.txt') as myFile: 
# Participant 5
#with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/Stimuli/CorrectAnswersSwitch.txt') as myFile: 
# Participant 6
with open('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/Stimuli/CorrectAnswersSwitch.txt') as myFile: 


    for myLine in myFile:
        lines.append(myLine) # Append each line in the txt file to an array called lines

# This file is arranged as a case statement such that: case: 0 answer = 1. 
# The values we want are on every second line, we only want answer, not case.
getNextLine = 0; getLine =0; answersGiven=[]
for getLine in range(len(lines)):
    getLine = getNextLine # Set get line to next line
    if (getLine == 544): # Indexing error if this is not included (need to change this number if number of trials increases)
        break
    getNextLine = getLine+1 # Get the next line 
    answersGiven.append(lines[getNextLine]) # This array contains: meaning=1;, meaning=2;, meaning=1;
    getNextLine+=1 # Adds 1 to the getNextLine iterator so it is always one line ahead of the getLine iterator

# Now go through each line in the answersGiven array which looks as so: meaning=1;, meaning=2;
# Break at the equal sign to obtain the following: ['meaning=', '2;']
splitIt = []
for answer in answersGiven:
    splitIt.append(answer.split('=')) 

# Now we want to go through this list: ['meaning=', '2;'] and get the meaning number from it 
withSemiColon = [] 
for answerSemiColon in splitIt:
    withSemiColon.append(answerSemiColon[1]) # Get the first element in the array which is '2;'

# Finally remove the semi colon from the answer to obtain a list of the correct answers to each sequence
answerRemovedSemiColon = []
for withSemiC in withSemiColon:
    answerRemovedSemiColon.append((withSemiC.split(';')[0]).strip()) 

print("The following two numbers should be the same:")
print("Length of participant answers array before removing the missed sequence data:", len(participantLeftButtonClicks))   
print("Length of the actual answers array before removing the missed sequence data:", len(answerRemovedSemiColon))    
print('\n')


# --------------- ANALYSIS TO DETERMINE WHAT WORD IN EACH SEQUENCE A DECISION WAS MADE ON ------------------ #

countList = [0]*9 # Initalise a list containing nine zeros
missedSequenceIdentifiers = []; gottenQuicklyIndetifiers = []; sequencesRemoveFromAccuracy = []

print("STARTING ANALYSIS OF BUTTON PRESSES VERSUS PLACE IN SEQUENCE")
for audioAcro, meaningNo, seqOrder, buttonTiming, stimuliNumber in zip(sequenceName, meaningNum, sequenceNum, participantButtonClickTiming, range(len(orderOfAudios))):
    
#     if (meaningNo == 'M2'):

#         # Add 8 to the index if the meaning is 2 to get the meaning 2 sequence audio onsets 

#         dataframe = returnDF(audioAcro) # Pass in sequence acronym to obtain the correct audio onset file
#         audioOnsetColumn = dataframe.iloc[:,4+int(seqOrder)][0:9] 
#         #word1 = dataframe.iloc[:,8+int(seqOrder)][0:9]

    #else: 

    dataframe = returnDF(audioAcro) # Pass in sequence acronym to obtain the correct audio onset file
    audioOnsetColumn = dataframe.iloc[:,int(seqOrder)][0:9]

    print("Audio onset timing column\n", audioOnsetColumn) # Column of timings associated with the current sequence, ignore index printed with column
    print(audioAcro, meaningNo, seqOrder) # Prints the sequence's constituents i.e. AO, M1, 3 = AO_M1_3.wav
    
    for timings, i in zip(audioOnsetColumn, range(len(audioOnsetColumn))):
        if (buttonTiming < timings): # If the decision time is less than the start time of a word in the audio then the decision happened at this word
            
            # Here i will always be >= 1. First word starts at 0.5s, no decisions will be made before this, so the first 
            # iteration of i (i=0) will skip all of the if statements, then if it comes back and goes into this if statement
            # then that is because the decision time was less than that of the start time from word 2 and onwards

            print('Button pressed at: ' + str(buttonTiming) + ' which is on word ' + str(i))
            countList[i] = countList[i] + 1 # Add 1 to the count on the ith word

            if(i == 3):
                print("hi")

            if ((i == 1) or (i == 2)):
                tempList = []; tempList.append(audioAcro); tempList.append(meaningNo); tempList.append(seqOrder)

                if (((int(participantLeftButtonClicks[stimuliNumber]) == 1) and (answerRemovedSemiColon[stimuliNumber] == '1')) or ((int(participantLeftButtonClicks[stimuliNumber]) == 0) and (answerRemovedSemiColon[stimuliNumber] == '2'))):
                    gottenQuicklyIndetifiers.append(stimuliNumber)
            break

        if (buttonTiming == timings):

            # If the timings are exactly equal, then the decision wasn't made on the word before but instead on
            # the word itself so instead append i+1 not i
            print('Button pressed at: ' + str(buttonTiming) + ' which is on word ' + str(i+1))
            countList[i+1] = countList[i+1] + 1 # Add 1 to the count on the i+1 th word
            break

        if ((buttonTiming > audioOnsetColumn[7]) and (buttonTiming < audioOnsetColumn[8])):

            # If the decision time is larger than the start time of audio 8 but shorter than the 
            # total length of the audio, then the decision was made on word 8.

            print('Button pressed at: ' + str(buttonTiming) + ' which is on word ' + str(8))
            countList[8] = countList[8] + 1 # Add 1 to the count on word 8
            break

        if (buttonTiming > audioOnsetColumn[8]):

            # If the decision time is greater than that of the audio, then the participant didn't make a decision
            # before the end of the audio and hence we call this a missed sequence as we will not see a decision
            # threshold in the EEG

            print('Missed sequence, guessed after word 8, at: ' + str(buttonTiming))
            print('Button pressed at: ' + str(buttonTiming) + ' which is on word ' + str(i)) # i is always 0 here as it enters this if loop
            # on the first iteration as it will not go into any of the other if loops due to it being longer than the entire audio length

            countList[0] = countList[0] + 1 # Count for missed sequences occurs at position 0 of the count array

            tempList = []; tempList.append(audioAcro); tempList.append(meaningNo); tempList.append(seqOrder)
            missedSequenceIdentifiers.append(tempList) # Add the acronym, meaning number and sequence number of the missed sequence to an array
            sequencesRemoveFromAccuracy.append(stimuliNumber) # Add the index of the missed sequence in the audio array to an array so they can be removed
            # from accuracy calculations later
            break
   
    print('****************************************************************************************************************')

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------- #

#print(missedSequenceIdentifiers)

print('\n')
print("Data Analysis Statements:")

print("Sequences that were missed and hence need to be removed from the accuracy rating:")
sortThisList=[]
for entry in sequencesRemoveFromAccuracy:
    sortThisList.append(orderOfAudios[entry])
print(*sorted(sortThisList), sep='\n') # Print a sorted, newline seperated list for easy analysis
print('\n')

# Getting a dictionary count of the most common acronyms (apple, orange car,bus house,apartment etc.) that had sequences that were missed
acrosOfMissed=[]
for nestedList in missedSequenceIdentifiers:
    acrosOfMissed.append(nestedList[0]) # Append the acronyms of missed sequences to determine which pairs of meanings are often missed

print("Dictionary of acronyms for missed sequences")
countDict = Counter(acrosOfMissed) # Make this into a dictionary and count the number of items
print(countDict) # Prints a dictionary of acronym and count: {AO:2, COP:4} so it is easy to see which sequences are often missed
print('\n')


print("Number of decisions made on each word, missed sequences - word 8")
print(countList)
print('\n')

# ---------------- MAKE FIGURE FOR NUMBER OF DECISION MADE ON EACH WORD ------------------------- #

x_axis = ['Missed Seq.', '1', '2', '3', '4', '5', '6', '7', '8']
y_axis = countList

fig2, ax2 = plt.subplots()

# Change title of this plot - check academic papers.
ax2.bar(x_axis, y_axis, color='#3C89AF')
ax2.set_xlabel("Word")
ax2.set_ylabel("Number of decision made on word")
ax2.set_title("Number of decisions made on each word")

# Get labels on top of bars in the chart representing the data
for bar in ax2.patches: # Gets the bars on the chart
    width = bar.get_width(); height = bar.get_height() # Gets the width and height of each bar
    x, y = bar.get_xy() # Get the values represented by the bar (word number and decision count for that word number)
    ax2.annotate(f'{height}', (x + width/2, y + height*1.01), ha='center') # Prints a label on top of the bar displaying the decision number


# Choose a saving location depending on the participant
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/ResultsFigures/fig2.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Charbel/ResultsFigures/fig2.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/John/ResultsFigures/fig2.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/ResultsFigures/fig2.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/ResultsFigures/fig2.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/ResultsFigures/fig2.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/ResultsFigures/fig2.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/ResultsFigures/fig2.png')
plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/ResultsFigures/fig2.png')

# ------------------------------------------------------------------------------------------------------------------------- #

# ---------------------------------- CREATE FIGURE FOR THE PERCENTAGE OF MISSED SEQUENCES ------------------------------------------------ #

fig3, ax3 = plt.subplots()

percentages = [ (countList[0]/sum(countList))*100,  (100 - ((countList[0]/sum(countList))*100)) ]
pieLabels = ['Missed', 'Not Missed']
ax3.set_title('Percentage of Sequences with Decision vs No Decision')
ax3.pie(percentages, labels=pieLabels, autopct='%1.2f%%')

# Choose a saving location depending on the participant
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/ResultsFigures/fig3.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Charbel/ResultsFigures/fig3.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/John/ResultsFigures/fig3.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/ResultsFigures/fig3.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/ResultsFigures/fig3.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/ResultsFigures/fig3.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/ResultsFigures/fig3.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/ResultsFigures/fig3.png')
plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/ResultsFigures/fig3.png')

# ---------------------------------------------------------------------------------------------------- #

# ------ PREPPING DATA TO DETERMINE HOW ACCURATE PARTICIPANT IS - REMOVING MISSED SEQUENCES ---- #

# Need to remove datapoints relating to any missed sequences and ensure the indices from the data still match up

for indexToRemove in sequencesRemoveFromAccuracy: # Remove all data points relating to any missed sequences
    participantLeftButtonClicks = participantLeftButtonClicks.drop(indexToRemove) # Drop from answers given by participant

for delIndex in sorted(sequencesRemoveFromAccuracy, reverse=True): # Sort indices to remove so that the order of the array is not affect by removing indices one by one
    del answerRemovedSemiColon[delIndex] # Remove missed data sequences from correct answers array 
    del orderOfAudios[delIndex] # Remove missed data sequences from the array containing the order of the stimuli presented
        
print("The following two numbers should be the same:")
print("Length of participant answers array after removing the missed sequence data:",len(participantLeftButtonClicks))    
print("Length of correct answers array after removing the missed sequence data:" ,len(answerRemovedSemiColon))   
print('\n')

# ----------------------------- FINAL ANALYSIS TO DETERMINE THE ACCURACY OF THE PARTICIPANT ----------------------------- #

# If statements to determine if the participant got each sequence correcr or not 
# This given answers is based of if the participant pressed the left (ctrl) key or the right key
# If given answer is 1 then it means they pressed the left key, if it is 0 then they pressed the right key 
answerCorrectOrNot = []; incorrectSequences = []; correctSequences=[]
for givenAnswer, actualAnswer, i in zip(participantLeftButtonClicks, answerRemovedSemiColon, range(len(participantLeftButtonClicks))):

    # Left key answers
    if ( (givenAnswer == 1) and (actualAnswer == '1') ): # If participant pressed left key and the answer is meaning 1
        answerCorrectOrNot.append(1) # Append correct to the answer array
        correctSequences.append(i) # Append the index of the sequence to the correct sequences delay

    if ( (givenAnswer == 1) and (actualAnswer == '2') ): # If the participant pressed left key and the answer is meaning 0
        answerCorrectOrNot.append(0) # Append incorrect to the answer array
        incorrectSequences.append(i) # Append the index of the sequence to the incorrect sequences delay

    # Right key answers
    if ( (givenAnswer == 0) and (actualAnswer == '2') ): # If the participant pressed right key and the answer is meaning 2
        answerCorrectOrNot.append(1) # Append correct to the answer array
        correctSequences.append(i) # Append the index of the sequence to the correct sequences delay

    if ( (givenAnswer == 0) and (actualAnswer == '1') ): # If the participant pressed right key and the answer is meaning 1
        answerCorrectOrNot.append(0) # Append incorrect to the answer array
        incorrectSequences.append(i) # Append the index of the sequence to the incorrect sequences delay

# Count up the number of correct and incorrect sequences in the answer array based on whether there is a 1 or a 0
countCorrect=0; countIncorrect=0
for isCorrect in answerCorrectOrNot:
    if (isCorrect == 1):
        countCorrect+=1
    if (isCorrect == 0):
        countIncorrect+=1

print("Number of sequences the participant got correct:", countCorrect)
print("Number of sequences the participant got incorrect:", countIncorrect)
print("Number correct:", countCorrect, "+ number incorrect:", countIncorrect, "+ number of sequences removed:", len(sequencesRemoveFromAccuracy), "should =", len(orderOfAudiosCopy))
# Calculate the final accuracy for the participant 
accuracyStr = "Accuracy of Participant: " + str(round((countCorrect)/(countCorrect + countIncorrect) * 100, 2)) + '%'
accuracyValueForBarChart = round((countCorrect)/(countCorrect + countIncorrect) * 100, 2)
print(accuracyStr)
print('\n')

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------- #

# ------------------------ FINAL PRINT STATEMENTS TO DISPLAY THE CORRECT AND INCORRECT SEQUENCES (AFTER MISSED SEQUENCE REMOVAL) -------------------------------------- #

listToSort1=[]; count1=0
print("The following sequences were gotten correct:")
for entry in correctSequences:
    listToSort1.append(orderOfAudios[entry])
    count1+=1

print(*sorted(listToSort1), sep='\n')
print("Length of list which should equal number stated above for correct sequences", len(listToSort1))
print('\n')
   
listToSort2=[]; count2=0
print("The following sequences were gotten incorrect:")
for entry in incorrectSequences:
    listToSort2.append(orderOfAudios[entry])
    count2+=1
   
print(*sorted(listToSort2), sep='\n')
print("Length of list which should equal number stated above for incorrect sequences", len(listToSort2))
print('\n')

# ------------------------------------------------------------------------------------------------------------- #

# ---------------------- CREATE BAR CHART FOR ALL PARTICIPANTS ACCURACIES AND INACCURACIES (AFTER MISSED SEQUENCE REMOVAL) ------------------------------- #

accuracies = [69.42, 75.44, 66.18] # Accuracies taken from the print statements
inaccuracies = [round((100-69.42),2), round((100-75.44),2), round((100-66.18),2)] # Inaccuracies gotten by 100-accuracies

labels = ['Participant 1', 'Participant 2', 'Participant 3'] # Labels for X axis bar chart

xAxis = np.arange(len(labels)) # Enumerate x axis label values 
fig4, ax4 = plt.subplots()

# Format the bar chart so that there are two bars for each participant - one showing the accuracy percentage and one showing the inaccuracy percentage
ax4.bar(xAxis - 0.2, accuracies, width=0.3, label = 'Percentage Correct', color='#2D9C4F') 
ax4.bar(xAxis + 0.2, inaccuracies, width=0.3, label = 'Percentage Incorrect', color='#F85F45')

plt.xticks(xAxis, labels)

ax4.set_xlabel("Participant")
ax4.set_ylabel("Accuracy (percent %)")
ax4.set_title("Accuracy of each participant", x=0.47)
ax4.legend(bbox_to_anchor=[1.13, 1.14])

for bar in ax4.patches: # Gets the bars on the chart (6 - (2 bars x 3 participants))
    width = bar.get_width(); height = bar.get_height() # Get height and width of bars
    x, y = bar.get_xy() # Gets values for the bars - participant and their accuracy and inaccuracy values
    ax4.annotate(f'{height}', (x + width/2, y + height*1.01), ha='center') # Annotates the accuracy and inaccuracy values on top of the bars in the chart

# Choose a saving location depending on the participant   
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/Ciaran/ResultsFigures/fig4.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/Charbel/ResultsFigures/fig4.png')
#plt.savefig('./BehaviouralExperimentData-PreEEG/ExperimentResults/Participants/First2Behaviourals/John/ResultsFigures/fig4.png')

# ----------------------- BAR CHART FOR ACCURACY OF EEG PARTICIPANTS ---------------------- #

accuracies = [accuracyValueForBarChart] # Accuracies taken from the print statements
inaccuracies = [round((100-accuracyValueForBarChart),2)] # Inaccuracies gotten by 100-accuracies

labels = ['Participant ' + str(participantNum)]

xAxis = np.arange(len(labels)) # Enumerate x axis label values 
fig5, ax5 = plt.subplots()

# Format the bar chart so that there are two bars for each participant - one showing the accuracy percentage and one showing the inaccuracy percentage
ax5.bar(xAxis - 0.2, accuracies, width=0.3, label = 'Percentage Correct', color='#2D9C4F') 
ax5.bar(xAxis + 0.2, inaccuracies, width=0.3, label = 'Percentage Incorrect', color='#F85F45')

plt.xticks(xAxis, labels)

ax5.set_ylabel("Accuracy (percent %)")
ax5.set_title("Accuracy of participant " + str(participantNum), x=0.47)
ax5.legend(bbox_to_anchor=[1.13, 1.14])

for bar in ax5.patches: # Gets the bars on the chart (2 bars x 1 participant))
    width = bar.get_width(); height = bar.get_height() # Get height and width of bars
    x, y = bar.get_xy() # Gets values for the bars - participant and their accuracy and inaccuracy values
    ax5.annotate(f'{height}', (x + width/2, y + height*1.01), ha='center') # Annotates the accuracy and inaccuracy values on top of the bars in the chart

# Choose a saving location depending on the participant
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/ResultsFigures/fig4.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/ResultsFigures/fig4.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/ResultsFigures/fig4.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/ResultsFigures/fig4.png')
#plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/ResultsFigures/fig4.png')
plt.savefig('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/ResultsFigures/fig4.png')

# ----------------- ANALYSIS TO DETERMINE SEQUENCES THAT WERE GOTTEN CORRECT IN THE FIRST ONE OR TWO WORDS ---------------------- #

print("Sequences that decided correctly in the first two words - may be too easy:")
listToBeSorted=[]
for sequenceEasy in gottenQuicklyIndetifiers:
    listToBeSorted.append(orderOfAudiosCopy[sequenceEasy])
print(*sorted(listToBeSorted), sep='\n') # Print a sorted, newline seperated list for easy analysis

print(len(listToBeSorted))
print('\n')
