module regfile_test;

reg [4:0] sr1, sr2, dr;
reg [31:0] wrData;
reg wr, rst, clk;
wire [31:0] rdData1, rdData2;
integer k;

regbank_v4 REG (
    rdData1,
    rdData2),
    wrData,
    sr1,
    sr2,
    dr,
    clk,
    rst
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

    initial begin
        #7
        for (k=0; k<32; k=k+1) begin
            dr = k; wrData = 10* k; wr = 1
            #10 wr = 0;
        end
        #10

        for (k=0; k<32; k=k+2) begin
            sr1 = k; sr2 = k + 1;
            #5;
            $display("reg[%2d]= %d, reg[%2d]= %d, sr1, rdData1, sr2, rdData2);
        end
    end
endmodule
