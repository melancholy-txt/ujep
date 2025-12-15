from pulp import *

# x = LpVariable('x', lowBound=0, cat="Integer")
# y = LpVariable('y', lowBound=0, cat="Integer")
# z = LpVariable('z', lowBound=0)

x1 = LpVariable('x1', lowBound=0)
x2 = LpVariable('x2', lowBound=0)

problem = LpProblem("myPorblem", LpMaximize)

problem += 2*x1 + 5*x2, "objective"
problem += 3*x1 + 2*x2 >= 6
problem += 2*x1 + 1*x2 <= 2
# problem += 5*x1 + x2 >= 10

print(problem)

status = problem.solve()
print(f"STATUS\n{LpStatus[status]}")

# for variable in problem.variables():
#     print(f"{variable.name} = {variable.varValue}")
# print("Objective =", value(problem.objective))

print("x1: ", x1.value(), " x2: ", x2.value(), " Objective: ", problem.objective.value())