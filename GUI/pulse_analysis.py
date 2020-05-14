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
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import
#%matplotlib  inline
num_channels =1
def bin2dec(pkt):
#    payloadSize=512
#    num_channels=16
    num_elements = (32*num_channels) + 2
    data2 = list()
    raw = pkt[Raw].load
    payload= np.frombuffer(raw, dtype=np.uint16)
    return payload[1:num_elements]
#sniff(offline='traffic.pcap', prn=processPacket,store=0 )


def process_packet(filename,channel):
    scapy_cap = rdpcap(filename)
    payloads_list = []
    num_elements = (32*num_channels) + 2
    window_numbers=[]
    numberofwindows=0
  #  average=[]
    for packet in scapy_cap:
        temp = bin2dec(packet)
        temp_payload = temp[1:num_elements] # Taking the payload only
        temp_rsh = temp_payload.reshape(num_channels,-1)
        payloads_list.append(temp_rsh[channel].tolist())
        window_numbers.append(temp[0]) # Taking the window number only:
        numberofwindows+=1
    print(numberofwindows)
   #     average.append(np.mean(temp_rsh[channel])-1115)
   # print("AVERAGE",average)
    payloads_list_flat = [item for  sublist in payloads_list for item in sublist]
   # print('WINDOWS NUMBERS',window_numbers)
    # Plotting number of windows
#    plt.figure()
#    plt.plot(window_numbers, '-ro', markersize=1)
#    plt.ylabel('Window Number',fontsize= fonttam)
#    plt.xlabel('Number of windows',fontsize= fonttam)
#    plt.grid(True) 
#    # Offset to avoid negative numbers subtraction
    print("ALL PACKETS CONVERTED")
    
   # Subtract offset
    offset = 200
    df = pd.DataFrame(payloads_list_flat, columns=['payload'])
    df = df-offset
    #payload_minus_offset = [ x - offset for x in payloads_list_flat] 
    
    #Plot pulses
    fig= plt.figure()
    ax = fig.add_subplot(111)
    ax.plot(df.payload, '-o', markersize=1.5, mfc='k')
    ax.tick_params(axis='both',labelsize=fonttam)
    ax.legend(['Pedestal subtracted Pulses'])
    ax.set_xlim(0,1000)
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
#    
#    # High pass filter
#    filtered_sig = highpass_filter(payload_minus_offset,1/(1e-9) )
#    ax.plot(filtered_sig[0:100])
#    ax.legend(['Raw pulses', 'Filtered pulses'])
    # Using pandas dataframe to find rising edge and maximums
   # df['numberofwindows']= numberofwindows;
    df['countsIndx']=list(range(0,32,1))*numberofwindows
    col_window_numbers=[]
    for item in window_numbers:
        for i in range(0,32,1):
            col_window_numbers.append(item)
    
    df['windowNumbers'] = col_window_numbers;
    return df
    #df_filt = pd.DataFrame(filtered_sig, columns=['payload'])

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

def plot_hist(df):
    fonttam=20
    fig4= plt.figure()
    ax4 = fig4.add_subplot(111)
    mean_max = df.payload[df.maximum>0].mean()
    std_max = df.payload[df.maximum>0].std()
    print('mean_max',mean_max)

    minHist = int(df.maximum.loc[df_payload.maximum > 0].min())
    maxHist =int( df.maximum.loc[df_payload.maximum > 0].max())
    hist =  df.maximum[df.maximum>0].hist(bins=(maxHist-minHist)+1,range=(minHist,maxHist), ec='k')
    print(df.maximum[df.maximum>0].values)
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
    ax4.set_xlabel('Pulse heigth',fontsize= fonttam+10)
    plt.title('Maximum of Pedestal subtracted Pulses')
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    return hist
    #print(df.payload.describe())
    #fig, ax5 = plt.subplots()
   # df.payload.plot.kde(ax=ax5, legend=False, title='Histogram: A vs. B')
   # df.payload.plot.hist(density=True, ax=ax)

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


fonttam=20

#filename='20000Hz100pulses.pcap'
#filename= 'traffic.pcap'
#filename= './data/10000Hz100pulses12nsVolt070load50.pcap'

#filename = './bunches_last/1000Hzpulses_2117110307303_cycles12nsVolt070load50_sp50sp99'

