function n = n_BE(omega,T);
%n_BE calculates the Bose-Einstein Distribution for phonons with
%temperature, T (K), and frequency omega (rad/s).  Either can be a vector,
%but not both at the same time.  The function returns a vector that is the
%length of the incoming vector T or omega.

if (length(T)>1)&(length(omega)>1)
    fprintf('n_BE Error: T and omega cant both be vectors')
end
hbar =  1.05457173e-34 ;
kb = 1.3806503e-23 ;
X = hbar*omega./(kb*T);

n = 1./expm1(X); %1/(exp(X)-1)...but avoids numerical instability
%note if you evaluate for X=0...n->infinity;

end