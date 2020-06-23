module Division(
	input         clock,
	input         start,
	input  [31:0] a,
	input  [31:0] b,
	output [31:0] q,
	output [31:0] r
);



 reg [31:0] q;
 reg [31:0] r;
 reg [31:0] rtemp;
 integer i;
	
	always @(posedge clock)
		begin
          if(start) begin //neustart oder reset
			r = 32'd0;
			q = 32'd0;
			i = 31;
				end
		else begin 
             if(i >= 0) begin //iterationen
		     rtemp = 2 * r + a[i];
                if (rtemp < b) begin
                    q[i] = 0; r = rtemp; 
                end
                else begin 
                    q[i] = 1; r = rtemp - b; 
                end 
                i = i-1;
	        end 
             else begin end
	     end
     end
	
endmodule