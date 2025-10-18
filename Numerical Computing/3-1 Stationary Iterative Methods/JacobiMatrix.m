function x = JacobiMatrix(A,b)
    n = length(b);
    D = diag(diag(A));
    L = -tril(A,-1);
    U = -triu(A,1);
    x = zeros(n,1);
    count = 0;
    cyclemax = 100;

    % converge condition is |Ax-b|<1e4
    while max(abs(A*x-b))>1e-4 && count < cyclemax
        x = D\(L+U)*x+D\(b);
        disp(x);
        count = count + 1;
    end
    disp(count);
    disp(x);