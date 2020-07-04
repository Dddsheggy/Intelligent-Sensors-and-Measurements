clc
close all
clear

%% 5-1
f=1e+6;
a=1e+12;
tau=5e-6;
t=2*tau;
fs=5e+7;

N=t*fs;              % 采样点个数
dt=1/fs;             % 采样时间间隔
Times = (0:N-1)*dt;  % 各采样点时间
s12=sin(2*pi*f*Times).*exp(-a*(Times-tau).^2/2);

figure,
plot(Times,s12),
xlabel('t/s'),
title('超声波顺流信号采样');

%% 5-2
s21_1=sin(2*pi*f*(Times-205e-9)).*exp(-a*(Times-205e-9-tau).^2/2);
s21_2=sin(2*pi*f*(Times-210e-9)).*exp(-a*(Times-210e-9-tau).^2/2);
s21_3=sin(2*pi*f*(Times-215e-9)).*exp(-a*(Times-215e-9-tau).^2/2);

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_1,'r'),
xlabel('t/s'),
title('超声波顺流信号-逆流信号（延时205ns）采样'),
legend('顺流信号','逆流延时205ns'),
hold off;

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_2,'g'),
xlabel('t/s'),
title('超声波顺流信号-逆流信号（延时210ns）采样'),
legend('顺流信号','逆流延时210ns'),
hold off;

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_3,'y'),
xlabel('t/s'),
title('超声波顺流信号-逆流信号（延时215ns）采样'),
legend('顺流信号','逆流延时215ns'),
hold off;

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_1,'r'),
hold on,
plot(Times,s21_2,'g'),
hold on,
plot(Times,s21_3,'y'),
xlabel('t/s'),
title('超声波顺流信号-逆流信号采样'),
legend('顺流信号','逆流延时205ns','逆流延时210ns','逆流延时215ns'),
hold off;

%% 5-3
% 原方法
[a,b]=xcorr(s12,s21_1);
figure,
plot(b*(1/fs),a,'r'),
xlabel('t/s'),
title('相关法（顺流与逆流延时205ns)');
[Rmax,i]=max(a);
delta1=(i-length(s12))*(1/fs);

[a,b]=xcorr(s12,s21_2);
figure,
plot(b*(1/fs),a,'g'),
xlabel('t/s'),
title('相关法（顺流与逆流延时210ns)');
[Rmax,i]=max(a);
delta2=(i-length(s12))*(1/fs);

[a,b]=xcorr(s12,s21_3);
figure,
plot(b*(1/fs),a,'y'),
xlabel('t/s'),
title('相关法（顺流与逆流延时215ns)');
[Rmax,i]=max(a);
delta3=(i-length(s12))*(1/fs);

% 插值处理
fs1=1e+9;
N1=t*fs1;              % 采样点个数
dt1=1/fs1;             % 采样时间间隔
Times1=(0:N1-1)*dt1;  % 各采样点时间
new_s12=interp1(Times,s12,Times1,'pchip');
new_s21_1=interp1(Times,s21_1,Times1,'pchip');
new_s21_2=interp1(Times,s21_2,Times1,'pchip');
new_s21_3=interp1(Times,s21_3,Times1,'pchip');

figure,
plot(Times1,new_s12,'b'),
hold on,
plot(Times1,new_s21_1,'r'),
hold on,
plot(Times1,new_s21_2,'g'),
hold on,
plot(Times1,new_s21_3,'y'),
xlabel('t/s'),
title('超声波顺流信号-逆流信号采样'),
legend('顺流信号','逆流延时205ns','逆流延时210ns','逆流延时215ns'),
hold off;

[a,b]=xcorr(new_s12,new_s21_1);
figure,
plot(b*(1/fs1),a,'r'),
xlabel('t/s'),
title('相关法（顺流与逆流延时205ns)');
[Rmax,i]=max(a);
new_delta1=(i-length(new_s12))*(1/fs1);

[a,b]=xcorr(new_s12,new_s21_2);
figure,
plot(b*(1/fs1),a,'g'),
xlabel('t/s'),
title('相关法（顺流与逆流延时210ns)');
[Rmax,i]=max(a);
new_delta2=(i-length(new_s12))*(1/fs1);

[a,b]=xcorr(new_s12,new_s21_3);
figure,
plot(b*(1/fs1),a,'y'),
xlabel('t/s'),
title('相关法（顺流与逆流延时215ns)');
[Rmax,i]=max(a);
new_delta3=(i-length(new_s12))*(1/fs1);
%% (4)
% 选取215ns延时的逆流信号
SNR(1)=20;
tmp=2000;
inc=40/tmp;
for i= 1:tmp
    SNR(i+1) =  SNR(i)+inc;
end

% 顺逆流加不同强度的噪声
randIndex=randperm(size(SNR,2));
flip_SNR=SNR(:,randIndex);
for i=1:tmp
    new_s12=awgn(s12,SNR(i));
    new_s21_3=awgn(s21_3,flip_SNR(i));
    new_s12=interp1(Times,new_s12,Times1,'pchip');
    new_s21_3=interp1(Times,new_s21_3,Times1,'pchip');
    [a,b] = xcorr(new_s12,new_s21_3);
    [Rmax,I] = max(a);
    margin(i) = (I-length(s12))*(1/fs);
end

figure,
plot(SNR(1:tmp),margin),
title('噪声对结果的影响');
xlabel('顺流信号噪声强度(信噪比）');
ylabel('结果(t/s)');