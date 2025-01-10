`timescale 1ns / 1ps
// Create Date: 12/07/2024 02:14:54 PM
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/07/2024 02:14:54 PM
// Module Name: shifting operation
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////


module shigtHighLevel(
    output wire[7:0] result,
    output wire[4:0] Flags,
    input wire [3:0] x,
    input wire [3:0] y,
    input wire[4:0] select
    );
    reg [7:0] tempResult;
    reg myBit;
    always @(*) begin
        case (select)
            5'b10010:
            //arthematic right shift
                tempResult = x >>> 1;
            5'b10011:
            //arthematic left shift
                tempResult = x <<< 1;
            5'b10100:begin
            //circular right shift
                myBit = x[0];
                tempResult = x >> 1;
                tempResult = tempResult | (myBit <<7);
            end
            5'b10101:begin
            //circular left shift
                myBit = x[3];
                tempResult = x << 1;
                tempResult = tempResult | (myBit <<0);
            end
            default:begin
                tempResult = 7'bzzzzzz;
            end   
        endcase 
    end
    assign result = tempResult;
endmodule
