//driver
class amba_apb_driver;
	amba_apb_packet pkt;
	mailbox #(amba_apb_packet) mb_gen_drv;
	virtual amba_apb_intf i;
	virtual amba_apb_rintf j;
	
	function new(mailbox #(amba_apb_packet) mb_gen_drv,virtual amba_apb_intf i,virtual amba_apb_rintf j);
	this.mb_gen_drv = mb_gen_drv;
	this.i=i;
	this.j=j;
	endfunction

	task run();
	mb_gen_drv.get(pkt);
	
	i.transfer=pkt.transfer;
	i.mpwrite=pkt.mpwrite;
	i.apb_write_paddr=pkt.apb_write_paddr;
	i.apb_write_data=pkt.apb_write_data;
	i.apb_read_paddr=pkt.apb_read_paddr;

	j.transfer=pkt.transfer;
	j.mpwrite=pkt.mpwrite;
	j.apb_write_paddr=pkt.apb_write_paddr;
	j.apb_write_data=pkt.apb_write_data;
	j.apb_read_paddr=pkt.apb_read_paddr;

	endtask
endclass 
