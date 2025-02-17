
def stekej(pes):
        print(f"Pes {pes['jméno']} štěká {pes['zvuk']}")


p1 = {
    "jméno": "Azor",
    "zvuk": "haf haf"
}
p2 = {
    "jméno": "Žeryk",
    "zvuk": "vrrr vrr"
}

# ! nemohu zajistit konzistenci
# ! duck typing - pokud to vypadá jako kachna a chodí jako kachna, tak to je kachna 

stekej(p1)