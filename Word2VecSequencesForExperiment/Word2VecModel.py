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

trainedModel = KeyedVectors.load_word2vec_format('./gensim_models/vectors.bin',binary=True) # Word2Vec model 
allWords = trainedModel.index_to_key # All words trained in the model
vectors = trainedModel.vectors # All word embeddings for the words in the model 

# # ------------------------------------------------------------------------ #
# # Use Word2Vec similarity function to get candidate words for each ambiguous
# # word and its two meanings

# Smaller the angle - bigger the cosine similarity - more similar the word
candidateWords = []
meaning1 = 'car'
meaning2 = 'bus' 
candidateWords = trainedModel.most_similar(positive=[meaning1, meaning2], topn=150) # Get the top 150 words that are similar to both meaning 1 and meaning 2
print(candidateWords)

# ------------------------- BAG OF WORDS FOR ALL OF THE PAIRS OF MEANINGS - YET TO BE CHARACTERISED BY WORD2VEC -------------------------- #

# Ambiguous BOW chosen using Word2Vec and some I added in myself. The correct one should be uncommented depending on the target words
# used. i.e. for 'CarBus chosenWords =' set meaning1 (above) to be car and meaning2 to be bus and run the code using the chosen words assigned
# to CarBus

# CarBus 
chosenWords = ['engine', 'steer', 'drive', 'seat', 'wheels', 'commute', 'passenger', 'driver', 'fuel', 'motorway','intercity', 'open-top', 'windscreen', 'manual', 'automatic']
# HouseApartment: chosenWords = ['kitchen', 'bedroom', 'bathroom', 'doors', 'hall', 'floor', 'neighbourhood', 'rent', 'storey', 'landlord', 'neighbour', 'carpark', 'roof']
# AppleOrange: chosenWords = ['juice', 'skin', 'fructose', 'pip', 'seeds', 'flavour', 'tree', 'sweet', 'sour', 'candy', 'stalk', 'bitter', 'round', 'organic', 'pulp', 'nutritious']
# BedCouch:chosenWords = ['sleep', 'comfortable', 'nap', 'laydown', 'snooze', 'pajamas', 'support', 'lounge', 'cushion', 'television', 'futon', 'sit', 'snuggle', 'doze', 'reclined', 'pillow']
# CowPig: chosenWords = ['farm', 'smell', 'meat', 'livestock', 'tail', 'vetinary', 'breed', 'trotters', 'heavy', 'barn', 'flies', 'mud', 'manure', 'produce', 'barnyard']
# FootballRugby: chosenWords = ['match', 'ball', 'defence', 'stadium', 'club', 'coach', 'league', 'wing', 'cup', 'tackle', 'positions', 'dropkick', 'nations', 'tournament', 'offside']
# GoldSilver: chosenWords = ['ring', 'necklace', 'plated', 'medal', 'ingot', 'minted', 'mine', 'precious', 'enameled', 'antique', 'element', 'expensive', 'coin', 'trophy', 'shiny', 'gilded']
# ChickenPork: chosenWords = ['farm', 'animal', 'pulled', 'escalope', 'taco', 'minced', 'marinated', 'barbeque', 'char-grilled', 'sausage', 'roast', 'fillet', 'cutlet', 'fried', 'braised', 'crown', 'dumpling']
# MovieBook: chosenWords = ['story', 'biographical', 'characters', 'sequel', 'narrator', 'writer', 'long', 'genre', 'review', 'fiction', 'plot', 'trilogy', 'cliff-hanger', 'adaptation', 'fantasy', 'award', 'collection']
# WaterMilk: chosenWords = ['thirst', 'thin', 'nonfat', 'minerals', 'bake', 'odourless', 'bottle', 'coconut', 'coffee', 'tea', 'nutrient', 'nourish', 'pour', 'hydrate', 'cereal']
# BeeWasp: chosenWords = ['fly', 'wing', 'black', 'yellow', 'pest', 'queen', 'buzz', 'flower', 'sting', 'hive', 'pollinate', 'larva', 'swarm', 'allergy']
# TShirtShirt: chosenWords = ['button', 'sleeve', 'collar', 'armholes', 'pajamas', 'outfit', 'pullover', 'cotton', 'uniform', 'undergarment', 'comfortable', 'v-neck', 'plain', 'logo', 'polyester']
# FlowerGrass: chosenWords = ['garden', 'grow', 'weed', 'sprout', 'stem', 'ground', 'roots', 'die', 'meadow', 'aphid', 'seeds', 'pollen', 'dirt', 'water', 'foliage', 'spring']
# BusTrain: chosenWords = ['intercity', 'coach', 'countrylink', 'commute', 'wheels', 'driver', 'seat', 'passenger', 'ticket', 'double-decker', 'single-decker', 'route', 'transit', 'fare', 'station', 'stop', 'terminus', 'schedule']
# CatDog: chosenWords = ['fur', 'paw', 'cute', 'cosy', 'microchipped', 'neutered', 'pet', 'breed', 'stray', 'whiskers', 'train', 'wild', 'cuddle', 'feed', 'tail']
# UniversitySchool: chosenWords = ['faculty', 'junior', 'senior', 'pupil', 'graduate', 'subject', 'exam', 'teacher', 'mixed', 'societies', 'study', 'tuition', 'extracurriculars', 'curriculum', 'scholarship']
# CarrotPotato: chosenWords = ['salad', 'ground', 'dirt', 'roots', 'fibre', 'roast', 'soup', 'peel', 'chop', 'nutritional', 'crop', 'mash', 'sweet', 'boil', 'firm']
# RainSnow: chosenWords = ['wet', 'fall', 'storm', 'sleet', 'fog', 'cloud', 'cold', 'winter', 'precipitation', 'water', 'slip', 'moisture', 'overcast']
# OvenMicrowavechosenWords = ['kitchen', 'heat', 'food', 'door', 'reheat', 'timer', 'convection', 'defrost', 'cook', 'temperature', 'defrost', 'dial', 'window', 'open']
# Not used: CowSheep chosenWords = ['farm', 'smell', 'livestock', 'vetinary', 'breed', 'field', 'flies', 'hooves', 'manure', 'barnyard', 'milk', 'produce', 'herbivore', 'meat', 'tail']
# TelevisionSmartphone chosenWords = ['screen', 'stream', 'bluetooth', 'cast', 'media', 'news', 'wifi', 'entertainment', 'sound', 'picture', 'wireless', 'signal', 'brand', 'apps']

