%%  ���������  Sample  Entropy
function [SampEn]=SampEn(xdate)
N=length(xdate);
n=N;
x=xdate;
p= 0.15;   % p  ����ѡ��  �� 0.1~0.25
r=p*std(xdate);
%%  ���m=2
m=2;
num=zeros(1,N-m+1);
x2m=zeros(n-m+1,m);%��ű任�������
d=zeros(n-m+1,n-m);% ��ž������ľ���
  for i=1:n-m+1  
    for j=1:m   
        x2m(i,j)=xdate(i+j-1); 
    end
  end
  k=1; 
  for i=1:n-m+1 
    for j=1:n-m+1
        if i~=j
            d(i,k)=max(abs(x2m(i,:)-x2m(j,:)));%�������Ԫ�غ���ӦԪ�صľ���?
            k=k+1;
        end
    end
    k=1;
  end
for  i=1:N-m+1
    for  j=1:N-m
    if d(i,j)<r
        num(i)=num(i)+1;
    end
    end
end
 c=num/(N-m);
 D2=sum(c);
 D2=D2/(N-m+1);
%%  ���m=3
m=3;
num=zeros(1,N-m+1);
x2m=zeros(n-m+1,m);%��ű任�������
d=zeros(n-m+1,n-m);% ��ž������ľ���
  for i=1:n-m+1  
    for j=1:m   
        x2m(i,j)=xdate(i+j-1); 
    end
  end
  k=1; 
  for i=1:n-m+1 
    for j=1:n-m+1
        if i~=j
            d(i,k)=max(abs(x2m(i,:)-x2m(j,:)));%�������Ԫ�غ���ӦԪ�صľ���?
            k=k+1;
        end
    end
    k=1;
  end
for  i=1:N-m+1
    for  j=1:N-m
    if d(i,j)<r
        num(i)=num(i)+1;
    end
    end
end
 c=num/(N-m);
 D3=sum(c);
 D3=D3/(N-m+1);
%%  ���������
SampEn=log(D2/D3);