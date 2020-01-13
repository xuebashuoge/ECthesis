x = loadsig('SH_simple.tr0');
lssig(x);
simin = timeseries(x(2).data);
open_system('SNR')
sim('SNR', 5e-4);	