# Get the word embedded vector for each of the words in the chosen words above
indexOfChosenWord=[]
for word in chosenWords:
    indexOfChosenWord.append(indexGivenValue(word, allWords)) # Get the index of the chosen word in all words

# Using the indices gotten from above, find the vectors assoicated with this index in the vectors array
vectorsOfChosenWords=[]
for index in indexOfChosenWord:
    vectorsOfChosenWords.append(vectors[index])

# Turn this into a numpy array for use later
vectorsOfChosenWords = np.array(vectorsOfChosenWords, dtype=object)
print(vectorsOfChosenWords.shape)

# # # --------------------------------------------------------------------------- #

# Get the indices of the two meanings in all words
indexOfMeaning1 = indexGivenValue(meaning1, allWords)
indexOfMeaning2 = indexGivenValue(meaning2, allWords)

# Get the two meanings word embedded vectors using the indices gotten baove
vectorOfMeaning1 = vectors[indexOfMeaning1]
vectorOfMeaning2 = vectors[indexOfMeaning2]

# Stack the two vectors so that they can be passed into the cosine similarity funtion
totalVector = (np.column_stack((vectorOfMeaning1, vectorOfMeaning2))).transpose()

# # # --------------------------------------------------------------------------- #

# Empty lists to store information in the force sequences and re run percentile functions
meaning1Words = []; meaning2Words = []; ambiguousWords = []
percentageToMeaning1 = []; percentageToMeaning2 = []
meaning1Percentage = []; meaning2Percentage = []; ambigPercentage = []

