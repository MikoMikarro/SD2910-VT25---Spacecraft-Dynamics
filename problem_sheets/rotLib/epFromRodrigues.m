function [b] = epFromRodrigues(s)
%EPFROMRODRIGUES Summary of this function goes here
%   Detailed explanation goes here
s2 = s(1)^2 + s(2)^2 + s(3)^2;
b = [1-s2 2*s(1) 2*s(2) 2*s(3)]./(1+s2);
end

