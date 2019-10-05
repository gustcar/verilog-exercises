

// The position of the ONE bit in the ONE HOT format is the same position as its
// array index
// 
// n bit input | binary | one hot
// ------------------------------------------------------
//                      | bit position 
//                      | 3 2 1 0
// ------------------------------------------------------
// 1             0      |     0 1 - one is put in position 0
//               1      |     1 0 - one is put in position 1
// ------------------------------------------------------
// 2             0 0 (0)| 0 0 0 1 - position 0 => array_out[0]
//               0 1 (1)| 0 0 1 0 - position 1 => array_out[1]
//               1 0 (2)| 0 1 0 0 - position 2 => array_out[2]
//               1 1 (3)| 1 0 0 0 - position 3 => array_out[3]
// ------------------------------------------------------
// and so on for 3, 4, 5... n.

// Naming Convension used:
// Module: Proper_Case
// Variables, signals: snake_case
// parameters: snake_case (uppercased)

module One_Hot_Decoder
#(
parameter integer WIDTH_INPUT = 2,
parameter integer WIDTH_OUTPUT = 2**WIDTH_INPUT,
)
(
	enable,
	array_in,
	array_out
);

input  [WIDTH_INPUT-1: 0] 	array_in;
input                 			enable;
output [WIDTH_OUTPUT-1: 0] 	array_out;

integer decimal_index;

always @(*)
begin
	if (enable) begin
		// set all the output array to zero
		array_out = 0;
		// cast the array input value to integer
		// The binary input is converted to decimal
		decimal_index = array_in;		
		// set one in the right position
		array_out[decimal_index] = 1'b1;
	end
end

endmodule
