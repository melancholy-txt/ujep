#podprogram
# def secti(a: int = 0, b: int = 0) -> int:
#     """Secte dve cisla a vrati vysledek"""
#     return a + b

# prvni_cislo = 1
# druhe_cislo = 2
# soucet=secti(prvni_cislo, druhe_cislo)  
# print(soucet)

# def seznam_sudy(sez: list) -> list:
#      # return [cislo for cislo in seznam if cislo % 2 == 0]     
#      # return list(filter(lambda cislo: cislo % 2 == 0, seznam))
#     """Vrati pouze sude cisla"""
#     sude = []
#     for cislo in sez:
#         if cislo % 2 == 0:
#             sude.append(cislo)
#     return sude

def anagram_checker(a: str, b:str) -> bool:
   a = sanitaze_string(a)
   b = sanitaze_string(b)
   a_count = char_counter(a)
   b_count = char_counter(b)
   if a_count == b_count:
       return True
   else:
       return False


def sanitaze_string(s: str) -> str:
    return s.lower().replace(" ", "").replace(",", "").replace(".", "")

def char_counter(s: str) -> dict:
    count = {}
    for char in s:
        if char not in count.keys():
            count[char] = 1
        else:
            count[char] += 1
    return count

# def whattthefuck(l: list) -> list:
#     for jmeno in l:
#         for i in range(len(jmeno)):
#             if i % 3 == 0:
#                 jmeno[i] = jmeno[i].upper()

def whattthefuck(l: list) -> list:
    result = []
    for jmeno in l:
        jmeno_list = list(jmeno)
        for i in range(2,len(jmeno_list)):
            if i % 3 == 0:
                jmeno_list[i] = jmeno_list[i].upper()
        result.append("".join(jmeno_list))
    return result

jmena = ["josefdizdfizdfiu", "jana", "petr", "karel"]
print(whattthefuck(jmena))