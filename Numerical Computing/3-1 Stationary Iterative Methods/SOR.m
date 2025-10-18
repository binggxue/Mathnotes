function x = SOR(A,b,c,accu,w)
    n = length(b);
    x = zeros(n,1);
    count = 0;  %count iterative times
    cyclemax = 10000;
    
    if c == 1
         % converge condition is |Ax-b| < accuracy
        while max(abs(A*x-b))>1e-4 && count < cyclemax
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
            %disp(x);
            count = count + 1;
        end
    elseif c == 2
        % converge condition is |x^{(k+1)}-x^{(k)}| < accuracy
        x_new = x;
        x_old = (1:n)';
        while max(abs(x_new - x_old))>accu && count < cyclemax
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
            %disp(x);
            count = count + 1;
        end
    else
        error('error');
    end

   
    disp(count);
    disp(x);
    disp('-------');
end