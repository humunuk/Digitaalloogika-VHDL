------------------------------------------------------------------------------
--  File: mux.vhd
------------------------------------------------------------------------------
--Multiplexer design
--Control signal is CONT_SIG
--The output is chosen from 2 signals with length 8 bits
--If control signal is '1' then input A_in is chosen 
--If '0' then input B_IN is chosen to the output OUT_SIG


library IEEE;
use IEEE.std_logic_1164.all;

--Multiplexer entity
-- A_IN : in std_logic_vector(3 downto 0), st meil on A input, mis on 4 bitine ja see on vektor, paremalt vasakule positsioonidega: 0, 1, 2, 3 
 entity Mux is
  port ( A_IN     : in std_logic;
         B_IN     : in std_logic;
         CONT_SIG : in  std_logic;
         OUT_SIG_BEH  : out std_logic;
         OUT_SIG_FLOW  : out std_logic;
         OUT_SIG_STRUCT  : out std_logic);
  end Mux;
  
--Architecture of the multiplexer
architecture RTL of Mux is
--siin vahel komponendid ja abi signaalid
begin
 
--Behavioural process DISP_MUX
DISP_MUX: process ( A_IN, B_IN, CONT_SIG ) --sensitivity list (protsess läheb ainult siis käima, kui üks nendest signaalidest selles nimekirjas muutub)
--abimuutujad
  begin
    if CONT_SIG = '1' then
       OUT_SIG_BEH <= A_IN;
    elsif CONT_SIG = '0' then
       OUT_SIG_BEH <= B_IN;
    else
       OUT_SIG_BEH <= 'X';
    end if;
end process DISP_MUX;

OUT_SIG_FLOW  <= (A_IN AND NOT (CONT_SIG)) OR (B_IN AND (CONT_SIG));  
OUT_SIG_STRUCT <= '1';

end RTL;
