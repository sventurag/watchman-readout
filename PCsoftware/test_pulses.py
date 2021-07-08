from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
#import binary2text as b2t
import numpy as np
#from watchman_nogui import Watchman_main_window
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
import pandas as pd
from plot_delays_max import plot_pulse
#from plotPulse import plot_pulse
tc = targetc.targetc()

wave_gen().Output1(out=False)
time.sleep(2)
wave_gen().pulseWidth(5e-9)
time.sleep(2)

wave_gen().Query()

time.sleep(10)
tc.send_command(9,100,1) # Pedestals
time.sleep(10)
rango = list((range(0,32*4,1)))  # number of steps in delay values for the waveformigenerator
#rango = list( range(0,1,1) )

repeticiones = list( range(0,40,1)   )
fileToSave = './data/amplCalTest_40reps_128delays.txt'

nmbrWindows = 1

time.sleep(1)
regID = 151
regValue = 4
tc.send_command(8,regID,regValue) # first window
time.sleep(1)

regID = 152

regValue = nmbrWindows
tc.send_command(8, regID, regValue) # nmbrWindows
time.sleep(1)



startWindow=4
totalWindows=8

Windows512 = np.zeros((totalWindows*31))

Windows512_delays= list()


WindowsSum = np.zeros((totalWindows*31))



wave_gen().Output1(out=True)
time.sleep(1)

for j in repeticiones: # # Number of waveforms for the same delay value

    print(j)
   

    for i in rango:
    
       wave_gen().trigDelay(i*.000000001)
       time.sleep(1)
       Windows512 = tc.get_512_windows(startWindow,totalWindows,nmbrWindows,2)       
       Windows512 = [int(i)] + Windows512.tolist()
       Windows512_delays.append(Windows512)
       time.sleep(1)
       print("REP:{}".format(j))
np.savetxt(os.path.abspath(fileToSave), np.array(Windows512_delays).T, fmt='%5.3f')
time.sleep(1)

Windows512_delays = Windows512_delays * 0 
wave_gen().Output1(out=True)
print("end")


#plot_pulse(fileToSave,10,1)
#plt.show()
