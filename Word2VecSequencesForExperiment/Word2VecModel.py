from operator import index
import numpy as np
from gensim.models import KeyedVectors
from numpy.linalg import norm
import random
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
np.seterr(divide='ignore', invalid='ignore')

# ----- FUNCTION THAT TAKES IN VALUE AND ARRAY AND RETURNS INDEX OF THAT VALUE IN THE ARRAY ----- #
def indexGivenValue(value, array):
    for idx, val in enumerate(array):
        if(value == val):           
            return(idx)

# ----- SAME FUNCTION AS ABOVE BUT WHEN VALUES OCCURS MULTIPLE TIMES IN THE SAME ARRAY ----- #
def indiciesGivenValue(value, array):
    index = []
    for idx, val in enumerate(array): # Enumerate returns an object that contains a counter as a key for each value within an object: https://blog.hubspot.com/website/python-enumerate 
        if(value == val): 
            index.append(idx)  # In case of multiple instances of the value in the list, append indices to an array
            continue
                
    return(index) 

# ----- FUNCTION TO RETURN AUDIO NUMBER ORDER BASED ON ORDER OF WORDS IN A SEQUENCE ----- #
def returnAudioOrder(sequence):
    audioNumbers = []
    for val in sequence:
        audioNumbers.append("f"+str(val))
    return audioNumbers

# ----------------------------------------------------------------------- #
# ---------- TRAIN MODEL AND OBTAIN ALL WORDS AND VECTORS ----------- #

trainedModel = KeyedVectors.load_word2vec_format('./gensim_models/vectors.bin',binary=True,limit=298887)
allWords = trainedModel.index_to_key
vectors = trainedModel.vectors

# # ------------------------------------------------------------------------ #
# # Use Word2Vec similarity function to get candidate words for each ambiguous
# # word and its two meanings

# Smaller the angle - bigger the cosine similarity - more similar the word

meaning1 = 'bee'
meaning2 = 'wasp'
candidateWords = []
candidateWords = trainedModel.most_similar(positive=[meaning1, meaning2], topn=150)
#print(candidateWords)

