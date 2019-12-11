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
tc = targetc.targetc()
fileToSave = './data/trigger.txt'

#for i in range(10):
#    tc.send_command(3,0,0) # start TriggerMode
#    time.sleep(3)
#    print(i)
#wave_gen().Output1(out=True)

#tc.send_command(3,0,0) # start TriggerMode
totalWindows=1
Windows512 = np.zeros((totalWindows*31))

Windows512_delays= list()

Windows512 =  tc.trigger_mode(1,15)
print(Windows512)
Windows512 = [1] + Windows512.tolist()
Windows512_delays.append(Windows512)
      
      #time.sleep(0.5)

np.savetxt(os.path.abspath(fileToSave), np.array(Windows512_delays).T, fmt='%5.3f')
time.sleep(1)

Windows512_delays = Windows512_delays * 0 
    
#wave_gen().Output1(out=False)
print("end")

plot_pulse(fileToSave)






