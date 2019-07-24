import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

fileName = '/home/idlab-52/salvador_fork/fix_WR_address/watchman-readout/GUI/data/bb5_qBIAS_500.txt'
df = pd.read_csv ( fileName, sep=" ", header=None, skiprows=1 )
sstoutfb = pd.read_csv ( fileName, sep=" ", header=None,nrows=1 )
print(df)
print(sstoutfb[0][0])
#print(len(sstoutfb[0]))
repeticiones=10

#print(pd.DataFrame(df, columns=[0,3]))
nmbrWindows = 12
fig= plt.figure()
fig.subplots_adjust(hspace=0.7, wspace=0.4)
for i in range(0,13,1):
    ax = fig.add_subplot(5,3,1+i)
    ax.set_ylabel('ADC counts', fontsize=32)
    ax.set_xlabel('Time [ns]', fontsize=32)
#plt.:figure()
    for k in range(0,repeticiones,1):
        suma=int(i*repeticiones+k)
        #print(suma)
        df[suma].plot(xlim=(0,120), ylim=(-10,80), ax=ax, xticks = np.arange(0,120,2), yticks = np.arange(0,100,5), grid=True,legend=False,label='dly={} ns'.format(i), marker= 'o', markersize=1, markerfacecolor='black', markeredgecolor='black')
        ax.set_title('SSTOUTFB={}'.format(sstoutfb[suma][0]))
       # df[i+k].plot( ax=ax, grid=True,legend=False,label='dly={} ns'.format(i), marker= 'o', markersize=1, markerfacecolor='black', markeredgecolor='black')
#        if i<13: 
#            ax.legend(loc = 'upper right', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
#        else:
#            ax.legend(loc = 'upper center', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
        for j in range(0,int(32*nmbrWindows),32):
            plt.axvline(j, color='k')
#fig.text(0.5, 0.04, 'Time [ns]', ha='center', fontsize=16)
#fig.text(0.08, 0.5, 'ADC counts', va='center', rotation='vertical', fontsize=16)
fig.text(.4, .95, 'Pedestal substracted data, same delay, 10 times', ha='center', fontsize=16)

plt.show() 
