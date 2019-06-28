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

LE= 63  
TE = int((LE+1)/2)
step=30
start = 1

strb2LE = list((range(start,LE,step)))
strb2TE = list((range(start,TE,step)))

wr2LE = list((range(start,LE,step)))
wr2TE = list((range(start,TE,step)))

strb1LE = list((range(start,LE,step)))
strb1TE = list((range(start,TE,step)))

wr1LE = list((range(start,LE,step)))
wr1TE = list((range(start,TE,step)))

"""
strb2LE = list((range(2,63,30)))
strb2TE = list((range(2,63,30)))
wr2LE = list((range(2,63,30)))
wr2TE = list((range(2,63,30)))
strb1LE = list((range(2,63,30)))
strb1TE = list((range(2,63,30)))
wr1LE = list((range(2,63,30)))
wr1TE = list((range(2,63,30)))
"""
print("Register loop running")

for i in strb2LE:
    if i> start: 
        np.savetxt(os.path.abspath('./data/testBruteForce/bruteForce_i{}_j{}_k{}_l{}_m{}_n{}_o{}_p{}.txt'.format(i,j,k,l,m,n,o,p)), np.array(Windows512_delays).T)
 
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
                
                               time.sleep(0.5)
                               Windows512 = tc.get_512_windows(nmbrWindows)       
                               Windows512 = [i,j,k,l,m,n,o,p] + Windows512
                               if max(Windows512) in range(10,100):
                                   if min(Windows512) in range(10,100):
                                       if max(Windows512[50:70]) in range(20,100):
                                           Windows512_delays.append(Windows512)
                                           print(i,j,k,l,m,n,o,p)
                               time.sleep(0.5)
                        

np.savetxt(os.path.abspath('./data/testBruteForce/bruteForceLast_i{}_j{}_k{}_l{}_m{}_n{}_o{}_p{}.txt'.format(i,j,k,l,m,n,o,p)), np.array(Windows512_delays).T)
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

