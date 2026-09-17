module adder (
    input logic a,
	 input logic b,
	 input logic carry_in,
	 
	 output logic sum,
	 output logic carry_out
);

	assign sum = a ^ b ^ carry_in;
	assign carry_out = (a & b) | (b & carry_in) | (a & carry_in);

endmodule

module full_adder #(parameter SIZE) (
	input logic[SIZE-1:0] a,
	input logic[SIZE-1:0] b,
	
	output logic[SIZE-1:0] out,
	output logic overflow
);
	logic[SIZE-1:0] adder_carries;

	genvar i;
	generate
	for (i = 0; i < SIZE; i++) begin : adder
		adder adder(
		.a(a[i]),
		.b(b[i]),
		.carry_in(i == 0 ? 0 : adder_carries[i-1]),
		.sum(out[i]),
		.carry_out(adder_carries[i])
		);
	end
	endgenerate
	
	assign overflow = adder_carries[SIZE-1];
endmodule

module tc_negate(
	input logic[SIZE-1:0] in,
	
	output logic[SIZE-1:0] out
);
	logic[SIZE-1:0] temp;
	assign temp = ~in;
	assign out = temp + 1;
	
endmodule