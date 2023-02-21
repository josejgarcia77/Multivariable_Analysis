function cliff_spectrum = cliff_spectrum(spectral_localizer)
    %   cliff_spectrum computes the clifford spectrum given a
    %   spectral_localizer as an input
    cliff_spectrum = eig(spectral_localizer);
end