module uart_tx(
    input logic clk,
    input logic rst,
    input logic tx_start,
    input logic [7:0] tx_data,
    output logic tx,
    output logic tx_done
);
    typedef enum logic [1:0] {IDLE, START, DATA, STOP} state_t;
    state_t state;
    logic [3:0] bit_index;
    logic [7:0] data_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1'b1;
            tx_done <= 0;
            bit_index <= 0;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    tx_done <= 0;
                    if (tx_start) begin
                        state <= START;
                        data_reg <= tx_data;
                    end
                end
                START: begin
                    tx <= 0; // Start bit
                    state <= DATA;
                    bit_index <= 0;
                end
                DATA: begin
                    tx <= data_reg[bit_index];
                    bit_index <= bit_index + 1;
                    if (bit_index == 7)
                        state <= STOP;
                end
                STOP: begin
                    tx <= 1; // Stop bit
                    tx_done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

module uart_rx(
    input logic clk,
    input logic rst,
    input logic rx,
    output logic [7:0] rx_data,
    output logic rx_done
);
    typedef enum logic [1:0] {IDLE, START, DATA, STOP} state_t;
    state_t state;
    logic [3:0] bit_index;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            rx_data <= 0;
            rx_done <= 0;
            bit_index <= 0;
        end else begin
            case (state)
                IDLE: begin
                    rx_done <= 0;
                    if (rx == 0) state <= START; // Detect start bit
                end
                START: begin
                    state <= DATA;
                    bit_index <= 0;
                end
                DATA: begin
                    rx_data[bit_index] <= rx;
                    bit_index <= bit_index + 1;
                    if (bit_index == 7)
                        state <= STOP;
                end
                STOP: begin
                    if (rx == 1) begin
                        rx_done <= 1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
