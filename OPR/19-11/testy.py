from pulp.constants import LpInteger #import konstanty
from pulp import LpMaximize, LpProblem, LpStatus, LpVariable

model = LpProblem(name="test", sense=LpMaximize)
x1 = LpVariable(name="x1", lowBound=1)
x2 = LpVariable(name="x2", lowBound=0)
x3 = LpVariable(name="x3", lowBound=0)

model += (4*x1 + 6*x2 + 8*x3, "Objective")
model += (x1 + x2 + 4*x3 >= 10, "Constraint_1")
model += (20*x1 + 40*x2 - x3 <= 40, "Constraint_2")

result = model.solve()
print(f"Hotovo {result}")
print(f"Závěr: {model.status}, {LpStatus[model.status]}")
print(f"Optimum: {model.objective.value()}")
for var in model.variables():
  print(f"{var.name}: {var.value()}")
for name, constraint in model.constraints.items():
  print(f"{name}: {constraint.value()}")

