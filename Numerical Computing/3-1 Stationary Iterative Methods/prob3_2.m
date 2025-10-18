function prob3_2()
    Jacob(6);
end

function x = Jacob(n)
    A = ones(n);
    for i = 1:n
        A(i,i) = n + i;
    end
    b = (1:n)';
    x = zeros(n,1);
    count = 0;  %count iterative times
    x_new = x;
    cyclemax = 100;
    while max(abs(A*x-b)) > 1e-4 && count < cyclemax
        for i = 1:n
            s = 0;
            for j = 1:n
                if j ~= i
                s = s + A(i,j)*x(j);
                end
            end
            x_new(i) = (b(i)-s)/A(i,i);
        end
        x = x_new;
        count = count + 1;
    end
    disp(x);
end