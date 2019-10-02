/*
	Ripple Carry Adder
*/

module RippleCarryAdder (sum, carry_out, carry_in, var1, var2);
	input var1, var2, carry_in;
	output sum, carry_out;
	reg sum, carry_out
	//wire sum, carry_out;
	
	always @ (var1, var2, carry_in) begin
		sum = var1 ^ var2 ^ carry_in;
		carry_out = (var1 & var2) | (var2 & carry_in) | (carry_in & var1);
	end
	
	/*
	assign sum = var1 ^ var2 ^ carry_in;
	assign carry_out = (var1 & var2) | (var2 & carry_in) | (carry_in & var1);
	*/


endmodule
