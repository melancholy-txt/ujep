import numpy as np
import matplotlib.pyplot as plt

A0 = 1
f = 1
omega = 2 * np.pi * f

M = 10
fmod = 10
phi = 2 * np.pi * fmod



def func(t):
    return A0 * np.sin(omega * t)

def m(t):
    return M * np.sin(phi * t)

def modulated(t):
    return ( A0 + m(t) ) * np.sin(omega * t)

t = np.linspace(0, 5, 1000)
plt.figure(figsize=(10, 6))
plt.plot(t, func(t), color='blue')
plt.plot(t, m(t), color='orange')
plt.plot(t, modulated(t), color='green')
plt.title('Signal')
plt.xlabel('t (s)')
plt.ylabel('Amplituda')
plt.legend()
plt.grid()
plt.shoomega()      