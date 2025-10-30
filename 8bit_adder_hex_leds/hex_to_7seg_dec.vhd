-- Name: Angela Luca
-- Section #: 23200
-- Description: 4to7 decoder to use DE10-Lite Hex active-low LEDs

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY hex_to_7seg_dec IS
    PORT ( 
        bin : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ; --4 bit binary input representing hex
        leds : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ); --active low outputs (a,b,c,e,e,f,g)
END hex_to_7seg_dec ;

ARCHITECTURE BHV OF hex_to_7seg_dec IS
BEGIN
    WITH bin SELECT
		leds <= "0000001" WHEN "0000",  --0
				"1001111" WHEN "0001",  --1
				"0010010" WHEN "0010",  --2
                "0000110" WHEN "0011",  --3
                "1001100" WHEN "0100",  --4
                "0100100" WHEN "0101",  --5
                "0100000" WHEN "0110",  --6
                "0001111" WHEN "0111",  --7
                "0000000" WHEN "1000",  --8
                "0000100" WHEN "1001",  --9
                "0001000" WHEN "1010",  --A
                "1100000" WHEN "1011",  --b
                "0110001" WHEN "1100",  --C
                "1000010" WHEN "1101",  --d
                "0110000" WHEN "1110",  --E
                "0111000" WHEN "1111",  --F
				"1111111" WHEN OTHERS ; --All are off so nothing
END BHV ;