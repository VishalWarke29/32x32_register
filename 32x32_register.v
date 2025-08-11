module regbank_v4 (rdData1, rdData2, wrData, sr1, sr2, wr, clk, rst, dr);
    input clk, wr, rst;
    input [4:0] sr1, sr2, wr;
    input [31:0] wrData;
    output [31:0] rdData1, rdData2;
    integer k;

    reg [31:0] regFile [31:0];
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (k = 0; k < 32; k = k + 1) begin
                regFile[k] <= 32'b0;
            end
        end else if (wr) begin
            regFile[wr] <= wrData;
        end
    end
    assign rdData1 = regFile[sr1];
    assign rdData2 = regFile[sr2];
endmodule