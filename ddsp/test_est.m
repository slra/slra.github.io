
% <system-1>
clear all, n = 2; sys0 = ss(tf([1 -1 1], [1 -1.456 0.81], 1)); 
% <ident-data>
Td = 100; rng('default')
ud0 = rand(Td, 1); yd0 = lsim(sys0, ud0); wd0 = [ud0 yd0]; 
wt = randn(Td, 2); wd = wd0 + 0.1 * wt / norm(wt) * norm(wd0);
% <w-est>
wp = NaN * ones(n, 2); Tf = 20; 
uf0 = ones(Tf, 1); yf0 = step(sys0, Tf - 1); wf0 = [uf0 yf0]; 
wft = randn(Tf, 2); wf = wf0 + 0.05 * wft / norm(wft) * norm(wf0);
% <est-error>
e = @(wfh) norm(wf0 - wfh, 'fro') / norm(wf0, 'fro');
% <est-check>
[M, wh] = misfit([wp; wf], sys0); 
wfh = wh(n + 1:end, :);
wfh_ks  = eiv_ks(wf, sys0); 
check_misfit = norm(wfh - wfh_ks, 'fro') / norm(wfh_ks, 'fro')
wfh_ss = eiv_ks_dd(wd0, wf, n);
check_ss = norm(wfh_ss - wfh_ks, 'fro') / norm(wfh_ks, 'fro')
% <est-id>
[sysh, info, wh] = ident({wd, [wp; wf]}, 1, n); 

[sysh_id, info_id] = ident(wd, 1, n); 
wfh_id = eiv_ks(wf,sysh_id); 

wfh_ss = eiv_ks_dd(wd, wf, n); 

[e(wh{2}(n + 1:end, :)) e(wfh_id) e(wfh_ss) e(wf)]
