-- Name: Angela Luca
-- Section #: 23200
-- Description: Testbench to 4to7 decoder DE10 hex LEDs

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hex_to_7seg_dec_tb IS
END hex_to_7seg_dec_tb;

--Component Declaration
ARCHITECTURE BHV OF hex_to_7seg_dec_tb IS

  SIGNAL bin : STD_LOGIC_VECTOR(3 DOWNTO 0) ; 
  SIGNAL leds : STD_LOGIC_VECTOR(6 DOWNTO 0) ;
  
BEGIN  

--Component Instatiation
  UUT : ENTITY work.hex_to_7seg_dec
    PORT MAP (
      bin => bin,
      leds => leds
      );


  process
  begin

    bin <= "0000"; wait for 30 ns; assert (leds = "0000001") report "0 failed";
    bin <= "0001"; wait for 30 ns; assert (leds = "1001111") report "1 failed";
    bin <= "0010"; wait for 30 ns; assert (leds = "0010010") report "2 failed";
    bin <= "0011"; wait for 30 ns; assert (leds = "0000110") report "3 failed";
    bin <= "0100"; wait for 30 ns; assert (leds = "1001100") report "4 failed";
    bin <= "0101"; wait for 30 ns; assert (leds = "0100100") report "5 failed";
    bin <= "0110"; wait for 30 ns; assert (leds = "0100000") report "6 failed";
    bin <= "0111"; wait for 30 ns; assert (leds = "0001111") report "7 failed";
    bin <= "1000"; wait for 30 ns; assert (leds = "0000000") report "8 failed";
    bin <= "1001"; wait for 30 ns; assert (leds = "0000100") report "9 failed";
    bin <= "1010"; wait for 30 ns; assert (leds = "0001000") report "A failed";
    bin <= "1011"; wait for 30 ns; assert (leds = "1100000") report "b failed";
    bin <= "1100"; wait for 30 ns; assert (leds = "0110001") report "C failed";
    bin <= "1101"; wait for 30 ns; assert (leds = "1000010") report "d failed";
    bin <= "1110"; wait for 30 ns; assert (leds = "0110000") report "E failed";
    bin <= "1111"; wait for 30 ns; assert (leds = "0111000") report "F failed";
    
    report "SIMULATION FINISHED";
    wait;

  end process;

END BHV;
