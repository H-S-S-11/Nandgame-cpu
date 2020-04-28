// A SystemVerilog wrapper for the Nandgame CPU, making it easier to extend with other modules

module soc(
    input logic clk, p_sync_reset,
    output logic [15:0] seven_seg_o
);

logic [15:0] pc_i, j_reg_i, d_reg_i;
    
cpu core1
(
    .cl(clk),
    .pc(pc_i),
    .j_reg(j_reg_i),
    .d_reg_o(d_reg_i),
    .seven_seg_o(seven_seg_o),
    .pc_reset(sync_reset_p)
);

endmodule