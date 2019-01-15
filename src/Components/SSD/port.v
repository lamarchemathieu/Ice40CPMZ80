module port
   (
      input            n_reset,
      input            n_wr,
      input [7:0]      dataIn,
      output reg [7:0] out
   );



   always @(negedge n_reset or posedge n_wr) begin
      if (n_reset == 1'b0) begin
         out <= 8'd0;
      end
      else begin
         out <= dataIn;
      end
   end



endmodule

