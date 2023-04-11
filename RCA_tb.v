module RCA_tb();

	reg[15:0] A, B;
	reg Cin;
	wire Co;	
	wire  [15:0] S;		
//A, B, Ci, S, Co
	RCA DUV ( .A(A), .B(B),.Ci(Cin) ,.S(S),.Co(Co) );

//	initial begin
//	    $dumpfile("mul.vcd");	// vcd dump file
//	    $dumpvars;				// dump everything
//	end

	initial begin
		A = 16'd0;
		B = 16'd0;
		Cin = 1'b0;
		
		// Test 1
		#10;	
		A = 16'd10; 
		B = 16'd20;
		Cin = 1'b1;
		#10;
		if(S != A+B+Cin) $display("Test 1: Failed (Expected: %d, Got: %d)", 16'd200, S);
		else $display("Test 1: Passed (%d + %d +%d = %d)", A,B,Cin,S );
		
		// Test 2
		#10;	
		A = 16'd20; 
		Cin = 1'b0;
		#10;
if(S != A+B+Cin) $display("Test 2: Failed (Expected: %d, Got: %d)", 16'd200, S);
 else $display("Test 2: Passed (%d + %d +%d = %d)", A,B,Cin,S );
		
		// Test 3
		#10;	
		A = 16'd5; 
        Cin = 1'b1;
		#10;
if(S != A+B+Cin) $display("Test 3: Failed (Expected: %d, Got: %d)", 16'd200, S);
else $display("Test 3: Passed (%d + %d +%d = %d)", A,B,Cin,S );
	
	end


endmodule