# Function that forcefully creates the sequences if they can't be created by the percentile function
def forceSequences(meaning1Words, meaning2Words, meaning1Percentage, meaning2Percentage):

    # Sort the chosen words and percentages in ascending order
    sortedPercentage, sortedWords = (list(t) for t in zip(*sorted(zip(percentageToMeaning1, chosenWords)))) 

    # When the words lists are passed into the function check if either columna already has 4 words in it
    if ( (len(meaning1Words) < 4) and (len(meaning2Words) < 4)): # neither column has 4 words
        meaning1Words=[]; meaning2Words=[]; meaning1Percentage=[]; meaning2Percentage=[]

        meaning1Words = sortedWords[-4:] # Get last 4 words from meaning1 list (these correspond to the highest percentages)
        del sortedWords[-4:] # Delete from original sorted words list
        meaning1Percentage = sortedPercentage[-4:] # Get the highest percentages and put them in the meaning1 list
        del sortedPercentage[-4:] # Delete from original sorted percentage list

        meaning2Words = sortedWords[:4] # Take first four words (lowest percentages) to be meaning 2 list
        del sortedWords[:4] # Delete from original list
        meaning2Percentage = sortedPercentage[:4] # Take first four percentages 
        meaning2Percentage = [1-value for value in meaning2Percentage] # Append 1-percentage to the percentage list to get percentage2
        del sortedPercentage[:4] # Delete from original list

        ambiguousWords = sortedWords # Set the remaining words to be ambiguous
        ambigPercentage = sortedPercentage # Set the remaining words to be ambiguous 

    # If meaning 2 words are greater than 4 then it means we only need to force the meaning 1 list
    elif (len(meaning2Words) >=4 ): 
        meaning1Words=[]; meaning1Percentage=[]; toDelete=[]

        for value in meaning2Words: 
            toDelete.append(indexGivenValue(value, sortedWords)) # Find the index of the words in meaning 2 column in sorted words
        
        for index in sorted(toDelete, reverse=True):
            del sortedWords[index] # Delete the words at the above indicies from the sorted words list
            del sortedPercentage[index] # Delete the percentages at the above indicied from the sorted percentages list

        meaning2Words = meaning2Words # Make meaning2 words equal the list read in by the function
        meaning2Percentage = meaning2Percentage # Same thing with the percentages

        # Take last 4 percentages and words to be the meaning 1 list
        meaning1Words = sortedWords[-4:]
        del sortedWords[-4:]
        meaning1Percentage = sortedPercentage[-4:]
        del sortedPercentage[-4:]

        # Remaining words and percentages are put into ambiguous lists
        ambiguousWords = sortedWords
        ambigPercentage = sortedPercentage
    
    # If meaning 1 words are greater than 4 then it means we only need to force the meaning 2 list
    elif (len(meaning1Words) >= 4):
        meaning2Words=[]; meaning2Percentage=[]; toDelete=[]

        # Find the indices of the meaning 1 words in the sorted words list
        for value in meaning1Words:
            toDelete.append(indexGivenValue(value, sortedWords))

        # Delete the words and percentages in the sorted words and percentages lists  
        for index in sorted(toDelete, reverse=True):
            del sortedWords[index]
            del sortedPercentage[index]
        
        # Assign meaning 1 words and percentages to their respective lists
        meaning1Words = meaning1Words
        meaning1Percentage = meaning1Percentage

        # Take the first four words and percentages to be the meaning2 words and percentages
        meaning2Words = sortedWords[:4]
        del sortedWords[:4]
        meaning2Percentage = sortedPercentage[:4]
        meaning2Percentage = [1-value for value in meaning2Percentage] # Add 1-percentage to get the meaning 2 percentages
        del sortedPercentage[:4]

        # Remaining values go into the ambiguous words and percentages columns
        ambiguousWords = sortedWords 
        ambigPercentage = sortedPercentage

    return ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage

