module ssd
   (
      input            clk,
      input            n_reset,
      input            n_wr,
      input [7:0]      dataIn,
      output [7:0] out
   );

   reg [7:0] value;

   wire [3:0] v;
   wire [6:0] segs;

   always @(negedge n_reset or posedge n_wr) begin
      if (n_reset == 1'b0) begin
         value <= 8'd0;
      end
      else begin
         value <= dataIn;
      end
   end

   assign out = clk == 1'b1 ? {1'b1 ,segs} : {1'b0 ,segs};
   assign v = clk == 1'b1 ? value[7:4] : value[3:0];

   assign segs = (v == 4'd 0 ) ? 7'b 0111111 :
                 (v == 4'd 1 ) ? 7'b 0000110 :
                 (v == 4'd 2 ) ? 7'b 1011011:
                 (v == 4'd 3 ) ? 7'b 1001111 :
                 (v == 4'd 4 ) ? 7'b 1100110 :
                 (v == 4'd 5 ) ? 7'b 1101101 :
                 (v == 4'd 6 ) ? 7'b 1111101 :
                 (v == 4'd 7 ) ? 7'b 0000111 :
                 (v == 4'd 8 ) ? 7'b 1111111 :
                 (v == 4'd 9 ) ? 7'b 1101111 :
                 (v == 4'd 10) ? 7'b 1110111 :
                 (v == 4'd 11) ? 7'b 1111100 :
                 (v == 4'd 12) ? 7'b 0111001 :
                 (v == 4'd 13) ? 7'b 1011110 :
                 (v == 4'd 14) ? 7'b 1111001 :
                 7'b 1110001;


endmodule

