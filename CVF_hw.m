%% 个人信息
% 姓名：郭沩峰
% 学号：23009100137
% x=3,y=7
% m=x+y=10


%% 计算复数根
%初始化z
z=3+7i;

%开10次方根
n=10;

% 计算模和幅角
r=abs(z);
theta=angle(z);

% 带入k=1-10,计算n重根
roots=zeros(1,n); 
for k=0:n-1
    roots(k+1)=nthroot(r,n)* exp(1i*(theta + 2*pi*k)/n);
end

% 提取实部和虚部
real_parts = real(roots);
imag_parts = imag(roots);


%% 绘制复数根
%图例
figure;
plot(real_parts, imag_parts, 'ro', 'MarkerSize', 2, 'DisplayName', 'n次方根');
hold on;
for k = 1:n
    label = ['$w_{' num2str(k) '}$'];
    text(real_parts(k) + 0.07, imag_parts(k), label, 'Interpreter', 'latex', 'FontSize', 12, 'Color', 'black');
end
%标上箭头
for k = 1:n
    plot([0 real_parts(k)], [0 imag_parts(k)],'color',[0.5451,0.27059,0.07451],'LineWidth', 0.75);
    quiver(0, 0, real_parts(k), imag_parts(k), 0,'color',[0.5451,0.27059,0.07451], 'LineWidth', 0.75, 'MaxHeadSize', 0.2);
end

%% 图形美化

% 绘制圆
theta_circle = linspace(0,2*pi,100);
circle_x=nthroot(r,n)*cos(theta_circle);
circle_y=nthroot(r,n)*sin(theta_circle);
plot(circle_x, circle_y,'color',[0.4660 0.6740 0.1880], 'linewidth', 1);

% 连成多边形
plot([real_parts real_parts(1)], [imag_parts imag_parts(1)], 'color',[0.27451,0.5098,0.70588], 'LineWidth', 1);

%% 坐标轴初始化

%绘制坐标轴
axis_length = 1.2 * nthroot(r, n);
quiver(0, 0, axis_length, 0, 0, 'k', 'LineWidth', 1, 'MaxHeadSize', 0.2); 
quiver(0, 0, 0, axis_length, 0, 'k', 'LineWidth', 1, 'MaxHeadSize', 0.2); 
plot([-axis_length, 0], [0, 0], 'k', 'LineWidth', 1); 
plot([0, 0], [-axis_length, 0], 'k', 'LineWidth', 1); 
text(axis_length, 0.05, '$x$', 'Interpreter', 'latex', 'FontSize', 10);
text(0.05, axis_length-0.1, '$y$', 'Interpreter', 'latex', 'FontSize', 10);
text(0.1, 0.1, '$O$', 'Interpreter', 'latex', 'FontSize', 10, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');

% 设置图形属性
axis equal;
title('$w =\sqrt[10]{3+7i}$','interpreter','latex');
grid on;
hold off;

%% 计算相对误差

% 计算多边形的周长
C1 = 0;
for k = 1:n-1
    % 计算相邻点之间的距离
    C1 = C1 + abs(roots(k+1) - roots(k));
end

C1 = C1 + abs(roots(1) - roots(n));

% 计算圆的周长
C2 = 2 * pi * nthroot(r, n);

% 计算相对误差
error = abs(C1 - C2) / C1;

%标出相对误差
text(0.6, 1.4, '相对误差 ', 'FontSize', 12, 'HorizontalAlignment', 'center'); 
text(1.2, 1.38, '$$\sigma = 1.64\%$$', 'Interpreter', 'latex', 'FontSize', 12, 'HorizontalAlignment', 'center'); 




