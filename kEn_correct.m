function [a,k]=kEn_correct(s,mm)

% load('E:\aa0011\����+�Ե�\database\data\������01\zsd_anxious_01.mat');%װ���ź�
% s=data_single{1, 10}(5121:7680,14)*10;%ż����Ϊ�Ե��ź�
X=s';
%--------------------------------------------------------------------------
% G-P�㷨�������ά

rr = 0.5;
Log2R = -6:rr:0;        % log2(r)
R = 2.^(Log2R);

fs = 256;               % �źŲ���Ƶ��
t = 12;                 % ʱ��
% dd = 4;                 % Ƕ��ά���
% D = 4:dd:36;            % Ƕ��ά    
dd = 2;                 % Ƕ��ά���
% D = 2:dd:80; 
D = 2:dd:mm;
p = 50;                 % ���ƶ��ݷ��룬��������ƽ������(�����Ǹ�����ʱ p = 1)  

% tic 
Log2Cr = log2(CorrelationIntegral(X,t,D,R,p));   % ���ÿһ�ж�Ӧһ��Ƕ��ά
% toc

%--------------------------------------------------------------------------
% �����ͼ

% figure
% plot(Log2R,Log2Cr','k.-'); axis tight; hold on; grid on;
% xlabel('log2(r)'); 
% ylabel('log2(C(r))');
% title(['Lorenz, length = ',num2str(k2)]);

%--------------------------------------------------------------------------
% ��С�������

Linear = [8:12];                            % �����ƺ�����
[a,B] = LM2(Log2R,Log2Cr,Linear);           % ��С������б�ʺͽؾ�

disp(sprintf('Correlation Dimension = %.4f',a));

% for i = 1:length(D)
%     Y = polyval([a,B(i)],Log2R(Linear),1);
%     plot(Log2R(Linear),Y,'r');
% end
% hold off;

%--------------------------------------------------------------------------
% ���ݶ�

Slope = diff(Log2Cr,1,2)/rr;                % ���ݶ�
xSlope = Log2R(1:end-1);                    % �ݶ�����Ӧ��log2(r)

% figure;
% plot(xSlope,Slope','k.-'); axis tight; grid on;
% xlabel('log2(r)'); 
% ylabel('Slope');
% title(['Lorenz, length = ',num2str(k2)]);

%--------------------------------------------------------------------------
% �����K��

KE = -diff(B)/(dd*t)*fs*log(2);             % �ò���Ƶ�� fs �͹�ʽ log(x) = log2(x)*log(2) ����λת���� nats/s
D_KE = D(1:end-1);                          % K������Ӧ��Ƕ��ά

% figure;
% plot(D_KE,KE,'k.-'); grid on; hold on;
% xlabel('m'); 
% ylabel('Kolmogorov Entropy (nats/s)');
% title(['Lorenz, length = ',num2str(k2)]);

%--------------------------------------------------------------------------
% �����ʾ
k=min(KE);

disp(sprintf('Kolmogorov Entropy = %.4f',min(KE)));
end



