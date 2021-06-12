import subprocess
import time
from datetime import datetime
import sys
from pulse_analysis import *

capture_file_name=sys.argv[1]
totalWindows=sys.argv[2]
nofChannels=1
# Get packets
time.sleep(5)
#sudo tcpdump -ni enx0050b67c1322  udp port 8  -w capture_file_name -c 1
#capture_file_name =getPacketsTrigMode(nofPackets)
# When the transmission finish, process the packets

dfTarget0, dfTarget1=process_packet_pulseSweep(capture_file_name,totalWindows,nofChannels)
