'''
Vlastni trida pro uzel (node)
    a. pridej naslednika
    b. vypis deti (children)
    c. vypis rodice (parents)
    d. vypis potomci (descendants)
    e. vypis predchudce (ancestors)
    f. pridej informace do uzlu
    g. pridej informace do hrany
    h. odpoj dite
    i. konstrukce ze stringu nebo slovniku slovniku
    j. cokoliv navic


DFS(hloubka)
    - jdeme až dolů
    - rekurzivní algorizmus
BFS(šířka)
    - procházíme všechny děti na jedné úrovni
-> zkusit naprogramovat doma
'''



class Node():
    def __init__(self, value = None, parent: 'Node' = None, edge = None):
        self._parent = parent
        self.value = value
        self.edge = edge
        self._children = list()

    def addChild(self, value = None, edge = None):
        child = Node(value, self, edge)
        self._children.append(child)
        return child
    
    def removeChild(self, child: 'Node'):
        self._children.remove(child)
        

    def children(self):
        return f"{self._children}"
    
    def parent(self):
        return self.parent
    
    def descendants(self):
        descs = list()
        return self._descendants(descs)
        # descs = None

    def _descendants(self, descs = list()):
        # descs = list()
        for child in self._children:
            if len(child.children()) > 0:
                child._descendants(descs)
            descs.append(child)       
        return descs
    
    def ancestors(self, ancs = list()):
        if self._parent is not None:
            ancs.append(self._parent)
            if self._parent.parent() is not None:
                self._parent.ancestors(ancs)
        return ancs


    def __repr__(self):
        if self._parent is None:
            return f"Jsem root uzel, mám hodnotu {self.value} a mám {len(self._children)} dětí."
        if self._parent is not None:
            return f'"Hodnota: {self.value}, Hrana: {self.edge}"'

rodic = Node("Beránek")
d1 = rodic.addChild("Tonda", "učí")
d2 = rodic.addChild("Johana", "vyzvýdá")
d3 = rodic.addChild("Pavka", "ab")
dd1 = d1.addChild("Martin", "nemá rád číslo")

# print(rodic.children())
print(rodic._descendants())
# rodic.removeChild(d1)
print("----------")
# print(rodic.children())
print(rodic._descendants())
print("----------")

print(rodic._descendants())
# print(d1)
# print(d2)
# print(d3)
# print(dd1.ancestors())





