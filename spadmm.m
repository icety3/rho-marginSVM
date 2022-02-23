function [obj, w, ret] = spadmm(Z, c, param, w0)
% min c/2||w||^2/2 + phi(q), s.t., Zw=q

[n, d] = size(Z);

if nargin < 4
    w0 = ones(d,1);
end


NITER = param.NITER;
bta = param.beta;
gamma = param.gamma;
rho = param.rho;

obj = zeros(NITER,1);
lag = zeros(NITER,1);
pres = zeros(NITER,1);

%Lip = norm(Z,2)^2;

phi = @(t) min(1,max(1-t/rho,0));

f_obj = @(t) c*norm(t(1:end-1))^2/2 + sum(phi(Z*t));
f_lag = @(w,q,r) c*norm(w(1:end-1))^2/2 +  r'*(Z*w-q) + bta/2*norm(Z*w-q,2)^2 + sum(phi(q));
f_pres = @(w,q) norm(Z*w-q,2)^2;

% init
w = w0;
q = Z*w;
r = zeros(n,1);

P = (c*blkdiag(eye(d-1),0) + bta*(Z'*Z)) \ Z';

for iter = 1:NITER
    
    % record
    obj(iter) = f_obj(w);
    lag(iter) = f_lag(w,q,r);
    pres(iter) = f_pres(w,q);
    
    % update q
    q = prox_mloss( bta/(bta+gamma)*(Z*w+r/bta)+gamma/(bta+gamma)*q ,1/(bta+gamma), rho );
    
    % update w
    w = P*(bta*q-r) ;
    
    % dual
    r = r + bta*(Z*w-q);
end

ret.pres = pres;
ret.lag = lag;

end