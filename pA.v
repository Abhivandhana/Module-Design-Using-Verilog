`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 08:39:08
// Design Name: 
// Module Name: pA
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

module pA;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg cin;

    // Outputs
    wire [7:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    parallelAdder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Initialize Inputs
        a = 8'b00000000; b = 8'b00000000; cin = 0;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b00011011; b = 8'b00100101; cin = 0;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b11110000; b = 8'b00001111; cin = 1;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b10101010; b = 8'b01010101; cin = 0;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b11111111; b = 8'b00000001; cin = 1;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b10000000; b = 8'b10000000; cin = 0;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        a = 8'b11111111; b = 8'b11111111; cin = 1;
        #10; 
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);

        // Add more test cases as needed

        $finish;
    end
endmodule
