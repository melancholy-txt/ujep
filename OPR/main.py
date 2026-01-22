from pulp import LpProblem, LpVariable, LpMinimize, LpStatus, value, lpSum

input_grid = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
]


rows = range(9)
cols = range(9)
vals = range(1, 10)


prob = LpProblem("Sudoku", LpMinimize)


# a dictionary of binary variables: choices[row][col][value]
choices = LpVariable.dicts("choice", (rows, cols, vals), cat='Binary')


# Constraint 1: Each cell must have exactly one value
for r in rows:
    for c in cols:
        prob += lpSum([choices[r][c][v] for v in vals]) == 1

# Constraint 2: Each value must appear exactly once in each row
for r in rows:
    for v in vals:
        prob += lpSum([choices[r][c][v] for c in cols]) == 1

# Constraint 3: Each value must appear exactly once in each column
for c in cols:
    for v in vals:
        prob += lpSum([choices[r][c][v] for r in rows]) == 1

# Constraint 4: Each value must appear exactly once in each 3x3 box
for r_box in range(0, 9, 3):
    for c_box in range(0, 9, 3):
        for v in vals:
            prob += lpSum([choices[r_box + i][c_box + j][v]
                                for i in range(3) for j in range(3)]) == 1

# Constraint 5: Respect the initial given values from the image
for r in rows:
    for c in cols:
        if input_grid[r][c] != 0:
            prob += choices[r][c][input_grid[r][c]] == 1


prob.solve() # msg=0 suppresses solver log output

# print(prob)

status = prob.solve()
print(f"STATUS\n{LpStatus[status]}")

for variable in prob.variables():
    print(f"{variable.name} = {variable.varValue}")

# I used AI to help me write the code to display the Sudoku solution :D
if LpStatus[prob.status] == "Optimal":
    print("Solution Found:\n")
    print("-" * 25)
    for r in rows:
        line = "| "
        for c in cols:
            for v in vals:
                if value(choices[r][c][v]) == 1:
                    line += str(v) + " "
            if (c + 1) % 3 == 0:
                line += "| "
        print(line)
        if (r + 1) % 3 == 0:
            print("-" * 25)
else:
    print("No solution exists for this Sudoku.")