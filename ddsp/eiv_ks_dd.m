
function wh = eiv_ks_dd(wd, w, n, m)
if ~exist('m') || isempty(m), m = 1; end
Tf = size(w, 1); H = blkhank(wd, Tf); 
[R, P] = lra(H, Tf * m + n);
wh = reshape(P * P' * vec(w'), 2, Tf)';
