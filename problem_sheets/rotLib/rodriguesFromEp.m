function [s] = rodriguesFromEp(b)
% rodrigues vector from quaternion
%   Detailed explanation goes here
s = [b(1+1) b(2+1) b(3+1)]./(1+b(0+1));
end