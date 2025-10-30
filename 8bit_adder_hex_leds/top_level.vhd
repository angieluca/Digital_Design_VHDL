-- Name: Angela Luca
-- Section #: 23200
-- Description: Top level that displays on LED1 most sig 4 bits and LED0 least sig 4 bit of addition

library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  PORT (
    input1      : in  std_logic_vector(7 downto 0);
    input2      : in  std_logic_vector(7 downto 0);
    carry_in_L  : in  std_logic;
    sum         : out std_logic_vector(7 downto 0);
    carry_out_L : out std_logic;
    leds_high_L : out std_logic_vector(6 downto 0);
    leds_low_L  : out std_logic_vector(6 downto 0));
end top_level;

ARCHITECTURE STR of top_level IS

    SIGNAL sum_temp       : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL carry_out_temp : STD_LOGIC;

    --NEEDED FOR HARDCODING:
    SIGNAL input1_hardcode : std_logic_vector(7 downto 0);
    SIGNAL input2_hardcode : std_logic_vector(7 downto 0);

    COMPONENT ripple_adder_8bit 
        PORT (
            input1    : in  std_logic_vector(7 downto 0);
            input2    : in  std_logic_vector(7 downto 0);
            carry_in  : in  std_logic;
            sum       : out std_logic_vector(7 downto 0);
            carry_out : out std_logic);
    END COMPONENT;

    COMPONENT hex_to_7seg_dec
        PORT (
            bin     :  in STD_LOGIC_VECTOR(3 DOWNTO 0) ;  --4 bit binary input representing hex
            leds    :  out STD_LOGIC_VECTOR(6 DOWNTO 0) ); --active low outputs (a,b,c,d,e,f,g)
    END COMPONENT;

BEGIN

    --HARDCODING PORTION
    input1_hardcode <= "0000" & input1(3 downto 0); --most significant 4 sig bits input 1 will be 0s
    input2_hardcode <= "0000" & input2(3 downto 0); --least 3 sig bits input 2 will be 0s

    --Calculate the actual sum
    ripple_adder_inst: ripple_adder_8bit PORT MAP ( 
        --Non hardcoded version:
        -- input1 => input1,
        -- input2 => input2,   

        --Hardcoded version:
        input1 => input1_hardcode,
        input2 => input2_hardcode,
        carry_in => carry_in_L,
        sum => sum_temp,
        carry_out => carry_out_temp );

    --Most 4 significant bits go in hex1 (use decoder to display)
    hex1_led_inst: hex_to_7seg_dec PORT MAP (
        bin => sum_temp(7 downto 4),
        leds => leds_high_L );

    --Least 4 significant bits go in hex0
    hex0_led_inst: hex_to_7seg_dec PORT MAP (
        bin => sum_temp(3 downto 0),
        leds => leds_low_L );
        
    carry_out_L <= NOT carry_out_temp; --Decimal point will be active low to rep carry out
    sum <= sum_temp;



END STR ; 