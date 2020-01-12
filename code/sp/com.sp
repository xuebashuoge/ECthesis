.title comparator

.include 'INV.cdl'
.include 'COMPARATOR.cdl'
.include 'COM.cdl'
.include 'OPA2.cdl'

VVDD vdd 0 DC = 1.8V
VVSS 0 vss DC = 1.8V
VGND gnd 0 0
VCLK clk 0 pulse(0 1.8 0.1n 0.1n 0.1n 5n 10n)
VVin vin 0 DC = -0.5V
VVip vip 0 pulse(-1 1 1u 0.1n 0.1n 1u 2u)  //DC = 0V sin(0 1 1meg 0 0 0)

//XI0 vdd gnd vip vin outp outn clk / comparator
//C1 outp gnd 10f
//C2 outn gnd 10f
//XI1 vdd vss gnd vip vin outp / compare
XI2 vip vin outp vdd vss / OPAMP

.op
.tran 0.1n 2u
.print v(vip) v(outp) v(vin) v(clk) v(outn)
.measure powerall avg power

.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end