#!/usr/bin/env python

import visa
from time import sleep
import argparse
    
def Output1(out=True):
    address= "192.168.153.214"
    if out == True:
        cmd = "OUTPUT1 ON"
    else:
        cmd = "OUTPUT1 OFF"
        
    #load the VISA resource manager
    rm = visa.ResourceManager('@py')
    
    #connect to the device
    inst = rm.open_resource("TCPIP::"+address+"::INSTR")
    
    print(inst.query("*IDN?"))
    
    message="Controlling\nRemotely"
    inst.write("DISP:TEXT '"+message+"'")
    
    #sent commands to device
    
    #single line
    
    inst.write(cmd)
    print(cmd)
    
    #
    #clear message
    inst.write("DISP:TEXT ''")
    
    #close device connection
    inst.close()

def trigDelay(trig_delay):
    address= "192.168.153.214"
    cmd = "TRIG1:DEL {:.10f}".format(trig_delay)
    
    #load the VISA resource manager
    rm = visa.ResourceManager('@py')
    
    #connect to the device
    inst = rm.open_resource("TCPIP::"+address+"::INSTR")
    
    print(inst.query("*IDN?"))
    
    message="Controlling\nRemotely"
    inst.write("DISP:TEXT '"+message+"'")
    
    #sent commands to device
    
    #single line
    
    inst.write(cmd)
    print(cmd)
    
    #
    #clear message
    inst.write("DISP:TEXT ''")
    
    #close device connection
    inst.close()