def reRunPercentile(ambiguousWords, ambigPercentage):

    # Function that takes the ambiguous words and percentages from before and runs the percentile function on them again
    # This seperates them out into meaning1, meaning2 and ambiguous words again but this time not caring about the length of the sequences.
    # These newly seperated ambiguous words are then added to the already made meaning1, meaning2 words made by the previous function.
        
    highPercentile = 70
    lowPercentile = 30

    tempAmbiguousWords=[]; tempAmbigPercentage=[]; tempMeaning1Words=[]; 
    tempMeaning1Percentage=[]; tempMeaning2Words=[]; tempMeaning2Percentage=[]

    for word, percentage in zip(ambiguousWords, ambigPercentage):

        small = np.percentile(ambigPercentage, lowPercentile)
        big = np.percentile(ambigPercentage, highPercentile)

        # If meaning1 word or meaning2 word is greater than the small percentile and bigger than the large percentile they are ambiguous
        if  ((((percentage > small) and (percentage < big)) or ((1-percentage >= 0.46) and (1-percentage > small)) and ((1-percentage >= 0.46) and (1-percentage < big))) and (word not in tempAmbiguousWords)): # Whilst either meanings is between the percentiles they are ambiguous words
            tempAmbiguousWords.append(word)
            tempAmbigPercentage.append(percentage)

        # If the percentage is less than the lower percentile it is a meaning 2 word 
        if ((percentage <= small) and (word not in tempAmbiguousWords)): 
            tempMeaning2Words.append(word)
            tempMeaning2Percentage.append(1-percentage)

        # If the percentage is greater than the higher perentile it is a meaning 1 word
        if ((percentage >= big) and (word not in tempAmbiguousWords)): 
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
    
    # Meaning 1 and meaning 2 must have at least 4 words in order to make differenctiable sequences later on
    while (exitWhileLoop == 0 or (len(meaning1Words) < 4) or (len(meaning2Words) < 4) ): 
        
        highPercentile = range(60, 100, 5) # Get the value to use for the higher percentile value
        lowPercentile = range(0, 40, 5) # Get the value to use for the lower percentile

        # If the values are entering an infinite loop then the percentile step needs to be increased
        if (increasePercentileStep == 1): 
            highPercentile = range(60, 100, 10) 
            lowPercentile = range(0, 40, 10) 

        if (exitWhileLoop == 1): # Exit while loop
            break
        
        for low in lowPercentile: # Iterate over the low percentile values keeping high percentile constant: (10, 60), (20, 60), (30, 60) etc.
            for high in highPercentile: # Atfer looping over low percentile increase high percentile: (10, 70), (20, 70), (30, 70) etc.

                if (exitWhileLoop == 1): # Exit while loop
                    break

                # reset arrays after each unsuccessful loop
                meaning1Words = []; meaning2Words = []; ambiguousWords = []
                meaning1Percentage = []; meaning2Percentage = []; ambigPercentage = []

                for word, percentage, word2, percentage2 in zip(chosenWords, percentageToMeaning1, chosenWords, percentageToMeaning2):

                    small = np.percentile(percentageToMeaning1, low) # Get the lower percentile value
                    big = np.percentile(percentageToMeaning1, high) # Get the higher percentile value

                    # Note: Percentage = meaning1 percentage. Percentage2 = meaning 2 percentage (1 - meaning1 percentage)
                    # If meaning1 percentage is greater than the small percentile value but smaller then add word to ambiguous
                    if ( ((percentage > small) and (percentage < big)) and ( (word not in ambiguousWords) and (word not in meaning1Words) and (word not in meaning2Words) )  ): 
                        ambiguousWords.append(word)
                        ambigPercentage.append(percentage)

                    # If meaning2 percentage is greater than the small percentile value but smaller then add word to ambiguous
                    if ((percentage2 > small) and (percentage2 < big) and ( (word not in ambiguousWords) and (word not in meaning1Words) and (word not in meaning2Words) ) ):
                        ambiguousWords.append(word2)
                        ambigPercentage.append(percentage2)   

                    # This is based on the percentage to meaning 1 value - if it is small (less than small) than it is likely to be a meaning 2 word 
                    # Check the word hasn't already been added to the ambiguous words above
                    if ((percentage <= small) and (word2 not in ambiguousWords)): # If the percentage is less than the lower percentile it is a meaning 2 word 
                        meaning2Words.append(word)
                        meaning2Percentage.append(1-percentage)

                    if ((percentage >= big) and (word not in ambiguousWords)): # If the percentage is greater than the higher perentile it is a meaning 1 word
                        meaning1Words.append(word)
                        meaning1Percentage.append(percentage)
 
                # Used for debugging when infinte loops were entered
                debug1 = len(meaning1Words); debug2 = len(meaning2Words); debug3 = len(ambiguousWords) 

                noOfIterations+=1
                if ( (noOfIterations >= 50) and (forLoopBroke == 0) ): # Likely entering an infinite loop so break out of for loop and increase the percentile step from 5 to 10
                    increasePercentileStep = 1; forLoopBroke = 1
                    break

                # If meaning 1 and meaning 2 sequences get to length of 4 words each then leave the while loop
                if ( (len(meaning1Words) >= 4) and (len(meaning2Words) >= 4) ):
                    exitWhileLoop = 1
                    break
                
                # If the number of iterations is over 100, then likely entered infinite loop where either or both meaning1/ menaing2 cannot get to 4 words long
                if (noOfIterations > 100):

                    # If code gets to this stage it is passed into the force sequences function 
                    ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage = forceSequences(meaning1Words, meaning2Words, meaning1Percentage, meaning2Percentage)

                    # Output from force sequences is put into a re run percentile function
                    tempAmbiguousWords, tempAmbigPercentage, tempMeaning1Words, tempMeaning1Percentage, tempMeaning2Words, tempMeaning2Percentage = reRunPercentile(ambiguousWords, ambigPercentage)
                   
                    ambiguousWords=[]; ambigPercentage=[]

                    # The division from the re run percentile function is added to the existing division to create the final division of the words
                    ambiguousWords.extend(tempAmbiguousWords); meaning1Words.extend(tempMeaning1Words); meaning2Words.extend(tempMeaning2Words)
                    ambigPercentage.extend(tempAmbigPercentage); meaning1Percentage.extend(tempMeaning1Percentage); meaning2Percentage.extend(tempMeaning2Percentage)
                    
                    exitWhileLoop = 1 
                    break

    return ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage


# Calculate and print the cosine similarities for each word in the bag of words and each meaning 
for word, chosenVector in zip(chosenWords, vectorsOfChosenWords):
    cosine = np.dot(totalVector, chosenVector)/(norm(totalVector, axis=1) * norm(chosenVector)) # cosine similarity function
    print("Cosine similarity of:", "\n", 
    meaning1,"and", word, "=", cosine[0], 
    meaning2, "and", word, "=", cosine[1])
    print("Percentage closer to", meaning1, cosine[0]/(cosine[0] + cosine[1])) # Get the percentage of how much closer each word is to meaning 1 than meaning 2
    print("Percentage closer to", meaning2, cosine[1]/(cosine[0] + cosine[1])) # Get the percentage of how much closer each word is to meaning 2 than meaning 1

    # Append the percentage values to arrays to pass into the percentile function to seperate words into meaning1, meaning2 and ambiguous cateogries
    percentageToMeaning1.append(cosine[0]/(cosine[0] + cosine[1]))
    percentageToMeaning2.append(cosine[1]/(cosine[0] + cosine[1]))
    print(len(percentageToMeaning1)); print(len(percentageToMeaning2))

