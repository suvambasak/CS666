`timescale 1ps/1ps

module d_flipflop (
    output reg q,
    input d, clk, clear
);
    always @(posedge clk or negedge clear) begin
        if (clear==1'b0)
            begin q<=1'b0; end
        else 
            begin q<=d; end
    end
    
endmodule