/*

	A progressive or regressive counter
	
	input		enable	- enables the counter to increment or decrement depending on
								  	the type of counter desired
	input		reset		- resets counter to zero
	input		load		- loads the counter with an initial value from data_in
	input		data_in	- the value to be loaded
	input		mode		- choose if the counter increments or decrements
	input		clock		- clock of the counter
	output	count		- the output count

*/

module Counter (enable, reset, load, data_in, count, mode, clock);
	parameter WIDTH = 3;
	// signal directions
	input enable, reset, load, mode, clock;
	input [WIDTH-1:0] data_in;
	output [WIDTH-1:0] count;
	// explicitly define the type of the output to Register
	reg [WIDTH-1:0] count; // output inside procedural block
	
	// main procedure block
	always @ (posedge clock) begin
		if (reset) count <= {WIDTH{1'b0}};
		else begin
			if (enable) begin
				// loads initial value
				if (load) count <= data_in;
				// progressive counter
				else if (mode == 1) count <= count + 1;
				// regressive counter
				else if (mode == 0) count <= count - 1;
			end // end if [enable]
		end // end else [reset]
	end // end always

endmodule
