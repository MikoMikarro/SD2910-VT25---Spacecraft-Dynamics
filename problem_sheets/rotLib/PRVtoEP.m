function [b0, b1, b2, b3] = PRVtoEP(angle , PV)
% Euler principal rotation vector to euler cuaterions
%   Detailed explanation goes here
b1 = PV(1) * sin (angle/2);
b2 = PV(2) * sin (angle/2);
b3 = PV(3) * sin (angle/2);
b0 = cos(angle/2);
end