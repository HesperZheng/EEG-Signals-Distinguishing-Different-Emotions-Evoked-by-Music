clc;
clear;
rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�ܵϺ�01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�ܵϺ�01\AA_finial_ave.mat');
value2=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�Ƴ·�01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�Ƴ·�01\AA_finial_ave.mat');
value3=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������01\AA_finial_ave.mat');
value4=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������01\AA_finial_ave.mat');
value5=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����01\AA_finial_ave.mat');
value6=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����ƽ01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����ƽ01\AA_finial_ave.mat');
value7=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\Ѧ����01\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\Ѧ����01\AA_finial_ave.mat');
value8=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\AA_finial_ave.mat');
value9=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�ܵϺ�02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�ܵϺ�02\AA_finial_ave.mat');
value10=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�Ƴ·�02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\�Ƴ·�02\AA_finial_ave.mat');
value11=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\AA_finial_ave.mat');
value12=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\������02\AA_finial_ave.mat');
value13=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����02\AA_finial_ave.mat');
value14=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����ƽ02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\����ƽ02\AA_finial_ave.mat');
value15=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����

rate1=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\Ѧ����02\svm_recog_three1.mat');
maxx=importdata('E:\aa0011\����+�Ե�\database\data\addwavle\Ѧ����02\AA_finial_ave.mat');
value16=[rate1(10:12,1:3) maxx(10:12,25)];%ѡ������ʶ���ʣ���Ӧ��������ȫѡ����
value=[value2 value3 value4 value5 value6 value7 value8 value9 ...
       value10 value11 value12 value13 value14 value15 value16]';
 reco_box=value(:)';
% save BP_reco_three reco_box

