This folder contains the code to create the novel paradigm. The paradigm involves the use of Word2Vec and cosine similarity to create sequences of ambiguous words that can be categorised as meaning one of two target words i.e. a sequence of ambiguous words that could mean cat or dog, that the code classifies as meaning dog.

Scripts:

The main script 'Word2VecModel.py' creates the sequences using Word2Vec and cosine similarity, just choose the ambiguous BOW and correct target words and run the code to create the sequences automatically that are saved into a CSV for easy reading and storage.

The 'DataAnalysis.py' script was used to do an intial analysis on the performance of the paradigm after participants completed the behavioural pilots of the experiment. It was used to calculate metrics such as accuracy, miss trial ratios and decision distributions.

The 'MatlabReadStimuli.py' script creates the stimuli that can be copy and pasted into MATLAB. Three integral pieces are created:
	1) A random order array containing the stimuli for a participant.
	2) The corresponding switch statement that contains the correct answer for each trial corresponding to the stimulus.
	3) The corresponding switch statement that contains the two target words for each trial corresponding to the stimulus.

The 'AmbiguousVsNonAmbiguousWords.py' is a script used for a particlar type of ERP analysis and essentially marks the words in each of the CSV sequence files as either a 'meaning word' or an 'ambiguous word'.

Folders:

The 'AmbigVsNonAmbigCSVs' folder contains the output from the 'AmbiguousVsNonAmbiguousWords.py' script described above.

The 'BehaviouralExperimentData-PreEEG' folder contains the stimuli and results of the three participants who partook in the behavioural version of the experiment.

The 'ExperimentData-ForEEG' folder contains the stimuli and results of the six participants who partook in the EEG version of the experiment.

The 'Stimuli_OrderMeaningsAnswers' folder contains the output from the 'MatlabReadStimuli.py' script described above.

The 'Word2VecSequencesEEG' folder contains the sequences created from the 'Word2VecModel.py' script described above.

The 'gensim_models' folders contains the Word2Vec model used for the experiment, however, the files were too large to upload to GitHub so they are not present in this folder.