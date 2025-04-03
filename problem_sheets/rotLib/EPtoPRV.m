function [angle, PRV] = EPtoPRV(b0, b1, b2, b3)
%EPTOPRV Summary of this function goes here
%   Detailed explanation goes here
angle = acos(b0)*2;
PRV = [b1, b2, b3] ./sin (angle/2);
end

