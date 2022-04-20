
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

## Additional resources

➕ FPGA board (preferable Basys3 because of the constraints);

➕ Cable to connect the FPGA board to the computer;

## Installation
- Go to https://github.com/mariusstoica21/calculator_asmx86.
- Click the green **'Code'** button.
- Click **'Download ZIP'**.
- Import the VHDL project and load it on the Basys3 board.
- Run the app by double-clicking **'MIPS.exe'** in the 'mips_vhdl_main' 
folder.
- On the Basys3, click the left button (BTN4) in order to jump to the next intruction.

<table>
  <tr>
    <th>🔨 Tools/Framework</th>
    <th>📘 Language</th>
    <th>📃 Usage </th>
    <th>📚 Files</th>
    <th> ℹ Details  </th>
  </tr>
  <tr>
    <td>Delphi</td>
    <td>Objective Pascal</td>
    <td>Desktop app & GUI</td>
    <td>UThirdP.pas</td>
    <td>
       <ul>
        <li>UThirdP.pas is the main form of the desktop application.</li>
        <li>The application shows, for each instruction, the content of the memories and different signals</li>
        <li>After clicking the left button (BTN4) on the Basys3 board, the next intruction will be executed and the signals in the desktop app will be up-to-date.</li>
      </ul>
   </td>
  </tr>
  <tr>
    <td>Vivado 2020.1</td>
    <td>VHDL</td>
    <td>Implementation of the MIPS processor on the Basys3 board</td>
    <td>TestEnv.vhd, ControlUnit.vhd, ExecUnit.vhd, InstrDecoder.vhd, InstrFetch.vhd, MEM.vhd, MPG.vhd, SSD.vhd, UART_TX.vhd</td>
    <td>
       <ul>
        <li>Implementation of the MIPS processor executing a program the calculates the sum of the first 5 elements (1+2+3+4+5).</li>
      </ul>
   </td>
  </tr>
</table>

## Tutorial

<p align="center">
  <img 
    src="https://i.postimg.cc/Nf3XMjzj/Component-35-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/t4zgjR0f/Component-34-1.png"
  >
</p>

<!-- <p align="center">
  <img 
    src="https://i.postimg.cc/mk6rK80r/Component-33-1.png"
  >
</p> -->

<p align="center">
  <img 
    src="https://i.postimg.cc/0jSxQMx0/Component-37-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/5y54gYGN/Component-39-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/RhJfZRNp/Component-40-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/ZKhF5Gxr/Component-41-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/YS7JND7g/Component-42-1.png"
  >
</p>


## Authors

- [@mariusstoica21](https://github.com/mariusstoica21)
