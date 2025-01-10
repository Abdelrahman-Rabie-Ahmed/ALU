`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/03/2024 11:19:51 AM
// Module Name: arthematic operation
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////


module arthematic(
    output wire[7:0] result,
    output wire[4:0] Flags,
    input wire [3:0] x,
    input wire [3:0] y,
    input wire[4:0] select
    );
    reg [4:0] tempFlags;
    reg [7:0] tempResult;
    always @(*) begin
        case (select)
            5'b00000:
                tempResult = x;
            5'b00001:
                tempResult = x + 1;
            5'b00010:
                tempResult = x + y;
            5'b00011:
                tempResult = x + y + 1;
            5'b00100:
                tempResult = x + ~y;
            5'b00101:
                tempResult = x + ~y + 1;
            5'b00110:
                tempResult = x - 1;
            5'b00111:
                tempResult = x ;
            default:
                tempResult = 7'bz;
        endcase
        case(tempResult)
            0:
                tempFlags[4] = 1;
         default:
                tempFlags = 7'bzzzzzzz;
        endcase
        
    end
    assign Flags = tempFlags;
    
    assign result = tempResult;
endmodule
