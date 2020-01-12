.title firststage

.include 'OPA.cdl'
.include 'INVERTOR.cdl'
.include 'SUBADC.cdl'
.include 'COMPARATOR.cdl'
.include 'INV.cdl'
.include 'MDAC.cdl'

VVDD vdd 0 DC = 2V
VGND gnd 0 0
VVSS 0 vss DC = 2V
VVip vip 0 pwl 0 -1, 1m 1
VCLK clk 0 pulse(0 1.8 0 1p 1p 5u 10u)

//sub-ADC电路
XA0 vdd vss gnd vip out1 out2 out3 out4 out5 out6 clk / subadc

//MDAC电路
XM0 vdd vss gnd out1 out2 out3 out4 out5 out6 vip out / mdac

//瞬态仿真
.tran 1n 1m
.probe v(vip) v(out)
//计算功耗
.measure powerall avg power

.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end