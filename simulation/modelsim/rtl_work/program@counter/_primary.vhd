library verilog;
use verilog.vl_types.all;
entity programCounter is
    port(
        BusWires        : in     vl_logic_vector(15 downto 0);
        Resetn          : in     vl_logic;
        pc_incr         : in     vl_logic;
        pc_in           : in     vl_logic;
        Clock           : in     vl_logic;
        pc              : out    vl_logic_vector(15 downto 0)
    );
end programCounter;