# Work
# CarBus:chosenWords = ['engine', 'steer', 'drive', 'seat', 'wheels', 'commute', 'passenger', 'driver', 'motorway', 'taxi','intercity', 'open-top', 'window', 'roof', 'garage']
# HouseApartment: chosenWords = ['kitchen', 'bedroom', 'bathroom', 'doors', 'hall', 'floor', 'balcony', 'neighbourhood', 'rent', 'storey', 'landlord', 'neighbour', 'carpark', 'staircase', 'roof', 'garage']
# AppleOrange: chosenWords = ['juice', 'skin', 'fructose', 'pip', 'seeds', 'flavour', 'tree', 'sweet', 'sour', 'candy', 'colour', 'peel', 'eat', 'bite', 'stalk', 'bitter']
# BedCouch: chosenWords = ['sleep', 'comfortable', 'nap', 'sofabed', 'laydown', 'snooze', 'pajamas', 'support', 'lounge', 'cushion', 'television', 'futon', 'sit', 'snuggle', 'doze', 'reclined', 'pillow']
# CowPig: chosenWords = ['farm', 'smell', 'meat', 'livestock', 'tail', 'vetinary', 'breed', 'trotters', 'heavy', 'barn', 'flies', 'mud', 'manure', 'produce', 'barnyard']
# FootballRugby: chosenWords = ['match', 'ball', 'defence', 'stadium', 'club', 'coach', 'league', 'wing', 'cup', 'tackle', 'points', 'goal', 'score', 'positions', 'dropkick', 'nations', 'tournament', 'offside']
# GoldSilver: chosenWords = ['ring', 'necklace', 'plated', 'medal', 'ingot', 'minted', 'mine', 'precious', 'enameled', 'antique', 'candelabra', 'element', 'expensive', 'cutlery', 'platter', 'coin', 'trophy', 'shiny', 'gilded']
# ChickenPork: chosenWords = ['farm', 'animal', 'pulled', 'escalope', 'taco', 'minced', 'marinated', 'barbeque', 'char-grilled', 'sausage', 'roast', 'fillet', 'cutlet', 'fried', 'braised', 'crown', 'dumpling']
# MovieBook: chosenWords = ['story', 'biographical', 'characters', 'sequel', 'narrator', 'writer', 'long', 'genre', 'review', 'fiction', 'plot', 'trilogy', 'cliff-hanger', 'adaptation', 'fantasy', 'award', 'collection']
# WaterMilk: chosenWords = ['liquid', 'thirst', 'cereal', 'thin', 'potable', 'nonfat', 'hydrating', 'minerals', 'unsweetened', 'bake', 'odourless', 'bottle', 'coconut', 'coffee', 'tea']
# BeeWasp: 
chosenWords = ['fly', 'wing', 'black', 'yellow', 'pest', 'queen', 'buzz', 'flower', 'protect', 'sting', 'worker', 'hive', 'pollinate', 'larva', 'swarm', 'allergy']
# TShirtShirt: chosenWords = ['button', 'sleeve', 'collar', 'armholes', 'pajamas', 'outfit', 'pullover', 'cotton', 'linen', 'uniform', 'undergarment', 'causal', 'comfortable', 'v-neck']
# FlowerGrass: chosenWords = ['garden', 'grow', 'weed', 'sprout', 'stem', 'ground', 'roots', 'die', 'meadow', 'stem', 'aphid', 'seeds', 'pollen', 'leaves', 'dirt', 'water', 'foliage', 'spring']
# BusTrain: chosenWords = ['intercity', 'coach', 'countrylink', 'commute', 'wheels', 'driver', 'seat', 'passenger', 'ticket', 'double-decker', 'single-decker', 'route', 'transit', 'fare', 'station', 'stop', 'terminus']
# CatDog: chosenWords = ['fur', 'paw', 'cute', 'cosy', 'playful', 'microchipped', 'neutered', 'pet', 'breed', 'stray', 'whiskers', 'train', 'wild', 'cuddle', 'feed', 'tail']
# UniversitySchool: chosenWords = ['faculty', 'junior', 'senior', 'pupil', 'graduate', 'subject', 'exam', 'teacher', 'mixed', 'societies', 'study', 'tuition', 'extracurriculars', 'assignment', 'homework']
# CarrotPotato: chosenWords = ['salad', 'ground', 'dirt', 'roots', 'fibre', 'roast', 'soup', 'peel', 'chop', 'crisp', 'nutritional', 'crop', 'mash', 'sweet']

indexOfChosenWord=[]
for word in chosenWords:
    indexOfChosenWord.append(indexGivenValue(word, allWords))

vectorsOfChosenWords=[]
for index in indexOfChosenWord:
    vectorsOfChosenWords.append(vectors[index])

vectorsOfChosenWords = np.array(vectorsOfChosenWords, dtype=object)
print(vectorsOfChosenWords.shape)

# # # --------------------------------------------------------------------------- #

# # Do the same as above but for the two meanings now 

indexOfMeaning1 = indexGivenValue(meaning1, allWords)
indexOfMeaning2 = indexGivenValue(meaning2, allWords)

vectorOfMeaning1 = vectors[indexOfMeaning1]
vectorOfMeaning2 = vectors[indexOfMeaning2]

# # #Stack the two vectors so that they can be passed into the cosine similarity funtion
totalVector = (np.column_stack((vectorOfMeaning1, vectorOfMeaning2))).transpose()

# # # --------------------------------------------------------------------------- #

meaning1Words = []; meaning2Words = []; ambiguousWords = []
percentageToMeaning1 = []; percentageToMeaning2 = []
meaning1Percentage = []; meaning2Percentage = []; ambigPercentage = []

