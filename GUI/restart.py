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
fileToSave = './data/pulse_gen_test.txt'

def setFreq(frequency):
    print("{:.9f}".format(frequency))
    wave_gen().Freq(frequency)
    time.sleep(1)

def setDelay(nmbrCycles):
    regID=95;
    tc.send_command(8, regID, nmbrCycles)
    time.sleep(1)

def triggerMode(nmbrBursts):
    wave_gen().bursSettings(nmbrBursts)
    time.sleep(1)
    tc.send_command(3, 0, 0) # triggerMode 
    time.sleep(1)

def triggerMode_exit():
    tc.send_command(3, 0, 0) # triggerMode 
    time.sleep(1)

def restart():
    tc.send_command(3, 0, 0) # triggerMode 
    time.sleep(1)
    tc.send_command(11,0,0) #restartAll
    
def softTrigger():
    wave_gen().softTrigger()
 #   time.sleep(1)

#wave_gen().Output1(out=True)
#time.sleep(1)
restart()



#setFreq(1)
#setDelay(3)
#triggerMode(10)
#softTrigger()
#####
#


print("end")










