% clear;
% clc;
% load('E:\aa0011\����+�Ե�\database\data\����02\lh_joy_02.mat');%װ���ź�
% % load sunspot.dat             %װ�������ļ�
% x=data_single{1, 10}(5121:7680,14)*10;%ż����Ϊ�Ե��ź�
function Sps1=spectral_entropy(x,fs)
% ��Ƶ��ͼ
% fs=256;
N=length(x);
y=fft(x,N);
f=(0:length(y)-1)'*fs/length(y);
mag=abs(y);
% subplot(211);plot(f(1:N/2),mag(1:N/2));
% xlabel('f(hz)');ylabel('Amplitude(m/s.^2)');
% ������
Pxx=abs(abs(fft(x,N).^2)/(2*pi*N));
f1=(0:length(Pxx)-1)*fs/length(Pxx);
% subplot(212);plot(f1,Pxx);
%��������
S=sum(Pxx);
dim=length(Pxx);
for i=1:dim
    q(i)=Pxx(i)/S;
end
Sps=-sum(q.*log(q));
Sps1=(100*Sps)/log(N);
