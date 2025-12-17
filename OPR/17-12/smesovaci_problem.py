import pandas as pd
from pulp import *

df = pd.read_csv('data.csv', delimiter=';' )
print(df.head(10))
# piv = df.pivot_table(index='Jidlo (100g)', values=['Cena (Kč)', 'Energie (kJ/100)', 'Sacharidy', 'Bílkoviny', 'Tuky'], aggfunc='sum')
# print(piv)

# Define the problem
model = LpProblem("Jídelníček", LpMinimize)

x = []
for item in df['Jidlo (100g)']:
    x.append(LpVariable(item, lowBound=0))
c = []
for cost in df['Cena (Kč)']:
    c.append(cost)
e = []
for energy in df['Energie (kJ/100)']:
    e.append(energy)
s = []
for carbs in df['Sacharidy']:
    s.append(carbs)
b = []
for protein in df['Bílkoviny']:
    b.append(protein)
t = []
for fat in df['Tuky']:
    t.append(fat)

# print all fields for debugging
# print(x)
# print(c)
# print(e)
# print(s)
# print(b)
# print(t)

model += lpDot(c, x), "Celkové náklady na jídlo"
model += lpDot(e, x) <= 12000, "Maximální energie"
model += lpDot(e, x) >= 8000, "Minimální energie"
model += lpDot(s, x) <= 400, "Maximální sacharidy"
model += lpDot(s, x) >= 200, "Minimální sacharidy"
model += lpDot(b, x) <= 180, "Maximální bílkoviny"
model += lpDot(b, x) >= 100, "Minimální bílkoviny"
model += lpDot(t, x) <= 120, "Maximální tuky"
model += lpDot(t, x) >= 60, "Minimální tuky"

print(model.status)

result = model.solve()
print(f"Hotovo: {result}")
print(f"Závěr: {model.status}, {LpStatus[model.status]}")
print(f"Optimum: {model.objective.value()} Kč")
for v in model.variables():
    print(f"{v.name}: {v.value()}")

# výpis duálních proměnných
print("\nDuální proměnné:")
for name, c in model.constraints.items():
    print(f"Omezení: {name}, Duální proměnná: {c.pi}, Přídavná proměnná: {c.slack}")

