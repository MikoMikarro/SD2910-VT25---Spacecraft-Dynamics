clear all;
clc;
%% Inputs
MRP_endurance = [0.3353 0.1944 0.5528];
EP_Lander = [-0.5417 -0.2418 0.6654 0.4545];

%% Calculations
Endurance_N = epToDCMVec(epFromRodrigues(MRP_endurance));
Lander_N = epToDCMVec(EP_Lander);
Lander_Endurance = Lander_N * Endurance_N';
[angle, e] = epvFromDCM(Lander_Endurance);