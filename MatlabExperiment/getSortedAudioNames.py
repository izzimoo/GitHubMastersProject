import os
import re

recordings = os.listdir('./EEGExperimentData/CompletedRecordingsEEG/AllRecordings')

def custom_sort(filename):
    match = re.match(r'(\D+)(\d+_\d+)\.wav', filename)
    prefix, suffix = match.group(1), match.group(2)
    return prefix, int(suffix.split('_')[0]), int(suffix.split('_')[1])

sorted_recordings = sorted(recordings, key=custom_sort)

startString = 'sounds = {'

tempString=[]
for file in sorted_recordings:
    tempString.append( f"'./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/{str(file)}'" )

middleString = ', '.join(tempString)

endString = '};'

finalString = startString + middleString + endString

text_file = open("./ArrayOfStimuliInOrder.txt", "w")

#write string to file
text_file.write(finalString)

text_file.close()
