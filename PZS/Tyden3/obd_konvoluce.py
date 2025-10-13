import numpy as np
import scipy as sp
from scipy import signal
import matplotlib.pyplot as plt

# konvolucni jadro - h(t) = alpha * exp(-a * t)
def Kernel(alpha, a, t):
    return alpha * np.exp(-a * t)

n_length = 500     
t = np.linspace(0, 10, n_length, endpoint=False)  # časový vektor
th = np.linspace(0, 3, 100, endpoint=False)  # časový vektor pro konvoluční jádro

alpha = 1   
a = 3

h_t = Kernel(alpha, a, th)

# ctvercovy signal
x_t = (signal.square(2 * np.pi * 0.5 * t) + 1) / 2
# x_t = np.where(t >= 1.0,0,x_t)


# konvoluce
y_t = np.convolve(x_t, h_t, mode='same') # rescale by the sampling interval     

#rescale to (0,1)
y_t = y_t/np.max(y_t)

t_Conv = np.linspace(0,10,np.max(y_t.shape))

plt.figure(figsize=(10, 6))

plt.subplot(3, 1, 1)
plt.plot(t, x_t, label='x(t) - vstupní signál', color='blue')
plt.plot(t, h_t, label='h(t) - konvoluční jádro', color='orange')
plt.plot(t_Conv, y_t, label='y(t) - výstupní signál', color='green')
plt.xlabel('Čas [s]')
plt.ylabel('Amplituda')
plt.grid()
plt.legend(loc='upper right')

plt.show()
