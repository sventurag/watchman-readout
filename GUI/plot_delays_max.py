import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import os
fileName = '/home/idlab-52/salvador_fork/fix_WR_address/watchman-readout/GUI/data/triggerbyOsc_10_73_10_rep_100_dll_ON_1Vpp.txt'
vadjn = list(range(2600,2700,5))
#vadjn = list(np.zeros(10))

df = pd.read_csv ( fileName, sep=" ", header=None, skiprows=1 )
sstoutfb = pd.read_csv ( fileName, sep=" ", header=None,nrows=1 )
print(df)
#print(sstoutfb[0][0])
#print(len(sstoutfb[0]))
rango=7
repeticiones = 10
total= int(rango*repeticiones)
startWindow=0
totalWindows=12
#print(pd.DataFrame(df, columns=[0,3]))
nmbrWindows = 4
print(len(df[0]))

print(np.arange(startWindow*32,totalWindows*32,1 ))
df['xx'] = np.arange(startWindow*32,totalWindows*32,1 )
#df[0].plot(x='xx')
fig= plt.figure(num=None, figsize=(8,6), dpi=80)
#fig(num=None, figsize=(8,6), dpi=80)
fig.subplots_adjust(hspace=1, wspace=0.4)
fontsizeAxis=28
std3windowsList = list()
maxList = list()
max1=list()
max2=list()
print(df)


aximums= pd.DataFrame()

for i in range(0,rango,1):
    ax = fig.add_subplot(7,1,1+i)
   # ax.set_ylabel('Counts', fontsize=10)
   # ax.set_xlabel('Time [ns]', fontsize=fontsizeAxis)
   # ax.set_title('VADJN={}'.format(vadjn[i]))
    props = dict(boxstyle='round', facecolor='wheat', alpha=0.5) 
#plt.:figure()
    for	k in range(i,total,rango):
        std_3windows = 0
        suma=k
       # suma=int(i*repeticiones+k)
   # priInt(suma)
 
#        df.plot(x='xx',y=df[suma], xlim=(0,300), ylim=(-10,80), ax=ax, xticks = np.arange(0,250,32), yticks = np.arange(-10,80,25), grid=True,legend=False,label='dly={}'.format(i), marker= 'o', markersize=4, markerfacecolor='black', markeredgecolor='black', lw=3)
 
        plt.plot(df['xx'], df[suma], '-o') 
        plt.xticks(np.arange(0,500,32))       
        plt.xlim(32*6, 300)
        plt.ylim(-10,80)
        
        plt.yticks(np.arange(-25,400,100))       
        plt.grid(True, linestyle='--', linewidth=1)
        
        maximo= df[suma].idxmax()
#        for i in range(224,274,10)
#            if maximo < i:
#               maximum= 'max{}'.format(int(i))   
#               maximums[maximum]   
           # else:
           #     max2.append(maximo)
          #      print(k, maximo)
     #   print(df[suma].idxmax())        
#plt.legend(loc='upper left', fontsize=10)
        
        std_3windows += np.std(df[suma][0:96])
        plt.title('dly = {}'.format(i), fontsize=14, color='b')
        maxList.append( df[suma].max())
       # df[i+k].plot( ax=ax, grid=True,legend=False,label='dly={} ns'.format(i), marker= 'o', markersize=1, markerfacecolor='black', markeredgecolor='black')
#        if i<13: 
#            ax.legend(loc = 'upper right', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
#        else:
#            ax.legend(loc = 'upper center', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
        for j in range(0,int(32*nmbrWindows*10),32):
            plt.axvline(j-1, color='k')
    std3windowsList.append(std_3windows/repeticiones)
    textstr = 'std3windows={:10.2f}'.format(std_3windows/repeticiones)
#    ax.text(0.05, 0.95, textstr, transform=ax.transAxes, fontsize=14,verticalalignment='top', bbox=props)
print('std3list={}'.format(np.asarray(std3windowsList).T))
fig.text(0.5, 0.04, 'Time [ns]', ha='center', fontsize=fontsizeAxis)
fig.text(0.08, 0.5, 'ADC counts', va='center', rotation='vertical', fontsize=fontsizeAxis)
#fig.text(.4, .95, 'Pedestal substracted data, same delay, 10 times', ha='center', fontsize=16)
# Option 2
# TkAgg backend
manager = plt.get_current_fig_manager()
manager.resize(*manager.window.maxsize())
np.savetxt(os.path.abspath('./data/max1.txt'), max1)
np.savetxt(os.path.abspath('./data/max2.txt'), max2)
#plt.rc('xtick', labelsize=18)
#plt.rc('ytick', labelsize=18)
#plt.figure()
#plt.hist(max1,10)
#plt.xlabel('Max position', fontsize=16)
#plt.title('max1')
#plt.yticks(np.arange(0,100,5))
#plt.figure()
#plt.hist(max2,10)
#plt.title('max2')
#plt.xlabel('Max position', fontsize=16)
plt.show() 


