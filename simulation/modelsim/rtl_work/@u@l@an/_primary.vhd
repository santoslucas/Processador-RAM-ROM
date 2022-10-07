library verilog;
use verilog.vl_types.all;
entity ULAn is
    port(
        in_1            : in     vl_logic_vector(15 downto 0);
        in_2            : in     vl_logic_vector(15 downto 0);
        OPcode          : in     vl_logic_vector(1 downto 0);
        result          : out    vl_logic_vector(15 downto 0);
        zero            : out    vl_logic
    );
end ULAn;
