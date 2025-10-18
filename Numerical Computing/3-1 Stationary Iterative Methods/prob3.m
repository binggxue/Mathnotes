A = [1,0,1;-1,1,0;1,2,-3];
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
B = (D-L)\U;
disp(B);
disp(eig(B));