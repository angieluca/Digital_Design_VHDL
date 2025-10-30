-- Name: Angela Luca
-- Section #: 23200
-- Description: 8 bit ripple carry adder

library ieee;
use ieee.std_logic_1164.all;

entity ripple_adder_8bit is
  port (
    input1    : in  std_logic_vector(7 downto 0);
    input2    : in  std_logic_vector(7 downto 0);
    carry_in  : in  std_logic;
    sum       : out std_logic_vector(7 downto 0);
    carry_out : out std_logic);
end ripple_adder_8bit;

ARCHITECTURE STR of ripple_adder_8bit IS

    SIGNAL c1 : STD_LOGIC ;
    COMPONENT adder
        PORT (
        carry_in  : in  std_logic; 
        input1    : in  std_logic_vector(3 downto 0);
        input2    : in  std_logic_vector(3 downto 0);
        sum       : out std_logic_vector(3 downto 0);
        carry_out : out std_logic);
    END COMPONENT ;

BEGIN
    stage0: adder PORT MAP ( carry_in, input1(3 downto 0), input2(3 downto 0), sum(3 downto 0), c1 ) ;
    stage1: adder PORT MAP ( c1, input1(7 downto 4), input2(7 downto 4), sum(7 downto 4), carry_out ) ;

END STR ; 