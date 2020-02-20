from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
#import binary2text as b2t
import numpy as np
#from watchman_nogui import Watchman_main_window
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os
import targetc as targetc
import pandas as pd
from plot_delays_max import plot_pulse
tc = targetc.targetc()
fileToSave = './data/pulse_gen_test.txt'



regID=95;
TC_Delay_RB=3;
#tc.send_command(8, regID, TC_Delay_RB) # nmbrWindows
Windows512 =  tc.trigger_mode(2,15,fileToSave )

#raw_data=plot_pulse(fileToSave)
#print('raw_data', raw_data)
#    time.sleep(3)
#    time.sleep(1)
    #plt.close(1)


print("end")










