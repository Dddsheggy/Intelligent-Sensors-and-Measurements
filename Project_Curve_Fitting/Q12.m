clc;
close all;
clear all;

% 阻值随温度变化的特性曲线
RT0=22;
themo=linspace(0,100,51);
themok=themo+273.15;
RT=RT0.*exp(3100*(1./themok-1/(25+273.15)));
figure,
plot(themo,RT),
title('热敏电阻阻值随温度变化的特性曲线'),
xlabel('温度/℃'),
ylabel('热敏电阻阻值/kohm');

% 添加高斯噪声
RT=RT+0.5.*randn(size(RT));
figure,
plot(themo,RT),
title('热敏电阻阻值随温度变化的特性曲线（加高斯噪声后）'),
xlabel('温度/℃'),
ylabel('热敏电阻阻值/kohm');

% 划分测试集和训练集
train_themo=themo(11:41);
train_RT=RT(11:41);
test_themo=[themo(1:10) themo(42:51)];
test_RT=[RT(1:10) RT(42:51)];

% 获取模型阶次n=1,2,3,4,5,6时训练集对应的多项式模型
% 同时计算均方误差
n=6;
repeat_num=10;
train_MSE=zeros(1,n);
test_MSE=zeros(1,n);
P=cell(n,1);
for i=1:n
    P{i}=polyfit(train_themo,train_RT,i);
    tmp1=0;
    tmp2=0;
    for j=0:i
        tmp1=tmp1+P{i}(i-j+1).*train_themo.^j;
        tmp2=tmp2+P{i}(i-j+1).*test_themo.^j;
    end
    figure,
    plot(themo,[tmp2(1:10) tmp1 tmp2(11:20)]),
    title(['训练集拟合曲线(阶次n=', num2str(i), ')']),
    xlabel('温度/℃'),
    ylabel('热敏电阻阻值/kohm');  
    train_MSE(1,i)=sum((train_RT-tmp1).^2)/size(train_RT,2);
    test_MSE(1,i)=sum((test_RT-tmp2).^2)/size(test_RT,2);
end