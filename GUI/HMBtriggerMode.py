import sys
from pulseGen import pulseGen

pg = pulseGen()


#def triggerMode():
##    wave_gen().bursSettings(nmbrBursts)
#    tc.send_command(3, 0, 0) # triggerMode 
#    time.sleep(1)
#    tc.send_command(11,0,0) #restartAll
#

print('send trigger mode command')
#channel=int(sys.argv[1])

#pg.channel(channel)

pg.triggerMode()


