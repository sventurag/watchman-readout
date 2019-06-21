import numpy as np
import matplotlib.pyplot as plt
from operator import itemgetter

plt.rcParams.update({'font.size': 16})



TARGETX = [51,7,56,12,33,53,20,40,5,25]
TARGETC = [51,7,25,35,5,15,57,3,37,47]
Adrian = [46,61,61,7,55,6,25,10,55,6]
Rigth = [51,7,3,12,5,25,20,40,33,53]

print (list(range(0,len(TARGETX))))
print (range(0,len(TARGETX)))
print ([i for i in TARGETX])

#sspinLE, sspinTE, wrstrb2LE, wrstrb2TE, wr2addrLE, wr2addrTE, wrstrb1TE, wrstrb1LE, wr1addrTE, wr1addrTE =  [TARGETX[i] for i in range(0,len( TARGETX),1)]

parameters = ['sspinLE', 'sspinTE', 'wrstrb2LE', 'wrstrb2TE', 'wr2addrLE', 'wr2addrTE', 'wrstrb1LE', 'wrstrb1TE', 'wr1addrLE', 'wr1addrTE']

TARGETXdic = dict(zip(parameters,TARGETX)) 
TARGETCdic = dict(zip(parameters,TARGETC)) 
Adriandic = dict(zip(parameters,Adrian)) 
Rigthdic = dict(zip(parameters,Rigth)) 

print(TARGETXdic)
print(TARGETCdic)
print(Adriandic)
print(Rigthdic)

print(TARGETXdic['sspinLE'])

numbCycles = 128

x = list(range(0,numbCycles))

SSTIN= np.zeros(numbCycles)

for i in range(len(SSTIN)):
    if i < 32: 
        SSTIN[i]=1
    elif i>64 and i<96:
        SSTIN[i]=1  

def strobeplot(lenArr,LE,TE):
    arr = np.zeros(lenArr)
    for i in range(0,lenArr,1):
        if i in range(LE, LE+TE):
            arr[i]= 1
        else:
            arr[i]=0
    return arr

y = strobeplot(64,TARGETXdic['sspinLE'],TARGETXdic['sspinTE'])

print(y)
print (SSTIN)
print(TARGETXdic[parameters[2]])

fig,axs= plt.subplots(6)

parameters2 = ['sspin', 'wrstrb2', 'wr2addr', 'wrstrb1', 'wr1addr' ]


axs[0].step(x, SSTIN, linewidth=2)
axs[0].set_ylim(-2,2)
axs[0].set_ylabel('{}'.format('sstin'))
axs[0].set_xlim(0,128)
for i in range(2,7,1):
    axs[i-1].step(x,strobeplot(numbCycles,TARGETXdic[parameters[(i-2)*2]],TARGETXdic[parameters[(2*i)-3]]), label= 'TARGETX', linewidth=2)
   # print(Adriandic[parameters[(i-2)*2]], Adriandic[parameters[(2*i)-3]])
#    axs[i-1].step(x,strobeplot(numbCycles,TARGETCdic[parameters[(i-2)*2]],TARGETCdic[parameters[(2*i)-3]]), label='TARGETC', linewidth=2)
    axs[i-1].step(x,strobeplot(numbCycles,Adriandic[parameters[(i-2)*2]],Adriandic[parameters[(2*i)-3]]), label= 'Adrian',linewidth=2)
    axs[i-1].step(x,strobeplot(numbCycles,Rigthdic[parameters[(i-2)*2]],Rigthdic[parameters[(2*i)-3]]), label= 'Rigth order',linewidth=2)
    axs[i-1].set_ylim(-1,2)    
    axs[i-1].set_xlim(0,numbCycles)    
    axs[i-1].set_ylabel('{}'.format(parameters2[i-2]))    
    axs[1].legend(loc='upper right')


plt.show()


