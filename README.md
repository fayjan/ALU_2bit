# 2-bit Calculator

This project implements a 2-bit calculator in Verilog that can perform addition and subtraction operations based on a select signal using a multiplexer (MUX) to choose between the two operations. The design utilizes basic components such as full adders for performing arithmetic operations.

## Features

- Adds and subtracts 2-bit binary numbers.
- Uses a multiplexer to select between addition and subtraction operations.
- Simple and efficient design using Verilog.

## Project Structure

2-bit-calculator/
│
├── README.md
├── calculator_2bit.v
├── full_adder.v
├── testbench.v
└── .gitignore



- `README.md`: This file, providing an overview of the project.
- `alu_2bit.v`: The main Verilog module for the 2-bit calculator.
- `halfaddr.v`: The Verilog module for a 1-bit half adder used in the calculator.
- `fulladdr.v`: The Verilog module for a 1-bit full adder used in the calculator.
- `alu_2bit_tb.v`: Testbench for simulating and verifying the functionality of the 2-bit calculator.
- `.gitignore`: A file specifying which files and directories to ignore in the repository.

## Verilog Modules

### calculator_2bit.v

This module implements the main functionality of the 2-bit calculator. It uses full adders to perform addition and subtraction, and a multiplexer to select between the two operations based on the `sel` signal.

```verilog


module alu_2bit (
    input [1:0] in1 ,
    input [1:0] in2 , 
    input sel , 
    output [1:0] result , 
    output carry   
);
wire [1:0] sum, diff;
wire [1:0] b_comp;
reg [1:0] diff_comp;
wire s0, s1,d0,d1,c4;
// in2 2nd compliment
assign b_comp = ~in2 +2'b01;

// Addition operation
halfaddr ha1(sum[0],s0,in1[0],in2[0]);
fulladdr fa1(sum[1],s1,in1[1],in2[1],s0);

// Subtraction operation
halfaddr ha2(diff[0],d0,in1[0],b_comp[0]);
fulladdr fa2(diff[1],d1,in1[1],b_comp[1],d0);

always @(*) begin
    case (d1)
        1'b1: diff_comp = diff;
        1'b0: diff_comp  = ~diff+ 2'b01;
        default: diff_comp = 2'bxx;
    endcase   
end
// Selection for operation
wire [1:0] op1 ,op2;
assign op1[0] = sum[0],op2[0] = sum[1];
assign op1[1] = diff_comp[0],op2[1] = diff_comp[1];
mux2_1 mux1(op1,sel,result[0]);
mux2_1 mux2(op2,sel,result[1]);
assign carry = (sel==0)?s1:~d1;
    
endmodule
// eval "$(/opt/homebrew/bin/brew shellenv)"