import math

def exists(s, o) -> None|int:
    for iitem, item in enumerate(s):
        # print(f"{iitem}, {item}")
        if item == o:
            return iitem
    return None

def binexists(s,o)-> None|int:
    s = sorted(s)
    mid = int(math.floor(len(s)/2))
    # mid = len(s) // 2
    if s[mid] <= o:
        if s[mid] == o:
            return mid
        else:
            return binexists(s[mid:len(s)], o)
    else:
       return binexists(s[0:mid], o)

def extremes(s, o) -> list:
    if len(s) > 99:
        return [sorted(s)[0], sorted(s)[len(s)]]
    else:
        xmax= s[0]
        xmin= s[0]
        for sitem in s:
            if sitem < xmin:
                xmin = sitem
            if sitem > xmax:
                xmax = sitem
        return [xmax, xmin]
    
def kmaxes(s, n) -> list:
    kmax = sorted(s[0:n])
    for i in range(n,len(s)):
            if s[i] > kmax[0]:
                kmax[0] = s[i]
                kmax = sorted(kmax)
    return kmax



# print(binexists([5,2,1,8,3], 5))
print(kmaxes([5,2,1,8,3], 3))

