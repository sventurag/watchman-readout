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
    average=[]
    for packet in scapy_cap:
        temp = bin2dec(packet)
        temp_payload = temp[1:514]
        print("len payload",len(temp_payload))
        temp_rsh = temp_payload.reshape(num_channels,-1)
        print("/////////////////////new packet///////////")
        payloads_list.append(temp_rsh[channel].tolist())
        window_numbers.append(temp[0])
        numberofwindows+=1
        average.append(np.mean(temp_rsh[channel])-1115)
    print("AVERAGE",average)
   # print("payloads_list",payloads_list)
    payloads_list_flat = [item for  sublist in payloads_list for item in sublist]
    print(window_numbers)
    fonttam=40
    #plt.figure()
    fig= plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(payloads_list_flat, '-o')
    ax.set_title("Freq=1 Hz, Electronics Delay = 7, Samplecnt 010")
    newTickLoc = list(range(0,numberofwindows*32,32))
    for j in range(0,int(32*(numberofwindows+1)),32):
        ax.axvline(j, color='g', linewidth=1)
    ax2= ax.twiny()    #https://stackoverflow.com/questions/10514315/how-to-add-a-second-x-axis-in-matplotlib
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(newTickLoc)
    ax2.set_xticklabels(window_numbers, fontsize=9, rotation=70)
    ax.set_ylabel('Counts',fontsize= fonttam)
    ax.set_xlabel('Time [ns]',fontsize= fonttam)
    ax2.set_label("Window number")
#    plt.figure()
#    plt.plot(average[1:len(average)],'-ro', label='by offset')
#    plt.plot(window_numbers, '--k*', label='wdo_number from roundbuffer')
#    plt.ylabel('Mean value per window', fontsize=fonttam)
#    plt.xlabel('Number of windows', fontsize= fonttam)
#    plt.legend(fontsize=fonttam-10)
    plt.show()

filename='traffic.pcap'
process_packet(filename, 15)

