import numpy as np
import pandas as pd
import targetc as targetc
import waveform_gen_33600 as wv_gen 
from waveform_gen_33600 import wave_gen 
import time
import os
tc = targetc.targetc()                                                    
fileName = './data/pedestal_calculationDLL5'
pedestal = pd.read_csv(fileName, sep=" ",header=None)[10]

print ('LEN', len(pedestal))

#test = tc.get_512_windows(startTest,totalTest, nmbrWindows) 


wave_gen().Output1(out=False)

wave_gen().Output1(out=True)

Windows = np.zeros((512*32))
Windows512_delays= list()

delays = list((range(0,25,1)))

tc.send_command(8,65,58)
time.sleep(1)

nmbrWindows = 4
startWindow= 0
totalWindows= 4

for i in delays:
   wave_gen().trigDelay(i*.000000001)
   time.sleep(1.5)
   Windows512 = tc.get_512_windows(startWindow,totalWindows,nmbrWindows)       
   Windows512 = np.subtract(Windows512,pedestal[startWindow:totalWindows*32])
   Windows512 = [int(i)] + Windows512.tolist()
   
   Windows512_delays.append(Windows512)
np.savetxt(os.path.abspath('./data/pulseSweepDLL5'), np.array(Windows512_delays).T, fmt='%5.3f')
Windows512_delays = Windows512_delays * 0 
time.sleep(1)

wave_gen().Output1(out=False)


