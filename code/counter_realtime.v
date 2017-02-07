
module clk_1hz(clk,rst,clk_o);
	input clk;
	input rst;
	//input[]
	output clk_o;
	reg[7:0] cnt;
	parameter fregx=26999999;
	
	always @(posedge clk, negedge rst)begin
		if(!rst)begin 
			clk_o<=1'b0;
			cnt<=8'd0;
		end
		else begin
			if(cnt==fregx)begin 
				clk_o=1'b1;
				cnt<=8'd0;
			end
			else begin
				clk_o<=1'b0;
				cnt<=cnt+1'b1;
			end
		end
	end
endmodule

module counter_sm(clk,rst,inc,clk_o,dout);
	input clk,rst;
	input inc;
	output clk_o;
	output dout;
	
	reg[7:0] cnt;
	
	always @(posedge clk, posedge inc, negedge rst)begin
		if(!rst)begin 
			clk_o<=1'b0;
			cnt<=8'd0;
		end
		else begin
			if(inc)begin 
				if(cnt==6'd59)begin 
					cnt<=6'd0;
				end
				else begin 
					cnt<=cnt+1'b1;
				end
			end
			else begin
				if(cnt==6'd59)begin 
					clk_o<=1'b1;
					cnt<=6'd0;
				end
				else begin 
					clk_o<=1'b0;
					cnt<=cnt+1'b1;
				end
			end
		end
	end
	
	assign dout=cnt;
endmodule

module counter_d();
	input clk;
	input rst;
	input inc;
	output dout;
	reg[6:0] cnt
	
	always @ (posedge clk, posedge inc, negedge rst)begin
		if(!rst)begin 
			//clk_o<=1'b0;
			cnt<=6'd0;
		end
		else begin
			if(inc)begin 
			end
			else begin end
		end
	end
endmodule

module real_time();
	input clk;
	input rst;
	input inc;
	
	output[6:0] sec, min, hour, day;
	
endmodule

