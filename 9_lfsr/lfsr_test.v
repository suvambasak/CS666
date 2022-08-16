`timescale 1ps/1ps
`include "lfsr.v"

module lfsr_test;
    reg clk;
    reg rstn;
    reg [2:0] load_val;

    wire [2:0] op;

    lfsr uut(
        .op(op),
        .clk(clk),
        .rstn(rstn),
        .load_val(load_val)
    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0,lfsr_test);

        clk=1'b0;
        rstn=1'b1;
        load_val=4'b001;
    end

    always #1 clk=!clk;
    initial #90 rstn=1'b0;

    initial $monitor($time," clear=%b load_val=%b | op=%b",rstn,load_val,op);
    initial #100 $finish;

endmodule