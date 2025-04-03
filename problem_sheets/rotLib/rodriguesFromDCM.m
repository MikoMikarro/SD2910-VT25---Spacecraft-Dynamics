function [s] = rodriguesFromDCM(DCM)
%RODRIGUESFROMDCM Summary of this function goes here
%   Detailed explanation goes here
d = sqrt(trace(DCM) + 1);

s = [DCM(2,3)-DCM(3,2) DCM(3,1)-DCM(1,3) DCM(1,2)-DCM(2,1)]./(d*(d+2));
end

