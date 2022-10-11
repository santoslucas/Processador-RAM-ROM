library verilog;
use verilog.vl_types.all;
entity Clock_divider is
    generic(
        DIVISOR         : vl_logic_vector(0 to 29) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        clock_in        : in     vl_logic;
        clock_out       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DIVISOR : constant is 1;
end Clock_divider;
