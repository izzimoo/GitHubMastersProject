from gensim.models import Word2Vec
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
import re

df = pd.read_csv("embeddings.csv", decimal=',')

ambigWord=df.iloc[:,1]
ambigVector=df.iloc[:,2]
ambigVector = np.array(ambigVector)
print(ambigVector.shape)

meaningOneWord=df.iloc[:,3]
meaningOneVector=df.iloc[:,4]

meaningTwoWord=df.iloc[:,5]
meaningTwoVector=df.iloc[:,6]

# ********** COMBINE ALL 400-DIMENSION VECTORS INTO ONE VECTOR ***********
allData = []

for i in range(len(ambigWord)):
    if (i == 2):
        convertFloat = re.findall(r'\d+\.\d+', ambigVector[2])
        for val in convertFloat:
            allData.append(float(val))
    convertFloat = re.findall('-?\d\.\d+[Ee][+\-]\d\d?', ambigVector[i])
    for val in convertFloat:
        allData.append(float(val))

for i in range(len(meaningOneWord)):
    if (i == 2 or i == 4 or i == 6):
        j = i
        convertFloat = re.findall(r'\d+\.\d+', meaningOneVector[j])
        for val in convertFloat:
            allData.append(float(val))
    convertFloat = re.findall('-?\d\.\d+[Ee][+\-]\d\d?', meaningOneVector[i])
    for val in convertFloat:
        allData.append(float(val))

for i in range(len(meaningTwoWord)):
    if (i == 2 or i == 3 or i == 4):
        j = i
        convertFloat = re.findall(r'\d+\.\d+', meaningTwoVector[j])
        for val in convertFloat:
            allData.append(float(val))
    convertFloat = re.findall('-?\d\.\d+[Ee][+\-]\d\d?', meaningTwoVector[i])
    for val in convertFloat:
        allData.append(float(val))

allData = np.array(allData)
print(allData.shape)
allData = np.reshape(allData, (-2, 400))
print(allData.shape)

print(allData)

# ********** PERFORM PCA ON LARGE (21, 400) DIMENSION VECTOR ***********
# (21, 400) = 21 words each with a 400 dimension coordinate vector

pca = PCA()
pca_features = pca.fit_transform(allData)
print(pca_features.shape)
#print(pca_features)

# Shape after PCA is (21, 2) - down to 2 principal components where each
# word has a set of coordinates in x and y

# *** PLOT FRIST 2 PRINCIPAL COMPONENTS FOR EACH GROUP OF WORDS (ambigWord, meaningOneWord, meaningTwoWord) ******

plt.scatter(pca_features[0:7:,0],pca_features[0:7:,1], linewidths=6,color='b', label='Ambiguous Word')
plt.scatter(pca_features[7:14:,0],pca_features[7:14:,1], linewidths=6,color='r', label='Meaning One')
plt.scatter(pca_features[14::,0],pca_features[14::,1], linewidths=6,color='g', label='Meaning Two')

for i, word in enumerate(ambigWord, start=0):
    plt.annotate(word,xy=(pca_features[i,0], pca_features[i,1]))
for i, word in enumerate(meaningOneWord, start=7): #start = 7, tells enumerate to start at 7 not 0 to ensure correct points are labelled
    plt.annotate(word,xy=(pca_features[i,0], pca_features[i,1]))
for i, word in enumerate(meaningTwoWord, start=14):
    plt.annotate(word,xy=(pca_features[i,0], pca_features[i,1]))

plt.xlabel("Principal component 1", size=10)
plt.ylabel("Principal component 2", size=10)
plt.title("Word Embedding Space", size=15)
plt.legend(loc='upper right')

plt.show()
