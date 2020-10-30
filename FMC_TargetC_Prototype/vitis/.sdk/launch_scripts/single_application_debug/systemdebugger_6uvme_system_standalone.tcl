connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS1 210205329388A" && level==0 && jtag_device_ctx=="jsn-JTAG-HS1-210205329388A-23727093-0"}
fpga -file /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/vitis/6UVME/_ide/bitstream/base_zynq_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/vitis/base_zynq_wrapper/export/base_zynq_wrapper/hw/base_zynq_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/vitis/6UVME/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/vitis/6UVME/Debug/6UVME.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
