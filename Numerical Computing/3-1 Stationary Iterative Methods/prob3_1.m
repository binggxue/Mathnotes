A = [-55,-5,12;21,36,-13;24,7,47];
b = [41;52;12];
n = length(b);
C = zeros(19,1);
for t = 1:19
    w = 0.1*t;
    count = 0;
    cyclemax = 10000;
    x = zeros(n,1);
    x_new = x;
    x_old = (1:n)';
    while max(abs(x_new - x_old))>1e-4 && count < cyclemax
        x_old = x;
        for i = 1:n
            s = 0;
            for j = 1:n
                if j ~= i
                    s = s + A(i,j)*x(j);
                end
            end
            s = s + A(i,i)*x(i);
            x(i) = x(i) + w*(b(i)-s)/A(i,i);
        end
        x_new = x;
        count = count + 1;
    end
    if ~isnan(x)
        C(t) = count;
    else
        C(t) = 0;
    end
end
disp(C);