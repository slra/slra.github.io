
function [uh, yh] = ls_track(sys, y, x0)
[T, p] = size(y); n = size(sys, 'order'); % asume single input
if nargin < 3, x0 = zeros(n, 1); end
h = impulse(sys, T - 1); h = vec(h'); 

TT = zeros(p * T, T); 
for i = 1:T, 
  TT(:, i) = [zeros(p * (i - 1), 1); h(1:(p * (T - i + 1)))]; 
end

I = eye(n); 
for i = 1:n, 
  O(:, i) = vec(initial(sys, I(:, i), T - 1)'); 
end

uh = pinv(TT) * (vec(y') - O * x0); 
yh = reshape(O * x0 + TT * uh, p, T)';
