.title SH

.include 'BOOTSTRAP.cdl'
.include 'OPA.cdl'
.include 'INV.cdl'
.include 'TRANSGATE.cdl'

VVDD vdd 0 1.8V
VVSS 0 vss 1.8V
VGND gnd 0 0
VPHI1 phi1 0 pulse(0 1.8 10n 1p 1p 40n 100n)
VPHIa phia 0 pulse(0 1.8 10n 1p 1p 39.9n 100n)
VPHI2 phi2 0 pulse(0 1.8 60n 1p 1p 40n 100n)
VVin vin 0 sin(0.5 0.5 1meg 0 0 0)

//XS0 vdd vss out gnd phi1 / transgate
XS1 vdd vss net1 gnd phi1 / transgate
XS2 vdd vss net2 out phi2 / transgate
XS3 vdd vss vin net2 phi1 / transgate
XI0 gnd net1 out vdd vss / OPAMP

Cf net1 net2 0.1p
Cs vin net1 0.1p
Cp out gnd 1p

.tran 1p 5u
.probe v(vin) v(out) v(phi1) v(phi2) v(net1) v(net2)
.lib '..\models\ms018.lib' tt
.temp 27
.option post accurate probe nomod captab
.end
