'''
Vlastni trida pro uzel (node)
    a. pridej naslednika
    b. vypis deti (children)
    c. vypis alenae (parents)
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

class Edge():
    def __init__(self, sender: 'Node', receiver: 'Node', label: str = None):
        self.sender = sender
        self.receiver = receiver
        self.label = label

    def __repr__(self):
        return f"\n{self.sender} -> {self.receiver}: {self.label}"

class Node():
    def __init__(self, value = None, parent: 'Node' = None, edge = None):
        self._parent = parent
        self.value = value
        self._children = list()
        self.edges = list()
        if edge is not None:
            self.edges.append(edge)

    def addChild(self, value = None):
        child = Node(value, self)
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

    def addEdge(self, receiver: 'Node', value: str = None):
        if self is not receiver:
            self.edges.append(Edge(sender=self, receiver=receiver, label=value))


    def __repr__(self):
        # if self._parent is None:
        #     return f"Jsem root uzel, mám hodnotu {self.value} a mám {len(self._children)} dětí."
        # if self._parent is not None:
        #     return f'"Hodnota: {self.value}, Hrany: {self.edges}"'
        return self.value

    def dfs(self):
        visited = []
        def dfs_recursive(node):
            visited.append(node)
            for child in node._children:
                if child not in visited:
                    dfs_recursive(child)
        dfs_recursive(self)
        return visited

    def bfs(self):
        visited = []
        queue = [self]
        while queue:
            node = queue.pop(0)
            visited.append(node)
            for child in node._children:
                if child not in visited and child not in queue:
                    queue.append(child)
        return visited

    # def dfs(self):
    #     visited = []
    #     def dfs_recursive(node):
    #         visited.append(node)
    #         for child in node._children:
    #             if child not in visited:
    #                 dfs_recursive(child)
    #     dfs_recursive(self)
    #     return visited

    # def bfs(self):
    #     visited = []
    #     queue = [self]
    #     while queue:
    #         node = queue.pop(0)
    #         visited.append(node)
    #         for child in node._children:
    #             if child not in visited and child not in queue:
    #                 queue.append(child)
    #     return visited






alena = Node("Alena")
tonda = alena.addChild("Tonda")
alena.addEdge(tonda, "má ráda")
johana = tonda.addChild("Johana")
tonda.addEdge(johana, "nemá rád")
alena.addEdge(johana, "má ráda")
pavka = johana.addChild("Pavka")
johana.addEdge(pavka, "kamarádí se s")
pavka.addEdge(johana, "kamarádí se s")

print(alena.edges)
print("----------")
print(tonda.edges)
print("----------")
print(johana.edges)
print("----------")
print(pavka.edges)



# print(alena.children())
# print(alena._descendants())
# alena.removeChild(d1)
# print("----------")
# print(alena.children())
# print(alena._descendants())
# print("----------")

# print(alena._descendants())
# print(d1)
# print(d2)
# print(d3)
# print(dd1.ancestors())





