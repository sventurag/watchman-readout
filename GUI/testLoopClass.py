import numpy as np
import matplotlib.pyplot as plt
import os
import time
Windows512 = np.zeros((512*32))
Windows512_delays= list()

LE= 63
TE = int( (LE+1)/2)
step=15

strb2LE = list((range(1,LE,step)))
strb2TE = list((range(1,TE,step)))

wr2LE = list((range(1,LE,step)))
wr2TE = list((range(1,TE,step)))

strb1LE = list((range(1,LE,step)))
strb1TE = list((range(1,TE,step)))

wr1LE = list((range(1,LE,step)))
wr1TE = list((range(1,TE,step)))


Windows512 = Windows512*0

for i in strb2LE:
    if i > 1:
        np.savetxt(os.path.abspath('./data/bruteForcelast{}_{}_{}_{}.txt'.format(i,j,k,l)), np.array(Windows512_delays).T)
        time.sleep(1)
        Windows512 = Windows512*0
    for j in strb2TE:
       for k in wr2LE:
           for l in wr2TE:
#               for m in strb1LE:
#                   for n in strb1TE:
#                       for o in wr1LE:
#                           for p in wr1TE:
                Windows512 = np.zeros((512*32))+1
                if np.max(Windows512)< 200:
                    Windows512_delays.append(Windows512)
       #             Windows512_delays.append([i,j,k,l])#,m,n,o,p)
                    #print(i,j,k)#l)#,m,n,o,p)
                                
                        
np.savetxt(os.path.abspath('./data/bruteForceLast.txt'), np.array(Windows512_delays).T)

