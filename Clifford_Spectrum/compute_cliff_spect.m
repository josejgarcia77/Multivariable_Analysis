function [L_x] = compute_cliff_spect(varargin)
% Computes Clifford spectrum characteristic poynomial
    A = varargin{1};
    d = size(A,1);
    disp(d);
    s = 2^(ceil(d/2));
    lambda = sym('l',[1 ... d]);
    L_x = zeros(s*size(A(1),1));
    for j = 1:d
        L_x = L_x + kron((A(j)-lambda[j]*eye(s)),sig_x)
    end
    return poly(L_x)
end