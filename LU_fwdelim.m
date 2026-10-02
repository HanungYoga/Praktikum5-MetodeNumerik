%Hanung Yoga Adi Pramono_L0325026
function [L, U, b] = LU_fwdelim(A, b)
if nargin < 2
    A = [2 1 -1; 4 3 1; -2 1 2];
    b = [3; 9; 4];
end
b = b(:);
[n, l] = size(A);
L = zeros(n);
for i = 1 : n-1
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        L(h, i) = m;
        A(h, :) = A(h, :) - m * A(i, :);
    end
end
L = L + eye(n);
U = A;
end
