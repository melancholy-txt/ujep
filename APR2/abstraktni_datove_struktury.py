class Queue:
    def __init__(self):
        self._data = []

    def enque(self, item) -> None:
        self._data.append(item)

    def dequeue(self) -> int:
        if not self._data or self.size() == 0:
            raise IndexError("dequeue from an empty queue")
        return self._data.pop(0)
    
    def front(self):
        return self._data[0]
    
    def rear(self):
        return self._data[-1]
    
    def isEmpty(self) -> bool:
        return False if self.size() > 0 else True
    
    def size(self) -> int:
        return len(self._data)
    
fronta = Queue()
fronta.enque(1)
fronta.enque(2)
fronta.enque(3)
print(fronta._data)
print(fronta.dequeue())
print(fronta.dequeue())
print(fronta.size())
print(fronta._data)
print(fronta.isEmpty())
print(fronta.dequeue())
print(fronta.isEmpty())
print(fronta.size())
print(fronta.dequeue())






    