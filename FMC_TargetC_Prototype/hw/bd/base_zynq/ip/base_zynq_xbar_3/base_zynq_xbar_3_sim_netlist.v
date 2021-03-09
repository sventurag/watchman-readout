// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Feb 26 15:27:40 2021
// Host        : watchman running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/salvador/salvador_fork/watchman-readout/FMC_TargetC_Prototype/hw/bd/base_zynq/ip/base_zynq_xbar_3/base_zynq_xbar_3_sim_netlist.v
// Design      : base_zynq_xbar_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "base_zynq_xbar_3,axis_switch_v1_1_21_axis_switch,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_switch_v1_1_21_axis_switch,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module base_zynq_xbar_3
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    s_axis_tid,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    m_axis_tid,
    s_req_suppress,
    s_decode_err);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, FREQ_HZ 1.25e+08, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF M00_AXIS:M01_AXIS:M02_AXIS:M03_AXIS:M04_AXIS:M05_AXIS:M06_AXIS:M07_AXIS:M08_AXIS:M09_AXIS:M10_AXIS:M11_AXIS:M12_AXIS:M13_AXIS:M14_AXIS:M15_AXIS:S00_AXIS:S01_AXIS:S02_AXIS:S03_AXIS:S04_AXIS:S05_AXIS:S06_AXIS:S07_AXIS:S08_AXIS:S09_AXIS:S10_AXIS:S11_AXIS:S12_AXIS:S13_AXIS:S14_AXIS:S15_AXIS, ASSOCIATED_RESET aresetn, INSERT_VIP 0, ASSOCIATED_CLKEN aclken" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TVALID [0:0] [1:1]" *) input [1:0]s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TREADY [0:0] [1:1]" *) output [1:0]s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA [31:0] [31:0], xilinx.com:interface:axis:1.0 S01_AXIS TDATA [31:0] [63:32]" *) input [63:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB [3:0] [3:0], xilinx.com:interface:axis:1.0 S01_AXIS TSTRB [3:0] [7:4]" *) input [7:0]s_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST [0:0] [0:0], xilinx.com:interface:axis:1.0 S01_AXIS TLAST [0:0] [1:1]" *) input [1:0]s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TID [1:0] [1:0], xilinx.com:interface:axis:1.0 S01_AXIS TID [1:0] [3:2]" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 2, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1.25e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0, XIL_INTERFACENAME S01_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 2, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1.25e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [3:0]s_axis_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) output [0:0]m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) input [0:0]m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [31:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB" *) output [3:0]m_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) output [0:0]m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 2, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 1.25e+08, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [1:0]m_axis_tid;
  input [1:0]s_req_suppress;
  output [1:0]s_decode_err;

  wire aclk;
  wire aresetn;
  wire [31:0]m_axis_tdata;
  wire [1:0]m_axis_tid;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire [63:0]s_axis_tdata;
  wire [3:0]s_axis_tid;
  wire [1:0]s_axis_tlast;
  wire [1:0]s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [1:0]s_axis_tvalid;
  wire [1:0]s_decode_err;
  wire [1:0]s_req_suppress;
  wire NLW_inst_s_axi_ctrl_arready_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_awready_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED;
  wire NLW_inst_s_axi_ctrl_wready_UNCONNECTED;
  wire [1:0]NLW_inst_arb_dest_UNCONNECTED;
  wire [0:0]NLW_inst_arb_done_UNCONNECTED;
  wire [3:0]NLW_inst_arb_id_UNCONNECTED;
  wire [1:0]NLW_inst_arb_last_UNCONNECTED;
  wire [1:0]NLW_inst_arb_req_UNCONNECTED;
  wire [1:0]NLW_inst_arb_user_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [3:0]NLW_inst_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tuser_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_ctrl_bresp_UNCONNECTED;
  wire [31:0]NLW_inst_s_axi_ctrl_rdata_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_ctrl_rresp_UNCONNECTED;

  (* C_ARB_ALGORITHM = "1" *) 
  (* C_ARB_ON_MAX_XFERS = "1" *) 
  (* C_ARB_ON_NUM_CYCLES = "0" *) 
  (* C_ARB_ON_TLAST = "0" *) 
  (* C_AXIS_SIGNAL_SET = "55" *) 
  (* C_AXIS_TDATA_WIDTH = "32" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "2" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_DECODER_REG = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_INCLUDE_ARBITER = "1" *) 
  (* C_LOG_SI_SLOTS = "1" *) 
  (* C_M_AXIS_BASETDEST_ARRAY = "1'b0" *) 
  (* C_M_AXIS_CONNECTIVITY_ARRAY = "2'b11" *) 
  (* C_M_AXIS_HIGHTDEST_ARRAY = "1'b0" *) 
  (* C_NUM_MI_SLOTS = "1" *) 
  (* C_NUM_SI_SLOTS = "2" *) 
  (* C_OUTPUT_REG = "0" *) 
  (* C_ROUTING_MODE = "0" *) 
  (* C_S_AXI_CTRL_ADDR_WIDTH = "7" *) 
  (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* LP_CTRL_REG_WIDTH = "15" *) 
  (* LP_MERGEDOWN_MUX = "0" *) 
  (* LP_NUM_SYNCHRONIZER_STAGES = "4" *) 
  (* P_DECODER_CONNECTIVITY_ARRAY = "2'b11" *) 
  (* P_SINGLE_SLAVE_CONNECTIVITY_ARRAY = "1'b0" *) 
  (* P_TPAYLOAD_WIDTH = "39" *) 
  base_zynq_xbar_3_axis_switch_v1_1_21_axis_switch inst
       (.aclk(aclk),
        .aclken(1'b1),
        .arb_dest(NLW_inst_arb_dest_UNCONNECTED[1:0]),
        .arb_done(NLW_inst_arb_done_UNCONNECTED[0]),
        .arb_gnt({1'b0,1'b0}),
        .arb_id(NLW_inst_arb_id_UNCONNECTED[3:0]),
        .arb_last(NLW_inst_arb_last_UNCONNECTED[1:0]),
        .arb_req(NLW_inst_arb_req_UNCONNECTED[1:0]),
        .arb_sel(1'b0),
        .arb_user(NLW_inst_arb_user_UNCONNECTED[1:0]),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(m_axis_tid),
        .m_axis_tkeep(NLW_inst_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tuser(NLW_inst_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axi_ctrl_aclk(1'b0),
        .s_axi_ctrl_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_aresetn(1'b0),
        .s_axi_ctrl_arready(NLW_inst_s_axi_ctrl_arready_UNCONNECTED),
        .s_axi_ctrl_arvalid(1'b0),
        .s_axi_ctrl_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_awready(NLW_inst_s_axi_ctrl_awready_UNCONNECTED),
        .s_axi_ctrl_awvalid(1'b0),
        .s_axi_ctrl_bready(1'b0),
        .s_axi_ctrl_bresp(NLW_inst_s_axi_ctrl_bresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_bvalid(NLW_inst_s_axi_ctrl_bvalid_UNCONNECTED),
        .s_axi_ctrl_rdata(NLW_inst_s_axi_ctrl_rdata_UNCONNECTED[31:0]),
        .s_axi_ctrl_rready(1'b0),
        .s_axi_ctrl_rresp(NLW_inst_s_axi_ctrl_rresp_UNCONNECTED[1:0]),
        .s_axi_ctrl_rvalid(NLW_inst_s_axi_ctrl_rvalid_UNCONNECTED),
        .s_axi_ctrl_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_ctrl_wready(NLW_inst_s_axi_ctrl_wready_UNCONNECTED),
        .s_axi_ctrl_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest({1'b0,1'b0}),
        .s_axis_tid(s_axis_tid),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tuser({1'b0,1'b0}),
        .s_axis_tvalid(s_axis_tvalid),
        .s_decode_err(s_decode_err),
        .s_req_suppress(s_req_suppress));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_arb_rr" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_arb_rr
   (\arb_sel_r_reg[0]_0 ,
    s_axis_tvalid_1_sp_1,
    \gen_tdest_routing.busy_ns ,
    \arb_gnt_r_reg[0]_0 ,
    \gen_tdest_routing.busy_ns_0 ,
    \arb_gnt_r_reg[1]_0 ,
    s_axis_tready,
    m_axis_tid,
    m_axis_tlast,
    m_axis_tstrb,
    m_axis_tdata,
    \arb_sel_r_reg[0]_1 ,
    aclken,
    aclk,
    arb_busy_r_reg_0,
    \gen_tdest_routing.busy_r_reg[0] ,
    \gen_tdest_router.busy_r ,
    \gen_tdest_routing.busy_r_reg[0]_0 ,
    s_axis_tvalid,
    m_axis_tready,
    s_req_suppress,
    s_axis_tid,
    s_axis_tlast,
    s_axis_tstrb,
    s_axis_tdata,
    \arb_sel_r_reg[0]_2 ,
    \arb_sel_r_reg[0]_3 );
  output \arb_sel_r_reg[0]_0 ;
  output s_axis_tvalid_1_sp_1;
  output \gen_tdest_routing.busy_ns ;
  output \arb_gnt_r_reg[0]_0 ;
  output \gen_tdest_routing.busy_ns_0 ;
  output \arb_gnt_r_reg[1]_0 ;
  output [1:0]s_axis_tready;
  output [1:0]m_axis_tid;
  output [0:0]m_axis_tlast;
  output [3:0]m_axis_tstrb;
  output [31:0]m_axis_tdata;
  input \arb_sel_r_reg[0]_1 ;
  input aclken;
  input aclk;
  input arb_busy_r_reg_0;
  input \gen_tdest_routing.busy_r_reg[0] ;
  input [1:0]\gen_tdest_router.busy_r ;
  input \gen_tdest_routing.busy_r_reg[0]_0 ;
  input [1:0]s_axis_tvalid;
  input [0:0]m_axis_tready;
  input [0:0]s_req_suppress;
  input [3:0]s_axis_tid;
  input [1:0]s_axis_tlast;
  input [7:0]s_axis_tstrb;
  input [63:0]s_axis_tdata;
  input \arb_sel_r_reg[0]_2 ;
  input \arb_sel_r_reg[0]_3 ;

  wire aclk;
  wire aclken;
  wire arb_busy_ns;
  wire arb_busy_r;
  wire arb_busy_r_i_3_n_0;
  wire arb_busy_r_i_5_n_0;
  wire arb_busy_r_reg_0;
  wire \arb_gnt_r[0]_i_1_n_0 ;
  wire \arb_gnt_r[0]_i_2_n_0 ;
  wire \arb_gnt_r[1]_i_1_n_0 ;
  wire \arb_gnt_r[1]_i_2_n_0 ;
  wire \arb_gnt_r_reg[0]_0 ;
  wire \arb_gnt_r_reg[1]_0 ;
  wire \arb_sel_r[0]_i_1_n_0 ;
  wire \arb_sel_r_reg[0]_0 ;
  wire \arb_sel_r_reg[0]_1 ;
  wire \arb_sel_r_reg[0]_2 ;
  wire \arb_sel_r_reg[0]_3 ;
  wire [1:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_tdest_routing.busy_r[0]_i_2_n_0 ;
  wire \gen_tdest_routing.busy_r_reg[0] ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;
  wire [31:0]m_axis_tdata;
  wire [1:0]m_axis_tid;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire [63:0]s_axis_tdata;
  wire [3:0]s_axis_tid;
  wire [1:0]s_axis_tlast;
  wire [1:0]s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [1:0]s_axis_tvalid;
  wire s_axis_tvalid_1_sn_1;
  wire [0:0]s_req_suppress;

  assign s_axis_tvalid_1_sp_1 = s_axis_tvalid_1_sn_1;
  LUT4 #(
    .INIT(16'h4FFF)) 
    arb_busy_r_i_1
       (.I0(s_axis_tvalid_1_sn_1),
        .I1(arb_busy_r),
        .I2(arb_busy_r_i_3_n_0),
        .I3(arb_busy_r_reg_0),
        .O(arb_busy_ns));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h8A800000)) 
    arb_busy_r_i_2
       (.I0(arb_busy_r_i_5_n_0),
        .I1(s_axis_tvalid[1]),
        .I2(\arb_sel_r_reg[0]_0 ),
        .I3(s_axis_tvalid[0]),
        .I4(m_axis_tready),
        .O(s_axis_tvalid_1_sn_1));
  LUT4 #(
    .INIT(16'hFFEF)) 
    arb_busy_r_i_3
       (.I0(\arb_gnt_r_reg[1]_0 ),
        .I1(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .I2(s_axis_tvalid[1]),
        .I3(s_req_suppress),
        .O(arb_busy_r_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    arb_busy_r_i_5
       (.I0(\arb_gnt_r_reg[1]_0 ),
        .I1(\gen_tdest_router.busy_r [1]),
        .I2(\arb_gnt_r_reg[0]_0 ),
        .I3(\gen_tdest_router.busy_r [0]),
        .O(arb_busy_r_i_5_n_0));
  FDRE arb_busy_r_reg
       (.C(aclk),
        .CE(aclken),
        .D(arb_busy_ns),
        .Q(arb_busy_r),
        .R(\arb_sel_r_reg[0]_1 ));
  LUT5 #(
    .INIT(32'h002F0020)) 
    \arb_gnt_r[0]_i_1 
       (.I0(\arb_gnt_r[0]_i_2_n_0 ),
        .I1(arb_busy_r_reg_0),
        .I2(aclken),
        .I3(\arb_sel_r_reg[0]_1 ),
        .I4(\arb_gnt_r_reg[0]_0 ),
        .O(\arb_gnt_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB0B0B000FFFFFFFF)) 
    \arb_gnt_r[0]_i_2 
       (.I0(s_axis_tvalid[1]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(m_axis_tready),
        .I3(\gen_tdest_router.busy_r [0]),
        .I4(\arb_sel_r_reg[0]_2 ),
        .I5(arb_busy_r),
        .O(\arb_gnt_r[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000008FF00000800)) 
    \arb_gnt_r[1]_i_1 
       (.I0(\arb_gnt_r[1]_i_2_n_0 ),
        .I1(arb_busy_r_reg_0),
        .I2(arb_busy_r_i_3_n_0),
        .I3(aclken),
        .I4(\arb_sel_r_reg[0]_1 ),
        .I5(\arb_gnt_r_reg[1]_0 ),
        .O(\arb_gnt_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0E000FFFFFFFF)) 
    \arb_gnt_r[1]_i_2 
       (.I0(\arb_sel_r_reg[0]_0 ),
        .I1(s_axis_tvalid[0]),
        .I2(m_axis_tready),
        .I3(\gen_tdest_router.busy_r [1]),
        .I4(\arb_sel_r_reg[0]_3 ),
        .I5(arb_busy_r),
        .O(\arb_gnt_r[1]_i_2_n_0 ));
  FDRE \arb_gnt_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_gnt_r[0]_i_1_n_0 ),
        .Q(\arb_gnt_r_reg[0]_0 ),
        .R(1'b0));
  FDRE \arb_gnt_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_gnt_r[1]_i_1_n_0 ),
        .Q(\arb_gnt_r_reg[1]_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0FFFBFF40004000)) 
    \arb_sel_r[0]_i_1 
       (.I0(arb_busy_r_i_3_n_0),
        .I1(\arb_gnt_r[1]_i_2_n_0 ),
        .I2(arb_busy_r_reg_0),
        .I3(aclken),
        .I4(\arb_gnt_r[0]_i_2_n_0 ),
        .I5(\arb_sel_r_reg[0]_0 ),
        .O(\arb_sel_r[0]_i_1_n_0 ));
  FDRE \arb_sel_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\arb_sel_r[0]_i_1_n_0 ),
        .Q(\arb_sel_r_reg[0]_0 ),
        .R(\arb_sel_r_reg[0]_1 ));
  LUT3 #(
    .INIT(8'h0E)) 
    \gen_tdest_routing.busy_r[0]_i_1 
       (.I0(\gen_tdest_routing.busy_r_reg[0] ),
        .I1(\arb_gnt_r_reg[0]_0 ),
        .I2(s_axis_tvalid_1_sn_1),
        .O(\gen_tdest_routing.busy_ns ));
  LUT6 #(
    .INIT(64'hFF00FF00FF010000)) 
    \gen_tdest_routing.busy_r[0]_i_1__0 
       (.I0(\gen_tdest_router.busy_r [1]),
        .I1(\arb_gnt_r_reg[0]_0 ),
        .I2(\gen_tdest_router.busy_r [0]),
        .I3(\gen_tdest_routing.busy_r[0]_i_2_n_0 ),
        .I4(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .I5(\arb_gnt_r_reg[1]_0 ),
        .O(\gen_tdest_routing.busy_ns_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h57F7)) 
    \gen_tdest_routing.busy_r[0]_i_2 
       (.I0(m_axis_tready),
        .I1(s_axis_tvalid[0]),
        .I2(\arb_sel_r_reg[0]_0 ),
        .I3(s_axis_tvalid[1]),
        .O(\gen_tdest_routing.busy_r[0]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[0]_INST_0 
       (.I0(s_axis_tdata[32]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[0]),
        .O(m_axis_tdata[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[10]_INST_0 
       (.I0(s_axis_tdata[42]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[10]),
        .O(m_axis_tdata[10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[11]_INST_0 
       (.I0(s_axis_tdata[43]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[11]),
        .O(m_axis_tdata[11]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[12]_INST_0 
       (.I0(s_axis_tdata[44]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[12]),
        .O(m_axis_tdata[12]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[13]_INST_0 
       (.I0(s_axis_tdata[45]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[13]),
        .O(m_axis_tdata[13]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[14]_INST_0 
       (.I0(s_axis_tdata[46]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[14]),
        .O(m_axis_tdata[14]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[15]_INST_0 
       (.I0(s_axis_tdata[47]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[15]),
        .O(m_axis_tdata[15]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[16]_INST_0 
       (.I0(s_axis_tdata[48]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[16]),
        .O(m_axis_tdata[16]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[17]_INST_0 
       (.I0(s_axis_tdata[49]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[17]),
        .O(m_axis_tdata[17]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[18]_INST_0 
       (.I0(s_axis_tdata[50]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[18]),
        .O(m_axis_tdata[18]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[19]_INST_0 
       (.I0(s_axis_tdata[51]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[19]),
        .O(m_axis_tdata[19]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[1]_INST_0 
       (.I0(s_axis_tdata[33]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[1]),
        .O(m_axis_tdata[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[20]_INST_0 
       (.I0(s_axis_tdata[52]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[20]),
        .O(m_axis_tdata[20]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[21]_INST_0 
       (.I0(s_axis_tdata[53]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[21]),
        .O(m_axis_tdata[21]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[22]_INST_0 
       (.I0(s_axis_tdata[54]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[22]),
        .O(m_axis_tdata[22]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[23]_INST_0 
       (.I0(s_axis_tdata[55]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[23]),
        .O(m_axis_tdata[23]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[24]_INST_0 
       (.I0(s_axis_tdata[56]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[24]),
        .O(m_axis_tdata[24]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[25]_INST_0 
       (.I0(s_axis_tdata[57]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[25]),
        .O(m_axis_tdata[25]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[26]_INST_0 
       (.I0(s_axis_tdata[58]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[26]),
        .O(m_axis_tdata[26]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[27]_INST_0 
       (.I0(s_axis_tdata[59]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[27]),
        .O(m_axis_tdata[27]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[28]_INST_0 
       (.I0(s_axis_tdata[60]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[28]),
        .O(m_axis_tdata[28]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[29]_INST_0 
       (.I0(s_axis_tdata[61]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[29]),
        .O(m_axis_tdata[29]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[2]_INST_0 
       (.I0(s_axis_tdata[34]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[2]),
        .O(m_axis_tdata[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[30]_INST_0 
       (.I0(s_axis_tdata[62]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[30]),
        .O(m_axis_tdata[30]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[31]_INST_0 
       (.I0(s_axis_tdata[63]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[31]),
        .O(m_axis_tdata[31]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[3]_INST_0 
       (.I0(s_axis_tdata[35]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[3]),
        .O(m_axis_tdata[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[4]_INST_0 
       (.I0(s_axis_tdata[36]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[4]),
        .O(m_axis_tdata[4]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[5]_INST_0 
       (.I0(s_axis_tdata[37]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[5]),
        .O(m_axis_tdata[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[6]_INST_0 
       (.I0(s_axis_tdata[38]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[6]),
        .O(m_axis_tdata[6]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[7]_INST_0 
       (.I0(s_axis_tdata[39]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[7]),
        .O(m_axis_tdata[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[8]_INST_0 
       (.I0(s_axis_tdata[40]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[8]),
        .O(m_axis_tdata[8]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tdata[9]_INST_0 
       (.I0(s_axis_tdata[41]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tdata[9]),
        .O(m_axis_tdata[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tid[0]_INST_0 
       (.I0(s_axis_tid[2]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tid[0]),
        .O(m_axis_tid[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tid[1]_INST_0 
       (.I0(s_axis_tid[3]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tid[1]),
        .O(m_axis_tid[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tlast[0]_INST_0 
       (.I0(s_axis_tlast[1]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tlast[0]),
        .O(m_axis_tlast));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tstrb[0]_INST_0 
       (.I0(s_axis_tstrb[4]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tstrb[0]),
        .O(m_axis_tstrb[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tstrb[1]_INST_0 
       (.I0(s_axis_tstrb[5]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tstrb[1]),
        .O(m_axis_tstrb[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tstrb[2]_INST_0 
       (.I0(s_axis_tstrb[6]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tstrb[2]),
        .O(m_axis_tstrb[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \m_axis_tstrb[3]_INST_0 
       (.I0(s_axis_tstrb[7]),
        .I1(\arb_sel_r_reg[0]_0 ),
        .I2(s_axis_tstrb[3]),
        .O(m_axis_tstrb[3]));
  LUT4 #(
    .INIT(16'hE000)) 
    \s_axis_tready[0]_INST_0 
       (.I0(\arb_gnt_r_reg[0]_0 ),
        .I1(\gen_tdest_router.busy_r [0]),
        .I2(m_axis_tready),
        .I3(s_axis_tvalid[0]),
        .O(s_axis_tready[0]));
  LUT4 #(
    .INIT(16'hE000)) 
    \s_axis_tready[1]_INST_0 
       (.I0(\arb_gnt_r_reg[1]_0 ),
        .I1(\gen_tdest_router.busy_r [1]),
        .I2(s_axis_tvalid[1]),
        .I3(m_axis_tready),
        .O(s_axis_tready[1]));
endmodule

(* C_ARB_ALGORITHM = "1" *) (* C_ARB_ON_MAX_XFERS = "1" *) (* C_ARB_ON_NUM_CYCLES = "0" *) 
(* C_ARB_ON_TLAST = "0" *) (* C_AXIS_SIGNAL_SET = "55" *) (* C_AXIS_TDATA_WIDTH = "32" *) 
(* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "2" *) (* C_AXIS_TUSER_WIDTH = "1" *) 
(* C_COMMON_CLOCK = "0" *) (* C_DECODER_REG = "0" *) (* C_FAMILY = "zynq" *) 
(* C_INCLUDE_ARBITER = "1" *) (* C_LOG_SI_SLOTS = "1" *) (* C_M_AXIS_BASETDEST_ARRAY = "1'b0" *) 
(* C_M_AXIS_CONNECTIVITY_ARRAY = "2'b11" *) (* C_M_AXIS_HIGHTDEST_ARRAY = "1'b0" *) (* C_NUM_MI_SLOTS = "1" *) 
(* C_NUM_SI_SLOTS = "2" *) (* C_OUTPUT_REG = "0" *) (* C_ROUTING_MODE = "0" *) 
(* C_S_AXI_CTRL_ADDR_WIDTH = "7" *) (* C_S_AXI_CTRL_DATA_WIDTH = "32" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* G_TASK_SEVERITY_WARNING = "1" *) (* LP_CTRL_REG_WIDTH = "15" *) (* LP_MERGEDOWN_MUX = "0" *) 
(* LP_NUM_SYNCHRONIZER_STAGES = "4" *) (* ORIG_REF_NAME = "axis_switch_v1_1_21_axis_switch" *) (* P_DECODER_CONNECTIVITY_ARRAY = "2'b11" *) 
(* P_SINGLE_SLAVE_CONNECTIVITY_ARRAY = "1'b0" *) (* P_TPAYLOAD_WIDTH = "39" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axis_switch
   (aclk,
    aresetn,
    aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    arb_req,
    arb_done,
    arb_gnt,
    arb_sel,
    arb_last,
    arb_id,
    arb_dest,
    arb_user,
    s_req_suppress,
    s_axi_ctrl_aclk,
    s_axi_ctrl_aresetn,
    s_axi_ctrl_awvalid,
    s_axi_ctrl_awready,
    s_axi_ctrl_awaddr,
    s_axi_ctrl_wvalid,
    s_axi_ctrl_wready,
    s_axi_ctrl_wdata,
    s_axi_ctrl_bvalid,
    s_axi_ctrl_bready,
    s_axi_ctrl_bresp,
    s_axi_ctrl_arvalid,
    s_axi_ctrl_arready,
    s_axi_ctrl_araddr,
    s_axi_ctrl_rvalid,
    s_axi_ctrl_rready,
    s_axi_ctrl_rdata,
    s_axi_ctrl_rresp,
    s_decode_err);
  input aclk;
  input aresetn;
  input aclken;
  input [1:0]s_axis_tvalid;
  output [1:0]s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input [1:0]s_axis_tlast;
  input [3:0]s_axis_tid;
  input [1:0]s_axis_tdest;
  input [1:0]s_axis_tuser;
  output [0:0]m_axis_tvalid;
  input [0:0]m_axis_tready;
  output [31:0]m_axis_tdata;
  output [3:0]m_axis_tstrb;
  output [3:0]m_axis_tkeep;
  output [0:0]m_axis_tlast;
  output [1:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  output [1:0]arb_req;
  output [0:0]arb_done;
  input [1:0]arb_gnt;
  input [0:0]arb_sel;
  output [1:0]arb_last;
  output [3:0]arb_id;
  output [1:0]arb_dest;
  output [1:0]arb_user;
  input [1:0]s_req_suppress;
  input s_axi_ctrl_aclk;
  input s_axi_ctrl_aresetn;
  input s_axi_ctrl_awvalid;
  output s_axi_ctrl_awready;
  input [6:0]s_axi_ctrl_awaddr;
  input s_axi_ctrl_wvalid;
  output s_axi_ctrl_wready;
  input [31:0]s_axi_ctrl_wdata;
  output s_axi_ctrl_bvalid;
  input s_axi_ctrl_bready;
  output [1:0]s_axi_ctrl_bresp;
  input s_axi_ctrl_arvalid;
  output s_axi_ctrl_arready;
  input [6:0]s_axi_ctrl_araddr;
  output s_axi_ctrl_rvalid;
  input s_axi_ctrl_rready;
  output [31:0]s_axi_ctrl_rdata;
  output [1:0]s_axi_ctrl_rresp;
  output [1:0]s_decode_err;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aclken;
  wire [1:0]arb_gnt_i;
  wire arb_sel_i;
  wire areset_r;
  wire aresetn;
  wire \gen_decoder[0].axisc_decoder_0_n_0 ;
  wire \gen_decoder[0].axisc_decoder_0_n_1 ;
  wire \gen_decoder[1].axisc_decoder_0_n_0 ;
  wire \gen_int_arbiter.gen_arbiter.axis_switch_v1_1_21_axis_switch_arbiter_n_2 ;
  wire [1:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_transfer_mux[0].axisc_transfer_mux_0_n_1 ;
  wire \gen_transfer_mux[0].axisc_transfer_mux_0_n_4 ;
  wire [31:0]m_axis_tdata;
  wire [1:0]m_axis_tid;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire [0:0]m_axis_tvalid;
  wire [63:0]s_axis_tdata;
  wire [3:0]s_axis_tid;
  wire [1:0]s_axis_tlast;
  wire [1:0]s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [1:0]s_axis_tvalid;
  wire [1:0]s_req_suppress;

  assign arb_dest[1] = \<const0> ;
  assign arb_dest[0] = \<const0> ;
  assign arb_done[0] = \<const0> ;
  assign arb_id[3] = \<const0> ;
  assign arb_id[2] = \<const0> ;
  assign arb_id[1] = \<const0> ;
  assign arb_id[0] = \<const0> ;
  assign arb_last[1] = \<const0> ;
  assign arb_last[0] = \<const0> ;
  assign arb_req[1] = \<const0> ;
  assign arb_req[0] = \<const0> ;
  assign arb_user[1] = \<const0> ;
  assign arb_user[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tkeep[3] = \<const1> ;
  assign m_axis_tkeep[2] = \<const1> ;
  assign m_axis_tkeep[1] = \<const1> ;
  assign m_axis_tkeep[0] = \<const1> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign s_axi_ctrl_arready = \<const0> ;
  assign s_axi_ctrl_awready = \<const0> ;
  assign s_axi_ctrl_bresp[1] = \<const0> ;
  assign s_axi_ctrl_bresp[0] = \<const0> ;
  assign s_axi_ctrl_bvalid = \<const0> ;
  assign s_axi_ctrl_rdata[31] = \<const0> ;
  assign s_axi_ctrl_rdata[30] = \<const0> ;
  assign s_axi_ctrl_rdata[29] = \<const0> ;
  assign s_axi_ctrl_rdata[28] = \<const0> ;
  assign s_axi_ctrl_rdata[27] = \<const0> ;
  assign s_axi_ctrl_rdata[26] = \<const0> ;
  assign s_axi_ctrl_rdata[25] = \<const0> ;
  assign s_axi_ctrl_rdata[24] = \<const0> ;
  assign s_axi_ctrl_rdata[23] = \<const0> ;
  assign s_axi_ctrl_rdata[22] = \<const0> ;
  assign s_axi_ctrl_rdata[21] = \<const0> ;
  assign s_axi_ctrl_rdata[20] = \<const0> ;
  assign s_axi_ctrl_rdata[19] = \<const0> ;
  assign s_axi_ctrl_rdata[18] = \<const0> ;
  assign s_axi_ctrl_rdata[17] = \<const0> ;
  assign s_axi_ctrl_rdata[16] = \<const0> ;
  assign s_axi_ctrl_rdata[15] = \<const0> ;
  assign s_axi_ctrl_rdata[14] = \<const0> ;
  assign s_axi_ctrl_rdata[13] = \<const0> ;
  assign s_axi_ctrl_rdata[12] = \<const0> ;
  assign s_axi_ctrl_rdata[11] = \<const0> ;
  assign s_axi_ctrl_rdata[10] = \<const0> ;
  assign s_axi_ctrl_rdata[9] = \<const0> ;
  assign s_axi_ctrl_rdata[8] = \<const0> ;
  assign s_axi_ctrl_rdata[7] = \<const0> ;
  assign s_axi_ctrl_rdata[6] = \<const0> ;
  assign s_axi_ctrl_rdata[5] = \<const0> ;
  assign s_axi_ctrl_rdata[4] = \<const0> ;
  assign s_axi_ctrl_rdata[3] = \<const0> ;
  assign s_axi_ctrl_rdata[2] = \<const0> ;
  assign s_axi_ctrl_rdata[1] = \<const0> ;
  assign s_axi_ctrl_rdata[0] = \<const0> ;
  assign s_axi_ctrl_rresp[1] = \<const0> ;
  assign s_axi_ctrl_rresp[0] = \<const0> ;
  assign s_axi_ctrl_rvalid = \<const0> ;
  assign s_axi_ctrl_wready = \<const0> ;
  assign s_decode_err[1] = \<const0> ;
  assign s_decode_err[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  base_zynq_xbar_3_axis_switch_v1_1_21_axisc_decoder \gen_decoder[0].axisc_decoder_0 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i[0]),
        .areset_r(areset_r),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[0].axisc_decoder_0_n_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_1 (\gen_decoder[0].axisc_decoder_0_n_1 ),
        .s_axis_tvalid(s_axis_tvalid[0]),
        .s_req_suppress(s_req_suppress[0]));
  base_zynq_xbar_3_axis_switch_v1_1_21_axisc_decoder_0 \gen_decoder[1].axisc_decoder_0 
       (.aclk(aclk),
        .aclken(aclken),
        .areset_r(areset_r),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[1].axisc_decoder_0_n_0 ));
  base_zynq_xbar_3_axis_switch_v1_1_21_axis_switch_arbiter \gen_int_arbiter.gen_arbiter.axis_switch_v1_1_21_axis_switch_arbiter 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_busy_r_reg(\gen_decoder[0].axisc_decoder_0_n_1 ),
        .arb_gnt_i(arb_gnt_i),
        .arb_sel_i(arb_sel_i),
        .\arb_sel_r_reg[0] (\gen_transfer_mux[0].axisc_transfer_mux_0_n_4 ),
        .\arb_sel_r_reg[0]_0 (\gen_transfer_mux[0].axisc_transfer_mux_0_n_1 ),
        .areset_r(areset_r),
        .aresetn(aresetn),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_ns_0 (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_r_reg[0] (\gen_decoder[0].axisc_decoder_0_n_0 ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_decoder[1].axisc_decoder_0_n_0 ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tid(m_axis_tid),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tid(s_axis_tid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tvalid_1_sp_1(\gen_int_arbiter.gen_arbiter.axis_switch_v1_1_21_axis_switch_arbiter_n_2 ),
        .s_req_suppress(s_req_suppress[1]));
  base_zynq_xbar_3_axis_switch_v1_1_21_axisc_transfer_mux \gen_transfer_mux[0].axisc_transfer_mux_0 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i),
        .arb_sel_i(arb_sel_i),
        .areset_r(areset_r),
        .\busy_r_reg[0] (\gen_transfer_mux[0].axisc_transfer_mux_0_n_1 ),
        .\busy_r_reg[0]_0 (\gen_int_arbiter.gen_arbiter.axis_switch_v1_1_21_axis_switch_arbiter_n_2 ),
        .\busy_r_reg[1] (\gen_transfer_mux[0].axisc_transfer_mux_0_n_4 ),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_axis_switch_arbiter" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axis_switch_arbiter
   (areset_r,
    arb_sel_i,
    s_axis_tvalid_1_sp_1,
    \gen_tdest_routing.busy_ns ,
    arb_gnt_i,
    \gen_tdest_routing.busy_ns_0 ,
    s_axis_tready,
    m_axis_tid,
    m_axis_tlast,
    m_axis_tstrb,
    m_axis_tdata,
    aclk,
    aclken,
    arb_busy_r_reg,
    \gen_tdest_routing.busy_r_reg[0] ,
    \gen_tdest_router.busy_r ,
    \gen_tdest_routing.busy_r_reg[0]_0 ,
    s_axis_tvalid,
    m_axis_tready,
    s_req_suppress,
    s_axis_tid,
    s_axis_tlast,
    s_axis_tstrb,
    s_axis_tdata,
    aresetn,
    \arb_sel_r_reg[0] ,
    \arb_sel_r_reg[0]_0 );
  output areset_r;
  output arb_sel_i;
  output s_axis_tvalid_1_sp_1;
  output \gen_tdest_routing.busy_ns ;
  output [1:0]arb_gnt_i;
  output \gen_tdest_routing.busy_ns_0 ;
  output [1:0]s_axis_tready;
  output [1:0]m_axis_tid;
  output [0:0]m_axis_tlast;
  output [3:0]m_axis_tstrb;
  output [31:0]m_axis_tdata;
  input aclk;
  input aclken;
  input arb_busy_r_reg;
  input \gen_tdest_routing.busy_r_reg[0] ;
  input [1:0]\gen_tdest_router.busy_r ;
  input \gen_tdest_routing.busy_r_reg[0]_0 ;
  input [1:0]s_axis_tvalid;
  input [0:0]m_axis_tready;
  input [0:0]s_req_suppress;
  input [3:0]s_axis_tid;
  input [1:0]s_axis_tlast;
  input [7:0]s_axis_tstrb;
  input [63:0]s_axis_tdata;
  input aresetn;
  input \arb_sel_r_reg[0] ;
  input \arb_sel_r_reg[0]_0 ;

  wire aclk;
  wire aclken;
  wire arb_busy_r_reg;
  wire [1:0]arb_gnt_i;
  wire arb_sel_i;
  wire \arb_sel_r_reg[0] ;
  wire \arb_sel_r_reg[0]_0 ;
  wire areset_r;
  wire aresetn;
  wire [1:0]\gen_tdest_router.busy_r ;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_ns_0 ;
  wire \gen_tdest_routing.busy_r_reg[0] ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;
  wire [31:0]m_axis_tdata;
  wire [1:0]m_axis_tid;
  wire [0:0]m_axis_tlast;
  wire [0:0]m_axis_tready;
  wire [3:0]m_axis_tstrb;
  wire p_0_in;
  wire [63:0]s_axis_tdata;
  wire [3:0]s_axis_tid;
  wire [1:0]s_axis_tlast;
  wire [1:0]s_axis_tready;
  wire [7:0]s_axis_tstrb;
  wire [1:0]s_axis_tvalid;
  wire s_axis_tvalid_1_sn_1;
  wire [0:0]s_req_suppress;

  assign s_axis_tvalid_1_sp_1 = s_axis_tvalid_1_sn_1;
  LUT1 #(
    .INIT(2'h1)) 
    areset_i_1
       (.I0(aresetn),
        .O(p_0_in));
  FDRE areset_reg
       (.C(aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(areset_r),
        .R(1'b0));
  base_zynq_xbar_3_axis_switch_v1_1_21_arb_rr \gen_mi_arb[0].gen_arb_algorithm.gen_fixed_priority.inst_arb_rr_1 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_busy_r_reg_0(arb_busy_r_reg),
        .\arb_gnt_r_reg[0]_0 (arb_gnt_i[0]),
        .\arb_gnt_r_reg[1]_0 (arb_gnt_i[1]),
        .\arb_sel_r_reg[0]_0 (arb_sel_i),
        .\arb_sel_r_reg[0]_1 (areset_r),
        .\arb_sel_r_reg[0]_2 (\arb_sel_r_reg[0] ),
        .\arb_sel_r_reg[0]_3 (\arb_sel_r_reg[0]_0 ),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r ),
        .\gen_tdest_routing.busy_ns (\gen_tdest_routing.busy_ns ),
        .\gen_tdest_routing.busy_ns_0 (\gen_tdest_routing.busy_ns_0 ),
        .\gen_tdest_routing.busy_r_reg[0] (\gen_tdest_routing.busy_r_reg[0] ),
        .\gen_tdest_routing.busy_r_reg[0]_0 (\gen_tdest_routing.busy_r_reg[0]_0 ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tid(m_axis_tid),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tid(s_axis_tid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tvalid_1_sp_1(s_axis_tvalid_1_sn_1),
        .s_req_suppress(s_req_suppress));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_axisc_arb_responder" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axisc_arb_responder
   (m_axis_tvalid,
    \busy_r_reg[0]_0 ,
    \busy_r_reg[1]_0 ,
    \busy_r_reg[1]_1 ,
    \gen_tdest_router.busy_r ,
    arb_gnt_i,
    s_axis_tvalid,
    arb_sel_i,
    \busy_r_reg[0]_1 ,
    aclken,
    areset_r,
    aclk);
  output [0:0]m_axis_tvalid;
  output \busy_r_reg[0]_0 ;
  output \busy_r_reg[1]_0 ;
  output \busy_r_reg[1]_1 ;
  output [0:0]\gen_tdest_router.busy_r ;
  input [1:0]arb_gnt_i;
  input [1:0]s_axis_tvalid;
  input arb_sel_i;
  input \busy_r_reg[0]_1 ;
  input aclken;
  input areset_r;
  input aclk;

  wire aclk;
  wire aclken;
  wire [1:0]arb_gnt_i;
  wire arb_sel_i;
  wire areset_r;
  wire \busy_r[0]_i_1_n_0 ;
  wire \busy_r[1]_i_1_n_0 ;
  wire \busy_r_reg[0]_0 ;
  wire \busy_r_reg[0]_1 ;
  wire \busy_r_reg[1]_0 ;
  wire \busy_r_reg[1]_1 ;
  wire [0:0]\gen_tdest_router.busy_r ;
  wire [0:0]m_axis_tvalid;
  wire [1:0]s_axis_tvalid;

  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \arb_gnt_r[0]_i_3 
       (.I0(\busy_r_reg[1]_0 ),
        .I1(arb_gnt_i[1]),
        .O(\busy_r_reg[1]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h00000EAA)) 
    \busy_r[0]_i_1 
       (.I0(\gen_tdest_router.busy_r ),
        .I1(arb_gnt_i[0]),
        .I2(\busy_r_reg[0]_1 ),
        .I3(aclken),
        .I4(areset_r),
        .O(\busy_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00000EAA)) 
    \busy_r[1]_i_1 
       (.I0(\busy_r_reg[1]_0 ),
        .I1(arb_gnt_i[1]),
        .I2(\busy_r_reg[0]_1 ),
        .I3(aclken),
        .I4(areset_r),
        .O(\busy_r[1]_i_1_n_0 ));
  FDRE \busy_r_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\busy_r[0]_i_1_n_0 ),
        .Q(\gen_tdest_router.busy_r ),
        .R(1'b0));
  FDRE \busy_r_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\busy_r[1]_i_1_n_0 ),
        .Q(\busy_r_reg[1]_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFEFEFE000000FE00)) 
    \m_axis_tvalid[0]_INST_0 
       (.I0(\busy_r_reg[0]_0 ),
        .I1(\busy_r_reg[1]_0 ),
        .I2(arb_gnt_i[1]),
        .I3(s_axis_tvalid[0]),
        .I4(arb_sel_i),
        .I5(s_axis_tvalid[1]),
        .O(m_axis_tvalid));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \m_axis_tvalid[0]_INST_0_i_1 
       (.I0(\gen_tdest_router.busy_r ),
        .I1(arb_gnt_i[0]),
        .O(\busy_r_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_axisc_decoder" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axisc_decoder
   (\gen_tdest_routing.busy_r_reg[0]_0 ,
    \gen_tdest_routing.busy_r_reg[0]_1 ,
    areset_r,
    aclken,
    \gen_tdest_routing.busy_ns ,
    aclk,
    arb_gnt_i,
    s_req_suppress,
    s_axis_tvalid);
  output \gen_tdest_routing.busy_r_reg[0]_0 ;
  output \gen_tdest_routing.busy_r_reg[0]_1 ;
  input areset_r;
  input aclken;
  input \gen_tdest_routing.busy_ns ;
  input aclk;
  input [0:0]arb_gnt_i;
  input [0:0]s_req_suppress;
  input [0:0]s_axis_tvalid;

  wire aclk;
  wire aclken;
  wire [0:0]arb_gnt_i;
  wire areset_r;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;
  wire \gen_tdest_routing.busy_r_reg[0]_1 ;
  wire [0:0]s_axis_tvalid;
  wire [0:0]s_req_suppress;

  LUT4 #(
    .INIT(16'hFEFF)) 
    arb_busy_r_i_4
       (.I0(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .I1(arb_gnt_i),
        .I2(s_req_suppress),
        .I3(s_axis_tvalid),
        .O(\gen_tdest_routing.busy_r_reg[0]_1 ));
  FDRE \gen_tdest_routing.busy_r_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\gen_tdest_routing.busy_ns ),
        .Q(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .R(areset_r));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_axisc_decoder" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axisc_decoder_0
   (\gen_tdest_routing.busy_r_reg[0]_0 ,
    areset_r,
    aclken,
    \gen_tdest_routing.busy_ns ,
    aclk);
  output \gen_tdest_routing.busy_r_reg[0]_0 ;
  input areset_r;
  input aclken;
  input \gen_tdest_routing.busy_ns ;
  input aclk;

  wire aclk;
  wire aclken;
  wire areset_r;
  wire \gen_tdest_routing.busy_ns ;
  wire \gen_tdest_routing.busy_r_reg[0]_0 ;

  FDRE \gen_tdest_routing.busy_r_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\gen_tdest_routing.busy_ns ),
        .Q(\gen_tdest_routing.busy_r_reg[0]_0 ),
        .R(areset_r));
endmodule

(* ORIG_REF_NAME = "axis_switch_v1_1_21_axisc_transfer_mux" *) 
module base_zynq_xbar_3_axis_switch_v1_1_21_axisc_transfer_mux
   (m_axis_tvalid,
    \busy_r_reg[0] ,
    \gen_tdest_router.busy_r ,
    \busy_r_reg[1] ,
    arb_gnt_i,
    s_axis_tvalid,
    arb_sel_i,
    \busy_r_reg[0]_0 ,
    aclken,
    areset_r,
    aclk);
  output [0:0]m_axis_tvalid;
  output \busy_r_reg[0] ;
  output [1:0]\gen_tdest_router.busy_r ;
  output \busy_r_reg[1] ;
  input [1:0]arb_gnt_i;
  input [1:0]s_axis_tvalid;
  input arb_sel_i;
  input \busy_r_reg[0]_0 ;
  input aclken;
  input areset_r;
  input aclk;

  wire aclk;
  wire aclken;
  wire [1:0]arb_gnt_i;
  wire arb_sel_i;
  wire areset_r;
  wire \busy_r_reg[0] ;
  wire \busy_r_reg[0]_0 ;
  wire \busy_r_reg[1] ;
  wire [1:0]\gen_tdest_router.busy_r ;
  wire [0:0]m_axis_tvalid;
  wire [1:0]s_axis_tvalid;

  base_zynq_xbar_3_axis_switch_v1_1_21_axisc_arb_responder \gen_tdest_router.axisc_arb_responder 
       (.aclk(aclk),
        .aclken(aclken),
        .arb_gnt_i(arb_gnt_i),
        .arb_sel_i(arb_sel_i),
        .areset_r(areset_r),
        .\busy_r_reg[0]_0 (\busy_r_reg[0] ),
        .\busy_r_reg[0]_1 (\busy_r_reg[0]_0 ),
        .\busy_r_reg[1]_0 (\gen_tdest_router.busy_r [1]),
        .\busy_r_reg[1]_1 (\busy_r_reg[1] ),
        .\gen_tdest_router.busy_r (\gen_tdest_router.busy_r [0]),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tvalid(s_axis_tvalid));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
