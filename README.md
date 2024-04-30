# Execution-Cycle-Verilog
Computer Architecture (Group Activity)


## Group 1 (Fetching Process)

### Process:

1. Program Counter: The program counter initializes an address and sends it to the Instruction Memory.
2. Instruction Memory: The Instruction Memory retrieves the instruction from the provided address.
3. Adder: The adder adds 4 bits to the current address to point to the next instruction and feeds it back to the Program Counter (PC).
4. Loop: The Program Counter (PC) is updated every clock cycle.

### How to test:

1. Ensure that the latest version of *[Icarus Verilog](https://bleyer.org/icarus/)* is installed.
2. Clone the project locally; download the code in web, through Github desktop, or through Github CLI.
3. Open the terminal of your choice:
    1. Change directory to the file path of the project
    2. Use the command:
        - If you modified the test bench: `iverilog -o fetch_tb.vvp fetch_tb.v`
        - To run the test bench in terminal: `vvp fetch_tb.vvp`
4. (Optional) Open in GTKWave:
    1. Use the command `gtkwave` to open GTKWave
    2. Go to `File > Open New Tab >`
    3. Locate `Fetch_tb.vcd`
    4. In the SST tab expand `Fetch_tb > uut`
    5. Choose what module wave you want to view: IM, PC, or PCAdder.
    6. In Type | Signals tab; Choose and append to see the wave representation.


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


