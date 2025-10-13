import numpy as np
import scipy as sp
from scipy import signal
import matplotlib.pyplot as plt

def Kernel(alpha, a, t):
    return alpha * np.exp(-a * t)

n_length = 500;
Amp=1.0;

numT=6;
f = 2;
A0=1.0;
T=1/f;
Tmax = numT*T;
n_length=numT*100;

tvec = np.linspace(0,Tmax,n_length, endpoint=False);

x_t = sp.signal.square(2*np.pi*f*tvec)

Err = 2*np.random.rand(n_length)-1
# Err = 0
# x_t = A0*np.sin(2*np.pi*f*tvec) + Amp*Err/2. 
# x_t = sp.signal.sawtooth(2*np.pi*f*tvec,0.5) + 2*Err-1
x_t_e = sp.signal.square(2*np.pi*f*tvec) + Amp*Err/2
#x_t = 2*Err-1





th = np.linspace(0, 3, 100, endpoint=False)  # časový vektor pro konvoluční jádro

alpha = 1   
a = 1

h_t = Kernel(alpha, a, th)

# konvoluce
y_t = np.convolve(x_t_e, h_t, mode='same') # rescale by the sampling interval     

#rescale
y_t = y_t/np.max(y_t)   

t_Conv = np.linspace(0,10,np.max(y_t.shape))


plt.rcParams["figure.figsize"] = (15,6)
# plt.plot(tvec,x_t, linewidth=0.5,label="signal")
plt.plot(tvec,x_t_e, linewidth=0.5,label="signal with error")
plt.plot(tvec,y_t, linewidth=0.5,label="konvoluce")
plt.legend()
plt.show()