
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2024 20:20:29
// Design Name: 
// Module Name: serial_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module serial_adder_tb;
  reg [7:0] data_a, data_b;
  reg clk, reset;
  wire cout;
  wire [7:0] out;

  serial_adder uut (
    .data_a(data_a),
    .data_b(data_b),
    .clk(clk),
    .reset(reset),
    .out(out),
    .cout(cout)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    data_a = 8'b00011011; // 27 
    data_b = 8'b00010101; // 21
    reset = 1;

    #10;
    reset = 0;

    #100;
    $finish;
  end
endmodule
