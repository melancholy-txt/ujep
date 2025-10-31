from PZS import *

def mojeFunkce(f,tvec):
    x = np.sin(2*np.pi*f*tvec)
    return np.array(x)

def mojeFsum(Amp,tvec):
    Err = Amp*(2*np.random.rand(tvec.size)-1)
    return np.array(Err)


Amp = 1.0;

numT = 20;
f = 100;
A0 = 1.0;
T = 1/f;
Tmax = numT*T;

n_length = int(numT*f);
tvec = np.linspace(0,Tmax,n_length, endpoint=False);
print(tvec.size)

mojeF = mojeFunkce(f,tvec) + mojeFsum(Amp,tvec)

plt.rcParams["figure.figsize"] = (20,6)
# plt.plot(tvec,mojeF);
# plt.show()

prvky_v_periode = int(n_length/numT) # -> f, lol
print(prvky_v_periode)

periody = np.reshape(mojeF,(numT,prvky_v_periode))

print(mojeF.shape)

print("Shape periody:") 
print(periody.shape)

avg_signal = np.mean(periody, axis=0)
# alternativne
# avg_signal_sum = np.sum(periody, axis=0)/numT

print("Shape prumeru:")
print(avg_signal.shape)


Tone = np.linspace(0,T,prvky_v_periode, endpoint=False);
mojeFZkracena = mojeFunkce(f,Tone) + mojeFsum(Amp,Tone)
mojeFZkracenaIdealni = mojeFunkce(f,Tone)


plt.plot(Tone, mojeFZkracena, color='blue', linewidth=1);
plt.plot(Tone, mojeFZkracenaIdealni, color='green', linewidth=2);
plt.plot(Tone,avg_signal, color='red', linewidth=3);
# plt.plot(Tone,avg_signal_sum, color='orange', linewidth=1, linestyle='dashed');
plt.legend(['Sinus s sumem','Idealni signal','Prumer signal']);
plt.xlabel('Cas [s]');
plt.ylabel('Amplituda');
plt.grid();
plt.show()


# zkusit aproximovat sinus



