# UART Transmitter & Receiver – SystemVerilog Project

This project implements a basic UART (Universal Asynchronous Receiver/Transmitter) Transmitter and Receiver using SystemVerilog. It simulates serial data transmission and reception with a testbench.

## 🚀 Features

- UART Transmitter Module
- UART Receiver Module
- Parameterized baud rate and clock speed
- Testbench for simulating data transmission
- Compatible with EDA Playground (visual waveform viewer)

## 📁 File Structure

| File            | Description                               |
|-----------------|-------------------------------------------|
| `design.sv`     | Contains UART transmitter and receiver logic |
| `testbench.sv`  | Testbench to stimulate and verify the UART |

## ▶️ How to Run

You can simulate and visualize this project using **EDA Playground**:

1. Visit this playground: [Run on EDA Playground](https://www.edaplayground.com/x/Pgf)
2. Click **Run** to compile and simulate.
3. Click **EPWave** to open waveform viewer.
4. Click **Get Signals**, then add signals to see the output.

## 🧪 Simulation Features

- Transmits an 8-bit value over UART
- Receiver samples data and reconstructs original byte
- Verifies correctness via waveform (`tx`, `rx`, `rx_data`, `tx_start`, etc.)

## 🛠️ Future Enhancements (Ideas)

- Add parity bit support
- Extend for variable baud rates
- Create a UVM testbench version
- Add FIFO buffer to transmitter and receiver

---

## 📜 License

MIT License – feel free to modify and use as you wish!

---

**Happy Coding!** ✨
