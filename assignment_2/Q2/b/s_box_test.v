`timescale 1ps/1ps
`include "s_box.v"

module s_box_test;
    reg [3:0] in;
    wire [3:0] out;

    s_box uut(in, out);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,s_box_test);

        in = 4'h0;
    end


    initial $monitor(" s = %h | s[x] = %h", in, out);
    always #5 in=in+1'h1;
    initial #75 $finish;
    
endmodule