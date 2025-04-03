function [ep] = epFromDCM(DCM)
% Cuaternions from DCM
%   Detailed explanation goes here

b0 = 0.5*sqrt(DCM(1,1) + DCM(2,2) + DCM(3,3) + 1);
b1 = (DCM(2,3) - DCM(3,2))/(4*b0);
b2 = (DCM(3,1) - DCM(1,3))/(4*b0);
b3 = (DCM(1,2) - DCM(2,1))/(4*b0);

ep = [b0, b1, b2, b3];
end