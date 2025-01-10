`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Abdelrahman RAbie
// Create Date: 12/03/2024 11:19:51 AM
// Project Name: ALU
// Additional Comments:
//////////////////////////////////////////////////////////////////////////////////

module ALU(
    output wire [7:0]LED ,
    output wire [4:0]Flags ,
    input wire [12:0]sw
    );
    wire[3:0]x ;
    wire[3:0]y ;
    wire[4:0] select;
    assign x = sw[3:0];
    assign y = sw[7:4];
    assign select = sw[12:8];
    logic l(LED,Flags,x,y,select);
    arthematic ar(LED,Flags,x,y,select);
    shifting sh(LED,Flags,x,y,select);
    arthematicHighLevel ahl(LED,Flags,x,y,select);
    shigtHighLevel shl(LED,Flags,x,y,select);
endmodule
