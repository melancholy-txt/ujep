# nacist slova ze souboru oddelene carkou na jednom radku a vypsat na obrazuvku palindromy

def palindrom(slovo: str):
    newslovo= ""
    for ichar in reversed(range(len(slovo))):
        # print(ichar)
        newslovo += slovo[ichar]
    # print(newslovo)
    return slovo == newslovo

# print(palindrom("aha"))
with open("slova.txt", "r") as soubor:
    slova = soubor.read().split(",")
    print(slova)
    palindromy = [slovo for slovo in slova if palindrom(slovo)]
print(palindromy)

# from collections import Counter     

# with open("zviratka.txt") as soubor:
#     citac = Counter(soubor.read())
# print(citac)

