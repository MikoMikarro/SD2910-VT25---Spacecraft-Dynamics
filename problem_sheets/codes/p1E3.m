clear all;
clc;
close all;
addpath("rotLib/");
%% Inputs
initial_angles = deg2rad([10 20 40]);
ang_vel = deg2rad([5 10 15]);
tot_ang_vel = norm(ang_vel);
q_ang_vel = quaternion(0, ang_vel(1), ang_vel(2), ang_vel(3));

EP_0 = quaternion(epFromDCMSheppard(rotateOn3D(initial_angles, 'zyx')));
dt = 0.01;
tF = 60;
nEls = tF/dt;
%% Calculation
t = linspace(0, tF, nEls);
EP_n = EP_0;
data = zeros([nEls, 4]);
error = zeros([nEls,1]);
for i = 1:tF/dt
    EP_n = EP_n + 0.5*EP_n*q_ang_vel*dt;
    [a, b, c, d] = parts(EP_n);
    data(i,:) = [a,b,c,d];
    error(i) = norm(EP_n)-1;
end

% figure();
% hold on;
% plot(t, data(:,1));
% plot(t, data(:,2));
% plot(t, data(:,3));
% plot(t, data(:,4));
% hold off;
% 
% figure();
% hold on;
% plot(t, error);
% hold off;

EP_n_norm = EP_n / norm(EP_n);
exact_sol = @(wV, w, t) quaternion(cos(w*t/2), (wV(1)/w)*sin(w*t/2), (wV(2)/w)*sin(w*t/2), (wV(3)/w)*sin(w*t/2));

EP_p = exact_sol(ang_vel, norm(ang_vel), 60)*EP_0;
total_error = norm(EP_p-EP_n_norm);