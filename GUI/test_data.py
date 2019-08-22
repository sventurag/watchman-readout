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

#fileName = './data/pedestals'
#pedestal = pd.read_csv(fileName, sep=" ",header=None)[10]

tc = targetc.targetc()

#regID = 78

#regValue = 2340
#tc.send_command(8, regID, regValue) # nmbrWindows
#time.sleep(1)

##regID = 84
##regValue = 2490
##
##
##tc.send_command(8, regID, regValue) #VADJN
##time.sleep(1)
### """
##

#time.sleep(1)
#regID = 65
#regValue = 0
#tc.send_command(8,regID,regValue) # SSTOUTFB
#time.sleep(1)
#
#time.sleep(1)
#regID = 79
#regValue = 0
#tc.send_command(8,regID,regValue) # VTRIMT
#time.sleep(1)
#

wave_gen().Output1(out=False)
nmbrWindows = 4
tc.send_command(9,10,nmbrWindows) # pedestal
time.sleep(3)

#regValue= 0 #
#regID = 93
#tc.send_command(8,regID,regValue) # delay from rising edge WR update

time.sleep(1)
regID = 151
regValue = 0
tc.send_command(8,regID,regValue) # first window
time.sleep(1)

regID = 152

regValue = nmbrWindows
tc.send_command(8, regID, regValue) # nmbrWindows
time.sleep(1)

wave_gen().Output1(out=True)
startWindow=0
totalWindows=8

Windows512 = np.zeros((totalWindows*31))
Windows512_delays= list()

#tc.send_command(7,0,0)I
#delays = list((range(56,58,1))) #edge
delays = list((range(30,73,1))) # NEW EDGE
#delays = list((range(35,65,1))) # 

#de`lays = list((range(18,19,1)))
WindowsSum = np.zeros((totalWindows*31))

wave_gen().Output1(out=False)
time.sleep(1)
tc.send_command(9,10,nmbrWindows) # pedestal
time.sleep(1)


#regID = 84
#regValue = 2690
#tc.send_command(8, regID, regValue) #VADJN
#
#nmbrWindows = 4
#tc.send_command(9,10,nmbrWindows) # pedestal
#time.sleep(3)
#
wave_gen().Output1(out=True)

 

for j in range(0,20,1):
    print(j)
#for j in range(0,10,1):
#for k in range(0,5,1):
 #   regID = 84
 #   regValue = j
 #   tc.send_command(8, regID, regValue) #VADJN
 #   time.sleep(2)
    # """
    

    for i in delays:
    
     # regID = 65
     # regValue = j
     # tc.send_command(8, regID, regValue) # get windows
     # time.sleep(1)
         #for k in range(0,10,1):
       wave_gen().trigDelay(i*.000000001)
       time.sleep(1)
       Windows512 = tc.get_512_windows(startWindow,totalWindows,nmbrWindows,2)       
      # WindowsSum += Windows512
       Windows512 = [int(i)] + Windows512.tolist()
       Windows512_delays.append(Windows512)

#time.sleep(1)
#regID = 78
#regValue = 1000
#tc.send_command(8,regID,regValue) # first window
#time.sleep(1)
#
#
#i=17
#for j in range(50,63,1):
#   #for i in delays:
#   regID = 65
#   regValue = j
#   tc.send_command(8, regID, regValue) 
#   time.sleep(1)
#   for k in range(0,10,1):
#       wave_gen().trigDelay(i*.000000001)
#       time.sleep(1)
#       Windows512 = tc.get_512_windows(startWindow,totalWindows,nmbrWindows,2)       
#      # WindowsSum += Windows512
#       Windows512 = [int(j)] + Windows512.tolist()
#       Windows512_delays.append(Windows512)
#
#WindowsMean = WindowsSum/(j+1)
#WindowsAvg = [int(j+1)] + WindowsMean.tolist()
#Windows512_delays.append(WindowsAvg)

#np.savetxt(os.path.abspath('./data/bb5_qBIAS1300_beforandater_window17_SweepFB_10times2.txt'), np.array(Windows512_delays).T, fmt='%5.3f')
np.savetxt(os.path.abspath('./data/test_notimingviolations_dllON_SSTOUTFBsweep20.txt'), np.array(Windows512_delays).T, fmt='%5.3f')

Windows512_delays = Windows512_delays * 0 

time.sleep(1)

wave_gen().Output1(out=False)


