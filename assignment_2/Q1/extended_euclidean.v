`timescale 1ps/1ps

module extended_euclidean (
    a_inverse, prime, a, clk
);
    output [7:0] a_inverse;
    input[7:0] prime, a;
    input clk;

    reg[7:0] A, B, quotient, remainder, T, result;
    reg[7:0] T1=8'b00000000;
    reg[7:0] T2=8'b00000001;

    // Set of all states of FSM
    reg [2:0] state;
    parameter load = 0;
    parameter compute_QR = 1;
    parameter compute_T = 2;
    parameter shift = 3;
    parameter complete = 4;


    assign a_inverse = result;



    // State transition of FSM
    always @(posedge clk ) begin 
        case(state)
            load: state <= compute_QR;
            
            compute_QR: state <= compute_T;
            
            compute_T: state <= shift;
            
            shift: 
                begin 
                    if (A == 0) 
                        state <= complete;
                    else
                        state <= compute_QR;
                end
            
            complete: state <= complete;
            
            default: state <= load;
        endcase
    end



    // State operations of FSM
    always @(state) begin 
        case(state)
            load:
                begin 
                    B = prime;
                    A = a;
                end

            compute_QR: 
                begin 
                    quotient = B / A;
                    remainder = B % A;
                end
            
            compute_T: T = T1-(T2*quotient); 
            
            shift: 
                begin 
                    B = A;
                    A = remainder;
                    T1 = T2;
                    T2 = T;
                end
            
            complete: result = T1;
        endcase
    end
    
endmodule