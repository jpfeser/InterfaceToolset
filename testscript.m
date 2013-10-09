%MainCall
clear all

T =300;
a_1 =  4.500e-10;
omega_c_1(1) = 450e2*3e8*2*pi;
omega_c_1(2) = 200e2*3e8*2*pi; %cm^-1

a_2 =  4.500e-10;
omega_c_2(1) = 150e2*3e8*2*pi;
omega_c_2(2) = 110e2*3e8*2*pi; %cm^-1

omega = linspace(0,omega_c_1(1),2000);
[v_1,k_1,D_1,vD_1] = get_states_BVK(omega,a_1,omega_c_1(1));
n = n_BE(omega,T);

[integrand_DMM, transm_coef_DMM] = DMM_model_integrand(omega,T,a_1,omega_c_1(1),omega_c_1(2),a_2,omega_c_2(1),omega_c_2(2));
G_tot_DMM = trapz(omega,integrand_DMM)

[integrand_MTM, transm_coef_MTM] = MTM_model_integrand(omega,T,a_1,omega_c_1(1),omega_c_1(2),a_2,omega_c_2(1),omega_c_2(2));
G_tot_MTM = trapz(omega,integrand_MTM)

    
plot(omega,integrand_DMM,omega,integrand_MTM)
figure(gcf)

% figure
% plot(omega,n)
% figure(gcf)