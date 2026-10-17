module top_module(
    input logic[3:0] A,B,
    input logic      M,
    
    output logic[3:0] Result,
    output logic Cout);
    
    logic [3:0] Bx;
    logic c1,c2,c3;
    
    assign Bx= B^{4{M}};
    
    fullAdder fa1(.a(A[0]),.b(Bx[0]),.cin(M),.sum(Result[0]),.cout(c1));
    fullAdder fa2(.a(A[1]),.b(Bx[1]),.cin(c1),.sum(Result[1]),.cout(c2));
    fullAdder fa3(.a(A[2]),.b(Bx[2]),.cin(c2),.sum(Result[2]),.cout(c3));
    fullAdder fa4(.a(A[3]),.b(Bx[3]),.cin(c3),.sum(Result[3]),.cout(Cout));
  
endmodule




module fullAdder(
    input  logic a,b,cin,
    output logic sum,cout   );

    assign sum=a^b^cin;
    assign cout=(a&b)|(cin&(a^b));
  
endmodule

