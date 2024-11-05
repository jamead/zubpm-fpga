import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import welch


Fs = 2e9


# Replace 'data.txt' with your filename
filename = 'rfdfe_adc.txt'

# Load whitespace-separated data from the file
data = np.loadtxt(filename)
data = data / 32768;  

#data = data / 8192;

# Plot the data
plt.figure(figsize=(12, 6))
plt.subplot(3, 1, 1)
plt.plot(data, color='b')
plt.title('Data')
plt.grid(True)
plt.xlabel('Sample Index')
plt.ylabel('Amplitude')

# Compute and plot FFT
N = len(data)
f = np.linspace(0,Fs/2,N//2+1)
f = f/1e6 #scale to MHz 
w = np.hanning(N)
x = w * data
xfft = np.abs(np.fft.rfft(x))
#scale the amplitude in dbFS
p = 20 * np.log10(xfft/(N/2))


plt.subplot(3, 1, 2)
plt.plot(f,p,'b')
plt.grid(True)
plt.title('Power Spectral Density')
plt.xlabel('Freq (Hz)')
plt.ylabel('dbFS')


# Compute the Power (squared magnitude) and integrate it
fft_power = (xfft ** 2) / N  # Power spectrum, normalized by N
int_fft_power = np.cumsum(fft_power) * (f[1] - f[0])

plt.subplot(3, 1, 3)
plt.plot(f,int_fft_power,'b')
plt.yscale('log')
plt.grid(True)
plt.title('Integrated Power')
plt.xlabel('Freq (Hz)')
plt.ylabel('dbFS')



# Show the plots
plt.tight_layout()
plt.show()

