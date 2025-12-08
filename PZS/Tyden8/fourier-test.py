import numpy as np
import scipy as sp
import pandas as pd
from scipy import signal
from matplotlib import pyplot as plt

def fourier(s_values):
    N = len(s_values)
    W = np.exp(-1j * (2*np.pi / N))
    left = np.array(s_values)
    print(left)
    right1 = []
    for k in range(N):
        for n in range(N):
            right1.append(W**(k*n))
    print(right1)
    right = np.array(right1).reshape(N, N)
    print(right)   


def s(t):
    return 5 + 2*np.cos(2*np.pi*t - np.pi/2) + 3*np.cos(4*np.pi*t)

t = [0, 1/4, 1/2, 3/4]
s_values = s(np.array(t))
print(s_values)

fourier(s_values)

