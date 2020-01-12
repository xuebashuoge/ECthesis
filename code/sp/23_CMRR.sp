.title OPA_CMRR

.include '23.cdl'

*in与out相连
x1 6 8 ip in out OPAMP 
* ip vip
* in vin
* 5 vout
* 6 VDD
* 8 VSS
VDD 6 0 DC  2.5 
VSS 0 8 DC  2.5

.PARAM VCM=1
VCM1 ip 0 DC 0 AC VCM
VCM2 in out DC 0 AC VCM 

.op
.ac dec 10 1 10g
.print ac vdb(out) vp(out)
.probe ac cmrr_db=par('-vdb(out)') cmrr_phase=par('-vp(out)')
* Vout / Vcm = 1 / CMRR		Allen eq. 6.6-3, fig. 6.6-7
* cmrr_db = - (vdb(out))   	即，仅正负号区别
* cmrr_phase = - (vp(out))  即，仅正负号区别
* use expression builder to display cmrr inform ation

.temp 27								* 仿真温度27度
.option post accurate probe

.end