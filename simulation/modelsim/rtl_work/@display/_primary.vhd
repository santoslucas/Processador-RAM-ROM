library verilog;
use verilog.vl_types.all;
entity Display is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        saida           : out    vl_logic_vector(6 downto 0)
    );
end Display;
