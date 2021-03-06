function [v,k,D,vD,not_exist] = get_states_BVK(omega,a,omega_c)

v = omega_c*a/4*sqrt(1-(omega/omega_c).^2);
k = 4/a*asin(omega/omega_c);
D = 2*k.^2./(pi^2*omega_c*a*sqrt(1-(omega/omega_c).^2));

vD = k.^2/(2*pi^2);

not_exist = omega>omega_c;
D(not_exist) = 0;
k(not_exist) = NaN;
v(not_exist) = NaN;
vD(not_exist)= 0;