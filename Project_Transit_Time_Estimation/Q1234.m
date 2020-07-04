clc
close all
clear

%% (1)
f=1e+6;
a=1e+12;
tau=5e-6;
t=2*tau;
fs=1e+9;

N=t*fs;              % ���������
dt=1/fs;             % ����ʱ����
Times = (0:N-1)*dt;  % ��������ʱ��
s12=sin(2*pi*f*Times).*exp(-a*(Times-tau).^2/2);

figure,
plot(Times,s12),
xlabel('t/s'),
title('������˳���źŲ���');

%% (2)
s21_1=sin(2*pi*f*(Times-205e-9)).*exp(-a*(Times-205e-9-tau).^2/2);
s21_2=sin(2*pi*f*(Times-210e-9)).*exp(-a*(Times-210e-9-tau).^2/2);
s21_3=sin(2*pi*f*(Times-215e-9)).*exp(-a*(Times-215e-9-tau).^2/2);

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_1,'r'),
xlabel('t/s'),
title('������˳���ź�-�����źţ���ʱ205ns������'),
legend('˳���ź�','������ʱ205ns'),
hold off;

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_2,'g'),
xlabel('t/s'),
title('������˳���ź�-�����źţ���ʱ210ns������'),
legend('˳���ź�','������ʱ210ns'),
hold off;

figure,
plot(Times,s12,'b'),
hold on,
plot(Times,s21_3,'y'),
xlabel('t/s'),
title('������˳���ź�-�����źţ���ʱ215ns������'),
legend('˳���ź�','������ʱ215ns'),
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
title('������˳���ź�-�����źŲ���'),
legend('˳���ź�','������ʱ205ns','������ʱ210ns','������ʱ215ns'),
hold off;

%% (3)
[a,b]=xcorr(s12,s21_1);
figure,
plot(b*(1/fs),a,'r'),
xlabel('t/s'),
title('��ط���˳����������ʱ205ns)');
[Rmax,i]=max(a);
delta1=(i-length(s12))*(1/fs);

[a,b]=xcorr(s12,s21_2);
figure,
plot(b*(1/fs),a,'g'),
xlabel('t/s'),
title('��ط���˳����������ʱ210ns)');
[Rmax,i]=max(a);
delta2=(i-length(s12))*(1/fs);

[a,b]=xcorr(s12,s21_3);
figure,
plot(b*(1/fs),a,'y'),
xlabel('t/s'),
title('��ط���˳����������ʱ215ns)');
[Rmax,i]=max(a);
delta3=(i-length(s12))*(1/fs);

%% (4)
% ѡȡ215ns��ʱ�������ź�
SNR(1)=20;
tmp=2000;
inc=40/tmp;
for i= 1:tmp
%     % ˳����������������
%     new_s12=s12;
%     new_s21_3=awgn(s21_3,SNR(i));
    % ˳����������������
    new_s12=awgn(s12,SNR(i));
    new_s21_3=s21_3;
%     % ˳��������ͬǿ�ȵ�����
%     new_s12=awgn(s12,SNR(i));
%     new_s21_3=awgn(s21_3,SNR(i));
    [a,b] = xcorr(new_s12,new_s21_3);
    [Rmax,I] = max(a);
    margin(i) = (I-length(s12))*(1/fs);
    SNR(i+1) =  SNR(i)+inc;
end

% % ˳�����Ӳ�ͬǿ�ȵ�����
% randIndex=randperm(size(SNR,2));
% flip_SNR=SNR(:,randIndex);
% for i=1:tmp
%     new_s12=awgn(s12,SNR(i));
%     new_s21_3=awgn(s21_3,flip_SNR(i));
%     [a,b] = xcorr(new_s12,new_s21_3);
%     [Rmax,I] = max(a);
%     margin(i) = (I-length(s12))*(1/fs);
% end

figure,
plot(SNR(1:tmp),margin),
title('�����Խ����Ӱ��');
xlabel('˳���ź�����ǿ��(����ȣ�');
ylabel('���(t/s)');