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
    return payload[1:514]
#sniff(offline='traffic.pcap', prn=processPacket,store=0 )


def process_packet(filename,channel):
    scapy_cap = rdpcap('traffic.pcap')
    payloads_list = []
    window_numbers=[]
    numberofwindows=0
    for packet in scapy_cap:
        temp = bin2dec(packet)
        temp_payload = temp[1:514]
        temp_rsh = temp_payload.reshape(num_channels,-1)
        print("/////////////////////new packet///////////")
        payloads_list.append(temp_rsh[channel].tolist())
        window_numbers.append(temp[0])
        numberofwindows+=1
    payloads_list_flat = [item for  sublist in payloads_list for item in sublist]
    print(window_numbers)
   
    #plt.figure()
    fig= plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(payloads_list_flat, '-o')
    ax.set_title("Pulses in self trigger mode")
    newTickLoc = list(range(0,numberofwindows*32,32))
    for j in range(0,int(32*(numberofwindows+1)),32):
        ax.axvline(j, color='g', linewidth=1)
    ax2= ax.twiny()    #https://stackoverflow.com/questions/10514315/how-to-add-a-second-x-axis-in-matplotlib
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(newTickLoc)
    ax2.set_xticklabels(window_numbers, fontsize=9, rotation=70)
    ax2.set_label("Window number")
    plt.show()
filename='traffic.pcap'
process_packet(filename, 15)
