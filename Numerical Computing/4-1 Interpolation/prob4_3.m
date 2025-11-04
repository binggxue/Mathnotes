x = linspace(-5,5,21)';
f = 1./(x.^2+1);
[p,q] = chashang(x,f);

eval_points = linspace(-5,5,1000)';
N = zeros(length(eval_points),1);

for i = 1:length(eval_points)
    current_point = eval_points(i);
    
    pr = zeros(1,21);
    pr(1) = 1;

    for k = 2:21
        pr(k) = pr(k-1) * (current_point - x(k-1));
    end
    
    sum_val = 0;
    for j = 1:length(q)
        sum_val = sum_val + q(j) * pr(j);
    end
    
    N(i) = sum_val;
end

figure;
plot(eval_points, N, 'r-', 'LineWidth', 2, 'DisplayName', 'p(x)');
hold on;
plot(x, f, 'bo', 'MarkerSize', 5, 'MarkerFaceColor', 'b', 'DisplayName', 'f(x)');
hold off;

t = 1./(eval_points.^2 + 1);
max_deviation = max(abs(N - t));
disp(max_deviation);