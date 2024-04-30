# Execution-Cycle-Verilog
Computer Architecture (Group Activity)

## Group 6 (Decoding Process) 
How It Integrates  
1. Decode: The Decode module extracts the register addresses ($rs, rt, rd$) from the instruction.  
2. Register Read: The RegisterFile receives $r_{s}$ and $r_t$ as inputs (readReg1 and readReg2). It provides the contents of those registers on the readData1 and readData2 outputs.  
3. ALU: The readData1 and readData2 outputs from the RegisterFile connect to the inputs of  ALU.  
4. Control Unit: The Control Unit generates the RegWrite signal to tell the RegisterFile when to store a result.  
5. Write-Back: If RegWrite is high, the RegisterFile updates the register specified by writeReg (from the Decode module) with writeData (which generally comes from the ALU's output).
### How to simulate

1. Ensure Icarus Verilog is installed
2. Clone the project using Github Desktop
3. Ensure that that the cloned project is located inside iverilog bin's folder
4. Open command prompt and go locate current directory to the cloned project
5. Use this command (applicable in group's 6: iverilog -o simulation_out Decode.v ControlUnit.v ALU.v RegisterFile.v Testbench.v)


