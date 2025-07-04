// =============================================
// Task 4: FIR Filter Design and Testbench
// =============================================

module FIR_Filter (
    input clk,
    input reset,
    input [7:0] x_in,
    output reg [15:0] y_out
);

parameter N = 4;
reg [7:0] x_reg [0:N-1];
reg [7:0] h [0:N-1];

integer i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < N; i = i + 1)
            x_reg[i] <= 0;
        y_out <= 0;

        // Example coefficients
        h[0] <= 1;
        h[1] <= 2;
        h[2] <= 3;
        h[3] <= 4;
    end else begin
        for (i = N-1; i > 0; i = i - 1)
            x_reg[i] <= x_reg[i-1];
        x_reg[0] <= x_in;

        y_out <= h[0]*x_reg[0] + h[1]*x_reg[1] + h[2]*x_reg[2] + h[3]*x_reg[3];
    end
end

endmodule


module FIR_Filter_tb;

reg clk;
reg reset;
reg [7:0] x_in;
wire [15:0] y_out;

FIR_Filter uut (
    .clk(clk),
    .reset(reset),
    .x_in(x_in),
    .y_out(y_out)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, FIR_Filter_tb);

    clk = 0;
    reset = 1;
    x_in = 0;

    #10 reset = 0;

    #10 x_in = 8'd5;
    #10 x_in = 8'd10;
    #10 x_in = 8'd15;
    #10 x_in = 8'd20;
    #10 x_in = 8'd25;

    #50 $finish;
end

always #5 clk = ~clk;

endmodule
