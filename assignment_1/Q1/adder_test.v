`timescale 1ps/1ps
`include "adder.v"

module adder_test;
    reg[7:0] data0,data1;
    reg mode;

    wire[7:0] final_sum;
    wire final_carry_out,overflow;

    adder uut(
        .final_sum(final_sum),
        .final_carry_out(final_carry_out),
        .overflow(overflow),
        .data0(data0),
        .data1(data1),
        .mode(mode)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,adder_test);

        data0 = 8'b00000000;
        data1 = 8'b00000000;

        // data0 = 8'b11111111;
        // data1 = 8'b11111111;

        mode = 1'b1;
    end

    always #5 data0=data0+1'b1;
    // always #5 data0=data0-1'b1;

    always #10 data1=data1+1'b1;
    // always #10 data1=data1-1'b1;
    
    always #35 mode=mode+1'b1;

    initial $monitor($time," mode=%b  data0=%b, data1=%b | final_sum=%b, final_carry_out=%b, overflow=%b", mode, data0, data1, final_sum, final_carry_out, overflow);
    initial #75 $finish;
endmodule