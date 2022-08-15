`timescale 1ps/1ps

module full_adder (
    output reg sum, carry_out,
    input i0, i1, carry_in, mode
);
    always @(*) begin
        if (mode == 1'b1) begin
            sum <= i0^i1^carry_in;
            carry_out <= (i0&i1)|(i1&carry_in)|(i0&carry_in);
        end else begin
            sum <= i0^(~i1)^carry_in;
            carry_out <= (i0&(~i1))|((~i1)&carry_in)|(i0&carry_in);
        end 
    end
endmodule