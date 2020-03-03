#!/usr/bin/env python

from scapy.all import *
import numpy as np
import os
import matplotlib.pyplot as plt




num_channels =16
def bin2dec(pkt):
    payloadSize=512
    num_channels=16
    
    data2 = list()
    raw = pkt[Raw].load
    payload= np.frombuffer(raw, dtype=np.uint16)
   # print(len(payload))
   # print(type(payload))
    #print(payload[1])
   # payload_chs = payload[2:514]
   # payload_reshape= payload_chs.reshape(-1,num_channels)
    #print(payload_reshape)
    return payload[1:514]
#sniff(offline='traffic.pcap', prn=processPacket,store=0 )
i=0



def process_packet(filename,channel):
    scapy_cap = rdpcap('traffic.pcap')
    payloads_list = []
    window_numbers=[]
    numberofwindows=0
    for packet in scapy_cap:
        temp = bin2dec(packet)
        temp_payload = temp[1:514]
        temp_rsh = temp_payload.reshape(-1,num_channels)
       # print(temp_rsh)
        print("/////////////////////new packet///////////")
       # print(temp_rsh)
        temp_rsh_transpose =temp_rsh.transpose()
        payloads_list.append(temp_rsh_transpose[channel].tolist())
        window_numbers.append(temp[0])
        print(window_numbers)
        numberofwindows+=1
    print(payloads_list)
    payloads_list_flat = [item for  sublist in payloads_list for item in sublist]
    print(payloads_list_flat)
    plt.figure()
    plt.plot(payloads_list_flat)
    plt.title('{}'.format(window_numbers))
    for j in range(0,int(32*(numberofwindows+1)),32):
        plt.axvline(j, color='k', linewidth=2)
    plt.show()
           

filename='traffic.pcap'
process_packet(filename, 14)
