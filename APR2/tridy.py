class Pes:
    def __init__(self, jmeno, zvuk):
        # po REALIZACI třídy - jako konstruktor
        self.jmeno = jmeno
        self.zvuk = zvuk
        pass

    def stekej(self):
        print(f"Pes {self.jmeno} steka {self.zvuk}")


p1 = Pes("Azor", "haf haf")
p1.stekej()
p2 = Pes("Jonatán", "haf vrrr haf vrrr")
p2.stekej()
    
