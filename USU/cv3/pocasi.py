import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LogisticRegression
from pathlib import Path
from sklearn.preprocessing import StandardScaler, MinMaxScaler

from sklearn.model_selection import train_test_split

csv_path = Path(__file__).resolve().parent / "kopisty_pocasi_rozsireno.csv"
data = pd.read_csv(csv_path, sep=";", decimal=",")
data = data.dropna()  # drop rows with missing values
# print(data.head())
# newdata = pd.DataFrame()
newdata = data
#drop columns that are not needed for modeling
newdata["datum"] = pd.to_datetime(data["datum"], format="%d.%m.%Y")
newdata["mesic"] = newdata["datum"].dt.month
# newdata["rocni_obdobi"] = newdata["mesic"].apply(lambda x: (x % 12 + 3) // 3)  # 1= jaro, 2 = léto, 3 = podzim, 4 = zima
# rocni obodbi jako dummy variables
newdata["jaro"] = (newdata["mesic"].isin([3, 4, 5])).astype(int)
newdata["leto"] = (newdata["mesic"].isin([6, 7, 8])).astype(int)
newdata["podzim"] = (newdata["mesic"].isin([9, 10, 11])).astype(int)
newdata["zima"] = (newdata["mesic"].isin([12, 1, 2])).astype(int)
# newdata["teplota"] = data["teplota"]
newdata["srazky"] = (data["uhrn_srazky_1"].astype(float) + data["uhrn_srazky_2"].astype(float))/2
newdata["prselo"] = (newdata["srazky"] > 1).astype(int)  # create binary target variable
newdata["target_zitra_prsi"] = newdata["prselo"].shift(-1)
newdata = newdata.drop(columns=["vypar", "uhrn_srazky_1", "uhrn_srazky_2"])
# print(newdata.head())

# korelacni matice s barvickama

for lag in range(1, 4):
    newdata[f'srazky_lag_{lag}'] = newdata['srazky'].shift(lag)
    newdata[f'teplota_lag_{lag}'] = newdata['teplota'].shift(lag)
    newdata[f'prselo_lag_{lag}'] = newdata['prselo'].shift(lag)
    newdata[f'vlhkost_lag_{lag}'] = newdata['vlhkost'].shift(lag)
    newdata[f'tlak_lag_{lag}'] = newdata['tlak'].shift(lag)

# Protože použitím shift() vzniknou NaN hodnoty z obou stran (nemáme zítřek, nemáme historii pro první 3 dny), musíme je zahodit
newdata = newdata.dropna()

corr_matrix = newdata.corr()
plt.figure(figsize=(15, 13))
plt.imshow(corr_matrix, cmap="coolwarm", vmin=-1, vmax=1)
plt.xticks(range(len(newdata.columns)), newdata.columns, rotation=90)
plt.yticks(range(len(newdata.columns)), newdata.columns)
# show numbers in the cells
for i in range(len(newdata.columns)):
    for j in range(len(newdata.columns)):
        plt.text(j, i, f"{corr_matrix.iloc[i, j]:.2f}", ha="center", va="center", color="black")
# plt.show()

# --- MANUÁLNÍ VÝBĚR PŘÍZNAKŮ ---
# Tady si přesně vybereš, jaké sloupce (příznaky) do modelu pustíš
vybrane_priznaky = [
    'teplota', 
    'srazky', 
    'tlak',
    # 'vlhkost',
    # 'prselo',
    # 'rocni_obdobi', 
    # 'srazky_lag_1', 
    # 'srazky_lag_2',
    # 'srazky_lag_3',
    # 'srazky_lag_4',
    # 'srazky_lag_5',
    # 'teplota_lag_1',
    # 'teplota_lag_2',
    # 'teplota_lag_3',
    # 'teplota_lag_4',
    # 'teplota_lag_5',
    'tlak_lag_1',
    # 'tlak_lag_2',
    # 'tlak_lag_3',
    # 'jaro', 'leto', 'podzim', 'zima'
]

X = newdata[vybrane_priznaky]  # Použijeme jen vybrané sloupce
# X = newdata.drop(columns=["target_zitra_prsi", "datum", "mesic", "prselo", "srazky_lag_1", "srazky_lag_2", "srazky_lag_3", "teplota_lag_1", "teplota_lag_2", "teplota_lag_3", "tlak_lag_2", "tlak_lag_3"])  # Použijeme všechny kromě cílové a nevýznamných
y = newdata["target_zitra_prsi"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, shuffle=False, random_state=42)

# --- NORMALIZACE DAT ---
scaler = MinMaxScaler()
# scaler = StandardScaler()


# Parametry (průměr, odchylka) zjistíme POUZE z trénovacích dat a rovnou je transformujeme
X_train_scaled = scaler.fit_transform(X_train)

# Testovací data jen transformujeme parametry naučenými z X_train
X_test_scaled = scaler.transform(X_test)

# --- MODELOVÁNÍ NA NORMALIZOVANÝCH DATECH ---
model = LogisticRegression(max_iter=1000, class_weight='balanced', random_state=42)

# Trénujeme už na normalizovaných
model.fit(X_train_scaled, y_train)

# Predikujeme z normalizovaných testovacích dat
y_pred = model.predict(X_test_scaled)

print("Accuracy: {:.2f}".format((y_pred == y_test).mean()))
