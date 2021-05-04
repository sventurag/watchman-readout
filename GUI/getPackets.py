import subprocess
import time
from datetime import datetime
import sys


def getPackets(nofPackets):
    func_name = "run_tcpdump_on_local_machine - "
    print(func_name + "start")
    interface_name = "enx0050b67c1322"
    portnmbr ="8"
    curr_time = datetime.now().strftime("%Y-%m-%d_%H:%M:%S")
    capture_file_name = "/home/salvador/salvador_fork/watchman-readout/GUI/traffic_" + curr_time + ".pcap"
    num_sec_to_sleep = 10
    print(func_name + "about to create capture with name:" + capture_file_name)
    p = subprocess.Popen(["tcpdump",
                          "-ni", interface_name,
                          "udp port ", portnmbr,
                          "-w", capture_file_name,
                          "-c", nofPackets],
                         stdout=subprocess.PIPE)
    time.sleep(num_sec_to_sleep)
    p.terminate()
    print(func_name + "end")

nofPackets=sys.argv[1]
getPackets(nofPackets)
