`timescale 1ps/1ps
`include "lfsr.v"

module lfsr_test;
    reg[15:0] seed;
    reg clk;
    reg reset;

    wire[15:0] state;


    lfsr uut(
        .state(state),
        .seed(seed),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,lfsr_test);
        
        seed = 16'b1010110011100001;

        // seed = 16'b0110011001000100;
        // seed = 16'b0000000000000001;

        clk=1'b0;
        reset=1'b1;
    end

    always #2 clk=!clk;
    // initial #90 reset=1'b0;


    // initial $monitor("%b",state);
    initial $monitor($time," clk=%b, reset=%b,seed=%b | state=%b ",clk,reset,seed,state);
    initial #131080 $finish;
    
endmodule