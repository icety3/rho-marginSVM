%% proximal mapping for rho margin loss 
%% y = argmin{ 0.5*||y - x||^2 + \lmabda Phi_rho(y)}
%%
function [y] = prox_mloss(x, lambda, rho)

y = x;

if 2*rho^2 <= lambda
    cA = (rho - lambda/rho < x) & (x <= rho);
    y(cA) = rho;

    cB = (- lambda/(2*rho) < x) & (x <= rho-lambda/rho);
    y(cB) = x(cB) + lambda/rho;
else
    cA = (rho - sqrt(2*lambda) < x) & (x < rho);
    y(cA) = rho;
end



