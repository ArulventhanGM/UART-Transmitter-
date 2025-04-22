# 🛰️ UART Transmitter & Receiver in SystemVerilog

This project demonstrates the design and simulation of a **UART (Universal Asynchronous Receiver/Transmitter)** using **SystemVerilog**. It focuses on serial communication, one of the most essential protocols in embedded and digital system design.

The project includes a **UART Transmitter**, **UART Receiver**, and a complete **testbench** to simulate data transmission and reception. It’s built and verified using [EDA Playground](https://www.edaplayground.com), with waveform analysis via EPWave.

---

## 📌 Project Overview

UART is a serial communication protocol that transmits data one bit at a time, typically used in embedded systems to communicate with peripherals like sensors, displays, or other microcontrollers.

This implementation:
- Converts parallel data to serial (Transmitter)
- Sends it over a single line
- Reconstructs the original data back from the serial stream (Receiver)

---

## ⚙️ Specifications

| Feature                | Description                        |
|------------------------|------------------------------------|
| Data Bits              | 8                                  |
| Baud Rate              | 9600 bps                           |
| Clock Frequency        | 50 MHz                             |
| Start Bit              | 1-bit (Low)                        |
| Stop Bit               | 1-bit (High)                       |
| Parity Bit             | None (can be extended)             |
| Simulation Platform    | EDA Playground (EPWave)            |
| Language               | SystemVerilog                      |
| Modules                | `uart_tx`, `uart_rx`               |

---

## 🗂️ Files

| File            | Description                                |
|-----------------|--------------------------------------------|
| `design.sv`     | Contains the UART Transmitter and Receiver |
| `testbench.sv`  | Stimulates and tests the UART system       |
| `README.md`     | Project documentation                      |

---

## ▶️ How to Run This

1. Open this project in [EDA Playground](https://www.edaplayground.com/).
2. Paste the contents of `design.sv` and `testbench.sv`.
3. Click **Run** to compile and simulate.
4. Click **EPWave** → **Get Signals** → select `tx`, `rx`, `tx_data`, `rx_data`, etc.
5. View waveforms to verify UART behavior.

---

## 📉 Simulation Outputs

- **TX Line** goes low (start bit), sends data LSB-first, then high (stop bit).
- **RX Line** samples data bits at the expected baud interval.
- **Testbench** confirms accurate reception via waveform or assertions.

---

## 🔧 Possible Extensions

- Add **parity bit** and **error checking**
- Parameterize the **baud rate** and **data length**
- Integrate with a **FIFO buffer**
- Build a complete **UART to memory-mapped bus bridge**
- Use **UVM** or **SystemVerilog assertions** for verification

---

## 🧠 Why This Project?

This UART project is an excellent entry point for understanding:
- Digital communication protocols
- Sequential logic
- Timing constraints and sampling
- Simulation and waveform analysis
- Building synthesizable and testable RTL code

---

## 📜 License

This project is licensed under the **MIT License**.  
Feel free to use, modify, and share it!

---

### ✨ Created for learning and exploring Digital Design!
