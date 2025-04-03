function [ep] = epFromDCMSheppard(DCM)
% Cuaternions from DCM
%   Detailed explanation goes here

tc = trace(DCM);

b02 = 0.25*(1+tc);
b12 = 0.25*(1+2*DCM(1,1)-tc);
b22 = 0.25*(1+2*DCM(2,2)-tc);
b32 = 0.25*(1+2*DCM(3,3)-tc);

maxb = max([b02, b12, b22, b32]);

if maxb == b02
    b0 = sqrt(b02);
    b1 = (DCM(2,3) - DCM(3,2))/(4*b0);
    b2 = (DCM(3,1) - DCM(1,3))/(4*b0);
    b3 = (DCM(1,2) - DCM(2,1))/(4*b0);
elseif maxb == b12
    b1 = sqrt(b12);
    b0 = (DCM(2,3) - DCM(3,2))/(4*b1);
    b2 = (DCM(1,2) + DCM(2,1))/(4*b1);
    b3 = (DCM(3,1) + DCM(1,3))/(4*b1);
elseif maxb == b22
    b2 = sqrt(b22);
    b0 = (DCM(3,1) - DCM(1,3))/(4*b2);
    b1 = (DCM(1,2) + DCM(2,1))/(4*b2);
    b3 = (DCM(2,3) + DCM(3,2))/(4*b2);
elseif maxb == b32
    b3 = sqrt(b32);
    b0 = (DCM(1,2) - DCM(2,1))/(4*b3);
    b1 = (DCM(3,1) + DCM(1,3))/(4*b3);
    b2 = (DCM(2,3) + DCM(3,2))/(4*b3);
end

ep = [b0, b1, b2, b3];
end