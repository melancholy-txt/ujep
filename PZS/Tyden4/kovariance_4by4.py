# import sys
# import os
# sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import numpy as np
import scipy as sp
import pandas as pd
from scipy import signal
from matplotlib import pyplot as plt
from SignalGen import sinus, nahodny, pilovy, obdelnikovy

f = 5  # frekvence signálu
delka = 1  # délka signálu v sekundách
vzorkovaci_frekvence = 100  # vzorkovací frekvence

sig_sinus = sinus(f, delka, vzorkovaci_frekvence, amplituda=2)
sig_pilovy = pilovy(f, delka, vzorkovaci_frekvence, amplituda=2)
sig_obdelnikovy = obdelnikovy(f, delka, vzorkovaci_frekvence, amplituda=2)
sig_nahodny = nahodny(delka, vzorkovaci_frekvence, amplituda=2)

cov = np.cov([sig_sinus[1], sig_pilovy[1], sig_obdelnikovy[1], sig_nahodny[1]])
print("Kovarianční matice 4x4:")
print(cov)
df = pd.DataFrame(cov, 
             index=['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'], 
             columns=['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'])
print(df)

# plt.figure(figsize=(8, 6))
# plt.title('Kovarianční matice 4x4')
# plt.axis('off') 
# table = plt.table(
#     cellText=np.round(cov, 2), 
#     colLabels=['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'],
#     rowLabels=['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'],
#     cellLoc='center',
#     loc='center'
# )
# table.auto_set_font_size(False)
# table.set_fontsize(10)
# table.scale(1, 2)

# plt.figure(figsize=(8, 6))
# plt.imshow(cov, cmap='coolwarm', aspect='auto')
# plt.colorbar(label='Covariance')
# plt.xticks(range(4), ['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'])
# plt.yticks(range(4), ['Sinus', 'Pilový', 'Obdélníkový', 'Náhodný'])
# plt.title('Kovarianční matice 4x4')
# plt.show()