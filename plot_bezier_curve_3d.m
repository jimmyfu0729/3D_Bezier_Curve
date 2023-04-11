function plot_bezier_curve_3d(n, control_points, m)
    % n: 控制点数量
    % control_points: 3xn矩阵，每列包含一个控制点的笛卡尔坐标
    % m: 绘制曲线时用的点数

    % 创建一个包含m个等距参数（t）的向量
    t = linspace(0, 1, m);

    % 计算Bezier曲线的坐标
    curve_points = zeros(3, m);
    for i = 1:m
        curve_points(:,i) = de_casteljau(control_points, t(i));
    end

    % 绘制Bezier曲线
    plot3(curve_points(1,:), curve_points(2,:), curve_points(3,:), 'LineWidth', 2);
    grid on;
    axis equal;
end

function point = de_casteljau(control_points, t)
    % de Casteljau算法用于计算Bezier曲线上的点
    % control_points: 3xn矩阵，每列包含一个控制点的笛卡尔坐标
    % t: 参数值（0 <= t <= 1）

    n = size(control_points, 2);
    points = control_points;
    for k = 1:n-1
        for i = 1:n-k
            % 对于每个点，将其坐标加权平均，并将结果存储在下一行
            points(:,i) = (1-t)*points(:,i) + t*points(:,i+1);
        end
    end
    point = points(:,1);
end