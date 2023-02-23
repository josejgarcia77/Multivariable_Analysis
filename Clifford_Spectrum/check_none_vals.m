function check_none_vals(n,d,iter)
    % Generates d-tuples of hermetian matrices
    % and checks to see if the clifford spectrum is nonempty
    parfor j = 1:iter
        D = cell(1,d);
        for k = 1:d
            R = complex(rand(n,n),rand(n,n));
            D{1,k} = 1/2*(R+ctranspose(R));
        end
        L_x = spectral_loc(D);
        cs = cliff_spectrum(L_x);
        if size(cs,1) == 0
            file_name = strcat('out_',string(j),'.mat');
            parsave(file_name,D)
        end
        %if mod(counter,100) == 0
            disp(strcat('end ', string(j)));
        %end
    end
end
