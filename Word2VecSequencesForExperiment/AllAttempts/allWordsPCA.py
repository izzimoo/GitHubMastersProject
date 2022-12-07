import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
import random
import numpy as np

filename = "./CSVFiles/all_words.csv"
n = sum(1 for line in open(filename)) - 1 #number of records in file (excludes header)
s = 1000 #desired sample size
skip = sorted(random.sample(range(1,n+1),n-s)) #the 0-indexed header will not be included in the skip list
df = pd.read_csv(filename, skiprows=skip)

df.to_csv('./CSVFiles/sampleWords.csv')
words = df.iloc[:,1]
words = np.array(words)
print(words)
print(words.shape)
vectors = df.iloc[:,2:]

vectors = np.array(vectors)
print(vectors.shape)

# # ********** PERFORM PCA ON LARGE (1000, 400) DIMENSION VECTOR ***********

pca = PCA()
allData = StandardScaler().fit_transform(vectors)
pca_features = pca.fit_transform(vectors)
print(pca_features.shape)
# # # Shape after PCA is (1000, 400) - then we obtain the first two principal components
# # # *** PLOT FRIST 2 PRINCIPAL COMPONENTS FOR EACH GROUP OF WORDS (ambigWord, meaningOneWord, meaningTwoWord) ******

plt.scatter(pca_features[0],pca_features[1], linewidths=2,color='b')

for i, word in enumerate(words):
    plt.annotate(word,xy=(pca_features[i,0], pca_features[i,1]))

plt.show()
plt.xlabel("Principal component 1", size=10)
plt.ylabel("Principal component 2", size=10)
plt.title("Word Embedding Space", size=15)

