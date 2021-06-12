--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Wed Jun  9 14:58:19 2021
--Host        : flacaVivado running 64-bit Ubuntu 20.04.2 LTS
--Command     : generate_target base_zynq.bd
--Design      : base_zynq
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_DSJXWU is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tvalid : in STD_LOGIC
  );
end m00_couplers_imp_DSJXWU;

architecture STRUCTURE of m00_couplers_imp_DSJXWU is
  component base_zynq_m00_data_fifo_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component base_zynq_m00_data_fifo_0;
  component base_zynq_auto_ss_k_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_auto_ss_k_0;
  component base_zynq_auto_ss_slidr_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component base_zynq_auto_ss_slidr_0;
  signal AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ss_k_to_auto_ss_slidr_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ss_k_to_auto_ss_slidr_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_ss_k_to_auto_ss_slidr_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ss_k_to_auto_ss_slidr_TLAST : STD_LOGIC;
  signal auto_ss_k_to_auto_ss_slidr_TREADY : STD_LOGIC;
  signal auto_ss_k_to_auto_ss_slidr_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ss_k_to_auto_ss_slidr_TVALID : STD_LOGIC;
  signal auto_ss_slidr_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_ss_slidr_to_m00_couplers_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_ss_slidr_to_m00_couplers_TLAST : STD_LOGIC;
  signal auto_ss_slidr_to_m00_couplers_TREADY : STD_LOGIC;
  signal auto_ss_slidr_to_m00_couplers_TVALID : STD_LOGIC;
  signal m00_couplers_to_m00_data_fifo_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_data_fifo_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_data_fifo_TLAST : STD_LOGIC;
  signal m00_couplers_to_m00_data_fifo_TREADY : STD_LOGIC;
  signal m00_couplers_to_m00_data_fifo_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_data_fifo_TVALID : STD_LOGIC;
  signal m00_data_fifo_to_auto_ss_k_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_data_fifo_to_auto_ss_k_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_data_fifo_to_auto_ss_k_TLAST : STD_LOGIC;
  signal m00_data_fifo_to_auto_ss_k_TREADY : STD_LOGIC;
  signal m00_data_fifo_to_auto_ss_k_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_data_fifo_to_auto_ss_k_TVALID : STD_LOGIC;
begin
  M_AXIS_tdata(31 downto 0) <= auto_ss_slidr_to_m00_couplers_TDATA(31 downto 0);
  M_AXIS_tkeep(3 downto 0) <= auto_ss_slidr_to_m00_couplers_TKEEP(3 downto 0);
  M_AXIS_tlast <= auto_ss_slidr_to_m00_couplers_TLAST;
  M_AXIS_tvalid <= auto_ss_slidr_to_m00_couplers_TVALID;
  S_AXIS_tready <= m00_couplers_to_m00_data_fifo_TREADY;
  auto_ss_slidr_to_m00_couplers_TREADY <= M_AXIS_tready;
  m00_couplers_to_m00_data_fifo_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  m00_couplers_to_m00_data_fifo_TID(1 downto 0) <= S_AXIS_tid(1 downto 0);
  m00_couplers_to_m00_data_fifo_TLAST <= S_AXIS_tlast;
  m00_couplers_to_m00_data_fifo_TSTRB(3 downto 0) <= S_AXIS_tstrb(3 downto 0);
  m00_couplers_to_m00_data_fifo_TVALID <= S_AXIS_tvalid;
auto_ss_k: component base_zynq_auto_ss_k_0
     port map (
      aclk => S_AXIS_ACLK,
      aresetn => S_AXIS_ARESETN,
      m_axis_tdata(31 downto 0) => auto_ss_k_to_auto_ss_slidr_TDATA(31 downto 0),
      m_axis_tid(1 downto 0) => auto_ss_k_to_auto_ss_slidr_TID(1 downto 0),
      m_axis_tkeep(3 downto 0) => auto_ss_k_to_auto_ss_slidr_TKEEP(3 downto 0),
      m_axis_tlast => auto_ss_k_to_auto_ss_slidr_TLAST,
      m_axis_tready => auto_ss_k_to_auto_ss_slidr_TREADY,
      m_axis_tstrb(3 downto 0) => auto_ss_k_to_auto_ss_slidr_TSTRB(3 downto 0),
      m_axis_tvalid => auto_ss_k_to_auto_ss_slidr_TVALID,
      s_axis_tdata(31 downto 0) => m00_data_fifo_to_auto_ss_k_TDATA(31 downto 0),
      s_axis_tid(1 downto 0) => m00_data_fifo_to_auto_ss_k_TID(1 downto 0),
      s_axis_tlast => m00_data_fifo_to_auto_ss_k_TLAST,
      s_axis_tready => m00_data_fifo_to_auto_ss_k_TREADY,
      s_axis_tstrb(3 downto 0) => m00_data_fifo_to_auto_ss_k_TSTRB(3 downto 0),
      s_axis_tvalid => m00_data_fifo_to_auto_ss_k_TVALID
    );
auto_ss_slidr: component base_zynq_auto_ss_slidr_0
     port map (
      aclk => S_AXIS_ACLK,
      aresetn => S_AXIS_ARESETN,
      m_axis_tdata(31 downto 0) => auto_ss_slidr_to_m00_couplers_TDATA(31 downto 0),
      m_axis_tkeep(3 downto 0) => auto_ss_slidr_to_m00_couplers_TKEEP(3 downto 0),
      m_axis_tlast => auto_ss_slidr_to_m00_couplers_TLAST,
      m_axis_tready => auto_ss_slidr_to_m00_couplers_TREADY,
      m_axis_tvalid => auto_ss_slidr_to_m00_couplers_TVALID,
      s_axis_tdata(31 downto 0) => auto_ss_k_to_auto_ss_slidr_TDATA(31 downto 0),
      s_axis_tid(1 downto 0) => auto_ss_k_to_auto_ss_slidr_TID(1 downto 0),
      s_axis_tkeep(3 downto 0) => auto_ss_k_to_auto_ss_slidr_TKEEP(3 downto 0),
      s_axis_tlast => auto_ss_k_to_auto_ss_slidr_TLAST,
      s_axis_tready => auto_ss_k_to_auto_ss_slidr_TREADY,
      s_axis_tstrb(3 downto 0) => auto_ss_k_to_auto_ss_slidr_TSTRB(3 downto 0),
      s_axis_tvalid => auto_ss_k_to_auto_ss_slidr_TVALID
    );
