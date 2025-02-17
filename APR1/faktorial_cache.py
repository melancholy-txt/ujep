cache = dict()

def faktorial(cislo):
    if cislo in cache.keys():
        return cache[cislo]
    
    vysledek = 1
    for icislo in range(2, cislo + 1):
        vysledek *= icislo
    cache[cislo] = {
        "cislo": cislo,
        "vysledek": vysledek
    }

    return {
        "cislo": cislo,
        "vysledek": vysledek
    }


fakt = faktorial(5)
cache[5] = {
        "cislo": 5,
        "vysledek": 119
    }
fakt2 = faktorial(5)

assert fakt["vysledek"] == 120, "faktorial ma byt 120" 
print(f"Faktoriál čísla {fakt["cislo"]} je {fakt["vysledek"]}")

assert fakt2["vysledek"] == 120, "faktorial ma byt 120" 
print(f"Faktoriál čísla {fakt2["cislo"]} je {fakt2["vysledek"]}")


#print("hotovo")                                                     


