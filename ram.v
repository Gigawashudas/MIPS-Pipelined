// file: ram.v
// author: @mohamed_minawi
`timescale 1ns/1ns

module ram #(parameter depth = 128, width = 32)(
    input clk,
    input write_enable,
    input [31:0] addr,             // Full 32-bit address input
    input [width-1:0] din,         // Data input
    output [width-1:0] dout        // Data output
);

    // Memory array
    reg [width-1:0] Dmem [depth-1:0];
    
    // Ensure addressing is within range
    wire [6:0] addr_index = addr[6:0]; // Use lower 7 bits for indexing

    // Output logic
    assign dout = write_enable ? din : Dmem[addr_index]; // Reflect write on dout if enabled
    
    // Write logic
    always @(posedge clk) begin
        if (write_enable) 
            Dmem[addr_index] <= din; 
    end

endmodule
