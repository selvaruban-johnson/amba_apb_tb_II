//top_amba_apb packet
class amba_apb_packet;

	rand logic transfer;
	rand logic mpwrite;
	rand logic [7:0] apb_write_paddr;
	rand logic [7:0] apb_write_data;
	rand logic [7:0] apb_read_paddr;

	logic [7:0] prdata;
	logic [7:0] apb_read_data_out;
	logic psel;
	logic penable;

endclass
