function x = ColGauss(A,b)
    n = length(A);
    for k = 1:n-1
        
        [~, pivot_row] = max(abs(A(k:n, k)));
        pivot_row = pivot_row + k - 1;
        
        
        if pivot_row ~= k
            
            temp = A(k, :);
            A(k, :) = A(pivot_row, :);
            A(pivot_row, :) = temp;
            
            temp_b = b(k);
            b(k) = b(pivot_row);
            b(pivot_row) = temp_b;

        end
        for i = k+1:n
            m = A(i,k) / A(k,k);
            for j = k:n
                A(i,j) = A(i,j) - m * A(k,j);
            end
            b(i) = b(i) - m * b(k);
        end
    end
    disp(A);
    x(n) = b(n)/A(n,n);
    for i = n-1:-1:1
      s = 0;
      for j = i+1:n
          s = s + A(i,j) * x(j);
      end
      x(i) = (b(i) - s) / A(i,i);
    end
    disp(x);