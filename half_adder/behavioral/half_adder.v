`timescale 1ps/1ps

module half_adder (
    s,
    c,
    a,
    b
);

    input a,b;
    output reg s,c;

    always @(*) begin
        s=a^b;
        c=a&b;    
    end
    
endmodule