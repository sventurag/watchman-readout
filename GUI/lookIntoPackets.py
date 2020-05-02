#!/usr/bin/env python

from scapy.all import *
import numpy as np
import os
import matplotlib.pyplot as plt
import pandas as pd
#from scipy.signal import argrelextrema
import scipy.stats as stats          
from scipy import signal
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
#    plt.figure()
#    plt.plot(window_numbers, '-ro', markersize=1)
#    plt.ylabel('Window Number',fontsize= fonttam)
#    plt.xlabel('Number of windows',fontsize= fonttam)
#    plt.grid(True) 
#    # Offset to avoid negative numbers subtraction
    offset = 200
    payload_minus_offset = [ x - offset for x in payloads_list_flat] 
   
    fig= plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(payload_minus_offset, '-o', markersize=3)
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    ax.set_title("Freq=10000 Hz, Pulse width = 12 ns, VOLT =0.07 , LOAD = 50 Ohms", y=1.1)
    ax.yaxis.grid(True)
    newTickLoc = list(range(0,numberofwindows*32,32))
    #for j in range(0,int(32*(numberofwindows+1)),32):
     #  ax.axvline(j, color='g', linewidth=1)
    ax2= ax.twiny()    #https://stackoverflow.com/questions/10514315/how-to-add-a-second-x-axis-in-matplotlib
    ax2.set_xlim(ax.get_xlim())
    ax2.set_xticks(newTickLoc)
    ax2.set_xticklabels(window_numbers, fontsize=9, rotation=70)
    ax2.set_label("Window number")
    ax.set_ylabel('Counts',fontsize= fonttam)
    ax.set_xlabel('Time [ns]',fontsize= fonttam)
    filtered_sig = highpass_filter(payload_minus_offset,1/(1e-9) )
    #ax.plot(filtered_sig)
    ax.legend(['Raw pulses', 'Filtered pulses'])
    # Using pandas dataframe to find rising edge and maximums
    df = pd.DataFrame(payload_minus_offset, columns=['payload'])
    print(df)
    df_filt = pd.DataFrame(filtered_sig, columns=['payload'])
    df_payload = pulseMax(df, -150, 300)
    df_filtered = pulseMax(df_filt, -70,150)
    print('DF_PAYLOAD',df_payload.maximum[df_payload.maximum>0])
    plt.figure()
  #  df_payload.maximum.plot()
    plt.plot(df_payload.maximum[df_payload.maximum>0], '-o', markersize=3)
    plt.plot(df_filtered.maximum[df_filtered.maximum>0], '-o', markersize=3)
    
    plt.legend(['Raw pulses', 'Filtered pulses'])
    plt.figure()
   # fig5= plt.figure()
   # ax = fig5.add_subplot(111)
    plt.plot(df_payload.payload, '-o', markersize=1)
    plt.scatter(df_payload.index, df_payload.maximum, c='k', s=15)
    #plt.figure()
    plt.plot(df_filtered.payload)#, '-o', markersize=3,markerfacecolor="None",markeredgecolor='orange')
    plt.scatter(df_filtered.index, df_filtered.maximum, c='r', s=32)
    plt.grid(True)
    plt.figure()
    plt.scatter(df_payload.index, df_payload.maximum, c='k', s=15)
    plt.scatter(df_filtered.index, df_filtered.maximum, c='r', s=32)
   # plt.show()
  
    plot_hist(df_payload, 500,610)
    plot_hist(df_filtered, 500,610)
    plt.show()

def pulseMax (df, diffSamples, minThreshold):
    fonttam=20
    # Identifying rising edge points of the pulses, there may be more than one point identified as rising edge for the same
    # pulse.
    df['rising'] = df.payload[ ( (df.payload.shift(1) - df.payload) <diffSamples ) & (df.payload > minThreshold) ]   
    rising_index = df.rising[ df.rising > 0].index
    
    # For each rising edge point, the index of the  maximum value of the pulse is searched in the next 10 positions,
    # the if condition discriminates the duplicated maximum values.
    indx_max = []
    temp = []
    for i in range( len( rising_index ) ):
       temp= df.payload[rising_index[i]: rising_index[i]+16].idxmax()
       if i==0:
           indx_max.append(temp)
       elif (temp != indx_max[-1]):
           indx_max.append(temp)

    df['maximum'] = df.payload[indx_max]
    return df

    #Plotting maximum values in the pulses plot

