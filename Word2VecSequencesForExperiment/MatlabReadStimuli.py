
# Script to generate stimuli in random order files for each participants, also creates the corresponding correct answers switch statement for each trial for MATLAB
# and the corresponding target word pair switch statement for MATLAB.

# Run this script one to generate the stimuli for a participant and paste the contents of the files into MATLAB.

import os, random
import numpy as np

# Putting the stimuli in a random order array to use in MATLAB.
# Copy and paste the contents of this file into the start of the experiment to replace the 'sounds' array in experiment.m
recordings = os.listdir('./ExperimentData-ForEEG/AllRecordingsEEG')

random.shuffle(recordings)

startString = 'sounds = {'

tempString=[]
for file in recordings:
    tempString.append( f"'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/{str(file)}'" )

middleString = ', '.join(tempString)

endString = '};'

finalString = startString + middleString + endString

text_file = open("./Stimuli_OrderMeaningsAnswers/ArrayOfStimuliInRandomOrder.txt", "w")
 
#write string to file
text_file.write(finalString)

text_file.close()

# Generate the correct answers for each sequence by extracting whether they are a target word one or target word two sequence
# Copy and paste the contents of this file into the 'returnMeanings.m' function in MATLAB

answers = []
for sequence in recordings:
    answers.append(sequence.split('_')[1])

correctAnswers=[]
for meaning in answers:
    if (meaning == 'M1'):
        correctAnswers.append(1)
    else:
        correctAnswers.append(2)

with open("./Stimuli_OrderMeaningsAnswers/CorrectAnswersSwitch.txt", "w") as f:
    for i, ans in zip(range(len(correctAnswers)), correctAnswers):
        print('case ' + str(i+1), file=f)
        print('    answer = ' + str(ans) + ';', file=f)

# Generate the target word pairs for each sequence by extracting them from the acroynm
# Copy and paste the contents of this file into the 'getAnswer.m' function in MATLAB

acronyms = []
for sequence in recordings:
    acronyms.append(sequence.split('_')[0])

meaningOne=[]; meaningTwo=[]
for acro in acronyms:
    if (acro == 'HA'):
        meaningOne.append('House')
        meaningTwo.append('Apartment')
    if (acro == 'AO'):
        meaningOne.append('Apple')
        meaningTwo.append('Orange')
    if (acro == 'BC'):
        meaningOne.append('Bed')
        meaningTwo.append('Couch')
    if (acro == 'BT'):
        meaningOne.append('Bus')
        meaningTwo.append('Train')
    if (acro == 'BW'):
        meaningOne.append('Bee')
        meaningTwo.append('Wasp')
    if (acro == 'CB'):
        meaningOne.append('Car')
        meaningTwo.append('Bus')
    if (acro == 'CD'):
        meaningOne.append('Cat')
        meaningTwo.append('Dog')
    if (acro == 'CHP'):
        meaningOne.append('Chicken')
        meaningTwo.append('Pork')
    if (acro == 'COP'):
        meaningOne.append('Cow')
        meaningTwo.append('Pig')
    if (acro == 'CP'):
        meaningOne.append('Carrot')
        meaningTwo.append('Potato')
    if (acro == 'FG'):
        meaningOne.append('Flower')
        meaningTwo.append('Grass')
    if (acro == 'FR'):
        meaningOne.append('Football')
        meaningTwo.append('Rugby')
    if (acro == 'GS'):
        meaningOne.append('Gold')
        meaningTwo.append('Silver')
    if (acro == 'MB'):
        meaningOne.append('Movie')
        meaningTwo.append('Book')
    if (acro == 'TSS'):
        meaningOne.append('Tshirt')
        meaningTwo.append('Shirt')
    if (acro == 'US'):
        meaningOne.append('University')
        meaningTwo.append('School')
    if (acro == 'WM'):
        meaningOne.append('Water')
        meaningTwo.append('Milk')
    if (acro == 'TSP'):
        meaningOne.append('Television')
        meaningTwo.append('Smartphone')
    if (acro == 'RS'):
        meaningOne.append('Rain')
        meaningTwo.append('Snow')

with open("./Stimuli_OrderMeaningsAnswers/MeaningsForEachSequence.txt", "w") as g:   
    for j, mean1, mean2 in zip(range(len(meaningOne)), meaningOne, meaningTwo):
        print('case ' + str(j+1), file=g)
        print('    meaning1 = ' + f"'{str(mean1)}'" + ';', file=g)
        print('    meaning2 = ' + f"'{str(mean2)}'" + ';', file=g)