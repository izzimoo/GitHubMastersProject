import pandas as pd

df1 = pd.read_csv('./LengthSequences/Audios/AppleOrange_AudioLength.csv')
df2 = pd.read_csv('./LengthSequences/Audios/BedCouch_AudioLength.csv')
df3 = pd.read_csv('./LengthSequences/Audios/BeeWasp_AudioLength.csv')
df4 = pd.read_csv('./LengthSequences/Audios/CarBus_AudioLength.csv')
df5 = pd.read_csv('./LengthSequences/Audios/ChickenPork_AudioLength.csv')
df6 = pd.read_csv('./LengthSequences/Audios/CowPig_AudioLength.csv')
df7 = pd.read_csv('./LengthSequences/Audios/FootballRugby_AudioLength.csv')
df8 = pd.read_csv('./LengthSequences/Audios/GoldSilver_AudioLength.csv')
df9 = pd.read_csv('./LengthSequences/Audios/HouseApartment_AudioLength.csv')
df10 = pd.read_csv('./LengthSequences/Audios/MovieBook_AudioLength.csv')
df11 = pd.read_csv('./LengthSequences/Audios/WaterMilk_AudioLength.csv')


fd1 = pd.read_csv('./LengthSequences/Silences/AppleOrange_SilenceLength.csv')
fd2 = pd.read_csv('./LengthSequences/Silences/BedCouch_SilenceLength.csv')
fd3 = pd.read_csv('./LengthSequences/Silences/BeeWasp_SilenceLength.csv')
fd4 = pd.read_csv('./LengthSequences/Silences/CarBus_SilenceLength.csv')
fd5 = pd.read_csv('./LengthSequences/Silences/ChickenPork_SilenceLength.csv')
fd6 = pd.read_csv('./LengthSequences/Silences/CowPig_SilenceLength.csv')
fd7 = pd.read_csv('./LengthSequences/Silences/FootballRugby_SilenceLength.csv')
fd8 = pd.read_csv('./LengthSequences/Silences/GoldSilver_SilenceLength.csv')
fd9 = pd.read_csv('./LengthSequences/Silences/HouseApartment_SilenceLength.csv')
fd10 = pd.read_csv('./LengthSequences/Silences/MovieBook_SilenceLength.csv')
fd11 = pd.read_csv('./LengthSequences/Silences/WaterMilk_SilenceLength.csv')

total = 0

final = []
for i in range(0, 8, 1):
    test = df1.iloc[i]
    for val in test:
        total = total + val

final.append(total)
