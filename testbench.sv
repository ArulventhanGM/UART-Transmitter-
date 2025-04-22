`timescale 1ns / 1ps

module tb;
    // Signals
    logic clk = 0;
    logic rst;
    logic tx_start;
    logic [7:0] tx_data;
    logic tx, tx_done;
    logic [7:0] rx_data;
    logic rx_done;

    // Clock generation (100 MHz)
    always #5 clk = ~clk;

    // Instantiate UART Transmitter
    uart_tx tx_inst (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_done(tx_done)
    );

    // Instantiate UART Receiver
    uart_rx rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(tx), // Loopback TX to RX
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

    // Simulation and stimulus
    initial begin
        // Enable waveform dump
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Initialize
        rst = 1;
        tx_start = 0;
        tx_data = 8'h41; // ASCII 'A'
        #20 rst = 0;

        // Wait before sending
        #30;

        // Start transmission
        tx_start = 1;
        #10 tx_start = 0;

        // Wait for reception to complete
        wait(rx_done);
        $display("Received Byte = %h", rx_data);

        #20;
        $finish;
    end
endmodule