#    plt.scatter(df.index, df.maximum, c='k', s=3)
    # Plotting maximum values and the histogram
#    fig3= plt.figure()
#    ax3 = fig3.add_subplot(211)
#    plt.plot(df.maximum[df.maximum>0], '-o', markersize=3)
#    ax3.set_ylabel('Counts',fontsize= fonttam)
#    ax3.set_xlabel('Time [ns]',fontsize= fonttam)
#    ax3.yaxis.grid(True)
#    ax3.xaxis.grid(True)
#    plt.xticks(fontsize=20)
#    plt.yticks(fontsize=20)
   # fig4= plt.figure()
#    ax4 = fig3.add_subplot(212)
#    param = stats.norm.fit(df.payload.values)   # Fit a normal distribution to the data

#    x = np.linspace(-40, 40, 100)      # Linear spacing of 100 elements between 0 and 20.
    #pdf_fitted = stats.norm.pdf(x, *param)    # Use the fitted paramters to create the y datapoints
# Plot some fancy text to show us what the paramters of the distribution are (mean and standard deviation)
    
    #df.payload.hist(bins=81, range=(-40,40), normed=True, histtype='bar', ec='black')
    
    #df.payload.plot.kde()
   # plt.text(x=np.min(df.payload.values), y=0.1, s=r"$\mu=%0.1f$" % param[0] + "\n" + r"$\sigma=%0.1f$" % param[1], color='r')
    # Plot a line of the fitted distribution over the top
    #plt.plot(x, pdf_fitted, color='r')
def plot_hist(df,xlim1,xlim2):
    fonttam=20
    fig4= plt.figure()
    ax4 = fig4.add_subplot(111)
    mean_max = df.payload[df.maximum>0].mean()
    std_max = df.payload[df.maximum>0].std()
    print('mean_max',mean_max)

    hist =  df.maximum[df.maximum>0].hist(bins=100,range=(xlim1,xlim2), ec='k')
    #hist = df.payload.plot(kind='bar')
    #print(hist)
    props = dict(boxstyle='round', facecolor='wheat', alpha=0.5)
    textstr = '\n'.join((
            '%.f Pulses' % (len(df.maximum[df.maximum>0]),),
            'Maximum Amplitude',
            r'$\mu=%.2f$' % (mean_max, ),
            r'$\sigma= %.2f$' % (std_max, )))
    #        r'$\mu=%.2f$' % (df.payload.mean(), ),
    #        r'$\sigma= %.2f$' % (df.payload.std(), )))
    ax4.text(0.5, 0.6, textstr, transform=ax4.transAxes, fontsize=20,
                    verticalalignment='top', bbox=props)
    ax4.set_xlabel('Counts',fontsize= fonttam+10)
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    print(df.payload.describe())
    #fig, ax5 = plt.subplots()
   # df.payload.plot.kde(ax=ax5, legend=False, title='Histogram: A vs. B')
   # df.payload.plot.hist(density=True, ax=ax)
    print(df)
def highpass_filter(y, sr):
    low_filter_stop_freq = 100  # Hz
    low_filter_pass_freq = 200  # Hz
    filter_order = 3
    high_filter_stop_freq = 55e6  # Hz
    high_filter_pass_freq = 55.1e6   # Hz
    

    # High-pass filter
    nyquist_rate = sr / 2.
    desired = (1, 1, 1, 1, 1, 0)
    bands = (0, low_filter_stop_freq, low_filter_pass_freq, high_filter_stop_freq, high_filter_pass_freq, nyquist_rate)
    filter_coefs = signal.firls(filter_order, bands, desired, nyq=nyquist_rate)

# Apply high-pass filter
    filtered_audio = signal.filtfilt(filter_coefs, [1], y)
    return filtered_audio

#filename='20000Hz100pulses.pcap'
filename= 'traffic.pcap'
process_packet(filename, 15)

