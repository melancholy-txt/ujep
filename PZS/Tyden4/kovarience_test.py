import numpy as np
import scipy as sp
from scipy import signal
from matplotlib import pyplot as plt
from SignalGen import sinus, impulsy, pilovy, obdelnikovy

def fun1(a, b, x):
    return a * x + b

def kovarience(X, Y):   
    if len(X) != len(Y):
        raise ValueError("musí mít stejnou délku")
    n = len(X)
    mean_X = np.mean(X)
    mean_Y = np.mean(Y)
    cov = np.sum((X - mean_X) * (Y - mean_Y)) / n
    return cov

x = np.linspace(0, 10, 100)

f1 = fun1(2, 3 , x)
f2 = fun1(5, 1 , x)

cov = kovarience(f1, f2)
cov_sp = sp.cov(f1, f2)[0, 1]

plt.plot(x, f1, label='fun1')
plt.plot(x, f2, label='fun2')
plt.title(f'Kovariance: {cov:.2f}, Kovariance (numpy): {cov_sp}')
plt.legend()
plt.show()