def forceSequences(meaning1Words, meaning2Words, meaning1Percentage, meaning2Percentage):

    sortedPercentage, sortedWords = (list(t) for t in zip(*sorted(zip(percentageToMeaning1, chosenWords)))) 

    if ( (len(meaning1Words) < 4) and (len(meaning2Words) < 4)):
        meaning1Words=[]; meaning2Words=[]; meaning1Percentage=[]; meaning2Percentage=[]

        meaning1Words = sortedWords[-4:]
        del sortedWords[-4:]
        meaning1Percentage = sortedPercentage[-4:]
        del sortedPercentage[-4:]

        meaning2Words = sortedWords[:4]
        del sortedWords[:4]
        meaning2Percentage = sortedPercentage[:4]
        meaning2Percentage = [1-value for value in meaning2Percentage]
        del sortedPercentage[:4]

        ambiguousWords = sortedWords
        ambigPercentage = sortedPercentage

    elif (len(meaning2Words) >=4 ):
        meaning1Words=[]; meaning1Percentage=[]; toDelete=[]

        for value in meaning2Words:
            toDelete.append(indexGivenValue(value, sortedWords))
        
        for index in sorted(toDelete, reverse=True):
            del sortedWords[index]
            del sortedPercentage[index]

        meaning2Words = meaning2Words
        meaning2Percentage = meaning2Percentage

        meaning1Words = sortedWords[-4:]
        del sortedWords[-4:]
        meaning1Percentage = sortedPercentage[-4:]
        del sortedPercentage[-4:]

        ambiguousWords = sortedWords
        ambigPercentage = sortedPercentage
    
    elif (len(meaning1Words) >= 4):
        meaning2Words=[]; meaning2Percentage=[]; toDelete=[]

        for value in meaning1Words:
            toDelete.append(indexGivenValue(value, sortedWords))
        
        for index in sorted(toDelete, reverse=True):
            del sortedWords[index]
            del sortedPercentage[index]
        
        meaning1Words = meaning1Words
        meaning1Percentage = meaning1Percentage

        meaning2Words = sortedWords[:4]
        del sortedWords[:4]
        meaning2Percentage = sortedPercentage[:4]
        meaning2Percentage = [1-value for value in meaning2Percentage]
        del sortedPercentage[:4]

        ambiguousWords = sortedWords
        ambigPercentage = sortedPercentage

    return ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage

def reRunPercentile(ambiguousWords, ambigPercentage):
        
    highPercentile = 70
    lowPercentile = 30

    tempAmbiguousWords=[]; tempAmbigPercentage=[]; tempMeaning1Words=[]; 
    tempMeaning1Percentage=[]; tempMeaning2Words=[]; tempMeaning2Percentage=[]

    for word, percentage in zip(ambiguousWords, ambigPercentage):

        small = np.percentile(ambigPercentage, lowPercentile)
        big = np.percentile(ambigPercentage, highPercentile)

        if  ((((percentage > small) and (percentage < big)) or ((1-percentage >= 0.46) and (1-percentage > small)) and ((1-percentage >= 0.46) and (1-percentage < big))) and (word not in tempAmbiguousWords)): # While they are between the percentiles they are ambiguous words
            tempAmbiguousWords.append(word)
            tempAmbigPercentage.append(percentage)

        if ((percentage <= small) and (word not in tempAmbiguousWords)): # If the percentage is less than the lower percentile it is a meaning 2 word 
            tempMeaning2Words.append(word)
            tempMeaning2Percentage.append(1-percentage)

        if ((percentage >= big) and (word not in tempAmbiguousWords)): # If the percentage is greater than the higher perentile it is a meaning 1 word
            tempMeaning1Words.append(word)
            tempMeaning1Percentage.append(percentage)
    
    print("ambig")      
    print(tempAmbiguousWords)
    print(tempAmbigPercentage)
    print("meaning1")      
    print(tempMeaning1Words)
    print(tempMeaning1Percentage)
    print("meaning2")      
    print(tempMeaning2Words) 
    print(tempMeaning2Percentage)
    print("Code ends here")
    print('\n')

    return tempAmbiguousWords, tempAmbigPercentage, tempMeaning1Words, tempMeaning1Percentage, tempMeaning2Words, tempMeaning2Percentage


