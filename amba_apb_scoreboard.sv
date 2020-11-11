//scoreboard
class amba_apb_scoreboard;
amba_apb_packet pkt1,pkt2;

mailbox #(amba_apb_packet)mb_mon_sb;
mailbox #(amba_apb_packet)mb_mon_sb2;


function new(mailbox #(amba_apb_packet)mb_mon_sb,mailbox #(amba_apb_packet)mb_mon_sb2);
	this.mb_mon_sb = mb_mon_sb;
	this.mb_mon_sb2 = mb_mon_sb2;
endfunction

task run();

mb_mon_sb.get(pkt1);
mb_mon_sb2.get(pkt2);

assert(pkt1.prdata==pkt2.prdata && pkt1.apb_read_data_out==pkt2.apb_read_data_out && pkt1.psel==pkt2.psel && pkt1.penable==pkt2.penable)
begin
$display("Design is okay.");
end
else
begin
$display("Design is not okay.");
end
endtask
endclass


