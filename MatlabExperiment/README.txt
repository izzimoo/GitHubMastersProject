This folder contains the code that presented the paradigm to the participants using MATLAB and the Psychtoolbox library.

Scripts:

The 'createAudios.m' script contains code for creating the MATLAB stimuli. It reads in the CSV files created in the Python 'Word2VecModel.py' script and converted the sequences to auditory stimuli by joining the WAV text-to-speech versions of the words in the same order as is contained in the CSVs.

The 'experiment.m' scripts contains the code for the MATLAB experiment. It creates the flow of the various screens during the experiment, playing the audio and recording data throughout the experiment, such as button presses, score updates and decision times.

The 'getAnswer.m' function is a case statement that takes in the current trial and outputs the correct answer for that trial.

The 'getScore.m' function takes in the time a participant's decision and the time they made it at and calculates/ outputs the appropriate change in score and current score of the participant based on whether they got the trial correct and how long their decision time was.

The 'randNumber.m' function generated normally distributed random numbers that are transformed into the time domain and placed between words in the auditory stimuli to create random silences.

The 'returnMeanings.m' function is a case that takes in the current trial and outputs the target word pair for that trial.

Folders:

The 'BehaviouralData_PreEEG' folder contains the stimuli and results of the participants who partook in the behavioural verison of the experiment.

The 'EEGExperimentData' folder contains the audio files and Word2Vec sequences used for the EEG version of the experiment.

The 'EEGExperimentData' folder contains the results of the participants who partook in the EEG verison of the experiment.


