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
#    payloadSize=512
#    num_channels=16
    num_elements = (32*num_channels) + 2
    data2 = list()
    raw = pkt[Raw].load
    payload= np.frombuffer(raw, dtype=np.uint16)
    return payload[1:num_elements]
#sniff(offline='traffic.pcap', prn=processPacket,store=0 )


def process_packet(filename,channel, plotWindows):
    scapy_cap = rdpcap(filename)
    payloads_list = []
    num_elements = (31*num_channels) + 2
    window_numbers=[]
    numberofwindows=0
  #  average=[]
    for packet in scapy_cap:
        temp = bin2dec(packet)
        temp_payload = temp[1:num_elements] # Taking the payload only
        temp_rsh = temp_payload.reshape(num_channels,-1)
        payloads_list.append(temp_rsh[channel].tolist())
        window_numbers.append(temp[0]) # Taking the window number only
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
    df['countsIndx']=list(range(0,32,1))*numberofwindows
    col_window_numbers=[]
    for item in window_numbers:
        for i in range(0,32,1):
            col_window_numbers.append(item)
    
    df['windowNumbers'] = col_window_numbers;
    df['numberofwindows']= numberofwindows
    df['flatWindowNumbers']=0 
    df.flatWindowNumbers[0:numberofwindows]= window_numbers
    return df

def process_packet_pulseSweep(filename,channel,nmbrWin):
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
        window_numbers.append(temp[0]) # Taking the window number only
        numberofwindows+=1
    print(numberofwindows)
   #     average.append(np.mean(temp_rsh[channel])-1115)
   # print("AVERAGE",average)
    payloads_list_flat = [ [item for  sublist in payloads_list[i:i+nmbrWin] for item in sublist] for i in range(0,numberofwindows,nmbrWin)]
    df = pd.DataFrame(payloads_list_flat).transpose()   
#    offset = 200
#    df = pd.DataFrame(payloads_list).transpose()
#    df= df -offset
    print("ALL PACKETS CONVERTED")
    
#   # Subtract offset
#    offset = 200
#    df = pd.DataFrame(payloads_list_flat, columns=['payload'])
#    df = df-offset
#    #payload_minus_offset = [ x - offset for x in payloads_list_flat] 
#    df['countsIndx']=list(range(0,32,1))*numberofwindows
#    col_window_numbers=[]
#    for item in window_numbers:
#        for i in range(0,32,1):
#            col_window_numbers.append(item)
#    
#    df['windowNumbers'] = col_window_numbers;
#    df['numberofwindows']= numberofwindows
#    df['flatWindowNumbers']=0 
#    df.flatWindowNumbers[0:numberofwindows]= window_numbers
#   """
    return df



def plotPulses(df,xlim1, xlim2, ylim1,ylim2):

    #fig= plt.figure()
    fig,ax = plt.subplots()
    ax.plot(df.payload, '-o', markersize=1.5, mfc='k', label= 'Window as first')
#    plt.plot(df.payload[16384:-1].values, '-o', markersize=1.5, mfc='r', label='Window as Second')

    ax.set_xlim(xlim1,xlim2)
    ax.set_ylim(ylim1,ylim2)
    plt.xticks(fontsize=fonttam)
    plt.yticks(fontsize=fonttam)
    ax.grid(axis='y')
#    ax.set_title("Pedestal subtracted data in trigger mode")
    #plt.legend(['Pedestal subtracted Pulses'])
    #plt.legend()
    ax.yaxis.grid(True)
    newTickLoc = list(range(0,df.numberofwindows[0]*32,32))
    #for j in range(0,int(32*(numberofwindows+1)),32):
     #  ax.axvline(j, color='g', linewidth=1)
    ax2= ax.twiny()    #https://stackoverflow.com/questions/10514315/how-to-add-a-second-x-axis-in-matplotlib
    ax2.set_xlim(ax.get_xlim()) 
    ax2.set_xticks(newTickLoc)
    ax2.set_xticklabels(df.flatWindowNumbers[0:df.numberofwindows[0]], fontsize=9, rotation=70)
    ax2.set_label("Window number")
    ax2.grid(axis='x')
    ax.set_ylabel('ADC Counts',fontsize= 12)
    ax.set_xlabel('Time [ns]',fontsize= fonttam)
    plt.xlim(xlim1,xlim2)
    return ax
# plt.title('Pedestal subtracted data')
   # return df
    
    #    
#    # High pass filter
#    filtered_sig = highpass_filter(payload_minus_offset,1/(1e-9) )
#    ax.plot(filtered_sig[0:100])
#    ax.legend(['Raw pulses', 'Filtered pulses'])
    # Using pandas dataframe to find rising edge and maximums
   # df['numberofwindows']= numberofwindows;
    #df_filt = pd.DataFrame(filtered_sig, columns=['payload'])

def pulseMax (df, diffSamples, minThreshold):
    """ estimate max for pulses """
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
       if rising_index[i] >= 10:
           range_max_inf = 10;
           range_max_sup = 10;
       else:
           range_max_inf = 0;
           range_max_sup = 10;
            
       temp= df.payload[rising_index[i]- range_max_inf: rising_index[i]+ range_max_sup].idxmax()
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
    props = idict(boxstyle='round', facecolor='wheat', alpha=0.5)
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


fonttam=13

#filename='20000Hz100pulses.pcap'
#filename= 'traffic.pcap'
#filename= './data/10000Hz100pulses12nsVolt070load50.pcap'

