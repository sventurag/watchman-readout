import time
import sys
import socket
import optparse
import numpy as np
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
tc = targetc.targetc()

class pulseGen:

    def channel(self, channel):
        regID = 99
        tc.send_command(8,regID,channel) # channel number
        
    def pedestals(self, nmbrPedestals):
#        wave_gen().Output1(out=False)
        #time.sleep(1)
        tc.send_command(9,nmbrPedestals,1) # Pedestals, third parameter is the window number increment

    def pulseInit(self,width):
                
        time.sleep(2)
        wave_gen().pulseWidth(width)
       # time.sleep(2)
       # wave_gen().volt(ampl)
        #wave_gen().Query()
            
    def pulseAmpl(self,ampl):
        wave_gen().volt(ampl)
        time.sleep(1)
    
    
    def windows(self,nmbrWindows,firstWindow, totalWindows):
        regID = 151
        regValue = 4
        tc.send_command(8,regID,firstWindow) # first window
#        time.sleep(1)
        regID = 152
        tc.send_command(8, regID, nmbrWindows) # nmbrWindows
 #       time.sleep(1)
        regID = 98
        tc.send_command(8,regID,totalWindows) # total windows
  #      time.sleep(1)

    def setFreq(self,frequency):
        print("{:.9f}".format(frequency))
        wave_gen().Freq(frequency)
        time.sleep(1)

    def isel(self, iselValue):
        tc.send_command(8, 87, iselValue) # Isel

    def getWindows(self):
        tc.send_command(7,0,0) # get windows 
   
    def closeSocket(self):
        tc.close_UDP_connection_cmd()

    def restart(self):
        tc.send_command(3, 0, 0) # triggerMode 
        time.sleep(1)
        tc.send_command(11,0,0) #restartAll

    def setDelay(self,nmbrCycles):
        regID=95;
        tc.send_command(8, regID, nmbrCycles)
        time.sleep(1)

    def triggerMode(self):
       # wave_gen().bursSettings(nmbrBursts)
       # time.sleep(1)
        tc.send_command(3, 0, 0) # triggerMode 
        #time.sleep(1)
    
    def triggerMode_exit(self):
        tc.send_command(3, 0, 0) # triggerMode 
        time.sleep(1)

    def softTrigger(self):
        wave_gen().softTrigger()
      
    def impedanceLoadHz(self,impedance):
        wave_gen().loadHz(impedance)
