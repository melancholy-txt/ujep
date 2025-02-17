from random import randint

with open("vsechnacisla.txt", "w") as soubor:
    for icislo in range(100):
        soubor.write(str(randint(0, 50)) + "\n")     

with open("vsechnacisla.txt", "r") as soubor:
    for radek in soubor:
        cislo = int(radek.strip())
        # print(cislo)
        if cislo % 2 == 0:
            with open("suda.txt", "a") as soubor_suda:
                soubor_suda.write(str(cislo) + "\n")    
        else:   
            with open("licha.txt", "a") as soubor_licha:
                soubor_licha.write(str(cislo) + "\n")   

# with open("vsechnacisla.txt", "r") as soubor:
#     radky = soubor.read().strip().split("\n")

# cisla = [int(radek) for radek in radky if radek.isdigit()]
# licha = list(filter(lambda x: x % 2 == 1, cisla))
# suda = list(filter(lambda x: x % 2 == 0, cisla))

# with open("licha.txt", "w") as soubor:
#     for l in licha:
#         soubor.write(str(l) + "\n")

# with open("suda.txt", "w") as soubor:
#     for s in suda:
#         soubor.write(str(s) + "\n")
