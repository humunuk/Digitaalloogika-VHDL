 ------------------------------------------------------------------------------
--  File: mux_tb.vhd
------------------------------------------------------------------------------
--Multiplexor testbench
library IEEE;
use IEEE.std_logic_1164.all;

--Testbench entity is always empty
entity MuxTestBench is
end MuxTestbench;

architecture Bench of MuxTestBench is

  --Component declaration for MUX
  component Mux is
  port ( A_IN     : in std_logic;
         B_IN     : in std_logic;
         CONT_SIG : in  std_logic;
         OUT_SIG_BEH  : out std_logic;
         OUT_SIG_FLOW  : out std_logic;
         OUT_SIG_STRUCT  : out std_logic);
  end component;

  --Local signal declarations
  signal AInTB, BInTB, ContSigTB, OutSigBehTB, OutSigFlowTB, OutSigStructTB : std_logic; 

begin

--Component instantiation of MUX
Mux_comp: MUX port map (AInTB, BInTB, ContSigTB, OutSigBehTB, OutSigFlowTB, OutSigStructTB);
 
--Stimulus process
Stimulus: process
--Processi ja begini vahele saab deklareerida abi muutujaid.
variable counter :integer;
   begin
   --Seni kaua kuni A on 1 bitine on ülakoma, kui tegemist vektoriga, siis jutumärgid! (suur NB)
   --Signaali väärtustatakse <=
   --Muutujat väärtustatakse :=
      counter := 100;
      AInTB     <= '0'; 
      BInTB     <= '1';
      ContSigTB <= '0';
      wait for 10 ns;
	  assert OutSigBehTB = BInTB report "OutSigBehTB /= BInTB" severity note; --The assert statement tests the boolean condition. If this is false, it outputs a message containing the report string to the simulator screen.
	  report "OutSigBehTB";
      ContSigTB <= '1';
      wait for 10 ns;

      AInTB  <= '1'; 
      BInTB  <= '0';
      ContSigTB  <= '0';
      wait for 10 ns;
      
      ContSigTB <= '1';
      wait for 10 ns;
      
      AInTB  <= '1'; 
      BInTB  <= '0';
      ContSigTB  <= 'U';
      wait for 10 ns;

      wait;  --Suspend
   end process Stimulus;

end Bench;
