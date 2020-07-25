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

def pedestalTriggerMode(avg):
    tc.send_command(10,0,avg)
    time.sleep(1)

def pedestalFlat(avg):
    tc.send_command(12,0,avg)
    time.sleep(1)

def dividePedestals():
    tc.send_command(13,0,0)
    time.sleep(1)
def pulseAmpl(ampl):
    wave_gen().volt(ampl)
    time.sleep(1)
#restart()
wave_gen().functionPulse()
time.sleep(1)
wave_gen().bursSettings(1)
#wave_gen().ncyc(1)
time.sleep(1)
pulseAmpl(200e-3)
time.sleep(1)

#import subprocess
#subprocess.call("./tcpdumpWatchmanData", cwd="/home/salvador/bin")

# Taking Pedestals 

#tc.send_command(9,100,1)
#time.sleep(15)
#
#print("conf waveform generator")
#wave_gen().loadHz(75)
#
#wave_gen().pulseWidth(12e-9)
#time.sleep(1)
#
##  freq, amp, offset
#wave_gen().apply(1000,0.15,0)
#
#wave_gen().Query()
#time.sleep(1)
#
#
wave_gen().Output1(out=False)  
time.sleep(2)#
##setFreq(10000)

setDelay(7)
time.sleep(1)
#time.sleep(2)

triggerMode()

time.sleep(1)



avgNmbr = 99

#pedestalTriggerMode(avgNmbr)
sec2wait= int(((avgNmbr*1024)/4000))

#for i in range(0,1,1):
pedestalTriggerMode(avgNmbr)
    #print(i)
time.sleep(sec2wait)
wave_gen().Output1(out=True)  

#dividePedestals()
#print('Divide Pedestals')
#time.sleep(10)
#

#triggerMode()

#time.sleep(2)
#triggerMode()

#pedestalFlat(0)

#  freq, amp, offset

#wave_gen().apply(1000,0.1,0)
#time.sleep(5)

#wave_gen().Query()
#time.sleep(5)

#wave_gen().Output1(out=True)  
for i in range(0,100,1):

    softTrigger()
    time.sleep(0.01)


#####
#
print("end")

