`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/03/2024 11:19:51 AM
// Module Name: logical operation
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////

module logic(
    output wire[7:0] result,
    output wire[4:0] Flags,
    input wire [3:0] x,
    input wire [3:0] y,
    input wire[4:0] select
    );
    reg [7:0] tempResult;
    reg [4:0] tempFlags;
    always @(*) begin
        case (select)
            5'b01100: begin
                tempResult = {4'b0000,x & y};
                if( tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
            end
            5'b01101:begin
                tempResult = {4'b0000,x | y};
                if( tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
               end
            5'b01110:begin
                tempResult = {4'b0000,x ^ y};
                if( tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
            end
            5'b01111: begin
                tempResult = {4'b0000,~x};
                if( tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
            end
            default:begin
                tempResult = 8'bzzzzzzzz;
                tempFlags = 5'bzzzzz;
            end
        endcase
    end
    assign Flags = tempFlags;
    assign result = tempResult;
endmodule
