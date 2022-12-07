
            # if ( (len(meaning1Words) >= 4) and (len(meaning2Words) >= 4) ): #and (len(ambiguousWords) >= 4):
            #     exitWhileLoop = 1
            #     for val1, val2, val3 in zip(meaning1Percentage, meaning2Percentage, ambigPercentage):
            #         test = 0
            #         if ( (val1 < 0.52) or (val2 < 0.52) or ((val3 > 0.56) or (val3 < 0.4)) ):
            #             exitWhileLoop = 0
            #             test = 1
            #             break
            # if ( ((test == 0) or (noOfIterations > 200)) and ((len(meaning1Words) >= 4) and (len(meaning2Words) >= 4)) ):
    	    #     exitWhileLoop = 1

from operator import index
import numpy as np
from gensim.models import KeyedVectors
from numpy.linalg import norm
import random
from sklearn.metrics.pairwise import cosine_similarity
np.seterr(divide='ignore', invalid='ignore')

# ---- FUNCTION THAT TAKES IN VALUE AND ARRAY AND RETURNS INDEX OF THAT VALUE IN THE ARRAY ---- #
def indexGivenValue(value, array):
    for idx, val in enumerate(array):
        if(value == val):           
            return(idx)

# ----------------------------------------------------------------------- #
# ---------- TRAIN MODEL AND OBTAIN ALL WORDS AND VECTORS ----------- #

trainedModel = KeyedVectors.load_word2vec_format('./gensim_models/vectors.bin',binary=True,limit=298887)
allWords = trainedModel.index_to_key
vectors = trainedModel.vectors

# # ------------------------------------------------------------------------ #
# # Use Word2Vec similarity function to get candidate words for each ambiguous
# # word and its two meanings

# Smaller the angle - bigger the cosine similarity - more similar the word

meaning1 = 'university'
meaning2 = 'school'
candidateWords = []
candidateWords = trainedModel.most_similar(positive=[meaning1, meaning2], topn=150)
#print(candidateWords)

#CarBus: chosenWords = ['engine', 'drive', 'seat', 'wheels', 'commute', 'passenger', 'driver', 'fuel', 'motorway', 'automobile', 'taxi', 'intercity', 'open-top']
#ApartmentHouse: chosenWords = ['kitchen', 'bedroom', 'bathroom', 'doors', 'hall', 'floor', 'balcony', 'neighbourhood', 'rent', 'storey', 'landlord', 'neighbour', 'carpark', 'staircase', 'roof', 'garage']
#OrangeApple: chosenWords = ['juice', 'skin', 'fructose', 'pip', 'seeds', 'flavour', 'tree', 'sweet', 'sour', 'candy', 'colour', 'peel', 'eat', 'bite', 'stalk', 'bitter']
#BedCouch: chosenWords = ['sleep', 'comfortable', 'nap', 'sofabed', 'laydown', 'snooze', 'pajamas', 'support', 'lounge', 'cushion', 'television', 'futon', 'sit', 'snuggle', 'doze', 'reclined', 'pillow']
# CowPig: chosenWords = ['farm', 'smell', 'meat', 'livestock', 'tail', 'vetinary', 'breed', 'trotters', 'heavy', 'barn', 'flies', 'mud', 'manure', 'produce', 'barnyard']
# FootballRugby: chosenWords = ['match', 'ball', 'defence', 'stadium', 'club', 'coach', 'league', 'wing', 'cup', 'tackle', 'points', 'goal', 'score', 'positions', 'dropkick', 'nations', 'tournament', 'offside']
# GoldSilver: chosenWords = ['ring', 'necklace', 'plated', 'medal', 'ingot', 'minted', 'mine', 'precious', 'enameled', 'antique', 'candelabra', 'element', 'expensive', 'cutlery', 'platter', 'coin', 'trophy', 'shiny', 'gilded']
# ChickenPork: chosenWords = ['farm', 'animal', 'pulled', 'escalope', 'taco', 'minced', 'marinated', 'barbeque', 'char-grilled', 'sausage', 'roast', 'fillet', 'cutlet', 'fried', 'braised', 'crown', 'dumpling']
# MovieBook: chosenWords = ['story', 'biographical', 'characters', 'sequel', 'narrator', 'writer', 'long', 'genre', 'review', 'fiction', 'plot', 'trilogy', 'cliff-hanger', 'adaptation', 'fantasy', 'award']
# MilkWater: chosenWords = ['liquid', 'thirst', 'cereal', 'thin', 'potable', 'nonfat', 'hydrating', 'minerals', 'unsweetened', 'bake', 'odourless', 'bottle', 'coconut', 'coffee', 'tea']
# BeeWasp: chosenWords = ['fly', 'wing', 'black', 'yellow', 'pest', 'queen', 'buzz', 'flower', 'protect', 'sting', 'worker', 'hive', 'pollinate', 'larva', 'swarm', 'allergy']
# FlowerGrass: chosenWords = ['button', 'sleeve', 'collar', 'armholes', 'pajamas', 'outfit', 'pullover', 'cotton', 'linen', 'uniform', 'undergarment', 'causal']
# UniversitySchool: chosenWords = ['garden', 'grow', 'weed', 'ground', 'roots', 'die', 'meadow', 'stem', 'aphid', 'green', 'seeds', 'pollen', 'leaves', 'pasture', 'dirt', 'water', 'foliage', 'spring']
chosenWords = ['faculty', 'junior', 'senior', 'pupil', 'graduate', 'subject', 'exam', 'teacher', 'mixed', 'societies', 'study', 'tuition', 'extracurriculars', 'assignment', 'homework']

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
meaning1Percentages = []; meaning2Percentages = []; ambiguousWordsPercentages = []

