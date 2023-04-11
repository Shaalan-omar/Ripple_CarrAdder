`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 03:10:51 PM
// Design Name: 
// Module Name: RCA
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


module RCA(A, B, Ci, S, Co);
    parameter n = 16;
    input[n-1:0] A, B;
    input Ci;
    output[n-1:0] S;
    output Co;
    wire[n-1:1] C;
    genvar i;

    FA Bit0 (.a(B[0]), .b(A[0]), .cin(Ci), .sout(S[0]), .cout(C[1]));
    generate
        for (i=1; i < n-1; i=i+1) begin : add
            FA Bit (.a(B[i]), .b(A[i]), .cin(C[i]), .sout(S[i]), .cout(C[i+1]));
        end
endgenerate
 FA Bit31(.a(B[n-1]), .b(A[n-1]), .cin(C[n]), .sout(S[n-1]), .cout(Co));
endmodule
