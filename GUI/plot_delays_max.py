
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import os
from scipy.optimize import curve_fit
from matplotlib import rc
#fileName = './data/raw_window_512.txt'

def plot_pulse(fileName, rango, repeticiones):
#vadjn = list(range(2600,2700,5))
#vadjn = list(np.zeros(10))

    #### Data parameters
  #  rango = 2  # number of steps in delay values for the waveform generator
  #  repeticiones =1 # Number of waveforms for the same delay value
    df = pd.read_csv ( fileName, sep=" ", header=None, skiprows=1 )
    sstoutfb = pd.read_csv ( fileName, sep=" ", header=None,nrows=1 )
    #print(df)
    
    total= int(rango*repeticiones)
    startWindow=0
    fontsizeAxis=28
    std3windowsList = list()
    maxList = list()
    maxPos = list()
    print(df)
    
    
    lblsize =16
    plt.rc('xtick', labelsize= lblsize)
    plt.rc('ytick', labelsize=lblsize)
    """
    ped_raw = df.iloc[:,0:48]
    ped= ped_raw.mean(axis=1)
    ped_subtracted = df[49]-ped
    #
    """
    maximums= pd.DataFrame()
    rows = 2
    
    df.plot(kind='line', subplots= True, layout= (5,rows), sharex=True, sharey=False, legend=False, marker='o' )
    
    plt.show()
