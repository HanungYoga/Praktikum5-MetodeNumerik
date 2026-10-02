%Hanung Yoga Adi Pramono_L0325026
function x = EliminasiGauss(A, b)
tic
if nargin < 2
    A = [2 1 -1; 4 3 1; -2 1 2];
    b = [3; 9; 4];
end
b = b(:);
[n, l] = size(A);
for i = 1 : n-1
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        fprintf('m%d%d = %g\n', h, i, m);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end
fprintf('Hasil forward elimination:\n');
A
b
x(n, :) = b(n, :) / A(n, n);
for i = n-1 : -1 : 1
    x(i, :) = (b(i, :) - A(i, i+1:n) * x(i+1:n, :)) / A(i, i);
end
toc
end
