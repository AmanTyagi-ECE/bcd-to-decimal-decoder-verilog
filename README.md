# 🔢 BCD to Decimal Decoder (SN74144) using Verilog – Vivado

## 📌 Overview

This project implements the functionality of the SN74144 BCD to Decimal Decoder using Verilog HDL in Xilinx Vivado. The design converts a 4-bit binary input into one of ten active-low outputs (0–9). The design is verified using simulation and RTL schematic.

---

## 🎯 Objective

* To design a BCD to Decimal Decoder using Verilog
* To simulate and verify the design in Vivado
* To understand combinational logic implementation

---

## 🧠 Theory

The SN74144 is a combinational logic decoder that takes a 4-bit BCD input and activates one of ten outputs. The outputs are **active LOW**, meaning only one output is LOW at a time while others remain HIGH.

---

## ⚙️ Design Description

* **Input:** 4-bit (A[3:0])
* **Output:** 10-bit (Y[9:0])
* **Logic:**

  * All outputs are HIGH by default
  * Based on input, one output becomes LOW

Example:

* Input = 0101 → Output Y5 = LOW

---

## 📁 Project Structure

```
src/        → Verilog design files  
sim/        → Testbench  
results/    → Simulation and hardware outputs  
```

---

## 💻 Files Included

* `sn74144.v` → Main decoder module
* `clk_divider.v` → Clock divider (if used)
* `tb_sn74144.v` → Testbench
* `simulation_waveform.png` → Simulation output
* `rtl_schematic.png` → RTL schematic
* `fpga_board.jpg` → FPGA hardware image

---

## 📊 Simulation Results

The waveform verifies correct decoding behavior where only one output is LOW for each input.

![Simulation](results/simulation_waveform.png.png)

---

## 🔌 RTL Schematic

The RTL schematic generated in Vivado shows the internal logic implementation of the decoder.

![RTL](results/rtl_schematic.png.png)

---

## 🔧 Hardware Platform

The design can be implemented on the RealDigital Boolean FPGA board for real-time verification.

![FPGA](results/fpga_board.jpg.png)

---

## 🧰 Tools Used

* Xilinx Vivado
* Verilog HDL

---

## ▶️ Applications

* Digital decoding systems
* Display systems
* FPGA-based designs

---

## 📚 Learning Outcomes

* Understanding of decoder circuits
* Hands-on experience with Verilog HDL
* Simulation and verification using Vivado
* Insight into FPGA-based design

---

## 👨‍💻 Author

Aman Tyagi

---


