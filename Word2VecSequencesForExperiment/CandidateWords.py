import numpy as np
from gensim.models import KeyedVectors
from numpy.linalg import norm
np.seterr(divide='ignore', invalid='ignore')

# ----------------------------------------------------------------------- #
# ---------- TRAIN MODEL AND OBTAIN ALL WORDS AND VECTORS ----------- #

trainedModel = KeyedVectors.load_word2vec_format('./gensim_models/vectors.bin',binary=True,limit=298887)
allWords = trainedModel.index_to_key
vectors = trainedModel.vectors

# # ------------------------------------------------------------------------ #
# # Use Word2Vec similarity function to get candidate words for each ambiguous
# # word and its two meanings

# Smaller the angle - bigger the cosine similarity - more similar the word

meaning1 = 'television' 
meaning2 = 'smartphone' 
candidateWords = []
candidateWords = trainedModel.most_similar(positive=[meaning1, meaning2], topn=150)
print(candidateWords)