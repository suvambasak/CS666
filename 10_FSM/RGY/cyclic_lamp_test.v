`timescale 1ps/1ps
`include "cyclic_lamp.v"

module cyclic_lamp_test;
    reg clock;
    wire [0:2] light;

    cyclic_lamp LAMP (clock,light);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,cyclic_lamp_test);

        clock=1'b0;
        #100 $finish;
    end

    always #5 clock=~clock;
    initial $monitor($time," RGY = %b ", light);


endmodule