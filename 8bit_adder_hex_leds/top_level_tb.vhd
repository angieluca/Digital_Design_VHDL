-- Name: Angela Luca
-- Section #: 23200
-- Description: Top level that displays on LEDs 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_tb is
end top_level_tb;

architecture TB of top_level_tb is

    SIGNAL input1, input2, sum   : std_logic_vector(7 downto 0);
    SIGNAL leds_high_L, leds_low_L : std_logic_vector(6 downto 0);
    SIGNAL carry_in_L, carry_out_L : std_logic;

begin 

  UUT : entity work.top_level
    port map (
      input1     => input1,
      input2     => input2,
      carry_in_L   => carry_in_L,
      sum        => sum,
      carry_out_L  => carry_out_L,
      leds_high_L => leds_high_L,
      leds_low_L => leds_low_L);


  process

    function sum_test (
      constant in1      : integer;
      constant in2      : integer;
      constant carry_in : integer)
      return std_logic_vector is
    begin
      return std_logic_vector(to_unsigned((in1+in2+carry_in) mod 256, 8));
    end sum_test;

    function carry_test (
      constant in1      : integer;
      constant in2      : integer;
      constant carry_in : integer)
      return std_logic is
    begin
      if (in1+in2+carry_in > 255) then
        return '0'; --NOTE!!! These are opposite because carry out is active low so 0 means yes there is a carry out
      else
        return '1';
      end if;
    end carry_test;

  begin
    --Test sum
    --Test all input combinations
    for i in 0 to 255 loop
      for j in 0 to 255 loop
        for k in 0 to 1 loop

          input1     <= std_logic_vector(to_unsigned(i, 8));
          input2     <= std_logic_vector(to_unsigned(j, 8));
          carry_in_L <= std_logic(to_unsigned(k, 1)(0));
          wait for 80 ns;
          assert(sum = sum_test(i,j,k)) report "Sum incorrect";
          assert(carry_out_L = carry_test(i,j,k)) report "Carry incorrect";

        end loop;  -- k
      end loop;  -- j
    end loop;  -- i

    -- --Test decoder 
    input1 <= x"0F";
    input2 <= x"01";
    carry_in_L <= '0';
    wait for 80 ns;
    assert(sum = x"10") report "Decoder is wrong!";
    assert(leds_high_L = "1001111") report "High nibble is wrong!";
    assert(leds_low_L  = "0000001") report "Low nibble is wrong!";

    


    report "SIMULATION FINISHED!";
    
    wait;

  end process;

end TB;
