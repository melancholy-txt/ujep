import threading
import time

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


class Stack:
    def __init__(self):
        self._data = []

    def push(self, item) -> None:
        self._data.append(item)

    def pop(self):
        if not self._data or self.size() == 0:
            raise IndexError("dequeue from an empty queue")
        return self._data.pop(-1)
    
    def peek(self):
        return self._data[-1]
    
    def isEmpty(self) -> bool:
        return False if self.size() > 0 else True
    
    def size(self) -> int:
        return len(self._data)
    
def bbp_checker(brackets: str) -> str:
    zasob = Stack()
    for ibrackets in range(len(brackets)):
        if brackets[ibrackets] == '(' or brackets[ibrackets] == '[' or brackets[ibrackets] == '{':
            zasob.push(brackets[ibrackets])
        if brackets[ibrackets] == ')':
            if zasob.peek() != '(':
                raise SystemError("mas to spatne")
            else:
                zasob.pop()
        if brackets[ibrackets] == ']':
            if zasob.peek() != '[':
                raise SystemError("mas to spatne")
            else:
                zasob.pop()
        if brackets[ibrackets] == '}':
            if zasob.peek() != '{':
                raise SystemError("mas to spatne")
            else:
                zasob.pop()
    return "jo mas to dobre"

class Cache():
    def __init__(self):
        self._data = []

    def enque(self, item) -> str:
        if self.size() < 5:
            self._data.append(item)
            return f"{item} byl přidán"
        else:
            return "paměť je plná :("

    def start_dequeue(self):
        while True:
            if not self.isEmpty():
                print(self.dequeue())
            time.sleep(5)

    def dequeue(self) -> int:
        threading.Timer(5, self.dequeue()).start()
        if not self._data or self.size() == 0:
            pass
            # raise IndexError("dequeue from an empty queue")
        else:
            print(f"{self._data[0]} dequeued")
            return self._data.pop(0)
    
    def front(self):
        return self._data[0]
    
    def rear(self):
        return self._data[-1]
    
    def isEmpty(self) -> bool:
        return False if self.size() > 0 else True
    
    def size(self) -> int:
        return len(self._data)

cache = Cache()
print(cache.enque(1))
print(cache.enque(2))
print(cache.enque(3))
print(cache.enque(4))
print(cache.enque(5))
print(cache.enque(6))
# cache.start_dequeue()





# print(bbp_checker("([{}])"))
# print(bbp_checker("([{])"))
# print(bbp_checker("([{]})"))






# zasob = Stack()
# zasob.push(1)
# zasob.push(2)
# zasob.push(3)
# print(zasob._data)
# print(zasob.peek())
# print(zasob.pop())
# print(zasob.pop())
# print(zasob.pop())

# fronta = Queue()
# fronta.enque(1)
# fronta.enque(2)
# fronta.enque(3)
# print(fronta._data)
# print(fronta.dequeue())
# print(fronta.dequeue())
# print(fronta.size())
# print(fronta._data)
# print(fronta.isEmpty())
# print(fronta.dequeue())
# print(fronta.isEmpty())
# print(fronta.size())
# print(fronta.dequeue())






    