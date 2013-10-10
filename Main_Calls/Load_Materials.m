%This script defines materials properties for calculating thermal interface
%conductance
%
%Definitions:
% a:  lattice constant, (m)
% omegaM: maximum frequency of phonon branch (subscript 1,2,3 refers to different
% polarizations), (rad/s)
% vs: sound velocity (i.e. at zone center) for each phonon branch, (m/s)
% The file function "Define_Material" just lumps all those properties into
% one object that is easier to pass between functions.

%------------Begin Library of Materials----------------
%ScN
a =  4.500e-10; %lattice constant
omegaM(1) = 300e2*3e8*2*pi; %maximum frequency
omegaM(2) = 190e2*3e8*2*pi; %
omegaM(3) = 190e2*3e8*2*pi; %
vs = [9197 6512 6512];
Material_ScN = Define_Material(omegaM,vs,a);

%Silicon
a =  5.430e-10;
omegaM(1) = 12.3e12*2*pi;
omegaM(2) = 4.5e12*2*pi; %cm^-1
omegaM(3) = 4.5e12*2*pi; %cm^-1
vs = [8970 5332 5332];
Material_Si = Define_Material(omegaM,vs,a);

%Al
a =  4.050e-10;
omegaM(1) = 9.7e12*2*pi;
omegaM(2) = 5.6e12*2*pi; %cm^-1
omegaM(3) = 5.6e12*2*pi; %cm^-1
vs = [6240 3040 3040];
Material_Al = Define_Material(omegaM,vs,a);

%Cu
a =  4.050e-10;
omegaM(1) = 7e12*2*pi;
omegaM(2) = 5e12*2*pi; %cm^-1
omegaM(3) = 5e12*2*pi; %cm^-1
vs = [4910 2500 2500];
Material_Cu = Define_Material(omegaM,vs,a);

%HfN
a =  4.500e-10;
omegaM(1) = 127e2*3e8*2*pi;
omegaM(2) = 117e2*3e8*2*pi; %cm^-1
omegaM(3) = 117e2*3e8*2*pi; %cm^-1
vs = [6206 3965 3965];
Material_HfN = Define_Material(omegaM,vs,a);