from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
import binary2text as b2t
import numpy as np
#from watchman_nogui import Watchman_main_window
import matplotlib.pyplot as plt
import waveform_gen_33600 as wv_gen
from waveform_gen_33600 import wave_gen
import os


class targetc():

    def __init__(self):
    
        self.UDP_IP = '192.168.1.10'
    ## Contain the port number for UDP communication
        self.UDP_PORT = 7
        self.UDP_PORT_data = 8
    
        self.init_UDP_connection_cmd()
        self.flag_data = []
    ## Contain the zynq's ip
    ## List of all the commands
        self.cmd = ['write_all_reg', 'read_all_reg', 'ping', 'start_stop_stream', 'stop_uC', 'settime', 'recover_data', 'get_windows','write_register','pedestal', 'restartUDP', 'restartAll']
    ## Flag which indicates if the streaming is running
        self.stream_flag = False
        ## Flag which indicates that the user want to close the GUI (to avoid problem when accessing graphical object after "WM_DELETE_WINDOW" event)
        self.destroy_flag = False 
        ## Flag which indicates if the graphical window is open or not
        self.toplevel_flag = False
        ## Flag which indicates to the main thread if it needs to stop
        #self.run_flag = False
        self.timer_thread_flag = False
        self.recover_data_flag = False
        self.timer_thread_flag_2 = False
        self.get_windows_flag = False
        self.thread_cmd=Thread(target=thread_cmd_int, args=())
        self.run_flag = True
        self.thread_cmd.start()
    
       ## Socket object used to established the UDP connection with the zynq
    def init_UDP_connection_data(self):
       # global sock_data
        self.sock_data = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock_data.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 2097152) # change the size of the socket buffer
        self.sock_data.bind(('', UDP_PORT_data))
        self.sock_data.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received
       # return sock_data
    
        ## Socket object used to established the UDP connection with the zynq
    
    def close_UDP_connection_data(self):
        #self.sock_data.shutdown(socket.SHUT_RDWR)
        self.sock_data.close()
    
    def init_UDP_connection_cmd():
        #global sock
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(('', UDP_PORT))
        print('socket initialized, Port:',UDP_PORT) 
        self.sock.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received
        #return sock
    
        ## Socket object used to established the UDP connection with the zynq
    
    def close_UDP_connection_cmd():
        #self.sock_data.shutdown(socket.SHUT_RDWR)
        self.sock.close()
    
    def send_command(comando,param1,param2):
       # Build the frame
       payload = bytearray()
       payload.append(int("0x55", 0)) # frame's start code 0x55AA
       payload.append(int("0xAA", 0))
       payload.append(comando)  # then then command ID
       payload.append(random.randrange(0,255)) # then a random number to put an "id" on every frame
    
    #   if(cmd[comando] == 'write_all_reg'): # if the command is write register, add the register's value
    #       for reg in regs:
    #           numb = int(reg.get())
    #           payload.append(int(numb / 256))
    #           payload.append(int(numb % 256))
    #         #  print(int(numb / 256))
    #         #  print(int(numb % 256))

       if(self.cmd[comando] == 'restartAll'): # restart main()
           dummy = param1 
            
       if(self.cmd[comando] == 'write_register'): # if the command is write register, add the register's value
                                                
           payload.append(param1) # regID
          # payload.append(regValue)
           payload.append(int(param2 / 256)) # regValue
           payload.append(int(param2 % 256))
    #payload.append(0)
       if(self.cmd[comando] == 'pedestal'): # if the command is write register, add the register's value
                                                
           payload.append(param1) # pedestal Voltage not tested yet 06/19/2019
           payload.append(param2) # number of windows
           #payload.append(0)
       if(self.cmd[comando] == 'settime'): # if the command is set the time, add the time
           t = time.localtime() # Get the the UTC time with the time zone correction
           payload.append(t.tm_year - 2000)
           payload.append(t.tm_mon)
           payload.append(t.tm_mday)
           payload.append(t.tm_hour)
           payload.append(t.tm_min)
           payload.append(t.tm_sec)
       payload.append(int("0x33", 0)) # frame's end code 0x33CC
       payload.append(int("0xCC", 0))
        # show in the listbox the command to be send and send it
       
       if(self.cmd[comando] == 'get_windows'):
          self.init_UDP_connection_data()
          self.thread_data_2=Thread(target=thread_data_int_2, args=())
          #thread_timer_2=Timer(10,thread_timer_int_2)
          self.thread_data_2.start()
          self.get_windows_flag = True
      # print("Tx: " + cmd[comando] + " rand=" + str(payload[3])) 
       self.sock.sendto(payload, (UDP_IP,UDP_PORT)) 
       #print(payload)
      
    
    def thread_data_int_2():  
        #global windowsData
        flag_tmp = True
        self.timer_thread_flag_2 = False
        file_name = "15windows.bin"
        file_data = open(file_name, "wb")
        maxWindows = self.nmbrWindows
        cnt_15_windows = 0
        while(cnt_15_windows < maxWindows):
            try:
                data = bytearray()
                data, adress = sock_data.recvfrom(1030) # wait on data
                # process the data received
                if(adress[0] == self.UDP_IP): # test the emitter's ip
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))): # for every command look for start code
                        if((data[1028] == int("0x33", 0)) and (data[1029] == int("0xCC", 0))):
                            cnt_15_windows += 1
                            file_data.write(data)
                        else:
                            # error: no end code
                            print("Rx: ERROR end of data")
                            cnt_15_windows = maxWindows
                            flag_tmp = False
                    else:
                        # error: no start code
                        print("Rx: ERROR start of data")
                        cnt_15_windows = maxWindows
                        flag_tmp = False
                else:
                    # error: wrong emitter's ip
                    print("Rx: ERROR ip of data")
                    cnt_15_windows = maxWindows
                    flag_tmp = False
            # socket exception: no data for received before timeout
            except socket.timeout:
                time.sleep(0.1)
            # socket exception: problem during execution of socket.recvfrom
            except socket.error:
                dummy = 0 # dummy execution to catch the exception
        file_data.close()
        windowsData_init = b2t.binary2text('15windows.bin')
        self.windowsData = windowsData_init.savetxt()
       # print(windowsData[:,2][0:3])
        #print('WRITING DATA TXT')
        close_UDP_connection_data()
    #    if(flag_tmp and (timer_thread_flag_2 == True)):
            #print("Get 15 windows: passed!")
    #        print("Get 15 windows: passed!")
    #    else:
    #        print("Get 15 windows: failed!")
    #    print("end of windows data thread", file=sys.stderr)
        
    
    ## Method thread to process the command received by UDP (running all the time)
    # @param : The object pointer
    def thread_cmd_int():
        while self.run_flag: # running flag
            try:
                data = bytearray()
                data, adress = self.sock.recvfrom(2*128+20) # wait on data
                # process the data received (echo command)
                if(adress[0] == self.UDP_IP): # test the emitter's ip
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))): # for every command look for start code
                        offset = 0
                        # stop/start command
                        if(self.cmd[data[2]] == 'start_stop_stream'):  
                            if(self.stream_flag): # stop streaming
                                if(self.destroy_flag == False):
                                    if(self.toplevel_flag): # if the 2nd window is open, print number of data received and lost
                                        print("total of frame received =" + str(window_data.count))
                                        print("LostCnt:"+str(window_data.lostcnt))
                                self.stream_flag = False
                            else: # start streaming
                                if(self.destroy_flag == False):
                                    if(self.toplevel_flag): # if the 2nd window is open, reset number of data received and lost
                                        window_data.count = 0
                                        window_data.lostcnt = 0
                                self.stream_flag = True
                        # stop uC command
                        if(self.cmd[data[2]] == 'stop_uC'):
                            self.stream_flag = False
                        # read all registers command
                        if(self.cmd[data[2]] == 'read_all_reg'): # adapt index to find the frame's end code
                            offset = 128*2
                        # for every command look for the end code
                        if((data[4+offset] == int("0x33", 0)) and (data[5+offset] == int("0xCC", 0))):
       #                     if(destroy_flag == False):
       #                         print("Rx: " + cmd[data[2]] + " rand=" + str(data[3]))
                                if(offset == 128*2): # in case of read all register command
                                    count = 4
                                    for reg in regs: # update the value registers value
                                        reg.delete(0,END)
                                        reg.insert(END, str(data[count]*256 + data[count+1]))
                                        count += 2
                        else:
                            # error: no end code
                            if(self.destroy_flag == False): 
                                print("Rx: ERROR end of frame")
                    else:
                        # error: no start code
                        if(self.destroy_flag == False):
                            print("Rx: ERROR start of frame")
                else:
                    # error: wrong emitter's ip
                    if(self.destroy_flag == False):
                        print("Rx: ERROR ip of frame (" + adress[0] + ")")
            # socket exception: no data for received before timeout
            except self.socket.timeout:
                time.sleep(0.1)
            # socket exception: problem during execution of socket.recvfrom
            except self.socket.error:
                dummy = 0 # dummy execution to catch the exception
            #time.sleep(0.5)
       # print("end of command thread", file=sys.stderr)
    
    
    
    
    def get_512_windows(nWindows):
        self.nmbrWindows = nWindows 
        regID = 151
        regValue = 0
        self.send_command(8,regID,regValue) # first window
        time.sleep(1)
        
        regID = 152
        regValue = nmbrWindows
        self.send_command(8, regID, regValue)
        time.sleep(1)
        regID = 151    
        
        WindowsData = list()
        regValue=0
        for j in range(0,4,self.nmbrWindows):#change to 511 for the whole ASIC buffer # change t0 28 for 25 windowsi # last test 12
            WindowsData_toSave= np.zeros((32*self.nmbrWindows))
            # for i in range(0,nmbrAvg,1):
            regValue= j
           # print (regValue)
            self.send_command(8,regID,regValue) # change the start window
            time.sleep(.5)
            self.send_command(7,0,0) # get windows
            time.sleep(.5) #.5
           # print(windowsData[:,2][0:5])
            WindowsData_toSave = self.windowsData[:,2]
            #print('WindowsData_toSave[0:3]:',WindowsData_toSave[0:3]) 
            WindowsData.append(WindowsData_toSave) 
            #print(type(WindowsData))
            windowsData= windowsData*0
        #print(avgWindowsData[0:5])
        flatWindowsData = [item for sublist in WindowsData for item in sublist   ]
        windowsData= windowsData*0
    #    np.savetxt('/home/idlab-52/data/avg255.txt', np.array(flatWindowsData).T)
        return flatWindowsData 
    
    #############################################
    

    
    
