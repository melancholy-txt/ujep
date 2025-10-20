import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

def pilovy(frekvence, delka, vzorkovaci_frekvence, amplituda=1):
    t = np.linspace(0, delka, int(delka * vzorkovaci_frekvence))
    sig = amplituda * signal.sawtooth(2 * np.pi * frekvence * t)
    return t, sig

def obdelnikovy(frekvence, delka, vzorkovaci_frekvence, amplituda=1, duty_cycle=0.5):
    t = np.linspace(0, delka, int(delka * vzorkovaci_frekvence))
    sig = amplituda * signal.square(2 * np.pi * frekvence * t, duty=duty_cycle)
    return t, sig

def sinus(frekvence, delka, vzorkovaci_frekvence, amplituda=1, faze=0):
    t = np.linspace(0, delka, int(delka * vzorkovaci_frekvence))
    sig = amplituda * np.sin(2 * np.pi * frekvence * t + faze)
    return t, sig

def impulsy(frekvence, delka, vzorkovaci_frekvence, amplituda=1, sirka_impulsu=0.01):
    t = np.linspace(0, delka, int(delka * vzorkovaci_frekvence))
    sig = amplituda * np.where((frekvence * t) % 1 < sirka_impulsu, 1, 0)
    return t, sig

def nahodny(delka, vzorkovaci_frekvence, amplituda=1):
    t = np.linspace(0, delka, int(delka * vzorkovaci_frekvence))
    sig = amplituda * np.random.rand(len(t))
    return t, sig       

def pridej_sum(signal, uroven_sumu=0.1, typ='normalni'):

    if typ == 'normalni':
        sum = np.random.normal(0, uroven_sumu, len(signal))
    elif typ == 'uniformni':
        sum = np.random.uniform(-uroven_sumu, uroven_sumu, len(signal))
    elif typ == 'bilysum':
        sum = np.random.randn(len(signal)) * uroven_sumu
    
    return signal + sum

