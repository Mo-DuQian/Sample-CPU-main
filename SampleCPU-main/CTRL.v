`include "lib/defines.vh"
module CTRL(
    input wire rst,
    input wire stallreq_for_ex,
    input wire stallreq_for_load,

    // output reg flush,
    // output reg [31:0] new_pc,
    output reg [`StallBus-1:0] stall
);  
    always @ (*) begin
        if (rst) begin
            stall = `StallBus'b0;
        end
        else if(stallreq_for_load) begin
            stall = 6'b00_0111;
        end
        else if(stallreq_for_ex) begin
            stall = 6'b00_1111; //不确定是否与load一样
        end
        else begin
            stall = `StallBus'b0;      
        end
    end

endmodule