def normalPercentile(chosenWords, percentageToMeaning1, percentageToMeaning2):

    noOfIterations=0; increasePercentileStep=0; forLoopBroke=0; exitWhileLoop=0; 
    while (exitWhileLoop == 0 or (len(meaning1Words) < 4) or (len(meaning2Words) < 4) ): #or (len(ambiguousWords) < 4) ): # while all the arrays have less than 4 words in them
        
        highPercentile = range(60, 100, 5) 
        lowPercentile = range(0, 40, 5) 

        if (increasePercentileStep == 1):
            highPercentile = range(60, 100, 10) 
            lowPercentile = range(0, 40, 10) 

        if (exitWhileLoop == 1):
            break
        
        for low in lowPercentile:
            for high in highPercentile:

                if (exitWhileLoop == 1):
                    break

                # reset arrays after each unsuccessful loop
                meaning1Words = []; meaning2Words = []; ambiguousWords = []
                meaning1Percentage = []; meaning2Percentage = []; ambigPercentage = []

                for word, percentage, word2, percentage2 in zip(chosenWords, percentageToMeaning1, chosenWords, percentageToMeaning2):

                    small = np.percentile(percentageToMeaning1, low)
                    big = np.percentile(percentageToMeaning1, high)

                    if ( ((percentage > small) and (percentage < big)) and (word not in ambiguousWords)): # While they are between the percentiles they are ambiguous words
                        ambiguousWords.append(word)
                        ambigPercentage.append(percentage)

                    if ((percentage2 > small) and (percentage2 < big) and (word2 not in ambiguousWords)):
                        ambiguousWords.append(word2)
                        ambigPercentage.append(percentage2)

                    if ((percentage <= small) and (word2 not in ambiguousWords)): # If the percentage is less than the lower percentile it is a meaning 2 word 
                        meaning2Words.append(word)
                        meaning2Percentage.append(1-percentage)

                    if (percentage >= big and (word not in ambiguousWords)): # If the percentage is greater than the higher perentile it is a meaning 1 word
                        meaning1Words.append(word)
                        meaning1Percentage.append(percentage)

                debug1 = len(meaning1Words); debug2 = len(meaning2Words); debug3 = len(ambiguousWords) 

                noOfIterations+=1
                if ( (noOfIterations >= 50) and (forLoopBroke == 0) ): # Likely entering an infinite loop so break out of for loop and increase the percentile step from 5 to 10
                    increasePercentileStep = 1; forLoopBroke = 1
                    break

                if ( (len(meaning1Words) >= 4) and (len(meaning2Words) >= 4) ):
                    exitWhileLoop = 1
                    break

                if (noOfIterations > 100):

                   ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage = forceSequences(meaning1Words, meaning2Words, meaning1Percentage, meaning2Percentage)
                   
                #    print(ambiguousWords); print(ambigPercentage)
                #    print(meaning1Words); print(meaning1Percentage)
                #    print(meaning2Words); print(meaning2Percentage)

                   tempAmbiguousWords, tempAmbigPercentage, tempMeaning1Words, tempMeaning1Percentage, tempMeaning2Words, tempMeaning2Percentage = reRunPercentile(ambiguousWords, ambigPercentage)
                   ambiguousWords=[]; ambigPercentage=[]
                   ambiguousWords.extend(tempAmbiguousWords); meaning1Words.extend(tempMeaning1Words); meaning2Words.extend(tempMeaning2Words)
                   ambigPercentage.extend(tempAmbigPercentage); meaning1Percentage.extend(tempMeaning1Percentage); meaning2Percentage.extend(tempMeaning2Percentage)
                    
                   exitWhileLoop = 1
                   break

    return ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage





