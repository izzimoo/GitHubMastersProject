from gensim.models import Word2Vec
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
import re

df = pd.read_csv("./CSVFiles/Ambigembedding.csv", index_col=0)
df1 = pd.read_csv("./CSVFiles/Meaning1embedding.csv", index_col=0)
df2 = pd.read_csv("./CSVFiles/Meaning2embedding.csv", index_col=0)

ambigWord = df.columns
meaningOneWord = df1.columns
meaningTwoWord = df2.columns

ambigVector=df.iloc[:,0:]
ambigVector = np.array(ambigVector)

meaningOneVector=df1.iloc[:,0:]
meaningOneVector = np.array(meaningOneVector)

meaningTwoVector=df2.iloc[:,0:]
meaningTwoVector = np.array(meaningTwoVector)

# ********** COMBINE ALL 400-DIMENSION VECTORS INTO ONE VECTOR ***********
allData = []

allData = np.concatenate((ambigVector, meaningOneVector, meaningTwoVector), axis=1)
allData = allData.transpose()
print(allData.shape)
#allData = StandardScaler().fit_transform(allData)
#allData = np.reshape(allData, (400, -2))
#print(allData.shape)

# ********** PERFORM PCA ON LARGE (21, 400) DIMENSION VECTOR ***********
# (21, 400) = 21 words each with a 400 dimension coordinate vector
pca = PCA()
#allData = StandardScaler().fit_transform(allData)
pca_features = pca.fit_transform(allData)
# # Shape after PCA is (21, 21) - then we obtain the first two principal components

# # *** PLOT FRIST 2 PRINCIPAL COMPONENTS FOR EACH GROUP OF WORDS (ambigWord, meaningOneWord, meaningTwoWord) ******

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


###### All data code #######

#bdf = pd.read_csv("all_words.csv")
#words = bdf.iloc[:,1]
