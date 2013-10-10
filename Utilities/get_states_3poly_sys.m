function [vg,k,D,vD,not_exist] = get_states_3poly_sys(omega,Material)

k_norm_sol = zeros(3,length(omega));
k = zeros(3,length(omega));

kM = Material.kM;

for j = 1:3
    eta = Material.vs(j)*Material.kM/Material.omegaM(j);
    
    A = eta;
    B = 3-2*eta;
    C = eta-2;
    
    omega_norm = omega/Material.omegaM(j);
    not_exist(j,:) = omega>Material.omegaM(j);
    
    for i = 1:length(omega_norm)
            if ~not_exist(j,i)
                k_norm(i) = fzero(@(x) omega_norm(i) - (eta*x+(3-2*eta)*x.^2+(eta-2)*x.^3),omega_norm(i)/eta); %range [0 1]
                k(j,i) = k_norm(i)*Material.kM;
            end
        end
    
    vg(j,:) = Material.omegaM(j)/Material.kM*(eta+2*(3-2*eta)*k_norm+3*(eta-2)*k_norm.^2);
    D(j,:) = 2*k(j,:).^2./(pi^2.*vg(j));
    
    vD(j,:) = k(j,:).^2/(2*pi^2);
end %end loop over polarizations
    %D(j,not_exist) = 0;
    %k(j,not_exist) = NaN;
    %vg(j,not_exist) = NaN;
    %vD(j,not_exist)= 0;


end %end function