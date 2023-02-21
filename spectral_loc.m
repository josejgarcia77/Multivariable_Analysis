function spect_localizer = spectral_loc(d_tuple)
% Computes Clifford spectrum characteristic poynomial
%
    d = size(d_tuple,2);
    n = size(d_tuple{1,1},1);
    s = 2^(floor(d/2));
    X = sym('x',[1 d],'real');
    sigmas = cliff_rep(d);
    spect_localizer = zeros(s*n,s*n);
    for j = 1:d
        spect_localizer = spect_localizer + kron(sigmas{1,j},(d_tuple{1,j}-X(1,j)*eye(n)));
    end
end