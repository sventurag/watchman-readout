#!/usr/bin/env python

"""
Functions for controlling the waveform generator 33600a
based on https://github.com/samdejong86/Agilent33600
"""
import visa
import time

class wave_gen(object):
    def __init__(self):
        self.address =  "192.168.153.214"
        #load the VISA resource manager
        rm = visa.ResourceManager('@py')
        
        #connect to the device
        self.inst = rm.open_resource("TCPIP::"+self.address+"::INSTR")
        
#        print(self.inst.query("*IDN?"))
 
    def Output1(self,out=True):
        if out == True:
            cmd = "OUTPUT1 ON"
        else:
            cmd = "OUTPUT1 OFF"
            
        message="Controlling\nRemotely"
        self.inst.write("DISP:TEXT '"+message+"'")
        
        #sent commands to device
        self.inst.write(cmd)
        print(cmd)
        #
        #clear message
        self.inst.write("DISP:TEXT ''")
        #close device connection
        self.inst.close()
    
    def trigDelay(self,trig_delay):
        cmd = "TRIG1:DEL {:.9f}".format(trig_delay)
        
        message="Controlling\nRemotely"
        self.inst.write("DISP:TEXT '"+message+"'")
        
        #sent commands to device
        
        self.inst.write(cmd)
        print(cmd)
        
        #clear message
        self.inst.write("DISP:TEXT ''")
        
        #close device connection
        self.inst.close()

    def bursSettings(self, ncyccount):
        self.inst.write("BURS:STAT ON")
        time.sleep(1)
        self.inst.write("BURS:MODE TRIG")
        time.sleep(1)
       # self.inst.write("TRIG: MANUAL")
        time.sleep(1)
        self.inst.write("BURS:NCYC {:.9f}".format(ncyccount))
        time.sleep(1)
        print("BURS:NCYC {:.9f}".format(ncyccount))
        
        self.inst.close()
    
    def softTrigger(self):
        self.inst.write("TRIG")
        self.inst.close()
    
    def Freq(self,freq): 
        self.inst.write("FREQ {:.9f}".format(freq))
        time.sleep(1)
        self.inst.close()
    def Query(self):
        print('LOAD: ',self.inst.query("OUTPUT1:LOAD?"))
        time.sleep(1)
        print('VOLT: ',self.inst.query("VOLT?"))
        time.sleep(1)
        print('Pulse Width : ',self.inst.query("FUNC:PULS:WIDTH?"))
        time.sleep(1)
    def pulseWidth(self, pulsWidth):
        self.inst.write("FUNC:PULS:WIDTH {:.9f}".format(pulsWidth))
        time.sleep(1)
    def loadHz(self,impedance):
        self.inst.write("OUTPUT1:LOAD {:.9f}".format(impedance))
        time.sleep(1)
    def volt(self, voltage):
        self.inst.write("VOLT {:.9f}".format(voltage))
        time.sleep(1)
        

                     

