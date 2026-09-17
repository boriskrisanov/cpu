parameter SIZE = 4;

typedef enum {
	ADD,
	SUB
} ALU_FUNCTION;

module alu (
	input logic[SIZE-1:0] a,
	input logic[SIZE-1:0] b,
	input ALU_FUNCTION func,
	
	output logic[SIZE-1:0] out,
	output logic overflow
);
	case (func) begin
		ADD:
			full_adder #(.SIZE(SIZE)) adder(
			.a(a),
			.b(b),
			.out(out),
			.overflow(overflow)
			);
		SUB:
			tc_negate(
				.in(a),
				.out(out)
			);
		default: assign out = 0;
	endcase
endmodule