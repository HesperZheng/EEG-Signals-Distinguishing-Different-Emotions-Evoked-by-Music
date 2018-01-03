clc;
clear;
close all;

mydir=uigetdir('E:\aa0011\����+�Ե�\database\data','ѡ��һ��Ŀ¼');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
DIRS=dir([mydir,'*.mat']);  %��չ��
n=length(DIRS);


 
for i=1:n
    if ~DIRS(i).isdir
    filename=DIRS(i).name;
    str=[mydir filename];
    end
    
    songs_feature=cell(1,20);%Ԥ�ȷ����ڴ�
    SSE_feature=zeros(20,12);
    wave_feature=zeros(20,216);
    D_frature=zeros(20,12);
    k_frature=zeros(20,12);
    APEn_frature =zeros(20,12);
    SampEn_frature =zeros(20,12);
    Ly_frature =zeros(20,12);
    Coc_frature =zeros(20,12);
    Sps_feature=zeros(20,12);
    lzc_feature=zeros(20,12);
    
    load(str);
    num=length(data_single);
    
    for i=12:num
       data_raw=data_single{1, i}(:,[1,2,3,4,5,6,11,12,13,14,19,21]);%ȡ��Ҫ����������C3��C4�缫
       [dataraw,datarank]=size(data_raw);
       for ii=1:datarank
           try
         data=data_raw(:,ii);
         data1=filter50(data,256)';%�˲�50HZ
         datax=data1(5121:7680,:)*10;%�˲���ȥ���۵�
         
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫����������']);
         SSE=SVDen(datax, 256);%�������أ�����256�����㣬m=20
         SSE_feature(i,ii)=SSE;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫��lz���Ӷ�']);
         lzc=LZC(datax);%lz���Ӷ�
         lzc_feature(i,ii)=lzc;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫������']);
         Sps=spectral_entropy(datax,256);%����
         Sps_feature(i,ii)=Sps;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫��C0���Ӷ�']);
         [C0,C0_average]=c0complex(datax,256,0);%C0���Ӷ�
         Coc_frature(i,ii)=C0_average;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫�����������ŵ��ָ��']);
         lyanpunov=lyapunov_wolf(datax,2560,5,1,5);%���������ŵ��ָ��������2560��Ƕ��ά��6��ʱ��1s������5
         Ly_frature(i,ii)=lyanpunov;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫��������']);
         SampEntropy=SampEn(datax);%������
         SampEn_frature(i,ii)=SampEntropy;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫�Ľ�����']);
         ApEntropy=ApEn(datax);%������
         APEn_frature(i,ii)=ApEntropy;
       
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'�缫��k�غ͹���ά']);   
         [D,k]=kEn_correct(datax,10);
         k_frature(i,ii)=k;%k��
         D_frature(i,ii)=D;%����ά
        
         disp(['���ڼ����',num2str(i),'�׸�����',num2str(ii),'С����Ƶ��ʱƵ������']);  
         feature=wave_brain(datax*100,256);%alpha,thalt,dalt���ķ�ֵ����ֵ���������Ƶ�ʣ�����ʣ����ʺ�
         wave_feature(i,(18*ii-17):ii*18)=feature;%����Ϊ����������Ϊ������
           
             catch
               continue
           end
           end
       sinsong_feature=[wave_feature D_frature k_frature APEn_frature SampEn_frature Ly_frature Coc_frature Sps_feature ...
           lzc_feature SSE_feature];
       songs_feature{1,i}=sinsong_feature;
       clear sinsong_feature datax;
    end 
    
    str(end-3:end)=[];
    str2=[str '_feature'];
    eval(['save ' str2 ' songs_feature']);%�ַ���ת������
    clear songs_feature;
end