m00_data_fifo: component base_zynq_m00_data_fifo_0
     port map (
      axis_rd_data_count(31 downto 0) => AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT(31 downto 0),
      axis_wr_data_count(31 downto 0) => AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT(31 downto 0),
      m_axis_tdata(31 downto 0) => m00_data_fifo_to_auto_ss_k_TDATA(31 downto 0),
      m_axis_tid(1 downto 0) => m00_data_fifo_to_auto_ss_k_TID(1 downto 0),
      m_axis_tlast => m00_data_fifo_to_auto_ss_k_TLAST,
      m_axis_tready => m00_data_fifo_to_auto_ss_k_TREADY,
      m_axis_tstrb(3 downto 0) => m00_data_fifo_to_auto_ss_k_TSTRB(3 downto 0),
      m_axis_tvalid => m00_data_fifo_to_auto_ss_k_TVALID,
      s_axis_aclk => S_AXIS_ACLK,
      s_axis_aresetn => S_AXIS_ARESETN,
      s_axis_tdata(31 downto 0) => m00_couplers_to_m00_data_fifo_TDATA(31 downto 0),
      s_axis_tid(1 downto 0) => m00_couplers_to_m00_data_fifo_TID(1 downto 0),
      s_axis_tlast => m00_couplers_to_m00_data_fifo_TLAST,
      s_axis_tready => m00_couplers_to_m00_data_fifo_TREADY,
      s_axis_tstrb(3 downto 0) => m00_couplers_to_m00_data_fifo_TSTRB(3 downto 0),
      s_axis_tvalid => m00_couplers_to_m00_data_fifo_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_QHT96L is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_QHT96L;

architecture STRUCTURE of m00_couplers_imp_QHT96L is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m00_couplers_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m00_couplers_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m00_couplers_to_m00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m00_couplers_to_m00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_11WP2HX is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end m01_couplers_imp_11WP2HX;

architecture STRUCTURE of m01_couplers_imp_11WP2HX is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  M_AXI_araddr(31 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(31 downto 0);
  M_AXI_arvalid(0) <= m01_couplers_to_m01_couplers_ARVALID(0);
  M_AXI_awaddr(31 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(31 downto 0);
  M_AXI_awvalid(0) <= m01_couplers_to_m01_couplers_AWVALID(0);
  M_AXI_bready(0) <= m01_couplers_to_m01_couplers_BREADY(0);
  M_AXI_rready(0) <= m01_couplers_to_m01_couplers_RREADY(0);
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wvalid(0) <= m01_couplers_to_m01_couplers_WVALID(0);
  S_AXI_arready(0) <= m01_couplers_to_m01_couplers_ARREADY(0);
  S_AXI_awready(0) <= m01_couplers_to_m01_couplers_AWREADY(0);
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid(0) <= m01_couplers_to_m01_couplers_BVALID(0);
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid(0) <= m01_couplers_to_m01_couplers_RVALID(0);
  S_AXI_wready(0) <= m01_couplers_to_m01_couplers_WREADY(0);
  m01_couplers_to_m01_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m01_couplers_to_m01_couplers_ARREADY(0) <= M_AXI_arready(0);
  m01_couplers_to_m01_couplers_ARVALID(0) <= S_AXI_arvalid(0);
  m01_couplers_to_m01_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m01_couplers_to_m01_couplers_AWREADY(0) <= M_AXI_awready(0);
  m01_couplers_to_m01_couplers_AWVALID(0) <= S_AXI_awvalid(0);
  m01_couplers_to_m01_couplers_BREADY(0) <= S_AXI_bready(0);
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID(0) <= M_AXI_bvalid(0);
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY(0) <= S_AXI_rready(0);
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID(0) <= M_AXI_rvalid(0);
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY(0) <= M_AXI_wready(0);
  m01_couplers_to_m01_couplers_WVALID(0) <= S_AXI_wvalid(0);
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_C5D3YK is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_C5D3YK;

architecture STRUCTURE of m02_couplers_imp_C5D3YK is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m02_couplers_to_m02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m02_couplers_to_m02_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m02_couplers_to_m02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m02_couplers_to_m02_couplers_AWVALID;
  M_AXI_bready <= m02_couplers_to_m02_couplers_BREADY;
  M_AXI_rready <= m02_couplers_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m02_couplers_to_m02_couplers_WVALID;
  S_AXI_arready <= m02_couplers_to_m02_couplers_ARREADY;
  S_AXI_awready <= m02_couplers_to_m02_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_m02_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_m02_couplers_RVALID;
  S_AXI_wready <= m02_couplers_to_m02_couplers_WREADY;
  m02_couplers_to_m02_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m02_couplers_to_m02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_m02_couplers_ARREADY <= M_AXI_arready;
  m02_couplers_to_m02_couplers_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_m02_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m02_couplers_to_m02_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_m02_couplers_AWREADY <= M_AXI_awready;
  m02_couplers_to_m02_couplers_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_m02_couplers_BREADY <= S_AXI_bready;
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID <= M_AXI_bvalid;
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY <= S_AXI_rready;
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID <= M_AXI_rvalid;
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1XYV0GK is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1XYV0GK;

architecture STRUCTURE of m03_couplers_imp_1XYV0GK is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= m03_couplers_to_m03_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m03_couplers_to_m03_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= m03_couplers_to_m03_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m03_couplers_to_m03_couplers_AWVALID;
  M_AXI_bready <= m03_couplers_to_m03_couplers_BREADY;
  M_AXI_rready <= m03_couplers_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m03_couplers_to_m03_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m03_couplers_to_m03_couplers_WVALID;
  S_AXI_arready <= m03_couplers_to_m03_couplers_ARREADY;
  S_AXI_awready <= m03_couplers_to_m03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_m03_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_m03_couplers_RVALID;
  S_AXI_wready <= m03_couplers_to_m03_couplers_WREADY;
  m03_couplers_to_m03_couplers_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  m03_couplers_to_m03_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m03_couplers_to_m03_couplers_ARREADY <= M_AXI_arready;
  m03_couplers_to_m03_couplers_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_m03_couplers_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  m03_couplers_to_m03_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m03_couplers_to_m03_couplers_AWREADY <= M_AXI_awready;
  m03_couplers_to_m03_couplers_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_m03_couplers_BREADY <= S_AXI_bready;
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID <= M_AXI_bvalid;
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY <= S_AXI_rready;
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID <= M_AXI_rvalid;
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_m03_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m03_couplers_to_m03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1B288QA is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tvalid : in STD_LOGIC
  );
end s00_couplers_imp_1B288QA;

architecture STRUCTURE of s00_couplers_imp_1B288QA is
  component base_zynq_s00_data_fifo_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component base_zynq_s00_data_fifo_0;
  signal AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_data_fifo_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_data_fifo_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_data_fifo_TLAST : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_TREADY : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_data_fifo_TVALID : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_data_fifo_to_s00_couplers_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_data_fifo_to_s00_couplers_TLAST : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TREADY : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_data_fifo_to_s00_couplers_TVALID : STD_LOGIC;
begin
  M_AXIS_tdata(31 downto 0) <= s00_data_fifo_to_s00_couplers_TDATA(31 downto 0);
  M_AXIS_tid(1 downto 0) <= s00_data_fifo_to_s00_couplers_TID(1 downto 0);
  M_AXIS_tlast <= s00_data_fifo_to_s00_couplers_TLAST;
  M_AXIS_tstrb(3 downto 0) <= s00_data_fifo_to_s00_couplers_TSTRB(3 downto 0);
  M_AXIS_tvalid <= s00_data_fifo_to_s00_couplers_TVALID;
  S_AXIS_tready <= s00_couplers_to_s00_data_fifo_TREADY;
  s00_couplers_to_s00_data_fifo_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  s00_couplers_to_s00_data_fifo_TID(1 downto 0) <= S_AXIS_tid(1 downto 0);
  s00_couplers_to_s00_data_fifo_TLAST <= S_AXIS_tlast;
  s00_couplers_to_s00_data_fifo_TSTRB(3 downto 0) <= S_AXIS_tstrb(3 downto 0);
  s00_couplers_to_s00_data_fifo_TVALID <= S_AXIS_tvalid;
  s00_data_fifo_to_s00_couplers_TREADY <= M_AXIS_tready;
s00_data_fifo: component base_zynq_s00_data_fifo_0
     port map (
      axis_rd_data_count(31 downto 0) => AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT(31 downto 0),
      axis_wr_data_count(31 downto 0) => AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT(31 downto 0),
      m_axis_tdata(31 downto 0) => s00_data_fifo_to_s00_couplers_TDATA(31 downto 0),
      m_axis_tid(1 downto 0) => s00_data_fifo_to_s00_couplers_TID(1 downto 0),
      m_axis_tlast => s00_data_fifo_to_s00_couplers_TLAST,
      m_axis_tready => s00_data_fifo_to_s00_couplers_TREADY,
      m_axis_tstrb(3 downto 0) => s00_data_fifo_to_s00_couplers_TSTRB(3 downto 0),
      m_axis_tvalid => s00_data_fifo_to_s00_couplers_TVALID,
      s_axis_aclk => M_AXIS_ACLK,
      s_axis_aresetn => M_AXIS_ARESETN,
      s_axis_tdata(31 downto 0) => s00_couplers_to_s00_data_fifo_TDATA(31 downto 0),
      s_axis_tid(1 downto 0) => s00_couplers_to_s00_data_fifo_TID(1 downto 0),
      s_axis_tlast => s00_couplers_to_s00_data_fifo_TLAST,
      s_axis_tready => s00_couplers_to_s00_data_fifo_TREADY,
      s_axis_tstrb(3 downto 0) => s00_couplers_to_s00_data_fifo_TSTRB(3 downto 0),
      s_axis_tvalid => s00_couplers_to_s00_data_fifo_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1IAW1WV is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wlast : out STD_LOGIC;
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1IAW1WV;

architecture STRUCTURE of s00_couplers_imp_1IAW1WV is
  component base_zynq_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC
  );
  end component base_zynq_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WLAST : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awburst(1 downto 0) <= auto_pc_to_s00_couplers_AWBURST(1 downto 0);
  M_AXI_awcache(3 downto 0) <= auto_pc_to_s00_couplers_AWCACHE(3 downto 0);
  M_AXI_awlen(3 downto 0) <= auto_pc_to_s00_couplers_AWLEN(3 downto 0);
  M_AXI_awlock(1 downto 0) <= auto_pc_to_s00_couplers_AWLOCK(1 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awqos(3 downto 0) <= auto_pc_to_s00_couplers_AWQOS(3 downto 0);
  M_AXI_awsize(2 downto 0) <= auto_pc_to_s00_couplers_AWSIZE(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wlast <= auto_pc_to_s00_couplers_WLAST;
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component base_zynq_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awburst(1 downto 0) => auto_pc_to_s00_couplers_AWBURST(1 downto 0),
      m_axi_awcache(3 downto 0) => auto_pc_to_s00_couplers_AWCACHE(3 downto 0),
      m_axi_awlen(3 downto 0) => auto_pc_to_s00_couplers_AWLEN(3 downto 0),
      m_axi_awlock(1 downto 0) => auto_pc_to_s00_couplers_AWLOCK(1 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awqos(3 downto 0) => auto_pc_to_s00_couplers_AWQOS(3 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awsize(2 downto 0) => auto_pc_to_s00_couplers_AWSIZE(2 downto 0),
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wlast => auto_pc_to_s00_couplers_WLAST,
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_1JB4A1T is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_1JB4A1T;

architecture STRUCTURE of s00_couplers_imp_1JB4A1T is
  component base_zynq_auto_pc_1 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component base_zynq_auto_pc_1;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(31 downto 0) <= auto_pc_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(31 downto 0) <= auto_pc_to_s00_couplers_AWADDR(31 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(11 downto 0) <= s00_couplers_to_auto_pc_BID(11 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(11 downto 0) <= s00_couplers_to_auto_pc_RID(11 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(11 downto 0) <= S_AXI_arid(11 downto 0);
  s00_couplers_to_auto_pc_ARLEN(3 downto 0) <= S_AXI_arlen(3 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(1 downto 0) <= S_AXI_arlock(1 downto 0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(31 downto 0) <= S_AXI_awaddr(31 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(11 downto 0) <= S_AXI_awid(11 downto 0);
  s00_couplers_to_auto_pc_AWLEN(3 downto 0) <= S_AXI_awlen(3 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(1 downto 0) <= S_AXI_awlock(1 downto 0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WID(11 downto 0) <= S_AXI_wid(11 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component base_zynq_auto_pc_1
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(31 downto 0) => auto_pc_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(31 downto 0) => auto_pc_to_s00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_auto_pc_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(11 downto 0) => s00_couplers_to_auto_pc_ARID(11 downto 0),
      s_axi_arlen(3 downto 0) => s00_couplers_to_auto_pc_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => s00_couplers_to_auto_pc_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_auto_pc_AWADDR(31 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(11 downto 0) => s00_couplers_to_auto_pc_AWID(11 downto 0),
      s_axi_awlen(3 downto 0) => s00_couplers_to_auto_pc_AWLEN(3 downto 0),
      s_axi_awlock(1 downto 0) => s00_couplers_to_auto_pc_AWLOCK(1 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(11 downto 0) => s00_couplers_to_auto_pc_BID(11 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(11 downto 0) => s00_couplers_to_auto_pc_RID(11 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wid(11 downto 0) => s00_couplers_to_auto_pc_WID(11 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s01_couplers_imp_Z3K9KA is
  port (
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_tlast : out STD_LOGIC;
    M_AXIS_tready : in STD_LOGIC;
    M_AXIS_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_tvalid : out STD_LOGIC;
    S_AXIS_ACLK : in STD_LOGIC;
    S_AXIS_ARESETN : in STD_LOGIC;
    S_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXIS_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXIS_tlast : in STD_LOGIC;
    S_AXIS_tready : out STD_LOGIC;
    S_AXIS_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXIS_tvalid : in STD_LOGIC
  );
end s01_couplers_imp_Z3K9KA;

architecture STRUCTURE of s01_couplers_imp_Z3K9KA is
  component base_zynq_s01_data_fifo_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component base_zynq_s01_data_fifo_0;
  signal AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_data_fifo_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_s01_data_fifo_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_s01_data_fifo_TLAST : STD_LOGIC;
  signal s01_couplers_to_s01_data_fifo_TREADY : STD_LOGIC;
  signal s01_couplers_to_s01_data_fifo_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_s01_data_fifo_TVALID : STD_LOGIC;
  signal s01_data_fifo_to_s01_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_data_fifo_to_s01_couplers_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_data_fifo_to_s01_couplers_TLAST : STD_LOGIC;
  signal s01_data_fifo_to_s01_couplers_TREADY : STD_LOGIC;
  signal s01_data_fifo_to_s01_couplers_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_data_fifo_to_s01_couplers_TVALID : STD_LOGIC;
begin
  M_AXIS_tdata(31 downto 0) <= s01_data_fifo_to_s01_couplers_TDATA(31 downto 0);
  M_AXIS_tid(1 downto 0) <= s01_data_fifo_to_s01_couplers_TID(1 downto 0);
  M_AXIS_tlast <= s01_data_fifo_to_s01_couplers_TLAST;
  M_AXIS_tstrb(3 downto 0) <= s01_data_fifo_to_s01_couplers_TSTRB(3 downto 0);
  M_AXIS_tvalid <= s01_data_fifo_to_s01_couplers_TVALID;
  S_AXIS_tready <= s01_couplers_to_s01_data_fifo_TREADY;
  s01_couplers_to_s01_data_fifo_TDATA(31 downto 0) <= S_AXIS_tdata(31 downto 0);
  s01_couplers_to_s01_data_fifo_TID(1 downto 0) <= S_AXIS_tid(1 downto 0);
  s01_couplers_to_s01_data_fifo_TLAST <= S_AXIS_tlast;
  s01_couplers_to_s01_data_fifo_TSTRB(3 downto 0) <= S_AXIS_tstrb(3 downto 0);
  s01_couplers_to_s01_data_fifo_TVALID <= S_AXIS_tvalid;
  s01_data_fifo_to_s01_couplers_TREADY <= M_AXIS_tready;
s01_data_fifo: component base_zynq_s01_data_fifo_0
     port map (
      axis_rd_data_count(31 downto 0) => AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT(31 downto 0),
      axis_wr_data_count(31 downto 0) => AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT(31 downto 0),
      m_axis_tdata(31 downto 0) => s01_data_fifo_to_s01_couplers_TDATA(31 downto 0),
      m_axis_tid(1 downto 0) => s01_data_fifo_to_s01_couplers_TID(1 downto 0),
      m_axis_tlast => s01_data_fifo_to_s01_couplers_TLAST,
      m_axis_tready => s01_data_fifo_to_s01_couplers_TREADY,
      m_axis_tstrb(3 downto 0) => s01_data_fifo_to_s01_couplers_TSTRB(3 downto 0),
      m_axis_tvalid => s01_data_fifo_to_s01_couplers_TVALID,
      s_axis_aclk => M_AXIS_ACLK,
      s_axis_aresetn => M_AXIS_ARESETN,
      s_axis_tdata(31 downto 0) => s01_couplers_to_s01_data_fifo_TDATA(31 downto 0),
      s_axis_tid(1 downto 0) => s01_couplers_to_s01_data_fifo_TID(1 downto 0),
      s_axis_tlast => s01_couplers_to_s01_data_fifo_TLAST,
      s_axis_tready => s01_couplers_to_s01_data_fifo_TREADY,
      s_axis_tstrb(3 downto 0) => s01_couplers_to_s01_data_fifo_TSTRB(3 downto 0),
      s_axis_tvalid => s01_couplers_to_s01_data_fifo_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_axi_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wlast : out STD_LOGIC;
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end base_zynq_axi_interconnect_0_0;

architecture STRUCTURE of base_zynq_axi_interconnect_0_0 is
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal axi_interconnect_0_ACLK_net : STD_LOGIC;
  signal axi_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_BREADY : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_BVALID : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_WLAST : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_WREADY : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_AWVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_BREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_BVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_WLAST : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_WREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_WVALID : STD_LOGIC;
begin
  M00_AXI_awaddr(31 downto 0) <= s00_couplers_to_axi_interconnect_0_AWADDR(31 downto 0);
  M00_AXI_awburst(1 downto 0) <= s00_couplers_to_axi_interconnect_0_AWBURST(1 downto 0);
  M00_AXI_awcache(3 downto 0) <= s00_couplers_to_axi_interconnect_0_AWCACHE(3 downto 0);
  M00_AXI_awlen(3 downto 0) <= s00_couplers_to_axi_interconnect_0_AWLEN(3 downto 0);
  M00_AXI_awlock(1 downto 0) <= s00_couplers_to_axi_interconnect_0_AWLOCK(1 downto 0);
  M00_AXI_awprot(2 downto 0) <= s00_couplers_to_axi_interconnect_0_AWPROT(2 downto 0);
  M00_AXI_awqos(3 downto 0) <= s00_couplers_to_axi_interconnect_0_AWQOS(3 downto 0);
  M00_AXI_awsize(2 downto 0) <= s00_couplers_to_axi_interconnect_0_AWSIZE(2 downto 0);
  M00_AXI_awvalid <= s00_couplers_to_axi_interconnect_0_AWVALID;
  M00_AXI_bready <= s00_couplers_to_axi_interconnect_0_BREADY;
  M00_AXI_wdata(31 downto 0) <= s00_couplers_to_axi_interconnect_0_WDATA(31 downto 0);
  M00_AXI_wlast <= s00_couplers_to_axi_interconnect_0_WLAST;
  M00_AXI_wstrb(3 downto 0) <= s00_couplers_to_axi_interconnect_0_WSTRB(3 downto 0);
  M00_AXI_wvalid <= s00_couplers_to_axi_interconnect_0_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_awready <= axi_interconnect_0_to_s00_couplers_AWREADY;
  S00_AXI_bresp(1 downto 0) <= axi_interconnect_0_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= axi_interconnect_0_to_s00_couplers_BVALID;
  S00_AXI_wready <= axi_interconnect_0_to_s00_couplers_WREADY;
  axi_interconnect_0_ACLK_net <= M00_ACLK;
  axi_interconnect_0_ARESETN_net <= M00_ARESETN;
  axi_interconnect_0_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  axi_interconnect_0_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  axi_interconnect_0_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  axi_interconnect_0_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  axi_interconnect_0_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  axi_interconnect_0_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  axi_interconnect_0_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  axi_interconnect_0_to_s00_couplers_BREADY <= S00_AXI_bready;
  axi_interconnect_0_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  axi_interconnect_0_to_s00_couplers_WLAST <= S00_AXI_wlast;
  axi_interconnect_0_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  axi_interconnect_0_to_s00_couplers_WVALID <= S00_AXI_wvalid;
  s00_couplers_to_axi_interconnect_0_AWREADY <= M00_AXI_awready;
  s00_couplers_to_axi_interconnect_0_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  s00_couplers_to_axi_interconnect_0_BVALID <= M00_AXI_bvalid;
  s00_couplers_to_axi_interconnect_0_WREADY <= M00_AXI_wready;
s00_couplers: entity work.s00_couplers_imp_1IAW1WV
     port map (
      M_ACLK => axi_interconnect_0_ACLK_net,
      M_ARESETN => axi_interconnect_0_ARESETN_net,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_axi_interconnect_0_AWADDR(31 downto 0),
      M_AXI_awburst(1 downto 0) => s00_couplers_to_axi_interconnect_0_AWBURST(1 downto 0),
      M_AXI_awcache(3 downto 0) => s00_couplers_to_axi_interconnect_0_AWCACHE(3 downto 0),
      M_AXI_awlen(3 downto 0) => s00_couplers_to_axi_interconnect_0_AWLEN(3 downto 0),
      M_AXI_awlock(1 downto 0) => s00_couplers_to_axi_interconnect_0_AWLOCK(1 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_axi_interconnect_0_AWPROT(2 downto 0),
      M_AXI_awqos(3 downto 0) => s00_couplers_to_axi_interconnect_0_AWQOS(3 downto 0),
      M_AXI_awready => s00_couplers_to_axi_interconnect_0_AWREADY,
      M_AXI_awsize(2 downto 0) => s00_couplers_to_axi_interconnect_0_AWSIZE(2 downto 0),
      M_AXI_awvalid => s00_couplers_to_axi_interconnect_0_AWVALID,
      M_AXI_bready => s00_couplers_to_axi_interconnect_0_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_axi_interconnect_0_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_axi_interconnect_0_BVALID,
      M_AXI_wdata(31 downto 0) => s00_couplers_to_axi_interconnect_0_WDATA(31 downto 0),
      M_AXI_wlast => s00_couplers_to_axi_interconnect_0_WLAST,
      M_AXI_wready => s00_couplers_to_axi_interconnect_0_WREADY,
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_axi_interconnect_0_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_axi_interconnect_0_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_awaddr(31 downto 0) => axi_interconnect_0_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => axi_interconnect_0_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => axi_interconnect_0_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awlen(7 downto 0) => axi_interconnect_0_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awprot(2 downto 0) => axi_interconnect_0_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => axi_interconnect_0_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => axi_interconnect_0_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => axi_interconnect_0_to_s00_couplers_AWVALID,
      S_AXI_bready => axi_interconnect_0_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => axi_interconnect_0_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => axi_interconnect_0_to_s00_couplers_BVALID,
      S_AXI_wdata(31 downto 0) => axi_interconnect_0_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => axi_interconnect_0_to_s00_couplers_WLAST,
      S_AXI_wready => axi_interconnect_0_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => axi_interconnect_0_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => axi_interconnect_0_to_s00_couplers_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_axis_interconnect_0_1 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_AXIS_ACLK : in STD_LOGIC;
    M00_AXIS_ARESETN : in STD_LOGIC;
    M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXIS_tlast : out STD_LOGIC;
    M00_AXIS_tready : in STD_LOGIC;
    M00_AXIS_tvalid : out STD_LOGIC;
    S00_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S00_AXIS_ACLK : in STD_LOGIC;
    S00_AXIS_ARESETN : in STD_LOGIC;
    S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXIS_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXIS_tlast : in STD_LOGIC;
    S00_AXIS_tready : out STD_LOGIC;
    S00_AXIS_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXIS_tvalid : in STD_LOGIC;
    S01_ARB_REQ_SUPPRESS : in STD_LOGIC;
    S01_AXIS_ACLK : in STD_LOGIC;
    S01_AXIS_ARESETN : in STD_LOGIC;
    S01_AXIS_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S01_AXIS_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S01_AXIS_tlast : in STD_LOGIC;
    S01_AXIS_tready : out STD_LOGIC;
    S01_AXIS_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S01_AXIS_tvalid : in STD_LOGIC
  );
end base_zynq_axis_interconnect_0_1;

architecture STRUCTURE of base_zynq_axis_interconnect_0_1 is
  component base_zynq_xbar_7 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tready : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_req_suppress : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_decode_err : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_xbar_7;
  component base_zynq_s_arb_req_suppress_concat_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_s_arb_req_suppress_concat_0;
  signal axis_interconnect_0_ACLK_net : STD_LOGIC;
  signal axis_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TLAST : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TREADY : STD_LOGIC;
  signal axis_interconnect_0_to_s00_couplers_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axis_interconnect_0_to_s00_couplers_TVALID : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axis_interconnect_0_to_s01_couplers_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axis_interconnect_0_to_s01_couplers_TLAST : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TREADY : STD_LOGIC;
  signal axis_interconnect_0_to_s01_couplers_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axis_interconnect_0_to_s01_couplers_TVALID : STD_LOGIC;
  signal m00_couplers_to_axis_interconnect_0_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_axis_interconnect_0_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_axis_interconnect_0_TLAST : STD_LOGIC;
  signal m00_couplers_to_axis_interconnect_0_TREADY : STD_LOGIC;
  signal m00_couplers_to_axis_interconnect_0_TVALID : STD_LOGIC;
  signal s00_arb_req_suppress_to_s_arb_req_suppress_concat : STD_LOGIC;
  signal s00_couplers_to_xbar_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_TLAST : STD_LOGIC;
  signal s00_couplers_to_xbar_TREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_TVALID : STD_LOGIC;
  signal s01_arb_req_suppress_to_s_arb_req_suppress_concat : STD_LOGIC;
  signal s01_couplers_to_xbar_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s01_couplers_to_xbar_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s01_couplers_to_xbar_TLAST : STD_LOGIC;
  signal s01_couplers_to_xbar_TREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal s01_couplers_to_xbar_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s01_couplers_to_xbar_TVALID : STD_LOGIC;
  signal s_arb_req_suppress_concat_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_TREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_TVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_xbar_s_decode_err_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  M00_AXIS_tdata(31 downto 0) <= m00_couplers_to_axis_interconnect_0_TDATA(31 downto 0);
  M00_AXIS_tkeep(3 downto 0) <= m00_couplers_to_axis_interconnect_0_TKEEP(3 downto 0);
  M00_AXIS_tlast <= m00_couplers_to_axis_interconnect_0_TLAST;
  M00_AXIS_tvalid <= m00_couplers_to_axis_interconnect_0_TVALID;
  S00_AXIS_tready <= axis_interconnect_0_to_s00_couplers_TREADY;
  S01_AXIS_tready <= axis_interconnect_0_to_s01_couplers_TREADY;
  axis_interconnect_0_ACLK_net <= ACLK;
  axis_interconnect_0_ARESETN_net <= ARESETN;
  axis_interconnect_0_to_s00_couplers_TDATA(31 downto 0) <= S00_AXIS_tdata(31 downto 0);
  axis_interconnect_0_to_s00_couplers_TID(1 downto 0) <= S00_AXIS_tid(1 downto 0);
  axis_interconnect_0_to_s00_couplers_TLAST <= S00_AXIS_tlast;
  axis_interconnect_0_to_s00_couplers_TSTRB(3 downto 0) <= S00_AXIS_tstrb(3 downto 0);
  axis_interconnect_0_to_s00_couplers_TVALID <= S00_AXIS_tvalid;
  axis_interconnect_0_to_s01_couplers_TDATA(31 downto 0) <= S01_AXIS_tdata(31 downto 0);
  axis_interconnect_0_to_s01_couplers_TID(1 downto 0) <= S01_AXIS_tid(1 downto 0);
  axis_interconnect_0_to_s01_couplers_TLAST <= S01_AXIS_tlast;
  axis_interconnect_0_to_s01_couplers_TSTRB(3 downto 0) <= S01_AXIS_tstrb(3 downto 0);
  axis_interconnect_0_to_s01_couplers_TVALID <= S01_AXIS_tvalid;
  m00_couplers_to_axis_interconnect_0_TREADY <= M00_AXIS_tready;
  s00_arb_req_suppress_to_s_arb_req_suppress_concat <= S00_ARB_REQ_SUPPRESS;
  s01_arb_req_suppress_to_s_arb_req_suppress_concat <= S01_ARB_REQ_SUPPRESS;
m00_couplers: entity work.m00_couplers_imp_DSJXWU
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => m00_couplers_to_axis_interconnect_0_TDATA(31 downto 0),
      M_AXIS_tkeep(3 downto 0) => m00_couplers_to_axis_interconnect_0_TKEEP(3 downto 0),
      M_AXIS_tlast => m00_couplers_to_axis_interconnect_0_TLAST,
      M_AXIS_tready => m00_couplers_to_axis_interconnect_0_TREADY,
      M_AXIS_tvalid => m00_couplers_to_axis_interconnect_0_TVALID,
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => xbar_to_m00_couplers_TDATA(31 downto 0),
      S_AXIS_tid(1 downto 0) => xbar_to_m00_couplers_TID(1 downto 0),
      S_AXIS_tlast => xbar_to_m00_couplers_TLAST(0),
      S_AXIS_tready => xbar_to_m00_couplers_TREADY,
      S_AXIS_tstrb(3 downto 0) => xbar_to_m00_couplers_TSTRB(3 downto 0),
      S_AXIS_tvalid => xbar_to_m00_couplers_TVALID(0)
    );
s00_couplers: entity work.s00_couplers_imp_1B288QA
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => s00_couplers_to_xbar_TDATA(31 downto 0),
      M_AXIS_tid(1 downto 0) => s00_couplers_to_xbar_TID(1 downto 0),
      M_AXIS_tlast => s00_couplers_to_xbar_TLAST,
      M_AXIS_tready => s00_couplers_to_xbar_TREADY(0),
      M_AXIS_tstrb(3 downto 0) => s00_couplers_to_xbar_TSTRB(3 downto 0),
      M_AXIS_tvalid => s00_couplers_to_xbar_TVALID,
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => axis_interconnect_0_to_s00_couplers_TDATA(31 downto 0),
      S_AXIS_tid(1 downto 0) => axis_interconnect_0_to_s00_couplers_TID(1 downto 0),
      S_AXIS_tlast => axis_interconnect_0_to_s00_couplers_TLAST,
      S_AXIS_tready => axis_interconnect_0_to_s00_couplers_TREADY,
      S_AXIS_tstrb(3 downto 0) => axis_interconnect_0_to_s00_couplers_TSTRB(3 downto 0),
      S_AXIS_tvalid => axis_interconnect_0_to_s00_couplers_TVALID
    );
s01_couplers: entity work.s01_couplers_imp_Z3K9KA
     port map (
      M_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      M_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      M_AXIS_tdata(31 downto 0) => s01_couplers_to_xbar_TDATA(31 downto 0),
      M_AXIS_tid(1 downto 0) => s01_couplers_to_xbar_TID(1 downto 0),
      M_AXIS_tlast => s01_couplers_to_xbar_TLAST,
      M_AXIS_tready => s01_couplers_to_xbar_TREADY(1),
      M_AXIS_tstrb(3 downto 0) => s01_couplers_to_xbar_TSTRB(3 downto 0),
      M_AXIS_tvalid => s01_couplers_to_xbar_TVALID,
      S_AXIS_ACLK => axis_interconnect_0_ACLK_net,
      S_AXIS_ARESETN => axis_interconnect_0_ARESETN_net,
      S_AXIS_tdata(31 downto 0) => axis_interconnect_0_to_s01_couplers_TDATA(31 downto 0),
      S_AXIS_tid(1 downto 0) => axis_interconnect_0_to_s01_couplers_TID(1 downto 0),
      S_AXIS_tlast => axis_interconnect_0_to_s01_couplers_TLAST,
      S_AXIS_tready => axis_interconnect_0_to_s01_couplers_TREADY,
      S_AXIS_tstrb(3 downto 0) => axis_interconnect_0_to_s01_couplers_TSTRB(3 downto 0),
      S_AXIS_tvalid => axis_interconnect_0_to_s01_couplers_TVALID
    );
s_arb_req_suppress_concat: component base_zynq_s_arb_req_suppress_concat_0
     port map (
      In0(0) => s00_arb_req_suppress_to_s_arb_req_suppress_concat,
      In1(0) => s01_arb_req_suppress_to_s_arb_req_suppress_concat,
      dout(1 downto 0) => s_arb_req_suppress_concat_dout(1 downto 0)
    );
xbar: component base_zynq_xbar_7
     port map (
      aclk => axis_interconnect_0_ACLK_net,
      aresetn => axis_interconnect_0_ARESETN_net,
      m_axis_tdata(31 downto 0) => xbar_to_m00_couplers_TDATA(31 downto 0),
      m_axis_tid(1 downto 0) => xbar_to_m00_couplers_TID(1 downto 0),
      m_axis_tlast(0) => xbar_to_m00_couplers_TLAST(0),
      m_axis_tready(0) => xbar_to_m00_couplers_TREADY,
      m_axis_tstrb(3 downto 0) => xbar_to_m00_couplers_TSTRB(3 downto 0),
      m_axis_tvalid(0) => xbar_to_m00_couplers_TVALID(0),
      s_axis_tdata(63 downto 32) => s01_couplers_to_xbar_TDATA(31 downto 0),
      s_axis_tdata(31 downto 0) => s00_couplers_to_xbar_TDATA(31 downto 0),
      s_axis_tid(3 downto 2) => s01_couplers_to_xbar_TID(1 downto 0),
      s_axis_tid(1 downto 0) => s00_couplers_to_xbar_TID(1 downto 0),
      s_axis_tlast(1) => s01_couplers_to_xbar_TLAST,
      s_axis_tlast(0) => s00_couplers_to_xbar_TLAST,
      s_axis_tready(1) => s01_couplers_to_xbar_TREADY(1),
      s_axis_tready(0) => s00_couplers_to_xbar_TREADY(0),
      s_axis_tstrb(7 downto 4) => s01_couplers_to_xbar_TSTRB(3 downto 0),
      s_axis_tstrb(3 downto 0) => s00_couplers_to_xbar_TSTRB(3 downto 0),
      s_axis_tvalid(1) => s01_couplers_to_xbar_TVALID,
      s_axis_tvalid(0) => s00_couplers_to_xbar_TVALID,
      s_decode_err(1 downto 0) => NLW_xbar_s_decode_err_UNCONNECTED(1 downto 0),
      s_req_suppress(1 downto 0) => s_arb_req_suppress_concat_dout(1 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq_ps7_0_axi_periph_1 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M01_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M03_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end base_zynq_ps7_0_axi_periph_1;

architecture STRUCTURE of base_zynq_ps7_0_axi_periph_1 is
  component base_zynq_xbar_8 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component base_zynq_xbar_8;
  signal M00_ACLK_1 : STD_LOGIC;
  signal M00_ARESETN_1 : STD_LOGIC;
  signal M01_ACLK_1 : STD_LOGIC;
  signal M01_ARESETN_1 : STD_LOGIC;
  signal M02_ACLK_1 : STD_LOGIC;
  signal M02_ARESETN_1 : STD_LOGIC;
  signal M03_ACLK_1 : STD_LOGIC;
  signal M03_ARESETN_1 : STD_LOGIC;
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m01_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal m02_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m02_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_ARREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_ARVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_AWREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_AWVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_BREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_BVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_RREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_RVALID : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_WREADY : STD_LOGIC;
  signal m03_couplers_to_ps7_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m03_couplers_to_ps7_0_axi_periph_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_ACLK_net : STD_LOGIC;
  signal ps7_0_axi_periph_ARESETN_net : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_ARPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_AWPROT : STD_LOGIC_VECTOR ( 11 downto 9 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WSTRB : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
begin
  M00_ACLK_1 <= M00_ACLK;
  M00_ARESETN_1 <= M00_ARESETN;
  M00_AXI_araddr(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_ps7_0_axi_periph_ARVALID;
  M00_AXI_awaddr(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_ps7_0_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_ps7_0_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_ps7_0_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_ps7_0_axi_periph_WVALID;
  M01_ACLK_1 <= M01_ACLK;
  M01_ARESETN_1 <= M01_ARESETN;
  M01_AXI_araddr(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M01_AXI_arvalid(0) <= m01_couplers_to_ps7_0_axi_periph_ARVALID(0);
  M01_AXI_awaddr(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M01_AXI_awvalid(0) <= m01_couplers_to_ps7_0_axi_periph_AWVALID(0);
  M01_AXI_bready(0) <= m01_couplers_to_ps7_0_axi_periph_BREADY(0);
  M01_AXI_rready(0) <= m01_couplers_to_ps7_0_axi_periph_RREADY(0);
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M01_AXI_wvalid(0) <= m01_couplers_to_ps7_0_axi_periph_WVALID(0);
  M02_ACLK_1 <= M02_ACLK;
  M02_ARESETN_1 <= M02_ARESETN;
  M02_AXI_araddr(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M02_AXI_arprot(2 downto 0) <= m02_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_ps7_0_axi_periph_ARVALID;
  M02_AXI_awaddr(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M02_AXI_awprot(2 downto 0) <= m02_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_ps7_0_axi_periph_AWVALID;
  M02_AXI_bready <= m02_couplers_to_ps7_0_axi_periph_BREADY;
  M02_AXI_rready <= m02_couplers_to_ps7_0_axi_periph_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_ps7_0_axi_periph_WVALID;
  M03_ACLK_1 <= M03_ACLK;
  M03_ARESETN_1 <= M03_ARESETN;
  M03_AXI_araddr(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0);
  M03_AXI_arprot(2 downto 0) <= m03_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_ps7_0_axi_periph_ARVALID;
  M03_AXI_awaddr(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0);
  M03_AXI_awprot(2 downto 0) <= m03_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_ps7_0_axi_periph_AWVALID;
  M03_AXI_bready <= m03_couplers_to_ps7_0_axi_periph_BREADY;
  M03_AXI_rready <= m03_couplers_to_ps7_0_axi_periph_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0);
  M03_AXI_wstrb(3 downto 0) <= m03_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_ps7_0_axi_periph_WVALID;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= ps7_0_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= ps7_0_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(11 downto 0) <= ps7_0_axi_periph_to_s00_couplers_BID(11 downto 0);
  S00_AXI_bresp(1 downto 0) <= ps7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= ps7_0_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(11 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RID(11 downto 0);
  S00_AXI_rlast <= ps7_0_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= ps7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= ps7_0_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= ps7_0_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_ps7_0_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_ps7_0_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_ps7_0_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_ps7_0_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_ps7_0_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_ps7_0_axi_periph_ARREADY(0) <= M01_AXI_arready(0);
  m01_couplers_to_ps7_0_axi_periph_AWREADY(0) <= M01_AXI_awready(0);
  m01_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_ps7_0_axi_periph_BVALID(0) <= M01_AXI_bvalid(0);
  m01_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_ps7_0_axi_periph_RVALID(0) <= M01_AXI_rvalid(0);
  m01_couplers_to_ps7_0_axi_periph_WREADY(0) <= M01_AXI_wready(0);
  m02_couplers_to_ps7_0_axi_periph_ARREADY <= M02_AXI_arready;
  m02_couplers_to_ps7_0_axi_periph_AWREADY <= M02_AXI_awready;
  m02_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_ps7_0_axi_periph_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_ps7_0_axi_periph_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_ps7_0_axi_periph_WREADY <= M02_AXI_wready;
  m03_couplers_to_ps7_0_axi_periph_ARREADY <= M03_AXI_arready;
  m03_couplers_to_ps7_0_axi_periph_AWREADY <= M03_AXI_awready;
  m03_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_ps7_0_axi_periph_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_ps7_0_axi_periph_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_ps7_0_axi_periph_WREADY <= M03_AXI_wready;
  ps7_0_axi_periph_ACLK_net <= ACLK;
  ps7_0_axi_periph_ARESETN_net <= ARESETN;
  ps7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARID(11 downto 0) <= S00_AXI_arid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0) <= S00_AXI_arlen(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0) <= S00_AXI_arlock(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  ps7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0) <= S00_AXI_awaddr(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWID(11 downto 0) <= S00_AXI_awid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0) <= S00_AXI_awlen(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0) <= S00_AXI_awlock(1 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  ps7_0_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  ps7_0_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  ps7_0_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  ps7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WID(11 downto 0) <= S00_AXI_wid(11 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  ps7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  ps7_0_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_QHT96L
     port map (
      M_ACLK => M00_ACLK_1,
      M_ARESETN => M00_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m00_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m00_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_11WP2HX
     port map (
      M_ACLK => M01_ACLK_1,
      M_ARESETN => M01_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arready(0) => m01_couplers_to_ps7_0_axi_periph_ARREADY(0),
      M_AXI_arvalid(0) => m01_couplers_to_ps7_0_axi_periph_ARVALID(0),
      M_AXI_awaddr(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awready(0) => m01_couplers_to_ps7_0_axi_periph_AWREADY(0),
      M_AXI_awvalid(0) => m01_couplers_to_ps7_0_axi_periph_AWVALID(0),
      M_AXI_bready(0) => m01_couplers_to_ps7_0_axi_periph_BREADY(0),
      M_AXI_bresp(1 downto 0) => m01_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid(0) => m01_couplers_to_ps7_0_axi_periph_BVALID(0),
      M_AXI_rdata(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready(0) => m01_couplers_to_ps7_0_axi_periph_RREADY(0),
      M_AXI_rresp(1 downto 0) => m01_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid(0) => m01_couplers_to_ps7_0_axi_periph_RVALID(0),
      M_AXI_wdata(31 downto 0) => m01_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready(0) => m01_couplers_to_ps7_0_axi_periph_WREADY(0),
      M_AXI_wvalid(0) => m01_couplers_to_ps7_0_axi_periph_WVALID(0),
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      S_AXI_arready(0) => xbar_to_m01_couplers_ARREADY(0),
      S_AXI_arvalid(0) => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(31 downto 0) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      S_AXI_awready(0) => xbar_to_m01_couplers_AWREADY(0),
      S_AXI_awvalid(0) => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready(0) => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid(0) => xbar_to_m01_couplers_BVALID(0),
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready(0) => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid(0) => xbar_to_m01_couplers_RVALID(0),
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready(0) => xbar_to_m01_couplers_WREADY(0),
      S_AXI_wvalid(0) => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_C5D3YK
     port map (
      M_ACLK => M02_ACLK_1,
      M_ARESETN => M02_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m02_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m02_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m02_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m02_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m02_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m02_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m02_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m02_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(31 downto 0) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1XYV0GK
     port map (
      M_ACLK => M03_ACLK_1,
      M_ARESETN => M03_ARESETN_1,
      M_AXI_araddr(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => m03_couplers_to_ps7_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m03_couplers_to_ps7_0_axi_periph_ARREADY,
      M_AXI_arvalid => m03_couplers_to_ps7_0_axi_periph_ARVALID,
      M_AXI_awaddr(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => m03_couplers_to_ps7_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m03_couplers_to_ps7_0_axi_periph_AWREADY,
      M_AXI_awvalid => m03_couplers_to_ps7_0_axi_periph_AWVALID,
      M_AXI_bready => m03_couplers_to_ps7_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_ps7_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_ps7_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_ps7_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_ps7_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_ps7_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_ps7_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_ps7_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m03_couplers_to_ps7_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m03_couplers_to_ps7_0_axi_periph_WVALID,
      S_ACLK => ps7_0_axi_periph_ACLK_net,
      S_ARESETN => ps7_0_axi_periph_ARESETN_net,
      S_AXI_araddr(31 downto 0) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      S_AXI_arprot(2 downto 0) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(31 downto 0) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      S_AXI_awprot(2 downto 0) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
s00_couplers: entity work.s00_couplers_imp_1JB4A1T
     port map (
      M_ACLK => ps7_0_axi_periph_ACLK_net,
      M_ARESETN => ps7_0_axi_periph_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARID(11 downto 0),
      S_AXI_arlen(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARLEN(3 downto 0),
      S_AXI_arlock(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARLOCK(1 downto 0),
      S_AXI_arprot(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => ps7_0_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => ps7_0_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWADDR(31 downto 0),
      S_AXI_awburst(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWID(11 downto 0),
      S_AXI_awlen(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWLEN(3 downto 0),
      S_AXI_awlock(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWLOCK(1 downto 0),
      S_AXI_awprot(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => ps7_0_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => ps7_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => ps7_0_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_BID(11 downto 0),
      S_AXI_bready => ps7_0_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => ps7_0_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_RID(11 downto 0),
      S_AXI_rlast => ps7_0_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => ps7_0_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => ps7_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => ps7_0_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => ps7_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wid(11 downto 0) => ps7_0_axi_periph_to_s00_couplers_WID(11 downto 0),
      S_AXI_wlast => ps7_0_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => ps7_0_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => ps7_0_axi_periph_to_s00_couplers_WVALID
    );
xbar: component base_zynq_xbar_8
     port map (
      aclk => ps7_0_axi_periph_ACLK_net,
      aresetn => ps7_0_axi_periph_ARESETN_net,
      m_axi_araddr(127 downto 96) => xbar_to_m03_couplers_ARADDR(127 downto 96),
      m_axi_araddr(95 downto 64) => xbar_to_m02_couplers_ARADDR(95 downto 64),
      m_axi_araddr(63 downto 32) => xbar_to_m01_couplers_ARADDR(63 downto 32),
      m_axi_araddr(31 downto 0) => xbar_to_m00_couplers_ARADDR(31 downto 0),
      m_axi_arprot(11 downto 9) => xbar_to_m03_couplers_ARPROT(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => NLW_xbar_m_axi_arprot_UNCONNECTED(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY(0),
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(127 downto 96) => xbar_to_m03_couplers_AWADDR(127 downto 96),
      m_axi_awaddr(95 downto 64) => xbar_to_m02_couplers_AWADDR(95 downto 64),
      m_axi_awaddr(63 downto 32) => xbar_to_m01_couplers_AWADDR(63 downto 32),
      m_axi_awaddr(31 downto 0) => xbar_to_m00_couplers_AWADDR(31 downto 0),
      m_axi_awprot(11 downto 9) => xbar_to_m03_couplers_AWPROT(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => NLW_xbar_m_axi_awprot_UNCONNECTED(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY(0),
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID(0),
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID(0),
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY(0),
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(15 downto 12) => xbar_to_m03_couplers_WSTRB(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => NLW_xbar_m_axi_wstrb_UNCONNECTED(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(31 downto 0) => s00_couplers_to_xbar_ARADDR(31 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(31 downto 0) => s00_couplers_to_xbar_AWADDR(31 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_zynq is
  port (
    A_DONE : in STD_LOGIC;
    A_DO_1 : in STD_LOGIC;
    A_DO_10 : in STD_LOGIC;
    A_DO_11 : in STD_LOGIC;
    A_DO_12 : in STD_LOGIC;
    A_DO_13 : in STD_LOGIC;
    A_DO_14 : in STD_LOGIC;
    A_DO_15 : in STD_LOGIC;
    A_DO_16 : in STD_LOGIC;
    A_DO_2 : in STD_LOGIC;
    A_DO_3 : in STD_LOGIC;
    A_DO_4 : in STD_LOGIC;
    A_DO_5 : in STD_LOGIC;
    A_DO_6 : in STD_LOGIC;
    A_DO_7 : in STD_LOGIC;
    A_DO_8 : in STD_LOGIC;
    A_DO_9 : in STD_LOGIC;
    A_GCC_RESET : out STD_LOGIC;
    A_HSCLK_N : out STD_LOGIC;
    A_HSCLK_P : out STD_LOGIC;
    A_PCLK : out STD_LOGIC;
    A_RAMP : out STD_LOGIC;
    A_RDAD_CLK : out STD_LOGIC;
    A_RDAD_DIR : out STD_LOGIC;
    A_RDAD_SIN : out STD_LOGIC;
    A_SAMPLESEL_ANY : out STD_LOGIC;
    A_SHOUT : in STD_LOGIC;
    A_SS_INCR : out STD_LOGIC;
    A_SS_LD_DIR : out STD_LOGIC;
    A_SS_LD_SIN : out STD_LOGIC;
    A_SS_RESET : out STD_LOGIC;
    A_TRIG1 : in STD_LOGIC;
    A_TRIG2 : in STD_LOGIC;
    A_TRIG3 : in STD_LOGIC;
    A_TRIG4 : in STD_LOGIC;
    A_WR_CS_S0 : out STD_LOGIC;
    A_WR_CS_S1 : out STD_LOGIC;
    A_WR_CS_S2 : out STD_LOGIC;
    A_WR_CS_S3 : out STD_LOGIC;
    A_WR_CS_S4 : out STD_LOGIC;
    A_WR_CS_S5 : out STD_LOGIC;
    A_WR_RS_S0 : out STD_LOGIC;
    A_WR_RS_S1 : out STD_LOGIC;
    B_DONE : in STD_LOGIC;
    B_DO_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_DO_9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    B_GCC_RESET : out STD_LOGIC;
    B_HSCLK_N : out STD_LOGIC;
    B_HSCLK_P : out STD_LOGIC;
    B_PCLK : out STD_LOGIC;
    B_RAMP : out STD_LOGIC;
    B_RDAD_CLK : out STD_LOGIC;
    B_RDAD_DIR : out STD_LOGIC;
    B_RDAD_SIN : out STD_LOGIC;
    B_SAMPLESEL_ANY : out STD_LOGIC;
    B_SHOUT : in STD_LOGIC;
    B_SS_INCR : out STD_LOGIC;
    B_SS_LD_DIR : out STD_LOGIC;
    B_SS_LD_SIN : out STD_LOGIC;
    B_SS_RESET : out STD_LOGIC;
    B_TRIG1 : in STD_LOGIC;
    B_TRIG2 : in STD_LOGIC;
    B_TRIG3 : in STD_LOGIC;
    B_TRIG4 : in STD_LOGIC;
    B_WR_CS_S0 : out STD_LOGIC;
    B_WR_CS_S1 : out STD_LOGIC;
    B_WR_CS_S2 : out STD_LOGIC;
    B_WR_CS_S3 : out STD_LOGIC;
    B_WR_CS_S4 : out STD_LOGIC;
    B_WR_CS_S5 : out STD_LOGIC;
    B_WR_RS_S0 : out STD_LOGIC;
    B_WR_RS_S1 : out STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    SIN : out STD_LOGIC;
    SSTIN_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    SSTIN_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    WL_CLK_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    WL_CLK_P : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of base_zynq : entity is "base_zynq,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=base_zynq,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=40,numReposBlks=28,numNonXlnxBlks=3,numHierBlks=12,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=10,da_board_cnt=3,da_clkrst_cnt=9,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of base_zynq : entity is "base_zynq.hwdef";
end base_zynq;

architecture STRUCTURE of base_zynq is
  component base_zynq_axi_dma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component base_zynq_axi_dma_0_0;
  component base_zynq_processing_system7_0_0 is
  port (
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARREADY : out STD_LOGIC;
    S_AXI_HP0_AWREADY : out STD_LOGIC;
    S_AXI_HP0_BVALID : out STD_LOGIC;
    S_AXI_HP0_RLAST : out STD_LOGIC;
    S_AXI_HP0_RVALID : out STD_LOGIC;
    S_AXI_HP0_WREADY : out STD_LOGIC;
    S_AXI_HP0_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_BID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RID : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_RCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_WCOUNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_HP0_RACOUNT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_WACOUNT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_ACLK : in STD_LOGIC;
    S_AXI_HP0_ARVALID : in STD_LOGIC;
    S_AXI_HP0_AWVALID : in STD_LOGIC;
    S_AXI_HP0_BREADY : in STD_LOGIC;
    S_AXI_HP0_RDISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_RREADY : in STD_LOGIC;
    S_AXI_HP0_WLAST : in STD_LOGIC;
    S_AXI_HP0_WRISSUECAP1_EN : in STD_LOGIC;
    S_AXI_HP0_WVALID : in STD_LOGIC;
    S_AXI_HP0_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWLOCK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_HP0_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_HP0_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWLEN : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_HP0_ARID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_AWID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_HP0_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_HP0_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    IRQ_F2P : in STD_LOGIC_VECTOR ( 2 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component base_zynq_processing_system7_0_0;
  component base_zynq_rst_ps7_0_50M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component base_zynq_rst_ps7_0_50M_0;
  component base_zynq_util_ds_buf_0_0 is
  port (
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component base_zynq_util_ds_buf_0_0;
  component base_zynq_util_ds_buf_1_0 is
  port (
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component base_zynq_util_ds_buf_1_0;
  component base_zynq_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component base_zynq_xlconcat_0_0;
  component base_zynq_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component base_zynq_xlconcat_1_0;
  component base_zynq_xlconcat_2_6 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In13 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component base_zynq_xlconcat_2_6;
  component base_zynq_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_xlconstant_0_0;
  component base_zynq_xlconstant_1_6 is
  port (
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component base_zynq_xlconstant_1_6;
  component base_zynq_xlconstant_2_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component base_zynq_xlconstant_2_0;
  component base_zynq_TARGETC_axi_int_0_0 is
  port (
    SW_nRST : in STD_LOGIC;
    TestStream : in STD_LOGIC;
    FIFOvalid : in STD_LOGIC;
    FIFOdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : out STD_LOGIC;
    Cnt_AXIS_DATA : out STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : in STD_LOGIC;
    TID : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_TVALID : out STD_LOGIC;
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_TDEST : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXIS_TLAST : out STD_LOGIC;
    M_AXIS_TID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_TREADY : in STD_LOGIC
  );
  end component base_zynq_TARGETC_axi_int_0_0;
  component base_zynq_TARGETC_axi_int_1_0 is
  port (
    SW_nRST : in STD_LOGIC;
    TestStream : in STD_LOGIC;
    FIFOvalid : in STD_LOGIC;
    FIFOdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : out STD_LOGIC;
    Cnt_AXIS_DATA : out STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : in STD_LOGIC;
    TID : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_ACLK : in STD_LOGIC;
    M_AXIS_ARESETN : in STD_LOGIC;
    M_AXIS_TVALID : out STD_LOGIC;
    M_AXIS_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXIS_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXIS_TDEST : out STD_LOGIC_VECTOR ( 9 downto 0 );
    M_AXIS_TLAST : out STD_LOGIC;
    M_AXIS_TID : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXIS_TREADY : in STD_LOGIC
  );
  end component base_zynq_TARGETC_axi_int_1_0;
  component base_zynq_xlconstant_3_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component base_zynq_xlconstant_3_0;
  component base_zynq_xlconstant_4_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component base_zynq_xlconstant_4_0;
  component base_zynq_Start_digitization_ip_0_0 is
  port (
    startDig_out : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  end component base_zynq_Start_digitization_ip_0_0;
  component base_zynq_TARGET_C_TopLevel_Sy_0_0 is
  port (
    SW_nRST : out STD_LOGIC;
    RefCLK_i1 : in STD_LOGIC;
    RefCLK_i2 : in STD_LOGIC;
    tc_axi_aclk : in STD_LOGIC;
    tc_axi_aresetn : in STD_LOGIC;
    tc_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_awvalid : in STD_LOGIC;
    tc_axi_awready : out STD_LOGIC;
    tc_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tc_axi_wvalid : in STD_LOGIC;
    tc_axi_wready : out STD_LOGIC;
    tc_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_bvalid : out STD_LOGIC;
    tc_axi_bready : in STD_LOGIC;
    tc_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_arvalid : in STD_LOGIC;
    tc_axi_arready : out STD_LOGIC;
    tc_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_rvalid : out STD_LOGIC;
    tc_axi_rready : in STD_LOGIC;
    SIN : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    PCLK : out STD_LOGIC;
    SHOUT : in STD_LOGIC;
    HSCLK_P : out STD_LOGIC;
    HSCLK_N : out STD_LOGIC;
    WR_RS_S0 : out STD_LOGIC;
    WR_RS_S1 : out STD_LOGIC;
    WR_CS_S0 : out STD_LOGIC;
    WR_CS_S1 : out STD_LOGIC;
    WR_CS_S2 : out STD_LOGIC;
    WR_CS_S3 : out STD_LOGIC;
    WR_CS_S4 : out STD_LOGIC;
    WR_CS_S5 : out STD_LOGIC;
    GCC_RESET : out STD_LOGIC;
    WLCLK : out STD_LOGIC;
    RDAD_CLK : out STD_LOGIC;
    RDAD_SIN : out STD_LOGIC;
    RDAD_DIR : out STD_LOGIC;
    SAMPLESEL_ANY : out STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SS_INCR : out STD_LOGIC;
    DOE : out STD_LOGIC;
    DONE : in STD_LOGIC;
    SS_RESET : out STD_LOGIC;
    REGCLR : out STD_LOGIC;
    SS_LD_SIN : out STD_LOGIC;
    SS_LD_DIR : out STD_LOGIC;
    RAMP : out STD_LOGIC;
    SSTIN : out STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    Cnt_AXIS_DATA : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : out STD_LOGIC;
    TestStream : out STD_LOGIC;
    FIFOvalid : out STD_LOGIC;
    FIFOdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : in STD_LOGIC;
    TrigA : in STD_LOGIC;
    TrigB : in STD_LOGIC;
    TrigC : in STD_LOGIC;
    TrigD : in STD_LOGIC;
    WS_masterctrl_in : in STD_LOGIC;
    WS_masterctrl_out : out STD_LOGIC;
    SSVALID_INTR : out STD_LOGIC;
    hmb_trigger : in STD_LOGIC;
    delay_trigger : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sstin_updateBit : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component base_zynq_TARGET_C_TopLevel_Sy_0_0;
  component base_zynq_TARGET_C_TopLevel_Sy_1_6 is
  port (
    SW_nRST : out STD_LOGIC;
    RefCLK_i1 : in STD_LOGIC;
    RefCLK_i2 : in STD_LOGIC;
    tc_axi_aclk : in STD_LOGIC;
    tc_axi_aresetn : in STD_LOGIC;
    tc_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_awvalid : in STD_LOGIC;
    tc_axi_awready : out STD_LOGIC;
    tc_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tc_axi_wvalid : in STD_LOGIC;
    tc_axi_wready : out STD_LOGIC;
    tc_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_bvalid : out STD_LOGIC;
    tc_axi_bready : in STD_LOGIC;
    tc_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tc_axi_arvalid : in STD_LOGIC;
    tc_axi_arready : out STD_LOGIC;
    tc_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tc_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tc_axi_rvalid : out STD_LOGIC;
    tc_axi_rready : in STD_LOGIC;
    SIN : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    PCLK : out STD_LOGIC;
    SHOUT : in STD_LOGIC;
    HSCLK_P : out STD_LOGIC;
    HSCLK_N : out STD_LOGIC;
    WR_RS_S0 : out STD_LOGIC;
    WR_RS_S1 : out STD_LOGIC;
    WR_CS_S0 : out STD_LOGIC;
    WR_CS_S1 : out STD_LOGIC;
    WR_CS_S2 : out STD_LOGIC;
    WR_CS_S3 : out STD_LOGIC;
    WR_CS_S4 : out STD_LOGIC;
    WR_CS_S5 : out STD_LOGIC;
    GCC_RESET : out STD_LOGIC;
    WLCLK : out STD_LOGIC;
    RDAD_CLK : out STD_LOGIC;
    RDAD_SIN : out STD_LOGIC;
    RDAD_DIR : out STD_LOGIC;
    SAMPLESEL_ANY : out STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    SS_INCR : out STD_LOGIC;
    DOE : out STD_LOGIC;
    DONE : in STD_LOGIC;
    SS_RESET : out STD_LOGIC;
    REGCLR : out STD_LOGIC;
    SS_LD_SIN : out STD_LOGIC;
    SS_LD_DIR : out STD_LOGIC;
    RAMP : out STD_LOGIC;
    SSTIN : out STD_LOGIC;
    MONTIMING_P : in STD_LOGIC;
    MONTIMING_N : in STD_LOGIC;
    Cnt_AXIS_DATA : in STD_LOGIC_VECTOR ( 9 downto 0 );
    CNT_CLR : out STD_LOGIC;
    TestStream : out STD_LOGIC;
    FIFOvalid : out STD_LOGIC;
    FIFOdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    StreamReady : in STD_LOGIC;
    TrigA : in STD_LOGIC;
    TrigB : in STD_LOGIC;
    TrigC : in STD_LOGIC;
    TrigD : in STD_LOGIC;
    WS_masterctrl_in : in STD_LOGIC;
    WS_masterctrl_out : out STD_LOGIC;
    SSVALID_INTR : out STD_LOGIC;
    hmb_trigger : in STD_LOGIC;
    delay_trigger : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sstin_updateBit : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component base_zynq_TARGET_C_TopLevel_Sy_1_6;
  signal ARESETN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DONE_1 : STD_LOGIC;
  signal B_DO_10_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_11_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_12_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_14_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_15_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_16_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_2_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_3_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_4_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_5_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_6_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_7_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_8_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_DO_9_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal B_SHOUT_1 : STD_LOGIC;
  signal B_TRIG1_1 : STD_LOGIC;
  signal B_TRIG2_1 : STD_LOGIC;
  signal B_TRIG3_1 : STD_LOGIC;
  signal B_TRIG4_1 : STD_LOGIC;
  signal DONE_1 : STD_LOGIC;
  signal DO_10_1 : STD_LOGIC;
  signal DO_11_1 : STD_LOGIC;
  signal DO_12_1 : STD_LOGIC;
  signal DO_13_1 : STD_LOGIC;
  signal DO_14_1 : STD_LOGIC;
  signal DO_15_1 : STD_LOGIC;
  signal DO_16_1 : STD_LOGIC;
  signal DO_1_1 : STD_LOGIC;
  signal DO_2_1 : STD_LOGIC;
  signal DO_3_1 : STD_LOGIC;
  signal DO_4_1 : STD_LOGIC;
  signal DO_5_1 : STD_LOGIC;
  signal DO_6_1 : STD_LOGIC;
  signal DO_7_1 : STD_LOGIC;
  signal DO_8_1 : STD_LOGIC;
  signal DO_9_1 : STD_LOGIC;
  signal MONTIMING_N_1 : STD_LOGIC;
  signal MONTIMING_P_1 : STD_LOGIC;
  signal S00_AXIS_1_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S00_AXIS_1_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal S00_AXIS_1_TLAST : STD_LOGIC;
  signal S00_AXIS_1_TREADY : STD_LOGIC;
  signal S00_AXIS_1_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal S00_AXIS_1_TVALID : STD_LOGIC;
  signal SHOUT_1 : STD_LOGIC;
  signal Start_digitization_ip_0_startDig_out : STD_LOGIC;
  signal TARGETC_axi_int_0_Cnt_AXIS_DATA : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal TARGETC_axi_int_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal TARGETC_axi_int_0_M00_AXIS_TID : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal TARGETC_axi_int_0_M00_AXIS_TLAST : STD_LOGIC;
  signal TARGETC_axi_int_0_M00_AXIS_TREADY : STD_LOGIC;
  signal TARGETC_axi_int_0_M00_AXIS_TSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal TARGETC_axi_int_0_M00_AXIS_TVALID : STD_LOGIC;
  signal TARGETC_axi_int_0_StreamReady : STD_LOGIC;
  signal TARGETC_axi_int_1_Cnt_AXIS_DATA : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal TARGETC_axi_int_1_StreamReady : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_CNT_CLR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_FIFOdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG : string;
  attribute DEBUG of TARGET_C_TopLevel_Sy_0_FIFOdata : signal is "true";
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of TARGET_C_TopLevel_Sy_0_FIFOdata : signal is std.standard.true;
  signal TARGET_C_TopLevel_Sy_0_FIFOvalid : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_GCC_RESET : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_HSCLK_N : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_HSCLK_P : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_PCLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_RAMP : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_RDAD_CLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_RDAD_DIR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_RDAD_SIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SAMPLESEL_ANY : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SCLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SSTIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SSVALID_INTR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SS_INCR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SS_LD_DIR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SS_LD_SIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SS_RESET : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_SW_nRST : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_TestStream : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WLCLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WL_CLK_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TARGET_C_TopLevel_Sy_0_WL_CLK_P : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S0 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S1 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S2 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S3 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S4 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_CS_S5 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_RS_S0 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WR_RS_S1 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_0_WS_masterctrl_out : STD_LOGIC;
  attribute DEBUG of TARGET_C_TopLevel_Sy_0_WS_masterctrl_out : signal is "true";
  attribute MARK_DEBUG of TARGET_C_TopLevel_Sy_0_WS_masterctrl_out : signal is std.standard.true;
  signal TARGET_C_TopLevel_Sy_1_CNT_CLR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_FIFOdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG of TARGET_C_TopLevel_Sy_1_FIFOdata : signal is "true";
  attribute MARK_DEBUG of TARGET_C_TopLevel_Sy_1_FIFOdata : signal is std.standard.true;
  signal TARGET_C_TopLevel_Sy_1_FIFOvalid : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_GCC_RESET : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_HSCLK_N : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_HSCLK_P : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_PCLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_RAMP : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_RDAD_CLK : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_RDAD_DIR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_RDAD_SIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SAMPLESEL_ANY : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SSVALID_INTR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SS_INCR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SS_LD_DIR : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SS_LD_SIN : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SS_RESET : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_SW_nRST : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_TestStream : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S0 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S1 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S2 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S3 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S4 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_CS_S5 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_RS_S0 : STD_LOGIC;
  signal TARGET_C_TopLevel_Sy_1_WR_RS_S1 : STD_LOGIC;
  signal TRIGA_1 : STD_LOGIC;
  signal TRIGB_1 : STD_LOGIC;
  signal TRIGC_1 : STD_LOGIC;
  signal TRIGD_1 : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_0_s2mm_introut : STD_LOGIC;
  attribute DEBUG of axi_dma_0_s2mm_introut : signal is "true";
  attribute MARK_DEBUG of axi_dma_0_s2mm_introut : signal is std.standard.true;
  signal axi_interconnect_0_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_AWVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_BVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_WLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_WVALID : STD_LOGIC;
  signal axis_interconnect_0_M00_AXIS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TDATA : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TDATA : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TKEEP : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TKEEP : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TLAST : STD_LOGIC;
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TLAST : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TLAST : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TREADY : STD_LOGIC;
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TREADY : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TREADY : signal is std.standard.true;
  signal axis_interconnect_0_M00_AXIS_TVALID : STD_LOGIC;
  attribute DEBUG of axis_interconnect_0_M00_AXIS_TVALID : signal is "true";
  attribute MARK_DEBUG of axis_interconnect_0_M00_AXIS_TVALID : signal is std.standard.true;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_ARVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_M_AXI_GP0_AWVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_BVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal processing_system7_0_M_AXI_GP0_RVALID : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WID : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WLAST : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WREADY : STD_LOGIC;
  signal processing_system7_0_M_AXI_GP0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_M_AXI_GP0_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps7_0_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps7_0_axi_periph_M01_AXI_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps7_0_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps7_0_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M01_AXI_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps7_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_BREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_RREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal ps7_0_axi_periph_M03_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps7_0_axi_periph_M03_AXI_WVALID : STD_LOGIC;
  signal rst_ps7_0_50M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_ds_buf_0_OBUF_DS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_ds_buf_0_OBUF_DS_P : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xlconcat_2_dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xlconstant_4_dout : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_TARGETC_axi_int_0_M_AXIS_TDEST_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_TARGETC_axi_int_1_M_AXIS_TDEST_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_TARGET_C_TopLevel_Sy_0_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_0_REGCLR_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_REGCLR_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_SCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_SIN_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_SSTIN_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_WLCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_TARGET_C_TopLevel_Sy_1_WS_masterctrl_out_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rst_ps7_0_50M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps7_0_50M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps7_0_50M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of A_SS_RESET : signal is "xilinx.com:signal:reset:1.0 RST.A_SS_RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of A_SS_RESET : signal is "XIL_INTERFACENAME RST.A_SS_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of B_GCC_RESET : signal is "xilinx.com:signal:data:1.0 DATA.B_GCC_RESET DATA";
  attribute X_INTERFACE_PARAMETER of B_GCC_RESET : signal is "XIL_INTERFACENAME DATA.B_GCC_RESET, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_HSCLK_N : signal is "xilinx.com:signal:data:1.0 DATA.B_HSCLK_N DATA";
  attribute X_INTERFACE_PARAMETER of B_HSCLK_N : signal is "XIL_INTERFACENAME DATA.B_HSCLK_N, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_HSCLK_P : signal is "xilinx.com:signal:data:1.0 DATA.B_HSCLK_P DATA";
  attribute X_INTERFACE_PARAMETER of B_HSCLK_P : signal is "XIL_INTERFACENAME DATA.B_HSCLK_P, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_RAMP : signal is "xilinx.com:signal:data:1.0 DATA.B_RAMP DATA";
  attribute X_INTERFACE_PARAMETER of B_RAMP : signal is "XIL_INTERFACENAME DATA.B_RAMP, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_RDAD_CLK : signal is "xilinx.com:signal:data:1.0 DATA.B_RDAD_CLK DATA";
  attribute X_INTERFACE_PARAMETER of B_RDAD_CLK : signal is "XIL_INTERFACENAME DATA.B_RDAD_CLK, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_RDAD_DIR : signal is "xilinx.com:signal:data:1.0 DATA.B_RDAD_DIR DATA";
  attribute X_INTERFACE_PARAMETER of B_RDAD_DIR : signal is "XIL_INTERFACENAME DATA.B_RDAD_DIR, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_RDAD_SIN : signal is "xilinx.com:signal:data:1.0 DATA.B_RDAD_SIN DATA";
  attribute X_INTERFACE_PARAMETER of B_RDAD_SIN : signal is "XIL_INTERFACENAME DATA.B_RDAD_SIN, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_SAMPLESEL_ANY : signal is "xilinx.com:signal:data:1.0 DATA.B_SAMPLESEL_ANY DATA";
  attribute X_INTERFACE_PARAMETER of B_SAMPLESEL_ANY : signal is "XIL_INTERFACENAME DATA.B_SAMPLESEL_ANY, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_SS_INCR : signal is "xilinx.com:signal:data:1.0 DATA.B_SS_INCR DATA";
  attribute X_INTERFACE_PARAMETER of B_SS_INCR : signal is "XIL_INTERFACENAME DATA.B_SS_INCR, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_SS_LD_DIR : signal is "xilinx.com:signal:clock:1.0 CLK.B_SS_LD_DIR CLK";
  attribute X_INTERFACE_PARAMETER of B_SS_LD_DIR : signal is "XIL_INTERFACENAME CLK.B_SS_LD_DIR, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of B_SS_LD_SIN : signal is "xilinx.com:signal:clock:1.0 CLK.B_SS_LD_SIN CLK";
  attribute X_INTERFACE_PARAMETER of B_SS_LD_SIN : signal is "XIL_INTERFACENAME CLK.B_SS_LD_SIN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of B_SS_RESET : signal is "xilinx.com:signal:reset:1.0 RST.B_SS_RESET RST";
  attribute X_INTERFACE_PARAMETER of B_SS_RESET : signal is "XIL_INTERFACENAME RST.B_SS_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of B_WR_CS_S0 : signal is "xilinx.com:signal:data:1.0 DATA.B_WR_CS_S0 DATA";
  attribute X_INTERFACE_PARAMETER of B_WR_CS_S0 : signal is "XIL_INTERFACENAME DATA.B_WR_CS_S0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_WR_CS_S1 : signal is "xilinx.com:signal:data:1.0 DATA.B_WR_CS_S1 DATA";
  attribute X_INTERFACE_PARAMETER of B_WR_CS_S1 : signal is "XIL_INTERFACENAME DATA.B_WR_CS_S1, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_WR_CS_S2 : signal is "xilinx.com:signal:data:1.0 DATA.B_WR_CS_S2 DATA";
  attribute X_INTERFACE_PARAMETER of B_WR_CS_S2 : signal is "XIL_INTERFACENAME DATA.B_WR_CS_S2, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_WR_CS_S3 : signal is "xilinx.com:signal:data:1.0 DATA.B_WR_CS_S3 DATA";
  attribute X_INTERFACE_PARAMETER of B_WR_CS_S3 : signal is "XIL_INTERFACENAME DATA.B_WR_CS_S3, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_WR_CS_S4 : signal is "xilinx.com:signal:data:1.0 DATA.B_WR_CS_S4 DATA";
  attribute X_INTERFACE_PARAMETER of B_WR_CS_S4 : signal is "XIL_INTERFACENAME DATA.B_WR_CS_S4, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of DDR_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute X_INTERFACE_INFO of DDR_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute X_INTERFACE_INFO of DDR_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute X_INTERFACE_INFO of DDR_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute X_INTERFACE_INFO of DDR_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute X_INTERFACE_INFO of DDR_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute X_INTERFACE_INFO of DDR_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute X_INTERFACE_INFO of DDR_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute X_INTERFACE_INFO of DDR_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute X_INTERFACE_PARAMETER of FIXED_IO_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of FIXED_IO_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute X_INTERFACE_INFO of FIXED_IO_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute X_INTERFACE_INFO of B_DO_10 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_10 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_10 : signal is "XIL_INTERFACENAME DATA.B_DO_10, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_11 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_11 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_11 : signal is "XIL_INTERFACENAME DATA.B_DO_11, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_13 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_13 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_13 : signal is "XIL_INTERFACENAME DATA.B_DO_13, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_14 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_14 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_14 : signal is "XIL_INTERFACENAME DATA.B_DO_14, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_15 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_15 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_15 : signal is "XIL_INTERFACENAME DATA.B_DO_15, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_16 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_16 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_16 : signal is "XIL_INTERFACENAME DATA.B_DO_16, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_3 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_3 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_3 : signal is "XIL_INTERFACENAME DATA.B_DO_3, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_4 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_4 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_4 : signal is "XIL_INTERFACENAME DATA.B_DO_4, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_5 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_5 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_5 : signal is "XIL_INTERFACENAME DATA.B_DO_5, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_6 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_6 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_6 : signal is "XIL_INTERFACENAME DATA.B_DO_6, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_7 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_7 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_7 : signal is "XIL_INTERFACENAME DATA.B_DO_7, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_8 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_8 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_8 : signal is "XIL_INTERFACENAME DATA.B_DO_8, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_DO_9 : signal is "xilinx.com:signal:data:1.0 DATA.B_DO_9 DATA";
  attribute X_INTERFACE_PARAMETER of B_DO_9 : signal is "XIL_INTERFACENAME DATA.B_DO_9, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of DDR_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute X_INTERFACE_PARAMETER of DDR_addr : signal is "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute X_INTERFACE_INFO of DDR_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute X_INTERFACE_INFO of DDR_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute X_INTERFACE_INFO of DDR_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute X_INTERFACE_INFO of DDR_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute X_INTERFACE_INFO of DDR_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute X_INTERFACE_INFO of FIXED_IO_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  attribute X_INTERFACE_INFO of WL_CLK_N : signal is "xilinx.com:signal:clock:1.0 CLK.WL_CLK_N CLK";
  attribute X_INTERFACE_PARAMETER of WL_CLK_N : signal is "XIL_INTERFACENAME CLK.WL_CLK_N, CLK_DOMAIN base_zynq_util_ds_buf_1_0_OBUF_DS_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of WL_CLK_P : signal is "xilinx.com:signal:clock:1.0 CLK.WL_CLK_P CLK";
  attribute X_INTERFACE_PARAMETER of WL_CLK_P : signal is "XIL_INTERFACENAME CLK.WL_CLK_P, CLK_DOMAIN base_zynq_util_ds_buf_1_0_OBUF_DS_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
begin
  A_GCC_RESET <= TARGET_C_TopLevel_Sy_0_GCC_RESET;
  A_HSCLK_N <= TARGET_C_TopLevel_Sy_0_HSCLK_N;
  A_HSCLK_P <= TARGET_C_TopLevel_Sy_0_HSCLK_P;
  A_PCLK <= TARGET_C_TopLevel_Sy_0_PCLK;
  A_RAMP <= TARGET_C_TopLevel_Sy_0_RAMP;
  A_RDAD_CLK <= TARGET_C_TopLevel_Sy_0_RDAD_CLK;
  A_RDAD_DIR <= TARGET_C_TopLevel_Sy_0_RDAD_DIR;
  A_RDAD_SIN <= TARGET_C_TopLevel_Sy_0_RDAD_SIN;
  A_SAMPLESEL_ANY <= TARGET_C_TopLevel_Sy_0_SAMPLESEL_ANY;
  A_SS_INCR <= TARGET_C_TopLevel_Sy_0_SS_INCR;
  A_SS_LD_DIR <= TARGET_C_TopLevel_Sy_0_SS_LD_DIR;
  A_SS_LD_SIN <= TARGET_C_TopLevel_Sy_0_SS_LD_SIN;
  A_SS_RESET <= TARGET_C_TopLevel_Sy_0_SS_RESET;
  A_WR_CS_S0 <= TARGET_C_TopLevel_Sy_0_WR_CS_S0;
  A_WR_CS_S1 <= TARGET_C_TopLevel_Sy_0_WR_CS_S1;
  A_WR_CS_S2 <= TARGET_C_TopLevel_Sy_0_WR_CS_S2;
  A_WR_CS_S3 <= TARGET_C_TopLevel_Sy_0_WR_CS_S3;
  A_WR_CS_S4 <= TARGET_C_TopLevel_Sy_0_WR_CS_S4;
  A_WR_CS_S5 <= TARGET_C_TopLevel_Sy_0_WR_CS_S5;
  A_WR_RS_S0 <= TARGET_C_TopLevel_Sy_0_WR_RS_S0;
  A_WR_RS_S1 <= TARGET_C_TopLevel_Sy_0_WR_RS_S1;
  B_DONE_1 <= B_DONE;
  B_DO_10_1(0) <= B_DO_10(0);
  B_DO_11_1(0) <= B_DO_11(0);
  B_DO_12_1(0) <= B_DO_12(0);
  B_DO_14_1(0) <= B_DO_14(0);
  B_DO_15_1(0) <= B_DO_15(0);
  B_DO_16_1(0) <= B_DO_16(0);
  B_DO_1_1(0) <= B_DO_1(0);
  B_DO_2_1(0) <= B_DO_2(0);
  B_DO_3_1(0) <= B_DO_3(0);
  B_DO_4_1(0) <= B_DO_4(0);
  B_DO_5_1(0) <= B_DO_5(0);
  B_DO_6_1(0) <= B_DO_6(0);
  B_DO_7_1(0) <= B_DO_7(0);
  B_DO_8_1(0) <= B_DO_8(0);
  B_DO_9_1(0) <= B_DO_9(0);
  B_GCC_RESET <= TARGET_C_TopLevel_Sy_1_GCC_RESET;
  B_HSCLK_N <= TARGET_C_TopLevel_Sy_1_HSCLK_N;
  B_HSCLK_P <= TARGET_C_TopLevel_Sy_1_HSCLK_P;
  B_PCLK <= TARGET_C_TopLevel_Sy_1_PCLK;
  B_RAMP <= TARGET_C_TopLevel_Sy_1_RAMP;
  B_RDAD_CLK <= TARGET_C_TopLevel_Sy_1_RDAD_CLK;
  B_RDAD_DIR <= TARGET_C_TopLevel_Sy_1_RDAD_DIR;
  B_RDAD_SIN <= TARGET_C_TopLevel_Sy_1_RDAD_SIN;
  B_SAMPLESEL_ANY <= TARGET_C_TopLevel_Sy_1_SAMPLESEL_ANY;
  B_SHOUT_1 <= B_SHOUT;
  B_SS_INCR <= TARGET_C_TopLevel_Sy_1_SS_INCR;
  B_SS_LD_DIR <= TARGET_C_TopLevel_Sy_1_SS_LD_DIR;
  B_SS_LD_SIN <= TARGET_C_TopLevel_Sy_1_SS_LD_SIN;
  B_SS_RESET <= TARGET_C_TopLevel_Sy_1_SS_RESET;
  B_TRIG1_1 <= B_TRIG1;
  B_TRIG2_1 <= B_TRIG2;
  B_TRIG3_1 <= B_TRIG3;
  B_TRIG4_1 <= B_TRIG4;
  B_WR_CS_S0 <= TARGET_C_TopLevel_Sy_1_WR_CS_S0;
  B_WR_CS_S1 <= TARGET_C_TopLevel_Sy_1_WR_CS_S1;
  B_WR_CS_S2 <= TARGET_C_TopLevel_Sy_1_WR_CS_S2;
  B_WR_CS_S3 <= TARGET_C_TopLevel_Sy_1_WR_CS_S3;
  B_WR_CS_S4 <= TARGET_C_TopLevel_Sy_1_WR_CS_S4;
  B_WR_CS_S5 <= TARGET_C_TopLevel_Sy_1_WR_CS_S5;
  B_WR_RS_S0 <= TARGET_C_TopLevel_Sy_1_WR_RS_S0;
  B_WR_RS_S1 <= TARGET_C_TopLevel_Sy_1_WR_RS_S1;
  DONE_1 <= A_DONE;
  DO_10_1 <= A_DO_10;
  DO_11_1 <= A_DO_11;
  DO_12_1 <= A_DO_12;
  DO_13_1 <= A_DO_13;
  DO_14_1 <= A_DO_14;
  DO_15_1 <= A_DO_15;
  DO_16_1 <= A_DO_16;
  DO_1_1 <= A_DO_1;
  DO_2_1 <= A_DO_2;
  DO_3_1 <= A_DO_3;
  DO_4_1 <= A_DO_4;
  DO_5_1 <= A_DO_5;
  DO_6_1 <= A_DO_6;
  DO_7_1 <= A_DO_7;
  DO_8_1 <= A_DO_8;
  DO_9_1 <= A_DO_9;
  MONTIMING_N_1 <= MONTIMING_N;
  MONTIMING_P_1 <= MONTIMING_P;
  SCLK <= TARGET_C_TopLevel_Sy_0_SCLK;
  SHOUT_1 <= A_SHOUT;
  SIN <= TARGET_C_TopLevel_Sy_0_SIN;
  SSTIN_N(0) <= util_ds_buf_0_OBUF_DS_N(0);
  SSTIN_P(0) <= util_ds_buf_0_OBUF_DS_P(0);
  TRIGA_1 <= A_TRIG1;
  TRIGB_1 <= A_TRIG2;
  TRIGC_1 <= A_TRIG3;
  TRIGD_1 <= A_TRIG4;
  WL_CLK_N(0) <= TARGET_C_TopLevel_Sy_0_WL_CLK_N(0);
  WL_CLK_P(0) <= TARGET_C_TopLevel_Sy_0_WL_CLK_P(0);
Start_digitization_ip_0: component base_zynq_Start_digitization_ip_0_0
     port map (
      s00_axi_aclk => processing_system7_0_FCLK_CLK0,
      s00_axi_araddr(3 downto 0) => ps7_0_axi_periph_M03_AXI_ARADDR(3 downto 0),
      s00_axi_aresetn => rst_ps7_0_50M_peripheral_aresetn(0),
      s00_axi_arprot(2 downto 0) => ps7_0_axi_periph_M03_AXI_ARPROT(2 downto 0),
      s00_axi_arready => ps7_0_axi_periph_M03_AXI_ARREADY,
      s00_axi_arvalid => ps7_0_axi_periph_M03_AXI_ARVALID,
      s00_axi_awaddr(3 downto 0) => ps7_0_axi_periph_M03_AXI_AWADDR(3 downto 0),
      s00_axi_awprot(2 downto 0) => ps7_0_axi_periph_M03_AXI_AWPROT(2 downto 0),
      s00_axi_awready => ps7_0_axi_periph_M03_AXI_AWREADY,
      s00_axi_awvalid => ps7_0_axi_periph_M03_AXI_AWVALID,
      s00_axi_bready => ps7_0_axi_periph_M03_AXI_BREADY,
      s00_axi_bresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s00_axi_bvalid => ps7_0_axi_periph_M03_AXI_BVALID,
      s00_axi_rdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s00_axi_rready => ps7_0_axi_periph_M03_AXI_RREADY,
      s00_axi_rresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s00_axi_rvalid => ps7_0_axi_periph_M03_AXI_RVALID,
      s00_axi_wdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s00_axi_wready => ps7_0_axi_periph_M03_AXI_WREADY,
      s00_axi_wstrb(3 downto 0) => ps7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      s00_axi_wvalid => ps7_0_axi_periph_M03_AXI_WVALID,
      startDig_out => Start_digitization_ip_0_startDig_out
    );
TARGETC_axi_int_0: component base_zynq_TARGETC_axi_int_0_0
     port map (
      CNT_CLR => TARGET_C_TopLevel_Sy_0_CNT_CLR,
      Cnt_AXIS_DATA(9 downto 0) => TARGETC_axi_int_0_Cnt_AXIS_DATA(9 downto 0),
      FIFOdata(31 downto 0) => TARGET_C_TopLevel_Sy_0_FIFOdata(31 downto 0),
      FIFOvalid => TARGET_C_TopLevel_Sy_0_FIFOvalid,
      M_AXIS_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXIS_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M_AXIS_TDATA(31 downto 0) => TARGETC_axi_int_0_M00_AXIS_TDATA(31 downto 0),
      M_AXIS_TDEST(9 downto 0) => NLW_TARGETC_axi_int_0_M_AXIS_TDEST_UNCONNECTED(9 downto 0),
      M_AXIS_TID(1 downto 0) => TARGETC_axi_int_0_M00_AXIS_TID(1 downto 0),
      M_AXIS_TLAST => TARGETC_axi_int_0_M00_AXIS_TLAST,
      M_AXIS_TREADY => TARGETC_axi_int_0_M00_AXIS_TREADY,
      M_AXIS_TSTRB(3 downto 0) => TARGETC_axi_int_0_M00_AXIS_TSTRB(3 downto 0),
      M_AXIS_TVALID => TARGETC_axi_int_0_M00_AXIS_TVALID,
      SW_nRST => TARGET_C_TopLevel_Sy_0_SW_nRST,
      StreamReady => TARGETC_axi_int_0_StreamReady,
      TID(1 downto 0) => xlconstant_0_dout(1 downto 0),
      TestStream => TARGET_C_TopLevel_Sy_0_TestStream
    );
TARGETC_axi_int_1: component base_zynq_TARGETC_axi_int_1_0
     port map (
      CNT_CLR => TARGET_C_TopLevel_Sy_1_CNT_CLR,
      Cnt_AXIS_DATA(9 downto 0) => TARGETC_axi_int_1_Cnt_AXIS_DATA(9 downto 0),
      FIFOdata(31 downto 0) => TARGET_C_TopLevel_Sy_1_FIFOdata(31 downto 0),
      FIFOvalid => TARGET_C_TopLevel_Sy_1_FIFOvalid,
      M_AXIS_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXIS_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M_AXIS_TDATA(31 downto 0) => S00_AXIS_1_TDATA(31 downto 0),
      M_AXIS_TDEST(9 downto 0) => NLW_TARGETC_axi_int_1_M_AXIS_TDEST_UNCONNECTED(9 downto 0),
      M_AXIS_TID(1 downto 0) => S00_AXIS_1_TID(1 downto 0),
      M_AXIS_TLAST => S00_AXIS_1_TLAST,
      M_AXIS_TREADY => S00_AXIS_1_TREADY,
      M_AXIS_TSTRB(3 downto 0) => S00_AXIS_1_TSTRB(3 downto 0),
      M_AXIS_TVALID => S00_AXIS_1_TVALID,
      SW_nRST => TARGET_C_TopLevel_Sy_1_SW_nRST,
      StreamReady => TARGETC_axi_int_1_StreamReady,
      TID(1 downto 0) => xlconstant_1_dout(1 downto 0),
      TestStream => TARGET_C_TopLevel_Sy_1_TestStream
    );
TARGET_C_TopLevel_Sy_0: component base_zynq_TARGET_C_TopLevel_Sy_0_0
     port map (
      CNT_CLR => TARGET_C_TopLevel_Sy_0_CNT_CLR,
      Cnt_AXIS_DATA(9 downto 0) => TARGETC_axi_int_0_Cnt_AXIS_DATA(9 downto 0),
      DO(15 downto 0) => xlconcat_0_dout(15 downto 0),
      DOE => NLW_TARGET_C_TopLevel_Sy_0_DOE_UNCONNECTED,
      DONE => DONE_1,
      FIFOdata(31 downto 0) => TARGET_C_TopLevel_Sy_0_FIFOdata(31 downto 0),
      FIFOvalid => TARGET_C_TopLevel_Sy_0_FIFOvalid,
      GCC_RESET => TARGET_C_TopLevel_Sy_0_GCC_RESET,
      HSCLK_N => TARGET_C_TopLevel_Sy_0_HSCLK_N,
      HSCLK_P => TARGET_C_TopLevel_Sy_0_HSCLK_P,
      MONTIMING_N => MONTIMING_N_1,
      MONTIMING_P => MONTIMING_P_1,
      PCLK => TARGET_C_TopLevel_Sy_0_PCLK,
      RAMP => TARGET_C_TopLevel_Sy_0_RAMP,
      RDAD_CLK => TARGET_C_TopLevel_Sy_0_RDAD_CLK,
      RDAD_DIR => TARGET_C_TopLevel_Sy_0_RDAD_DIR,
      RDAD_SIN => TARGET_C_TopLevel_Sy_0_RDAD_SIN,
      REGCLR => NLW_TARGET_C_TopLevel_Sy_0_REGCLR_UNCONNECTED,
      RefCLK_i1 => processing_system7_0_FCLK_CLK0,
      RefCLK_i2 => processing_system7_0_FCLK_CLK0,
      SAMPLESEL_ANY => TARGET_C_TopLevel_Sy_0_SAMPLESEL_ANY,
      SCLK => TARGET_C_TopLevel_Sy_0_SCLK,
      SHOUT => SHOUT_1,
      SIN => TARGET_C_TopLevel_Sy_0_SIN,
      SSTIN => TARGET_C_TopLevel_Sy_0_SSTIN,
      SSVALID_INTR => TARGET_C_TopLevel_Sy_0_SSVALID_INTR,
      SS_INCR => TARGET_C_TopLevel_Sy_0_SS_INCR,
      SS_LD_DIR => TARGET_C_TopLevel_Sy_0_SS_LD_DIR,
      SS_LD_SIN => TARGET_C_TopLevel_Sy_0_SS_LD_SIN,
      SS_RESET => TARGET_C_TopLevel_Sy_0_SS_RESET,
      SW_nRST => TARGET_C_TopLevel_Sy_0_SW_nRST,
      StreamReady => TARGETC_axi_int_0_StreamReady,
      TestStream => TARGET_C_TopLevel_Sy_0_TestStream,
      TrigA => TRIGA_1,
      TrigB => TRIGB_1,
      TrigC => TRIGC_1,
      TrigD => TRIGD_1,
      WLCLK => TARGET_C_TopLevel_Sy_0_WLCLK,
      WR_CS_S0 => TARGET_C_TopLevel_Sy_0_WR_CS_S0,
      WR_CS_S1 => TARGET_C_TopLevel_Sy_0_WR_CS_S1,
      WR_CS_S2 => TARGET_C_TopLevel_Sy_0_WR_CS_S2,
      WR_CS_S3 => TARGET_C_TopLevel_Sy_0_WR_CS_S3,
      WR_CS_S4 => TARGET_C_TopLevel_Sy_0_WR_CS_S4,
      WR_CS_S5 => TARGET_C_TopLevel_Sy_0_WR_CS_S5,
      WR_RS_S0 => TARGET_C_TopLevel_Sy_0_WR_RS_S0,
      WR_RS_S1 => TARGET_C_TopLevel_Sy_0_WR_RS_S1,
      WS_masterctrl_in => xlconstant_2_dout(0),
      WS_masterctrl_out => TARGET_C_TopLevel_Sy_0_WS_masterctrl_out,
      delay_trigger(3 downto 0) => xlconstant_3_dout(3 downto 0),
      hmb_trigger => Start_digitization_ip_0_startDig_out,
      sstin_updateBit(2 downto 0) => xlconstant_4_dout(2 downto 0),
      tc_axi_aclk => processing_system7_0_FCLK_CLK0,
      tc_axi_araddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_ARADDR(31 downto 0),
      tc_axi_aresetn => rst_ps7_0_50M_peripheral_aresetn(0),
      tc_axi_arprot(2 downto 0) => ps7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      tc_axi_arready => ps7_0_axi_periph_M00_AXI_ARREADY,
      tc_axi_arvalid => ps7_0_axi_periph_M00_AXI_ARVALID,
      tc_axi_awaddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_AWADDR(31 downto 0),
      tc_axi_awprot(2 downto 0) => ps7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      tc_axi_awready => ps7_0_axi_periph_M00_AXI_AWREADY,
      tc_axi_awvalid => ps7_0_axi_periph_M00_AXI_AWVALID,
      tc_axi_bready => ps7_0_axi_periph_M00_AXI_BREADY,
      tc_axi_bresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      tc_axi_bvalid => ps7_0_axi_periph_M00_AXI_BVALID,
      tc_axi_rdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      tc_axi_rready => ps7_0_axi_periph_M00_AXI_RREADY,
      tc_axi_rresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      tc_axi_rvalid => ps7_0_axi_periph_M00_AXI_RVALID,
      tc_axi_wdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      tc_axi_wready => ps7_0_axi_periph_M00_AXI_WREADY,
      tc_axi_wstrb(3 downto 0) => ps7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      tc_axi_wvalid => ps7_0_axi_periph_M00_AXI_WVALID
    );
TARGET_C_TopLevel_Sy_1: component base_zynq_TARGET_C_TopLevel_Sy_1_6
     port map (
      CNT_CLR => TARGET_C_TopLevel_Sy_1_CNT_CLR,
      Cnt_AXIS_DATA(9 downto 0) => TARGETC_axi_int_1_Cnt_AXIS_DATA(9 downto 0),
      DO(15 downto 0) => xlconcat_2_dout(15 downto 0),
      DOE => NLW_TARGET_C_TopLevel_Sy_1_DOE_UNCONNECTED,
      DONE => B_DONE_1,
      FIFOdata(31 downto 0) => TARGET_C_TopLevel_Sy_1_FIFOdata(31 downto 0),
      FIFOvalid => TARGET_C_TopLevel_Sy_1_FIFOvalid,
      GCC_RESET => TARGET_C_TopLevel_Sy_1_GCC_RESET,
      HSCLK_N => TARGET_C_TopLevel_Sy_1_HSCLK_N,
      HSCLK_P => TARGET_C_TopLevel_Sy_1_HSCLK_P,
      MONTIMING_N => '0',
      MONTIMING_P => '0',
      PCLK => TARGET_C_TopLevel_Sy_1_PCLK,
      RAMP => TARGET_C_TopLevel_Sy_1_RAMP,
      RDAD_CLK => TARGET_C_TopLevel_Sy_1_RDAD_CLK,
      RDAD_DIR => TARGET_C_TopLevel_Sy_1_RDAD_DIR,
      RDAD_SIN => TARGET_C_TopLevel_Sy_1_RDAD_SIN,
      REGCLR => NLW_TARGET_C_TopLevel_Sy_1_REGCLR_UNCONNECTED,
      RefCLK_i1 => processing_system7_0_FCLK_CLK0,
      RefCLK_i2 => processing_system7_0_FCLK_CLK0,
      SAMPLESEL_ANY => TARGET_C_TopLevel_Sy_1_SAMPLESEL_ANY,
      SCLK => NLW_TARGET_C_TopLevel_Sy_1_SCLK_UNCONNECTED,
      SHOUT => B_SHOUT_1,
      SIN => NLW_TARGET_C_TopLevel_Sy_1_SIN_UNCONNECTED,
      SSTIN => NLW_TARGET_C_TopLevel_Sy_1_SSTIN_UNCONNECTED,
      SSVALID_INTR => TARGET_C_TopLevel_Sy_1_SSVALID_INTR,
      SS_INCR => TARGET_C_TopLevel_Sy_1_SS_INCR,
      SS_LD_DIR => TARGET_C_TopLevel_Sy_1_SS_LD_DIR,
      SS_LD_SIN => TARGET_C_TopLevel_Sy_1_SS_LD_SIN,
      SS_RESET => TARGET_C_TopLevel_Sy_1_SS_RESET,
      SW_nRST => TARGET_C_TopLevel_Sy_1_SW_nRST,
      StreamReady => TARGETC_axi_int_1_StreamReady,
      TestStream => TARGET_C_TopLevel_Sy_1_TestStream,
      TrigA => B_TRIG1_1,
      TrigB => B_TRIG2_1,
      TrigC => B_TRIG3_1,
      TrigD => B_TRIG4_1,
      WLCLK => NLW_TARGET_C_TopLevel_Sy_1_WLCLK_UNCONNECTED,
      WR_CS_S0 => TARGET_C_TopLevel_Sy_1_WR_CS_S0,
      WR_CS_S1 => TARGET_C_TopLevel_Sy_1_WR_CS_S1,
      WR_CS_S2 => TARGET_C_TopLevel_Sy_1_WR_CS_S2,
      WR_CS_S3 => TARGET_C_TopLevel_Sy_1_WR_CS_S3,
      WR_CS_S4 => TARGET_C_TopLevel_Sy_1_WR_CS_S4,
      WR_CS_S5 => TARGET_C_TopLevel_Sy_1_WR_CS_S5,
      WR_RS_S0 => TARGET_C_TopLevel_Sy_1_WR_RS_S0,
      WR_RS_S1 => TARGET_C_TopLevel_Sy_1_WR_RS_S1,
      WS_masterctrl_in => TARGET_C_TopLevel_Sy_0_WS_masterctrl_out,
      WS_masterctrl_out => NLW_TARGET_C_TopLevel_Sy_1_WS_masterctrl_out_UNCONNECTED,
      delay_trigger(3 downto 0) => xlconstant_3_dout(3 downto 0),
      hmb_trigger => Start_digitization_ip_0_startDig_out,
      sstin_updateBit(2 downto 0) => xlconstant_4_dout(2 downto 0),
      tc_axi_aclk => processing_system7_0_FCLK_CLK0,
      tc_axi_araddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_ARADDR(31 downto 0),
      tc_axi_aresetn => rst_ps7_0_50M_peripheral_aresetn(0),
      tc_axi_arprot(2 downto 0) => ps7_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      tc_axi_arready => ps7_0_axi_periph_M02_AXI_ARREADY,
      tc_axi_arvalid => ps7_0_axi_periph_M02_AXI_ARVALID,
      tc_axi_awaddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_AWADDR(31 downto 0),
      tc_axi_awprot(2 downto 0) => ps7_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      tc_axi_awready => ps7_0_axi_periph_M02_AXI_AWREADY,
      tc_axi_awvalid => ps7_0_axi_periph_M02_AXI_AWVALID,
      tc_axi_bready => ps7_0_axi_periph_M02_AXI_BREADY,
      tc_axi_bresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      tc_axi_bvalid => ps7_0_axi_periph_M02_AXI_BVALID,
      tc_axi_rdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      tc_axi_rready => ps7_0_axi_periph_M02_AXI_RREADY,
      tc_axi_rresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      tc_axi_rvalid => ps7_0_axi_periph_M02_AXI_RVALID,
      tc_axi_wdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      tc_axi_wready => ps7_0_axi_periph_M02_AXI_WREADY,
      tc_axi_wstrb(3 downto 0) => ps7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      tc_axi_wvalid => ps7_0_axi_periph_M02_AXI_WVALID
    );
axi_dma_0: component base_zynq_axi_dma_0_0
     port map (
      axi_resetn => rst_ps7_0_50M_peripheral_aresetn(0),
      m_axi_s2mm_aclk => processing_system7_0_FCLK_CLK0,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      m_axi_s2mm_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      m_axi_s2mm_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      s2mm_introut => axi_dma_0_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => processing_system7_0_FCLK_CLK0,
      s_axi_lite_araddr(9 downto 0) => ps7_0_axi_periph_M01_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => ps7_0_axi_periph_M01_AXI_ARREADY,
      s_axi_lite_arvalid => ps7_0_axi_periph_M01_AXI_ARVALID(0),
      s_axi_lite_awaddr(9 downto 0) => ps7_0_axi_periph_M01_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => ps7_0_axi_periph_M01_AXI_AWREADY,
      s_axi_lite_awvalid => ps7_0_axi_periph_M01_AXI_AWVALID(0),
      s_axi_lite_bready => ps7_0_axi_periph_M01_AXI_BREADY(0),
      s_axi_lite_bresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps7_0_axi_periph_M01_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps7_0_axi_periph_M01_AXI_RREADY(0),
      s_axi_lite_rresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps7_0_axi_periph_M01_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps7_0_axi_periph_M01_AXI_WREADY,
      s_axi_lite_wvalid => ps7_0_axi_periph_M01_AXI_WVALID(0),
      s_axis_s2mm_tdata(31 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(31 downto 0),
      s_axis_s2mm_tkeep(3 downto 0) => axis_interconnect_0_M00_AXIS_TKEEP(3 downto 0),
      s_axis_s2mm_tlast => axis_interconnect_0_M00_AXIS_TLAST,
      s_axis_s2mm_tready => axis_interconnect_0_M00_AXIS_TREADY,
      s_axis_s2mm_tvalid => axis_interconnect_0_M00_AXIS_TVALID
    );
axi_interconnect_0: entity work.base_zynq_axi_interconnect_0_0
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M00_AXI_awaddr(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awburst(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      M00_AXI_awcache(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      M00_AXI_awlen(3 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(3 downto 0),
      M00_AXI_awlock(1 downto 0) => axi_interconnect_0_M00_AXI_AWLOCK(1 downto 0),
      M00_AXI_awprot(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awqos(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      M00_AXI_awready => axi_interconnect_0_M00_AXI_AWREADY,
      M00_AXI_awsize(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      M00_AXI_awvalid => axi_interconnect_0_M00_AXI_AWVALID,
      M00_AXI_bready => axi_interconnect_0_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => axi_interconnect_0_M00_AXI_BVALID,
      M00_AXI_wdata(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wlast => axi_interconnect_0_M00_AXI_WLAST,
      M00_AXI_wready => axi_interconnect_0_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => axi_interconnect_0_M00_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      S00_AXI_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      S00_AXI_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      S00_AXI_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      S00_AXI_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      S00_AXI_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      S00_AXI_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      S00_AXI_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      S00_AXI_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      S00_AXI_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      S00_AXI_wdata(31 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(31 downto 0),
      S00_AXI_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      S00_AXI_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      S00_AXI_wstrb(3 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(3 downto 0),
      S00_AXI_wvalid => axi_dma_0_M_AXI_S2MM_WVALID
    );
axis_interconnect_0: entity work.base_zynq_axis_interconnect_0_1
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M00_AXIS_ACLK => processing_system7_0_FCLK_CLK0,
      M00_AXIS_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M00_AXIS_tdata(31 downto 0) => axis_interconnect_0_M00_AXIS_TDATA(31 downto 0),
      M00_AXIS_tkeep(3 downto 0) => axis_interconnect_0_M00_AXIS_TKEEP(3 downto 0),
      M00_AXIS_tlast => axis_interconnect_0_M00_AXIS_TLAST,
      M00_AXIS_tready => axis_interconnect_0_M00_AXIS_TREADY,
      M00_AXIS_tvalid => axis_interconnect_0_M00_AXIS_TVALID,
      S00_ARB_REQ_SUPPRESS => '0',
      S00_AXIS_ACLK => processing_system7_0_FCLK_CLK0,
      S00_AXIS_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      S00_AXIS_tdata(31 downto 0) => S00_AXIS_1_TDATA(31 downto 0),
      S00_AXIS_tid(1 downto 0) => S00_AXIS_1_TID(1 downto 0),
      S00_AXIS_tlast => S00_AXIS_1_TLAST,
      S00_AXIS_tready => S00_AXIS_1_TREADY,
      S00_AXIS_tstrb(3 downto 0) => S00_AXIS_1_TSTRB(3 downto 0),
      S00_AXIS_tvalid => S00_AXIS_1_TVALID,
      S01_ARB_REQ_SUPPRESS => '0',
      S01_AXIS_ACLK => processing_system7_0_FCLK_CLK0,
      S01_AXIS_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      S01_AXIS_tdata(31 downto 0) => TARGETC_axi_int_0_M00_AXIS_TDATA(31 downto 0),
      S01_AXIS_tid(1 downto 0) => TARGETC_axi_int_0_M00_AXIS_TID(1 downto 0),
      S01_AXIS_tlast => TARGETC_axi_int_0_M00_AXIS_TLAST,
      S01_AXIS_tready => TARGETC_axi_int_0_M00_AXIS_TREADY,
      S01_AXIS_tstrb(3 downto 0) => TARGETC_axi_int_0_M00_AXIS_TSTRB(3 downto 0),
      S01_AXIS_tvalid => TARGETC_axi_int_0_M00_AXIS_TVALID
    );
processing_system7_0: component base_zynq_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      IRQ_F2P(2 downto 0) => xlconcat_1_dout(2 downto 0),
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      M_AXI_GP0_ARREADY => processing_system7_0_M_AXI_GP0_ARREADY,
      M_AXI_GP0_ARSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      M_AXI_GP0_ARVALID => processing_system7_0_M_AXI_GP0_ARVALID,
      M_AXI_GP0_AWADDR(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      M_AXI_GP0_AWREADY => processing_system7_0_M_AXI_GP0_AWREADY,
      M_AXI_GP0_AWSIZE(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      M_AXI_GP0_AWVALID => processing_system7_0_M_AXI_GP0_AWVALID,
      M_AXI_GP0_BID(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      M_AXI_GP0_BREADY => processing_system7_0_M_AXI_GP0_BREADY,
      M_AXI_GP0_BRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      M_AXI_GP0_BVALID => processing_system7_0_M_AXI_GP0_BVALID,
      M_AXI_GP0_RDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      M_AXI_GP0_RID(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      M_AXI_GP0_RLAST => processing_system7_0_M_AXI_GP0_RLAST,
      M_AXI_GP0_RREADY => processing_system7_0_M_AXI_GP0_RREADY,
      M_AXI_GP0_RRESP(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      M_AXI_GP0_RVALID => processing_system7_0_M_AXI_GP0_RVALID,
      M_AXI_GP0_WDATA(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      M_AXI_GP0_WLAST => processing_system7_0_M_AXI_GP0_WLAST,
      M_AXI_GP0_WREADY => processing_system7_0_M_AXI_GP0_WREADY,
      M_AXI_GP0_WSTRB(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      M_AXI_GP0_WVALID => processing_system7_0_M_AXI_GP0_WVALID,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      S_AXI_HP0_ACLK => processing_system7_0_FCLK_CLK0,
      S_AXI_HP0_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_HP0_ARBURST(1 downto 0) => B"01",
      S_AXI_HP0_ARCACHE(3 downto 0) => B"0011",
      S_AXI_HP0_ARID(5 downto 0) => B"000000",
      S_AXI_HP0_ARLEN(3 downto 0) => B"0000",
      S_AXI_HP0_ARLOCK(1 downto 0) => B"00",
      S_AXI_HP0_ARPROT(2 downto 0) => B"000",
      S_AXI_HP0_ARQOS(3 downto 0) => B"0000",
      S_AXI_HP0_ARREADY => NLW_processing_system7_0_S_AXI_HP0_ARREADY_UNCONNECTED,
      S_AXI_HP0_ARSIZE(2 downto 0) => B"010",
      S_AXI_HP0_ARVALID => '0',
      S_AXI_HP0_AWADDR(31 downto 0) => axi_interconnect_0_M00_AXI_AWADDR(31 downto 0),
      S_AXI_HP0_AWBURST(1 downto 0) => axi_interconnect_0_M00_AXI_AWBURST(1 downto 0),
      S_AXI_HP0_AWCACHE(3 downto 0) => axi_interconnect_0_M00_AXI_AWCACHE(3 downto 0),
      S_AXI_HP0_AWID(5 downto 0) => B"000000",
      S_AXI_HP0_AWLEN(3 downto 0) => axi_interconnect_0_M00_AXI_AWLEN(3 downto 0),
      S_AXI_HP0_AWLOCK(1 downto 0) => axi_interconnect_0_M00_AXI_AWLOCK(1 downto 0),
      S_AXI_HP0_AWPROT(2 downto 0) => axi_interconnect_0_M00_AXI_AWPROT(2 downto 0),
      S_AXI_HP0_AWQOS(3 downto 0) => axi_interconnect_0_M00_AXI_AWQOS(3 downto 0),
      S_AXI_HP0_AWREADY => axi_interconnect_0_M00_AXI_AWREADY,
      S_AXI_HP0_AWSIZE(2 downto 0) => axi_interconnect_0_M00_AXI_AWSIZE(2 downto 0),
      S_AXI_HP0_AWVALID => axi_interconnect_0_M00_AXI_AWVALID,
      S_AXI_HP0_BID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_BID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_BREADY => axi_interconnect_0_M00_AXI_BREADY,
      S_AXI_HP0_BRESP(1 downto 0) => axi_interconnect_0_M00_AXI_BRESP(1 downto 0),
      S_AXI_HP0_BVALID => axi_interconnect_0_M00_AXI_BVALID,
      S_AXI_HP0_RACOUNT(2 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RACOUNT_UNCONNECTED(2 downto 0),
      S_AXI_HP0_RCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_RDATA(31 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RDATA_UNCONNECTED(31 downto 0),
      S_AXI_HP0_RDISSUECAP1_EN => '0',
      S_AXI_HP0_RID(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RID_UNCONNECTED(5 downto 0),
      S_AXI_HP0_RLAST => NLW_processing_system7_0_S_AXI_HP0_RLAST_UNCONNECTED,
      S_AXI_HP0_RREADY => '0',
      S_AXI_HP0_RRESP(1 downto 0) => NLW_processing_system7_0_S_AXI_HP0_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_HP0_RVALID => NLW_processing_system7_0_S_AXI_HP0_RVALID_UNCONNECTED,
      S_AXI_HP0_WACOUNT(5 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WACOUNT_UNCONNECTED(5 downto 0),
      S_AXI_HP0_WCOUNT(7 downto 0) => NLW_processing_system7_0_S_AXI_HP0_WCOUNT_UNCONNECTED(7 downto 0),
      S_AXI_HP0_WDATA(31 downto 0) => axi_interconnect_0_M00_AXI_WDATA(31 downto 0),
      S_AXI_HP0_WID(5 downto 0) => B"000000",
      S_AXI_HP0_WLAST => axi_interconnect_0_M00_AXI_WLAST,
      S_AXI_HP0_WREADY => axi_interconnect_0_M00_AXI_WREADY,
      S_AXI_HP0_WRISSUECAP1_EN => '0',
      S_AXI_HP0_WSTRB(3 downto 0) => axi_interconnect_0_M00_AXI_WSTRB(3 downto 0),
      S_AXI_HP0_WVALID => axi_interconnect_0_M00_AXI_WVALID,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED
    );
ps7_0_axi_periph: entity work.base_zynq_ps7_0_axi_periph_1
     port map (
      ACLK => processing_system7_0_FCLK_CLK0,
      ARESETN => ARESETN_1(0),
      M00_ACLK => processing_system7_0_FCLK_CLK0,
      M00_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M00_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arprot(2 downto 0) => ps7_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => ps7_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => ps7_0_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M00_AXI_AWADDR(31 downto 0),
      M00_AXI_awprot(2 downto 0) => ps7_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => ps7_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => ps7_0_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => ps7_0_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => ps7_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => ps7_0_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => ps7_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => ps7_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => ps7_0_axi_periph_M00_AXI_WVALID,
      M01_ACLK => processing_system7_0_FCLK_CLK0,
      M01_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M01_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M01_AXI_ARADDR(31 downto 0),
      M01_AXI_arready(0) => ps7_0_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid(0) => ps7_0_axi_periph_M01_AXI_ARVALID(0),
      M01_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M01_AXI_AWADDR(31 downto 0),
      M01_AXI_awready(0) => ps7_0_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid(0) => ps7_0_axi_periph_M01_AXI_AWVALID(0),
      M01_AXI_bready(0) => ps7_0_axi_periph_M01_AXI_BREADY(0),
      M01_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid(0) => ps7_0_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready(0) => ps7_0_axi_periph_M01_AXI_RREADY(0),
      M01_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid(0) => ps7_0_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready(0) => ps7_0_axi_periph_M01_AXI_WREADY,
      M01_AXI_wvalid(0) => ps7_0_axi_periph_M01_AXI_WVALID(0),
      M02_ACLK => processing_system7_0_FCLK_CLK0,
      M02_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M02_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_ARADDR(31 downto 0),
      M02_AXI_arprot(2 downto 0) => ps7_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready => ps7_0_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid => ps7_0_axi_periph_M02_AXI_ARVALID,
      M02_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M02_AXI_AWADDR(31 downto 0),
      M02_AXI_awprot(2 downto 0) => ps7_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready => ps7_0_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid => ps7_0_axi_periph_M02_AXI_AWVALID,
      M02_AXI_bready => ps7_0_axi_periph_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => ps7_0_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => ps7_0_axi_periph_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => ps7_0_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => ps7_0_axi_periph_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => ps7_0_axi_periph_M02_AXI_WVALID,
      M03_ACLK => processing_system7_0_FCLK_CLK0,
      M03_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      M03_AXI_araddr(31 downto 0) => ps7_0_axi_periph_M03_AXI_ARADDR(31 downto 0),
      M03_AXI_arprot(2 downto 0) => ps7_0_axi_periph_M03_AXI_ARPROT(2 downto 0),
      M03_AXI_arready => ps7_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid => ps7_0_axi_periph_M03_AXI_ARVALID,
      M03_AXI_awaddr(31 downto 0) => ps7_0_axi_periph_M03_AXI_AWADDR(31 downto 0),
      M03_AXI_awprot(2 downto 0) => ps7_0_axi_periph_M03_AXI_AWPROT(2 downto 0),
      M03_AXI_awready => ps7_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid => ps7_0_axi_periph_M03_AXI_AWVALID,
      M03_AXI_bready => ps7_0_axi_periph_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => ps7_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => ps7_0_axi_periph_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => ps7_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => ps7_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => ps7_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => ps7_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wstrb(3 downto 0) => ps7_0_axi_periph_M03_AXI_WSTRB(3 downto 0),
      M03_AXI_wvalid => ps7_0_axi_periph_M03_AXI_WVALID,
      S00_ACLK => processing_system7_0_FCLK_CLK0,
      S00_ARESETN => rst_ps7_0_50M_peripheral_aresetn(0),
      S00_AXI_araddr(31 downto 0) => processing_system7_0_M_AXI_GP0_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => processing_system7_0_M_AXI_GP0_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => processing_system7_0_M_AXI_GP0_ARCACHE(3 downto 0),
      S00_AXI_arid(11 downto 0) => processing_system7_0_M_AXI_GP0_ARID(11 downto 0),
      S00_AXI_arlen(3 downto 0) => processing_system7_0_M_AXI_GP0_ARLEN(3 downto 0),
      S00_AXI_arlock(1 downto 0) => processing_system7_0_M_AXI_GP0_ARLOCK(1 downto 0),
      S00_AXI_arprot(2 downto 0) => processing_system7_0_M_AXI_GP0_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => processing_system7_0_M_AXI_GP0_ARQOS(3 downto 0),
      S00_AXI_arready => processing_system7_0_M_AXI_GP0_ARREADY,
      S00_AXI_arsize(2 downto 0) => processing_system7_0_M_AXI_GP0_ARSIZE(2 downto 0),
      S00_AXI_arvalid => processing_system7_0_M_AXI_GP0_ARVALID,
      S00_AXI_awaddr(31 downto 0) => processing_system7_0_M_AXI_GP0_AWADDR(31 downto 0),
      S00_AXI_awburst(1 downto 0) => processing_system7_0_M_AXI_GP0_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => processing_system7_0_M_AXI_GP0_AWCACHE(3 downto 0),
      S00_AXI_awid(11 downto 0) => processing_system7_0_M_AXI_GP0_AWID(11 downto 0),
      S00_AXI_awlen(3 downto 0) => processing_system7_0_M_AXI_GP0_AWLEN(3 downto 0),
      S00_AXI_awlock(1 downto 0) => processing_system7_0_M_AXI_GP0_AWLOCK(1 downto 0),
      S00_AXI_awprot(2 downto 0) => processing_system7_0_M_AXI_GP0_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => processing_system7_0_M_AXI_GP0_AWQOS(3 downto 0),
      S00_AXI_awready => processing_system7_0_M_AXI_GP0_AWREADY,
      S00_AXI_awsize(2 downto 0) => processing_system7_0_M_AXI_GP0_AWSIZE(2 downto 0),
      S00_AXI_awvalid => processing_system7_0_M_AXI_GP0_AWVALID,
      S00_AXI_bid(11 downto 0) => processing_system7_0_M_AXI_GP0_BID(11 downto 0),
      S00_AXI_bready => processing_system7_0_M_AXI_GP0_BREADY,
      S00_AXI_bresp(1 downto 0) => processing_system7_0_M_AXI_GP0_BRESP(1 downto 0),
      S00_AXI_bvalid => processing_system7_0_M_AXI_GP0_BVALID,
      S00_AXI_rdata(31 downto 0) => processing_system7_0_M_AXI_GP0_RDATA(31 downto 0),
      S00_AXI_rid(11 downto 0) => processing_system7_0_M_AXI_GP0_RID(11 downto 0),
      S00_AXI_rlast => processing_system7_0_M_AXI_GP0_RLAST,
      S00_AXI_rready => processing_system7_0_M_AXI_GP0_RREADY,
      S00_AXI_rresp(1 downto 0) => processing_system7_0_M_AXI_GP0_RRESP(1 downto 0),
      S00_AXI_rvalid => processing_system7_0_M_AXI_GP0_RVALID,
      S00_AXI_wdata(31 downto 0) => processing_system7_0_M_AXI_GP0_WDATA(31 downto 0),
      S00_AXI_wid(11 downto 0) => processing_system7_0_M_AXI_GP0_WID(11 downto 0),
      S00_AXI_wlast => processing_system7_0_M_AXI_GP0_WLAST,
      S00_AXI_wready => processing_system7_0_M_AXI_GP0_WREADY,
      S00_AXI_wstrb(3 downto 0) => processing_system7_0_M_AXI_GP0_WSTRB(3 downto 0),
      S00_AXI_wvalid => processing_system7_0_M_AXI_GP0_WVALID
    );
rst_ps7_0_50M: component base_zynq_rst_ps7_0_50M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ps7_0_50M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => processing_system7_0_FCLK_RESET0_N,
      interconnect_aresetn(0) => ARESETN_1(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ps7_0_50M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_ps7_0_50M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_ps7_0_50M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => processing_system7_0_FCLK_CLK0
    );
util_ds_buf_0: component base_zynq_util_ds_buf_0_0
     port map (
      OBUF_DS_N(0) => util_ds_buf_0_OBUF_DS_N(0),
      OBUF_DS_P(0) => util_ds_buf_0_OBUF_DS_P(0),
      OBUF_IN(0) => TARGET_C_TopLevel_Sy_0_SSTIN
    );
util_ds_buf_1: component base_zynq_util_ds_buf_1_0
     port map (
      OBUF_DS_N(0) => TARGET_C_TopLevel_Sy_0_WL_CLK_N(0),
      OBUF_DS_P(0) => TARGET_C_TopLevel_Sy_0_WL_CLK_P(0),
      OBUF_IN(0) => TARGET_C_TopLevel_Sy_0_WLCLK
    );
xlconcat_0: component base_zynq_xlconcat_0_0
     port map (
      In0(0) => DO_1_1,
      In1(0) => DO_2_1,
      In10(0) => DO_11_1,
      In11(0) => DO_12_1,
      In12(0) => DO_13_1,
      In13(0) => DO_14_1,
      In14(0) => DO_15_1,
      In15(0) => DO_16_1,
      In2(0) => DO_3_1,
      In3(0) => DO_4_1,
      In4(0) => DO_5_1,
      In5(0) => DO_6_1,
      In6(0) => DO_7_1,
      In7(0) => DO_8_1,
      In8(0) => DO_9_1,
      In9(0) => DO_10_1,
      dout(15 downto 0) => xlconcat_0_dout(15 downto 0)
    );
xlconcat_1: component base_zynq_xlconcat_1_0
     port map (
      In0(0) => TARGET_C_TopLevel_Sy_0_SSVALID_INTR,
      In1(0) => axi_dma_0_s2mm_introut,
      In2(0) => TARGET_C_TopLevel_Sy_1_SSVALID_INTR,
      dout(2 downto 0) => xlconcat_1_dout(2 downto 0)
    );
xlconcat_2: component base_zynq_xlconcat_2_6
     port map (
      In0(0) => B_DO_1_1(0),
      In1(0) => B_DO_2_1(0),
      In10(0) => B_DO_11_1(0),
      In11(0) => B_DO_12_1(0),
      In12(0) => B_DO_13(0),
      In13(0) => B_DO_14_1(0),
      In14(0) => B_DO_15_1(0),
      In15(0) => B_DO_16_1(0),
      In2(0) => B_DO_3_1(0),
      In3(0) => B_DO_4_1(0),
      In4(0) => B_DO_5_1(0),
      In5(0) => B_DO_6_1(0),
      In6(0) => B_DO_7_1(0),
      In7(0) => B_DO_8_1(0),
      In8(0) => B_DO_9_1(0),
      In9(0) => B_DO_10_1(0),
      dout(15 downto 0) => xlconcat_2_dout(15 downto 0)
    );
xlconstant_0: component base_zynq_xlconstant_0_0
     port map (
      dout(1 downto 0) => xlconstant_0_dout(1 downto 0)
    );
xlconstant_1: component base_zynq_xlconstant_1_6
     port map (
      dout(1 downto 0) => xlconstant_1_dout(1 downto 0)
    );
xlconstant_2: component base_zynq_xlconstant_2_0
     port map (
      dout(0) => xlconstant_2_dout(0)
    );
xlconstant_3: component base_zynq_xlconstant_3_0
     port map (
      dout(3 downto 0) => xlconstant_3_dout(3 downto 0)
    );
xlconstant_4: component base_zynq_xlconstant_4_0
     port map (
      dout(2 downto 0) => xlconstant_4_dout(2 downto 0)
    );
end STRUCTURE;
