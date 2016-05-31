
% <system-2>
n = 2; sys0 = ss(tf([1 -1],[1 -1.456 0.81],1)); 
% <ident-data>
Td = 100; rng('default')
ud0 = rand(Td, 1); yd0 = lsim(sys0, ud0); wd0 = [ud0 yd0]; 
wt = randn(Td, 2); wd = wd0 + 0.1 * wt / norm(wt) * norm(wd0);
% <w-ctr>
Tf = 30; uf = NaN * ones(Tf, 1); yf = ones(Tf, 1); wf = [uf yf]; 
% <ctr-error>
e = @(yfh) norm(yf - yfh) / norm(yf);
% <ctr-check>
opt.wini = 0; % zero initial conditions
[M, wfh] = misfit(wf, sys0, opt); ufh = wfh(:, 1);
[ufh_ls, yfh_ls] = ls_track(sys0, yf); ufh_ls_opt = ufh_ls;
norm(ufh_ls - ufh) / norm(ufh_ls)
% <ctr-results>
opt.wini = 0; opt.solver = 'c'; opt.method = 'q'; 
[sysh, info, wfh] = ident({100 * wd, wf}, 1, n, opt); ufh = wfh{2}(:, 1); 
[sysh_id, info_id] = ident(wd, 1, n, opt); 
[ufh_ls, yfh_ls] = ls_track(sysh_id, yf); 
yfh = lsim(sysh, ufh); 
yfh_ls = lsim(sysh_id, ufh_ls); 
[e(yfh) e(yfh_ls)]
yfh = lsim(sys0, ufh); 
yfh_ls = lsim(sys0, ufh_ls); 
yfh_ls_opt = lsim(sys0, ufh_ls_opt); 
[e(yfh) e(yfh_ls) e(yfh_ls_opt)]
