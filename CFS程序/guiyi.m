clc;
clear all;
close all;
A=xlsread('E:\aa0011\MVʵ����\CFS����\1.xls');%��ȡ����%
for i=1:size(A,2);
    temp=A(:,i);
    temp=(temp-min(temp))/(max(temp)-min(temp));%��һ��%
    A(:,i)=temp;
    B=corr(A,'type','Spearman');%�����ݵ������%
    C=abs(B);
end
A=B;