#filename = './bunches/1000Hzpulses_2117110307303_cycles12nsVolt070load50_sp_sp1'
#filename = './4000Hz/4000Hzpulses_3452729986_cycles12nsVolt070load50_sp'
filename = '/home/salvador/vivado/data/1000Hz/1000Hzpulses_6899474890_cycles12nsVolt070load50_sp1'
#filename = './40kHz/40000Hzpulses_184521586246_cycles12nsVolt070load50_sp1'
#filename = './load5k/1000Hzpulses_8972137529_cycles12nsVolt070load5k_sp1'
#filename = './load75/1000Hzpulses_15123268129_cycles12nsVolt070load75_sp1'
#filename = './load100/1000Hzpulses_20572368182_cycles12nsVolt070load100_sp1'

#filename = './load500/1000Hzpulses_20973670700_cycles12nsVolt070load500_sp1'
#filename = './load150/1000Hzpulses_9139343761_cycles12nsVolt070load150_sp1'
#filename = './load80/1000Hzpulses_xxx_cycles12nsVolt070load80_sp'
#filename = './load75/1000Hzpulses_8436789512_cycles12nsVolt050load75_sp1'
#filename = './amp50mV/1000Hzpulses_5495098706_cycles12nsVolt050load75.pcap'
#filename = './amp50mV/1000Hzpulses_16526659222_cycles12nsVolt050load75_sp1'
#filename = './load75/1000Hzpulses_37252155670_cycles12nsVolt070load75_sp1'
#filename = './load75/1000Hzpulses_12749085115_cycles12nsVolt070load75_sp1'
df = process_packet(filename, 0)
#plt.show()
df_payload = pulseMax(df, -100, 200)

#df_filtered = pulseMax(df_filt, -70,150)

plt.plot(df_payload.maximum,'ok', markersize= 5, mfc='red')
plt.xlim(0,1000)


#

#
df_countsAndMaximum = df_payload[['countsIndx', 'maximum']].loc[df_payload['maximum'] > 0]
df_windowAndMaximum = df_payload[['windowNumbers', 'maximum']].loc[df_payload['maximum'] > 0]
df_countsAndMaximum.to_csv('/home/salvador/vivado/data/1000Hzpulses_countsIndxVsMaximumLoad50.txt', header=False, index=False, sep='\t', mode='a')
df_windowAndMaximum.to_csv('/home/salvador/vivado/data/1000Hzpulses_windowVsMaximumLoad50.txt', header=False, index=False, sep='\t', mode='a')

print('countsAndMaximum',df_countsAndMaximum.head())
#

sample =0
df_payload['maxSampleX'] =  df_payload.maximum[df_payload.maximum.notnull()].loc[ df_payload['countsIndx']== sample]



print("---------------------")


print(df_payload[df_payload['maxSampleX']>0])
df_maxSample= df_payload[ df_payload.iloc [:,-1] >0 ]

shift_ = 20
list_maxSample = df_maxSample.index.values-shift_
print('list_maxSample',list_maxSample)

width=40
# Parameters for baseline estimation
numberofPoints=5
df_payload['MeanBeforePulse']= np.nan
df_payload['MeanAfterPulse']= np.nan
fig, axes = plt.subplots(nrows= 5, ncols=20)
fig.subplots_adjust(hspace=0.5)
fig.suptitle('Sample {}'.format(sample))
for ax in axes.flatten():
    indx = np.where(axes.flatten()==ax)[0][0]
    list_ind = list_maxSample[indx]
    print(indx)
    amplitudVector= df_payload.payload[ list_ind : (list_ind+width) ].values
    #Plotting the pulse
    ax.plot(  df_payload.index[ list_ind : (list_ind+width) ],       amplitudVector   , '-ok')
    df_payload.loc[df_payload.index==list_ind+shift_, 'MeanBeforePulse']= np.mean(amplitudVector[0:10])
    df_payload.loc[df_payload.index==list_ind+shift_, 'MeanAfterPulse']= np.mean(amplitudVector[-6:-1])

   # Plotting the maximum
    ax.plot( df_payload.index[ (list_ind +shift_)],df_payload.payload[ (list_ind + shift_) ], '>')
    
    ax.set(title='{}'.format(df_payload.payload[ (list_ind + shift_) ]))
    ax.grid()
    ax.set_ylim(-20,10)


df_payload['maxSampleX'] =  df_payload.maximum[df_payload.maximum.notnull()].loc[ df_payload['countsIndx']== sample]



plt.figure()
minHist = int(df_payload.maxSampleX.loc[df_payload.maxSampleX.notnull()].min())
maxHist =int( df_payload.maxSampleX.loc[df_payload.maxSampleX.notnull()].max())
plt.hist(df_payload.maxSampleX, range=( minHist, maxHist), bins= (maxHist-minHist)+1 )
plt.title("Sample{}".format(sample))

print(df_payload.head())


plot_hist(df_payload)

plt.show()



