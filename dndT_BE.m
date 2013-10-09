function dndT = dndT_BE(omega,T);
% dndT_BE calculates the derivative of the Bose-Einstein Distribution for phonons with
%temperature, T (K), and frequency omega (rad/s).Either can be a vector,
%but not both at the same time.  The function returns a vector that is the
%length of the incoming vector T or omega.

hbar =  1.05457173e-34 ;
kb = 1.3806503e-23 ;
X = hbar*omega./(kb*T);

n = n_BE(omega,T); %bose-einstein distribution

dndT = X./T.*n.*(1+n); 

end