# Pass these arrays into the normal percentile function
ambiguousWords, ambigPercentage, meaning1Words, meaning1Percentage, meaning2Words, meaning2Percentage = normalPercentile(chosenWords, percentageToMeaning1, percentageToMeaning2)

# remove=[]
# for value in ambigPercentage:
#     if value < 0.4:
#         remove.append(indexGivenValue(value, ambigPercentage))

# for indexV in remove:
#     print(type(meaning2Words))
#     print(ambiguousWords[indexV])
#     meaning2Words.append(ambiguousWords[indexV])
#     print(type(meaning2Percentage))
#     print(ambigPercentage[indexV])
#     meaning2Percentage.append(1-(ambigPercentage[indexV]))

# for delIndex in sorted(remove, reverse=True):
#     del ambiguousWords[delIndex]
#     del ambigPercentage[delIndex]

# print(remove)

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

# --------------------------------------- CREATE THE SEQUENCES ------------------------------------------- #
 
# Empty list to hold all of our sequences
listOfMeaning1Sequences = []; 

while (len(listOfMeaning1Sequences) < 8): # While there are less than 8 sequences keep going, each meaning has 8 sequences 

    if (meaning1Words == 4): # If the meaning1words column is equal to 4 then we want to use all of the words in our final sequences

        tempSeq = meaning1Words # Set the 4 words to a temporary array
        tempAmbig = random.sample(ambiguousWords, 4) # Take a random sample of 4 words from the ambiguous column to make 8 word sequence
 
        tempMeaning1Sequence = tempSeq + tempAmbig # Make the meaning 1 sequence equal to the meaning 1 words + sample of ambiguous words

        random.shuffle(tempMeaning1Sequence) # randomnly shuffle the list so that the meaning 1 words are not group together
        sequenceForMeaning1 = tempMeaning1Sequence # this is now a sequence for meaning 1

        listOfMeaning1Sequences.append(sequenceForMeaning1) # append the sequence to the list of sequences array

    else: # If the meaning1 word column is more than 4 words long than we do not need to put all of the words in one column

        meaning1Sequence = meaning1Words + ambiguousWords # Add the meaning 1 words to the ambiguous word
        randomSampleMeaning1Seq = random.sample(meaning1Sequence, 8) # Take a random sample of these 8 words

        # Check if the new sample sequence contains at least 4 words from the meaning1 column by checking the intersection values (values that are the same in both lists)
        crossOverValues=set.intersection(set(meaning1Words),set(randomSampleMeaning1Seq))  

        while len(crossOverValues) < 4: # Keep taking random samples of 8 words and checking the intersection until at least 4 words from meaning1 are the final sequence 
            randomSampleMeaning1Seq = random.sample(meaning1Sequence, 8) 
            crossOverValues=set.intersection(set(meaning1Words),set(randomSampleMeaning1Seq))

        listOfMeaning1Sequences.append(randomSampleMeaning1Seq) # Append this sequence to the list of meaning 1 sequences

# Extract the sequences from the array
meaning1S1 = listOfMeaning1Sequences[0]
meaning1S2 = listOfMeaning1Sequences[1]
meaning1S3 = listOfMeaning1Sequences[2]
meaning1S4 = listOfMeaning1Sequences[3]
meaning1S5 = listOfMeaning1Sequences[4]
meaning1S6 = listOfMeaning1Sequences[5]
meaning1S7 = listOfMeaning1Sequences[6]
meaning1S8 = listOfMeaning1Sequences[7]

# ----------------------- REPEAT THE SAME METHOD ABOVE FOR MEANING 2 SEQUENCES --------------- #

# Empty list to hold all of our sequences
listOfMeaning2Sequences = []

