#!/usr/bin/env python

from scapy.all import *
import numpy as np
import os
import matplotlib.pyplot as plt
import pandas as pd
#from scipy.signal import argrelextrema


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
    scapy_cap = rdpcap(filename)
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
    print('WINDOWS NUMBERS',window_numbers)
    fonttam=20
    # Plotting number of windows
    plt.figure()
    plt.plot(window_numbers, '-ro', markersize=1)
    plt.ylabel('Window Number',fontsize= fonttam)
    plt.xlabel('Number of windows',fontsize= fonttam)
    plt.grid(True) 
    # Offset to avoid negative numbers subtraction
    offset = 210
    payload_minus_offset = [ x - offset for x in payloads_list_flat] 
   
    fig= plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(payload_minus_offset, '-o', markersize=3)
    ax.set_title("Freq=10000 Hz, Pulse width = 8 ns, VOLT =0.07 , LOAD = 50 Ohms", y=1.1)
    ax.yaxis.grid(True)
    newTickLoc = list(range(0,numberofwindows*32,32))
    for j in range(0,int(32*(numberofwindows+1)),32):
        ax.axvline(j, color='g', linewidth=1)
    ax2= ax.twiny()    #https://stackoverflow.com/questions/10514315/how-to-add-a-second-x-axis-in-matplotlib
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(newTickLoc)
    ax2.set_xticklabels(window_numbers, fontsize=9, rotation=70)
    ax2.set_label("Window number")
    ax.set_ylabel('Counts',fontsize= fonttam)
    ax.set_xlabel('Time [ns]',fontsize= fonttam)
    # Using pandas dataframe to find rising edge and maximums
    df = pd.DataFrame(payload_minus_offset, columns=['payload'])
    print(df)
     
    # Identifying rising edge points of the pulses, there may be more than one point identified as rising edge for the same
    # pulse.
    df['rising'] = df.payload[ ( (df.payload.shift(1) - df.payload) <-200 ) & (df.payload >300) ]   
    rising_index = df.rising[ df.rising > 0].index
    
    # For each rising edge point, the index of the  maximum value of the pulse is searched in the next 10 positions,
    # the if condition discriminates the duplicated maximum values.
    indx_max = []
    temp = []
    for i in range( len( rising_index ) ):
       temp= df.payload[rising_index[i]: rising_index[i]+10].idxmax()
       if i==0:
           indx_max.append(temp)
       elif (temp != indx_max[-1]):
           indx_max.append(temp)

    df['maximum'] = df.payload[indx_max]
    mean_max = df.payload[df.maximum>0].mean()
    std_max = df.payload[df.maximum>0].std()
    print('mean_max',mean_max)
    #Plotting maximum values in the pulses plot
    plt.scatter(df.index, df.maximum, c='k', s=3)
    # Plotting maximum values and the histogram
    fig3= plt.figure()
    ax3 = fig3.add_subplot(211)
    plt.plot(df.maximum[df.maximum>0], '-o', markersize=3)
    ax3.set_ylabel('Counts',fontsize= fonttam)
    ax3.set_xlabel('Time [ns]',fontsize= fonttam)
    ax3.yaxis.grid(True)
    ax3.xaxis.grid(True)
    ax4 = fig3.add_subplot(212)
    hist =  df.maximum[df.maximum>0].hist(bins=20)
    props = dict(boxstyle='round', facecolor='wheat', alpha=0.5)
    textstr = '\n'.join((
            '%.f Pulses' % (len(indx_max),),
            'Maximum Amplitude',
            r'$\mu=%.2f$' % (mean_max, ),
            r'$\sigma= %.2f$' % (std_max, )))
    ax4.text(0.05, 0.95, textstr, transform=ax.transAxes, fontsize=14,
                    verticalalignment='top', bbox=props)
    ax4.set_xlabel('Counts',fontsize= fonttam)

    plt.show()

#filename='20000Hz100pulses.pcap'
filename= 'traffic.pcap'
process_packet(filename, 15)

