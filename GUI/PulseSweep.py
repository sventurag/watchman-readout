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
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
from pulseGen import pulseGen
import pandas as pd

pg = pulseGen()
nmbrWindows = 1
firstWindow= 0
totalWindows = 512
nmbrPedestals = 100
channel = 2
width = 10e-9
ampl = 0.5 
isel = 2300

pg.isel(isel)
time.sleep(1)
pg.windows(nmbrWindows,firstWindow,totalWindows)
pg.impedanceLoadHz(50)
pg.pulseSweepInit(channel,nmbrPedestals)
pg.pulseInit(width)
time.sleep(10)
wave_gen().Output1(out=True)
time.sleep(1)
#pg.triggerMode(1000)
#pg.softTrigger()
#amplitudes=np.arange(1e-3, 3.5,100e-3) #For dynamic range, charge, cfd, etc
#amplitudes=np.arange(20, 200,50) #For dynamic range, charge, cfd, etc
#wave_gen().ncyc(3)
time.sleep(1)
pg.pulseAmpl(ampl)
time.sleep(1)
wave_gen().Query()
#amplitudes = np.arange(2100,2650,50)
amplitudes= np.arange(0.5,2 ,2)
repeticiones = list( range(0,5,1)   )

#amplitudes=list(range(2100,2900,20))
rango = list((range(0,110,100)))  # number of steps in delay values for the waveformigenerator For dynamic range, charge, cfd, etc
for item in repeticiones:
   # print("Amp=",item)
   # pg.pulseAmpl(item)
#    wave_gen().loadHz(item)
    time.sleep(1)

    #repeticiones = list( range(0,5,1)   )
    #rango = list(range(0,128,1)) # for pulse sweep
        
    for i in rango:
       wave_gen().trigDelay(i*.000000001)
       time.sleep(0.3)
       print("Pos=",i)
      # pg.softTrigger()
       pg.getWindows()
      # tc.send_command(7,0,0) # get windows
       time.sleep(1)
    
wave_gen().Output1(out=False)
print("end")

#plot_pulse(fileToSave,10,1)
#plt.show()
