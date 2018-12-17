module tb_mult_module(
       );

parameter  WIDTH  = 64;
reg       [WIDTH-1:0]     S_data1;
reg       [WIDTH-1:0]     S_data2;
wire      [WIDTH-1:0]     F_mult;
wire                      F_over_flow;

reg  clk;


initial
begin
    clk = 0;
    S_data1 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    S_data2 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    #10;
    S_data1 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    S_data2 = 64'b1100000000000000000000000000000000000000000000000000000000000000;
    #10;
    S_data1 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    S_data2 = 64'b0100000000000000000000000000000000000000000000000000000000000000;
    #10;
    S_data1 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    S_data2 = 64'b0111111111101111111111111111111111111111111111111111111111111111;
    #10;
    S_data1 = 64'b0100000000001001001000011111101101010100010001000010110100011000;
    S_data2 = 64'b0000000000000000000000000000000000000000000000000000000000000001;
    #10;
    $finish;
end

always #5 clk <= ~clk;

mult_fp64 mult_fp64_inst(
              .I_a(S_data1),
              .I_b(S_data2),
              .O_result(F_mult),
              .O_over_flow(F_over_flow)
          );

initial
begin
    $dumpfile("mult.vcd");
    $dumpvars(0, mult_fp64_inst);
end

endmodule
