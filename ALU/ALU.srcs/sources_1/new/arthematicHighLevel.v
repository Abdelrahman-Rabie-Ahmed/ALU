`timescale 1ns / 1ps
// Create Date: 12/07/2024 02:14:54 PM
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/07/2024 02:14:54 PM
// Module Name: shifting operation
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////


module arthematicHighLevel(
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
            5'b01000:begin
                tempResult = x * y;
                if(tempResult > 15) begin
                    tempFlags[2] = 1'b1;
                end else begin
                    tempFlags[2] = 1'b0;
                end
                if(x==0 || y == 0) begin
                    tempFlags[4] = 1;
                end else begin
                    tempFlags[4] = 0;
                end
            end
            5'b01001: begin
                case(y)
                4'b0000:
                    tempResult = 7'b1111111;
                default:
                    tempResult = x / y;
                endcase
            end
            5'b01010:
                tempResult = x % y;
            5'b01011:
                tempResult = x;
            default:begin
                tempResult = 7'bzzzzzz;
                tempFlags = 5'bzzzzz;
            end
        endcase
        
    end
    assign Flags = tempFlags;
    assign result = tempResult;
endmodule
