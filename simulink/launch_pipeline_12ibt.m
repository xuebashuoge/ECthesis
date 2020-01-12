%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 　　　　模拟电路基础：                        
% 　　　　　　从系统级到电路级                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 　　　　陈抗生　周金芳                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 　　　　科学出版社　2018                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 12bit pipeline ADC
%
clear;
bits_number = 12;

fs=1; ts=1/fs;
fin_pre=0.1; nfft=2048;
fin=antismear(fin_pre,fs,nfft);
delta = 1e-2;
k = 1.38e-23;
Temp = 300;
C = 20e-12;
Gain = 1e4;
beta = 0.9;
GBW = log(2^(bits_number+1))*fs/(pi*beta);
noise = 5e-2;


open_system('pipeline_12bit')

sim('pipeline_12bit', 3000*ts);	% Starts Simulink simulation
