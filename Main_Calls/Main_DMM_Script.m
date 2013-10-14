%This is the main script
clear all
close all

Load_Materials
%avaible materials include:
%  "Material_Al": aluminum
%  "Material_Cu": copper
%  "Material_Si": silicon
%  "Material_ScN": scandium nitride
%  "Material_HfN": Hafnium nitride
% to make your own materials...go into the "Load_Materials.m" file and
% follow the examples

T = logspace(0,3,20)'; %vector of temperatures (K) to evaluate G for, 
G_DMM = Evaluate_DMM(T,Material_ScN,Material_HfN); %applies DMM model using 3rd order polynomial phonon dispersion

loglog(T,G_DMM)
figure(gcf)

[T,G_DMM]