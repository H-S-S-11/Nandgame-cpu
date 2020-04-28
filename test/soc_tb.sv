module soc_tb();

logic clk, p_reset_o;
logic [15:0] seven_seg_i;

soc u1
(
    .clk(clk),
    .p_sync_reset(p_reset_o),
    .seven_seg_o(seven_seg_i)
);

initial begin
    p_reset_o = 1;
    clk = 0;
    #20ns p_reset_o = 0;
end

always begin
    #5ns clk = ~clk;
end
    
endmodule