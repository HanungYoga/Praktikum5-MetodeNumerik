%Hanung Yoga Adi Pramono_L0325026
function x = LU_Solusi(A, b)
tic
if nargin < 2
    A = [2 1 -1; 4 3 1; -2 1 2];
    b = [3; 9; 4];
end
b = b(:);
fprintf('Hasil dekomposisi LU\n')
[L, U, b] = LU_fwdelim(A, b)
fprintf('Cek L*U:\n');
LU = L * U
[n, m] = size(L);
z = zeros(n, 1);
x = zeros(n, 1);
z(1) = b(1) / L(1, 1);
for i = 2 : n
    z(i) = (b(i) - L(i, 1:i-1) * z(1:i-1)) / L(i, i);
end
fprintf('Hasil forward substitution (z):\n');
z
x(n) = z(n) / U(n, n);
for i = n-1 : -1 : 1
    x(i) = (z(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end
toc
end
