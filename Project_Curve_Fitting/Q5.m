clc;
close all;
clear all;

RT0=22;
themo=linspace(0,100,51);
themok=themo+273.15;
RT=RT0.*exp(3100*(1./themok-1/(25+273.15)));

% 调整训练集大小
% 获取模型阶次n=1,2,3,4,5,6时训练集对应的多项式模型
% 同时计算均方误差
% 重复十次
n=6;
repeat_num=10;
train_MSE1=zeros(repeat_num+1,n);
test_MSE1=zeros(repeat_num+1,n);
train_MSE2=zeros(repeat_num+1,n);
test_MSE2=zeros(repeat_num+1,n);
P1=cell(n,1);
P2=cell(n,1);
for k=1:repeat_num
    RT=RT+0.5.*randn(size(RT));
    % 缩小范围
    train_themo1=themo(16:36);
    test_themo1=[themo(1:15) themo(37:51)];
    train_RT1=RT(16:36);
    test_RT1=[RT(1:15) RT(37:51)];
    % 扩大范围
    train_themo2=themo(6:46);
    test_themo2=[themo(1:5) themo(47:51)];
    train_RT2=RT(6:46);
    test_RT2=[RT(1:5) RT(47:51)];
    for i=1:n
        P1{i}=polyfit(train_themo1,train_RT1,i);
        P2{i}=polyfit(train_themo2,train_RT2,i);
        tmp1=0;
        tmp2=0;
        tmp3=0;
        tmp4=0;
        for j=0:i
            tmp1=tmp1+P1{i}(i-j+1).*train_themo1.^j;
            tmp2=tmp2+P1{i}(i-j+1).*test_themo1.^j;
            tmp3=tmp3+P2{i}(i-j+1).*train_themo2.^j;
            tmp4=tmp4+P2{i}(i-j+1).*test_themo2.^j;
        end
        train_MSE1(k,i)=sum((train_RT1-tmp1).^2)/size(train_RT1,2);
        test_MSE1(k,i)=sum((test_RT1-tmp2).^2)/size(test_RT1,2);
        train_MSE2(k,i)=sum((train_RT2-tmp3).^2)/size(train_RT2,2);
        test_MSE2(k,i)=sum((test_RT2-tmp4).^2)/size(test_RT2,2);
    end
end
for i=1:n
    train_MSE1(repeat_num+1,i)=sum(train_MSE1(1:repeat_num,i))/repeat_num;
    test_MSE1(repeat_num+1,i)=sum(test_MSE1(1:repeat_num,i))/repeat_num;
    train_MSE2(repeat_num+1,i)=sum(train_MSE2(1:repeat_num,i))/repeat_num;
    test_MSE2(repeat_num+1,i)=sum(test_MSE2(1:repeat_num,i))/repeat_num;
end