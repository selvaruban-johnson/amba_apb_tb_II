//environment
class amba_apb_environment;

	

	mailbox #(amba_apb_packet) mb_gen_drv;
	mailbox #(amba_apb_packet) mb_mon_scb;
	mailbox #(amba_apb_packet) mb_mon_scb2;
	
	virtual amba_apb_intf i;
	virtual amba_apb_rintf j;

	amba_apb_generator dutGen;
	amba_apb_driver dutDrv;
	amba_apb_monitor dutMon;
	amba_apb_coverage dutCov;
	amba_apb_scoreboard dutScb;
	

	function new(virtual amba_apb_intf i , virtual amba_apb_rintf j);
		this.i = i;
		this.j = j;
	endfunction

	function void build();

		mb_gen_drv = new();
		mb_mon_scb = new();
		mb_mon_scb2 = new();


		dutGen = new(mb_gen_drv);
		dutDrv = new(mb_gen_drv,i,j);
		dutMon = new(mb_mon_scb,mb_mon_scb2,i,j);
		dutScb = new(mb_mon_scb,mb_mon_scb2);
		dutCov = new(i);
	endfunction

	task run();
		fork
		dutGen.run();
		dutDrv.run();
		dutMon.run();
		dutCov.sample();
		dutScb.run();
		join
	endtask

endclass 
