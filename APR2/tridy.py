class Pes:
    def __init__(self, jmeno, zvuk):
        # po REALIZACI třídy - jako konstruktor
        self.jmeno = jmeno
        self.zvuk = zvuk
        pass


p1 = Pes("Azor", "haf haf")
print(p1.zvuk)
p2 = Pes("Jonatán", "haf vrrr haf vrrr")
print(p2.zvuk)
    
