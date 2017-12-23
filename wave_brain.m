% clc;
% clear;
% close all;
% load('E:\aa0011\����+�Ե�\database\data\������01\zsd_anxious_01.mat');%װ���ź�
% s=data_single{1, 15}(5121:7680,10)*10;%ż����Ϊ�Ե��ź�
%  w=filter50(s,256)';%�˲�50HZ
% % load singal
% % s=sig;
% fs=256; %����Ƶ��
function [feature]=wave_brain(s,fs)
s=filter50(s,256)';%�˲�50HZ
N=length(s);
nfft = 2^nextpow2(N);
order=512;%�˲�������
figure(1);
subplot(311);plot(s,'r');title('ԭʼ�ź�');
l=wmaxlev(s,'db4');       %��ֽ�����߶�
%���룬�ü���Сԭ�������ֵѡ���ڲ�ͬ�����������������ֵ
sd=wden(s,'minimaxi','s','mln',real(l),'db4');
% sd=s;
subplot(312);plot(sd,'r');title('�˳������ź�');%Xlabel('ͼ2 ԭʼ�ź�������źŶԱ�');
ff=fft(sd,nfft)/N;%���ٸ���Ҷ�任
f=fs/2*linspace(0,1,nfft/2+1);

subplot(313);plot(f,2*abs(ff(1:nfft/2+1)),'r');xlabel('Ƶ��Hz');title('�ź�Ƶ��');axis([0 60 0,20]);
[C,L]=wavedec(sd,5,'db4'); %��С��db4���źŽ��ж�߶ȷֽ�(0~128Hz)
 
%��ȡһάС���任��Ƶϵ��
D5=detcoef(C,L,5);
D4=detcoef(C,L,4);
D3=detcoef(C,L,3);
D2=detcoef(C,L,2);
D1=detcoef(C,L,1);
% figure(2);
% subplot(515);plot(D5);ylabel('D5');
% subplot(514);plot(D4);ylabel('D4'); 
% subplot(513);plot(D3);ylabel('D3');
% subplot(512);plot(D2);ylabel('D2');
% subplot(511);plot(D1);ylabel('D1');title('ϸ��ϵ��');
 
%��ȡһάС���任��Ƶϵ��
A5=appcoef(C,L,'db4',5);
A4=appcoef(C,L,'db4',4);
A3=appcoef(C,L,'db4',3);
A2=appcoef(C,L,'db4',2);
A1=appcoef(C,L,'db4',1);
% figure(3);
% subplot(515);plot(A5);ylabel('A5');
% subplot(514);plot(A4);ylabel('A4'); 
% subplot(513);plot(A3);ylabel('A3');
% subplot(512);plot(A2);ylabel('A2');
% subplot(511);plot(A1);ylabel('A1');title('����ϵ��');
 
%�÷ֽ�ϵ���ع�
SRA5=wrcoef('a',C,L,'db4',5);
SRA4=wrcoef('a',C,L,'db4',4);
SRA3=wrcoef('a',C,L,'db4',3);
SRA2=wrcoef('a',C,L,'db4',2);
SRA1=wrcoef('a',C,L,'db4',1); 
SRD5=wrcoef('d',C,L,'db4',5); 
SRD4=wrcoef('d',C,L,'db4',4); 
SRD3=wrcoef('d',C,L,'db4',3);             
SRD2=wrcoef('d',C,L,'db4',2);             
SRD1=wrcoef('d',C,L,'db4',1); 

figure(2);
dalt=[SRA5];    %��-wave(1~4Hz) 
thalt=[SRD5];   %��-wave(4~8Hz)
alpha=[SRD4];   %��-wave(8~13Hz)
belta=[SRD3];   %��-wave(14~30Hz)
subplot(411);plot(dalt,'r');ylabel('dalt');axis([0 1000 -30 30]);%title('��Ƶ���ź�');
subplot(311);plot(thalt,'r');ylabel('thalt');axis([0 1000 -30 30]);
subplot(312);plot(alpha,'r');ylabel('alpha');axis([0 1000 -30 30]);
subplot(313);plot(belta,'r');ylabel('belta');axis([0 1000 -30 30]);%Xlabel('ͼ3 ��Ƶ��ʱ���ź�');
%% ��������
[alp_wavepeak,wavpestation1]=max(alpha);
alp_mean=mean(alpha);
alp_std=std(alpha)^2;

[tha_wavepeak,wavpestation2]=max(thalt);%��ֵ
tha_mean=mean(thalt);%��ֵ
tha_std=std(thalt)^2;%����

[dal_wavepeak,wavpestation3]=max(dalt);
dal_mean=mean(dalt);
dal_std=std(dalt)^2;

[bel_wavepeak,wavpestation4]=max(belta);
bel_mean=mean(belta);
bel_std=std(belta)^2;
%% Ƶ��
figure(3);
%daltƵ��Ƶ��
ff1=fft(dalt,nfft)/N;
ff_1=2*abs(ff1(1:nfft/2+1));
% subplot(411);plot(f,ff_1);ylabel('��-1~4Hz');axis([0 50 0,15]);
% thaltƵ��Ƶ��
ff2=fft(thalt,nfft)/N;
ff_2=2*abs(ff2(1:nfft/2+1));
subplot(311);plot(f,ff_2,'r');ylabel('��-4~8Hz');axis([0 50 0,5]);
%alphaƵ��Ƶ��
ff3=fft(alpha,nfft)/N;
ff_3=2*abs(ff3(1:nfft/2+1));
subplot(312);plot(f,ff_3,'r');ylabel('��-8~13Hz');axis([0 50 0,5]);
%beltaƵ��Ƶ��
ff4=fft(belta,nfft)/N;
ff_4=2*abs(ff4(1:nfft/2+1));
subplot(313);plot(f,ff_4,'r');xlabel('Ƶ��Hz');ylabel('��-14~30Hz');axis([0 60 0,0.5]);%Xlabel('ͼ4 ��Ƶ���ź�Ƶ��');
%% Ƶ������
[alp_frepeak1,frepestation1]=max(ff_1(18:end,:));%alpha�������,18Ϊȥ��0HZ-1HZƵ�ʣ��������ʵ�򲻱أ��������޲���
alp_frepeak=frepestation1+17;
alp_cenfre=f(1,alp_frepeak);%alpha������Ƶ��
alp_sum=sum(ff_1(18:end,:));%alpha���ʺ�
[tha_frepeak1,frepestation2]=max(ff_2(18:end,:));%thalt�������
tha_frepeak=frepestation2+17;
tha_cenfre=f(1,tha_frepeak);%thalt������Ƶ��
tha_sum=sum(ff_2(18:end,:));%thalt���ʺ�
[dal_frepeak1,frepestation3]=max(ff_3(18:end,:));%dalt�������
dal_frepeak=frepestation3+17;
dal_cenfre=f(1,dal_frepeak);%dalt������Ƶ��
dal_sum=sum(ff_3(18:end,:));%thalt���ʺ�
[bel_frepeak1,frepestation4]=max(ff_4(18:end,:));%belt�������
bel_frepeak=frepestation4+17;
bel_cenfre=f(1,bel_frepeak);%belt������Ƶ��
bel_sum=sum(ff_4(18:end,:));%thalt���ʺ�
feature=[alp_wavepeak alp_mean alp_std alp_cenfre alp_frepeak1 alp_sum tha_wavepeak tha_mean tha_std tha_cenfre tha_frepeak1 tha_sum ...
  dal_wavepeak dal_mean dal_std dal_cenfre dal_frepeak1 dal_sum ];

