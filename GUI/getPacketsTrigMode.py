import subprocess
import time
from datetime import datetime
import sys
from pulse_analysis import *

def getPacketsTrigMode(nofPackets):
    func_name = "run_tcpdump_on_local_machine - "
    print(func_name + "start")
    interface_name = "enx0050b67c1322"
    portnmbr ="8"
    curr_time = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")
    capture_file_name = "/home/salvador/github/watchman-readout/GUI/traffic_" + curr_time + ".pcap"
    num_sec_to_sleep = 220*2
    print(func_name + "about to create capture with name:" + capture_file_name)
    p = subprocess.Popen(["tcpdump",
                          "-ni", interface_name,
                          "udp port ", portnmbr,
                          "-w", capture_file_name,
                          "-c", nofPackets],
                         stdout=subprocess.PIPE)
    time.sleep(20)
    p.terminate()
    print(func_name + "end")
    return capture_file_name




nofPackets=sys.argv[1]
totalWindows=int(sys.argv[2])
nofChannels=int(sys.argv[3])
# Get packets
#capture_file_name="/home/salvador/github/watchman-readout/GUI/traffic.pcap"

#sudo tcpdump -ni enx0050b67c1322  udp port 8  -w capture_file_name -c 1
capture_file_name =getPacketsTrigMode(nofPackets)
# When the transmission finish, process the packets

dfTarget0, dfTarget1=process_packet_pulseSweep(capture_file_name,totalWindows,nofChannels)
dfTarget0 = dfTarget0-195.

ax0=dfTarget0.plot()
#ax0.set_ylim(-10,150)
#ax0.set_xlim(127,(32*totalWindows)-1)
fig0 = ax0.get_figure()
fig0.savefig('Target0.png')

ax1=dfTarget1.plot()
fig1 = ax1.get_figure()
fig1.savefig('Target1.png')

