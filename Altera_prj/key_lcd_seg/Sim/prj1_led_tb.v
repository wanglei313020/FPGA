`timescale 1 ns/1 ns

module prj1_led_tb();

//ʱ�Ӻ͸�λ
reg         clk  ;
reg         rst_n;
wire [7:0]  led  ; 
parameter CYCLE    = 20;
//��λʱ�䣬��ʱ��ʾ��λ3��ʱ�����ڵ�ʱ�䡣
parameter RST_TIME = 3 ;

 //�����Ե�ģ������
 prj1_led  uut(
     .clk          (clk     ), 
     .rst_n        (rst_n   ),
     .led          (led    )
    
     );


 //���ɱ���ʱ��50M
 initial begin
     clk = 0;
     forever
     #(CYCLE/2)
     clk=~clk;
 end

 //������λ�ź�
 initial begin
     rst_n = 1;
     #2;
     rst_n = 0;
     #(CYCLE*RST_TIME);
     rst_n = 1;
     #5000;
     $stop;
 end


 endmodule
 