# # Calculate and print the cosine similarities for each candidate word and each meaning #
for word, chosenVector in zip(chosenWords, vectorsOfChosenWords):
    cosine = np.dot(totalVector, chosenVector)/(norm(totalVector, axis=1) * norm(chosenVector))
    print("Cosine similarity of:", "\n", 
    meaning1,"and", word, "=", cosine[0], 
    meaning2, "and", word, "=", cosine[1])
    print("Percentage closer to", meaning1, cosine[0]/(cosine[0] + cosine[1]))
    print("Percentage closer to", meaning2, cosine[1]/(cosine[0] + cosine[1]))

    percentageToMeaning1 = cosine[0]/(cosine[0] + cosine[1]) 
    percentageToMeaning2 = cosine[1]/(cosine[0] + cosine[1])
    print(percentageToMeaning1)
    print(percentageToMeaning2)

    if (percentageToMeaning1 > 0.54):
        meaning1Words.append(word)
        meaning1Percentages.append(percentageToMeaning1)

    elif (percentageToMeaning2 > 0.54):
        meaning2Words.append(word)
        meaning2Percentages.append(percentageToMeaning2)

    elif ((percentageToMeaning1 >=0.48 and percentageToMeaning1 <=0.54) or (percentageToMeaning2 >=0.48 and percentageToMeaning2 <=0.54)):
        ambiguousWords.append(word) 
        if (percentageToMeaning1 > percentageToMeaning2):
            ambiguousWordsPercentages.append(percentageToMeaning1)
        elif (percentageToMeaning2 > percentageToMeaning1):
            ambiguousWordsPercentages.append("'")
            ambiguousWordsPercentages.append(percentageToMeaning2)
    
    print("-----------------------------------------------------------------")

print(meaning1Words); print(meaning1Percentages); 
print(meaning2Words); print(meaning2Percentages); 
print(ambiguousWords); print(ambiguousWordsPercentages)
print("\n")

meaning1Sequence = []; meaning2Sequence = []

meaning1Sequence = meaning1Words + ambiguousWords
print("Meaning 1 sequence 1:", meaning1Sequence)

random.shuffle(meaning1Sequence)
print("Meaning 1 sequence 2:", meaning1Sequence)

random.shuffle(meaning1Sequence)
print("Meaning 1 sequence 3:", meaning1Sequence)

random.shuffle(meaning1Sequence)
print("Meaning 1 sequence 4:", meaning1Sequence)

print(" ---------------------------------------------- ")
print("\n")

meaning2Sequence = meaning2Words + ambiguousWords
print("Meaning 2 sequence 1:", meaning2Sequence)

random.shuffle(meaning2Sequence)
print("Meaning 2 sequence 2:", meaning2Sequence)

random.shuffle(meaning2Sequence)
print("Meaning 2 sequence 3:", meaning2Sequence)

random.shuffle(meaning2Sequence)
print("Meaning 2 sequence 4:", meaning2Sequence)
print("\n")