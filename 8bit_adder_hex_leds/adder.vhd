-- Name: Angela Luca
-- Section #: 23200
-- Description: 4 bit ripple carry adder

library ieee;
use ieee.std_logic_1164.all;

-- DO NOT CHANGE ANYTHING IN THE ENTITY
entity adder is
  port (
    input1    : in  std_logic_vector(3 downto 0);
    input2    : in  std_logic_vector(3 downto 0);
    carry_in  : in  std_logic;
    sum       : out std_logic_vector(3 downto 0);
    carry_out : out std_logic);
end adder;

-- DEFINE A RIPPLE-CARRY ADDER USING A STRUCTURE DESCRIPTION THAT CONSISTS OF 4
-- FULL ADDERS
ARCHITECTURE STR OF adder IS

  SIGNAL c1, c2, c3 : STD_LOGIC ;
  COMPONENT fa
    PORT ( 
      input1    : in  std_logic;
      input2    : in  std_logic;
      carry_in  : in  std_logic;
      sum       : out std_logic;
      carry_out : out std_logic) ;
  END COMPONENT ;

BEGIN
  stage0: fa PORT MAP ( Carry_in, input1(0), input2(0), sum(0), c1 ) ;
  stage1: fa PORT MAP ( c1, input1(1), input2(1), sum(1), c2 ) ;
  stage2: fa PORT MAP ( c2, input1(2), input2(2), sum(2), c3 ) ;
  stage3: fa PORT MAP ( c3, input1(3), input2(3), sum(3), carry_out ) ;

END STR ;