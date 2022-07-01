----------------------------------------------------------------------------------
-- sram.vhd
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
-- Simple SRAM interface. Works with a interan block ram implementation.
-- Version for Zybo-Z7. Features 32bit I/O to keep compatibility with the SUMP core.
-- But only the 16LSbits of the I/O are stored in memory (Zybo-Z7 version features only 16 I/O)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sram is
    -- Generic set for inferred RAM. 
    -- Data here has to match the specified in bytewrite_ram_1b.vhd
    generic (
        ADDR_WIDTH : integer := 15;
        COL_WIDTH : integer := 8;
        NB_COL : integer := 4);

    Port (
		clock : in  STD_LOGIC;
		output : out std_logic_vector(31 downto 0);          
		input : in std_logic_vector(31 downto 0);          
		read : in std_logic; 
		write : in std_logic
	);
end sram;

architecture Behavioral of sram is

component bytewrite_ram_1b is
    port (
        clk : in std_logic;
        we : in std_logic; --we : in std_logic_vector(NB_COL-1 downto 0) --For column-wise write enable
        addr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        di : in std_logic_vector(NB_COL*COL_WIDTH-1 downto 0);
        do : out std_logic_vector(NB_COL*COL_WIDTH-1 downto 0));
end component;


signal address : std_logic_vector (ADDR_WIDTH-1 downto 0):= (others => '0');
signal written_input, written_output : std_logic_vector(15 downto 0);
begin
    
    memory: bytewrite_ram_1b PORT MAP (
        clk => clock,
        we => write,
        addr => address,
        di => input, 
        do => output
    );

    --process(clk,reset)
    --begin
    --    if rising_edge(clock) and reset='1' then
    --        address <= (others => '0');
    --    end if;
    --end process;
    
	-- memory address controller
	process(clock)
	begin
		if rising_edge(clock) then
			if write = '1' then
				address <= address + 1;
			elsif read = '1' then
				address <= address - 1;
			else
			    address <= address;
		    end if;
		 end if;
	end process;


end Behavioral;

