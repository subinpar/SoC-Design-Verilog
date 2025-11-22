`timescale 1ns / 1ps

module controller(rst_n,clk,start,opcode1,opcode0,add,pass,ldAc,ldIr,ldPc,incPc,irOnAdr,pcOnAdr,rdMem,wrMem);

input rst_n,clk,start,opcode1,opcode0;
output add,pass,ldAc,ldIr,ldPc,incPc,irOnAdr,pcOnAdr,rdMem,wrMem;
reg pass,ldAc,ldIr,incPc,ldPc,irOnAdr,pcOnAdr,rdMem,wrMem,add;

parameter [2:0] SIDLE=0,S00=1, S01=2, S10=3, S11=4, S1=5, S0=6;

reg[2:0] current_state, next_state;

always@(posedge clk, negedge rst_n)
begin:SYNCH
  if(!rst_n) current_state<=SIDLE;
  else current_state <= next_state;
end

always@(current_state,start,opcode1,opcode0)
begin:COMBIN
case(current_state)
  SIDLE:
  begin
    if(start) next_state=S0;
    else next_state=SIDLE;
    pass=1'b0;
    add=1'b0;
    ldAc=1'b0;
    ldIr=1'b0;
    ldPc=1'b0;
    incPc=1'b0;
    irOnAdr=1'b0;
    pcOnAdr=1'b0;
    rdMem=1'b0;
    wrMem=1'b0;
  end
  
  S00:
  begin
    next_state=S0;
    pass=1'b0;
    add=1'b1;
    ldAc=1'b1;
    ldIr=1'b0;
    ldPc=1'b0;
    incPc=1'b1;
    irOnAdr=1'b0;
    pcOnAdr=1'b0;
    rdMem=1'b0;
    wrMem=1'b0;
  end

  S01:
  begin
    next_state=S0;
    pass=1'b0;
    add=1'b0;
    ldAc=1'b1;
    ldIr=1'b0;
    ldPc=1'b0;
    incPc=1'b1;
    irOnAdr=1'b1;
    pcOnAdr=1'b0;
    rdMem=1'b1;
    wrMem=1'b0;
  end
  
  S10:
  begin
    next_state=S0;
    pass=1'b1;
    add=1'b0;
    ldAc=1'b0;
    ldIr=1'b0;
    ldPc=1'b0;
    incPc=1'b1;
    irOnAdr=1'b1;
    pcOnAdr=1'b0;
    rdMem=1'b0;
    wrMem=1'b1;
  end
  
  S11:
  begin
    next_state=S0;
    pass=1'b0;
    add=1'b0;
    ldAc=1'b0;
    ldIr=1'b0;
    ldPc=1'b1;
    incPc=1'b0;
    irOnAdr=1'b0;
    pcOnAdr=1'b0;
    rdMem=1'b0;
    wrMem=1'b0;
  end
  
  S1:
  begin
    if(!opcode1&&opcode0) next_state=S01;
    else if(!opcode1&&!opcode0) next_state=S00;
    else if(opcode1&&opcode0) next_state=S11;
    else if(opcode1&&!opcode0) next_state=S10;
    pass=1'b0;
    add=1'b0;
    ldAc=1'b0;
    ldIr=1'b0;
    ldPc=1'b0;
    incPc=1'b0;
    irOnAdr=1'b0;
    pcOnAdr=1'b0;
    rdMem=1'b0;
    wrMem=1'b0;
  end
  
  S0:
  begin
    next_state=S1;
    pass=1'b0;
    add=1'b0;
    ldAc=1'b0;
    ldIr=1'b1;
    ldPc=1'b0;
    incPc=1'b0;
    irOnAdr=1'b0;
    pcOnAdr=1'b1;
    rdMem=1'b1;
    wrMem=1'b0;
  end
  
  default:
    next_state=SIDLE;
   endcase
  end
  
endmodule
