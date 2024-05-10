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


## Group 5 (Branch Operation) 

### How to test:

1. Ensure that the latest version of *[Icarus Verilog](https://bleyer.org/icarus/)* is installed.
2. Clone the project locally; download the code in web, through Github desktop, or through Github CLI.
3. Open the terminal of your choice:
    1. Change directory to the file path of the project
    2. Use the command:
        - If you modified the test bench: `iverilog -o output.vvp BranchTargetCalculator_tb.v BranchTargetCalculator.v`
        - To run the test bench in terminal: `vvp output.vvp`
4. (Optional) Open in GTKWave:
    1. Use the command `gtkwave` to open GTKWave
    2. Go to `File > Open New Tab >`
    3. Locate ` waveform.vcd`
    4. In the SST tab expand `BranchTargetCalculator_tb > uut`
    5. Select All the Signal/Waves you want to view.
    6. In Type | Signals tab; Choose and append to see the wave representation.




## Group 6 (Decoding Process) 

How It Integrates  
1. Decode: Decodes instructions to determine the operation and generate appropriate control signals.
2. Register File: Implements a register file for storing and accessing data within the processor.
3. ALU: Defines an ALU capable of performing various arithmetic and logical operations.  
4. Control Unit: Generates control signals for the processor based on the instruction's opcode.  
5. Testbench: Provides a simulation environment to test the processor design by loading instructions and driving the clock.

### How to simulate

1. Ensure Icarus Verilog is installed
2. Clone the project using Github Desktop
3. Ensure that that the cloned project is located inside iverilog bin's folder
4. Open command prompt and go locate current directory to the cloned project
5. Use this command (verilog -o simulation *.v) 
6. Then, type vvp simulation
7. Locate gtkwave.exe in your verilog folder. Click new tab and click the generated vcd file
8. Click the signals and observe.


