// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module edge_canny_detector_duplicate_1080_1920_s (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        gradx_mat_4210_dout,
        gradx_mat_4210_empty_n,
        gradx_mat_4210_read,
        grady_mat_4213_dout,
        grady_mat_4213_empty_n,
        grady_mat_4213_read,
        gradx1_mat_4211_din,
        gradx1_mat_4211_full_n,
        gradx1_mat_4211_write,
        gradx2_mat_4212_din,
        gradx2_mat_4212_full_n,
        gradx2_mat_4212_write,
        grady1_mat_4214_din,
        grady1_mat_4214_full_n,
        grady1_mat_4214_write,
        grady2_mat_4215_din,
        grady2_mat_4215_full_n,
        grady2_mat_4215_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [15:0] gradx_mat_4210_dout;
input   gradx_mat_4210_empty_n;
output   gradx_mat_4210_read;
input  [15:0] grady_mat_4213_dout;
input   grady_mat_4213_empty_n;
output   grady_mat_4213_read;
output  [15:0] gradx1_mat_4211_din;
input   gradx1_mat_4211_full_n;
output   gradx1_mat_4211_write;
output  [15:0] gradx2_mat_4212_din;
input   gradx2_mat_4212_full_n;
output   gradx2_mat_4212_write;
output  [15:0] grady1_mat_4214_din;
input   grady1_mat_4214_full_n;
output   grady1_mat_4214_write;
output  [15:0] grady2_mat_4215_din;
input   grady2_mat_4215_full_n;
output   grady2_mat_4215_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg gradx_mat_4210_read;
reg grady_mat_4213_read;
reg gradx1_mat_4211_write;
reg gradx2_mat_4212_write;
reg grady1_mat_4214_write;
reg grady2_mat_4215_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    gradx_mat_4210_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln116_reg_116;
reg    grady_mat_4213_blk_n;
reg    gradx1_mat_4211_blk_n;
reg    gradx2_mat_4212_blk_n;
reg    grady1_mat_4214_blk_n;
reg    grady2_mat_4215_blk_n;
reg   [20:0] indvar_flatten_reg_88;
wire   [20:0] add_ln116_fu_99_p2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln116_fu_105_p2;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_block_pp0_stage0_01001;
wire    ap_CS_fsm_state4;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln116_fu_105_p2 == 1'd0))) begin
        indvar_flatten_reg_88 <= add_ln116_fu_99_p2;
    end else if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_88 <= 21'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln116_reg_116 <= icmp_ln116_fu_105_p2;
    end
end

always @ (*) begin
    if ((icmp_ln116_fu_105_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx1_mat_4211_blk_n = gradx1_mat_4211_full_n;
    end else begin
        gradx1_mat_4211_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx1_mat_4211_write = 1'b1;
    end else begin
        gradx1_mat_4211_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx2_mat_4212_blk_n = gradx2_mat_4212_full_n;
    end else begin
        gradx2_mat_4212_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx2_mat_4212_write = 1'b1;
    end else begin
        gradx2_mat_4212_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx_mat_4210_blk_n = gradx_mat_4210_empty_n;
    end else begin
        gradx_mat_4210_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        gradx_mat_4210_read = 1'b1;
    end else begin
        gradx_mat_4210_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady1_mat_4214_blk_n = grady1_mat_4214_full_n;
    end else begin
        grady1_mat_4214_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady1_mat_4214_write = 1'b1;
    end else begin
        grady1_mat_4214_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady2_mat_4215_blk_n = grady2_mat_4215_full_n;
    end else begin
        grady2_mat_4215_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady2_mat_4215_write = 1'b1;
    end else begin
        grady2_mat_4215_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady_mat_4213_blk_n = grady_mat_4213_empty_n;
    end else begin
        grady_mat_4213_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln116_reg_116 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grady_mat_4213_read = 1'b1;
    end else begin
        grady_mat_4213_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln116_fu_105_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln116_fu_105_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln116_fu_99_p2 = (indvar_flatten_reg_88 + 21'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((icmp_ln116_reg_116 == 1'd0) & (gradx1_mat_4211_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady_mat_4213_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx_mat_4210_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady2_mat_4215_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady1_mat_4214_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx2_mat_4212_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((icmp_ln116_reg_116 == 1'd0) & (gradx1_mat_4211_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady_mat_4213_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx_mat_4210_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady2_mat_4215_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady1_mat_4214_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx2_mat_4212_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((icmp_ln116_reg_116 == 1'd0) & (gradx1_mat_4211_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady_mat_4213_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx_mat_4210_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady2_mat_4215_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady1_mat_4214_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx2_mat_4212_full_n == 1'b0))));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((icmp_ln116_reg_116 == 1'd0) & (gradx1_mat_4211_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady_mat_4213_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx_mat_4210_empty_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady2_mat_4215_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (grady1_mat_4214_full_n == 1'b0)) | ((icmp_ln116_reg_116 == 1'd0) & (gradx2_mat_4212_full_n == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign gradx1_mat_4211_din = gradx_mat_4210_dout;

assign gradx2_mat_4212_din = gradx_mat_4210_dout;

assign grady1_mat_4214_din = grady_mat_4213_dout;

assign grady2_mat_4215_din = grady_mat_4213_dout;

assign icmp_ln116_fu_105_p2 = ((indvar_flatten_reg_88 == 21'd2073600) ? 1'b1 : 1'b0);

assign start_out = real_start;

endmodule //edge_canny_detector_duplicate_1080_1920_s