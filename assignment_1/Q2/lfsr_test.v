`timescale 1ps/1ps
`include "lfsr.v"

module lfsr_test;
    reg[3:0] seed;
    reg clk;
    reg reset;

    wire[3:0] state;


    lfsr uut(
        .state(state),
        .seed(seed),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,lfsr_test);
        
        seed = 4'b1010;
        clk=1'b0;
        reset=1'b1;
    end

    always #3 clk=!clk;
    initial #90 reset=1'b0;

    initial $monitor($time," clk=%b, reset=%b,seed=%b, state=%b ",clk,reset,seed,state);
    initial #100 $finish;
    

endmodule