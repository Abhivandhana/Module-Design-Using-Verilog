/*`timescale 1ns / 1ps
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
module serial_adder_tb;
  reg [3:0] data_a, data_b;
  reg clk, reset;

  wire [3:0] out;
  wire cout;

  serial_adder s_adder(data_a, data_b, clk, reset, out, cout);

  initial begin
    $monitor("data_a = %4b, data_b = %4b, reset = %b, out=%b", data_a, data_b, reset, out);
    
    clk = 0;
    data_a = 4'b1000; data_b = 4'b0010; reset = 1; #20;
    data_a = 4'b1000; data_b = 4'b0010; reset = 0; #200;
    $finish;
  end

  always #10 clk = !clk;

endmodule*/
`timescale 1ns / 1ps

module serial_adder_tb;
  reg [7:0] data_a, data_b;
  reg clk, reset;
  wire cout;
  wire [7:0] out;

  // Instantiate the serial_adder module
  serial_adder uut (
    .data_a(data_a),
    .data_b(data_b),
    .clk(clk),
    .reset(reset),
    .out(out),
    .cout(cout)
  );

  // Generate clock signal with a period of 10ns
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply a single set of inputs
  initial begin
    // Initialize inputs
    data_a = 8'b00011011; // Example: 27 in decimal
    data_b = 8'b00010101; // Example: 21 in decimal
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Wait for a few clock cycles to observe the output
    #100;

    // Finish the simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t | data_a: %b | data_b: %b | sum_out: %b | cout: %b",
             $time, data_a, data_b, out, cout);
  end
endmodule

