#!/usr/bin/env python

from scapy.all import *
import numpy as np
import os
import matplotlib.pyplot as plt



def processPacket(pkt):
    payloadSize=512
    num_channels=16
    
    data2 = list()
    raw = pkt[Raw].load
    payload= np.frombuffer(raw, dtype=np.uint16)
    print(len(payload))
    print(type(payload))
    
    payload = payload[2:514]
    payload_reshape= payload.reshape(-1,16)
    print(payload_reshape)
    plt.figure()
    plt.plot(payload_reshape[15])
    plt.show()    
sniff(offline='traffic.pcap', prn=processPacket,store=0 )
