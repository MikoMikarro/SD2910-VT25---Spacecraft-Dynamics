function [angle, PV] = epvFromDCM(DCM)
% EULER PRINCIPAL VECTOR FROM DCM
%   Detailed explanation goes here
c_angle = 0.5*(DCM(1,1) + DCM(2,2) + DCM(3,3) - 1);
angle = acos(c_angle);

PV = [DCM(2,3)-DCM(3,2); DCM(3,1)-DCM(1,3); DCM(1,2)-DCM(2,1)]';
PV = PV / (2 * sin(angle));

end