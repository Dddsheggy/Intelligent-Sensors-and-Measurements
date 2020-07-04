x = zeros(1,200);
y = zeros(1,200);
for i=1:200
    if mod(i,2) == 1
        x(i) = (i - 1) / 2;
        y(i) = 10 * x(i);
    else
        x(i) = x(i - 1) + 0.5;
        y(i) = 9.9 * x(i - 1);
    end
end
plot(x, y)
xlabel('接触点i');
ylabel('输出电压/mV');
title('位置传感器的输入输出特性曲线');