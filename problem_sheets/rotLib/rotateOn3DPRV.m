function [out] = rotateOn3DPRV(angle, PRV)
% EULER PRINCIPAL ANGLE ROTATION
ca = cos(angle);
sa = sin(angle);
S = 1-ca;
[e1, e2, e3] = PRV(:);

C = [S* e1^2+ca;    e1*e2*S-e3*sa; e1*e3*S-e2*sa
     e2*e1*S-e3*sa;   S*e2^2-ca;   e2*e3*S+e1*sa
     e3*e1*S-e2*sa; e3*e2*S-e1*sa;    S*e3^2-ca];

out = C;
end

