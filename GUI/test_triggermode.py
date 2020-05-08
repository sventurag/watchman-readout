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

def triggerMode():
#    wave_gen().bursSettings(nmbrBursts)
#    time.sleep(1)
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
    time.sleep(1)

#restart()

#import subprocess
#subprocess.call("./tcpdumpWatchmanData", cwd="/home/salvador/bin")


wave_gen().loadHz(50)
#wave_gen().volt(0.080)

wave_gen().pulseWidth(12e-9)
time.sleep(1)

#  freq, amp, offset
wave_gen().apply(40000,0.07,0)

wave_gen().Query()
time.sleep(1)



#setFreq(10000)
setDelay(7)
time.sleep(5)
triggerMode()
#softTrigger()


#####
#


print("end")