# # Calculate and print the cosine similarities for each candidate word and each meaning 

for word, chosenVector in zip(chosenWords, vectorsOfChosenWords):
    cosine = np.dot(totalVector, chosenVector)/(norm(totalVector, axis=1) * norm(chosenVector))
    print("Cosine similarity of:", "\n", 
    meaning1,"and", word, "=", cosine[0], 
    meaning2, "and", word, "=", cosine[1])
    print("Percentage closer to", meaning1, cosine[0]/(cosine[0] + cosine[1]))
    print("Percentage closer to", meaning2, cosine[1]/(cosine[0] + cosine[1]))

    percentageToMeaning1.append(cosine[0]/(cosine[0] + cosine[1]))
    percentageToMeaning2.append(cosine[1]/(cosine[0] + cosine[1]))
    print(len(percentageToMeaning1)); print(len(percentageToMeaning2))

ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage = normalPercentile(chosenWords, percentageToMeaning1, percentageToMeaning2)

#print("count:", noOfIterations)
#print("low", low); print("high", high)
#print('\n')
print("Ambiguous words:")
print(ambiguousWords)
print(ambigPercentage)

print('\n')
print("Meaning one words:")
print(meaning1Words)
print(meaning1Percentage)

print('\n')
print("Meaning two words:")
print(meaning2Words)
print(meaning2Percentage)
print('\n')

# # Creating the sequences 

print("Sequences for meaning one word:", meaning1)

meaning1Sequence = meaning1Words + ambiguousWords

random.shuffle(meaning1Sequence)
meaning1S1 = random.sample(meaning1Sequence, 8)
print("Sequence 1:", meaning1S1)

random.shuffle(meaning1Sequence)
meaning1S2 = random.sample(meaning1Sequence, 8)
print("Sequence 2:", meaning1S2)

random.shuffle(meaning1Sequence)
meaning1S3 = random.sample(meaning1Sequence, 8)
print("Sequence 3:", meaning1S3)

random.shuffle(meaning1Sequence)
meaning1S4 = random.sample(meaning1Sequence, 8)
print("Sequence 4:", meaning1S4)

print(" ---------------------------------------------- ")
print("\n")

print("Sequence for meaning two word:", meaning2)

meaning2Sequence = meaning2Words + ambiguousWords

random.shuffle(meaning2Sequence)
meaning2S1 = random.sample(meaning2Sequence, 8)
print("Sequence 1:", meaning2S1)

random.shuffle(meaning2Sequence)
meaning2S2 = random.sample(meaning2Sequence, 8)
print("Sequence 2:", meaning2S2)

random.shuffle(meaning2Sequence)
meaning2S3 = random.sample(meaning2Sequence, 8)
print("Sequence 3:", meaning2S3)

random.shuffle(meaning2Sequence)
meaning2S4 = random.sample(meaning2Sequence, 8)
print("Sequence 4:", meaning2S4)
print("\n")

# Write arrays to a CSV file

csv_dict = {'Meaning one words': meaning1Words, 'Meaning one percentage': meaning1Percentage, 'Meaning two words': meaning2Words, 'Meaning two percentage': meaning2Percentage,
        'Ambiguous words': ambiguousWords, 'Ambiguous percentage to meaning one': ambigPercentage, 
        str(meaning1).capitalize()+' Sequence 1': meaning1S1, str(meaning1).capitalize()+' Sequence 2': meaning1S2, str(meaning1).capitalize()+' Sequence 3': meaning1S3,  str(meaning1).capitalize()+' Sequence 4': meaning1S4,  
        str(meaning2).capitalize()+' Sequence 1': meaning2S1, str(meaning2).capitalize()+' Sequence 2': meaning2S2, str(meaning2).capitalize()+' Sequence 3': meaning2S3,  str(meaning2).capitalize()+' Sequence 4': meaning2S4
}

