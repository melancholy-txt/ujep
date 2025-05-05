from typing import List

class SFXFightSounds:
    def __init__(self, sfxs: List[str]):
        self._sounds = sfxs
        self._index = 0  # for iteration

    def __add__(self, other):
        if not isinstance(other, SFXFightSounds):
            return NotImplemented
        return SFXFightSounds(self._sounds + other._sounds)

    def __iter__(self):
        self._index = 0  # reset iteration
        return self

    def __next__(self):      
        zvuk = self._sounds[self._index]
        self._index += (self._index + 1) % len(self._sounds)
        return zvuk


def SFXYielder(n: int):
    sfxs = ["Bang", "Prásk", "Bum"]
    for i in range(n):
        yield sfxs[i % len(sfxs)]

def main():  
    for sound in SFXYielder(5):
        print(sound)  

main()