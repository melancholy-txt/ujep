import random

class Pes:
    def __init__(self, jmeno, zvuk):
        # po REALIZACI třídy - jako konstruktor
        self._jmeno = jmeno
        self.zvuk = zvuk
        pass

    @property
    def jmeno(self):
        # return f"fuck off hafhaf {self._jmeno}"
        if random.choice(["reknu", "nereknu"]) == "nereknu":
            return "haf co je ti do toho haf"
        else:
            return self._jmeno
    @jmeno.setter
    def jmeno(self, val: str):
        if len(val) > 4: self._jmeno = val


    def stekej(self) -> None:
        print(f"Pes {self.jmeno} steka {self.zvuk}")

    def curej(self, nakoho: str) -> None:
        print(f"Pes {self.jmeno} čůrá na {nakoho}")

    def __add__(self, other):
        if isinstance(other, Pes):
            stenata = []
            for istene in range(random.randint(0, 12)):
                stenata.append(Pes("self._jmeno+other.jmeno+str(istene)", "vii"))
            return stenata

p1 = Pes("Azor", "haf haf")
# p1.stekej()
p2 = Pes("Jonatán", "haf vrrr haf vrrr")
# p2.stekej()
p1.jmeno = "Rex"
print(p1.jmeno)
p1.jmeno = "Jonatan"
print(p1 + p2)