df = pd.DataFrame(dict([ (k,pd.Series(v)) for k,v in csv_dict.items() ])) # Adds NaN values to the arrays to pad them out so that all the arrays are the same length to create the dataframe
df.to_csv('SequencesCSV.csv', index=False)

# Creating audio sequences to copy and pasta into Matlab
# ------------------- AUDIO FOR MEANING ONE SEQUENCE ONE -------------------- #

indices=[]
for wordInSequence in meaning1S1:
    indices.append(indexGivenValue(wordInSequence, chosenWords))

audioOrder = returnAudioOrder(indices)

print("% Audio 1")
print("randNo = randNumber();")
print('\n')
print("combined1 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder[0])+")./fs," + " length("+str(audioOrder[1])+")./fs," + " length("+str(audioOrder[2])+")./fs," + " length("+str(audioOrder[3])+")./fs," + " length("+str(audioOrder[4])+")./fs," + " length("+str(audioOrder[5])+")./fs,"
            + " length("+str(audioOrder[6])+")./fs," + " length("+str(audioOrder[7])+")./fs];" )
print('\n')
print("A1 = table(audioLen);")
print("T1 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING ONE SEQUENCE TWO -------------------- #

indices2=[]
for wordInSequence2 in meaning1S2:
    indices2.append(indexGivenValue(wordInSequence2, chosenWords))

audioOrder2 = returnAudioOrder(indices2)

print("% Audio 2")
print("randNo = randNumber();")
print('\n')
print("combined2 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder2[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder2[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder2[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder2[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder2[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder2[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder2[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder2[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder2[0])+")./fs," + " length("+str(audioOrder2[1])+")./fs," + " length("+str(audioOrder2[2])+")./fs," + " length("+str(audioOrder2[3])+")./fs," + " length("+str(audioOrder2[4])+")./fs," + " length("+str(audioOrder2[5])+")./fs,"
            + " length("+str(audioOrder2[6])+")./fs," + " length("+str(audioOrder2[7])+")./fs];" )
print('\n')
print("A2 = table(audioLen);")
print("T2 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING ONE SEQUENCE THREE -------------------- #

indices3=[]
for wordInSequence3 in meaning1S3:
    indices3.append(indexGivenValue(wordInSequence3, chosenWords))

audioOrder3 = returnAudioOrder(indices3)

print("% Audio 3")
print("randNo = randNumber();")
print('\n')
print("combined3 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder3[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder3[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder3[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder3[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder3[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder3[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder3[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder3[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder3[0])+")./fs," + " length("+str(audioOrder3[1])+")./fs," + " length("+str(audioOrder3[2])+")./fs," + " length("+str(audioOrder3[3])+")./fs," + " length("+str(audioOrder3[4])+")./fs," + " length("+str(audioOrder3[5])+")./fs,"
            + " length("+str(audioOrder3[6])+")./fs," + " length("+str(audioOrder3[7])+")./fs];" )
print('\n')
print("A3 = table(audioLen);")
print("T3 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING ONE SEQUENCE FOUR -------------------- #

indices4=[]
for wordInSequence4 in meaning1S4:
    indices4.append(indexGivenValue(wordInSequence4, chosenWords))

audioOrder4 = returnAudioOrder(indices4)

print("% Audio 4")
print("randNo = randNumber();")
print('\n')
print("combined4 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder4[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder4[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder4[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder4[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder4[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder4[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder4[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder4[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder4[0])+")./fs," + " length("+str(audioOrder4[1])+")./fs," + " length("+str(audioOrder4[2])+")./fs," + " length("+str(audioOrder4[3])+")./fs," + " length("+str(audioOrder4[4])+")./fs," + " length("+str(audioOrder4[5])+")./fs,"
            + " length("+str(audioOrder4[6])+")./fs," + " length("+str(audioOrder4[7])+")./fs];\n" )
