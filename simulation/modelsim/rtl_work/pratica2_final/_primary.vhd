library verilog;
use verilog.vl_types.all;
entity pratica2_final is
    port(
        SW              : in     vl_logic_vector(17 downto 0);
        CLOCK_50        : in     vl_logic;
        HEX7            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        LEDG            : out    vl_logic_vector(7 downto 0)
    );
end pratica2_final;
