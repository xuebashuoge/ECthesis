.title OPA_openloop

.include '23.cdl'

*in与out相连
x1 6 8 ip out out OPAMP 
* ip vip
* in vin
* 5 vout
* 6 VDD
* 8 VSS
VDD 6 0 DC  2.5 
VSS 0 8 DC  2.5
vvip ip 0 PWL(0 -2 10N -2 20N 2 2U 2 2.01U -2 4U -2 4.01U
+ -0.1 6U -0.1 6.01U 0.1 8U 0.1 8.01U -0.1 10U -0.1)
CL out 0 10P

.op
.tf v(out) vvip		    		* 计算小信号传输函数
.dc vvip -2.5 2.5 0.01		* 直流仿真，设置扫描变量，
.print dc v(out)	id(x1.m5)											
.tran 0.05U 10U 0 10n
.print tran v(out) v(ip)

.temp 27								* 仿真温度27度
.option post accurate probe

.end