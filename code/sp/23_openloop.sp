.title OPA_openloop

.include '23.cdl'

x1 6 8 ip in out OPAMP
* ip vip
* in vin
* 5 vout
* 6 VDD
* 8 VSS
VDD 6 0 DC  2.5 
VSS 0 8 DC  2.5
vvip ip 0 DC 0 AC 1.0
vvin in 0 DC 0
CL out 0 10P



.op											   * 分析电路直流工作点
.tf v(out) vvip		    		   * 计算小信号传输函数
.dc vvip -0.005 0.005 10U * 直流仿真，设置扫描变量
.print dc v(out)						 * 观察输出翻转
.ac dec 10 1 1g
.print ac vdb(out) vp(out)

.temp 27								   * 仿真温度27度
.option post accurate probe

.end