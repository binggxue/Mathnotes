function U = Givens(A)
    n = length(A);
    for i = 1:n-1
        G = eye(n);
        G(i,i) = A(i,i)/sqrt(A(i,i)^2+A(i+1,i)^2);
        G(i+1,i+1) = G(i,i);
        G(i,i+1) = A(i+1,i)/sqrt(A(i,i)^2+A(i+1,i)^2);
        G(i+1,i) = -G(i,i+1);
        A = G*A;
    end
    U = A;
end