#    wave_gen().Output1(out=False)
#    nmbrWindows = 4
#    send_command(9,1,nmbrWindows)
#    time.sleep(5)
#    
#    regValue= 0 #
#    regID = 93 
#    send_command(8,regID,regValue) # delay from rising edge WR update
#    time.sleep(1)
#    
#    wave_gen().Output1(out=True)
#    
#    Windows512 = np.zeros((512*32))
#    Windows512_delays= list()
#    
#    delays = list((range(0,1,1)))
#    #delays = list((range(1)))
#    
#    #Windows512_delays.append(delays)
#    
#    for i in delays:
#       wave_gen().trigDelay(i*1*.000000001)
#       time.sleep(2)
#       Windows512 = get_512_windows(nmbrWindows)      
#       Windows512_delays.append(Windows512)
#       time.sleep(1)
#    
#    
#    np.savetxt(os.path.abspath('./data/STRB1_2_ADCB_1windows_50_30WR1.txt'), np.array(Windows512_delays).T)
#    wave_gen().Output1(out=False)
#    
#    #regValue= 8 #  is  8 ns befor rising
#    #regID = 151
#    #nmbrWindows = 4
#    #send_command(8)
#    #time.sleep(1)
#    #send_command(7)
#    
#    close_UDP_connection_cmd()
#    
