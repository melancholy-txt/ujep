def bubblesort(f: list, asc=True) -> list:
    swapped = True
    while swapped:
        swapped = False
        for i in range(1, len(f)):
            if f[i-1] > f[i]:
                f[i-1], f[i] = f[i], f[i-1]
                swapped = True
        if not swapped:
            return f
    return f

f1 = [4,2,3,1]
f2 = [4,6,3,1,9,7,5,3]
f3 = [1,2,3,4]
# print(bubblesort(f1))
# print(bubblesort(f2))
# print(bubblesort(f3))