function sigmas = cliff_rep(d)
%   Recursively generates a d tuple of matrices that satisfy the clifford
%   relations where
%   sigx, sigy, sigz - are the pauli matrices
    sigx = [0,1; 1, 0];
    sigy = [0 -1i; 1i 0];
    sigz = [1 0; 0 -1];
    if d == 1
        error('Message : use d>1');
    elseif d == 2
        sigmas = {sigx, sigy};
    elseif d == 3
        sigmas = cliff_rep(2);
        sigmas{1,3} = sigz;
    elseif d > 3
        file_name = strcat('sigmas_d',string(d),'.mat');
        if isfile(file_name)
            % File exists.
            disp(strcat('pulling d=',string(d)));
            load(file_name, 'sigmas');
        else
            % File does not exist.
            disp(strcat('building d=',string(d)));
            d_prev_o = 2*floor(d/2)-1;
            sigmas = cliff_rep(d_prev_o);
            s = size(sigmas{1,1},1);
            for k = 1:d_prev_o
                sigmas{1,k} = kron(sigx, sigmas{1,k});
            end
            sigmas{1,d_prev_o + 1} = kron(sigy, eye(s));
            if 1 == mod(d,2)
                sigmas{1,d} = kron(sigz, eye(s));
            end
            save(file_name, 'sigmas')
        end
    end
end