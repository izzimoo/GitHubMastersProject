
# Script to determine if a word is a meaning or ambiguous word for the meaningVsAmbig ERP analysis in MATLAB.
# Only need to run script once to run all 17 pairs of target words' sequence CSVs.

import pandas as pd

AO_word2vec = pd.read_csv('./Word2VecSequencesEEG/AppleOrange/AppleOrange_SequencesCSV.csv')
BC_word2vec = pd.read_csv('./Word2VecSequencesEEG/BedCouch/BedCouch_SequencesCSV.csv')
BW_word2vec = pd.read_csv('./Word2VecSequencesEEG/BeeWasp/BeeWasp_SequencesCSV.csv')
BT_word2vec = pd.read_csv('./Word2VecSequencesEEG/BusTrain/BusTrain_SequencesCSV.csv')
CB_word2vec = pd.read_csv('./Word2VecSequencesEEG/CarBus/CarBus_SequencesCSV.csv')
CP_word2vec = pd.read_csv('./Word2VecSequencesEEG/CarrotPotato/CarrotPotato_SequencesCSV.csv')
CD_word2vec = pd.read_csv('./Word2VecSequencesEEG/CatDog/CatDog_SequencesCSV.csv')
CHP_word2vec = pd.read_csv('./Word2VecSequencesEEG/ChickenPork/ChickenPork_SequencesCSV.csv')
FR_word2vec = pd.read_csv('./Word2VecSequencesEEG/FootballRugby/FootballRugby_SequencesCSV.csv')
GS_word2vec = pd.read_csv('./Word2VecSequencesEEG/GoldSilver/GoldSilver_SequencesCSV.csv')
HA_word2vec = pd.read_csv('./Word2VecSequencesEEG/HouseApartment/HouseApartment_SequencesCSV.csv')
MB_word2vec = pd.read_csv('./Word2VecSequencesEEG/MovieBook/MovieBook_SequencesCSV.csv')
TSS_word2vec = pd.read_csv('./Word2VecSequencesEEG/TshirtShirt/TshirtShirt_SequencesCSV.csv')
US_word2vec = pd.read_csv('./Word2VecSequencesEEG/UniversitySchool/UniversitySchool_SequencesCSV.csv')
WM_word2vec = pd.read_csv('./Word2VecSequencesEEG/WaterMilk/WaterMilk_SequencesCSV.csv')
RS_word2vec = pd.read_csv('./Word2VecSequencesEEG/RainSnow/RainSnow_SequencesCSV.csv')
TSP_word2vec = pd.read_csv('./Word2VecSequencesEEG/TelevisionSmartphone/TelevisionSmartphone_SequencesCSV.csv')

arrayOfCSVs = [AO_word2vec, BC_word2vec, BW_word2vec, BT_word2vec, CB_word2vec, CP_word2vec, CD_word2vec, CHP_word2vec, FR_word2vec, GS_word2vec, HA_word2vec,
                MB_word2vec, TSS_word2vec, US_word2vec, WM_word2vec, RS_word2vec, TSP_word2vec]

numberCSVs = len(arrayOfCSVs)
numSequences = 16

# For loop essentially checks if a word in a sequence is in the target word one or two column, if it yes it is assigned as a meaning word or 'M', if not it
# is assigned as an ambiguous word or 'A'.
for CSVFile in range(numberCSVs):
    
    meaningOneWords = arrayOfCSVs[CSVFile].iloc[:,0] 
    meaningTwoWords = arrayOfCSVs[CSVFile].iloc[:,2] 
    ambigWords = arrayOfCSVs[CSVFile].iloc[:, 4]

    meaningOneWords = meaningOneWords.to_numpy()
    meaningTwoWords = meaningTwoWords.to_numpy()

    print(ambigWords)

    allArrayMvAs = []
    for sequenceNum in range(numSequences):

        sequenceOfWords = arrayOfCSVs[CSVFile].iloc[:,(sequenceNum+6)]  # Skip the first 6 columns to get to meaning 1 sequence 1 then continue

        arrayMvA = []
        for sequenceWord in sequenceOfWords:

            if ((sequenceWord in meaningOneWords) or (sequenceWord in meaningTwoWords)):
                arrayMvA.append('M')
            else: 
                arrayMvA.append('A')  

        allArrayMvAs.append(arrayMvA)

    # create a new dataframe containing the arrayMvAs and save as a new CSV file
    df = pd.DataFrame(data=allArrayMvAs).transpose()
    df.to_csv(f"arrayMvA_{CSVFile}.csv", index=False)
            

