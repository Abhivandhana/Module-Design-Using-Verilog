`timescale 1ns / 1ps

module piso(clk, enable, rst, data, out);
  input enable, clk, rst;
  input [7:0] data;
  output out;

  reg out;
  reg [7:0] memory;

  always @ (posedge clk, posedge rst) begin
    if (rst == 1'b1) begin
      out <= 1'b0;
      memory <= data;
    end
    else begin
      if (enable) begin
        out = memory[0];
        memory = memory >> 1'b1;
      end
    end
  end
endmodule

// D_flipflop
module D_flipflop(d, clk, enable, reset, out);
  input d, clk, enable, reset;
  output out;

  reg out;

  always @ (posedge clk or posedge reset) begin
    if (reset)
      out = 0;
    else
      if (enable)
        out = d;
  end
endmodule

// full_adder
module full_adder(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;

  assign {cout, sum} = a + b + cin;

endmodule

module serial_adder(data_a, data_b, clk, reset, out, cout);
  input [7:0] data_a, data_b;
  input clk, reset;
  output reg cout;
  output reg [7:0] out;

  reg [3:0] count;
  reg enable;
  wire wire_a, wire_b, cout_temp, cin, sum;

  piso piso_a(clk, enable, reset, data_a, wire_a);
  piso piso_b(clk, enable, reset, data_b, wire_b);
  full_adder adder(wire_a, wire_b, cin, sum, cout_temp);
  D_flipflop dff(cout_temp, clk, enable, reset, cin);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      enable <= 1;
      count <= 4'b0000;
      out <= 8'b00000000;
      cout <= 0;
    end
    else if (enable) begin
      cout <= cout_temp;
      out <= {sum, out[7:1]};  // Shift right and insert sum at MSB
      count <= count + 1;

      if (count == 4'b1000)  // Disable after 8 cycles
        enable <= 0;
    end
  end
endmodule
