`include "halfaddr.v"
`include "fulladdr.v"
`include "mux2_1.v"
module testbench;
reg [1:0] A, B;
reg C;
wire [1:0] D;
wire E;

alu_2bit DUT(A,B,C,D,E);
initial begin
    $dumpfile("alu_2bit.vcd");
    $dumpvars(0, testbench);
    $monitor($time,"A=%b,B=%b,C=%b,D=%b,E=%b",A,B,C,D,E);
    #2 A= 2'b01; B=2'b10; C=1'b0;
    #2 A= 2'b00; B=2'b10; C=1'b0;
    #2 A= 2'b11; B=2'b01; C=1'b0;
    #2 A= 2'b11; B=2'b11; C=1'b0;
    #2 A= 2'b01; B=2'b01; C=1'b1;
    #2 A= 2'b01; B=2'b10; C=1'b1;
    #2 A= 2'b10; B=2'b01; C=1'b1;
    #2 A= 2'b00; B=2'b11; C=1'b1;
    #2 A= 2'b01; B=2'b11; C=1'b1;
    #2 $finish;
end

endmodule
