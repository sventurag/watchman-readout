import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

fileName = '/home/idlab-52/salvador_fork/fix_WR_address/watchman-readout/GUI/data/test_notimingviolations_nodllEdge4.txt'
#vadjn = list(range(40,62,1))
vadjn = list(np.zeros(10))

df = pd.read_csv ( fileName, sep=" ", header=None, skiprows=1 )
sstoutfb = pd.read_csv ( fileName, sep=" ", header=None,nrows=1 )
print(df)
print(sstoutfb[0][0])
#print(len(sstoutfb[0]))
repeticiones=4

#print(pd.DataFrame(df, columns=[0,3]))
nmbrWindows = 12
fig= plt.figure(num=None, figsize=(8,6), dpi=80)
#fig(num=None, figsize=(8,6), dpi=80)
fig.subplots_adjust(hspace=0.7, wspace=0.4)
fontsizeAxis=16
std3windowsList = list()
for i in range(0,1,1):
    ax = fig.add_subplot(1,2,1+i)
    ax.set_ylabel('ADC counts', fontsize=fontsizeAxis)
    ax.set_xlabel('Time [ns]', fontsize=fontsizeAxis)
    ax.set_title('SSTOUTFB={}'.format(vadjn[i]))
    props = dict(boxstyle='round', facecolor='wheat', alpha=0.5) 
#plt.:figure()
    for k in range(0,repeticiones,1):
        std_3windows = 0
        suma=int(i*repeticiones+k)
   # print(suma)
        df[suma].plot(xlim=(0,200), ylim=(-10,80), ax=ax, xticks = np.arange(0,250,32), yticks = np.arange(-10,100,10), grid=True,legend=False,label='std 3 windows={:10.2f}'.format(std_3windows), marker= 'o', markersize=2, markerfacecolor='black', markeredgecolor='black')
        std_3windows += np.std(df[suma][0:96])
       # df[i+k].plot( ax=ax, grid=True,legend=False,label='dly={} ns'.format(i), marker= 'o', markersize=1, markerfacecolor='black', markeredgecolor='black')
#        if i<13: 
#            ax.legend(loc = 'upper right', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
#        else:
#            ax.legend(loc = 'upper center', markerscale=0,handletextpad=-2.0, handlelength=0,frameon=False )
        for j in range(0,int(32*nmbrWindows),32):
            plt.axvline(j, color='k')
    std3windowsList.append(std_3windows/repeticiones)
    textstr = 'std3windows={:10.2f}'.format(std_3windows/repeticiones)
    ax.text(0.05, 0.95, textstr, transform=ax.transAxes, fontsize=14,verticalalignment='top', bbox=props)
print('std3list={}'.format(np.asarray(std3windowsList).T))
#fig.text(0.5, 0.04, 'Time [ns]', ha='center', fontsize=16)
#fig.text(0.08, 0.5, 'ADC counts', va='center', rotation='vertical', fontsize=16)
fig.text(.4, .95, 'Pedestal substracted data, same delay, 10 times', ha='center', fontsize=16)
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
#plt.xlabel('VADJN value', fontsize=fontsizeAxis)
plt.show() 


