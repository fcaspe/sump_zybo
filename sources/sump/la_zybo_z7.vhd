----------------------------------------------------------------------------------
-- la.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Logic Analyzer top level module for Zybo-Z710. It connects the core with the hardware
-- dependend IO modules and defines all inputs and outputs that represent
-- phyisical pins of the fpga.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity la_zybo_z7 is
	Port(
    resetSwitch : in std_logic;
    triggerSwitch: in std_logic;
    sysclk : in std_logic;
    
    exClock : in std_logic; --External clock. (Moved to JD_pin7)
    je : in std_logic_vector(7 downto 0); -- mapped to input (7 downto 0)
    jd : in std_logic_vector(6 downto 0); -- mapped to input (15 downto 8)
    --jc : in std_logic_vector(7 downto 0); -- mapped to input (23 downto 16) (NOT IMPLEMENTED)
    --jb : in std_logic_vector(7 downto 0); -- mapped to input (31 downto 24) (NOT IMPLEMENTED)
    
    --ready50 : out std_logic; --Low rate Sample signal generated by sampler moved to a LED to see what's up 
    
    jc_1_tx : inout std_logic;   --PMOD C pin 1
    jc_2_rx : in std_logic;--PMOD C pin 2
    
    led : OUT std_logic_vector(3 downto 0);
    sw : in std_logic_vector(1 downto 0)
	);
end la_zybo_z7;


architecture Behavioral of la_zybo_z7 is

	COMPONENT la
	PORT(
        resetSwitch : in std_logic;
        triggerSwitch: in std_logic;
        inClock : in std_logic;
        
        exClock : in std_logic;
        input : in std_logic_vector(31 downto 0);
        ready50 : out std_logic;
        
        rx : in std_logic;
        tx : inout std_logic;

        switch : in std_logic_vector(1 downto 0);
        debug_line_0 : out std_logic; --remove after debug is done
        debug_line_1 : out std_logic --remove after debug is done
        );
	END COMPONENT;

component clock_divider is
    port ( 
    clk,reset: in std_logic;
    clock_out: out std_logic
    );
end component;
  
component debug_line_divider is
    port ( 
    clk,reset: in std_logic;
    clock_out: out std_logic
    );
end component;

--Xilinx clock wizard IP will take sysclock (in Zybo-z7 = 125 MHz) and turn it into the expected 100 MHz
component clk_wiz_0 is
  port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end component;
	

signal clock_modified : std_logic; --In this case 100 MHz
signal padded_input : std_logic_vector (31 downto 0);
signal debug_line : std_logic;
begin

	led(1) <= not jc_1_tx;

    padded_input <= "0000000000000000" & "0" & jd(6 downto 0) & je;

	inst_la: la PORT MAP(
		resetSwitch => resetSwitch,
		triggerSwitch => triggerSwitch,
		inClock => clock_modified,
		exClock => exClock,
		input => padded_input,
		ready50 => open,
		rx => jc_2_rx,
		tx => jc_1_tx,
		switch => sw,
		debug_line_0 => debug_line,
		debug_line_1 => led(0)
	);
	
	clock_wizard: clk_wiz_0 PORT MAP(
	   clk_out1 => clock_modified,
	   reset => resetSwitch,
	   locked => open, -- TODO: a small logic that keeps the analyzed resetted until the PLL is locked.
	   clk_in1 => sysclk
	);
	   
	indicator_generator: clock_divider port map (
	   clk => clock_modified,
	   reset => resetSwitch,
	   clock_out => led(2)
	);
	
	indicator_debug_line : debug_line_divider port map (
	   clk => debug_line,
	   reset => resetSwitch,
	   clock_out => led(3)
	);


end Behavioral;