while (len(listOfMeaning2Sequences) < 8): # While there are less than 8 sequences keep going, each meaning has 8 sequences 

    if (meaning2Words == 4): # If the meaning 2 column is 4 words long then we want to use all four in our sequences

        tempSeq2 = meaning2Words # Set a temporary array to these 4 words
        tempAmbig2 = random.sample(ambiguousWords, 4) # Take a random sample of 4 words from the ambiguous array

        tempMeaning2Sequence = tempSeq2 + tempAmbig2 # Make the sequence equal to this set of words

        random.shuffle(tempMeaning2Sequence) # Randomnly shuffle the sequence so that the meaning2 words are not grouped together
        sequenceForMeaning2 = tempMeaning2Sequence # This shuffled list now our meaning2 sequence 

        listOfMeaning2Sequences.append(sequenceForMeaning2) # Add sequence to the sequences array

    else: # If the menaing2 column is greater than 4 words long then we want to use a sample of them

        meaning2Sequence = meaning2Words + ambiguousWords # Combine the meaning2 words and the ambiguous words
        randomSampleMeaning2Seq = random.sample(meaning2Sequence, 8) # Get a random sample of eight words from this list

        # We want to ensure that the sequences contain at least 4 words from the meaning2 column, this is done using list intersection
        crossOverValues2 = set.intersection(set(meaning2Words),set(randomSampleMeaning2Seq))

        # Keep taking random samples and checking the intersection values until there are 4 or more words from meaning2 in the sequence
        while len(crossOverValues2) < 4: 
            randomSampleMeaning2Seq = random.sample(meaning2Sequence, 8) 
            crossOverValues2 = set.intersection(set(meaning2Words),set(randomSampleMeaning2Seq))

        listOfMeaning2Sequences.append(randomSampleMeaning2Seq) # Add this sequence to the meaning2 sequences array

# Extract the sequences from the array
meaning2S1 = listOfMeaning2Sequences[0]
meaning2S2 = listOfMeaning2Sequences[1]
meaning2S3 = listOfMeaning2Sequences[2]
meaning2S4 = listOfMeaning2Sequences[3]
meaning2S5 = listOfMeaning2Sequences[4]
meaning2S6 = listOfMeaning2Sequences[5]
meaning2S7 = listOfMeaning2Sequences[6]
meaning2S8 = listOfMeaning2Sequences[7]


# ---------- Write the sequences to a CSV file for easy saving and reading -------------------------- #

csv_dict = {'Meaning one words': meaning1Words, 'Meaning one percentage': meaning1Percentage, 'Meaning two words': meaning2Words, 'Meaning two percentage': meaning2Percentage,
        'Ambiguous words': ambiguousWords, 'Ambiguous percentage to meaning one': ambigPercentage, 
        str(meaning1).capitalize()+' Sequence 1': meaning1S1, str(meaning1).capitalize()+' Sequence 2': meaning1S2, str(meaning1).capitalize()+' Sequence 3': meaning1S3,  str(meaning1).capitalize()+' Sequence 4': meaning1S4,  
        str(meaning1).capitalize()+' Sequence 5': meaning1S5, str(meaning1).capitalize()+' Sequence 6': meaning1S6, str(meaning1).capitalize()+' Sequence 7': meaning1S7,  str(meaning1).capitalize()+' Sequence 8': meaning1S8,  

        #Sequences for meaning 2
        str(meaning2).capitalize()+' Sequence 1': meaning2S1, str(meaning2).capitalize()+' Sequence 2': meaning2S2, str(meaning2).capitalize()+' Sequence 3': meaning2S3,  str(meaning2).capitalize()+' Sequence 4': meaning2S4,
        str(meaning2).capitalize()+' Sequence 5': meaning2S5, str(meaning2).capitalize()+' Sequence 6': meaning2S6, str(meaning2).capitalize()+' Sequence 7': meaning2S7,  str(meaning2).capitalize()+' Sequence 8': meaning2S8

}

df = pd.DataFrame(dict([ (k,pd.Series(v)) for k,v in csv_dict.items() ])) # Adds NaN values to the arrays to pad them out so that all the arrays are the same length to create the dataframe
df.to_csv('./SequenceCSVFiles/HouseApartment_SequencesCSV.csv', index=False)

# ---------------------------- MATLAB AUDIO CREATION ------------------------- #
# This code uses the values in the sequences to write a print statement that can be copy and pasted into 
# the Matlab 'createAudios.m' script in order to create the audios for each sequence in every pair of meanings

# ------------------- AUDIO FOR MEANING ONE SEQUENCE ONE -------------------- #

indices=[]
for wordInSequence in meaning1S1:
    indices.append(indexGivenValue(wordInSequence, chosenWords))

audioOrder = returnAudioOrder(indices)

print("% Audios for sequences with meaning 1")
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
# ------------------- AUDIO FOR MEANING ONE SEQUENCE FIVE -------------------- #

indices5=[]
for wordInSequence5 in meaning1S5:
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
            + " length("+str(audioOrder5[6])+")./fs," + " length("+str(audioOrder5[7])+")./fs];\n" )
print('\n')
print("A5 = table(audioLen);")
print("T5 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING ONE SEQUENCE SIX -------------------- #

indices6=[]
for wordInSequence6 in meaning1S6:
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
            + " length("+str(audioOrder6[6])+")./fs," + " length("+str(audioOrder6[7])+")./fs];\n" )
