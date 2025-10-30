-- Name: Angela Luca
-- Section #: 23200
-- Description: 4to1 mux with active low enable and active low output


LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY mux4to1 IS
    PORT ( 
        d0, d1, d2, d3 : IN STD_LOGIC ;
        en : IN STD_LOGIC ;   --active low enable
        s : IN STD_LOGIC_VECTOR(1 DOWNTO 0) ;
        y : OUT STD_LOGIC ) ; --active low output
END mux4to1 ;

ARCHITECTURE BHV OF mux4to1 IS
    SIGNAL temp_y, temp_en : STD_LOGIC; --internal temp signals b/c active lows
BEGIN
    temp_en <= NOT en;
    temp_y <= d0 WHEN (s ="00" AND temp_en ='1') ELSE
              d1 WHEN (s ="01" AND temp_en ='1') ELSE
              d2 WHEN (s ="10" AND temp_en ='1') ELSE
              d3 WHEN (s ="11" AND temp_en ='1') ELSE
              '0'; --false enabler means 0 here but later 1 (high) b/c active low
    y <= NOT temp_y;
END BHV ;