function [integrand, Transm] = DMM_model_integrand_sys(omega,T,Material_A,Material_B)
%Material_A and Material_B are objects with following variables
% omegaM(1:3) = maximum frequency of each branch
% vs(1:3) = speed of sound for each branch
% kM (which is usually 2*pi/a)
% function which grabs the states as a function of omega:
%   vg(1:3,length(omega))
%   k(1:3,length(omega))
%   DOS(1:3,length(omega))
%   vD(1:3,length(omega))
% usually [vg,k,D,vD,not_exist] = get_states_3poly(omega)

[vg_A,k_A,D_A,vD_A,not_exist_A] = get_states_3poly_sys(omega,Material_A);
[vg_B,k_B,D_B,vD_B,not_exist_B] = get_states_3poly_sys(omega,Material_B);


hbar =  1.05457173e-34 ;
kb = 1.3806503e-23 ;

%trans coeff

term_A = zeros(1,length(omega));
term_B  = zeros(1,length(omega));
for p = 1:3
    term_A = vD_A(p,:) + term_A;
    term_B = vD_B(p,:) + term_B;
end

Transm = term_B./(term_A + term_B); %<--- Transmission coef. for DMM

integrand = 1/4*hbar.*omega.*term_A.*dndT_BE(omega,T).*Transm;
integrand(omega==0)=0; %zero gives an unphysical result due to numerical instability. Fix manually.
end
