clear all;
clc;
close all;
%% Inputs
V = [80, 60, 40]';
de1 = deg2rad(+42);
de2 = deg2rad(-49);

dx1 = deg2rad(-27);
dy1 = deg2rad(+65);

%% a
DCM_a = rotateOn3D([0, de2, de1], 'zxy'); % <- OK!
V_a = DCM_a * V;
VA = V_a - V;

%% b
DCM_b = rotateOn3D([0, dx1, dy1], 'zxy'); % <- OK!
V_b = DCM_b * V;
VB = V_b - V;

%% c
EP_c = epFromDCMSheppard(DCM_b);
[Ang_c, PRV_c] = EPtoPRV(EP_c(1), EP_c(2), EP_c(3), EP_c(4));

%% d
% Using blender, you design the shape with the sizes on the drawing.

% For a, you use the shortcut R, y, 42, <CR>. This rotates around the 
% global y axis. Then, R, x, x, -49, <CR>. This rotates around the local
% x axis. Finally, enter on edit mode, select the desired vertex of the box
% and checl the position. Remember to select global mode

% For b, similar procedure but without doing double y for using always
% global

% For c, we get the rotation vector from our code and on the rotation
% side bar we select rotation by axis angle. There, we use the x,y,z 
% coordinates and angle of the matlab code. We observe the same result

% This validated all the procedures
