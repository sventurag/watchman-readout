from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
import binary2text as b2t
import numpy as np
#from watchman_nogui import Watchman_main_window
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc


tc = targetc.targetc()



wave_gen().Output1(out=False)
nmbrWindows = 4
tc.send_command(9,1,nmbrWindows) # pedestal
time.sleep(8)

regValue= 0 #
regID = 93
tc.send_command(8,regID,regValue) # delay from rising edge WR update
time.sleep(1)
regID = 151
regValue = 0
tc.send_command(8,regID,regValue) # first window
time.sleep(1)

regID = 152

regValue = nmbrWindows
tc.send_command(8, regID, regValue)
time.sleep(1)
 

wave_gen().Output1(out=True)

Windows512 = np.zeros((512*32))
Windows512_delays= list()

#de`lays = list((range(18,19,1)))

wave_gen().trigDelay(18*.000000001)

strb2LE = list((range(0,63,30)))
strb2TE = list((range(0,63,30)))
wr2LE = list((range(0,63,30)))
wr2TE = list((range(0,63,30)))
strb1LE = list((range(0,63,30)))
strb1TE = list((range(0,63,30)))
wr1LE = list((range(0,63,30)))
wr1TE = list((range(0,63,30)))


for i in strb2LE:
    tc.send_command(8,68,i)
    time.sleep(.5)
    for j in strb2TE:
       tc.send_command(8,69,j)
       time.sleep(.5)
       for k in wr2LE:
           tc.send_command(8,70,k)
           time.sleep(.5)
           for l in wr2TE:
               tc.send_command(8,71,l)
               time.sleep(.5)
               for m in strb1LE:
                   tc.send_command(8,72,m)
                   time.sleep(.5)
                   for n in strb1TE:
                       tc.send_command(8,73,n)
                       time.sleep(.5)
                       for o in wr1LE:
                           tc.send_command(8,74,o)
                           time.sleep(.5)
                           for p in wr1TE:
                               tc.send_command(8,75,p)
                
                               time.sleep(.5)
                               time.sleep(0.5)
                               Windows512 = tc.get_512_windows(nmbrWindows)      
                               Windows512_delays.append(Windows512)
                               time.sleep(0.5)
                        

np.savetxt(os.path.abspath('./data/bruteForce.txt'), np.array(Windows512_delays).T)
wave_gen().Output1(out=False)

#regValue= 8 #  is  8 ns befor rising
#regID = 151
#nmbrWindows = 4
#send_command(8)
#time.sleep(1)
#send_command(7)

tc.close_UDP_connection_cmd()
#
#tc.close_UDP_connection_data()

