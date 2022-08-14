`timescale 1ps/1ps
`include "full_adder.v"

module full_adder_test;
    reg a;
    reg b;
    reg c;

    wire s;
    wire co;

    full_adder uut (
        .s(s),
        .co(co),
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,full_adder_test);
        
        {a,b,c} =3'b000; 
        #2 {a,b,c} =3'b001;
        #2 {a,b,c} =3'b010;
        #2 {a,b,c} =3'b011;
        #2 {a,b,c} =3'b100;
        #2 {a,b,c} =3'b101;
        #2 {a,b,c} =3'b110;
        #2 {a,b,c} =3'b111; 
    end

    initial $monitor("a=%b,b=%b,c=%b,s=%b,co=%b",a,b,c,s,co);
    initial #20 $finish;
    
endmodule