import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

fileName = '/home/idlab-52/salvador_fork/fix_WR_address/watchman-readout/GUI/data/test_notimingviolations_dllON_SSTOUTFBsweep_3_100times_10_SSTOUT123.txt'
vadjn = list(range(2600,2700,5))
#vadjn = list(np.zeros(10))

df = pd.read_csv ( fileName, sep=" ", header=None, skiprows=1 )
Isstoutfb = pd.read_csv ( fileName, sep=" ", header=None,nrows=1 )
print(df)
#print(sstoutfb[0][0])
#print(len(sstoutfb[0]))
rango=2
repeticiones = 100
total= int(rango*repeticiones)

#print(pd.DataFrame(df, columns=[0,3]))
nmbrWindows = 8
fig= plt.figure(num=None, figsize=(8,6), dpi=80)
#fig(num=None, figsize=(8,6), dpi=80)
fig.subplots_adjust(hspace=1, wspace=0.4)
fontsizeAxis=28
std3windowsList = list()
maxList = list()

for i in range(0,rango,1):
    ax = fig.add_subplot(2,1,1+i)
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
   
        df[suma].plot(xlim=(140,210), ylim=(-10,80), ax=ax, xticks = np.arange(0,250,32), yticks = np.arange(-10,80,25), grid=True,legend=False,label='dly={}'.format(i), marker= 'o', markersize=4, markerfacecolor='black', markeredgecolor='black', lw=3)
        maximo= df[suma].idxmax()
     #   if maximo < 166+10*i:
    #        print(k, maximo)
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
        for j in range(0,int(32*nmbrWindows),32):
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
#plt.savefig('/home/idlab-52/salvador_fork/fix_WR_address/watchman-readout/GUI/data/vadjnBoundary2400_2500.png')

#std3windowsList2=[0.413991411612474, 0.39685722838600557, 0.4101521990540693, 0.4048694491232122, 0.3735562485534586, 0.3781752147557472, 0.3788689307223102, 0.311909163682135, 0.4099457958749615, 0.3628530369018412, 0.38294817607028186, 0.31390655677906587, 0.35116373990237404, 0.35910164724706506, 0.3461845606031557, 0.3390140934467999, 0.3543810625583709, 0.3854954874357589, 0.3638564181865638, 0.38586123009300743, 0.3380332721131983, 0.361654905722753, 0.39736545591628314, 0.3807658583550906, 0.34247237317612766, 0.39473531919784205, 0.39223695184019686, 0.39825465575851504, 0.420296687538167, 0.35668224265054493, 0.40271970366772747, 0.4028059137682399, 0.36834370271980127, 0.7115002732879931, 0.8625679321073789, 0.5276347576685978, 0.5359919088837899, 0.6976118737441966, 0.5753584329693003, 0.6203682542114267]

#vadjn2 = list(np.arange(2400,2600,5))
#plt.figure()
#plt.plot(vadjn2,std3windowsList2, '-o')
#plt.ylabel('std 3 first windows', fontsize=fontsizeAxis)
#plt.ylim(0.3,0.42)
#plt.xlabel('VADJN value', fontsize=fontsizeAxis)i


#dlyList = np.arange(0,30,1)
#plt.figure()
#plt.plot(dlyList,maxList, '-o', lw=3)
#plt.yticks(fontsize=18)
#plt.xticks(np.arange(0,30,1), fontsize=18)
#plt.title('Max(Pulse)')
#plt.xlabel('Delay', fontsize=fontsizeAxis)
#plt.ylabel('max(Pulse) [Counts]', fontsize=fontsizeAxis)
#plt.grid(True)
plt.show() 


