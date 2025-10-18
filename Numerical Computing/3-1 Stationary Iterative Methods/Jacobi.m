function x = Jacobi(A,b,c,accu)
    n = length(b);
    x = zeros(n,1);
    count = 0;  %count iterative times
    x_new = x;
    cyclemax = 100;
    if c==1
        % converge condition is |Ax-b| < accuracy
        while max(abs(A*x-b)) > accu && count < cyclemax
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
            %disp(x_new);
            count = count + 1;
        end
    
    elseif c==2
        % converge condition is |x^{(k+1)}-x^{(k)}| < accuracy
        x_old = (1:n)';
        while max(abs(x_new - x_old)) >= accu && count < cyclemax
            for i = 1:n
                s = 0;
                for j = 1:n
                    if j ~= i
                    s = s + A(i,j)*x(j);
                    end
                end
                x_new(i) = (b(i)-s)/A(i,i);
            end
            x_old = x;
            x = x_new;
            %disp(x_new);
            count = count + 1;
        end
    else
        error('error');
    end
    
    disp(count);
    disp(x);
    disp('-------');
end