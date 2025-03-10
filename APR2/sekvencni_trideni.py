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
    

f1 = [4,2,3,1]
f2 = [4,6,3,1,9,7,5,3]
f3 = [1,2,3,4]
# print(bubblesort(f1))
# print(bubblesort(f2))
# print(bubblesort(f3))