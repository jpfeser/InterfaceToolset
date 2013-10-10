function [vg,k,D,vD,not_exist] = get_states_3poly(omega,a,omegaM,vs)

k_norm_sol = zeros(size(omega));
k = zeros(size(omega));

kM = 2*pi/a;
eta = vs*kM/omegaM;

A = eta;
B = 3-2*eta;
C = eta-2;

omega_norm = omega/omegaM
for i = 1:length(omega_norm)
    k_norm(i) = fzero(@(x) omega_norm(i) - (eta*x+(3-2*eta)*x.^2+(eta-2)*x.^3),[0 1]);
    k(i) = k_norm*kM;
end

vg = omegaM/kM*(eta+2*(3-2*eta)*k_norm+3*(eta-2)*k_norm.^2);
D = 2*k.^2./(pi^2.*vg);

vD = k.^2/(2*pi^2);

not_exist = omega>omegaM;
D(not_exist) = 0;
k(not_exist) = NaN;
v(not_exist) = NaN;
vD(not_exist)= 0;