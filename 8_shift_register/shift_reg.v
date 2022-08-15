`timescale 1ps/1ps

module shift_reg (
    output reg[7:0] op,
    input clk,
    input rstn,
    input [7:0] load_val,
    input load_en
);
    always @(posedge clk) 
        begin
            if (!rstn) 
                begin 
                    op<=0; 
                end
            else 
                begin
                    if (load_en) 
                        begin
                            op<=load_val;
                        end
                    else 
                        begin 
                            op[0]<=op[7];
                            op[1]<=op[0];
                            op[2]<=op[1];
                            op[3]<=op[2];
                            op[4]<=op[3];
                            op[5]<=op[4];
                            op[6]<=op[5];
                            op[7]<=op[6];
                        end
                end
        end

endmodule