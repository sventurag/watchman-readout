from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
#import binary2text as b2t
import numpy as np
#from watchman_nogui import Watchman_main_window
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
import pandas as pd
from plot_delays_max import plot_pulse

tc = targetc.targetc()

    
lblsize =30
plt.rc('xtick', labelsize= lblsize)
plt.rc('ytick', labelsize=lblsize)


fileName= '/home/salvador/salvador_fork/fixTImingFirmware/watchman-readout/GUI/data/data_jan5_6.txt'
windows= [21,25,3]
df_rawPulse = pd.read_csv ( fileName, sep=" ", names='p', skiprows=1 )

print('df_rawPulse',df_rawPulse)

ped_512=plot_pulse('./data/raw_window_512.txt')
print('ped_512',ped_512)

#ped_512=data.iloc[0:95]
plt.figure()
plt.plot(df_rawPulse)
#plt.show()

#pedSubtractedData= df_Data-ped_512[609:704]


first_a= windows[0]*32
first_b = first_a +32

sec_a= windows[1]*32
sec_b = sec_a +32

third_a= windows[2]*32
third_b = third_a +32


data1= pd.DataFrame({'ped' : ped_512.iloc[first_a:first_b]})
data2= pd.DataFrame({'ped' : ped_512.iloc[sec_a:sec_b]})
data3= pd.DataFrame({'ped' : ped_512.iloc[third_a:third_b]})

data = pd.concat([data1,data2,data3])
print('peds before append', data)


print('peds before reset index', data)
data = data.reset_index(drop=True)

data['rawPulse']= df_rawPulse
data['pedSub']= data['rawPulse']- data['ped']
#print(''peds)

print('data',  data)






plt.figure()

plt.plot(data['ped'], label='Pedestal, 50 avg')
plt.plot(data['rawPulse'],'-ro', label='Raw PMT pulse')
plt.grid(True, linestyle='--', linewidth=1)
plt.legend(fontsize=25,loc= 'lower center' )
plt.ylabel('ADC counts', fontsize=lblsize)
plt.xlabel('Time [ns]', fontsize=lblsize)
plt.figure()

plt.plot(data['pedSub'].iloc[64:96].reset_index(drop=True), '-ro')
plt.ylim(-900,0)
plt.xlim(0,31)
plt.grid(True, linestyle='--', linewidth=1)
plt.ylabel('ADC counts', fontsize=lblsize)
plt.xlabel('Time [ns]', fontsize=lblsize)
plt.title('PMT pulse with TARGETC', fontsize=18, color='b')

#plt.plot(pedSubtractedData [31:63], '-ro')
#plt.plot(ped_51i2[31:63]-1280)
#plt.plot(df_Data[31:63]-1280)
plt.show()

