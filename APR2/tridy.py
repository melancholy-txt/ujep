import random

class Pes:
    def __init__(self, jmeno, zvuk):
        # po REALIZACI třídy - jako konstruktor
        self._jmeno = jmeno
        self.zvuk = zvuk
        pass

    @property
    def jmeno(self):
        return "fuck off hafhaf"
        # if random.choice["reknu", "nereknu"] == "nereknu":
        #     return "haf co je ti do toho haf"
        # else:
        #     return self._jmeno

    def stekej(self) -> None:
        print(f"Pes {self.jmeno} steka {self.zvuk}")

    def curej(self, nakoho: str) -> None:
        print(f"Pes {self.jmeno} čůrá na {nakoho}")


p1 = Pes("Azor", "haf haf")
# p1.stekej()
# p2 = Pes("Jonatán", "haf vrrr haf vrrr")
# p2.stekej()
print(p1.jmeno)
