.title transmission-gate

.include 'INV.cdl'
.include 'TRANSGATE.cdl'

VVRef vref 0 sin(0.9 0.5 10meg 0 0 0)
VVDD vdd 0 DC=1.8V
VGND vgnd 0 0
VCLK1 clk1 0 pulse(0 1.8 0 1p 1p 5n 10n)
XI0 vdd gnd vref out2 clk1 / transgate
r2 out2 vgnd 10k

.tran 1p 1u   
.print v(clk1) v(vref) v(out2)
.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end
