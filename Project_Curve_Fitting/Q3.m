clc;
close all;
clear all;

RT0=22;
themo=linspace(0,100,51);
themok=themo+273.15;
RT=RT0.*exp(3100*(1./themok-1/(25+273.15)));
train_themo=themo(11:41);
test_themo=[themo(1:10) themo(42:51)];

% ��ȡģ�ͽ״�n=1,2,3,4,5,6ʱѵ������Ӧ�Ķ���ʽģ��
% ͬʱ����������
% �ظ�ʮ��
n=6;
repeat_num=10;
train_MSE=zeros(repeat_num+1,n);
test_MSE=zeros(repeat_num+1,n);
P=cell(n,1);
for k=1:repeat_num
    % ��Ӹ�˹����
    RT=RT+0.5.*randn(size(RT));
    train_RT=RT(11:41);
    test_RT=[RT(1:10) RT(42:51)];
    for i=1:n
        P{i}=polyfit(train_themo,train_RT,i);
        tmp1=0;
        tmp2=0;
        for j=0:i
            tmp1=tmp1+P{i}(i-j+1).*train_themo.^j;
            tmp2=tmp2+P{i}(i-j+1).*test_themo.^j;
        end
        train_MSE(k,i)=sum((train_RT-tmp1).^2)/size(train_RT,2);
        test_MSE(k,i)=sum((test_RT-tmp2).^2)/size(test_RT,2);
    end
end
for i=1:n
    train_MSE(repeat_num+1,i)=sum(train_MSE(1:repeat_num,i))/repeat_num;
    test_MSE(repeat_num+1,i)=sum(test_MSE(1:repeat_num,i))/repeat_num;
end