import matplotlib.pyplot as plt
import scipy.signal as signal
import cothread
#from cothread.catools import caget
import epics
import numpy as np
import time

datapts = 100000

Frf = 499.68e6
hIf = 1320
hADC = 310
Fs = Frf/hIf*hADC






def get_waveform(PVs,numpts):
  

  data = []
  for i in range(len(PVs)):
     data.append(PVs[i].get())

  waveform = np.asarray(data, dtype=np.float32)
  waveform = waveform[:,0:numpts] 
   
  #for i in range(10,20):
  #   for j in range(2):
  #     waveform[i,j] = waveform[i,j] - 0.02 

  #waveform[20,2] = 0.0 
  return waveform 

#FPGA = check_output(["caget",ptp])

def calc_stats(bpms,tbtsum):

  #calc stats
  tbts_std = []
  tbts_mean = []
  
  for i in range(len(bpms)):
     tbts_std.append(np.std(tbtsum[i])) 
     tbts_mean.append(np.mean(tbtsum[i])) 

  #print results 
  for i in range(len(bpms)):
     print('%d:  %s  mean:%f  std:%f'  % (i, bpms[i], tbts_mean[i], tbts_std[i]))

  return tbts_std, tbts_mean


def calc_psd(y):
   N = len(y)  
   print ("len(y)=%d" % N)
   #f = np.linspace(0,Fs/2,N/2+1)
   #print ("len(t)=%f" % len(adc_data))
   #print ("len(f)=%f" % len(f))
   #print ("Total Time=%f" % (Ts*N))

   w = np.hanning(N)
   x = w * y
   xfft = np.abs(np.fft.rfft(x)) / (N/2.0)

   p = 20*np.log10(xfft)
   return p



def plot_psd(a,b,c,d):
   N = len(a)*2-1
   f = np.linspace(0,Fs/2,N//2+1)
   f = f/1e6 #scale to MHz  
   ylim = [-160,0]
   fig,axes = plt.subplots(nrows=2,ncols=2)

   ax1=plt.subplot(221)
   plt.plot(f,a,'b')
   plt.ylabel('dBFS')
   ax1.grid(True) 
   ax1.set_ylim(ylim)
   #plt.xlabel('freq (MHz)')
   plt.title('PSD ChA')

   ax2=plt.subplot(222, sharex=ax1)
   plt.plot(f,b,'b')
   plt.ylabel('dBFS')
   ax2.grid(True) 
   ax2.set_ylim(ylim)
   #plt.xlabel('freq (MHz)')
   plt.title('PSD ChB')

   ax3=plt.subplot(223, sharex=ax1)
   plt.plot(f,c,'b')
   plt.ylabel('dBFS')
   plt.xlabel('freq (MHz)')
   plt.title('PSD ChC')
   ax3.set_ylim(ylim)
   ax3.grid(True)

   ax4=plt.subplot(224, sharex=ax1)
   plt.plot(f,d,'b')
   plt.ylabel('dbFS')
   plt.xlabel('freq (MHz)')
   plt.title('PSD ChD')
   ax4.grid(True)
   ax4.set_ylim(ylim)
   #titlestr = "ADC PSD   " + "numpts=" + str(2*(len(f)-1))
   #fig.suptitle(titlestr)
   plt.show(block=False)




def plot_adc(adc_data):
   #N = len(a)
   #t = np.linspace(0,Ts*hADC*numTurns,hADC*numTurns)
   a = adc_data[0] 
   b = adc_data[1] 
   c = adc_data[2] 
   d = adc_data[3] 
   #ylim = [-4000,4000]
   fig,axes = plt.subplots(nrows=2,ncols=2)
   ax1=plt.subplot(221)
   plt.plot(a,'b-o')
   plt.ylabel('adu')
   #ax1.set_ylim(ylim)
   #plt.xlabel('freq (MHz)')
   plt.title('ChA')
   plt.grid()
   ax2=plt.subplot(222, sharex=ax1)
   plt.plot(b,'b-o')
   plt.ylabel('adu')
   #ax2.set_ylim(ylim)
   #plt.xlabel('freq (MHz)')
   plt.title('ChB')
   plt.grid()
   ax3=plt.subplot(223, sharex=ax1)
   plt.plot(c,'b-o')
   plt.ylabel('adu')
   plt.xlabel('sample num')
   plt.title('ChC')
   #ax3.set_ylim(ylim)
   plt.grid()
   ax4=plt.subplot(224, sharex=ax1)
   plt.plot(d,'b-o')
   plt.ylabel('adu')
   plt.xlabel('sample num')
   plt.title('ChD')
   plt.grid()
   #ax4.set_ylim(ylim)
   #titlestr = "ADC : Sample Rate 310*40*Frf/1320 = 4.69396GSPS" 
   #fig.suptitle(titlestr)
   plt.show(block=False)




def main():
  
  plt.ion()
  plt.style.use('seaborn-whitegrid')
  plt.rc('font',size=8)


  adc_pv = []
  adc_pv.append(epics.PV('lab-BI{BPM:1}ADC:A:Buff-Wfm'))
  adc_pv.append(epics.PV('lab-BI{BPM:1}ADC:B:Buff-Wfm'))
  adc_pv.append(epics.PV('lab-BI{BPM:1}ADC:C:Buff-Wfm'))
  adc_pv.append(epics.PV('lab-BI{BPM:1}ADC:D:Buff-Wfm'))


  trig_pv = epics.PV('lab-BI{BPM:1}Trig:Strig-SP')


  #trigger the BPM
  trig_pv.put(1)
  time.sleep(1)   


  adc_data = get_waveform(adc_pv,1000000)
  print(type(adc_data))
  rows, cols = adc_data.shape
  print(f"Number of rows: {rows}")
  print(f"Number of columns: {cols}") 

  adc_data[0] = adc_data[0];
  adc_data[1] = adc_data[1];
  adc_data[2] = adc_data[2];
  adc_data[3] = adc_data[3];


  print(adc_data[0])     
  print(adc_data.shape) 

  plot_adc(adc_data)

  pa = calc_psd(adc_data[0])
  pb = calc_psd(adc_data[1])
  pc = calc_psd(adc_data[2])
  pd = calc_psd(adc_data[3])

  plot_psd(pa,pb,pc,pd)

  plt.show()
  plt.draw()

  input('Press any key to quit...')

  np.savetxt("adc_data.txt", adc_data.T, fmt="%d", delimiter= " ")


if __name__ == "__main__":
  main()

