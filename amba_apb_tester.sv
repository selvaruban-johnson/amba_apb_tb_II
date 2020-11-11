//test
module amba_apb_tester (amba_apb_intf i, amba_apb_rintf j);

	amba_apb_environment dutEnv;

	initial
	begin
		dutEnv = new(i,j);
		dutEnv.build();
		repeat(20000)
		begin
			#10 dutEnv.run();
		end
	end

endmodule


