#!/usr/bin/env python

from scapy.all import *
import numpy as np
import os
import matplotlib.pyplot as plt
from matplotlib.image import NonUniformImage
import pandas as pd
#from scipy.signal import argrelextrema
import scipy.stats as stats          
from scipy import signal
#from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import
num_channels =1

def bin2dec(pkt):
    raw = pkt[Raw].load
    payload= np.frombuffer(raw, dtype=np.uint16)  
    payload=np.delete(payload,[0,-1]) # at this point the content is  WindowNumber + payload
    return payload


def process_packet_pulseSweep(filename,nmbrWin, nofChannels):
    nofTargets=2 # number of digitizers
    windowSize=32 #number of samples per window
    nofSamplesPerPacket= nofTargets*windowSize*num_channels
    scapy_cap = rdpcap(filename)
    targets_data=[[] for i in range(nofTargets)]
    target_0=[[] for i in range(nofChannels)]
    target_1=[[] for i in range(nofChannels)]

    #  num_elements = (500*num_channels) + 2
    window_numbers=[]
    numberofwindows=0
  #  average=[]
    for packet in scapy_cap:
        packetDec = bin2dec(packet)
        window_numbers.append(packetDec[0]) # Taking the window number only
        packetDec= np.delete(packetDec,0) # delete window number
        for j in range(nofTargets):
            targets_data[j] = packetDec[j*windowSize*nofChannels:windowSize*nofChannels*(j+1)] # Taking the targets_data only
            targets_data[j] = [targets_data[j][i:i+windowSize*nofChannels] for i in range(0, len(targets_data[j]), windowSize*nofChannels)] # Make a nested list with channels
        # Dump data channel into two lists for data from each targetc digitizer.
        # target_0 and targetc_1 are list of lists, the index k is for different channels.
        for k in range(nofChannels):
            target_0[k].append(targets_data[0][k])
            target_1[k].append(targets_data[1][k])
    # Flat list of channels
    for l in range(nofChannels):
       target_0[l] = [item for sublist in target_0[l] for item in sublist]
       target_1[l] = [item for sublist in target_1[l] for item in sublist]
    print(window_numbers)
    df_0=pd.DataFrame(np.transpose(target_0))
    df_1=pd.DataFrame(np.transpose(target_1))
    print(targets_data[0])
    print(targets_data[1])

    df_0 = df_0-195.
    
    ax0=df_0.plot()
  #  ax0.set_ylim(-100,100)
    ax0.set_title("{}".format(window_numbers), fontsize=5)
    #ax0.set_xlim(127,(32*totalWindows)-1)
    plt.show()
    fig0 = ax0.get_figure()
    fig0.savefig('Target0.png')
    
    ax1=df_1.plot()
    fig1 = ax1.get_figure()
    fig1.savefig('Target1.png')
    
   
    print("ALL PACKETS CONVERTED")
    
    return df_0, df_1

