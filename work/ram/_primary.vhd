library verilog;
use verilog.vl_types.all;
entity ram is
    generic(
        depth           : integer := 128;
        width           : integer := 32
    );
    port(
        clk             : in     vl_logic;
        write_enable    : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        din             : in     vl_logic_vector;
        dout            : out    vl_logic_vector
    );
end ram;
