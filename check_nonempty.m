function truth_value = check_nonempty(n,d)
    % Generates d-tuples of hermetian matrices
    % and checks to see if the clifford spectrum is nonempty
    D = cell(1,d);
    for k = 1:d
        R = rand(n,n);
        D{1,k} = 1/2*(R+ctranspose(R));
    end
    L_x = spectral_loc(D);
    cs = cliff_spectrum(L_x);
    if size(cs,1)>0
        truth_value = true;
    else
        truth_value = false;
    end
end