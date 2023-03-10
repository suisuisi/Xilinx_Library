#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("src_TDATA", 24, hls_in, 0, "axis", "in_data", 1),
	Port_Property("src_TKEEP", 3, hls_in, 1, "axis", "in_data", 1),
	Port_Property("src_TSTRB", 3, hls_in, 2, "axis", "in_data", 1),
	Port_Property("src_TUSER", 1, hls_in, 3, "axis", "in_data", 1),
	Port_Property("src_TLAST", 1, hls_in, 4, "axis", "in_data", 1),
	Port_Property("src_TID", 1, hls_in, 5, "axis", "in_data", 1),
	Port_Property("src_TDEST", 1, hls_in, 6, "axis", "in_data", 1),
	Port_Property("dst_TDATA", 24, hls_out, 7, "axis", "out_data", 1),
	Port_Property("dst_TKEEP", 3, hls_out, 8, "axis", "out_data", 1),
	Port_Property("dst_TSTRB", 3, hls_out, 9, "axis", "out_data", 1),
	Port_Property("dst_TUSER", 1, hls_out, 10, "axis", "out_data", 1),
	Port_Property("dst_TLAST", 1, hls_out, 11, "axis", "out_data", 1),
	Port_Property("dst_TID", 1, hls_out, 12, "axis", "out_data", 1),
	Port_Property("dst_TDEST", 1, hls_out, 13, "axis", "out_data", 1),
	Port_Property("lowthreshold", 8, hls_in, 14, "ap_vld", "in_data", 1),
	Port_Property("highthreshold", 8, hls_in, 15, "ap_vld", "in_data", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("src_TVALID", 1, hls_in, 6, "axis", "in_vld", 1),
	Port_Property("src_TREADY", 1, hls_out, 6, "axis", "in_acc", 1),
	Port_Property("lowthreshold_ap_vld", 1, hls_in, 14, "ap_vld", "in_vld", 1),
	Port_Property("highthreshold_ap_vld", 1, hls_in, 15, "ap_vld", "in_vld", 1),
	Port_Property("dst_TVALID", 1, hls_out, 13, "axis", "out_vld", 1),
	Port_Property("dst_TREADY", 1, hls_in, 13, "axis", "out_acc", 1),
};
const char* HLS_Design_Meta::dut_name = "edge_canny_detector";
