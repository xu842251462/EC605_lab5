`timescale 1ns / 1ns

`define OP_AND   4'b0000
`define OP_OR    4'b0001
`define OP_ADD   4'b0010
`define OP_SUB   4'b0011
`define OP_SLT   4'b0100
`define OP_NOR   4'b0101

module t_alu();
	reg [63:0] a;
	reg [63:0] b;
	reg [3:0] op;

	wire [63:0] out;
    wire zero;
	reg clk;
	reg rst;
	
	Alu uut(
		.a_data(a),
		.b_data(b),
		.alu_op(op),
		.out(out),
		.clk(clk),
		.rst(rst),
		.zero(zero)
	);

	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1;
		#10 rst = 0;
	end

	initial begin
		a <= 0;
		b <= 0;
		op <= 0;
	end

	initial begin
		
		#10;
		a <= 7; b <= 5; op <= `OP_AND;
		#10; op <= `OP_ADD;
		#10; op <= `OP_SUB;
		#10; op <= `OP_SLT;
		#10; op <= `OP_OR;
		#10; op <= `OP_NOR;
		#10; a <= 5; b <= 7;
	
		#30; $finish;
	end

endmodule
