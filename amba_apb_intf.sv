//top_amba_apb interface
interface amba_apb_intf (input bit pclk,preset);
	
	bit transfer;
	bit mpwrite;
	bit [7:0] apb_write_paddr;
	bit [7:0] apb_write_data;
	bit [7:0] apb_read_paddr;

	bit [7:0] prdata;
	bit [7:0] apb_read_data_out;
	bit psel;
	bit penable;

clocking cb_amba_apb @(posedge pclk);
	default input #1 output #0;

		output transfer;
		output mpwrite;
		output apb_write_paddr;
		output apb_write_data;
		output apb_read_paddr;

		input prdata;
		input apb_read_data_out;
		input psel;
		input penable;

endclocking

endinterface
