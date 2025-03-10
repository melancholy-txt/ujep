def bubblesort(f: list, asc=True) -> list:
    issorted = False
    irazeni = 0
    while not issorted:
        issorted = True
        for i in range(1, len(f) - irazeni):
            if f[i-1] > f[i]:
                f[i-1], f[i] = f[i], f[i-1]
                issorted = False
        irazeni += 1
        # if not issorted:
        #     if asc:
        #         return f
        #     else:
        #         return f[::-1]
    if asc:
        return f
    else:
        return f[::-1]

def selectsort(f: list, asc=True) -> list:
    for isort in range(len(f)):
        maxindex = isort
        # print(f"def max index: {maxindex}")
        for inum in range(isort, len(f)):
            if f[inum] > f[maxindex]:
                maxindex = inum
                # print(f"new max index: {maxindex}")

        f.insert(isort, f[maxindex])
        f.pop(maxindex+1)
    return f
        

f1 = [4,2,3,1]
f2 = [4,6,3,1,9,7,5,2,8]
f3 = [1,2,3,4]
print(selectsort(f2))
# print(bubblesort(f1))
# print(bubblesort(f2))
# print(bubblesort(f3))