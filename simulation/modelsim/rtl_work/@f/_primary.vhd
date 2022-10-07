library verilog;
use verilog.vl_types.all;
entity F is
    port(
        F_in            : in     vl_logic;
        zero            : in     vl_logic;
        Clock           : in     vl_logic;
        f               : out    vl_logic
    );
end F;
