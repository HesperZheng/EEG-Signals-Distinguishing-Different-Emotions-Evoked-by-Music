function e=filter50(x,y)
 N=length(x);%�źų���
 fs=y;%����Ƶ��
% x1=randn(1,N);%ģ���Ե��ź�
% x2=sin(2*pi*50*[0:N-1]/fs);%50hz��Ƶ
% x=x1+x2;
x1=x;
d=x1;%�����ź�

randphase=pi*rand;
C=0.4484;
rx1=C*sin(2*pi*50*[0:N-1]/fs+randphase);%�ο��ź�1
rx2=C*cos(2*pi*50*[0:N-1]/fs+randphase);%�ο��ź�2




m=5;%�˲�������
w1=zeros(m,1);%Ȩ1
w2=zeros(m,1);%Ȩ2
y=zeros(1,N);%����Ӧ�˲������
e=zeros(1,N);%����������������˲����
u=1/32;

for k=m:N
    x1k=rx1(k-m+1:k);
    x2k=rx2(k-m+1:k); 
   y(k)=x1k*w1+x2k*w2;%+x1k*w2;%ϵͳ����ź�
    % y(k)=x1k*w1;
    e(k)=d(k)-y(k);%���
    w1=w1+2*u*e(k)*x1k.'; 
    w2=w2+2*u*e(k)*x2k.'; 
end


% figure;
% % subplot(3,2,1)
% % plot(x1)
% % title('�������ź�')
% % subplot(3,2,2)
% % px1=abs(fft(x1));
% % plot(fs/N:fs/N:fs/2,px1(1:N/2))
% % title('�������ź�Ƶ��')
% subplot(2,2,1)
% plot(x)
% title('ԭʼ�ź�')
% subplot(2,2,2)
% px=abs(fft(x));
% plot(fs/N:fs/N:fs/2,px(1:N/2))
% title('ԭʼ�ź�Ƶ��')
% subplot(2,2,3)
% plot(e)
% title('ȥ��Ƶ���ź�')
% subplot(2,2,4)
% pe=abs(fft(e));
% plot(fs/N:fs/N:fs/2,pe(1:N/2))
% title('ȥ��Ƶ���ź�Ƶ��')

% a=[1,-2*(1-u*C*C)*cos(2*pi*50/fs),1-2*u*C*C];
% b=[1,-2*cos(2*pi*50/fs),1];
% figure;    
% [h,ww]=freqz(b,a);
% plot((ww/pi)*(fs/2),20*log10(h));
% title('�˲�����������')
% xlabel('Ƶ��(Hz)')
% ylabel('�������ԣ�db��')

