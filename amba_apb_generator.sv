//top_amba_apb generator
class amba_apb_generator;
	amba_apb_packet pkt;
	mailbox #(amba_apb_packet) mb_gen_drv;
	function new(mailbox #(amba_apb_packet) mb_gen_drv);
		this.mb_gen_drv = mb_gen_drv;
	endfunction

	task run();
		$display("GENERATOR OUTPUT");
		pkt = new();
		assert(pkt.randomize())
		begin
			$display("randomization successful");
			mb_gen_drv.put(pkt);
		end
		else
			$fatal("Randomization failed!");
		$display("");
		$display("");
	endtask
endclass
