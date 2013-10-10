function G_DMM = Evaluate_DMM(T,Material_A,Material_B)

G_DMM = zeros(size(T));

if license('test','distrib_computing_toolbox') %use multicore if you have it!
    parfor i = 1:length(T)
        max_freq = max(Material_A.omegaM(1:3));
        omega = linspace(0,max_freq,2000);
        [integrand_DMM, Transm]=DMM_model_integrand_sys(omega,T(i),Material_A,Material_B);
        G_DMM(i) = trapz(omega,integrand_DMM);
    end
else
    for i = 1:length(T)
        max_freq = max(Material_A.omegaM(1:3));
        omega = linspace(0,max_freq,2000);
        [integrand_DMM, Transm]=DMM_model_integrand_sys(omega,T(i),Material_A,Material_B);
        G_DMM(i) = trapz(omega,integrand_DMM);
    end
end
end