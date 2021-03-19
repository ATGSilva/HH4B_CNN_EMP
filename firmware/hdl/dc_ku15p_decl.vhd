-- emp_project_decl
--
-- Defines constants for the whole device

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.emp_framework_decl.all;
use work.emp_device_types.all;

-------------------------------------------------------------------------------
package emp_project_decl is

  constant PAYLOAD_REV         : std_logic_vector(31 downto 0) := X"12345678";

  -- Number of LHC bunches 
  constant LHC_BUNCH_COUNT    : integer             := 3564;
  -- Latency buffer size
  constant LB_ADDR_WIDTH      : integer             := 10;

  -- Clock setup
  constant CLOCK_COMMON_RATIO : integer             := 36; -- 24?
  constant CLOCK_RATIO        : integer             := 6; -- 9 * 40MHz
  constant CLOCK_AUX_RATIO    : clock_ratio_array_t := (2, 4, 6);
   
  -- Only used by nullalgo   
  constant PAYLOAD_LATENCY    : integer             := 5;

  -- mgt -> chk -> buf -> fmt -> (algo) -> (fmt) -> buf -> chk -> mgt -> clk -> altclk
  constant REGION_CONF : region_conf_array_t := (
    0  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 225 -- Right Column
    1  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 226
    2  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 227
    3  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 228
    4  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 229
    5  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 230  
    6  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 231 
    7  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 232
    8  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 233
    9  => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 234
    -- Cross-chip
    10 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 134 -- Left Column
    11 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 133
    12 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 132
    13 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 131
    14 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 130
    15 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 129
    16 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 128
    17 => (no_mgt, u_crc32, buf, no_fmt, buf, u_crc32, no_mgt),   --Bank 127
    others => kDummyRegion
    );

end emp_project_decl;
-------------------------------------------------------------------------------