#filename = './bunches_last/1000Hzpulses_2117110307303_cycles12nsVolt070load50_sp50sp99'

#filename = './bunches/1000Hzpulses_2117110307303_cycles12nsVolt070load50_sp_sp1'
#filename = './4000Hz/4000Hzpulses_3452729986_cycles12nsVolt070load50_sp'
#filename = './1000Hz/1000Hzpulses_6899474890_cycles12nsVolt070load50_sp1'
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
#filename = './test_pedestal/test_pedestal_data.pcap'
#filename = './dataPedTriggerMode/dataPedTriggerMode10.pcap'
#df = process_packet(filename, 0, True)


#plt.show()
#df_payload = pulseMax(df, -100, 200)
#df_filtered = pulseMax(df_filt, -70,150)

##### plt.plot(df_payload.maximum,'ok', markersize= 5, mfc='red')
##### #plt.xlim(0,1000)
##### plt.figure()
##### 
##### 
##### 
##### #plt.show()
##### 
##### ## 3D PLOT
##### 
##### #######
##### 
##### #fig= plt.figure()
##### #ax20=fig.add_subplot(111, projection='3d')
##### #yticks=list(range(0,32,1))
##### #
##### #for k in yticks:
##### #    
##### #    df_no31 = df_payload.loc[df_payload['ciountsIndx'] == k ]
##### #    #ys= df_no31.maximum[df_no31.maximum>0]
##### #    df_group = df_no31.groupby('maximum')['windowNumbers'].count()
##### #    xs = df_group.index.values
##### #    ys= df_group.values
##### #    print('ys',ys)
##### #    print('xs',xs)
##### #    #xs = list( range(0,len(ys),1) ) 
##### #    ax20.bar(xs,ys, zs=k, zdir='y', alpha=0.8)
##### #
##### #ax20.set_xlabel('Maximum')
##### #ax20.set_ylabel('Sample Number')
##### #ax20.set_zlabel('Frequency')
##### #ax20.set_yticks(yticks)
##### #
def saveHeights(df_payload, filenameCSV):

    df_countsAndMaximum = df_payload[['countsIndx', 'maximum']].loc[df_payload['maximum'] > 0]
    df_windowAndMaximum = df_payload[['windowNumbers', 'maximum']].loc[df_payload['maximum'] > 0]
    df_countsAndMaximum.to_csv( filenameCSV+'_sample_VsMaximum.txt', header=False, index=False, sep='\t', mode='w')
    df_windowAndMaximum.to_csv(filenameCSV+'_windowVsMaximum.txt', header=False, index=False, sep='\t', mode='w')
##### 
##### print('countsAndMaximum',df_countsAndMaximum.head())
##### #
##### 
##### sample =0
##### df_payload['maxSampleX'] =  df_payload.maximum[df_payload['maximum']>0].loc[ df_payload['countsIndx']== sample]
##### 
##### 
##### 
##### print("---------------------")
##### 
##### 
##### print(df_payload[df_payload['maxSampleX']>0])
##### #df['rising'] = df.payload[ ( (df.payload.shift(1) - df.payload) <diffSamples ) & (df.payload > minThreshold) ]   
##### df_maxSample= df_payload[ df_payload.iloc [:,-1] >0 ]
##### 
##### shift_ = 20
##### list_maxSample = df_maxSample.index.values-shift_
##### print('list_maxSample',list_maxSample)
##### #list_maxSample2 = [list_maxSample-10 for x in list_maxSample]
##### 
##### #print('list_maxSample2',list_maxSample2)
##### #print('list_maxSample',list_maxSample[0:10])
##### #print('list_maxSample', df_payload.payload[ list_maxSample[0]: list_maxSample[20]] )
##### 
##### width=40
##### 
##### fig, axes = plt.subplots(nrows= 5, ncols=20)
##### fig.subplots_adjust(hspace=0.5)
##### fig.suptitle('Sample {}'.format(sample))
##### for ax in axes.flatten():
#####     indx = np.where(axes.flatten()==ax)[0][0]
#####     list_ind = list_maxSample[indx]
#####     print(indx)
#####     ax.plot(  df_payload.index[ list_ind : (list_ind+width) ],          df_payload.payload[ list_ind : (list_ind+width) ], '-ok')
#####  
#####     ax.plot( df_payload.index[ (list_ind +shift_)],df_payload.payload[ (list_ind + shift_) ], '>')
#####     
#####     ax.set(title='{}'.format(df_payload.payload[ (list_ind + shift_) ]))
#####     ax.grid()
#####     ax.set_ylim(-20,10)
##### #df_pulsesZero = df_payload.plot ( df_payload.payload  [  df_payload['maxSample0'].iloc[ ]       ])  
##### 
##### 
##### df_payload['maxSampleX'] =  df_payload.maximum[df_payload['maximum']>0].loc[ df_payload['countsIndx']== sample]
##### 
##### 
##### 
##### 
##### plt.figure()
##### minHist = int(df_payload.maxSampleX.loc[df_payload.maxSampleX > 0].min())
##### maxHist =int( df_payload.maxSampleX.loc[df_payload.maxSampleX > 0].max())
##### plt.hist(df_payload.maxSampleX, range=( minHist, maxHist), bins= (maxHist-minHist)+1 )
##### 
##### 
##### #print(df_payload.maxSampleX, bins=61,  range=(540,600))
##### print(df_payload.head())
##### 
##### 
##### plot_hist(df_payload)
##### 
#plt.show()

