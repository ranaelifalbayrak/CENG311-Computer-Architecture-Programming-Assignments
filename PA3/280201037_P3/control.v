module control(in, regdest, alusrc, memtoreg, regwrite, 
	       memread, memwrite, branch_eq, aluop1, aluop2, jump,branch_ne); ////

input [7:0] in;
output regdest, alusrc, memtoreg, regwrite, memread, memwrite, branch_eq, aluop1, aluop2, jump, branch_ne; ////

wire rformat,lw,sw,beq, j, addi, bne; ////

assign rformat = (~in[7]) & (~in[6]) & in[5]& (~in[4])&(~in[3])&in[2]&(~in[1])&in[0]; /////// 00100101

assign lw = (~in[7]) & (~in[6]) & in[5]& (~in[4])&(~in[3])& in[2]&in[1]&(~in[0]); ///// 00100110
assign sw = (~in[7]) & (~in[6]) & in[5]& (~in[4])&(~in[3])& in[2]&in[1]&in[0];  /////// 00100111

assign beq = (~in[7]) & (~in[6]) & in[5]& (~in[4])&in[3]& (~in[2])&(~in[1])&in[0]; //// 00101001
assign bne = (~in[7]) & (~in[6]) & in[5]& (~in[4])&in[3]& (~in[2])&in[1]&(~in[0]); //// 00101010

assign j = (~in[7]) & (~in[6]) & in[5]& (~in[4])&in[3]& (~in[2])&(~in[1])&(~in[0]); ///// 00101000

assign addi = (~in[7]) & (~in[6]) & in[5]& (~in[4])&in[3]& (~in[2])&in[1]&in[0]; ///// 00101011

assign regdest = rformat;

assign alusrc = lw|sw|addi; ////
assign memtoreg = lw;
assign regwrite = rformat|lw|addi; ////
assign memread = lw;
assign memwrite = sw;
assign branch_eq = beq ;
assign branch_ne = bne;
assign aluop1 = rformat;
assign aluop2 = beq |bne;  ////
assign jump = j; ////////

endmodule
