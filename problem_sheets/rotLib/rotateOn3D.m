function [out] = rotateOn3D(angles, order)
% EULER ANGLE ROTATION
%   Detailed explanation goes here
baseMatrix = eye(3);
rotateOnZ = @(angle)[cos(angle) sin(angle)   0
                     -sin(angle) cos(angle)    0
                        0           0         1];

rotateOnY = @(angle)[cos(angle) 0 -sin(angle)
                        0       1      0
                    sin(angle) 0 cos(angle)];

rotateOnX = @(angle)[1       0            0
                     0  cos(angle) sin(angle)
                     0  -sin(angle) cos(angle)];

for i=1:length(order)
    c = order(i);
    if c == "x"
        baseMatrix = rotateOnX(angles(i)) * baseMatrix;
    elseif c == "y"
        baseMatrix = rotateOnY(angles(i)) * baseMatrix;
    elseif c == "z"
        baseMatrix = rotateOnZ(angles(i)) * baseMatrix;
    end
end

out = baseMatrix;
end

