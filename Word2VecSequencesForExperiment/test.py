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

trainedModel = KeyedVectors.load_word2vec_format('./gensim_models/vectors.bin',binary=True,limit=298887) # Word2Vec model used, sent by Amir
allWords = trainedModel.index_to_key # All words trained in the gensim model
vectors = trainedModel.vectors # All the words' word embeddings

# # ------------------------------------------------------------------------ #
# # Use Word2Vec similarity function to get candidate words for each ambiguous
# # word and its two meanings

# Smaller the angle - bigger the cosine similarity - more similar the word

meaning1 = 'house'
meaning2 = 'apartment' 
candidateWords = []
candidateWords = trainedModel.most_similar(positive=[meaning1, meaning2], topn=150) # Get the top 150 words that are similar to both meaning 1 and meaning 2
print(candidateWords)