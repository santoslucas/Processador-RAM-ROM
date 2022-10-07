library verilog;
use verilog.vl_types.all;
entity regn is
    port(
        BusWires        : in     vl_logic_vector(15 downto 0);
        Resetn          : in     vl_logic;
        enable          : in     vl_logic;
        Clock           : in     vl_logic;
        dado            : out    vl_logic_vector(15 downto 0)
    );
end regn;
