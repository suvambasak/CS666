`timescale 1ps/1ps
`include "demo.v"

module demo_test;
    reg clk;
    reg rstn;
    reg [2:0] load_val;

    wire [2:0] op;

    demo uut(
        .op(op),
        .clk(clk),
        .rstn(rstn),
        .load_val(load_val)
    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0,demo_test);

        clk=1'b0;
        rstn=1'b1;
        load_val=4'b001;

        // load_val=4'b000;
    end

    // always #2 load_val=load_val+1'b1;
    always #2 clk=!clk;

    initial $monitor($time," clk=%b, clear=%b load_val=%b | op=%b",clk,rstn,load_val,op);
    initial #100 $finish;

endmodule