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

nmbrWindows = 1
firstWindow= 4
totalWindows = 8
channel = 2


def pulseSweepInit(nmbrWindows,firstWindow,totalWindows,channel):
        
    wave_gen().Output1(out=False)
    
    time.sleep(2)
    wave_gen().pulseWidth(5e-9)
    time.sleep(2)
    
    #wave_gen().Query()
    
    #time.sleep(10)
    tc.send_command(9,100,1) # Pedestals
    time.sleep(10)
    
    time.sleep(1)
    regID = 151
    regValue = 4
    tc.send_command(8,regID,firstWindow) # first window
    time.sleep(1)
    
    regID = 152
    
    tc.send_command(8, regID, nmbrWindows) # nmbrWindows
    time.sleep(1)
    
    regID = 98
    tc.send_command(8,regID,totalWindows) # first total
    time.sleep(1)
    
    regID = 99
    tc.send_command(8,regID,channel) # first total
    time.sleep(1)
    


repeticiones = list( range(0,100,1)   )
rango = list((range(0,5,1)))  # number of steps in delay values for the waveformigenerator


wave_gen().Output1(out=True)
time.sleep(3)

for j in repeticiones: # # Number of waveforms for the same delay value
    print(j)
    for i in rango:
       wave_gen().trigDelay(i*.000000001)
       tc.send_command(7,0,0) # get windows
       time.sleep(.1)

wave_gen().Output1(out=False)
print("end")


#plot_pulse(fileToSave,10,1)
#plt.show()
