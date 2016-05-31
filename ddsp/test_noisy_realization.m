
% <system-1>
clear all, n = 2; sys0 = ss(tf([1 -1 1], [1 -1.456 0.81], 1)); 
% <w-realization>
Tf = 30; Tf1 = 25;
uf = zeros(Tf, 1); uf(1) = 1;
yf0 = impulse(sys0, Tf - 1); 
yf = yf0; yf(Tf1 + 1:end) = NaN;
wf = [uf yf]; 
% <w-noisy-realization>
yfn = randn(Tf, 1); yf = yf0 + 0.1 * yfn / norm(yfn) * norm(yf0); 
yf(Tf1 + 1:end) = NaN; wf = [uf yf]; 
% <realization-error>
e = @(yfh) norm(yf0(Tf1 + 1:end) - yfh(Tf1 + 1:end)) / norm(yf0(Tf1 + 1:end)); 
% <noisy-realization-result>
opt.wini = 0; opt.exct = 1;
[sysh, info, wfh] = ident(wf, 1, n, opt); 
wh = hmc_nn([zeros(2); wf], n, 1); wh(1:2, :) = []; 
[e(wfh(:, 2)) e(wh(:, 2))]
