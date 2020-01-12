.title SH

.include 'BOOTSTRAP.cdl'
.include 'OPA.cdl'
.include 'INV.cdl'
.include 'TRANSGATE.cdl'

VVDD vdd 0 1.8V
VVSS 0 vss 1.8V
VGND gnd 0 0
VCLK clk 0 pulse(0 1.8 0 1p 1p 50n 100n)
VVin vin 0 sin(0 0.5 1meg 0 0 0)

XS0 vdd vss vin out clk / transgate
C1 out gnd 1n

.tran 1p 5u
.probe v(vin) v(out) 
.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end
