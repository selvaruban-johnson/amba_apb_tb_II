//monitor
class amba_apb_monitor;
amba_apb_packet pkt1,pkt2;
mailbox #(amba_apb_packet) mb_mon_sb;
mailbox #(amba_apb_packet) mb_mon_sb2;
virtual amba_apb_intf i;
virtual amba_apb_rintf j;

function new(mailbox #(amba_apb_packet) mb_mon_sb,mailbox #(amba_apb_packet) mb_mon_sb2,virtual amba_apb_intf i,virtual amba_apb_rintf j);
	this.mb_mon_sb = mb_mon_sb;
	this.mb_mon_sb2 = mb_mon_sb2;
	this.i = i;
	this.j=j;
endfunction

task run();
pkt1 = new();
pkt2 = new();

	pkt1.transfer = i.transfer;
	pkt1.mpwrite = i.mpwrite;
	pkt1.apb_write_paddr = i.apb_write_paddr;
	pkt1.apb_write_data = i.apb_write_data;
	pkt1.apb_read_paddr = i.apb_read_paddr;
	pkt1.prdata = i.prdata;
	pkt1.apb_read_data_out = i.apb_read_data_out;
	pkt1.psel = i.psel;
	pkt1.penable = i.penable;

	pkt2.transfer = i.transfer;
	pkt2.mpwrite = i.mpwrite;
	pkt2.apb_write_paddr = i.apb_write_paddr;
	pkt2.apb_write_data = i.apb_write_data;
	pkt2.apb_read_paddr = i.apb_read_paddr;
	pkt2.prdata = i.prdata;
	pkt2.apb_read_data_out = i.apb_read_data_out;
	pkt2.psel = i.psel;
	pkt2.penable = i.penable;

$display($time," pkt1.transfer=%0b pkt1.mpwrite=%0b pkt1.apb_write_paddr=%0b pkt1.apb_write_data=%0b pkt1.apb_read_paddr=%0b pkt1.prdata=%0b pkt1.apb_read_data_out=%0b pkt1.psel=%0b pkt1.penable=%0b",pkt1.transfer,pkt1.mpwrite,pkt1.apb_write_paddr,pkt1.apb_write_data,pkt1.apb_read_paddr,pkt1.prdata,pkt1.apb_read_data_out,pkt1.psel,pkt1.penable);
$display($time," pkt2.transfer=%0b pkt2.mpwrite=%0b pkt2.apb_write_paddr=%0b pkt2.apb_write_data=%0b pkt2.apb_read_paddr=%0b pkt2.prdata=%0b pkt2.apb_read_data_out=%0b pkt2.psel=%0b pkt2.penable=%0b",pkt2.transfer,pkt2.mpwrite,pkt2.apb_write_paddr,pkt2.apb_write_data,pkt2.apb_read_paddr,pkt2.prdata,pkt2.apb_read_data_out,pkt2.psel,pkt2.penable);

mb_mon_sb.put(pkt1);
mb_mon_sb2.put(pkt2);

endtask
endclass
