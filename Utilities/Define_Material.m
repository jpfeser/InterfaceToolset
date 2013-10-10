function [Material] = Define_Material(omegaM,vs,a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% omegaM(1:3) = maximum frequency of each branch
% vs(1:3) = speed of sound for each branch
% kM (which is usually 2*pi/a)
Material.omegaM = omegaM;
Material.vs = vs;
Material.a = a;
Material.kM = 2*pi/a;
end

