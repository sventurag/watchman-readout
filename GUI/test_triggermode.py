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

tc = targetc.targetc()

#for i in range(10):
#    tc.send_command(3,0,0) # start TriggerMode
#    time.sleep(3)
#    print(i)
tc.send_command(3,0,0) # start TriggerMode

print("the end")
