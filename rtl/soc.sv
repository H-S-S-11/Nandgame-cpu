// A SystemVerilog wrapper for the Nandgame CPU, making it easier to extend with other modules

module soc(
    input logic clk, p_sync_reset, byte_sel
    output logic [7:0] leds_o
);

logic [15:0] pc_i, j_reg_i, d_reg_i, seven_seg_i;
    
cpu core1
(
    .cl(clk),
    .pc(pc_i),
    .j_reg(j_reg_i),
    .d_reg_o(d_reg_i),
    .seven_seg_o(seven_seg_i),
    .pc_reset(p_sync_reset)
);

assign leds_o = byte_select ? ~seven_seg_i[15:8] : ~seven_seg_i[7:0];

endmodule