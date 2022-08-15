`timescale 1ps/1ps
`include "shift_reg.v"

module shift_reg_test;
    reg clk;
    reg rstn;
    reg [7:0] load_val;
    reg load_en;

    wire [7:0] op;

    shift_reg uut(
        .op(op),
        .clk(clk),
        .rstn(rstn),
        .load_val(load_val),
        .load_en(load_en)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,shift_reg_test);

        clk=1'b0;
        rstn=1'b1;
        load_en=1'b1;
        load_val=8'b10101010;
    end

    initial #20 load_en=1'b0;
    always #2 clk=!clk;

    initial $monitor($time," rstn=%b, load_val=%b, load_en=%b | op=%b",rstn,load_val,load_en,op);
    initial #100 $finish;

endmodule