parameter SIZE = 4;

typedef enum {
	ADD,
	SUB,
	NEGATE
} ALU_FUNCTION;

module alu (
	input logic[SIZE-1:0] a,
	input logic[SIZE-1:0] b,
	input ALU_FUNCTION func,
	
	output logic[SIZE-1:0] out,
	output logic overflow
);
	logic adder_out;
	logic negator_out;
	logic adder_overflow;

	full_adder #(.SIZE(SIZE)) adder(
			.a(a),
			.b(b),
			.out(adder_out),
			.overflow(adder_overflow)
			);
			
	tc_negate negator(
				.in(a),
				.out(negator_out)
			);
	
	always_comb begin
		case (func)
			ADD: out = adder_out;
			SUB: out = 0;
			NEGATE: out = negator_out;
			default: out = 0;
		endcase
	end
endmodule