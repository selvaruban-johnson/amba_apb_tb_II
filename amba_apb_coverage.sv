//covergroup
class amba_apb_coverage;

	virtual amba_apb_intf i;

	covergroup cg @(posedge i.pclk);

		transfer : coverpoint i.transfer;
		mpwrite : coverpoint i.mpwrite;
		apb_write_paddr : coverpoint i.apb_write_paddr {bins p1 = {8'h0};}
		apb_write_data : coverpoint i.apb_write_data {bins d1 = {8'h0};}
		apb_read_paddr : coverpoint i.apb_read_paddr {bins p2 = {8'h0};}
		prdata : coverpoint i.prdata {bins pr1 = {8'h0};}
		apb_read_data_out : coverpoint i.apb_read_data_out {bins d2 = {8'h0};}
		penable : coverpoint i.penable;
		psel : coverpoint i.psel;
		
	endgroup

	function new(virtual amba_apb_intf i);
		this.i = i;
		cg = new();
	endfunction

	task sample();
		cg.sample();
	endtask

endclass
