
% <system-1>
clear all, n = 2; sys0 = ss(tf([1 -1 1], [1 -1.456 0.81], 1)); 
% <ident-data>
Td = 100; rng('default')
ud0 = rand(Td, 1); yd0 = lsim(sys0, ud0); wd0 = [ud0 yd0]; 
wt = randn(Td, 2); wd = wd0 + 0.1 * wt / norm(wt) * norm(wd0);
% <w-simulation>
Tf = 20; s0 = step(sys0, Tf - 1); 
uf = ones(Tf, 1); yf = NaN * ones(Tf, 1); wf = [uf yf]; 
% <sim-error>
e = @(sh) norm(s0 - sh) / norm(s0);
% <sim-check>
opt.exct = 1; opt.wini = 0; [M, wfh] = misfit(wf, sys0, opt); sh = wfh(:, 2); e(sh)  
% <sim-result>
opt.exct = {[], 1}; opt.wini = {[], 0}; 
[sysh, info, wh] = ident({wd wf}, 1, n, opt); sh = wh{2}(:, 2); 

[sysh_id, info_id, wd_id] = ident(wd, 1, n); sh_id = step(sysh_id, Tf - 1); 

addpath ~/mfiles/detss, sh_ss = cumsum(uy2h(wd(:, 1), wd(:, 2), 2, 2, Tf));

[e(sh) e(sh_id) e(sh_ss)]
sysh_id = n4sid(iddata(wd(:, 2), wd(:, 1)), n, 'Feedthrough', 1);
sh_id = step(sysh_id, Tf - 1); e(sh_id)
