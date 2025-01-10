`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/04/2024 11:19:51 AM
// Module Name: shifting operation
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////

module shifting(
    output wire[7:0] result,
    output wire[4:0] Flags,
    input wire [3:0] x,
    input wire [3:0] y,
    input wire[4:0] select
    );
    reg [4:0] tempFlags;
    reg [7:0] tempResult;
    reg myBitH;
    reg myBitL;
    always @(*) begin
        case (select)
            5'b10000: begin
                myBitL = x[0];
                tempResult = {4'b0000,x >> 1};
                if(tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
                if(myBitL==1'b1) begin
                    tempFlags[3] = 1; 
                end
            end
            5'b10001:begin
                myBitH = x[3];
                tempResult = {3'b000,myBitH,x << 1};
                if( tempResult==0) begin
                    tempFlags[4] = 1'b1;
                end else begin
                    tempFlags[4] = 1'b0;
                end
                if(myBitH==1'b1) begin
                    tempFlags[3] = 1; 
                end else if(myBitH==1'b0) begin
                    tempFlags[3] = 0;
                end else begin
                    tempFlags = 5'bzzzzz;
                end
            end
            default:begin
                tempResult = 7'bzzzzzzz;
                tempFlags = 5'bzzzzz;
            end
        endcase
        
    end
    assign Flags = tempFlags;
    assign result = tempResult;
endmodule