print('\n')
print("A6 = table(audioLen);")
print("T6 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING ONE SEQUENCE SEVEN -------------------- #

indices7=[]
for wordInSequence7 in meaning1S7:
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
            + " length("+str(audioOrder7[6])+")./fs," + " length("+str(audioOrder7[7])+")./fs];\n" )
print('\n')
print("A7 = table(audioLen);")
print("T7 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING ONE SEQUENCE EIGHT -------------------- #

indices8=[]
for wordInSequence8 in meaning1S8:
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
print("audioLen = [length("+str(audioOrder8[0])+")./fs," + " length("+str(audioOrder8[1])+")./fs," + " length("+str(audioOrder8[2])+")./fs," + " length("+str(audioOrder8[3])+")./fs," + " length("+str(audioOrder8[4])+")./fs," + " length("+str(audioOrder7[5])+")./fs,"
            + " length("+str(audioOrder8[6])+")./fs," + " length("+str(audioOrder8[7])+")./fs];\n" )
print('\n')
print("A8 = table(audioLen);")
print("T8 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #

# ------------------- AUDIO FOR MEANING TWO SEQUENCE ONE -------------------- #

indices9=[]
for wordInSequence9 in meaning2S1:
    indices9.append(indexGivenValue(wordInSequence9, chosenWords))

audioOrder9 = returnAudioOrder(indices9)

print("% Audios for sequences with meaning 2")
print("% Audio 9")
print("randNo = randNumber();")
print('\n')
print("combined9 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder9[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder9[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder9[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder9[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder9[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder9[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder9[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder9[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder9[0])+")./fs," + " length("+str(audioOrder9[1])+")./fs," + " length("+str(audioOrder9[2])+")./fs," + " length("+str(audioOrder9[3])+")./fs," + " length("+str(audioOrder9[4])+")./fs," + " length("+str(audioOrder9[5])+")./fs,"
            + " length("+str(audioOrder9[6])+")./fs," + " length("+str(audioOrder9[7])+")./fs];" )
print('\n')
print("A9 = table(audioLen);")
print("T9 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE TWO -------------------- #

indices10=[]
for wordInSequence10 in meaning2S2:
    indices10.append(indexGivenValue(wordInSequence10, chosenWords))

audioOrder10 = returnAudioOrder(indices10)

print("% Audio 10")
print("randNo = randNumber();")
print('\n')
print("combined10 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder10[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder10[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder10[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder10[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder10[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder10[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder10[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder10[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder10[0])+")./fs," + " length("+str(audioOrder10[1])+")./fs," + " length("+str(audioOrder10[2])+")./fs," + " length("+str(audioOrder10[3])+")./fs," + " length("+str(audioOrder10[4])+")./fs," + " length("+str(audioOrder10[5])+")./fs,"
            + " length("+str(audioOrder10[6])+")./fs," + " length("+str(audioOrder10[7])+")./fs];" )
print('\n')
print("A10 = table(audioLen);")
print("T10 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE THREE -------------------- #

indices11=[]
for wordInSequence11 in meaning2S3:
    indices11.append(indexGivenValue(wordInSequence11, chosenWords))

audioOrder11 = returnAudioOrder(indices11)

print("% Audio 11")
print("randNo = randNumber();")
print('\n')
print("combined11 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder11[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder11[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder11[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder11[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder11[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder11[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder11[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder11[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder11[0])+")./fs," + " length("+str(audioOrder11[1])+")./fs," + " length("+str(audioOrder11[2])+")./fs," + " length("+str(audioOrder11[3])+")./fs," + " length("+str(audioOrder11[4])+")./fs," + " length("+str(audioOrder11[5])+")./fs,"
            + " length("+str(audioOrder11[6])+")./fs," + " length("+str(audioOrder11[7])+")./fs];" )
print('\n')
print("A11 = table(audioLen);")
print("T11 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE FOUR -------------------- #

indices12=[]
for wordInSequence12 in meaning2S4:
    indices12.append(indexGivenValue(wordInSequence12, chosenWords))

audioOrder12 = returnAudioOrder(indices12)

print("% Audio 12")
print("randNo = randNumber();")
print('\n')
print("combined12 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder12[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder12[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder12[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder12[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder12[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder12[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder12[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder12[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder12[0])+")./fs," + " length("+str(audioOrder12[1])+")./fs," + " length("+str(audioOrder12[2])+")./fs," + " length("+str(audioOrder12[3])+")./fs," + " length("+str(audioOrder12[4])+")./fs," + " length("+str(audioOrder12[5])+")./fs,"
            + " length("+str(audioOrder12[6])+")./fs," + " length("+str(audioOrder12[7])+")./fs];" )
print('\n')
print("A12 = table(audioLen);")
print("T12 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING TWO SEQUENCE FIVE -------------------- #

indices13=[]
for wordInSequence13 in meaning2S5:
    indices13.append(indexGivenValue(wordInSequence13, chosenWords))

audioOrder13 = returnAudioOrder(indices13)

print("% Audio 13")
print("randNo = randNumber();")
print('\n')
print("combined13 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder13[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder13[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder13[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder13[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder13[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder13[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder13[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder13[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder13[0])+")./fs," + " length("+str(audioOrder13[1])+")./fs," + " length("+str(audioOrder13[2])+")./fs," + " length("+str(audioOrder13[3])+")./fs," + " length("+str(audioOrder13[4])+")./fs," + " length("+str(audioOrder13[5])+")./fs,"
            + " length("+str(audioOrder13[6])+")./fs," + " length("+str(audioOrder13[7])+")./fs];" )
print('\n')
print("A13 = table(audioLen);")
print("T13 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING TWO SEQUENCE SIX -------------------- #

indices14=[]
for wordInSequence14 in meaning2S6:
    indices14.append(indexGivenValue(wordInSequence14, chosenWords))

audioOrder14 = returnAudioOrder(indices14)

print("% Audio 14")
print("randNo = randNumber();")
print('\n')
print("combined14 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder14[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder14[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder14[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder14[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder14[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder14[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder14[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder14[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder14[0])+")./fs," + " length("+str(audioOrder14[1])+")./fs," + " length("+str(audioOrder14[2])+")./fs," + " length("+str(audioOrder14[3])+")./fs," + " length("+str(audioOrder14[4])+")./fs," + " length("+str(audioOrder14[5])+")./fs,"
            + " length("+str(audioOrder14[6])+")./fs," + " length("+str(audioOrder14[7])+")./fs];" )
print('\n')
print("A14 = table(audioLen);")
print("T14 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #
# # ------------------- AUDIO FOR MEANING TWO SEQUENCE SEVEN -------------------- #

indices15=[]
for wordInSequence15 in meaning2S7:
    indices15.append(indexGivenValue(wordInSequence15, chosenWords))

audioOrder15 = returnAudioOrder(indices15)

print("% Audio 15")
print("randNo = randNumber();")
print('\n')
print("combined15 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder15[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder15[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder15[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder15[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder15[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder15[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder15[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder15[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder15[0])+")./fs," + " length("+str(audioOrder15[1])+")./fs," + " length("+str(audioOrder15[2])+")./fs," + " length("+str(audioOrder15[3])+")./fs," + " length("+str(audioOrder15[4])+")./fs," + " length("+str(audioOrder15[5])+")./fs,"
            + " length("+str(audioOrder15[6])+")./fs," + " length("+str(audioOrder15[7])+")./fs];" )
print('\n')
print("A15 = table(audioLen);")
print("T15 = table(randNo);")
print('\n')

# ------------------------------------------------------------------------------- #
# ------------------- AUDIO FOR MEANING TWO SEQUENCE EIGHT -------------------- #

indices16=[]
for wordInSequence16 in meaning2S8:
    indices16.append(indexGivenValue(wordInSequence16, chosenWords))

audioOrder16 = returnAudioOrder(indices16)

print("% Audio 16")
print("randNo = randNumber();")
print('\n')
print("combined16 = [zeros(round(fs*0.5),size(f1,2));"+str(audioOrder16[0])+";zeros(round(fs*randNo(1)),size(f1,2));\n"
            +str(audioOrder16[1])+";zeros(round(fs*randNo(2)),size(f1,2));"+str(audioOrder16[2])+";zeros(round(fs*randNo(3)),size(f1,2));\n"
            +str(audioOrder16[3])+";zeros(round(fs*randNo(4)),size(f1,2));"+str(audioOrder16[4])+";zeros(round(fs*randNo(5)),size(f1,2));\n"
            +str(audioOrder16[5])+";zeros(round(fs*randNo(6)),size(f1,2));"+str(audioOrder16[6])+";zeros(round(fs*randNo(7)),size(f1,2));\n"
            +str(audioOrder16[7])+";zeros(round(fs*randNo(8)),size(f1,2))]; ")
print('\n')
print("audioLen = [length("+str(audioOrder16[0])+")./fs," + " length("+str(audioOrder16[1])+")./fs," + " length("+str(audioOrder16[2])+")./fs," + " length("+str(audioOrder16[3])+")./fs," + " length("+str(audioOrder16[4])+")./fs," + " length("+str(audioOrder16[5])+")./fs,"
            + " length("+str(audioOrder16[6])+")./fs," + " length("+str(audioOrder16[7])+")./fs];" )
print('\n')
print("A16 = table(audioLen);")
print("T16 = table(randNo);")
print('\n')

# # ------------------------------------------------------------------------------- #




   
