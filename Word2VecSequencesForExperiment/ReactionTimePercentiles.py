import re
import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter
import numpy as np 

# Method one: Getting thresholds of the reaction times to split into fast, medium and slow trials

resultsEEG1 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant1Results/DecisionsAndTimings.csv')
resultsEEG2 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant2Results/DecisionsAndTimings.csv')
resultsEEG3 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant3Results/DecisionsAndTimings.csv')
resultsEEG4 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant4Results/DecisionsAndTimings.csv')
resultsEEG5 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant5Results/DecisionsAndTimings.csv')
resultsEEG6 = pd.read_csv('./ExperimentData-ForEEG/EEGExperimentDataAndResults/EEGParticipant6Results/DecisionsAndTimings.csv')

# Concatenate the first column of each dataframe into one large array
allDecisionTimes = pd.concat([resultsEEG1.iloc[:, 1], resultsEEG2.iloc[:, 1], resultsEEG3.iloc[:, 1], resultsEEG4.iloc[:, 1],  
                              resultsEEG5.iloc[:, 1], resultsEEG6.iloc[:, 1]])

allDecisionTimes = np.array(allDecisionTimes)

reactionTimeThresholds = np.percentile(allDecisionTimes, [33.33, 66.66])

# Split the array into three bins based on the thresholds
fast_reaction_times = allDecisionTimes[allDecisionTimes <= reactionTimeThresholds[0]]
print(reactionTimeThresholds[0])
medium_reaction_times = allDecisionTimes[(allDecisionTimes > reactionTimeThresholds[0]) & (allDecisionTimes <= reactionTimeThresholds[1])]
slow_reaction_times = allDecisionTimes[allDecisionTimes > reactionTimeThresholds[1]]
print(reactionTimeThresholds[1])

print(len(fast_reaction_times))
print(len(medium_reaction_times))
print(len(slow_reaction_times))

# Method two: Sorting the reaction times and splitting into three equal sized bins

