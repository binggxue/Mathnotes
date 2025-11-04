function x = Thomas(A,d)
    n = length(A);
    x = zeros(n,1); % Initial solution vector

    % Parameters of Matrix A.
    b = diag(A);
    c = diag(A,1);
    a = [0;diag(A,-1)];
    
    % Initial Parameters
    l = zeros(n,1);
    y = zeros(n,1);
    u = zeros(n-1,1);
    
    % Step 1
    l(1) = b(1);
    y(1) = d(1)/l(1);
    u(1) = c(1)/l(1);

    for i = 2:n-1
        l(i) = b(i) - a(i)*u(i-1);
        y(i) = (d(i)-y(i-1)*a(i))/l(i);
        u(i) = c(i)/l(i);
    end
    
    % Step 2
    l(n) = b(n) - a(n)*u(n-1);
    y(n) = (d(n)-y(n-1)*a(n))/l(n);
    
    % Step 3
    x(n) = y(n);
    
    % Step 4
    for i = n-1:-1:1
        x(i) = y(i) - u(i)*x(i+1);
    end
    
end