function [angles] = eaFromDCM(DCM, kind)
% EULER ANGLES FROM DCM
%   Detailed explanation goes here
if kind == "321"
    angle1 = atan2(DCM(1,2),DCM(1,1));
    angle2 = -asin(DCM(1,3));
    angle3 = atan2(DCM(2,3),DCM(3,3));

elseif kind == "313"
    angle1 = atan2(DCM(3,1), -DCM(3,2));
    angle2 = acos(DCM(3,3));
    angle3 = atan2(DCM(1,3), DCM(2,3));
else
    angle1 = 0;
    angle2 = 0;
    angle3 = 0;
end

angles = [angle1, angle2, angle3];

end