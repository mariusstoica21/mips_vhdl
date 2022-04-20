
<p align="left">
  <img 
    src="https://i.postimg.cc/HsYdzkgS/Component-28-1.png"
  >
</p>


# MIPS - VHDL and Delphi

A desktop application of a MIPS (Microprocessor without Interlocked Pipeline Stage) simulator that communicates with the FPGA (Basys3) board using UART protocol. 

The project consists of two main components:

- VHDL component
  - Instruction Fetch: stores the program memory, outputs the current instruction and calculates the program counter.
  - Instruction Decoder: decodes the instruction and has different outputs depending of the instruction type (R, I or J).
  - Execution Unit: does the arithmetical/logical operations.
  - Control Unit: sets/resets the signals according to the instruction type (R, I or J).
  - MEM: uses the additional memory to load/store words.
  - Write back: writes the result in the ram memory.
  - UART: transmits data from the FPGA board to the computer.
- Delphi component
  - dektop application of the MIPS simulator that shows the flow of the program, stored in ROM memory as the program memory, instruction by instruction;
  - the program, stored in ROM in binary, does the addition of the first 5 numbers (example: 1+2+3+4+5=15). 

## Summary
✅ G.U.I. 

❌ Ease of installation

✅ Additional hardware needed

✅ Video available

❌ Documentation

## Project description

### Folder structure

📁 Delphi_files : contains the Delphi project (it can be imported).

- 📄 [UThirdP.pas](https://github.com/mariusstoica21/mips_vhdl/blob/main/Delphi_files/UThirdP.pas): main form of the app.

📁 VHDL files : contains the VHDL project (it can be imported).
- 📁 TestEnv.additional_srcs : contains the additional sources of the project.
- 📁 TestEnv.constraint_file : contains the constraint file of the Basys3.
- 📁 TestEnv.srcs: contains the main sources of the project.

▶️ MIPS.exe : application executable.

## Authors

- [@mariusstoica21](https://github.com/mariusstoica21)
