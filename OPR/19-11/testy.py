from pulp.constants import LpInteger #import konstanty
from pulp import LpMaximize, LpMinimize, LpProblem, LpStatus, LpVariable, lpSum, lpDot
import numpy as np
import atexit
import matplotlib.pyplot as plt


# model = LpProblem(name="test", sense=LpMaximize)
# x1 = LpVariable(name="x1", lowBound=1)
# x2 = LpVariable(name="x2", lowBound=0)
# x3 = LpVariable(name="x3", lowBound=0)

# model += (4*x1 + 6*x2 + 8*x3, "Objective")
# model += (x1 + x2 + 4*x3 >= 10, "Constraint_1")
# model += (20*x1 + 40*x2 - x3 <= 40, "Constraint_2")

x = [1, 2, 3, 4, 5, 6, 7]
y = [1.5, 2.5, 7, 9, 1.5, 0.5, -1]
e = []
w = [1, 1, 2, 3, 4, 2, 1]
for i in range(len(x)):
    e.append(LpVariable(name=f"e{i}", lowBound=0))

b1 = LpVariable(name="b1")
b2 = LpVariable(name="b2")  
b0 = LpVariable(name="b0")

model = LpProblem(name="regrese", sense=LpMinimize)
# model += (lpSum(e), "Objective")
model += (lpDot(e, w), "Objective")


for i in range(len(x)):
  model += (b0 + b1*x[i] + b2*x[i]*x[i] - y[i] <= e[i], f"Constraint_pos_{i}" )
  model += (y[i] - b0 - b1*x[i] - b2*x[i]*x[i] <= e[i], f"Constraint_neg_{i}" )
     
    

def plot_solution():
  # get numeric values (only available after solve)
  b0_v = getattr(b0, "value", lambda: None)()
  b1_v = getattr(b1, "value", lambda: None)()
  b2_v = getattr(b2, "value", lambda: None)()
  if b0_v is None or b1_v is None or b2_v is None:
    return
  xs = np.array(x)
  ys = np.array(y)
  x_fit = np.linspace(xs.min(), xs.max(), 300)
  y_fit = b0_v + b1_v * x_fit + b2_v * x_fit**2

  plt.figure()
  plt.scatter(xs, ys, color="tab:blue", label="data points")
  plt.plot(x_fit, y_fit, color="tab:red", label="quadratic fit")
  plt.xlabel("x")
  plt.ylabel("y")
  plt.legend()
  plt.grid(True)
  plt.title("Original points and approximation")
  plt.show()

atexit.register(plot_solution)


result = model.solve()
print(f"Hotovo {result}")
print(f"Závěr: {model.status}, {LpStatus[model.status]}")
print(f"Optimum: {model.objective.value()}")
for var in model.variables():
  print(f"{var.name}: {var.value()}")
for name, constraint in model.constraints.items():
  print(f"{name}: {constraint.value()}")

