from pulp import *

prob = LpProblem("problem", LpMinimize)

x1 = LpVariable("x1", lowBound=0)
x2 = LpVariable("x2", lowBound=0)

prob += 2*x1 + 5*x2, "objective"
prob += 2*x1 + 1*x2 <= 2
prob += 3*x1 + 2*x2 >= 6

status = prob.solve()

print(LpStatus[status])
