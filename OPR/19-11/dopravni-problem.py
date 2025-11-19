from itertools import product
from pulp import LpProblem, LpMinimize, LpVariable, lpSum, LpInteger, LpStatus, makeDict, valuel 

# vstupni data ulohy
C1 = [[10, 20], [30, 40], [10, 20]]
C2 = [[40, 30, 10], [30, 60, 40]] # matice cen
a = [100, 200, 300] # kapacity
m = [400, 200]
b = [300, 150, 150] # pozadavky
# pomocne datové struktury
tovarny = ["P1", "P2", "P3"]
mezisklady = ["M1", "M2"]
odberatele = ["O1", "O2", "O3"]
kapacity_tovaren = { klic:hodnota for klic, hodnota in zip(tovarny, a)} # slovnik kapacit
kapacity_meziskladu = { klic:hodnota for klic, hodnota in zip(mezisklady, m)} # slovnik kapacit meziskladu  
pozadavky = { klic:hodnota for klic, hodnota in zip(odberatele, b)} # slovnik pozadavku
cesty1 = product(tovarny, mezisklady) # kartezsky soucin dodavatele x odberatele
cesty2 = product(mezisklady, odberatele)

model = LpProblem(name="Dopravní_problém", sense=LpMinimize) # úloha je minimalizační
x = LpVariable.dicts("Cesta",(tovarny, mezisklady),lowBound=0, upBound=None, cat = LpInteger) # vytvoření slovníkové proměnné
c = makeDict((tovarny, mezisklady), C1) # vytvoření slovníku s cenami
model+= (lpSum(x[d][o]*c[d][o] for d,o in cesty1), "Ucelova_fce") # přridání účelové funkce

# Omezení modelu
for d in tovarny:
  model += (lpSum([x[d][o] for o in mezisklady]) <= kapacity_tovaren[d], f"Omezení_dané_kapacitou_pro_{d}")

for o in mezisklady:
  model += (lpSum([x[d][o] for d in tovarny]) >= kapacity_meziskladu[o], f"Omezení_dané_požadavky_pro_{o}")

print(model)

result = model.solve()
# tisknutí proměnných modelu
print(f"Hotovo {result}")
print(f"Závěr: {model.status}, {LpStatus[model.status]}")
print(f"Optimum: {value(model.objective)}")
for var in model.variables():
   print(f"{var.name}: {var.value()}")
for name, constraint in model.constraints.items():
  print(f"{name}: {constraint.value()}")