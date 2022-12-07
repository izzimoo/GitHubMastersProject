from gensim.models import Word2Vec
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np
import re

df = pd.read_csv("embeddings.csv")
#print(df.head())

ambigWord=df.iloc[:,1]
ambigVector=df.iloc[:,2]

meaningOneWord=df.iloc[:,3]
meaningOneVector=df.iloc[:,4]

meaningTwoWord=df.iloc[:,5]
meaningTwoVector=df.iloc[:,6]

###### ********************* AMBIGUOUS WORDS ***************************

ambigData = []

for i in range(len(ambigWord)):
    convertFloat = re.findall(r'\d+\.\d+', ambigVector[i])
    for val in convertFloat:
        ambigData.append(float(val))

ambigData = np.array(ambigData)
ambigData = np.reshape(ambigData, (-2, 400))
#scaler.fit(ambigData)
#ambigData = scaler.transform(ambigData)
print(ambigData.shape)
print(ambigData[:10])

pca = PCA(n_components=2)
pca_features = pca.fit_transform(ambigData)
print(pca_features.shape)
print(pca_features[:10])

#### ****************** MEANING ONE WORDS ***************************

meaningOneData = []

for i in range(len(meaningOneWord)):
    convertFloat = re.findall(r'\d+\.\d+', meaningOneVector[i])
    for val in convertFloat:
        meaningOneData.append(float(val))

meaningOneData = np.array(meaningOneData)
meaningOneData = np.reshape(meaningOneData, (-2, 400))
#scaler.fit(meaningOneData)
#allMeaning1Data = scaler.transform(meaningOneData)
print(meaningOneData.shape)

pca2 = PCA(n_components=2)
pca_features2 = pca2.fit_transform(meaningOneData)
print(pca_features2.shape)
#print(pca_features2[:10])

#### ****************** MEANING TWO WORDS ***************************

meaningTwoData = []

for i in range(len(meaningTwoWord)):
    convertFloat = re.findall(r'\d+\.\d+', meaningTwoVector[i])
    for val in convertFloat:
        meaningTwoData.append(float(val))

meaningTwoData = np.array(meaningTwoData)
meaningTwoData = np.reshape(meaningTwoData, (-2, 400))
#scaler.fit(meaningTwoData)
#allMeaning2Data = scaler.transform(meaningTwoData)
print(meaningTwoData.shape)

pca3 = PCA(n_components=2)
pca_features3 = pca3.fit_transform(meaningTwoData)
print(pca_features3.shape)
#print(pca_features3[:10])

#### ******************* DISPLAY DATA ON SCATTER ******************************

plt.scatter(pca_features[:,0],pca_features[:,1], linewidths=6,color='b', label='Ambiguous Word')
plt.scatter(pca_features2[:,0],pca_features2[:,1], linewidths=6,color='r', label='Meaning One')
plt.scatter(pca_features3[:,0],pca_features3[:,1], linewidths=6,color='g', label='Meaning Two')
for i, word in enumerate(ambigWord):
    plt.annotate(word,xy=(pca_features[i,0], pca_features[i,1]))
for i, word in enumerate(meaningOneWord):
    plt.annotate(word,xy=(pca_features2[i,0], pca_features2[i,1]))
for i, word in enumerate(meaningTwoWord):
    plt.annotate(word,xy=(pca_features3[i,0], pca_features3[i,1]))

plt.xlabel("Principal component 1", size=10)
plt.ylabel("Principal component 2", size=10)
plt.title("Word Embedding Space", size=15)
plt.legend(loc='upper right')

plt.show()



# convertFloat = re.findall(r'\d+\.\d+', ambigVector[1])
# for val in convertFloat:
#     passageArr.append(float(val))
#
# convertFloat = re.findall(r'\d+\.\d+', ambigVector[2])
# for val in convertFloat:
#     batArr.append(float(val))
#
# convertFloat = re.findall(r'\d+\.\d+', ambigVector[3])
# for val in convertFloat:
#     parkArr.append(float(val))
#
# convertFloat = re.findall(r'\d+\.\d+', ambigVector[4])
# for val in convertFloat:
#     ringArr.append(float(val))
#
# convertFloat = re.findall(r'\d+\.\d+', ambigVector[5])
# for val in convertFloat:
#     matchArr.append(float(val))
#
# convertFloat = re.findall(r'\d+\.\d+', ambigVector[6])
# for val in convertFloat:
#     brightArr.append(float(val))
#
# npqueen = np.array(queenArr)
# print(npqueen.shape)
#
# nppassge = np.array(passageArr)
# print(nppassge.shape)
#
# npbat = np.array(batArr)
# print(npbat.shape)
#
# nppark = np.array(parkArr)
# print(nppark.shape)
#
# npring = np.array(ringArr)
# print(npring.shape)
#
# npmatch = np.array(matchArr)
# print(npmatch.shape)
#
# npbright = np.array(brightArr)
# print(npbright.shape)
#
# allData = []
# allData.append(npqueen)
# allData.append(nppassge)
# allData.append(npbat)
# allData.append(nppark)
# allData.append(npring)
# allData.append(npmatch)
# allData.append(npbright)
# npalldata = np.array(allData)
# #npalldata = npalldata.transpose()
# print(npalldata.shape)

# X = ambigWord[npqueen]
# test = pd.DataFrame(X)
# print(test.shape)
# print(test.head())
#
#
# #
#queenArr2D = np.reshape(npqueen, (-1, 2))
#
