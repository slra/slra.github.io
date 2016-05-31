
function wh = eiv_smoother(w, sys)
T = size(w, 1); n = size(sys, 'order'); % assume SISO
h = impulse(sys, T - 1); TT = toeplitz(h, [h(1) zeros(1, T - 1)]);
I = eye(n); for i = 1:n, O(:, i) = initial(sys, I(:, i), T - 1); end
A = [zeros(T, n) eye(T); O TT]; x0uh = A \ w(:);
yh = [O TT] * x0uh; wh = [x0uh(n + 1:end), yh];
