module regfile_test;

reg [4:0] sr1, sr2, wr;
reg [31:0] wrData;
wire [31:0] rdData1, rdData2;
reg clk, rst, wr_en;

regbank_v4 REG (
    .rdData1(rdData1),
    .rdData2(rdData2),
    .wrData(wrData),
    .sr1(sr1),
    .sr2(sr2),
    .wr(wr),
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    begin
        $dumpfile("regfile_test.vcd");
        $dumpvars(0, regfile_test);
        #1 rst = 1; wr = 0;
        #5 rst = 0; wr = 1; wrData = 32'hDEADBEEF;
        #10 wr = 0;
        #10 sr1 = 5'b00011;
        #10 sr2 = 5'b00001;
    end
endmodule
