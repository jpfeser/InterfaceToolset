%testscript 2
clear all

Load_Materials

T = logspace(0,3,20);
G_DMM = Evaluate_DMM(T,Material_Al,Material_Si)

loglog(T,G_DMM)

