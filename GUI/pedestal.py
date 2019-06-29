import time
import sys
import socket
import optparse
import random
import binary2text as b2t
import numpy as np
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
import datetime as dt

tc = targetc.targetc()

nmbrWindows = 4
wave_gen().Output1(out=False)

# Writting to registers before taking data

regValue= 0 #
regID = 93
tc.send_command(8,regID,regValue) # delay from rising edge WR update
time.sleep(.2)

regID = 151
regValue = 0
tc.send_command(8,regID,regValue) # first window
time.sleep(.2)

regID = 152

regValue = nmbrWindows
tc.send_command(8, regID, regValue) # nmbr windows
time.sleep(.2)
 


startWindow = 0
totalWindows = 512


Windows=list()
averageNumber = 10


Windows = np.zeros((averageNumber,  16384   ))

for i in range (averageNumber):

    Windows[i]=tc.get_512_windows(startWindow,totalWindows,nmbrWindows)
    print('Ciclo:' ,i)
    time.sleep(1)
    


avgData= np.sum(Windows,axis=0)/averageNumber
print(avgData[0:10])
print(Windows[0])
Windows = np.append(Windows, [avgData], axis=0)

np.savetxt(os.path.abspath('./data/pedestal_calculation'), Windows.T)

time.sleep(1)

startTest= 0
totalTest= 32
test = tc.get_512_windows(startTest,totalTest, nmbrWindows)

ped_sub_data = np.subtract(test,avgData[startTest:totalTest*32])

np.savetxt(os.path.abspath('./data/ped_sub_data'), ped_sub_data.T)
print('Done')
