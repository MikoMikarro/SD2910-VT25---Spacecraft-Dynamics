function [sh] = shadowRodriguesFromRodrigues(s)
%SHADOWRODRIGUESFROMRODRIGUES Summary of this function goes here
%   Detailed explanation goes here
s2 = s(1)^2 + s(2)^2 + s(3)^2;

sh = -s./s2;
end

