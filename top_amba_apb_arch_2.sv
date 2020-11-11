`include "top_amba_apb.sv"
`include "amba_apb_packet.sv"
`include "amba_apb_intf.sv"
`include "amba_apb_rintf.sv"
`include "amba_apb_generator.sv"
`include "amba_apb_driver.sv"
`include "amba_apb_monitor.sv"
`include "amba_apb_scoreboard.sv"
`include "amba_apb_coverage.sv"
`include "amba_apb_environment.sv"
`include "amba_apb_tester.sv"


//top
module top_amba_apb_arch_2;
	bit pclk,preset;
//Clock generation
initial
begin 
pclk = 1'b0;
forever
#5 pclk = ~pclk;
end

//Reset generation
initial 
begin
preset=1'b1;
#10;
preset=1'b0;
#50;
preset=1'b1;
#10;
preset=1'b0;
end

	amba_apb_intf i(pclk,preset); 
	amba_apb_rintf j(pclk,preset);
	amba_apb_tester t1(i,j);

	top_amba_apb ta1 
		 (
		 .pclk(pclk),.preset(preset),.transfer(i.transfer),.mpwrite(i.mpwrite),.apb_write_paddr(i.apb_write_paddr),.apb_write_data(i.apb_write_data),.apb_read_paddr(i.apb_read_paddr),.prdata(i.prdata),.apb_read_data_out(i.apb_read_data_out),.psel(i.psel),.penable(i.penable)
                 );

	top_amba_apb ta2 
		 (
		 .pclk(pclk),.preset(preset),.transfer(j.transfer),.mpwrite(j.mpwrite),.apb_write_paddr(j.apb_write_paddr),.apb_write_data(j.apb_write_data),.apb_read_paddr(j.apb_read_paddr),.prdata(j.prdata),.apb_read_data_out(j.apb_read_data_out),.psel(j.psel),.penable(j.penable)
                 );

	//amba_apb_slave z1(.pclk(i.pclk),.preset(i.preset),.psel(i.psel),.penable(i.penable),.pwrite(i.pwrite),.paddr(i.paddr),.pwdata(i.pwdata),.prdata(i.prdata),.pready(i.pready));
	
		

endmodule
