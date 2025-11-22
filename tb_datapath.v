`timescale 1ns / 1ps


module tb_datapath;

	// Inputs
	reg rst_n;
	reg clk;
	reg pass;
	reg add;
	reg ldAc;
	reg ldIr;
	reg incPc;
	reg ldPc;
	reg irOnAdr;
	reg pcOnAdr;
	reg [7:0] dataBusIn;

	// Outputs
	wire [7:0] dataBusOut;
	wire [5:0] adrBus;
	wire [1:0] opcode;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.rst_n(rst_n), 
		.clk(clk), 
		.pass(pass), 
		.add(add), 
		.ldAc(ldAc), 
		.ldIr(ldIr), 
		.incPc(incPc), 
		.ldPc(ldPc), 
		.irOnAdr(irOnAdr), 
		.pcOnAdr(pcOnAdr), 
		.dataBusIn(dataBusIn), 
		.dataBusOut(dataBusOut), 
		.adrBus(adrBus), 
		.opcode(opcode)
	);
	initial clk=0;
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		rst_n = 0;
		clk = 0;
		pass = 0;
		add = 0;
		ldAc = 0;
		ldIr = 0;
		incPc = 0;
		ldPc = 0;
		irOnAdr = 0;
		pcOnAdr = 0;
		dataBusIn = 0;
		
		#15;
		rst_n=1;
        
		// Add stimulus here
		@(posedge clk) begin
			dataBusIn=8'd212;
			ldIr=1;
		end
		@(posedge clk) begin
         ldIr = 0;
         dataBusIn = 0;
      end

      @(posedge clk) begin
         dataBusIn = 8'd10;
         ldAc = 1;
      end
		
      @(posedge clk) begin
			ldAc = 0;
         dataBusIn = 0;
      end
 
      @(posedge clk) begin
         add = 1;
      end
		
      #10 
		add = 0;

      @(posedge clk) begin
         incPc = 1;
         pcOnAdr = 1;
      end
		
      @(posedge clk) incPc = 0;

      @(posedge clk) begin
         pcOnAdr = 0;
         irOnAdr = 1;
      end
	end
      
endmodule

