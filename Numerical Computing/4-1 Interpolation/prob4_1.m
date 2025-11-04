x = linspace(1,6,11)';
y = atan(x);
[p,q] = chashang(x,y);
disp(q);

eval_points = linspace(0,8,33)';
t = atan(eval_points);
N = zeros(33,1);

for i = 1:33
    current_point = eval_points(i);
    
    pr = zeros(1, 10);
    pr(1) = 1;
    
    for k = 2:10
        pr(k) = pr(k-1) * (current_point - x(k-1));
    end

    sum_val = 0;
    for j = 1:10
        sum_val = sum_val + q(j) * pr(j);
    end
    
    N(i) = sum_val;
end

disp(N-t);
