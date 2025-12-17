from pulp import *

# model = LpProblem("NejkratsiCesta", LpMinimize)
model = LpProblem("NejdelsiCesta", LpMaximize)


V = ['s', '1', '2', '3', '4', 't']
E = {
    's1': 10, 
    's2': 20,
    '13': 12,
    '21': 6,
    '23': 6,
    '24': 10,
    '34': 5,
    '3t': 15,
    '4t': 16
}
x = {}
c = {}
for var, val in E.items():
    x[var] = LpVariable(var, cat=LpBinary)
    c[var] = val

print(x)

model += lpSum([c[key] * x[key] for key in x]), "Objektivni funkce - maximalizace delky cesty"
model += x['s1'] + x['s2'] == 1, "Uzel s"
model += x['s1'] + x['21'] == x['13'], "Uzel 1"
model += x['s2'] == x['21'] + x['23'] + x['24'], "Uzel 2"
model += x['13'] + x['23'] == x['34'] + x['3t'], "Uzel 3"
model += x['24'] + x['34'] == x['4t'], "Uzel 4"
model += x['3t'] + x['4t'] == 1, "Uzel t"

result = model.solve()
print(f"Hotovo: {result}")
print(f"Závěr: {model.status}, {LpStatus[model.status]}")
print(f"Optimum: {model.objective.value()}")
for v in model.variables():
    print(f"{v.name}: {v.value()}")

# výpis duálních proměnných
print("\nDuální proměnné:")
for name, c in model.constraints.items():
    print(f"Omezení: {name}, Duální proměnná: {c.pi}, Přídavná proměnná: {c.slack}")