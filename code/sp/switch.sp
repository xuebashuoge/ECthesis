
.title bootstrap

.include 'INV.cdl'
.include 'BOOTSTRAP.cdl'

VVDD vdd 0 DC = 1.8V
VVSS 0 vss DC = 1.8V
VGND gnd 0 0
VCLK clk 0 pulse(0 1.8 0 1p 1p 5n 10n)
VVin vin 0 sin(0.9 0.5 10meg 0 0 0)

XI0 clk clkb gnd vdd / inv_dac

XI1 vdd gnd vin out clk / bootstrap

R1 out gnd 10k


.tran 1p 1u   
.probe v(clk) v(vin) v(out)

.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end
