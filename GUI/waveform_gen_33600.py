#!/usr/bin/env python

"""
Functions for controlling the waveform generator 33600a
based on https://github.com/samdejong86/Agilent33600
"""
import visa
from time import sleep

class waveform_gen_33600(object):
    def __init__(self):
        self.address =  "192.168.153.214"
        #load the VISA resource manager
        rm = visa.ResourceManager('@py')
        
        #connect to the device
        inst = rm.open_resource("TCPIP::"+address+"::INSTR")
        
        print(inst.query("*IDN?"))
 
    def Output1(self,out=True):
        if out == True:
            cmd = "OUTPUT1 ON"
        else:
            cmd = "OUTPUT1 OFF"
            
        message="Controlling\nRemotely"
        inst.write("DISP:TEXT '"+message+"'")
        
        #sent commands to device
        inst.write(cmd)
        print(cmd)
        #
        #clear message
        inst.write("DISP:TEXT ''")
        #close device connection
        inst.close()
    
    def trigDelay(self,trig_delay):
        cmd = "TRIG1:DEL {:.9f}".format(trig_delay)
        
        message="Controlling\nRemotely"
        inst.write("DISP:TEXT '"+message+"'")
        
        #sent commands to device
        
        inst.write(cmd)
        print(cmd)
        
        #clear message
        inst.write("DISP:TEXT ''")
        
        #close device connection
        inst.close()
    