print('\n')
print("A4 = table(audioLen);")
print("T4 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #

# ------------------- AUDIO FOR MEANING TWO SEQUENCE ONE -------------------- #

indices5=[]
for wordInSequence5 in meaning2S1:
    indices5.append(indexGivenValue(wordInSequence5, chosenWords))

audioOrder5 = returnAudioOrder(indices5)

print("% Audio 5")
print("randNo = randNumber();")
print('\n')
print("combined5 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder5[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder5[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder5[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder5[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder5[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder5[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder5[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder5[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder5[0])+")./fs," + " length("+str(audioOrder5[1])+")./fs," + " length("+str(audioOrder5[2])+")./fs," + " length("+str(audioOrder5[3])+")./fs," + " length("+str(audioOrder5[4])+")./fs," + " length("+str(audioOrder5[5])+")./fs,"
            + " length("+str(audioOrder5[6])+")./fs," + " length("+str(audioOrder5[7])+")./fs];" )
print('\n')
print("A5 = table(audioLen);")
print("T5 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE TWO -------------------- #

indices6=[]
for wordInSequence6 in meaning2S2:
    indices6.append(indexGivenValue(wordInSequence6, chosenWords))

audioOrder6 = returnAudioOrder(indices6)

print("% Audio 6")
print("randNo = randNumber();")
print('\n')
print("combined6 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder6[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder6[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder6[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder6[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder6[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder6[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder6[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder6[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder6[0])+")./fs," + " length("+str(audioOrder6[1])+")./fs," + " length("+str(audioOrder6[2])+")./fs," + " length("+str(audioOrder6[3])+")./fs," + " length("+str(audioOrder6[4])+")./fs," + " length("+str(audioOrder6[5])+")./fs,"
            + " length("+str(audioOrder6[6])+")./fs," + " length("+str(audioOrder6[7])+")./fs];" )
print('\n')
print("A6 = table(audioLen);")
print("T6 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE THREE -------------------- #

indices7=[]
for wordInSequence7 in meaning2S3:
    indices7.append(indexGivenValue(wordInSequence7, chosenWords))

audioOrder7 = returnAudioOrder(indices7)

print("% Audio 7")
print("randNo = randNumber();")
print('\n')
print("combined7 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder7[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder7[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder7[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder7[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder7[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder7[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder7[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder7[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder7[0])+")./fs," + " length("+str(audioOrder7[1])+")./fs," + " length("+str(audioOrder7[2])+")./fs," + " length("+str(audioOrder7[3])+")./fs," + " length("+str(audioOrder7[4])+")./fs," + " length("+str(audioOrder7[5])+")./fs,"
            + " length("+str(audioOrder7[6])+")./fs," + " length("+str(audioOrder7[7])+")./fs];" )
print('\n')
print("A7 = table(audioLen);")
print("T7 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE FOUR -------------------- #

indices8=[]
for wordInSequence8 in meaning2S4:
    indices8.append(indexGivenValue(wordInSequence8, chosenWords))

audioOrder8 = returnAudioOrder(indices8)

print("% Audio 8")
print("randNo = randNumber();")
print('\n')
print("combined8 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder8[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder8[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder8[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder8[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder8[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder8[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder8[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder8[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder8[0])+")./fs," + " length("+str(audioOrder8[1])+")./fs," + " length("+str(audioOrder8[2])+")./fs," + " length("+str(audioOrder8[3])+")./fs," + " length("+str(audioOrder8[4])+")./fs," + " length("+str(audioOrder8[5])+")./fs,"
            + " length("+str(audioOrder8[6])+")./fs," + " length("+str(audioOrder8[7])+")./fs];" )
print('\n')
print("A8 = table(audioLen);")
print("T8 = table(randNo);")
print('\n')
# # ------------------------------------------------------------------------------- #




   