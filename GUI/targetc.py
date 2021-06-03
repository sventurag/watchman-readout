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
from tempfile import TemporaryFile
#from plotPulse import plot_pulse
class targetc():

    def __init__(self):

        self.UDP_IP = '192.168.1.10'
##     Contain the port number for UDP communication
        self.UDP_PORT = 7
        self.UDP_PORT_data = 8
        self.UDP_PORT_trigger= 9

        self.init_UDP_connection_cmd()
        #self.init_UDP_connection_trigger_mode()
        self.flag_data = []
##     Contain the zynq's ip
##     List of all the commands
##     Flag which indicates if the streaming is running
        self.flag_transfer_done = False
        self.cmd = ['write_all_reg', 'read_all_reg', 'ping', 'trigger_mode', 'stop_uC', 'settime', 'recover_data', 'get_windows','write_register','pedestal', 'pedestalTriggerMode', 'restartAll', 'flat_pedestal', 'dividePedestals']
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
        self.thread_cmd=Thread(target=self.thread_cmd_int, args=())
        self.thread_cmd.daemon=True
        self.run_flag = True
        self.thread_cmd.start()

       ## Socket object used to established the UDP connection with the zynq
    def init_UDP_connection_data(self):
   # global sock_dat
        self.sock_data = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock_data.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 2097152) # change the size of the socket buffer
        self.sock_data.bind(('', self.UDP_PORT_data))
        self.sock_data.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received
       # return sock_data

        ## Socket object used to established the UDP connection with the zynq
    
    def close_UDP_connection_data(self):
            #self.sock_data.shutdown(socket.SHUT_RDWR)
        self.sock_data.close()

    def init_UDP_connection_cmd(self):
        #global sock
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(('', self.UDP_PORT))
        print('socket initialized, Port:',self.UDP_PORT) 
        self.sock.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received
            #return sock
    
            ## Socket object used to established the UDP connection with the zynq
    
    def close_UDP_connection_cmd(self):
        #self.sock.shutdown(socket.SHUT_RDWR)
        self.sock.close()
        sys.exit()
       
   
    
    def send_command(self,comando,param1,param2):
       #print("received command {}".format(self.cmd[comando]))
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
    #         #  print(int(n
       if(self.cmd[comando] == 'restartAll'): # restart main()
          payload.append(int("0x33", 0)) # frame's end code 0x33CC
          payload.append(int("0xCC", 0))
       if(self.cmd[comando] == 'trigger_mode'): # restart main() 
          #self.init_UDP_connection_trigger_mode()
          payload.append(int("0x33", 0)) # frame's end code 0x33CC
          payload.append(int("0xCC", 0))
#          self.init_UDP_connection_data()
#          self.thread_trigger_obj=Thread(target=self.thread_trigger, args=())
#          self.thread_trigger_obj.start()
          self.get_windows_flag = True

          payload.append(int("0x33", 0)) # frame's end code 0x33CC
          payload.append(int("0xCC", 0))
 #         print("stream command sent")
       if(self.cmd[comando] == 'write_register'): # if the command is write register, add the register's value
                                                
           payload.append(param1) # regID
           payload.append(int(param2 / 256)) # regValue
           payload.append(int(param2 % 256))
           payload.append(int("0x33", 0)) # frame's end code 0x33CC
           payload.append(int("0xCC", 0))
       if(self.cmd[comando] == 'pedestal'): # if the command is write register, add the register's value
                                                
           payload.append(param1) # pedestal Voltage not tested yet 06/19/2019
           payload.append(param2) # number of windows
           payload.append(int("0x33", 0)) # frame's end code 0x33CC
           payload.append(int("0xCC", 0))

       if(self.cmd[comando] == 'pedestalTriggerMode'): # start pedestals in trigger mode, the trigger mode should started a priori
                                                
           payload.append(param1) # NOT USED
           payload.append(int(param2 / 256)) # number of Pedestal average
           payload.append(int(param2 % 256))
           payload.append(int("0x33", 0)) # frame's end code 0x33CC
           payload.append(int("0xCC", 0))
      
       if(self.cmd[comando] == 'flat_pedestal'): # start pedestals in trigger mode, the trigger mode should started a priori
                                                
           payload.append(param1) # NOT USED
           payload.append(int(param2 / 256)) # number of Pedestal average
           payload.append(int(param2 % 256))
           payload.append(int("0x33", 0)) # frame's end code 0x33CC
           payload.append(int("0xCC", 0))
      
       if(self.cmd[comando] == 'dividePedestals'):
           payload.append(int("0x33", 0)) # frame's end code 0x33CC
           payload.append(int("0xCC", 0))


       if(self.cmd[comando] == 'get_windows'):
          print('Sending get_windows command')

   #       payload.append(param1)
   #       payload.append(int(param2 / 256)) 
   #       payload.append(int(param2 % 256))
          payload.append(int("0x33", 0)) # frame's end code 0x33CC
          payload.append(int("0xCC", 0))
       self.sock.sendto(payload, (self.UDP_IP, self.UDP_PORT)) 


    ## Method thread to process the command received by UDP (running all the time)
    # @param : The object pointer
    def thread_cmd_int(self):
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
            except socket.timeout:
                time.sleep(0.1)
            # socket exception: problem during execution of socket.recvfrom
            except socket.error:
                dummy = 0 # dummy execution to catch the exception
    
    
    
