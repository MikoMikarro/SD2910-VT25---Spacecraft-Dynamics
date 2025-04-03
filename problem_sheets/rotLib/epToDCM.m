function [DCM] = epToDCM(b0, b1, b2, b3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
DCM = [ [b0^2+b1^2-b2^2-b3^2 2*(b1*b2+b0*b3) 2*(b1*b3-b0*b2)]
        [2*(b1*b2-b0*b3) b0^2-b1^2+b2^2-b3^2 2*(b2*b3+b0*b1)]
        [2*(b1*b3+b0*b2) 2*(b2*b3-b0*b1) b0^2-b1^2-b2^2+b3^2]];
end