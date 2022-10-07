library verilog;
use verilog.vl_types.all;
entity W is
    port(
        W_D             : in     vl_logic;
        Clock           : in     vl_logic;
        w               : out    vl_logic
    );
end W;
