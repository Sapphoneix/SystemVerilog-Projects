module tb;
    logic [3:0] a;
    logic [3:0] b;
    logic sub;
    
    logic [3:0] sum;
    logic cout;
    logic [8:0] k;
    logic [3:0] reference;
    int hata=0;
    int testSayisi=0;
    
    top_module dut(.A(a),.B(b),.M(sub),.Result(sum),.Cout(cout));
    
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);
          
        for(int i=0;i<512;i++) begin
            k=i;
            {a,b,sub} = k;
            #1;
            reference= sub ? (a-b) : (a+b);
            testSayisi++;
            
            if(sum!==reference) begin
                $display("HATA: M=%b A=%0d B=%0d -> Result=%0d (beklenen=%0d)",sub,a,b,sum,reference);
                hata++;
              
            end 
        end
        $display("Hata=%0d  Test Sayisi=%0d",hata,testSayisi);
        $finish;
    end
endmodule
      
        
      
  