function [integrand, Transm] = MTM_model_integrand(omega,T,a_1,omega_c_1_long,omega_c_1_trans,a_2,omega_c_2_long,omega_c_2_trans)
%MTM_model_integrand calculates the integrand for the maximum transmission
%model (i.e. the highest possible thermal inteface conductance)

hbar =  1.05457173e-34 ;
kb = 1.3806503e-23 ;

omega_temp = linspace(0,omega_c_1_long,2000);
[v_1_long, k_1_long, D_1_long,vD_1_long, not_exist_1_long] = get_states_BVK(omega_temp,a_1,omega_c_1_long);
[v_1_trans,k_1_trans,D_1_trans,vD_1_trans,not_exist_1_trans] = get_states_BVK(omega_temp,a_1,omega_c_1_trans);
term1 = vD_1_long + 2*vD_1_trans;
integrand_temp = hbar.*omega_temp.*term1.*n_BE(omega_temp,T);
integrand_temp(omega_temp==0)=0;
integral_1 = trapz(omega_temp,integrand_temp);
%-----------------------------

omega_temp = linspace(0,omega_c_2_long,2000);
[v_2_long, k_2_long, D_2_long,vD_2_long, not_exist_2_long] = get_states_BVK(omega_temp,a_2,omega_c_2_long);
[v_2_trans,k_2_trans,D_2_trans,vD_2_trans,not_exist_2_trans] = get_states_BVK(omega_temp,a_2,omega_c_2_trans);
term2 = vD_2_long + 2*vD_2_trans;
integrand_temp = hbar.*omega_temp.*term2.*n_BE(omega_temp,T);
integrand_temp(omega_temp==0)=0;
integral_2 = trapz(omega_temp,integrand_temp);

%------------------------------
Transm = integral_2/(integral_1+integral_2)*ones(size(omega));

integrand = 1/4*hbar.*omega.*term1.*dndT_BE(omega,T).*Transm;
integrand(omega==0)=0; %zero gives an unphysical result due to numerical instability. Fix manually.
end 