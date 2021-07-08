import subprocess
import time
from datetime import datetime
import sys
from pulse_analysis import *

def getPackets(nofPackets, pedestalsON):
    func_name = "run_tcpdump_on_local_machine - "
    print(func_name + "start")
    interface_name = "enx0050b67c1322"
    portnmbr ="8"
    curr_time = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")
    capture_file_name = "/home/salvador/github/watchman-readout/GUI/traffic_" + curr_time + ".pcap"
    num_sec_to_sleep = 30
    print(func_name + "about to create capture with name:" + capture_file_name)
    p = subprocess.Popen(["tcpdump",
                          "-ni", interface_name,
                          "udp port ", portnmbr,
                          "-w", capture_file_name,
                          "-c", nofPackets],
                         stdout=subprocess.PIPE)
    if (pedestalsON==1):
        time.sleep(num_sec_to_sleep)
    else:
        time.sleep(5)
    p.terminate()
    print(func_name + "end")
    return capture_file_name





nofPackets=sys.argv[1]
totalWindows=int(sys.argv[2])
nofChannels=int(sys.argv[3])
pedestalsON=int(sys.argv[4])
# Get packets
capture_file_name =getPackets(nofPackets, pedestalsON)

# When the transmission finish, process the packets

dfTarget0, dfTarget1=process_packet_pulseSweep(capture_file_name,totalWindows,nofChannels)
dfTarget0 = dfTarget0-200.

ax0=dfTarget0.plot()
ax0.set_ylim(-20,20)
#ax0.set_xlim(127,(32*totalWindows)-1)
fig0 = ax0.get_figure()
fig0.savefig('Target0.png')

ax1=dfTarget1.plot()
fig1 = ax1.get_figure()
fig1.savefig('Target1.png')

